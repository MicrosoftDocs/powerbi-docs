---
title: "Add a bookmark to a Power BI paginated report | Microsoft Docs"
description: Find out how to add bookmarks to a Power BI paginated report to provide a customized table of contents or to provide customized internal navigation links in Report Builder.
ms.date: 06/27/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add a bookmark to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Add bookmarks and bookmark links to a Power BI paginated report when you want to provide a customized table of contents or to provide customized internal navigation links in the report. Typically, you add bookmarks to locations in the report to which you want to direct users, such as to each table or chart or to the unique group values displayed in a table or matrix. You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression.  
  
 After you create bookmarks, you can add report items that the user can select to go to each bookmark. These items are typically text boxes or images.  
  
 For example, if your report displays a table grouped by color, you would add a bookmark based on the group expression to the group header. Then you would add a table with a single text box at the beginning of the report that displayed the color values, and set the bookmark link on that text box. When you select the color, the report jumps to the page that displays the group header row for that color.  
  
 You can add a bookmark to any report item and add a bookmark link to any item that has an **Action** property, for example, a text box, an image, or a calculated series in a chart. For more information, see the [Action properties dialog box (Power BI Report Builder)](add-hyperlink-url-report-builder.md).  
  
  
## Add a bookmark  
  
1. In report design view, select the text box, image, chart, or other report item to which you want to add a bookmark. The properties for the selected item appear in the Properties pane.  
  
2. In the text box next to **Bookmark**, type a string that is the label for this bookmark. For example, you could type **BikePhoto** as the bookmark for an image in your report. Alternatively, select the Expression (**fx**) button to open the **Expression** dialog box to specify an expression that evaluates to a label. For a group, the expression you type should be the group expression.  
  
    > [!NOTE]  
    >  The bookmark can be any string, but it must be unique in the report. If the bookmark is not unique, a link to the bookmark finds the first matching bookmark.  
  
## Add a bookmark link  
  
1. In Design view, right-click the text box, image, chart, to which you want to add a link and then select **Properties**.  
  
2. In The **Properties** dialog box for that report item, select **Action**.  
  
3. Select **Go to bookmark**. An additional section appears in the dialog box for this option.  
  
4. In the **Select bookmark** box, type or select a bookmark or an expression that evaluates to a bookmark. Using the previous example, type **BikePhoto** to create a link to the image in your report.  
  
5. Select **OK**.
  
6. (Optional) The text is not automatically formatted like a link. For text, it is helpful to change the color and effect of the text to indicate that the text is a link. For example, change the color to blue and the effect to underline in the **Font** section in the Home tab of the Ribbon.  
  
7. To test the link, select **Run** to preview the report, and then select the report item that you set this link on.
  
## Related content  

- [Expressions (Power BI Report Builder)](../expressions/report-builder-expressions.md)   
- [Filter, group, and sort data (Power BI Report Builder)](filter-group-sort-data-report-builder.md)  
  
