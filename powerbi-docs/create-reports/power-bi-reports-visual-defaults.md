---
title: Visual defaults in Power BI reports
description: Learn about base themes in Power BI, including the Fluent 2 preview, Classic 2026, and Classic 2018, and how they define the default look of your report visuals.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: concept-article
ms.date: 03/09/2026
LocalizationGroup: Create reports
---
# Visual defaults in Power BI reports

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Every Power BI report has a *base theme* that defines the default colors, fonts, and styles for all visuals. The base theme provides the foundation for your report's appearance. When you apply a [custom theme](desktop-report-themes.md), it layers on top of the base theme, overriding specific styles while inheriting the rest.

Power BI offers multiple base themes to choose from:

| Base theme | Description |
|------------|-------------|
| **Fluent 2 (preview)** | Modern styling aligned with Microsoft Fluent 2 design system |
| **Classic 2026** | Current default base theme for new reports |
| **Classic 2018** | Original base theme for legacy compatibility |

## Fluent 2 (preview)

The Fluent 2 base theme introduces a modern look aligned with the Microsoft Fluent 2 design system. This update helps you produce polished reports without manual formatting for each visual.

<iframe title="Modern Visual Defaults Preview" width="800" height="486" src="https://msit.powerbi.com/view?r=eyJrIjoiYWUzNGY5ZDEtZThkYi00ZDhjLTk1ZjItYzUxMDVhMDljNTg3IiwidCI6IjcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0NyIsImMiOjV9" frameborder="0" allowFullScreen="true"></iframe>

### Enable the preview

To enable the Fluent 2 base theme:

1. In Power BI Desktop, go to **File** > **Options and Settings** > **Options**.
1. Select **Preview features**.
1. Select **Modern visual defaults and customize theme improvements**.
1. Select **OK** and restart Power BI Desktop.

> [!NOTE]
> During preview, the Fluent 2 base theme can only be enabled in Power BI Desktop. To use Fluent 2 styling in the Power BI service, create or update the report in Desktop first.

### Canvas and background

The Fluent 2 base theme updates the default canvas:

- **Canvas size**: New pages default to 1920x1080, giving you more space. The initial page in a report retains the previous default of 1280x720.
- **Background colors**: The wallpaper and background are now shades of grey, providing better contrast and making visuals stand out more clearly.

> [!NOTE]
> Existing reports and existing pages don't update their page size when you switch to the new base theme. Only new pages use the new default canvas size.

### Uniform visual styling

All visuals share consistent structural styling:

- **Fonts**: Uniform font style, colors, and sizes across visuals
- **Titles**: Titles and subtitles are on by default; axis titles are off by default
- **Padding and borders**: Increased padding with rounded corners applied across visuals

These styles use structural colors throughout the theme. When you customize the current theme through **View** > **Themes** > **Customize current theme**, your changes flow to all visuals.

### Style presets by visual type

Many visuals include built-in style presets so you can quickly shift to a different look with a single selection.

#### Charts

Chart visuals offer presets that adjust axis and label visibility:

- **Default**: Shows the axis without labels
- **Data labels**: Turns off the axis in favor of data labels and markers—useful for small multiples

#### Line charts

Line charts use smooth lines by default and include additional presets:

- Straight lines with data labels
- Straight lines without data labels

#### Tables and matrix

Table and matrix visuals keep their existing style presets, updated to match the new modern styling.

#### Buttons and navigators

Buttons and navigators use Fluent 2 styling by default, with your first theme data color as the button color and styling configured for different states (default, hover, pressed).

Button style presets include:

- **Default**: Standard button appearance
- **Outline**: Border only, no fill
- **Transparent**: No border or fill
- **Icon & Text**: Icon displayed alongside button text

Navigator style presets include:

- **Default**: Standard button appearance
- **Tab**: Tab-style navigation

#### Cards

The card visual has reduced padding and no reference label background, creating a cleaner presentation for key metrics.

#### Slicers

Slicers have significant styling updates:

- **Default**: Dropdown mode with modern styling
- **List**: List view mode
- **Tile**: Tile view mode

Each preset adjusts both the visual style and slicer mode in one selection.

> [!NOTE]
> During preview, the classic slicer might initially appear as a list with dropdown styling. Reset the slicer to default to switch it to dropdown mode.

#### Small multiples

Small multiples consolidate to the categorical axis. Instead of a 2x2 arrangement, small multiples begin in a 1x4 or 4x1 layout depending on orientation, providing a more logical default view.

## Classic 2026

Classic 2026 is the current default base theme for new reports created in Power BI Desktop. It includes incremental improvements over Classic 2018 while maintaining compatibility with existing reports.

## Classic 2018

Classic 2018 is the original base theme from Power BI's earlier releases. Reports created before 2026 use this base theme. You might choose to keep this base theme for:

- Legacy reports where changing the visual style isn't desired
- Consistency with existing reports in your organization

## Update to the latest base theme

New reports created after enabling the preview automatically use the latest base theme (Fluent 2).

For existing reports, you can update to the latest base theme:

1. Go to **View** > **Themes** > **Customize current theme**.
1. If an update is available, a banner appears at the top of the dialog.
1. Select **Update theme** to apply the latest base theme.
1. Select **Apply**.

You can also select the **Default** tile (the first theme in the Power BI section of the Themes dropdown) to remove any custom theme and apply the latest base theme to your report.

> [!TIP]
> If your custom theme doesn't work with the new modern defaults, you can undo the update to revert to the previous base theme until you've had a chance to update your custom theme.

## Reset formatting

When you format a visual directly using the formatting pane, your customizations take precedence over the base theme or custom theme. To return to theme defaults:

### Reset individual sections

You can reset individual sections in the formatting pane to their default values. This targeted approach avoids resetting data-bound formatting or actions configured on the visual.

### Reset entire visual

To reset all formatting on a visual, select **Reset to default** in the visual's formatting pane. This returns the visual to the current theme's default styling.

> [!NOTE]
> **Reset to default** also removes actions on buttons and images, conditional formatting rules, images from URLs or data-bound fields, and other data-bound items like reference labels.

## Considerations and limitations

- During preview, the Fluent 2 base theme can only be enabled in Power BI Desktop. To use Fluent 2 styling in the Power BI service, create or update the report in Desktop first.
- The **Customize current theme** option and other lower options in the **Themes** dropdown aren't available in the Power BI service.

## Related content

- [Use report themes in Power BI](desktop-report-themes.md)
- [Create custom report themes](report-themes-create-custom.md)
- [Organizational themes](desktop-organizational-themes.md)
