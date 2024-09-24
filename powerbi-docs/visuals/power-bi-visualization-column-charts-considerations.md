---
title: Considerations and limitations for column charts in Power BI
description: This document outlines all the considerations and limitations for column charts in Power BI Desktop and Power BI service.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/23/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand all the considerations and limitions for column charts so that I can effectively and more easily build column chart visuals in Power BI Desktop and Power BI service.
---
# Considerations and limitations for column charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

As a Power BI user, awareness of any considerations and limitations of column charts in Power BI is helpful when creating effective and visually appealing data visualizations.

This article provides an updated list of any known considerations and limitations, designed to help you navigate the nuances of column charts in both Power BI Desktop and the Power BI service.

Understanding the considerations and limitations allow you to make informed decisions and leverage the full potential of Power BI column charts. Whether you're a novice or an experienced user, this article aims to enhance your chart-building experience by keeping you up-to-date with practical insights and tips for any known issues.

### X-axis

#### Default scrolling position

* In Power BI, when the categorical axis is set as the X-axis, users may encounter inconvenience with the scrollbar starting on the left, particularly when displaying date/time values. This issue arises because there is no setting available to control the default scrolling position, which can be problematic when users wish to view dates from earliest to latest. It is recommended to use a continuous axis instead of a categorical axis when working with date/time values. This will allow for a more intuitive display of data over time, with the scrollbar beginning at the earliest date as expected.

#### Intervals

* Users have expressed a need to control intervals for numerical or date/time values on a continuous axis in Power BI. Unfortunately, there are currently no settings available to manage these intervals directly. The intervals on a continuous axis are automatically determined by Power BI based on the data points visible and the size of the visual container. This automatic adjustment is designed to optimize the display of data within the available space. As of now, there is no workaround to manually set these intervals. Users must rely on the automatic interval settings determined by Power BI.

#### Conditional formatting on X-axis values

* In Power BI, axis colors determined by conditional formatting are currently based on a general value rather than individual categories. This behavior occurs because conditional formatting for axis colors is applied uniformly across all categories. As a result, individual category distinctions are not reflected in the axis coloration, leading to a less customized visual representation. While Power BI does not offer a direct feature to assign conditional formatting to axis colors on a per-category basis, a workaround involves creating a separate data series for each category. This series can then be formatted individually, allowing for distinct axis colors corresponding to each category’s value.

### Y-axis

#### Intervals

* Power BI users have reported difficulties in controlling the intervals on the secondary axis. This limitation arises because Power BI currently lacks direct settings to adjust these intervals. The intervals for the secondary axis are automatically calculated by Power BI, which considers the highest and lowest data values along with the visual container’s dimensions. This automatic scaling is intended to ensure the most effective use of space and the best possible data representation. At present, there is no manual method to override these automatic interval settings. Users must adapt to the intervals that Power BI determines to be most suitable for their data visualization needs.

### Small multiples

#### Hierarchical axis

* In Power BI, when utilizing small multiples, the hierarchical axis is not supported. This limitation results in the axis defaulting to a concatenated format. This behavior occurs because small multiples are designed to display separate, distinct data points across multiple charts, and the hierarchical structure is not maintained when the axis is split into these individual elements.

#### Data value settings

* When creating small multiples in Power BI, the titles are currently missing data value settings such as display units, decimal places, and custom format options. These settings are essential for precise data representation and cannot be modified directly within the small multiples feature. This limitation arises because small multiples are designed to compare and contrast trends across multiple charts, and the title formatting options are not as extensive as those for individual visuals. The absence of these settings can lead to less informative and harder-to-read titles, affecting the overall effectiveness of data visualization. To address this, consider modifying these settings at the Model level, where you have more control over the data representation. Alternatively, you can use visual-level formatting to apply custom format strings to individual elements within your report, overriding the default settings where necessary.

### Columns

#### Series color assignment

* In Power BI, the assignment of [theme colors to series](../create-reports/desktop-report-themes.md#dynamic-series) can vary depending on whether the series is static or dynamic. This can lead to inconsistencies in color representation across different report views. For static series, Power BI assigns theme colors based on the index order of the series. However, for dynamic series, colors are allocated on a first-come, first-served basis. As a result, the colors reserved for a series may change depending on the sequence in which report pages are viewed or when different filters are applied, such as with Row-Level Security (RLS). To maintain color consistency for dynamic series, it is recommended to explicitly define the color for each series within the report’s formatting settings. This ensures that each series retains its designated color regardless of the viewing order or applied filters.

### Report locale

#### Format strings

* In Power BI, certain visual elements do not utilize the model format string for dates to conserve space and present only the necessary detail. This can lead to confusion when the displayed date format does not match the user’s expectations. For these elements, Power BI leverages the browser’s locale settings to determine the date format. This means that the format may vary depending on the user’s browser configuration, which influences how dates are displayed in the report. To ensure consistency, report creators should be aware of the browser locale’s impact on date formatting. Common areas affected by this include Slicers, Cartesian Axis Tick Labels, and some sections of the Filter Pane. If a specific date format is required, it should be explicitly set in the report to override the browser locale’s default formatting.

#### Display units suffix

* Users have encountered a challenge where the display units suffix in Power BI visuals automatically adjust based on location or system settings. This behavior is observed in other visual components such as axes, labels, small multiples, and legends. Power BI dynamically alters the display units suffix to match the regional or system settings of the user’s environment. This automatic adaptation ensures consistency with local conventions but may lead to confusion when sharing reports across different geographies or systems. Currently, there is no direct feature within Power BI to lock the display units suffix irrespective of location/system settings. However, users can manually adjust the format settings of the visuals to specify a consistent display unit. This adjustment needs to be done individually for each visual component that displays values.


## Related content

* [Column charts in Power BI](power-bi-visualization-column-charts.md)
* [Format settings for column charts in Power BI](power-bi-visualization-column-chart-format-settings.md)
* [Format column and bar charts](power-bi-visualization-column-bar-format.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)