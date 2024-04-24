---
title: "Improve accessibility in Power BI paginated reports with StructureTypeOverwrite | Microsoft Docs"
description:  Learn about using the StructureTypeOverwrite property to improve accessibility in paginated reports.
ms.date: 10/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rvpatkar
---
# Improve accessibility in paginated reports with StructureTypeOverwrite (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)] 

The StructureTypeOverwrite property has been added to the .rdl model. You can use it to improve accessibility in paginated reports in Microsoft Report Builder and Power BI Report Builder. Report Viewer also respects the property in Power BI Report Server.

There are two different ways that you can use this new property:

- To set heading levels H1 through H6 for text boxes.
- To specify table cells as table headers.  

Let’s see an example how they can be helpful.  

Here's the design of a simple report. It has a report title and two tables with data. Each table has a text box label.  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-simple-report.png" alt-text="Screenshot of a simple report with a report title and two tables with data.":::

If we export this report to Accessible PDF without changing anything, we get this logical structure:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-logical-structure-before.png" alt-text="Screenshot showing logical structure before.":::

As you can see, the first row (<TR>) of the table isn't marked with a <TH> header tag, as it should be.  

Paragraphs (text boxes) are presented as `<P>`.

The screen reader preview shows that the report has no structure:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-screen-reader-preview-before.png" alt-text="Screenshot showing screen reader with no structure.":::

After setting the new property, you can transform the PDF structure into this logical structure:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-logical-structure-after.png" alt-text="Screenshot showing added logical structure.":::

You see that now you have a *Heading 1 (H1)* for the report title, and two *Heading 2 (H2)* for the table titles.

The first row of the table is correctly set with a <TH> tag that allows the PDF document to determine which cells are headers, and which data cells should be associated with them.  

Here's the new screen reader preview:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-screen-reader-preview-after.png" alt-text="Screenshot showing Screen reader with structure.":::

## Heading level for text boxes 

In Report Builder, you can set the heading level for any text box, including text boxes that are placed inside a *tablix*. Tables and matrixes are both examples of *tablixes*.

The default value is *None*. Here are the available values:  

- None  
- Heading1 
- Heading2 
- Heading3 
- Heading4 
- Heading5 
- Heading6 

## Set the heading value

You can set the heading value in two different ways:  

### Text Box Properties window

1. Right-click a text box and select **Text Box Properties**.  
1. In the **Accessibility** tab, in the **Overwrite structure type** box, select a heading level.  

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-text-box-properties-accessibility.png" alt-text="Screenshot showing Overwrite structure type box.":::

### Textbox Property grid

1. If the Property grid isn't open, on the **View** tab, select the **Properties** checkbox.
1. Select a text box.
1. In the property grid, in the **Accessibility** property group, select a value in the **StructureTypeOverwrite** property.  

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-accessibility-property-structure-type-overwrite.png" alt-text="Screenshot showing Structure type overwrite property setting.":::

### Benefits of headings

- Screen readers announce headings as "Heading level 1", "Heading level 2", and so on.
- You can press the shortcut <kbd>H</kbd> key to jump to the next header in a report, when you're viewing reports in Power BI Report Server.
- Headings are marked correctly in tagged PDF.

## Set header cells for tables in Report Builder

You can set a value for any cell in a table, and for *regular* cells in matrixes, that is, any cell that isn't in the top row or in the left column.  

The default value is *None*. Here are the available values:  

- None 
- ColumnHeaderCell 
- RowHeaderCell 
- DataCell 

### Set a value for a single cell

1. Select a cell in a tablix. It should be outlined in a bold line.
1. Right-click and select **Cell Properties**.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-tablix-cell-properties.png" alt-text="Screenshot showing tablix cell properties.":::

1. In the **Accessibility** tab, you can set the property in the **Overwrite structure type** box.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-cell-overwrite-structure-type.png" alt-text="Screenshot showing cell overwrite structure type.":::

1. Select one of the available structural cell values:  

    - None
    - ColumnHeaderCell
    - RowHeaderCell
    - DataCell

### Set a value for a whole row

1. Select inside a table.
1. Select the gray rectangle next to the row you want to set a property for and select **Row Properties**.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-select-row.png" alt-text="Screenshot showing selecting row properties.":::

1. In the **Row Properties** dialog on the **Accessibility** tab, set the new property.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-row-properties-accessibility.png" alt-text="Screenshot showing setting row properties on the Accessibility tab.":::

### Benefits of setting cell values

- Screen readers announce table headers as "Header".
- Some screen readers (for example, NVDA) can announce related header titles when reading data cell values, which is important for users that rely on screen readers. 
- Table headers are marked correctly in tagged PDF, and associated with data cells. 

### Considerations and limitations  

- You can't set this property for cells in the property grid. When you select a table cell, the properties in the grid are related to the text box, and not to the cell. When you select a table cell, in the property grid you see Heading1 through Heading6 options. They're associated with the text box of this cell, and not the cell itself.  
- You can't set this property for the top row or the left column of a matrix. For a matrix, the top row and left column headers are set automatically.
- You can set a column header cell and a row header cell.  
- Setting a row header (a horizontal header) for a table with right-to-left layout doesn't associate data cells on the left of it with the header in an exported tagged PDF.
 
## Related content

- [Accessibility in Power BI paginated reports (Power BI Report Builder)](paginated-accessibility-overview.md)
- [Use accessibility tools to create accessible paginated reports (Power BI Report Builder)](paginated-use-accessibility-tools.md)
