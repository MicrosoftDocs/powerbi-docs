---
title: Troubleshoot visualizations in Power BI
description: Troubleshoot visualizations in Power BI, including common problems and workarounds to overcome known obstacles or potential problems.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 10/10/2024
ms.custom: TSG - Troubleshooting Guide
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to be aware of the various considerations, limitations, and workarounds to overcome known obstacles or potential problems with Power BI visualizations, so that I can effectively and easily identify solutions in both Power BI Desktop and the Power BI service.
---
# Troubleshoot visualizations in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The article describes considerations and limitations for Power BI visualizations, and how to troubleshoot common problems with content distribution. It addresses both potential and known problems, while offering solutions to help ensure consistency and optimal performance in report design and user experience.  

## Slicers and filters

This section addresses potential problems that users might encounter with slicers and filters.

### Clear button

Users might have difficulty finding the **Clear** button for the original slicer visuals. The **Clear** button, indicated by an eraser icon, is located in the **Slicer** header and becomes visible only when the user hovers over it. Some report authors might choose to disable the **Slicer** header and enable the **Visual container** header, which is disabled by default for these visuals.

To ensure access to the **Clear** button, restore the **Slicer** header's visibility. For the **Slicer (new)** visuals, we moved the **Clear** button into the **Visual container** header and removed the concept of a separate **Slicer** header. For these **Slicer (new)** visuals, if the report author disables the **Visual container** header, the **Clear** button isn't available.

We recommend that report authors select the **Clear** icon and then select **Save** in that state before publishing, especially for range slicers. For other slicer types, you might intentionally save a default selection so that report consumers start with a specific set of filters. But keep in mind that **Date Range** slicers typically work best when they start in a cleared state. Use care to ensure that slicers are cleared, or intentionally set, when you're creating bookmarks.

### Persistent filters

Power BI reports have a setting that allows user slicer and filter choices to be saved automatically and reapplied when the users return to view a report later on. This setting, enabled by default, can lead to different experiences for different users. When reports also use bookmarks, this setting can potentially lead to unexpected results.

If you want all report consumers to start from the same filter state, you can disable **Persistent filters** on the report. This setting ensures that user modifications to filters aren't saved. It maintains the report's original filter configuration as published by the author. Users can always reset to the authored state by selecting the **Reset to default** button.

To disable **Persistent filters** in Power BI Desktop:

1. On the **File** menu, select **Options and settings**, and then select **Options**.

1. In the **Options** dialog, go to the **Current file** section, select **Report settings** to display the **Persistent filters** section, and then select the **Don't allow end user to save filters on this report** checkbox.

To disable **Persistent filters** in the Power BI service:

1. On the **File** menu, select **Settings** to display the **Report settings** pane.

1. Turn on the **Persistent filters** toggle to enable the **Don't allow end user to save filters on this report** option.

### Selection

The term [Select all](power-bi-visualization-slicers.md#selection-controls) can be misleading. **Select all** doesn't actually select every item. Instead, it operates on an *inverted selection* principle: any item that you clear becomes part of the query. This approach is more efficient because it avoids sending thousands of values in the query. By sending only the cleared values in a negated filter, you streamline the process and reduce the query load.

When you're using the slicer to filter reports, the values in **Selected Values** might persist as selected even when they're no longer applicable. This behavior can potentially lead to confusion and a misleading restatement of selected items.

The slicer saves the selected values. Those values can remain visible and selected in subsequent views of the report. However, if the underlying data or user permissions change, these selections might no longer be relevant or appropriate.

Report authors should avoid saving and publishing reports with selected items that might be inappropriate for certain users, particularly in environments that use row-level security (RLS). We recommend that authors clear any selections that shouldn't be universally applied before saving and distributing reports.

### What if

The [What if](../transform-model/desktop-what-if.md#considerations-and-limitations) parameters in Power BI can handle up to 1,000 unique values. If a parameter exceeds this limit, the values are evenly sampled. This kind of sampling might not meet the needs of detailed scenario analysis. The limit is in place to help ensure performance and manageability within Power BI.

When you need more than 1,000 unique values, the parameter values are sampled to fit within this constraint. This situation potentially leads to a loss of granularity. To work around this limitation, you can adjust the granularity of your **What if** parameters to ensure that the total number of unique values doesn't exceed 1,000.

## Report locale

This section addresses potential problems that users might encounter with dates in visuals.

### Format strings

Certain visual elements in Power BI don't use the model format string for dates, to conserve space and present only the necessary detail. This behavior can lead to confusion when the displayed date format doesn't match the user's expectations.

For these elements, Power BI uses the browser's locale settings to determine the date format. The format might vary depending on the user's browser configuration, which influences how dates are displayed in the report.

To ensure consistency, report creators should be aware of the browser locale's impact on date formatting. Common areas affected include [slicers](../create-reports/desktop-slicer-numeric-range.md#display-formatting-with-the-date-range-slicer), [Cartesian axis tick labels](../visuals/power-bi-visualization-customize-x-axis-and-y-axis.md#considerations-and-limitations), and some sections of the **Filter** pane.

### <a name = "display-units-suffix"></a> Display unit suffix

Power BI dynamically alters the display unit suffix to match the regional or system settings of the user's environment. This automatic adaptation helps ensure consistency with local conventions, but it could lead to confusion when users share reports across different geographies or systems.

Currently, there's no direct feature within Power BI to lock the display unit suffix irrespective of location or system settings. However, you can manually adjust the format settings of the visuals to specify a consistent display unit. You need to make this adjustment individually for each visual component that displays values.

For custom format strings to display, you must not have a display unit set in the visual's format settings. You might need to select **Reset to default** to clear any display unit override.

## Fonts

This section addresses potential problems that users might encounter with fonts in Power BI.

### Default fonts

macOS users might encounter font rendering problems with [Microsoft-owned fonts](../fundamentals/power-bi-browsers.md#fonts), because these fonts aren't included by default on macOS systems. Due to the absence of certain Microsoft fonts, macOS defaults to alternative fonts. This fallback can result in discrepancies in text rendering, particularly in terms of font size and layout consistency.

To address this problem, users can manually install the missing Microsoft fonts on their macOS devices. This action helps ensure that reports and documents have the intended appearance. Alternatively, report creators can opt for fonts that are commonly available across both Windows and macOS platforms to avoid such problems.

### Custom fonts

When you're incorporating a custom font into Power BI reports, it's essential to specify the font correctly in the custom theme file. You must reference the font by its correct operating system (OS) name, which might differ from its display name. Using the display name can cause the font to not be recognized or applied in the report.

To ensure that the custom theme file uses the correct font name, go to the **Fonts** section in the Windows Control Panel feature. Here, you can verify the exact OS name of the font. After you verify the name, use it in your custom theme file to successfully apply the custom font to your Power BI report.

The font that a Power BI report uses must be installed on the local machine of each user. The reason is that fonts aren't embedded within the report itself. If a font isn't installed locally, it isn't displayed correctly when a user views the report. This situation can lead to inconsistencies in the report's appearance and can affect the overall user experience.

To help ensure uniformity in font usage across all users, we recommend that you use an IT group policy for the centralized distribution of fonts within your organization. This policy facilitates the installation of the required fonts on all relevant machines, to maintain the intended design and readability of the report.

Also, custom fonts might not be available or might not render correctly when the execution of an export command causes rendering on the server. Examples include exporting to PDF, exporting to PowerPoint, or exporting to images when you're using email subscriptions.

## Colors

This section addresses potential problems that users might encounter with report colors.

### Series color assignment

In Power BI, the assignment of [theme colors](../create-reports/desktop-report-themes.md#dynamic-series) to series can vary, depending on whether the series is static or dynamic. This variability can lead to inconsistencies in color representation across report views.

For static series, Power BI assigns theme colors based on the index order of the series. However, for dynamic series, colors are allocated on a first-come, first-served basis. As a result, the colors that you choose for a series could change, depending on one of these factors:

- The sequence in which report pages are viewed, when filters are applied in a different order
- The user, if the environment uses RLS

To maintain color consistency for dynamic series, we recommend that you explicitly define the color for each series within the report's formatting settings. This action ensures that each series retains its designated color, regardless of the viewing order or applied filters.

## Themes

This section addresses potential problems that users might encounter when working with custom themes.

### Default settings

When you're setting visual-specific format options in Power BI, this action can override any of the predefined properties in a custom theme. Explicit formatting at the visual level takes precedence over theme-level settings. As a result, any custom theme settings don't apply if existing format options are set for a particular visual.

For example, to allow [custom theme colors](../create-reports/desktop-report-themes.md#situations-when-report-theme-colors-wont-stick-to-your-reports) to take effect, you need to reset the visual colors to default formatting. You can reset the colors by selecting **Reset to default** within the color formatting options of the visual. After you clear the specific formatting, the custom theme colors should apply as intended, if an explicit color isn't set for that visual.

As another example, when you specify **Legend Position = Left** in a custom theme file, but specify something else at the visual level, you should always use **Reset to default** to allow the custom theme to apply.

## Maps

This section addresses potential problems that users might encounter when working with map visuals.

### Bing Maps

Bing Maps for Power BI is being deprecated and should no longer be used for geographical data representation in Power BI. As part of the transition to more advanced and business-focused services, we recommend Azure Maps as the alternative to Bing Maps for Power BI. Azure Maps provides a rich set of geographical data services and features that are continually updated.

You can convert your Bing Maps visuals to Azure Maps by selecting each visual and then selecting the Azure Maps icon on the **Visualization** pane. We try to preserve your formatting settings during conversion. Alternatively, you might notice the pop-up dialog when opening the report in Power BI Desktop, with an option to convert all your Bing Maps visuals to Azure Maps.

For a comprehensive understanding of Azure Maps, including how to get started, what data is sent to Azure, and the service's limitations, see [Get started with Azure Maps Power BI visual](/azure/azure-maps/power-bi-visual-get-started).

### Geocoding

To ensure [geocoding](/azure/azure-maps/power-bi-visual-geocode) accuracy in Power BI:

- Make sure that your model has pristine data for each distinct location entity.
- Avoid concatenating strings.
- Assign the correct data category to each location entity, like **State** or **Zipcode**.
- Build a location hierarchy within your model, or place multiple fields in the location field well.

Use the **Expand All Down** icon to drill into the lowest hierarchy level, which includes all higher levels. This action helps resolve ambiguities in locations that have the same names, such as distinguishing *Paris, Texas* from *Paris, France*. Adding **Country** to your location hierarchy, along with using the **Drill Down** or **Expand All** function, improves your geocoding outcomes.

## Tooltips

This section addresses potential problems that users might experience with tooltips.

### Page tooltips

Report-page [tooltips](../create-reports/desktop-tooltips.md#considerations-and-limitations) aren't displayed for dashboard visual tiles or report-page dashboard tiles.

By design, dashboards in Power BI don't currently support report-page tooltips. Dashboard tiles take minimal snapshots of pinned content, and they don't have a reference to the report page that's designed as a tooltip.

We recommend that you design dashboards without relying on report-page tooltips, to help ensure that necessary information is clearly presented.

### Line chart tooltips

Users might notice that line chart tooltips are displayed differently from other charts. By default, Power BI shows all series values and a vertical alignment bar to help users compare all series values within a specific category.

In some cases, the standard datapoint tooltip renders, such as for combo charts and when line charts enter high-density sampling after hitting data limits. Different filters could push the query slightly higher or lower than the limits, resulting in different tooltips at different times for the same line chart visual.

For more information, see [High-density line sampling in Power BI](../create-reports/desktop-high-density-sampling.md#tooltips-and-high-density-line-sampling).

## Images

This section addresses potential problems that users might encounter with including images in their visualizations.

### Image URLs

If an image within a Power BI report isn't rendering, the [image URL](../create-reports/power-bi-images-tables.md#considerations) might not be anonymously accessible. Power BI requires the image URL to be anonymously accessible without requiring a sign-in to view. Images can't be hosted on sites that require authentication, such as SharePoint or OneDrive.

To ensure that the image URL is publicly accessible, open the image URL in an InPrivate-mode browser window. If the image loads without requiring a sign-in, you correctly configured the image URL for use in Power BI. Loading images from a local path is also not supported in Power BI Desktop or in the Power BI service.

Likewise, Power BI mobile apps display only if the image URL is anonymously accessible. Again, the image can't be hosted on a site that requires a sign-in, such as SharePoint or OneDrive, even if you can see the image in Power BI Desktop or in the Power BI service.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Add visuals to a Power BI report (part 1)](power-bi-report-add-visualizations-i.md)
- [Add visuals to a Power BI report (part 2)](power-bi-report-add-visualizations-ii.md)
- [Get started formatting report visualizations](service-getting-started-with-color-formatting-and-axis-properties.md)
