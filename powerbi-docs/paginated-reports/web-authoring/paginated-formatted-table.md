---
title: "Create paginated reports that you can export in the Power BI service"
description: In this article, you learn how to create a paginated report using the interactive editor in the Power BI service, and then export it.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: nisrinivasan
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 06/21/2024
---

# Create paginated reports that you can export in the Power BI service

[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../../includes/applies-yes-service-no-report-builder-no-desktop.md)]

In this article, you learn how to create a paginated report with all the data from your Power BI semantic model, and then export it. The feature lets you quickly create a paginated report on the web, and apply styling. You can then export it using the rich export functionality of paginated reports, which retains the applied formatting & styling.

You can use the feature to create paginated reports in any workspace in the Power BI service, including workspaces that aren't in a Power BI Premium capacity.

## Prerequisites

See the **Prerequisites** section in [Get started creating paginated reports in the Power BI service](get-started-paginated-formatted-table.md#prerequisites).

## Get started

See the article [Get started creating paginated reports in the Power BI service](get-started-paginated-formatted-table.md) for all the ways you can get started creating paginated reports in the Power BI service.

No matter which way you start, the new paginated report online editing experience opens.

## Create a table

To create the table, select field names in the **Data** pane on the right.  This pane gives you a table-and-column based view of the chosen dataset.  When you find a column that you wish to add to your table, select the column.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-data-list.png" alt-text="Screenshot of selecting fields.":::

The selected columns appear in the **Editor** portion of the canvas. Give the editor a few moments to run the query on the dataset. The formatted table shows up in the **Preview** section of the canvas.

:::image type="content" source="media/paginated-formatted-table/paginated-authoring-add-fields.png" alt-text="Screenshot of formatted table preview." lightbox="media/paginated-formatted-table/paginated-authoring-add-fields.png":::

This viewer shows you a preview of your currently unsaved paginated report. Use this pane to make sure everything in your report looks good before editing or saving the report.

If columns are in the wrong order in the **Build** pane, don't worry.  You can easily reorder the columns in the **Build** pane columns by dragging the columns into the desired order.

:::image type="content" source="media/paginated-formatted-table/paginated-authoring-build-pane.png" alt-text="Screenshot of dragging items." lightbox="media/paginated-formatted-table/paginated-authoring-build-pane.png":::

When you select a field, we use the default aggregate set on the field. You can change the aggregate behavior. Select the arrow next to the field item in the **Build** pane.

:::image type="content" source="media/paginated-formatted-table/formatted-table-aggregations.png" alt-text="Screenshot of possible aggregations.":::

## Format the table

You can format the table from the **Build** pane or from the **Editor** ribbon. In the **Build** pane, you can format the table using the built-in format options.

In the **Build** pane, select the **Format** tab.
   
Select the drop-down arrow in the **Style** box, and experiment with the available styles.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-formatting-pane.png" alt-text="Screenshot of styling options." lightbox="media/paginated-formatted-table/power-bi-formatted-table-formatting-pane.png":::

In the **Editor**:
  
1. To resize the width of the columns, hover over the edge of a column header, and drag the double-headed arrow that appears.

    :::image type="content" source="media/paginated-formatted-table/paginated-table-resize-columns-1.png" alt-text="Screenshot of resizing the width of the columns.":::
   
1. To edit the text in a column header select the header you would like to edit, double-click and make your changes.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-column-rename-1.png" alt-text="Screenshot of editing text in a column header." lightbox="media/paginated-formatted-table/rdl-web-authoring-column-rename-1.png":::

1. To sort the table on a column, select the sort icon in the column header.
  
    :::image type="content" source="media/paginated-formatted-table/paginated-formatted-table-sort.png" alt-text="Screenshot of sorting during authoring." lightbox="media/paginated-formatted-table/paginated-formatted-table-sort.png":::

    After you sort it, you see the arrow icon showing the direction of the sort on the column.

    :::image type="content" source="media/paginated-formatted-table/paginated-formatted-table-sorted.png" alt-text="Screenshot of sorted column in authoring." lightbox="media/paginated-formatted-table/paginated-formatted-table-sorted.png":::

1. Insert textboxes, images, headers and footers from the ribbon.

    :::image type="content" source="media/paginated-formatted-table/paginated-authoring-insert-ribbon.png" alt-text="Screenshot of insert ribbon in authoring.":::

    > [!NOTE]
    > To revert to using the original column header based on your data source, remove and add the field again in the **Data** pane.
    >
    > When you export to CSV, it doesn't reflect the renamed column name. To learn more, see [data renderer formats](../report-design/render-data-report-builder-service.md#data-renderer-formats).

## Edit a paginated report

If you are **Viewing** a paginated report that you've *authored in the Power BI service*, you have the option to edit the report by switching to  **Editing**

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-edit-1.png" alt-text="Screenshot of Edit button.":::
 

## Add images to the paginated report

### Add images to the body of the paginated report

For any paginated report that you *author in the Power BI service*, you can insert images above or below the table in the report, into the header or footer of the report. 

1. To add an image to the body of your report, select **Insert**, then **Image**.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-image-insert.png" alt-text="Screenshot of insert image button.":::

    > [!NOTE]
    > At this time, you can only insert images from your local machine or external images that are available over the internet without needing authentication.


1. After you insert the image, you can use the **Picture format** tab to set an Alternate text for the image, set padding options, or set the display size option.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-image-picture-format.png" alt-text="Screenshot of picture format options.":::

To learn more about external images, refer to [Add external images to paginated reports](../report-design/add-external-image-report-builder-service.md).

### Add images to the header or footer of the paginated report

1. To add images to the header or footer of the report, select **Insert**, then **Header** or **Footer**.

    :::image type="content" source="media/paginated-formatted-table/paginated-authoring-insert-header-footer.png" alt-text="Screenshot of picture insert header or footer." lightbox="media/paginated-formatted-table/paginated-authoring-insert-header-footer.png":::

1. Select **Image**, then the location and click where you want to place the image within the header or footer.

    :::image type="content" source="media/paginated-formatted-table/paginated-authoring-insert-image.png" alt-text="Screenshot of insert image web authoring." lightbox="media/paginated-formatted-table/paginated-authoring-insert-image.png":::

    :::image type="content" source="media/paginated-formatted-table/paginated-authoring-insert-image-plus.png" alt-text="Screenshot of insert image cross hair." lightbox="media/paginated-formatted-table/paginated-authoring-insert-image-plus.png":::

## Add text to the paginated report

For any paginated report you author in the Power BI service, you can insert text boxes above or below the table in the report, as well as the header or footer of the report. 

### Add a text box and begin typing

1. To add a text box to your report, select **Insert** and then **Text box**.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-add-text-box.png" alt-text="Screenshot of insert text box button.":::

    > [!NOTE]
    > When you insert a new text box or select a text box, you're immediately editing the text in the text box.

1. Begin typing within the text box.

### Select, move, and resize text boxes 

1. To select a text box, click on the text box and a text box outline appears. 

1. To move a selected text box, select and drag the move indicator on the text box outline.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-textbox-move.png" alt-text="Screenshot of moving a text box.":::


1. To resize a text box, select the text box itself and then select and drag any sizing handle. Alternatively, press the SHIFT + arrow keys to resize horizontally or vertically.

    > [!NOTE]
    > Text that doesn't fit within the text box area may show only while the text box is selected. Text outside the text box area doesn't show in the final design of your report. Resize the text box area to show the text you would like visible.

### Format and style text in a text box

1. After you select a text box, the **Text box format** tab is displayed. From this tab you can format the font style, including font, color, size, and text decoration like bold, italics, and underline. 
    
    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-textbox-formatting.png" alt-text="Screenshot of text styling options.":::    
1. You can format font styles at the character and line level while you're editing the text box. Or select the text box to highlight all text and format all text within the text box at once.

### Delete a text box

To delete a text box, right-click a text box and select **Remove**. Alternatively, with a text box selected press <kbd>DELETE</kbd>.

### Considerations and limitations when working with text
- As with other objects in a report, you can only select one text box at a time. 
- Text boxes can't be duplicated, or copied and pasted. You can highlight, copy, and paste text within text boxes. 

### Add header and footer to your report

1. To add a header to the report, select **Header** from the **Insert** option on the ribbon.

   :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-header-footer.png" alt-text="Screenshot of header/footer.":::    

   
2. You can add a textbox, images, page numbers or execution times in the header/footer. You can also unselect **Show on first page** or **Show on last page** if you don't want the header/footer to be displayed on those pages.

   :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-header-footer-options.png" alt-text="Screenshot of header footer options.":::    
   
3. Once you are done creating your header/footer, you can exit either by selecting the **Close Header** or **Close Footer** option or double clicking outside the header or footer area.

   :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-close-header-footer-options.png" alt-text="Screenshot of close header footer options.":::   

### Considerations and limitations when working with headers and footers

1. You must exit the header or footer before you can continue editing the body of the report.
2. The format of the page number is limited. We only support absolute page numbers.
   
## Export your report

You can export the table before or after you save it. Paginated reports have rich export capabilities to any of the supported formats, preserving full fidelity. The exported report is saved to your default Downloads folder.

:::image type="content" source="media/paginated-formatted-table/formatted-table-export.png" alt-text="Screenshot of list of export formats available.":::

## Save your report

You can save the report to any workspace.

1. On the **File** menu, save, download, or print your report.

    :::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-file-menu.png" alt-text="Screenshot of File menu.":::

2. In **Save your report**, give your report a name and select a workspace.

    :::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-save-dialog-1.png" alt-text="Screenshot of Save menu.":::

After you save the report, you see a success or failure notification in the top right of the editor.

- If a report already exists where you have chosen to save, it asks you if you wish to overwrite the existing report.  
- If it succeeds, you see a link to the report. You can either follow this link or continue editing.  


## Considerations and limitations

- You can create a paginated report in any workspace.
- You can't create a paginated report from Power BI semantic models based on a live connection.
- The online editor does *not* replicate all existing Power BI Report Builder functionality.  

## Related content

- [View a paginated report in the Power BI service](../../consumer/paginated-reports-view-power-bi-service.md)
