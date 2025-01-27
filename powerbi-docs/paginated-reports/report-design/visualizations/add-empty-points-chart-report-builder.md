---
title: "Add empty points to a chart in Power BI paginated report | Microsoft Docs"
description: Specify empty points on a chart in a Power BI paginated report. These points are calculated in Power BI Report Builder by taking the average of the previous and next data points that contain a value. 
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add empty points to a chart in Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

Null values are shown on the chart as empty spaces or gaps between data points in a series. In Power BI paginated reports, empty points are data points that can be inserted in the empty space created by null values.  
  
 By default, empty points are calculated by taking the average of the previous and next data points that contain a value. You can change this so that all empty points are inserted at zero.  
  
 For more information, see [Empty and Null Data Points in Charts &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/empty-and-null-data-points-in-charts-report-builder-and-ssrs).  

## Specify empty points on a chart  
  
1.  Open the Properties pane.  
  
2.  On the design surface, right-click the series that contains null values. The properties for the series are displayed in the Properties pane.  
  
3.  Expand the **EmptyPoint** node.  
  
4.  Select a color value for the Color property.  
  
5.  In the **EmptyPoint** node, expand the Marker node.  
  
6.  Select a marker type for the MarkerType property.  
  
    > [!NOTE]  
    >  You must select a marker type to add empty points to a bar, column or scatter chart. However, for area, line and radar charts, selecting a marker type is optional because the chart fills in the empty space or gap without requiring a marker to be specified.  
  
7.  Set the value of the empty point.  
  
    1.  In the Properties pane, expand the **CustomAttributes** node.  
  
    2.  Set the EmptyPointValue property. To insert empty points at an average of the previous and next data points, select **Average**. To insert empty points at zero, select **Zero**.  
  
## Related content

- [Add Dataset Filters, Data Region Filters, and Group Filters &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-dataset-filters-data-region-filters-and-group-filters)   
- [Chart Types &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/chart-types-report-builder-and-ssrs)   
- [Add Scale Breaks to a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-scale-breaks-to-a-chart-report-builder-and-ssrs)   
- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md)  
  
  
