---
title: "Create exportable paginated reports in the Power BI service"
description: In this article, you learn how to create a paginated report using the interactive editor in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ebendinsky
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 02/17/2023
---

# Create exportable paginated reports in the Power BI service

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)]

In this article, you learn how to create and export a paginated report with all the data from your Power BI dataset easily. The feature lets you quickly create a paginated report on the web, and apply styling. You can then export it using the rich export functionality of paginated reports, which retains the applied formatting & styling.

You can use the feature to create paginated reports in any workspace in the Power BI service, including workspaces that aren't in a Power BI Premium capacity.

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]
- You need [Build permission for the dataset](../connect-data/service-datasets-build-permissions.md).

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

To create your first table, select field names in the **Fields** pane on the right.  This pane gives you a table-and-column based view of the chosen dataset.  When you find a column that you wish to add to your table, select the column or drag it to **Values** section of the **Build** pane.

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
- You can't create a paginated from Power BI datasets based on a live connection.
- The online editor does **NOT** replicate all existing Power BI Report Builder functionality.  

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)
