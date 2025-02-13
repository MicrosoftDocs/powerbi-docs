---
title: "Design tips for reports in Power BI Report Builder"
description: Use the following tips to help design and control the appearance of your paginated reports in Power BI Report Builder. 
author: kfollis
ms.author: kfollis
ms.date: 01/18/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: c1490ff0-5b8a-43c1-8d22-e459395db4f6
---
# Design tips for reports in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

Use the following tips to help design your paginated reports in Power BI Report Builder.  
  
##  <a name="DesigningReports"></a> Designing reports  
  
A well-designed report conveys information that leads to action. Identify the questions that the report helps to answer. Keep those questions in mind as you design the report.  
  
- To design effective data visualizations, think about how to display information that's easy for the report user to understand. Choose a data region that's a good match for the data that you want to visualize. For example, a chart effectively conveys summary and aggregated information better than a table that spans many pages of detailed information. You can visualize data from a dataset in any data region, which includes charts, maps, indicators, sparklines, data bars, and tabular data in various grid layouts based on a tablix. 
  
- If you plan to deliver the report in a specific export format, test the export format early in your design. Feature support varies based on the renderer that you choose.  
  
- Build complex layouts in stages. You can use rectangles as containers to organize report items. You can build data regions directly on the design surface to maximize your working area. Then, as you complete each one, drag it to the rectangle container. By using a rectangle as a container, you can position all its contents in one step. Rectangles also help control the way report items render on each page.  
  
- To reduce clutter in a report, consider using conditional visibility for specific report items and let the user choose whether to show the items. You can set visibility based on a parameter or a text box toggle. You can add conditionally hidden text boxes to show interim expression results. When a report displays unexpected data, you can show these interim results to help debug expressions.  
  
- When you work with nested items in tablix cells or rectangles, you can set different background colors for the container and contained items. By default, the background color is *No color*. Items with a specific background color show through items with a background color set to *No color*. This technique can help you select the right item to set display properties, such as border visibility on tablix cells.  
  
For more information about things to consider as you design your report, see [Planning a report in Report Builder](report-builder-planning-report.md).  
  
##  <a name="NamingConventions"></a> Naming conventions for reports, data sources, and datasets  
  
For data sources and datasets, use naming conventions that document the source of the data.  
  
- **Data sources.** If you don't want to name an actual server or database due to security reasons, use an alias that indicates the source of the data to the user.  
  
- **Datasets.** Use a name that indicates which data source it's based on.  
  
##  <a name="Data"></a> Work with data  
  
As a first step, get all the data that you want to work with to appear in the **Report Data** pane. As you refine the questions that the report is designed to answer, think about how to limit the data in the report datasets to just what's needed.  
  
- In general, only include the data that you want to display in a report. Use query variables in your dataset queries to let the user choose which data they want to see in the report. If you're creating shared datasets, provide filters based on report parameters to provide the same functionality.  
  
- If you're an experienced query writer, you might want to group data in the report, and not in the query, for intermediate amounts of data. If you do all your grouping in the query, then the report tends to be a presentation of the query result set. On the other hand, to display aggregated values for large amounts of data on a chart or matrix, there's no need to include detail data.  
  
- Depending on your requirements, you can display names and locations of report data sources, dataset query command text, and parameter values in the report. Many new users wonder where the data comes from. To reduce clutter in the report, you can conditionally hide text boxes with this type of information and let users choose whether to see it. Try adding this information on the last page of the report. Set the text box visibility based on a parameter that the user can change.  
  
##  <a name="DesignSurface"></a> Interact with the report design surface  

The report design surface isn't *WYSIWIG*. When you place report items on the design surface, their relative location affects the way that the items appear on the rendered report page. White space is preserved.  
  
- Use snaplines and layout buttons to align and arrange items on the report design surface. For example, you can align the tops or edges of selected items, expand an item to match the size of another item, or adjust the spacing between items.  
  
- Use arrow keys to adjust the position and size of selected items on the design surface. For example, the following key combinations are very useful:  
  
    - **Arrow keys**: Move the selected report item.  
  
    - **CTRL+Arrow keys**: Nudge the selected report item.  
  
    - **CTRL+SHIFT+Arrow keys**: Increase or decrease the size of the selected report item.  
  
- To add an item to a rectangle, place the upper-left tip of the mouse pointer over the initial location of the item in the rectangle container. Use keyboard shortcuts to help position selected objects. The rectangle automatically expands to accommodate the size of the contained items.  
  
- To add multiple items to a tablix cell, first add a rectangle, and then add the items.  
  
     By default, each tablix cell contains a text box. When you add a rectangle to a cell, the rectangle replaces the text box. For example, place nested indicators in a rectangle in a tablix cell to help control how the size of a chart or indicator expands as you change the height of the row that the cell is in.  
  
- Use the **Zoom** control to adjust your view of the design surface. You can work with the whole page or smaller sections of the page.  
  
- To drag fields from the **Report Data** pane to the **Grouping** pane, avoid dragging the field across other report items on the design surface because this selects the other items and deselects the tablix data region. Drag the field down the Report Data pane and then across to the Grouping pane.  
  
###  <a name="Selecting"></a> Select items  
To help select the object that you want on the report design surface, use the ESC key, the right-click context menu, the **Properties** pane, and the **Grouping** pane.  
  
- Press ESC to cycle through the stack of report items that occupy the same space on the design surface.  
  
- On some report items, try using the right-click context menu to select the report item or the part of the report item that you want.  
  
- The **Properties** pane displays properties for the current selection.  
  
- To work with row groups and column groups in a tablix data region, select the group from the **Grouping** pane.  

  
##  <a name="ReportItems"></a> Work with specific types of report items  
  
###  <a name="Parameters"></a> Work with parameters  
  
- The primary purpose of report parameters is to filter data at the data source, and retrieve just what's needed in the report.  
  
- For report parameters, find a balance between allowing interactivity and helping a user get the results they want. For example, you can set default values for a parameter to values that you know are popular.  
  
###  <a name="Text"></a> Work with text  
  
- When you paste multiple lines into a text box, the text is added as one text run. Each text run can only be formatted as a unit. To format each line independently, insert a new line by pressing RETURN in the text run, as needed. You can then apply formatting and styles to each independent line of text in the text box.  
  
- You can set format properties and actions on a text box or on placeholder text in the text box. If there's only one line of text, it's more efficient to set properties on the text box than on the text.  
  
###  <a name="Expressions"></a> Work with expressions  
  
- Understand simple and complex expression formats. You can type a simple expression format directly into text boxes, in the **Properties** pane, or in locations in dialog boxes that accept an expression.
  
- When you create an expression, it helps to create each part independently and verify its value. You can then combine all the parts into a final expression. A useful technique is to add a text box in a matrix cell, display each part of the expression, and set conditional visibility on the text box. To control the border style and color when the text box is hidden, first place the text box in a rectangle, and then set the border style and color of the rectangle to match the matrix.  
  
###  <a name="Indicators"></a> Work with indicators  
  
- By default, an indicator shows at least three states. After you add an indicator to a report, you can configure it by adding or removing states. For easier viewing by your users, choose an indicator that varies by both color and shape.  
  
##  <a name="Rendering"></a> Control the rendering of report items on the report page  
  
On the report design surface, report items grow to accommodate the contents from the associated dataset, expression, subreport, or text.  
  
- When you position an item on the report page, the distance between this item and all items that begin to the right of it becomes the minimum distance that must be maintained as a report item grows horizontally. Similarly, the distance between an item and the item above it becomes a minimum distance that must be maintained as the top item grows vertically.  
  
- An item in a report grows to accommodate its data and pushes peer items (items within the same parent container) out of the way using the following rules:  
  
    - Each item moves down to maintain the minimum space between itself and the items that end above it.  
  
    - Each item moves right to maintain the minimum space between itself and the items that end to the left of it. For systems that use right-to-left layouts, each item moves left to maintain the minimum space between itself and the items that end to the right of it.  
  
    - Containers expand to accommodate the growth of child items. For a selected item, in the **Properties** pane, the *Parent* property identifies the container for the item. You can also use the **Document Outline** pane to see the containment hierarchy of report items.  
  
    - The **Layout** toolbar provides multiple buttons to help align edges, centers, and spacing for report items. To enable the **Layout** toolbar, from the **View** menu, point to **Toolbars**, and then select **Layout**.  
  
If you plan to save the report as a .pdf file, the report width must be explicitly set to a value that gives you the results that you want in the export file format. For example, set the report page width to exactly 7.9375 inches and the left and right margins to 0.5 inches.  
  
Use **Print Layout** and **Page Setup** on the report viewer toolbar to render a report in a print-compatible view. To help remove unnecessary blank pages, do the following:  
  
1. Remove all extra white space between data regions and on the edges of the report.  
  
2. Reduce page margins in the **Report Properties** dialog box.  
  
3. Use rectangles as containers to help control the way report items render.  
  
4. In column headers, change the text box property *WritingMode* to use vertical text.  

For more information, see [Avoid blank pages when printing paginated reports](../guidance/report-paginated-blank-page.md).

The combination of this behavior, the width and height properties of report items, the size of the report body, the page height and page width definition, the margin settings of the parent report, and the renderer-specific support all combine to determine what report items fit together on a rendered page.
 
## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)  
