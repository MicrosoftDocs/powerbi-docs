---
title: "Empty and null data points in Power BI paginated report charts | Microsoft Docs"
description: Learn about Power BI paginated report chart processing for empty values, use of placeholders, and how empty and null data points display in Power BI Report Builder. 
ms.date: 03/17/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: monaraya
---

# Empty and null data points in paginated report charts (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

If you are displaying fields with empty or null values in a chart in your paginated report, the chart may not look as you expect. Charts process empty values differently depending on the specified chart type:  
  
- If the chart type is a linear chart type (bar, column, scatter, line, area, range), empty values are displayed as empty spaces or "gaps" in the chart. If you want to indicate empty points, you must add empty point placeholders. For more information, see [Add Empty Points to a Chart &#40;Power BI Report Builder&#41;](add-empty-points-chart-report-builder.md).  
- If the chart type is a contiguous, linear chart type (area, bar, column, line, scatter), empty data points are added to the chart to maintain continuity in the series.  
- If the chart type is a nonlinear chart type (polar, pie, doughnut, funnel or pyramid), empty values are omitted from display on the chart. 
- In shape chart types, null values are omitted.  
  

## Remove empty or null values

 To avoid obscuring important data, consider removing empty values from your dataset. To filter nulls, you can use the NOT IS NULL clause in your query. Alternatively, you can add a filtering expression that specifies that you only want to display values not equal to zero. For more information, see [Add Dataset Filters, Data Region Filters, and Group Filters &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-dataset-filters-data-region-filters-and-group-filters).  
  
## Fields with no values in a chart

 If a field does not contain any values in the returned dataset, the chart displays an empty chart with no data points, but the series name (typically the field name) is added as a legend item.  
  
 This behavior differs from the case where there are zero rows of data in the returned dataset, which can occur when the report is parameterized and the selected value returns an empty result set. If your dataset query returns zero rows of data, a message is displayed at run time to indicate that no data can be shown. You can customize this message by modifying the NoDataMessage caption for the report in the **Properties** pane.

## Related content

- [Charts](charts-report-builder.md)   
- [Formatting a Chart](formatting-chart-report-builder.md)   
- [Add a Chart to a Report](add-chart-report-report-builder.md)   
- [Troubleshoot Charts](/sql/reporting-services/report-design/troubleshoot-charts-report-builder-and-ssrs)  
