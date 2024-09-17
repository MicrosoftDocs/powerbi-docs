---
title: Troubleshoot visualizations in Power BI
description: Troubleshoot visualizations in Power BI, including common issues and workarounds to overcome known obstacles or potential problems.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidi
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 09/03/2024
ms.custom: TSG - Troubleshooting Guide
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to be aware of the various considerations, limitations, workarounds to overcome known obstacles or potential issues with Power BI Visualizations, so I can effectively and easily identify solutions in both Power BI Desktop and Power BI service.
---
# Troubleshoot visualizations in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The document provides considerations and limitations for Power BI visualizations, and how to troubleshoot common content distribution issues. It addresses potential issues, and known issues, while offering solutions to ensure consistency and optimal performance in report design and user experience.  

## Slicers and filters

This section addresses potential issues users may encounter with slicers and filters.

### Clear button

- Users may experience difficulty locating the ‘Clear’ selection option within slicers. This challenge is due to the ‘Clear’ button’s design, which is embedded within the slicer header and only becomes visible upon mouse hover. The ‘Clear’ function is represented by a subtle eraser icon located in the top right corner of the slicer’s visual container. Its inconspicuous placement can lead to it being easily missed by users. If the eraser icon is not present, it typically indicates that the report creator has opted to disable the visual header in the report settings. To rectify this issue, the report creator must re-enable the visual header within the report’s settings. This action will make the eraser icon reappear, thus restoring the ‘Clear’ selection functionality for users.
- In the new slicer (Preview), users may find it challenging to locate the ‘Clear’ button as it is situated in the visual header, not within the slicer header as previously designed. The absence of the ‘Clear’ button upon hovering over the slicer’s visual container typically signifies that the visual headers have been disabled by the report creator. To make the ‘Clear’ button accessible again, the report creator needs to enable the visual headers. This action will restore the visibility of the ‘Clear’ button, allowing users to easily reset their slicer selections.
- It’s recommended that report authors click the ‘Clear’ icon and ‘Save’ before publishing, especially for range slicers. For other slicer types, you may prefer to save selection so that report consumers start with a specific set of filters, but Date Range slicers typically work best when starting cleared.

### Persistent filters

- In Power BI Desktop, the default setting may allow user filters to be saved automatically. This can lead to complications if users modify the original report filters, potentially causing discrepancies in the displayed data. When filters are modified and saved, they become persistent, meaning any changes made by the user will be retained, and when the same user returns to the report, they'll see the saved slicer selections.  To prevent such issues, navigate to the ‘Options’ dialog within Power BI Desktop. Locate the ‘[Persistent filters](../create-reports/power-bi-report-filter.md#allow-saving-filters)’ section and select the option ‘*Don’t allow end users to save filters on this file in the Power BI service*’. This setting ensures that user modifications to filters are not saved, maintaining the report’s original filter configuration as published by the author.
- In the Power BI service, there is a possibility that users may unintentionally save personal filters, which can disrupt what the report author had intended to display. This issue occurs when a user applies filters to a report and those filters are saved as part of their personal view. When returning to the report, and filters have been saved, the same user will see the filtered report rather than what the report author published. To address this problem, navigate to ‘File’ in the Power BI service, then select ‘Settings’. Within the ‘[Persistent filters](../create-reports/power-bi-report-filter.md#allow-saving-filters)’ section, opt for ‘*Don’t allow end users to save filters on this report*’. This setting will prevent the saving of individual filter configurations, thus maintaining the report’s original filter configuration as published by the author.

### Selection

- The term ‘[Select all](power-bi-visualization-slicers.md#selection-controls)’ can be misleading in its operation. Contrary to what the term suggests, ‘[Select all](power-bi-visualization-slicers.md#selection-controls)’ does not actually select every item. Instead, it operates on an inverted selection principle, meaning that any item you deselect becomes part of the query. This approach is more efficient as it avoids sending thousands of values in the query. By only sending the deselected values in a negated filter, we streamline the process and reduce the query load.
- When using the Slicer to filter reports, the ‘Selected Values’ may persist as selected even when they are no longer applicable, potentially leading to confusion and a misleading restatement of selected items. The Slicer saves the selected values, which can remain visible and selected in subsequent views of the report. However, if the underlying data or user permissions change, these selections may no longer be relevant or appropriate. Report authors should exercise caution to ensure that they do not save and publish reports with selected items that may be inappropriate for certain users, particularly in environments where Row-Level Security (RLS) is implemented. It is advisable to clear any selections that should not be universally applied before saving and distributing the report.

### What if

- The '[What If](../transform-model/desktop-what-if.md#considerations-and-limitations)' parameters in Power BI are designed to handle up to 1000 unique values. If a parameter exceeds this limit, the values will be evenly sampled, which may not meet the needs of detailed scenario analysis. This limitation is in place to ensure performance and manageability within Power BI. When more than 1000 unique values are needed, the parameter values are sampled to fit within this constraint, potentially leading to a loss of granularity. To work around this limitation, you can adjust the granularity of your '[What If](../transform-model/desktop-what-if.md#considerations-and-limitations)' parameters to ensure that the total number of unique values does not exceed 1000.

## Report locale

This section addresses potential issues users may encounter with dates in visuals.

### Format strings

- In Power BI, certain visual elements do not utilize the model format string for dates to conserve space and present only the necessary detail. This can lead to confusion when the displayed date format does not match the user’s expectations.  For these elements, Power BI leverages the browser’s locale settings to determine the date format. This means that the format may vary depending on the user’s browser configuration, which influences how dates are displayed in the report. To ensure consistency, report creators should be aware of the browser locale’s impact on date formatting. Common areas affected by this include [Slicers](../create-reports/desktop-slicer-numeric-range.md#display-formatting-with-the-date-range-slicer), and [Cartesian Axis Tick Labels](../visuals/power-bi-visualization-customize-x-axis-and-y-axis.md#considerations-and-limitations), and some sections of the Filter Pane.

## Fonts

This section addresses potential issues users may encounter with fonts in Power BI.

### Default fonts

- MacOS users may encounter font rendering issues with [Microsoft-owned fonts](../fundamentals/power-bi-browsers.md#fonts), as these are not included by default on MacOS systems. Due to the absence of certain [Microsoft fonts](../fundamentals/power-bi-browsers.md#fonts), MacOS will default to alternative fonts. This fallback can result in discrepancies in text rendering, particularly in terms of font size and layout consistency. To address this, users can manually install the missing [Microsoft fonts](../fundamentals/power-bi-browsers.md#fonts) on their MacOS devices. This ensures that reports and documents render with the intended appearance. Alternatively, report creators can opt for fonts that are commonly available across both Windows and MacOS platforms to avoid such issues.

### Custom fonts

- When incorporating a custom font into Power BI reports, it’s essential to specify the font correctly in the Custom Theme file. The font must be referenced by its correct operating system (OS) name, which may differ from its display name. Using the display name can result in the font not being recognized or applied in the report. To ensure the correct font name is used, navigate to the Fonts section in the Windows Control Panel. Here, you can verify the exact OS name of the font. Once confirmed, use this name in your Custom Theme file to successfully apply the custom font to your Power BI report.
- The font used in a Power BI report must be installed on the local machine of each end user. This is because fonts are not embedded within the report itself. If a font is not installed locally, it will not be displayed correctly when an end user views the report. This can lead to inconsistencies in the report’s appearance and can affect the overall user experience. To ensure uniformity in font usage across all end users, it is recommended to use an IT Group Policy for the centralized distribution of fonts within your company. This policy will facilitate the installation of the required fonts on all relevant machines, thereby maintaining the intended design and readability of the report.

## Colors

This section addresses potential issues users may encounter with report colors.

### Series color assignment

- In Power BI, the assignment of [theme colors](../create-reports/desktop-report-themes.md#dynamic-series) to series can vary depending on whether the series is static or dynamic. This can lead to inconsistencies in color representation across different report views. For static series, Power BI assigns theme colors based on the index order of the series. However, for dynamic series, colors are allocated on a first-come, first-served basis. As a result, the colors reserved for a series may change depending on the sequence in which report pages are viewed or when different filters are applied, such as with Row-Level Security (RLS). To maintain color consistency for dynamic series, it is recommended to explicitly define the color for each series within the report’s formatting settings. This ensures that each series retains its designated color regardless of the viewing order or applied filters.

## Themes

This section addresses potential issues users may encounter when working with custom themes.

### Default settings

- When setting visual-specific format options in Power BI, this can override any of the predefined properties in a custom theme. This occurs because explicit formatting at the visual level takes precedence over theme-level settings. As a result, any custom theme settings will not apply if existing format options have been set for a particular visual.

  For example, to allow [custom theme colors](../create-reports/desktop-report-themes.md#situations-when-report-theme-colors-wont-stick-to-your-reports) to take effect, you will need to reset the visual colors to default formatting. This can be done by clicking ‘Reset to Default’ within the color formatting options of the visual. Once the specific formatting is cleared, the [custom theme colors](../create-reports/desktop-report-themes.md#situations-when-report-theme-colors-wont-stick-to-your-reports) should apply as intended, provided that an explicit color has not been set for that visual.

  As another example, if “Legend Position = Left” has been specified in a custom theme file, but something else has been set at the visual level, the user would need to ‘Reset to Default’ to allow the custom theme to apply.

## Maps

This section addresses potential issues users may encounter when working with map visuals.

### Bing maps

- Bing Maps is being deprecated and should no longer be used for geographical data representation in Power BI. As part of the transition to more advanced and supported services, [Azure Maps](/azure/azure-maps/power-bi-visual-get-started) is recommended as the alternative to Bing Maps. [Azure Maps](/azure/azure-maps/power-bi-visual-get-started) provides a rich set of geographical data services and features that are continually updated. To adapt to this change, users should start utilizing [Azure Maps](/azure/azure-maps/power-bi-visual-get-started) for their mapping needs in Power BI. By  selecting your Bing Map visuals, you can click the Azure Map visual icon to convert them, and maintain the majority of your format settings. Alternatively, you may notice the popup when opening the report in Desktop, with an option to convert all your Bing Maps to Azure Maps. For a comprehensive understanding of [Azure Maps](/azure/azure-maps/power-bi-visual-get-started), including how to get started, what data is sent to Azure, and its limitations, refer to the detailed documentation provided by Microsoft.

### Geocoding

- To ensure [geocoding](/azure/azure-maps/power-bi-visual-geocode) accuracy in Power BI, make sure your model has pristine data for each distinct location entity and avoid concatenating strings. Assign the correct Data Category to each location entity, like ‘State’ or ‘Zipcode’. Build a Location hierarchy within your model or place  multiple fields in the location field well for precise [geocoding](/azure/azure-maps/power-bi-visual-geocode). Use the ‘Expand All Down’ icon to drill into the lowest hierarchy level, which includes all higher levels. This helps resolve ambiguities in locations with the same names, such as distinguishing ‘Paris, Texas’ from ‘Paris, France’. Adding ‘Country’ into your Location hierarchy and using the ‘Drill Down’ or ‘Expand All’ functions will improve [geocoding](/azure/azure-maps/power-bi-visual-geocode) outcomes.

## Tooltips

This section addresses potential issues users may experience with tooltips.

### Page tooltips

- Report Page [Tooltips](../create-reports/desktop-tooltips.md#considerations-and-limitations) are not displayed for Dashboards or Dashboard tiles. Users expecting to see tooltips when hovering over these elements may find this behavior confusing. This is by design - Dashboards in Power BI do not currently support Report Page [Tooltips](../create-reports/desktop-tooltips.md#considerations-and-limitations). Tooltips are a feature designed for use within individual report pages rather than the Dashboard view. While report tooltips can be highly informative within reports, they are not available for Dashboards. As a best practice, it’s recommended to design Dashboards with this in mind, ensuring that necessary information is clearly presented without relying on tooltips.

### Line chart tooltips

- Users may notice that Line Chart Tooltips are not consistently displaying column labels, or that the displayed information changes with slicer value adjustments. This can cause confusion when trying to interpret the data represented in the chart. This behavior is likely due to the [high-density](../create-reports/desktop-high-density-sampling.md#tooltips-and-high-density-line-sampling) line sampling feature in Power BI, which is designed to optimize performance. When there is a large amount of data, Power BI samples the data to create a more manageable number of data points for the line chart. Understanding this is by design, users can adjust their expectations of tooltip consistency in [high-density](../create-reports/desktop-high-density-sampling.md#tooltips-and-high-density-line-sampling) scenarios. If precise data points are required, consider using alternative visualizations that can handle large datasets without sampling, or adjust the chart settings to reduce the density of the data points, if possible.

## Images

This section addresses potential issues users may encounter with including images into their visualizations.

### Image URLS

- If an image within a Power BI report is not rendering, it may be due to the [image URL](../create-reports/power-bi-images-tables.md#considerations) not being anonymously accessible. Power BI requires that the [image URL](../create-reports/power-bi-images-tables.md#considerations) be anonymously accessible and do not require a sign-in to view, meaning they cannot be hosted on sites that require authentication, such as SharePoint or OneDrive. To ensure the [image URL](../create-reports/power-bi-images-tables.md#considerations) is publicly accessible, open the [image URL](../create-reports/power-bi-images-tables.md#considerations) in an InPrivate mode browser window; if the image loads without requiring a sign-in, it is correctly configured for use in Power BI. Note that loading images from a local path is also not supported in Power BI Desktop or in the Power Bi service.
- Likewise, Power BI mobile apps will only display if the [image URL](../create-reports/power-bi-images-tables.md#considerations) is anonymously accessible. Again, the image cannot be hosted on a site that requires a sign-in, such as SharePoint or OneDrive, even if you can see the image in Power BI Desktop or in the Power Bi service.

## Related content

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Add visuals to a Power BI report (part 1)](power-bi-report-add-visualizations-i.md)
- [Add visuals to a Power BI report (part 2)](power-bi-report-add-visualizations-ii.md)
- [Get started formatting report visualizations](service-getting-started-with-color-formatting-and-axis-properties.md)
