#!/usr/bin/env python3
"""
Build a batch of stale files from an XLSX export, but skip rows that have
already been refreshed in the repo since the export snapshot.

Selection rules (in this order):
  1) If we can map a row to a repo path:
      a) If ms.date(file) and LastReviewed(export) both exist and
         ms.date(file) > LastReviewed(export)  → SKIP (updated since snapshot)
      b) Else if ms.date(file) is within FRESH_WINDOW_DAYS of today → SKIP
      c) Else → INCLUDE
  2) Keep scanning rows (sorted by PageViews DESC) until we hit --limit.
  3) Always write detailed CSVs:
      - <output>.summary.csv     (selected)
      - <output>.skipped.csv     (skipped w/ reason)
"""

import argparse, sys, re, pathlib, os, datetime
import pandas as pd

try:
    from dateutil import parser as dateparser
except Exception:
    dateparser = None

# --- helpers -----------------------------------------------------------------

def find_col(df, *names):
    cols = {c.lower(): c for c in df.columns}
    for n in names:
        if n and n.lower() in cols:
            return cols[n.lower()]
    return None

def parse_any_date(val):
    """Parse a date from many spreadsheet forms (Timestamp, string, Excel float)."""
    if val is None or (isinstance(val, float) and pd.isna(val)):
        return None
    # pandas Timestamp or datetime
    if hasattr(val, "to_pydatetime"):
        try:
            return val.to_pydatetime().date()
        except Exception:
            pass
    if isinstance(val, (datetime.date, datetime.datetime)):
        return val.date() if isinstance(val, datetime.datetime) else val
    # Excel numeric date (rare, but handle if present)
    if isinstance(val, (int, float)) and not isinstance(val, bool):
        try:
            # Excel's epoch (assumes 1900 system); pandas helps here too
            dt = pd.to_datetime(val, unit="D", origin="1899-12-30", errors="coerce")
            if pd.notna(dt):
                return dt.date()
        except Exception:
            pass
    # String dates
    s = str(val).strip()
    if not s:
        return None
    # ISO first
    try:
        return datetime.date.fromisoformat(s)
    except Exception:
        pass
    if dateparser:
        try:
            return dateparser.parse(s, fuzzy=True).date()
        except Exception:
            return None
    return None

def url_to_repo_path(url, docroot):
    """Map live URL to repo-relative path under docroot."""
    if not isinstance(url, str) or "learn.microsoft.com" not in url:
        return None
    m = re.search(r"/power-bi/(.+)$", url)
    if not m:
        return None
    rel = m.group(1).rstrip("/")
    return f"{docroot}/{rel}.md" if not rel.endswith(".md") else f"{docroot}/{rel}"

def parse_ms_date_from_file(path: pathlib.Path):
    """Extract ms.date from YAML front matter; return datetime.date or None."""
    if not path.exists():
        return None
    text = path.read_text(encoding="utf-8", errors="ignore")
    # front matter block
    if text.startswith("---"):
        parts = text.split("---", 2)
        if len(parts) >= 3:
            fm = parts[1]
            # ms.date: YYYY-MM-DD
            m = re.search(r"\bms\.date:\s*([0-9]{4}-[0-9]{2}-[0-9]{2})\b", fm)
            if m:
                try:
                    return datetime.date.fromisoformat(m.group(1))
                except Exception:
                    pass
    # fallback: scan entire file
    m = re.search(r"^ms\.date:\s*([0-9]{4}-[0-9]{2}-[0-9]{2})\b", text, re.M)
    if m:
        try:
            return datetime.date.fromisoformat(m.group(1))
        except Exception:
            return None
    return None

def is_stale_bucket(v: str) -> bool:
    if v is None:
        return False
    s = str(v).strip().lower()
    return s.startswith("> 365") or s.startswith("271-365")

def is_fresh_by_window(msd: datetime.date, window_days: int) -> bool:
    if not isinstance(msd, datetime.date):
        return False
    cutoff = datetime.date.today() - datetime.timedelta(days=window_days)
    return msd >= cutoff

# --- main --------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--input", required=True, help="XLSX export with Url, Title, PageViews, LastReviewed, Freshness")
    ap.add_argument("--output", required=True, help="Path list to write (one path per line)")
    ap.add_argument("--docroot", default="powerbi-docs")
    ap.add_argument("--limit", type=int, default=50)
    ap.add_argument("--fresh-window-days", type=int, default=int(os.environ.get("FRESH_WINDOW_DAYS", "365")))
    args = ap.parse_args()

    src = pathlib.Path(args.input)
    if not src.exists():
        print(f"Input not found: {src}", file=sys.stderr)
        sys.exit(0)

    # Load XLSX
    try:
        df = pd.read_excel(src, engine="openpyxl")
    except Exception as e:
        print(f"Failed to read Excel: {e}", file=sys.stderr)
        sys.exit(2)

    # Columns (case-insensitive)
    col_url   = find_col(df, "Url", "URL")
    col_title = find_col(df, "Title")
    col_views = find_col(df, "PageViews", "Views")
    col_lr    = find_col(df, "LastReviewed", "Last Reviewed", "Last_Reviewed")
    col_fresh = find_col(df, "Freshness", "FreshnessFlag", "Freshness State")
    if not col_url or not col_views:
        sys.exit("Required columns missing: Url and/or PageViews")

    # Normalize views and sort
    df[col_views] = pd.to_numeric(df[col_views].astype(str).str.replace(",", ""), errors="coerce").fillna(0)
    df = df.sort_values(by=col_views, ascending=False)

    # Keep only rows the export considers stale (if present), but keep scanning all rows
    if col_fresh:
        df = df[df[col_fresh].apply(is_stale_bucket)]

    # Iterate and build selection until we reach limit
    selected, summary_rows, skipped_rows = [], [], []
    window = args.fresh_window_days
    cutoff = (datetime.date.today() - datetime.timedelta(days=window)).isoformat()

    for _, r in df.iterrows():
        if len(selected) >= args.limit:
            break

        url = r.get(col_url, "")
        path_rel = url_to_repo_path(url, args.docroot)
        if not path_rel:
            skipped_rows.append({"Reason": "no-path", "Url": url, "Title": r.get(col_title, "")})
            continue

        p = pathlib.Path(path_rel)
        msd_file = parse_ms_date_from_file(p)
        lr_export = parse_any_date(r.get(col_lr)) if col_lr else None

        # (1) Early-skip if file was updated since the export snapshot
        #     (i.e., file ms.date newer than LastReviewed in the export)
        if msd_file and lr_export and msd_file > lr_export:
            skipped_rows.append({
                "Reason": "updated-since-export",
                "Path": path_rel,
                "Title": r.get(col_title, ""),
                "PageViews": r[col_views],
                "Freshness (report)": r.get(col_fresh, ""),
                "LastReviewed (export)": lr_export.isoformat(),
                "LastReviewed (file)": msd_file.isoformat()
            })
            continue

        # (2) Skip if fresh today by hard window
        if is_fresh_by_window(msd_file, window):
            skipped_rows.append({
                "Reason": "fresh-at-runtime",
                "Path": path_rel,
                "Title": r.get(col_title, ""),
                "PageViews": r[col_views],
                "Freshness (report)": r.get(col_fresh, ""),
                "LastReviewed (export)": lr_export.isoformat() if lr_export else "",
                "LastReviewed (file)": msd_file.isoformat() if msd_file else "",
                "Cutoff": cutoff
            })
            continue

        # (3) Include
        selected.append(path_rel)
        summary_rows.append({
            "Path": path_rel,
            "Title": r.get(col_title, ""),
            "PageViews": r[col_views],
            "Freshness (report)": r.get(col_fresh, ""),
            "LastReviewed (export)": lr_export.isoformat() if lr_export else "",
            "LastReviewed (file)": msd_file.isoformat() if msd_file else "",
            "Cutoff": cutoff
        })

    # Write outputs
    out_list = pathlib.Path(args.output)
    out_list.parent.mkdir(parents=True, exist_ok=True)
    out_list.write_text("\n".join(selected), encoding="utf-8")

    pd.DataFrame(summary_rows).to_csv(str(out_list.with_suffix(".summary.csv")), index=False)
    if skipped_rows:
        pd.DataFrame(skipped_rows).to_csv(str(out_list.with_suffix(".skipped.csv")), index=False)

    print(f"Selected {len(selected)} files (limit={args.limit}). Skipped {len(skipped_rows)}.")
    if len(selected) < args.limit:
        print("Note: fewer than the batch limit were eligible after early-skip and runtime freshness checks.")

if __name__ == "__main__":
    main()
