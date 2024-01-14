---
title: "Create paginated reports that you can export in the Power BI service"
description: In this article, you learn how to create a paginated report using the interactive editor in the Power BI service, and then export it.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: nisrinivasan
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 12/19/2023
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

To create your first table, select field names in the **Data** pane on the right.  This pane gives you a table-and-column based view of the chosen dataset.  When you find a column that you wish to add to your table, select the column or drag it to **Values** section of the **Build** pane.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-fields-list.png" alt-text="Screenshot of selecting fields.":::

Give the editor a few moments to run a new query on the dataset. The formatted table shows up in the paginated report viewer to the left side of the page.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-table.png" alt-text="Screenshot of formatted table preview.":::

This viewer shows you a preview of your currently unsaved paginated report. Use this pane to make sure everything in your report looks good before editing or saving the report.

If columns are in the wrong order in the **Build** pane, don't worry.  You can easily reorder the columns in the **Build** pane columns by dragging the columns into the desired order.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-build-pane-selected-fields.png" alt-text="Screenshot of dragging items.":::

When you select a field, we use the default aggregate set on the field. You can change the aggregate behavior. Select the arrow next to the field item in the **Build** pane.

:::image type="content" source="media/paginated-formatted-table/formatted-table-aggregations.png" alt-text="Screenshot of possible aggregations.":::

## Format the table

Now that you have the columns that you want, you can format the table using the built-in format options.

1. In the **Build** pane, select the **Format** tab.
1. Select the drop-down arrow in the **Style** box, and experiment with the available styles.

    :::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-formatting-pane.png" alt-text="Screenshot of styling options.":::

1. To resize the width of the columns, hover over the edge of a column header, and drag the double-headed arrow that appears.

    :::image type="content" source="media/paginated-formatted-table/paginated-table-resize-columns.png" alt-text="Screenshot of resizing the width of the columns.":::
1. To edit the text in a column header select the header you would like to edit and make your changes.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-column-rename.png" alt-text="Screenshot of editing text in a column header.":::

1. To sort the table on a column, select the sort icon in the column header.
  
    :::image type="content" source="media/paginated-formatted-table/paginated-formatted-table-sort.png" alt-text="Screenshot of sorting during authoring." lightbox="media/paginated-formatted-table/paginated-formatted-table-sort.png":::

    After you sort it, you see the arrow icon showing the direction of the sort on the column.

    :::image type="content" source="media/paginated-formatted-table/paginated-formatted-table-sorted.png" alt-text="Screenshot of sorted column in authoring." lightbox="media/paginated-formatted-table/paginated-formatted-table-sorted.png":::

> [!NOTE]
> To revert to using the original column header based on your data source, remove and add the field again in the **Data** pane.
>
> When you export to CSV, it doesn't reflect the renamed column name. To learn more, see [data renderer formats](../report-design/render-data-report-builder-service.md#data-renderer-formats).

## Edit a paginated report

If you navigate to any paginated report that you've *authored online*, you have the option to edit the report within the paginated report viewer experience. This option is available in the toolbar above the viewer.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-edit.png" alt-text="Screenshot of Edit button.":::

This option takes you back to the online editor experience, where you can make changes to the report.  

> [!NOTE]
> This **Edit** button isn't the same as the **Edit** button on the **File** menu.  That **Edit** button opens Power BI Report Builder instead. *If you edit this report in Report Builder, you can't edit it online anymore.*

## Add images to the paginated report
For any paginated report that you *author online*, you can insert images in the top section of your report to brand or describe your formatted table data.

### Add an image item
1. To add an image to your report, select **Insert**, then **Image**.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-image-insert.png" alt-text="Screenshot of insert image button.":::

    > [!NOTE]
    > At this time, you can only insert external images that are available over the internet without needing authentication.

1. Images are inserted at the top of the first page of your report.
1. After you insert the image, you can use the **Picture format** tab to set an Alternate text for the image, set padding options, or set the display size option.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-image-picture-format.png" alt-text="Screenshot of picture format options.":::

To learn more about external images, refer to [Add external images to paginated reports](../report-design/add-external-image-report-builder-service.md).

## Add text to the paginated report
For any paginated report you **author online**, you can insert text boxes in the top section of your report to brand, title, or describe your formatted table data below. 

### Add a text box and begin typing
1. To add a text box to your report, select **Insert** and then **Text box**.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-add-text-box.png" alt-text="Screenshot of insert text box button.":::
    
1. Text boxes are inserted at the top left of the first page of your report.

    > [!NOTE]
    > When you insert a new text box or select a text box, you're immediately editing the text in the text box.

1. Begin typing within the text box.

### Select, move, and resize text boxes 
1. To select a text box, hover over a text box and a text box outline appears, select within the text box area to select the text box you are hovered over.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-text-box-added.png" alt-text="Screenshot of text box hovered over and outlined.":::
1. To move a selected text box, select and drag the move indicator on the text box outline.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-moving-text-box.gif" alt-text="Animation of moving a text box.":::

    > [!NOTE]
    > Alternatively, select the text box itself, not the text in it, by pressing ESC. And then use the arrow keys to move a selected text box horizontally or vertically.

1. To resize a text box, select the text box itself and then select and drag any sizing handle. Alternatively, press the SHIFT + arrow keys to resize horizontally or vertically.

    > [!NOTE]
    > Text that doesn't fit within the text box area shows only while the text box is selected. Text outside the text box area doesn't show in the final design of your report. Resize the text box area to show the text you would like visible.

### Format and style text in a text box

1. After you select a text box, the **Text box format** tab is displayed. From this tab you can format the font style, including font, color, size, and text decoration like bold, italics, and underline. 
    
    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-text-styles.png" alt-text="Screenshot of text styling options.":::    
1. You can format font styles at the character and line level while you're editing the text box. Or select the text box to highlight all text and format all text within the text box at once.

### Delete a text box
To delete a text box, right-click a text box and select **Remove**. Alternatively, with a text box selected press <kbd>DELETE</kbd>.

### Working with sections
1. When you add items to a paginated report, a section line appears on the first page that separates the text or image objects from your formatted table of data. The area above the section line is where items are added. The area below is where your formatted table of data is added.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-section-line.png" alt-text="Screenshot of the section line.":::

    > [!NOTE]
    > The section line only shows when text or image objects are present.

1. To move text or image objects lower on the page, move the section line down. To move the section line up, move the items up. Text objects will highlight when moving the section line.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-move-section.gif" alt-text="Animation of moving the section line.":::

    > [!NOTE]
    > To leave room for the beginning of your formatted table of data, you can't move the section line to the very bottom of the first page.

1. The page margins and section divider visibility can be turned off by going to **View** and selecting **Hide margin** and / or **Hide section divider**.

    :::image type="content" source="media/paginated-formatted-table/rdl-web-authoring-hide-margins-sections.png" alt-text="Screenshot of options to hide the section line or page margins.":::

    > [!NOTE]
    > The page margins and section line are design helpers while authoring the paginated report. They're not saved in the report and aren't visible in exported reports or while in reading view.

### Considerations and limitations when working with text
- As with other objects in a report, you can only select one text box at a time. 
- Text boxes can't be duplicated, or copied and pasted. You can highlight, copy, and paste text within text boxes. 
- You can only place text boxes above the section line within the boundaries of the print layout, even if web layout is selected. 
- Text boxes may overlap. You can't change text box layer order. The most recently added text box is on top. 
- When you enter text in a text box that's larger than the text box area, you can't select the bottom resize handle. Use the bottom corner resize handles or any other resize handles to resize the area. 

## Export your report

You can export the table before or after you save it. Paginated reports have rich export capabilities to any of the supported formats, preserving full fidelity. The exported report is saved to your default Downloads folder.

:::image type="content" source="media/paginated-formatted-table/formatted-table-export.png" alt-text="Screenshot of list of export formats available.":::

## Save your report

You can save the report to any workspace.

1. On the **File** menu, save, download, or print your report.

    :::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-file-menu.png" alt-text="Screenshot of File menu.":::

2. In **Save your report**, give your report a name and select a workspace.

    :::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-save-dialog.png" alt-text="Screenshot of Save menu.":::

After you save the report, you see a success or failure notification in the top right of the editor.

- If a report already exists where you have chosen to save, it asks you if you wish to overwrite the existing report.  
- If it succeeds, you see a link to the report. You can either follow this link or continue editing.  

After saving the report, you can preview it. Select **Reading view** on the top bar in the editor. You leave the editor experience and enter the normal paginated report viewer experience.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-reading-view.png" alt-text="Screenshot of Reading View button.":::

> [!NOTE]
> If you haven't saved the report yet, or have unsaved changes, you receive a prompt asking you to save or discard your changes before taking you to the reading view.

## Considerations and limitations

- You can create a paginated report in any workspace.
- You can't create a paginated report from Power BI semantic models based on a live connection.
- The online editor does *not* replicate all existing Power BI Report Builder functionality.  

## Related content

- [View a paginated report in the Power BI service](../../consumer/paginated-reports-view-power-bi-service.md)
