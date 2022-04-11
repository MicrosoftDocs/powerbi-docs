---
title: "Create exportable formatted data tables in the Power BI service"
description: In this article, you learn how to create a paginated report using the interactive formatted table editor in the Power BI service.
author: ebendinsky
ms.author: ebendinsky
ms.reviewer:
ms.service: powerbi
ms.subservice: 
ms.topic: how-to
ms.date: 04/11/2022
---

# Create exportable formatted data tables in the Power BI service

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [no-paginated](../includes/no-paginated.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)]

In this article, you learn how to export all the data from your Power BI dataset easily, while preserving data and style format. The feature lets you quickly create a paginated report on the web and apply styling. Then you can export it using the rich export functionality of paginated reports.

You can create paginated reports by using the formatted table feature in all workspaces, whether Premium or not.

## Get started

In Dataset hub view, select **More options (...)** next to a dataset > **Create formatted table**.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-datahub-context-menu.png" alt-text="Screenshot of Dataset hub context menu.":::

Select **As formatted table**.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-datahub-create-report.png" alt-text="Screenshot of Dataset hub Create report.":::

The new paginated report online editing experience opens. It's called formatted table.  There are a few panes here to take a look at.

## Create a table

To create your first table, select fields names in the **Fields** pane on the right.  This pane gives you a table-and-column based view of the chosen dataset.  When you find a column that you wish to add to your table, select the column or drag it into the pane labelled **Build**.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-fields-list.png" alt-text="Screenshot of selecting fields.":::

Give the editor a few moments to run a newly created query on the dataset. The formatted table shows up in the paginated report viewer to the left side of the page.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-table.png" alt-text="Screenshot of formatted table preview.":::

This viewer shows you a preview of your currently unsaved paginated report. Use this pane to make sure everything in your report looks good before editing or saving the report.

If columns are in the wrong order in the **Build** pane, don't worry.  You can easily re-order the columns in the **Build** pane columns by dragging the columns into the desired order.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-build-pane-selected-fields.png" alt-text="Screenshot of dragging items.":::

When you select a field, we use the default aggregate set on the field. You can change the aggregate behavior. Select the arrow next to the field item in the **Build** pane.

The **Build** pane has other customization options for you to create a better looking table.  To access these options, select the **Format** tab at the top of the **Build** pane.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-formatting-pane.png" alt-text="Screenshot of styling options.":::

On the **File** menu, save, download, or print your report.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-file-menu.png" alt-text="Screenshot of File menu.":::

In **Save your report**, give your report a name and select a workspace.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-save-dialog.png" alt-text="Screenshot of Save menu.":::

After you save the report, you see a success or failure notification in the top right of the editor.

- If it failed, the message gives the reason for the failure. 
- If a report already exists where you have chosen to save, it asks you if you wish to overwrite the existing report.  
- If it succeeded, you see a link to the report.  You can either follow this link or continue editing.  

After saving the report you can preview it. Select **Reading Mode** on the top bar in the editor. You leave the editor experience and enter the normal paginated report viewer experience.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-reading-view.png" alt-text="Screenshot of Reading View button.":::

> [!NOTE]
> If you haven't saved the report yet, or have unsaved changes, you receive a prompt asking you to save or discard your changes before taking you to the reading view.

## Edit a formatted table

If you navigate to any formatted table that you authored online, you have the option to edit the report within the paginated report viewer experience. This option is available in the toolbar above the viewer.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-edit.png" alt-text="Screenshot of Edit button.":::

This option takes you back to the formatted table editor experience, where you can make changes to the report.  

> [!NOTE]
> This **Edit** button isn't the same as the **Edit** button on the **File** menu.  That **Edit** button opens Power BI Report Builder instead. If you edit this report in Report Builder, you won't be able to edit it in the online formatted table experience anymore.

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)