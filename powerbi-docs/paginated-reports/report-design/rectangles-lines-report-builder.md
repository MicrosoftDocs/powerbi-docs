---
title: "Rectangles and lines in a Power BI paginated report | Microsoft Docs"
description: Discover how to create visual effects within a Power BI paginated report in Power BI Report Builder. Add features such as color or an image, a tooltip, or a bookmark on the Power BI paginated report.   
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Rectangles and lines in a Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Rectangles and lines can help create visual effects within a Power BI paginated report. You can set display properties on the report items from the border section of the Home tab, and then set other properties in the Properties pane. You can also add features like a background color or image, a tooltip, or a bookmark to a rectangle.  
  
##  <a name="RectangleAsContainer"></a> Use a rectangle as a container  
 You can use a rectangle as a container for other items as well. When you move the rectangle, the items that are contained within the rectangle also move along with it. An item within the rectangle shows the name of the rectangle in its **Parent** property. For more information about how to use a rectangle as a container, see [Add a rectangle or container (Power BI Report Builder)](/sql/reporting-services/report-design/add-a-rectangle-or-container-report-builder-and-ssrs) and [Display the same data on a matrix and a chart (Power BI Report Builder)](/sql/reporting-services/report-design/display-the-same-data-on-a-matrix-and-a-chart-report-builder).  
  
> [!NOTE]  
>  A rectangle is only a container for items that you either create in the rectangle or drag into the rectangle. If you draw a rectangle around a report item that already exists on the design surface, then the rectangle will not act as its container. Subsequently, the rectangle will not be listed in the item's **Parent** property.  
  
 When using rectangles to contain report items, consider how the report items will be affected as a whole during the report rendering. Report items that contain repeated rows of data (for example, tables) will expand to accommodate the data that is returned by a query, and this affects the positioning of other report items in the rectangle. A table will push the report items down if they are positioned below the data region. To anchor a report item in place, you can place the report item inside of a rectangle that has an upper edge above the lower edge of the table. For more information, see [Rendering behaviors (Power BI Report Builder)](../../paginated-reports/report-design/render-behaviors-report-builder-service.md).  
  
##  <a name="ReportBorder"></a> Add a report border  
 You can add a border to a report by adding borders to the headers, footers, and report body themselves, without adding lines or rectangles. For more information, see [Add a border to a report (Power BI Report Builder)](../../paginated-reports/report-design/add-border-report-report-builder.md)  .  
  
## Related content

- [Add a border to a report (Power BI Report Builder)](add-border-report-report-builder.md)    
- [Add a rectangle or container (Power BI Report Builder)](add-rectangle-container-report-builder.md)    
- [Add and modify a line (Power BI Report Builder)](add-modify-line-report-builder.md)  
