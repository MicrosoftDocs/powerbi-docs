---
title: "Set text box orientation in a Power BI paginated report | Microsoft Docs"
description: Find out how to rotate a text box in different directions in your paginated reports in Report Builder. 
ms.date: 01/26/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---
# Set text box orientation in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

In a Power BI paginated report, you can rotate a text box in different directions:   
* Horizontally   
* Vertically (rotated 90 degrees, with text reading from top to bottom, except East Asian text characters)

* Rotated by 270 degrees (text reading from bottom to top).   
  
Because you rotate the text box not the text, the rotation applies to all the text in the text box. You cannot specify different directions for parts of the text. Size the column width and the row height manually to accommodate the rotated text.  
  
 The WritingMode property, which you use to specify text orientation, isn't in the **Text Box Properties** dialog box. It's in the Properties pane, and you set the property there.   
  
## Rotate text  
  
1.  Create a report or open an existing report, and [add a text box](/sql/reporting-services/report-design/add-move-or-delete-a-text-box-report-builder-and-ssrs) to the design surface.  
  
3.  Select the text box that you want to rotate.  
  
2.  If the Properties pane is not open, on the **View** tab, select the **Properties** check box.  
  
4.  In the Properties pane, find the WritingMode property and select the text orientation to apply to the text box.  
  
    > [!NOTE]  
    >  When the properties in the Properties pane are organized into categories, WritingMode is in the **Localization** category.  
  
5.  In the list box, select **Horizontal**, **Vertical**, or **Rotate270**.  
  
## Related content

* [Text Boxes &#40;Power BI Report Builder&#41;](./text-boxes-report-builder-and-service.md)   
* [Tutorial: Format Text &#40;Report Builder&#41;](/sql/reporting-services/tutorial-format-text-report-builder)  
  
  
