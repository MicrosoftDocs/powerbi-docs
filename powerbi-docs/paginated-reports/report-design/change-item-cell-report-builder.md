---
title: "Change an item in a cell in a Power BI paginated report | Microsoft Docs"
description: Replace a non-container item, such as a text box, line, or image, in Power BI paginated reports with a new report item in Power BI Report Builder.
ms.date: 10/03/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Change an item in a cell in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In paginated reports, only a non-container item, such as a text box, line, or image, can be replaced by a new report item. For example, you can drag a table into a text box to replace the text box with a table.  
  
 If the cell contains a container item such as a rectangle, list, table, or matrix, the new item is added to the containing item instead of replacing it. To replace a container item with a new item, delete the container. Deleting the container item replaces it with a text box, which you can then replace with another item.  
  
 By default, all cells in a table, matrix, or list data region contain a text box.  
  
## Change an item in a cell  
  
-   On the **Insert** tab, in the **Data Regions** or **Report Items** group, select the item that you want to add to the report, and then select the report. The item is added to the report.  
  
> [!NOTE]  
>  The **Image Properties** dialog box opens when you drag an image report item to a cell, where you can set properties such as the source of the image before the image is added to the cell.  
  
## Related content

- [Images, Text Boxes, Rectangles, and Lines &#40;Power BI Report Builder&#41;](../../paginated-reports/report-design/images-text-boxes-rectangles-lines-report-builder-service.md)   
- [Tables, Matrices, and Lists &#40;Power BI Report Builder&#41;](../../paginated-reports/report-builder-tables-matrices-lists.md)  
  
  
