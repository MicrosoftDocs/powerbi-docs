import os
import re
from pathlib import Path

# List of single-use INCLUDE files
single_use_includes = [
    "blank-rows-border-border-position.md",
    "cell-elements-background-color-toggle.md",
    "cell-elements-data-bars-toggle.md",
    "cell-elements-font-color-toggle.md",
    "cell-elements-icons-toggle.md",
    "cell-elements-series.md",
    "cell-elements-web-url.md",
    "column-headers-header-alignment.md",
    "column-headers-title-alignment.md",
    "column-subtotals-apply-settings-to-column-level.md",
    "column-subtotals-apply-settings-to-per-column-level.md",
    "global-value-decimal-places.md",
    "grid-border-border-position.md",
    "grid-border-selection.md",
    "grid-options-global-font-size.md",
    "grid-options-row-padding.md",
    "image-size-height.md",
    "image-size-width.md",
    "layout-and-style-presets-layout.md",
    "layout-and-style-presets-repeat-row-headers.md",
    "layout-and-style-presets-style.md",
    "prerequisites-desktop-download-latest-version-pbi.md",
    "prerequisites-desktop-download-retail-analysis-sample-pbix.md",
    "prerequisites-desktop-preview-features-on-object-unselected.md",
    "prerequisites-service-open-retail-analysis-sample-pbix.md",
    "row-headers-icons-size.md",
    "row-headers-text-banded-row-color.md",
    "row-subtotals-apply-settings-to-per-row-level.md",
    "row-subtotals-apply-settings-to-row-level.md",
    "row-subtotals-rows-position.md",
    "specific-column-apply-settings-to-series.md",
    "specific-column-apply-to-header.md",
    "specific-column-apply-to-subtotals.md",
    "specific-column-apply-to-total.md",
    "specific-column-apply-to-values.md",
    "specific-column-yaxis-values-display-units.md",
    "url-icon-column-headers.md",
    "url-icon-row-headers.md",
    "url-icon-values.md",
    "values-options-show-values-in-row-groups.md",
    "values-values-alternate-background-color.md",
    "values-values-alternate-text-color.md",
    "values-values-text-wrap.md"
]

base_dir = Path(r'c:\repos\powerbi-docs-pr\powerbi-docs')
includes_dir = base_dir / 'includes' / 'core-visuals'

# Store file content and references
replacements = []

for include_file in single_use_includes:
    include_path = includes_dir / include_file
    
    # Read the INCLUDE file content
    if not include_path.exists():
        print(f"Warning: {include_file} not found")
        continue
    
    with open(include_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract body content (skip YAML front matter)
    # YAML front matter is between --- markers
    if content.startswith('---'):
        parts = content.split('---', 2)
        if len(parts) >= 3:
            body_content = parts[2].strip()
        else:
            body_content = content.strip()
    else:
        body_content = content.strip()
    
    # Find where this INCLUDE is referenced
    pattern = r'\[!INCLUDE\s*\[.*?\]\(.*?' + re.escape(include_file) + r'\)\]'
    
    for md_file in base_dir.glob('**/*.md'):
        if md_file == include_path:
            continue
        
        try:
            with open(md_file, 'r', encoding='utf-8') as f:
                md_content = f.read()
            
            matches = list(re.finditer(pattern, md_content, re.IGNORECASE))
            if matches:
                for match in matches:
                    replacements.append({
                        'file': str(md_file.relative_to(base_dir)),
                        'include_file': include_file,
                        'old_text': match.group(0),
                        'new_text': body_content,
                        'full_path': str(md_file)
                    })
                    print(f"Found: {include_file} in {md_file.relative_to(base_dir)}")
        except Exception as e:
            pass

print(f"\n=== Summary ===")
print(f"Total replacements to make: {len(replacements)}")

# Save replacements data for the actual replacement script
import json
with open('replacements_data.json', 'w', encoding='utf-8') as f:
    json.dump(replacements, f, indent=2)

print(f"Replacements data saved to replacements_data.json")
