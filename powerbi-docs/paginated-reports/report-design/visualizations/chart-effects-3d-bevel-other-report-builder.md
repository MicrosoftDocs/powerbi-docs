---
title: "3D, bevel, and other effects in Power BI paginated report charts | Microsoft Docs"
description: Discover how 3D effects in Power BI paginated reports can be used to provide depth and add visual impact to charts in Power BI Report Builder. 
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: JulCsc
ms.author: juliacawthra
ms.reviewer: saurkumar
---
# Chart effects: 3D, bevel, and others in Power BI paginated reports (Power BI Report Builder)


[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  Three-dimensional (3D) effects can be used to provide depth and add visual impact to charts in your paginated reports. For example, if you want to emphasize a particular slice of an exploded pie chart, you can rotate and change the perspective of the chart so that people notice that slice first. When 3D effects are applied to your chart, all gradient colors and hatching styles are disabled.  
  
 Three-dimensional effects can be applied to individual charts, and it is possible to display both two-dimensional and three-dimensional charts on the same report.  
  
 For all chart types, you can add three-dimensional effects to a chart area in the **Chart Area Properties** dialog box by selecting **Enable 3D**. For more information, see [Add 3D Effects to a Chart &#40;Power BI Report Builder&#41;](chart-effects-add-3d-effects-report-builder.md).  
  
 Another way to add visual impact to charts is by adding bevel, emboss and texture styles in bar, column, pie and donut charts. For more information, see [Add bevel, emboss, or texture to a paginated report chart (Power BI Report Builder)](chart-effects-add-bevel-emboss-or-texture-report-builder.md).  

## Coordinate-based three-dimensional charts

 When you work with coordinate-based chart types (column, bar, area, point, line, and range), three-dimensional effects display the chart with a third axis, known as the "z-axis". The introduction of this third axis allows you to apply a variety of visual enhancements to your chart.  
  
## Change the white space in a 3D chart

 When you display a chart area in three-dimensional mode, each series is shown in a separate row along the z-axis of the chart. To change the amount of space between each series, modify the chart's point gap depth by changing the **Point Gap Depth** property in the 3D Effects dialog box.  
  
## Change the projection of a 3D chart

 There are two types of 3D projections: oblique and perspective. An oblique projection to the chart adds a depth dimension to a two-dimensional chart. The z-axis is drawn at equal angles from the horizontal and vertical axes, which remain perpendicular to each other just as in a two-dimensional chart.  
  
 Perspective projection transforms the chart by estimating a view plane and re-drawing the chart as if it were being viewed from that point. The **Rotation** value shifts the view vertically from "ground level" at 0 to overhead at 90. The **Inclination** value shifts the viewing angle to the left or right. A value of 0 is equivalent to a two-dimensional view of the chart. The **Perspective** value defines the percentage of distortion that will be used when displaying the projection. This type of projection maintains the proportions of your chart, but the chart's appearance becomes distorted, so it is most effective to use a lower degree of perspective.  
  
> [!NOTE]  
> The oblique and perspective projections are separate types of projections, so they cannot be used together on the same chart.  
  
## Cluster data

 In 2D charts, multiple series of data appear side-by-side. Clustering shows individual series in separate rows on a 3D chart. For example, if you have a chart that contains three series of data points, clustering will display each of the three series on a separate row along the z-axis. By default, all chart types shown in 3D are clustered.  
  
 Clustering can be disabled for bar and column charts. When clustering is disabled, multiple bar and column series are displayed side-by-side in one row.  
  
## Shape-based three-dimensional charts

 Shape-based chart types (pie, donut, funnel, and pyramid) have fewer three-dimensional effects available. When working with shape-based chart types, you can change the rotation and inclination values only.  
  
## Rotations

 Charts can be rotated horizontally and vertically from -90 to 90 degrees. A positive horizontal angle will rotate the chart counter-clockwise around the x-axis, while a positive vertical angle will rotate the chart clockwise around the y-axis.  
  
## Highlight 3D effects

 You can add highlighting styles to a 3D chart via the **Shading** property, which appears under Area3DStyle in the Properties pane when the chart area is selected. A simple lighting style applies the same hue to the chart area elements. A realistic style changes the hues of the chart area elements depending on a specified lighting angle.  
  
## Related content

- [Formatting Axis Labels on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
- [Formatting a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-a-chart-report-builder-and-ssrs)   
- s[Add 3D Effects to a Chart &#40;Power BI Report Builder&#41;](chart-effects-add-3d-effects-report-builder.md)  
