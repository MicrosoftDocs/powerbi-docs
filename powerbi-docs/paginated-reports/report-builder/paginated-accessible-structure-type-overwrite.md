---
title: "Use StructureTypeOverwrite to improve accessibility in Power BI paginated reports | Microsoft Docs"
description:  Learn about using the StructureTypeOverwrite property to improve accessibility in paginated reports.
ms.date: 056/01/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cookiemccray
---
# Use StructureTypeOverwrite to improve accessibility in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)] 

The StructureTypeOverwrite property has been added to the .rdl model. You can use it to improve accessibility in paginated reports in Microsoft Report Builder and Power BI Report Builder. Report Viewer also respects the property in Power BI Report Server.

There are two different options how you can use this new property:

- To set heading levels H1 through H6 for text boxes.
- To specify table cells as table headers.  

Let’s see an easy example how they can be helpful.  

Here's the design of a simple report. It has a report title and two tables with data. Each table has a text box label.  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-simple-report.png" alt-text="simple report.":::

If we export this report to Accessible PDF without changing anything, we get this logical structure:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-logical-structure-before.png" alt-text="logical structure before.":::

As you can see, the first row (<TR>) of the table isn't marked with a <TH> header tag, as it should be.  

Paragraphs (text boxes) are presented as <P>.

The screen reader preview shows that the report has no structure:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-screen-reader-preview-before.png" alt-text="screen reader no structure.":::

After setting the new property, you can transform the PDF structure into this logical structure:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-logical-structure-after.png" alt-text="added logical structure.":::

You see that now you have a *Heading 1 (H1)* for the report title, and two *Heading 2 (H2)* for the table titles.

The first row of the table is correctly set with a <TH> tag that allows the PDF document to determine which cells are headers, and which data cells should be associated with them.  

New screen reader preview:  

:::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-screen-reader-preview-after.png" alt-text="Screen reader with structure.":::

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

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-text-box-properties-accessibility.png" alt-text="Overwrite structure type box.":::

### Textbox Property Grid

1. If the Property grid isn't open, on the **View** tab, select the **Properties** checkbox.
1. Select a text box.
1. In the property grid, in the **Accessibility** property group, select a value in the **StructureTypeOverwrite** property.  

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-accessibility-property-structure-type-overwrite.png" alt-text="Structure type overwrite property setting.":::

### Benefits of headings

- Screen readers announce headings are announced as "Heading level 1", "Heading level 2", and so on.
- Users can press the shortcut <kbd>H</kbd> key to jump to the next header in a report, when you're viewing reports in Power BI Report Server.
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

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-tablix-cell-properties.png" alt-text="tablix cell properties.":::

1. In the **Accessibility** tab, you can set the property in the **Overwrite structure type** box.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-cell-overwrite-structure-type.png" alt-text="cell overwrite structure type.":::

1. Select one of the available structural cell values:  

    - None
    - ColumnHeaderCell
    - RowHeaderCell
    - DataCell

### Set a value for a whole row

1. Select inside a table.
1. Select the gray rectangle next to the row you want to set property for and select **Row Properties**.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-select-row.png" alt-text="select row properties.":::

1. In the **Row Properties** dialog on the **Accessibility** tab, set the new property.

    :::image type="content" source="media/paginated-accessible-structure-type-overwrite/paginated-row-properties-accessibility.png" alt-text="set row properties onteh accessibility tab.":::

### Considerations and limitations  

- You can't set this property for cells in the property grid. When you select a table cell, the properties in the grid are related to the text box, and not to the cell. When you select a table cell, in the property grid you see Heading1 through Heading6 options. They're associated with the text box of this cell, and not the cell itself.  
- You can't set this property can't be set for the top row or the left column of a matrix. For a matrix, the top row and left column headers are set automatically.
- You can set a column header cell and a row header cell.  

### Benefits of setting cell values

- Screen readers announce table headers as "Header".
- Some screen readers (for example, NVDA) can announce related header titles when reading data cell values, which is important for users that rely on screen readers. 
- Table headers are marked correctly in tagged PDF, and associated with data cells. 

## Limitations  

- Setting a row header (a horizontal header) for a table with right-to-left layout doesn't associate data cells on the left of it with the header in an exported tagged PDF.  

## Next steps

- [Accessibility in Power BI paginated reports (Power BI Report Builder)](paginated-accessibility-overview.md)
- [Use accessibility tools to create accessible paginated reports (Power BI Report Builder)](paginated-use-accessibility-tools.md)
