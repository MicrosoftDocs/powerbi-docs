---
title: Troubleshoot visualizations in Power BI
description: Troubleshoot visualizations in Power BI, including common issues and workarounds to overcome known obstacles or potential problems.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidi
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 09/18/2024
ms.custom: TSG - Troubleshooting Guide
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to be aware of the various considerations, limitations, workarounds to overcome known obstacles or potential issues with Power BI Visualizations, so I can effectively and easily identify solutions in both Power BI Desktop and Power BI service.
---
# Troubleshoot visualizations in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The document provides considerations and limitations for Power BI visualizations, and how to troubleshoot common content distribution issues. It addresses potential issues, and known issues, while offering solutions to ensure consistency and optimal performance in report design and user experience.  

## Slicers and filters

This section addresses potential issues users might encounter with slicers and filters.

### Clear button

Users might experience difficulty locating the **Clear** button for the original slicer visuals. The **Clear** button, indicated by an eraser icon, is located in the **Slicer Header** and only becomes visible upon mouse hover. Some report authors might choose to disable the **Slicer Header** and enable the **Visual Container Title** which is disabled by default for these visuals. To ensure access to the **Clear** button, *restore* the **Slicer Header** visibility. For the **New Slicer visuals**, we moved the **Clear** button into the **Visual Container Header** and removed the concept of a separate Slicer Header. For these **New Slicers**, if the report author disabled the **Visual Container Header**, the **Clear** button won't available.

We recommended report authors *select* the **Clear** icon and **Save** in that state before publishing, especially for range slicers. For other slicer types, you might intentionally save a default selection so that report consumers start with a specific set of filters, but Date Range slicers typically work best when starting cleared. Use care to ensure slicers are cleared, or intentionally set, when creating Bookmarks.

### Persistent filters

Power BI Reports have a setting that allows end-user slicer and filter choices to be saved automatically and reapplied when they return to view a report later on. This setting, enabled by default, can lead to different experiences for different users. When reports also utilize Bookmarks, it can potentially lead to unexpected results. If you prefer that all report consumers start from the exact same filter state, you can disable Persistent Filters on the report. In **Power BI Desktop**, open the **Options** dialog from the **File** menu, and select **Report settings** in the **Current File** section. In the **Power BI service**, open **Settings** from the **File** menu to display the **Report Settings** panel, then *toggle* the **Persistent Filters** option to enable the **Don't allow end user to save filters on this report** option. This setting ensures that user modifications to filters aren't saved, maintaining the report’s original filter configuration as published by the author. Users can always reset to the authored state by clicking the **Reset to default** button in the top right area.

### Selection

The term [**Select all**](power-bi-visualization-slicers.md#selection-controls) can be misleading in its operation. Contrary to what the term suggests, [**Select all**](power-bi-visualization-slicers.md#selection-controls) doesn't actually *select* every item. Instead, it operates on an inverted selection principle, meaning that any item you deselect becomes part of the query. This approach is more efficient as it avoids sending thousands of values in the query. By only sending the deselected values in a negated filter, we streamline the process and reduce the query load.

When using the **Slicer** to filter reports, the **Selected Values** may persist as selected even when they're no longer applicable, potentially leading to confusion and a misleading restatement of selected items. The **Slicer** saves the selected values, which can remain visible and selected in subsequent views of the report. However, if the underlying data or user permissions change, these selections may no longer be relevant or appropriate. Report authors should avoid saving and publishing reports with selected items that might be inappropriate for certain users, particularly in environments where Row-Level Security (RLS) is implemented. It's advisable to clear any selections that shouldn't be universally applied before saving and distributing the report.

### What if

The [**What if**](../transform-model/desktop-what-if.md#considerations-and-limitations) parameters in Power BI are designed to handle up to 1,000 unique values. If a parameter exceeds this limit, the values are evenly sampled, which may not meet the needs of detailed scenario analysis. This limitation is in place to ensure performance and manageability within Power BI. When more than 1,000 unique values are needed, the parameter values are sampled to fit within this constraint, potentially leading to a loss of granularity. To work around this limitation, you can adjust the granularity of your [**What If**](../transform-model/desktop-what-if.md#considerations-and-limitations) parameters to ensure that the total number of unique values doesn't exceed 1000.

## Report locale

This section addresses potential issues users may encounter with dates in visuals.

### Format strings

In Power BI, certain visual elements don't utilize the model format string for dates to conserve space and present only the necessary detail. This can lead to confusion when the displayed date format doesn't match the user’s expectations. For these elements, Power BI uses the browser’s locale settings to determine the date format. This means that the format may vary depending on the user’s browser configuration, which influences how dates are displayed in the report. To ensure consistency, report creators should be aware of the browser locale’s impact on date formatting. Common areas affected by this include [**Slicers**](../create-reports/desktop-slicer-numeric-range.md#display-formatting-with-the-date-range-slicer), and [**Cartesian Axis Tick Labels**](../visuals/power-bi-visualization-customize-x-axis-and-y-axis.md#considerations-and-limitations), and some sections of the **Filter Pane**.

## Fonts

This section addresses potential issues users may encounter with fonts in Power BI.

### Default fonts

macOS users may encounter font rendering issues with [Microsoft-owned fonts](../fundamentals/power-bi-browsers.md#fonts), as these fonts aren't included by default on macOS systems. Due to the absence of certain [Microsoft fonts](../fundamentals/power-bi-browsers.md#fonts), macOS defaults to alternative fonts. This fallback can result in discrepancies in text rendering, particularly in terms of font size and layout consistency. To address this, users can manually install the missing [Microsoft fonts](../fundamentals/power-bi-browsers.md#fonts) on their macOS devices. This ensures that reports and documents render with the intended appearance. Alternatively, report creators can opt for fonts that are commonly available across both Windows and macOS platforms to avoid such issues.

### Custom fonts

When incorporating a custom font into Power BI reports, it’s essential to specify the font correctly in the Custom Theme file. You must reference the font by its correct operating system (OS) name, which may differ from its display name. Using the display name can result in the font not being recognized or applied in the report. To ensure the correct font name is used, navigate to the Fonts section in the Windows Control Panel. Here, you can verify the exact OS name of the font. Once confirmed, use this name in your Custom Theme file to successfully apply the custom font to your Power BI report.

The font used in a Power BI report must be installed on the local machine of each end user. This is because fonts aren't embedded within the report itself. If a font isn't installed locally, it isn't displayed correctly when an end user views the report. This can lead to inconsistencies in the report’s appearance and can affect the overall user experience. To ensure uniformity in font usage across all end users, we  recommend using an IT Group Policy for the centralized distribution of fonts within your company. This policy facilitates the installation of the required fonts on all relevant machines, thus maintaining the intended design and readability of the report.

Also note that Custom Fonts may not be available when an Export command is executed that causes rendering on the server, such Export to PDF or Image generation with Copy, PowerPoint, or email Subscriptions.

## Colors

This section addresses potential issues users may encounter with report colors.

### Series color assignment

In Power BI, the assignment of [theme colors](../create-reports/desktop-report-themes.md#dynamic-series) to series can vary depending on whether the series is static or dynamic. This can lead to inconsistencies in color representation across different report views. For static series, Power BI assigns theme colors based on the index order of the series. However, for dynamic series, colors are allocated on a first-come, first-served basis. As a result, the colors that are chosen for a series may change depending on the sequence in which report pages are viewed, when filters are applied in a different order, or depending on the user if Row-Level Security (RLS) is employed. To maintain color consistency for dynamic series, we recommend you explicitly define the color for each series within the report’s formatting settings. This ensures that each series retains its designated color regardless of the viewing order or applied filters.

## Themes

This section addresses potential issues users may encounter when working with custom themes.

### Default settings

When setting visual-specific format options in Power BI, this can override any of the predefined properties in a custom theme. This occurs because explicit formatting at the visual level takes precedence over theme-level settings. As a result, any custom theme settings don't apply if existing format options have been set for a particular visual.

For example, to allow [custom theme colors](../create-reports/desktop-report-themes.md#situations-when-report-theme-colors-wont-stick-to-your-reports) to take effect, you need to reset the visual colors to default formatting. This can be done by clicking ‘Reset to Default’ within the color formatting options of the visual. Once the specific formatting is cleared, the [custom theme colors](../create-reports/desktop-report-themes.md#situations-when-report-theme-colors-wont-stick-to-your-reports) should apply as intended, if an explicit color isn't set for that visual.

As another example, when you specify “Legend Position = Left” in a custom theme file, but specify something else at the visual level, you should always ‘Reset to Default’ to allow the custom theme to apply.

## Maps

This section addresses potential issues users may encounter when working with map visuals.

### Bing maps

Bing Maps for Power BI is being deprecated and should no longer be used for geographical data representation in Power BI. As part of the transition to more advanced and business focused services, [Azure Maps](/azure/azure-maps/power-bi-visual-get-started) is recommended as the alternative to Bing Maps for Power BI. [Azure Maps](/azure/azure-maps/power-bi-visual-get-started) provides a rich set of geographical data services and features that are continually updated. To adapt to this change, users should start utilizing [Azure Maps](/azure/azure-maps/power-bi-visual-get-started) for their mapping needs in Power BI. You can convert your Bing Map visuals to Azure Maps by selecting them and clicking the Azure Map icon in the Visualization Pane. We attempt to preserve your formatting settings during conversion. Alternatively, you might notice the popup when opening the report in Desktop, with an option to convert all your Bing Maps to Azure Maps. For a comprehensive understanding of [Azure Maps](/azure/azure-maps/power-bi-visual-get-started), including how to get started, what data is sent to Azure, and its limitations, refer to the detailed documentation provided by Microsoft.

### Geocoding

To ensure [geocoding](/azure/azure-maps/power-bi-visual-geocode) accuracy in Power BI, make sure your model has pristine data for each distinct location entity and avoid concatenating strings. Assign the correct Data Category to each location entity, like *State* or *Zipcode*. Build a Location hierarchy within your model or place  multiple fields in the location field well for precise [geocoding](/azure/azure-maps/power-bi-visual-geocode). Use the **Expand All Down** icon to drill into the lowest hierarchy level, which includes all higher levels. This helps resolve ambiguities in locations with the same names, such as distinguishing *Paris, Texas* from *Paris, France*. Adding *Country* into your Location hierarchy, and using the **Drill Down** or **Expand All** functions, improves your desired [geocoding](/azure/azure-maps/power-bi-visual-geocode) outcomes.

## Tooltips

This section addresses potential issues users may experience with tooltips.

### Page tooltips

Report Page [Tooltips](../create-reports/desktop-tooltips.md#considerations-and-limitations) aren't displayed for Dashboard Visual Tiles or Report-Page Dashboard Tiles. By design, Dashboards in Power BI don't currently support Report Page [Tooltips](../create-reports/desktop-tooltips.md#considerations-and-limitations). Dashboard Tiles take minimal snapshots of pinned content, and don't have a reference to the Report Page that is designed as a Tooltip. As a best practice, we recommended designing Dashboards without relying on report-page tooltips to ensure necessary information is clearly presented.

### Line chart tooltips

Users might notice that Line Chart **Tooltips** are displayed differently than other charts. By default, we show all series values and a vertical alignment bar to help users compare all series values within a specific category. In some cases, the standard datapoint tooltip will render, such as for Combo Charts and when Line Charts enter high-density sampling due to hitting data limits. Different filters may push the query slightly above or below the limits, resulting in different tooltips at different times for the same line chart visual. For more information about high-density line sampling, see our article: [High-Density Line Sampling in Power BI](../create-reports/desktop-high-density-sampling.md#tooltips-and-high-density-line-sampling)

## Images

This section addresses potential issues users may encounter with including images into their visualizations.

### Image URLs

If an image within a Power BI report isn't rendering, it may be due to the [image URL](../create-reports/power-bi-images-tables.md#considerations) not being anonymously accessible. Power BI requires the [image URL](../create-reports/power-bi-images-tables.md#considerations) to be anonymously accessible without requiring a sign-in to view. Images can't be hosted on sites that require authentication, such as SharePoint or OneDrive. 

To ensure the [image URL](../create-reports/power-bi-images-tables.md#considerations) is publicly accessible, open the [image URL](../create-reports/power-bi-images-tables.md#considerations) in an InPrivate mode browser window. If the image loads without requiring a sign-in, you correctly configured the image URL for use in Power BI. Loading images from a local path is also not supported in Power BI Desktop or in the Power BI service.

Likewise, Power BI mobile apps will only display if the [image URL](../create-reports/power-bi-images-tables.md#considerations) is anonymously accessible. Again, the image cannot be hosted on a site that requires a sign-in, such as SharePoint or OneDrive, even if you can see the image in Power BI Desktop or in the Power BI service.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Add visuals to a Power BI report (part 1)](power-bi-report-add-visualizations-i.md)
- [Add visuals to a Power BI report (part 2)](power-bi-report-add-visualizations-ii.md)
- [Get started formatting report visualizations](service-getting-started-with-color-formatting-and-axis-properties.md)
