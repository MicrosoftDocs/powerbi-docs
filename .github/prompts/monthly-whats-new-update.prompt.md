# Monthly What's New Update

Update the Power BI Desktop what's-new documentation for a new monthly release.

## Workflow

### Step 0: Collect required information

Before starting, ask the writer for the following. Do not proceed until all items are provided or the writer explicitly confirms they aren't available yet (in which case, use placeholders and flag them in the final output):

1. **Live blog URL** — the published Power BI feature summary blog post, for example:
   `https://powerbi.microsoft.com/blog/power-bi-april-2026-feature-summary/`
2. **YouTube demo URL** — the monthly demo video, for example:
   `https://youtu.be/xxxxxxxxx`
3. **Previous month's Desktop version number** — the version string for the release being archived, for example:
   `2.152.1234.0`
   This appears in the previous month's blog post under the release heading. It's used to complete the archive section heading, for example: `## March 2026 update (version 2.152.1234.0)`. Ask the writer to check the prior month's blog post if they don't have it on hand.

If the writer provides all three, use them directly. If any are missing, insert `TBD` placeholders and add them to the final action items output.

### Step 1: Archive Previous Month's Content

1. Open `powerbi-docs/fundamentals/whats-new.md`
2. Identify the current month's content (typically lines 17-75, between the intro and "More videos" section)
3. Move this content to `powerbi-docs/fundamentals/desktop-latest-update-archive.md`
4. Insert at line 23 (after the archive intro, before the previous archived month)
5. **Adjust all heading levels down one level** when moving to archive:
   - `## Heading` → `### Heading`
   - `### Subheading` → `#### Subheading`
6. **Hardcode the download link** for the newly archived month. The download link in `whats-new.md` uses a generic ID (`https://www.microsoft.com/download/details.aspx?id=58494`). Replace it with the versioned direct download URL using the pattern:
   ```
   https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup-YYYY-MM_x64.exe
   ```
   For example, March 2026 becomes:
   ```
   https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup-2026-03_x64.exe
   ```
7. **Remove the oldest download link.** Only 6 months of hardcoded download links are maintained at any time. After adding the new entry, find the oldest `> **Download** the [...]` line in the archive and delete it entirely. Note: count only months that have a download link — some months have no Desktop release and no download line.

### Step 2: Populate New Month's Content

1. Fetch content from the provided blog post URL
2. Extract feature summaries organized by category:
   - **General** (deprecations, announcements)
   - **Copilot and AI**
   - **Reporting**
   - **Modeling**
   - **Visualizations**
   - **Data connectivity**
   - **Other**
3. Format as a markdown table with columns: Feature | Description | Learn more
4. Include links to blog sections and video timestamps where available
5. Update the "last updated" date in the YAML frontmatter

#### Writing guidelines for feature descriptions

The what's-new page is a technical reference, not a marketing document. When writing table descriptions:

- **State facts only.** Describe what the feature does, not how exciting or powerful it is. Cut superlatives ("incredible", "major upgrade", "must-have"), hype phrases ("game-changer", "seamlessly"), and filler ("and more").
- **Be brief.** One to three sentences per feature. The reader can follow the linked documentation or blog post for full details. Don't repeat information that belongs in the feature's own doc.
- **Use plain imperative or declarative sentences.** "X now supports Y" or "Use X to do Y" — not "We're excited to announce that X now supports Y".
- **No first-person plural.** Avoid "we", "our team", "we've improved". Write from the product's perspective, not the team's.
- **Avoid marketing qualifiers.** Don't use adjectives like "rich", "powerful", "modern", "intuitive", "smarter", or "improved" unless they name a specific UI element.
- **Drop filler phrases.** Remove "making it easier to", "helping you", "enabling you to", "giving you the ability to" — just state what it does.

**Example — blog language vs. doc language:**

| Blog (don't use) | Doc (use instead) |
|---|---|
| "a major upgrade that lets you have a full, back-and-forth chat" | "now supports full conversational chat" |
| "making it even faster to get hands-free answers" | "voice dictation is available for hands-free input" |
| "giving you more flexibility in how your report responds" | "use Edit interactions to control which visuals the card filters" |

### Step 3: Fix Links

Convert all `/power-bi/` absolute links to relative paths:
- Same folder (fundamentals): `desktop-format-pane.md`
- Other folders: `../create-reports/file.md`
- Keep `/fabric/` and `/azure/` links as absolute paths
- Keep `?context=` parameters as-is (they're for breadcrumb navigation)

### Step 4: Validate

1. Check for any broken links.
2. Ensure heading hierarchy is correct.
3. Verify date formats are consistent.

### Step 5: Output action items

After all edits are complete, output a single consolidated **Action items** block for the writer. Include all of the following in one place:

**a) Missing doc links** — List every feature row in `whats-new.md` whose description has no "For more information, see [...]" link to a Power BI or related doc. AppSource/marketplace visuals are exempt.

**b) Doc gaps** — List any feature from the blog that likely requires an update to an existing doc file in this repo (not just `whats-new.md`), based on what was found in the workspace. Include the specific file and what appears to be missing.

**c) Unconfirmed information** — If the blog URL, YouTube demo URL, or previous month's version number was not provided, flag them here.

**d) Reminders** — Include this note: "Remember to use content tools like Acrolinx and Content Mentor before publishing."

Format the output as a checklist, for example:

```
## Action items before publishing

### Missing doc links
- [ ] Deprecation of old file picker experience — add a link to the relevant doc
- [ ] Scatter charts: Auto-fit markers — no dedicated doc found; link to scatter chart doc or create new section

### Doc gaps
- [ ] visuals/power-bi-visualization-scatter.md — Auto-fit markers not documented
- [ ] visuals/power-bi-visualization-column-charts.md — Rounded range option not documented
- [ ] visuals/power-bi-visualization-smart-narrative.md — Copilot mode default and 10,000-char limit not documented

### Unconfirmed information
- [ ] YouTube demo URL not provided — update placeholder https://youtu.be/TBD before publishing
- [ ] Previous month's version number not provided — update archive heading "## March 2026 update" to include version, e.g. "## March 2026 update (version 2.152.1234.0)"

### Reminders
- [ ] Remember to use content tools like Acrolinx and Content Mentor before publishing.
```

## Link Conversion Reference

| Absolute Path | Relative Path |
|---------------|---------------|
| `/power-bi/fundamentals/file` | `file.md` |
| `/power-bi/create-reports/file` | `../create-reports/file.md` |
| `/power-bi/transform-model/file` | `../transform-model/file.md` |
| `/power-bi/connect-data/file` | `../connect-data/file.md` |
| `/power-bi/paginated-reports/file` | `../paginated-reports/file.md` |
| `/power-bi/visuals/file` | `../visuals/file.md` |
| `/power-bi/explore-reports/file` | `../explore-reports/file.md` |

## One Source of Truth Principle

When making updates based on Copilot suggestions or blog content:
- Only update the **authoritative documentation** for each feature
- Add cross-references from related docs rather than duplicating content
- Avoid adding redundant information that's already documented elsewhere

## Input Required

Provide the blog content using ONE of these methods:

1. **Published blog URL** (preferred if live):
   ```
   https://powerbi.microsoft.com/blog/power-bi-april-2026-feature-summary/
   ```

2. **Copy-paste from draft** (for pre-publication docx):
   - Open the Word doc
   - Copy all feature content (General, Copilot, Reporting, Modeling, etc.)
   - Paste directly into chat

3. **Attach a markdown/text export** if available

Example prompt usage:
```
Update whats-new.md for April 2026. Here's the blog content:

[paste content here]
```
