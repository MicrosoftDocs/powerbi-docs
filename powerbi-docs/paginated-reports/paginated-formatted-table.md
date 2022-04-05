---
title: "Create exportable formatted data tables in the Power BI service"
description: In this article, you learn how to create a paginated report using the interactive formatted table editor in the Power BI service.
author: ebendinsky
ms.author: ebendinsky
ms.reviewer:
ms.service: powerbi
ms.subservice: 
ms.topic: how-to
ms.date: 04/04/2022
---

# Create exportable formatted data tables in the Power BI service

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-service](../includes/yes-service.md)] [!INCLUDE [yes-paginated](../includes/yes-paginated.md)] [!INCLUDE [no-desktop](../includes/no-desktop.md)] 

In this article, you learn how to export all the data from your Power BI dataset easily, while preserving data and style format. The feature lets you quickly create a paginated report on the web and apply styling. Then you can export it using the rich export functionality of paginated reports.

## Find the formatted table option

In the dataset data hub view, select **More options (...)** next to a report > **Create formatted table**.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-datahub-context-menu.png" alt-text="Screenshot of data hub context menu.":::

Select **As formatted table**.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-datahub-create-report.png" alt-text="Screenshot of data hub Create report.":::

Selecting either formatted table option above brings you to the new paginated report online editing experience called formatted table.  There are a few panes here to take a look at.

## Get started

To create your first table, use the **Fields** pane on the right.  This pane gives you a table-and-column based view of the chosen dataset.  Once you find a column that you wish to add to your table, select the column or drag it into the pane labelled **Build**.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-fields-list.png" alt-text="Screenshot of selecting fields.":::

Give the editor a few moments to run a newly created query on the dataset. Then you see the formatted table show up on the paginated report viewer to the left side of the page.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-table.png" alt-text="Screenshot of Formatted Table Preview.":::

This viewer shows you a preview of your currently unsaved paginated report. Use this pane to make sure everything in your report looks good before tweaking or saving the report.

If you see that columns are in the wrong order in the **Build** pane, don't worry.  You can easily re-order the **Build** pane columns by dragging the columns in the **Build** pane into the desired order.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-build-pane-selected-fields.png" alt-text="Screenshot of Draggable Items.":::

When you select a field, we use the default aggregate set on the field. You can change the aggregate behavior. Select the arrow next to the field item in the **Build** pane.

The **Build** pane has other customization options for you to create a better looking table.  To access these options, select the formatting tab at the top of the **Build** pane.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-formatting-pane.png" alt-text="Screenshot of Styling Options.":::

Once you have worked with your table to the point you would like to save, download, or print it, use the **File** menu to perform any of those options.  These should be familiar if you have used these options previously in a Power BI report.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-file-menu.png" alt-text="Screenshot of File menu.":::
:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-save-dialog.png" alt-text="Screenshot of Save menu.":::

After you save the report, you see a notification in the top right of the editor with the success or failure.  If it failed, it gives you a message, with the reason for the failure.  If there is already an existing report where you have chosen to save, it asks you if you wish to overwrite the existing report at that location.  If successful, you see a link to the report.  You can either follow this link or continue editing.  Once you've saved it, you see another option in the **File** menu.  This **Save As** option allows you to resave the current formatted table elsewhere.

At any point after saving the report you may preview the report using the **Reading Mode** option on the top bar within the editor.  This will allow you to leave the editor experience and enter the normal paginated report viewer experience.

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-reading-view.png" alt-text="Screenshot of Reading View button.":::

> [!NOTE]
> If you have not saved the report yet, or have unsaved changes, you will instead receive a prompt asking you to save or discard your changes before taking you to the reading view.  

## Edit a formatted table

If you navigate to any formatted table that has been authored online, you will have the option within the paginated report viewer experience to edit the report.  This option is available in the toolbar above the viewer. 

:::image type="content" source="media/paginated-formatted-table/power-bi-formatted-table-edit.png" alt-text="Screenshot of Edit button.":::

This will take you back to the formatted table editor experience and allow you to affect any changes you wish to the report.  

> [!NOTE]
> This Edit button is not to be confused with the Edit button on the **File** menu.  That **Edit** button will instead open Power BI Report Builder, and isn't backwards compatible with the online formatted table experience.

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)