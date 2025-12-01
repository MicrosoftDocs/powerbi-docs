import os
from pathlib import Path

# List of single-use INCLUDE files that have been inlined
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

deleted_count = 0
failed_count = 0

for include_file in single_use_includes:
    full_path = includes_dir / include_file
    try:
        if full_path.exists():
            full_path.unlink()
            deleted_count += 1
            print(f"Deleted: {include_file}")
        else:
            print(f"Not found: {include_file}")
            failed_count += 1
    except Exception as e:
        print(f"Error deleting {include_file}: {e}")
        failed_count += 1

print(f"\n=== Summary ===")
print(f"Successfully deleted: {deleted_count} files")
print(f"Failed/Not found: {failed_count} files")
