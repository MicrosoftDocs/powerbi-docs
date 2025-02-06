---
title: "Add, move, or delete a text box in a Power BI paginated report"
description: Add a text box to the paginated report body to display information such as titles, parameter choices, built-in fields, and dates in Power BI Report Builder. 
ms.date: 02/06/2025
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Add, move, or delete a text box in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  Text boxes are the most commonly used report item in Power BI paginated reports. You can add a text box to the report body to display information such as titles, parameter choices, built-in fields, and dates.  
  
 Every cell in a table or matrix is really a text box. Almost all report data displayed in a report with tables and matrices is the result of the report processor evaluating the contents of each text box in the report. As such, you can format cells in the same way you would format other text boxes outside the data region.  
  
 To add a text box to a list data region, you must first add the text box and then drag it into the list.  
  
> [!NOTE]  
> When you select a text box, you're immediately editing the text in the text box. To select the text box itself, not the text in it, press ESC. The four-headed arrow icon is visible on the text box's border when it's selected.
  
## Add a text box  
  
1. On the **Insert** tab, select **Text Box**.  
  
2. On the design surface, select and then drag a text box to the desired size.  
  
## Add a text box in a list  
  
1. On the **Insert** tab, select **List**.  
  
2. On the design surface, select and then drag a box to the desired size of the list.  
  
3. On the **Insert** tab, select **Text Box**.  
  
4. On the design surface, select and then drag a box to the desired size of the text box inside the list you added in step 1.
  
5. To confirm the text box is correctly nested inside the list, select the text box.  
  
    > [!NOTE]  
    > If you select inside the text box and are in edit mode, press ESC to select the text box. The four-headed arrow icon is visible on the text box's border when it's selected.
  
6. In the Properties pane, verify that the **Parent** property is the rectangle that was automatically added to the list data region.  
  
    > [!NOTE]  
    > If the Properties pane isn't visible, check **Properties** on the **View** tab.  
  
## Move a text box  
  
1. On the design surface, select any empty space within the text box to select the text box.  
  
    > [!NOTE]  
    > If you select within the text box and are in edit mode, press ESC to select the text box. The four-headed arrow icon is visible on the text box's border when it's selected.
  
2. Select the text box handle and drag the text box to the new location.

    Alternatively, use the arrow keys to move a selected text box horizontally or vertically. To move the text box in smaller increments on the design surface, hold down CTRL plus the arrow keys.  
  
## Delete a text box  
  
1. On the design surface, right-click any empty space within the text box to select it and open a local menu with the **Delete** command.

    :::image type="content" source="../media/report-builder-delete-text-box.png" alt-text="Screenshot of a text box selected in Report Builder and the delete command highlighted in a local menu..":::
  
    Alternatively, select any empty space within the text box, and then press DELETE.

    > [!NOTE]  
    > If you select inside the text box and are in edit mode, press ESC to select the text box. The four-headed arrow icon is visible on the text box's border when it's selected.

## Related content

- [Text boxes in paginated reports &#40;Power BI Report Builder&#41;](text-boxes-report-builder-and-service.md)
- [Expressions in Power BI Report Builder](../../expressions/report-builder-expressions.md)
- [Keyboard shortcuts for accessibility in paginated reports in Report Builder](/sql/reporting-services/report-builder/keyboard-shortcuts-report-builder)  
