#!/usr/bin/env python3
import argparse, sys, re, pathlib, os, datetime
import pandas as pd
try:
    from dateutil import parser as dateparser
except Exception:
    dateparser = None
try:
    import yaml
except Exception:
    yaml = None

def find(df, *names):
    cols = {c.lower(): c for c in df.columns}
    for n in names:
        if n and n.lower() in cols: return cols[n.lower()]
    return None

def url_to_repo_path(url, docroot):
    if not isinstance(url, str) or "learn.microsoft.com" not in url: return None
    m = re.search(r"/power-bi/(.+)$", url)
    if not m: return None
    rel = m.group(1).rstrip("/")
    return f"{docroot}/{rel}.md" if not rel.endswith(".md") else f"{docroot}/{rel}"

def _parse_date_str(s: str):
    s = s.strip()
    try:
        return datetime.date.fromisoformat(s)
    except Exception:
        pass
    if dateparser:
        try:
            return dateparser.parse(s).date()
        except Exception:
            return None
    return None

def parse_ms_date_from_file(path: pathlib.Path):
    if not path.exists(): return None
    text = path.read_text(encoding="utf-8", errors="ignore")
    if text.startswith("---"):
        try:
            fm = text.split("---",2)[1]
            if yaml:
                data = yaml.safe_load(fm) or {}
                raw = data.get("ms.date")
                if raw: 
                    d = _parse_date_str(str(raw))
                    if d: return d
        except Exception:
            pass
        m = re.search(r"\bms\.date:\s*([0-9]{4}-[0-9]{2}-[0-9]{2})\b", fm)
        if m:
            try: return datetime.date.fromisoformat(m.group(1))
            except Exception: return None
    m = re.search(r"^ms\.date:\s*([0-9]{4}-[0-9]{2}-[0-9]{2})\b", text, re.M)
    if m:
        try: return datetime.date.fromisoformat(m.group(1))
        except Exception: return None
    return None

def is_stale_bucket(v: str) -> bool:
    if v is None: return False
    s = str(v).strip().lower()
    return s.startswith("> 365") or s.startswith("271-365")

def is_fresh_by_msdate(msdate: datetime.date, fresh_window_days: int) -> bool:
    if not isinstance(msdate, datetime.date): return False
    today = datetime.date.today()
    cutoff = today - datetime.timedelta(days=fresh_window_days)
    return msdate >= cutoff

def process_customer_feedback(feedback_file, docroot):
    """Process customer feedback Excel file and return actionable feedback by file."""
    if not feedback_file or not os.path.exists(feedback_file):
        print("No customer feedback file found, skipping feedback processing")
        return {}
    
    try:
        # Auto-detect Excel format
        if feedback_file.endswith('.xls'):
            feedback_df = pd.read_excel(feedback_file, engine="xlrd")
        else:
            feedback_df = pd.read_excel(feedback_file, engine="openpyxl")
        
        feedback_map = {}
        
        # Look for common column names (case insensitive)
        cols = {col.lower(): col for col in feedback_df.columns}
        
        # Try to find relevant columns
        file_col = None
        verbatim_col = None
        rating_col = None
        
        for col in cols:
            if any(x in col for x in ['file', 'path', 'url', 'page']):
                file_col = cols[col]
            elif 'verbatim' in col or 'comment' in col or 'feedback' in col:
                verbatim_col = cols[col]
            elif any(x in col for x in ['rating', 'score', 'helpful', 'satisfaction']):
                rating_col = cols[col]
        
        if not file_col or not verbatim_col:
            print("Could not find required columns in feedback file")
            return {}
        
        print(f"Processing customer feedback from {len(feedback_df)} entries...")
        
        for _, row in feedback_df.iterrows():
            file_path = str(row[file_col]) if pd.notna(row[file_col]) else ""
            verbatim = str(row[verbatim_col]) if pd.notna(row[verbatim_col]) else ""
            rating = row[rating_col] if rating_col and pd.notna(row[rating_col]) else None
            
            # Skip if no meaningful feedback
            if not verbatim or len(verbatim.strip()) < 10:
                continue
            
            # Look for negative feedback (low rating or negative keywords)
            is_negative = False
            if rating is not None:
                try:
                    rating_num = float(rating)
                    is_negative = rating_num <= 2  # Assuming 1-5 scale
                except:
                    pass
            
            # Check for negative keywords in verbatim
            negative_keywords = ['wrong', 'incorrect', 'outdated', 'error', 'broken', 'doesn\'t work', 
                               'not working', 'missing', 'unclear', 'confusing', 'bad', 'poor']
            
            verbatim_lower = verbatim.lower()
            if any(keyword in verbatim_lower for keyword in negative_keywords):
                is_negative = True
            
            if not is_negative:
                continue
            
            # Try to extract file path from URL or direct path
            if 'http' in file_path:
                # Extract from URL
                parts = file_path.split('/')
                for i, part in enumerate(parts):
                    if part == docroot and i + 1 < len(parts):
                        relative_path = '/'.join(parts[i:])
                        break
                else:
                    continue
            else:
                relative_path = file_path
            
            # Normalize path
            if relative_path.startswith('/'):
                relative_path = relative_path[1:]
            
            # Store actionable feedback
            if relative_path not in feedback_map:
                feedback_map[relative_path] = []
            
            feedback_map[relative_path].append({
                'verbatim': verbatim,
                'rating': rating,
                'is_actionable': is_actionable_feedback(verbatim)
            })
        
        print(f"Found feedback for {len(feedback_map)} files")
        return feedback_map
        
    except Exception as e:
        print(f"Error processing customer feedback: {e}")
        return {}

def is_actionable_feedback(verbatim):
    """Determine if feedback is actionable without SME input."""
    import re
    verbatim_lower = verbatim.lower()
    
    # Actionable indicators
    actionable_patterns = [
        'link.*broken', 'link.*not.*work', 'dead link', 'link.*error',
        'typo', 'spelling', 'grammar',
        'image.*missing', 'screenshot.*outdated', 'picture.*wrong',
        'code.*doesn.*work', 'example.*broken', 'sample.*error',
        'date.*wrong', 'version.*old', 'updated.*need'
    ]
    
    # Non-actionable (requires SME)
    non_actionable_patterns = [
        'need.*more.*detail', 'should.*explain', 'missing.*information',
        'want.*example', 'how.*do', 'why.*not', 'feature.*request'
    ]
    
    for pattern in non_actionable_patterns:
        if re.search(pattern, verbatim_lower):
            return False
    
    for pattern in actionable_patterns:
        if re.search(pattern, verbatim_lower):
            return True
    
    return False

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--input", required=True)
    ap.add_argument("--output", required=True)
    ap.add_argument("--docroot", default="powerbi-docs")
    ap.add_argument("--batch-size", type=int, default=10)
    ap.add_argument("--fresh-window-days", type=int, default=int(os.environ.get("FRESH_WINDOW_DAYS","365")))
    ap.add_argument("--feedback", help="Customer feedback Excel file to process")
    a = ap.parse_args()

    src = pathlib.Path(a.input)
    if not src.exists():
        print(f"Input not found: {src}", file=sys.stderr); sys.exit(0)
    # Auto-detect Excel format based on file extension
    if src.suffix.lower() == '.xls':
        df = pd.read_excel(src, engine="xlrd")
    else:
        df = pd.read_excel(src, engine="openpyxl")

    col_url   = find(df, "Url")
    col_views = find(df, "PageViews","Views")
    col_fresh = find(df, "Freshness","FreshnessFlag","Freshness State")
    col_title = find(df, "Title")
    col_lr    = find(df, "LastReviewed")
    if not col_views: sys.exit("PageViews column not found")

    df[col_views] = pd.to_numeric(df[col_views].astype(str).str.replace(",",""), errors="coerce").fillna(0)
    if col_fresh: df = df[df[col_fresh].apply(is_stale_bucket)]
    df = df.sort_values(by=col_views, ascending=False)

    selected, summary, skipped = [], [], []
    for _, r in df.iterrows():
        path = url_to_repo_path(r[col_url], a.docroot) if col_url else None
        if not path:
            skipped.append({"Reason":"no-path","Url": r.get(col_url,""),"Title": r.get(col_title,"")})
            continue
        p = pathlib.Path(path)
        msd = parse_ms_date_from_file(p)
        if is_fresh_by_msdate(msd, a.fresh_window_days):
            skipped.append({"Reason":"fresh-at-runtime","Path": path,"Title": r.get(col_title,""),
                            "PageViews": r[col_views],"Freshness (report)": r.get(col_fresh,""),
                            "LastReviewed (file)": msd.isoformat() if msd else ""})
            continue
        selected.append(path)
        summary.append({"Path": path,"Title": r.get(col_title,""),"PageViews": r[col_views],
                        "Freshness (report)": r.get(col_fresh,""),"LastReviewed (report)": r.get(col_lr,""),
                        "LastReviewed (file)": msd.isoformat() if msd else ""})

    # Process customer feedback
    feedback_map = {}
    if a.feedback:
        feedback_map = process_customer_feedback(a.feedback, a.docroot)

    # Group files by subfolder for batching
    from collections import defaultdict
    folders = defaultdict(list)
    for i, path in enumerate(selected):
        # Extract subfolder (e.g., "developer", "create-reports")
        parts = path.split("/")
        if len(parts) > 1:
            subfolder = parts[1]  # Skip "powerbi-docs/"
        else:
            subfolder = "root"
        folders[subfolder].append((i, path))

    # Create batches within each subfolder
    batch_num = 1
    all_batches = []
    for subfolder, files in folders.items():
        # Sort by page views (descending) within subfolder
        files_with_views = [(i, path, summary[i]["PageViews"]) for i, path in files]
        files_with_views.sort(key=lambda x: x[2], reverse=True)
        
        # Create batches of batch_size within this subfolder
        for i in range(0, len(files_with_views), a.batch_size):
            batch_files = [path for _, path, _ in files_with_views[i:i+a.batch_size]]
            batch_summary = [summary[idx] for idx, _, _ in files_with_views[i:i+a.batch_size]]
            all_batches.append({
                "batch_num": batch_num,
                "subfolder": subfolder,
                "files": batch_files,
                "summary": batch_summary
            })
            batch_num += 1

    # Write output files
    out = pathlib.Path(a.output); out.parent.mkdir(parents=True, exist_ok=True)
    
    # Write all selected files
    out.write_text("\n".join(selected), encoding="utf-8")
    
    # Write summary
    pd.DataFrame(summary).to_csv(str(out.with_suffix(".summary.csv")), index=False)
    
    # Write batch information
    batch_info = []
    for batch in all_batches:
        for file_path in batch["files"]:
            batch_info.append({
                "BatchNum": batch["batch_num"],
                "Subfolder": batch["subfolder"],
                "FilePath": file_path
            })
    pd.DataFrame(batch_info).to_csv(str(out.with_suffix(".batches.csv")), index=False)
    
    if skipped:
        pd.DataFrame(skipped).to_csv(str(out.with_suffix(".skipped.csv")), index=False)
    
    # Write customer feedback data
    if feedback_map:
        feedback_data = []
        for file_path, feedbacks in feedback_map.items():
            for fb in feedbacks:
                if fb['is_actionable']:  # Only include actionable feedback
                    feedback_data.append({
                        "FilePath": file_path,
                        "Verbatim": fb['verbatim'],
                        "Rating": fb['rating'],
                        "IsActionable": fb['is_actionable']
                    })
        if feedback_data:
            pd.DataFrame(feedback_data).to_csv(str(out.with_suffix(".feedback.csv")), index=False)
            print(f"Found {len(feedback_data)} actionable customer feedback items.")
    
    print(f"Selected {len(selected)} files in {len(all_batches)} batches. Skipped {len(skipped)}.")
    print(f"Batches by subfolder:")
    for subfolder, files in folders.items():
        batch_count = (len(files) + a.batch_size - 1) // a.batch_size  # Ceiling division
        print(f"  {subfolder}: {len(files)} files -> {batch_count} batches")
if __name__ == "__main__":
    main()