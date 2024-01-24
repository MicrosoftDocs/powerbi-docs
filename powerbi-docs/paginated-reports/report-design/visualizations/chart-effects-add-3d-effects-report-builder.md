---
title: "Add 3D effects to a Power BI paginated report chart | Microsoft Docs"
description: Provide depth and add visual impact to charts in your Power BI paginated report with three-dimensional effects in Power BI Report Builder.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Chart effects: Add 3D effects to a Power BI paginated report chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  Three-dimensional (3D) effects can be used to provide depth and add visual impact to charts in your paginated reports. For example, if you want to emphasize a particular slice of an exploded pie chart, you can rotate and change the perspective of the chart so that people notice that slice first. When 3D effects are applied to your chart, all gradient colors and hatching styles are disabled.  
  
 
  
## Apply 3D effects to a range, area, line, scatter or polar chart  
  
1.  Right-click anywhere inside the chart area and select **3D Effects**. The **Chart Area Properties** dialog box appears.  
  
2.  In **3D Options**, select the **Enable 3D** option.  
  
3.  (Optional) In **3D Options**, you can set a variety of properties relating to 3D angles and scene options. For more information about these properties, see [Chart effects: 3D, bevel, and others in Power BI paginated reports (Power BI Report Builder)](chart-effects-3d-bevel-other-report-builder.md).  
  
4.  Select **OK**.  
  
## Apply 3D effects to a funnel chart  
  
1.  Right-click anywhere inside the chart area and select **3D Effects**. The **Chart Area Properties** dialog box appears.  
  
2.  In **3D Options**, select the **Enable 3D** option. Select **OK**.  
  
3.  (Optional) To customize the funnel chart visual appearance, you can go to the Properties pane and change properties specific to the funnel chart.  
  
    1.  Open the Properties pane.  
  
    2.  On the design surface, select anywhere on the funnel. The properties for the series of the funnel chart are displayed in the Properties pane.  
  
    3.  In the **General** section, expand the **CustomAttributes** node.  
  
    4.  For the **Funnel3DDrawingStyle** property, select whether the funnel will be shown with as circular or square.  
  
    5.  For the **Funnel3DRotationAngle** property, set a value between -10 and 10. This will determine the degree of tilt that will be displayed on the 3D funnel chart.  
  
## Apply 3D effects to a pie chart  
  
1.  Right-click anywhere inside the chart area and select 3D Effects. The **Chart Area Properties** dialog box appears.  
  
2.  In **3D Options**, select the **Enable 3D** option. Select **OK**.  
  
3.  (Optional) In **Rotation**, type an integer value that represents the horizontal rotation of the pie chart.  
  
4.  (Optional) In **Inclination**, type an integer value that represents the vertical tilt rotation of the pie chart.  
  
5.  Select **OK**.  
  
## Apply 3D effects to a bar or column chart  
  
1.  Right-click anywhere inside the chart area and select **3D Effects**. The **Chart Area Properties** dialog box appears.  
  
2.  Select the **Enable 3D** option. Select **OK**.  
  
3.  (Optional) Select the **Enable series clustering** option. If your chart contains multiple bar or column chart series, this option will display the series as clustered. By default, multiple bar or column series are shown side-by-side.  
  
4.  Select **OK**.  
  
5.  (Optional) To add cylinder effects to a bar or column chart, follow these steps:  
  
    1.  Open the Properties pane.  
  
    2.  On the design surface, select any of the bars in the series. The properties for the series are displayed in the Properties pane.  
  
    3.  In the **General** section, expand the **CustomAttributes** node.  
  
    4.  For the **DrawingStyle** property, specify the **Cylinder** value.  
  
## Related content

- [Chart effects: 3D, bevel, and others in Power BI paginated reports (Power BI Report Builder)](chart-effects-3d-bevel-other-report-builder.md)
- [Formatting a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-a-chart-report-builder-and-ssrs)   
- [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md)  
  
  
