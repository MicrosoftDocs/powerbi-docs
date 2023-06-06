---
title: "Create exportable paginated reports in the Power BI service"
description: In this article, you learn how to create a paginated report using the interactive editor in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ebendinsky
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 06/06/2023
---

# Create exportable paginated reports in the Power BI service

[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../../includes/applies-yes-service-no-report-builder-no-desktop.md)]

In this article, you learn how to create and export a paginated report with all the data from your Power BI dataset easily. The feature lets you quickly create a paginated report on the web, and apply styling. You can then export it using the rich export functionality of paginated reports, which retains the applied formatting & styling.

You can use the feature to create paginated reports in any workspace in the Power BI service, including workspaces that aren't in a Power BI Premium capacity.

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../../includes/power-bi-paginated-prerequisites.md)]
- You need [Build permission for the dataset](../../connect-data/service-datasets-build-permissions.md).

## Get started

To create a paginated report from the Power BI service, you can start in one of three places:

- [In list view](#in-list-view)
- [In Data hub view](#in-data-hub-view)
- [On the Dataset details page](#on-the-dataset-details-page)

### In list view

1. Go to list view for any workspace, including My Workspace.
1. Select **More options (...)** for a Power BI dataset, then select **Create formatted table**. 

    :::image type="content" source="media/paginated-formatted-table/formatted-table-list-view-1.png" alt-text="Screenshot of Create paginated report in the Power BI service.":::

### In Data hub view

1. Go to Data hub view in the Power BI service.

1. Select **More options (...)** next to a dataset > **Create paginated report**.

    :::image type="content" source="media/paginated-formatted-table/formatted-table-data-hub-1.png" alt-text="Screenshot of Create paginated report in the Data hub.":::

### On the Dataset details page

1. Select a dataset in the Data hub view of the Power BI service.

1. Under **Visualize this data**, select **Create a report** > **Paginated report**.

    :::image type="content" source="media/paginated-formatted-table/formatted-table-dataset-details-create-report-1.png" alt-text="Screenshot of Paginated report on the Dataset details page.":::

No matter where you start, the new paginated report online editing experience opens. 

## Create a table

To create your first table, select field names in the **Data** pane on the right.  This pane gives you a table-and-column based view of the chosen dataset.  When you find a column that you wish to add to your table, select the column or drag it to **Values** section of the **Build** pane.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-fields-list.png" alt-text="Screenshot of selecting fields.":::

Give the editor a few moments to run a new query on the dataset. The formatted table shows up in the paginated report viewer to the left side of the page.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-table.png" alt-text="Screenshot of formatted table preview.":::

This viewer shows you a preview of your currently unsaved paginated report. Use this pane to make sure everything in your report looks good before editing or saving the report.

If columns are in the wrong order in the **Build** pane, don't worry.  You can easily re-order the columns in the **Build** pane columns by dragging the columns into the desired order.

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

## Edit a paginated report

If you navigate to any paginated report that you **authored online**, you have the option to edit the report within the paginated report viewer experience. This option is available in the toolbar above the viewer.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-edit.png" alt-text="Screenshot of Edit button.":::

This option takes you back to the online editor experience, where you can make changes to the report.  

> [!NOTE]
> This **Edit** button isn't the same as the **Edit** button on the **File** menu.  That **Edit** button opens Power BI Report Builder instead. **If you edit this report in Report Builder, you won't be able to edit it online anymore.**

## Add text to a paginated report
For any paginated report you **author online**, you may insert text boxes in the top section of your report to brand, title, or describe your formatted table data below. 

### Add a text box and begin typing
1. To add a text box to your report, select **Insert** and then **Text box**. <!-- IMAGE TO BE ADDED -->
1. Text boxes are inserted at the top left of the first page of your report.

    > [!NOTE]
    > When you insert a new text box or select a text box, you're immediately editing the text in the text box.

1. Begin typing within the text box.

### Select, move, and resize text boxes 
1. To select a text box, hover over a text box and a text box outline appears, select within the text box area to select the text box you are hovered over. 
1. To move a selected text box, select and drag the move indicator on the text box outline. <!-- IMAGE TO BE ADDED -->

    > [!NOTE]
    > Alternatively, select the text box itself, not the text in it, by pressing ESC. And then use the arrow keys to move a selected text box horizontally or vertically.

1. To resize a text box, select the text box itself and then select and drag any sizing handle. Alternatively, press SHIFT + arrow keys to resize horizontally or vertically.

    > [!NOTE]
    > Text that does not fit within the text box area will show only while the text box is selected. Text outside the text box area will not show in the final design of your report. Resize the text box area to show the text you would like visible.

### Format and style text in a text box

1. After selecting a text box the **Text box format** tab is displayed. From this tab you can format the font style include font, color, size, and text decoration like bold, italics, and underline. <!-- IMAGE TO BE ADDED -->
1. You can format font styles at the character and line level while editing the text box. Or select the text box to highlight all text and format all text within the text box at once.

### Delete a text box
To delete a text box, right-click a text box and select **Remove**. Alternatively, with a text box selected press <kbd>DELETE</kbd>.

### Working with sections
1. When text boxes are added to a paginated report a section line appears on the first page that separates text boxes from your formatted table of data. The area above the section line is where text boxes are added. The area below is where your formatted table of data is added. <!-- IMAGE TO BE ADDED -->

    > [!NOTE]
    > The section line only shows when text or image objects are present.

1. To move text objects lower on the page, move the section line down. To move section line up, move text objects up. Text objects will highlight when moving section <!-- IMAGE TO BE ADDED -->

    > [!NOTE]
    > In order to leave room for the beginning of your formatted table of data, the section line cannot be moved to the very bottom of the first page.

### Considerations and limitations when working with text
- Like with other objects in a report, only one text box may be selected at a time. 
- Text boxes cannot be duplicated or copied and pasted. Text within a text box can be highlighted, copied, and pasted within text boxes. 
- Text boxes can only be placed above the section line within the boundaries of the print layout, even if web layout is selected. 
- Text boxes may overlap. Text box layer order cannot be changed. The most recently added text box will be on top. 
- When text entered in a text box is larger than the text box area, the bottom resize handle cannot be selected. Use the bottom corner resize handles or any other resize handles to resize the area. 

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
- You can't create a paginated report from Power BI datasets based on a live connection.
- The online editor does *not* replicate all existing Power BI Report Builder functionality.  

## Next steps

- [View a paginated report in the Power BI service](../../consumer/paginated-reports-view-power-bi-service.md)
