---
title: "Add custom locations to a map in a Power BI paginated report | Microsoft Docs"
description:  Learn how to add custom locations to a map you have added to a Power BI paginated report in Power BI Report Builder. 
ms.date: 02/17/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add custom locations to a map in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

 After you add a map to a Power BI paginated report, you can add your own point locations.  
  
 Display properties for all points on a layer are controlled by setting options for the point properties for the layer. For a selected embedded point, you can override the display properties.  
  
> [!NOTE]  
>  When you override the layer display properties for the embedded point, the changes that you make are not reversible.  
  
 For more information, see [Vary Polygon, Line, and Point Display by Rules and Analytical Data &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/vary-polygon-line-and-point-display-by-rules-and-analytical-data).  
  

  
## Add a point layer  
  
1.  On the report design surface, select the map to select it and display the Map pane.  
  
2.  On the toolbar, select **Add Layer**.  
  
3.  From the drop-down list, select **Add Point Layer**. A point layer with no points is added to the map. By default, the point layer is ready for embedded points.  
  
## Add a custom point  
  
1.  On the report design surface, select the map to select it and display the Map pane.  
  
2.  In the Map pane, right-click a point layer that has type **Embedded**, and then select **Add Point**. The cursor changes to crosshairs.  
  
3.  To add a point, select a location on the map. An embedded point is added to the selected layer at the location where you select.  
  
## Customize the display for an embedded point  
  
1.  Right-click the point, and then select **Point Properties**. The **Map Embedded Point Properties** dialog box opens.  
  
2.  Select **Override point options for this layer**. Multiple property pages appear in the left pane.  
  
3.  Select the pages and set the display properties that you want to apply to this point.  
  
## Related content

- [Maps &#40;Power BI Report Builder&#41;](../report-builder/maps-report-builder.md)   
- [Vary Polygon, Line, and Point Display by Rules and Analytical Data &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/vary-polygon-line-and-point-display-by-rules-and-analytical-data)  
  
  
