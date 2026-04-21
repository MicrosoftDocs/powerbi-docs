# Freshness review

Conduct a freshness review of the specified documentation file(s). A freshness review ensures that published content is technically accurate, up to date, and aligned with current product behavior and documentation standards.

## Freshness cycles

Before flagging an article as stale, check for an `ms.update-cycle` value in the article's metadata or the folder-level `docfx.json`. The default freshness cycle is 365 days. Valid values:

| Cycle | ms.update-cycle value |
|---|---|
| 30 days | `30-days` |
| 90 days | `90-days` |
| 180 days | `180-days` |
| 365 days (default) | `365-days` |
| 3 years | `1095-days` |
| 5 years | `1825-days` |
| 10 years | `3650-days` |

If `ms.update-cycle` is set to a longer cycle, the article might not actually be stale even if `ms.date` is more than 365 days old. Evaluate against the article's configured cycle, not the default.

AI- and Copilot-related content has a higher freshness bar of **180 days**, reflecting the fast rate of product changes. If the article covers AI or Copilot topics, use 180 days as the freshness target.

## Pass type

Choose the appropriate pass type based on the content:

- **Light pass:** For primarily stable content that doesn't require major yearly updates (for example, release notes, mature legacy content). Covers sensitive info, links, spelling/grammar, customer feedback, GitHub issues, and `ms.topic` validation.
- **Full pass:** For content tied to products in active development with frequent UI and feature updates. Covers everything in a light pass plus full technical accuracy review, screenshot verification, code sample validation, and open PR checks.

If you aren't sure which pass type applies, default to a **full pass**.

## Review process

Read the entire article and evaluate it against each of the following categories. Items marked **(light + full)** apply to both pass types. Items marked **(full only)** can be skipped during a light pass.

### 0. Sensitive information (light + full)

- Check for exposed sensitive data such as subscription IDs, tenant IDs, connection strings, passwords, or tokens in article text, code samples, and screenshots.
- Flag any findings immediately — this is a security risk to Microsoft.

### 1. Technical accuracy (full only)

- Verify that procedures, steps, and instructions reflect the current product UI and behavior.
- Flag any references to features that have been renamed, deprecated, moved, or removed.
- Identify missing coverage of new features or functionality that are relevant to the article's scope.
- Check that code samples, API calls, or query examples are still valid and follow current security practices.

### 2. Screenshots and media (full only)

- Flag any screenshots or images that might show outdated UI (look for references to old navigation, deprecated buttons, or renamed menu items).
- Note if alt text is missing or inaccurate for any images.

### 3. Links (light + full)

- Check that all relative links point to files that exist in this repo.
- Flag any absolute links to learn.microsoft.com that include `/en-us/` in the path (these should be locale-neutral).
- Identify any broken or suspicious external links.

### 4. Metadata (light + full)

- Confirm `ms.date` is present and note its current value. Do not update it yet — the writer updates this after completing the review.
- Confirm `ms.author` and `author` are present and valid.
- Check whether `ai-usage` should be added based on the scope of any proposed changes (see copilot-instructions.md for thresholds).
- Check the `ms.topic` value for accuracy (for example, `concept`, `how-to`, `overview`, `reference`, `tutorial`). Flag if the value doesn't match the article type.
- If present, note the `ms.update-cycle` value and confirm it's appropriate for the content.

### 5. Writing style and formatting (light: spelling/grammar only; full: complete review)

Follow the [Microsoft Writing Style Guide](https://learn.microsoft.com/style-guide/welcome/) and the repo's copilot-instructions.md. Specifically check for:

- Active voice, second person, present tense, imperative mood for instructions.
- **Bold** for UI elements, `code style` for file names, types, and non-localizable text.
- Sentence case headings (no gerunds in titles).
- Ordered list items all numbered as `1.` (not sequential).
- Oxford comma usage.
- No consecutive headings without content between them.
- No use of "we"/"our" referring to documentation authors.
- "Might" instead of "may" for possibility.

### 6. SEO and discoverability (light + full)

- Check that the H1 and `title` in metadata are clear, descriptive, and match.
- Verify the `description` metadata is a concise, accurate summary (under 160 characters is ideal).

### 7. Customer feedback and GitHub issues (light + full)

- If available, note any customer verbatim comments or GitHub issues that suggest inaccurate or outdated content.
- For a **light pass**, flag these for SME follow-up rather than addressing them directly.
- For a **full pass**, address them as part of the review.

## Auto-fix vs. manual review

During the review, **apply standard fixes directly to the file** when the correct change is unambiguous and doesn't require product knowledge or judgment. Examples of auto-fixes:

- Changing sequential ordered list numbering (`2.`, `3.`) to all `1.`.
- Replacing "may" with "might" for possibility.
- Removing `/en-us/` from learn.microsoft.com links.
- Fixing Oxford comma omissions.
- Replacing "we"/"our" (referring to doc authors) with second-person or imperative phrasing.
- Correcting sentence case in headings.
- Adding missing **bold** to UI element names already identified in instructions.
- Fixing minor spelling or grammar errors.

Do **not** auto-fix anything that requires:

- Product or SME verification (for example, confirming whether a feature is still in preview or has gone GA).
- Judgment about content accuracy, scope, or completeness.
- Replacing or updating screenshots.
- Changing the meaning or intent of a sentence.

Do **not** update `ms.date` — the writer does this after completing the review.

## Output format

Start the report by stating:
- The **pass type** used (light or full).
- The article's **freshness cycle** (`ms.update-cycle` value if set, otherwise "default 365 days").
- Whether the article is **within cycle** or **past due** based on `ms.date` and the applicable cycle.

Then organize the output into two sections:

### Changes applied

List the auto-fixes that were made directly to the file. For each, state:
1. What was changed.
1. Where in the article (heading or line reference).

### Items requiring writer review

List findings that need human judgment, SME verification, or manual action. For each, include:
1. The severity level (**Fix**, **Improve**, or **Note**).
1. The specific location in the article.
1. What the issue is.
1. A suggested action.

After both sections, provide a brief overall summary and your assessment of the article's current state.

If the article appears fully up to date with no issues, say so.

## After the review

After outputting the findings, always end with these reminders for the writer:

> **Postreview checklist — manual steps:**
>
> 1. **Review the file diff** to verify all auto-fixes before committing. Revert anything that doesn't look right.
> 1. Open each reviewed file in the Content Mentor extension and run the following checks:
>    - **Content** (uses Learn Authoring assistant)
>    - **SEO**
>    - **SFI**
>    - **Customer Feedback**
>    - **Link validation**
>    - **Auto fix Markdown**
> 1. After all fixes are applied, use the **date** (calendar icon) button in Content Mentor's **Quick Actions** to update `ms.date`.
