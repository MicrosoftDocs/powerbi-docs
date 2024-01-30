---
title: How to pin a tile to a Power BI dashboard from Excel
description: Learn how to pin a tile to a Power BI dashboard from Excel on OneDrive for work or school with pin ranges, charts, and tables.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: video-l8JoB7w0zJA
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/06/2023
LocalizationGroup: Dashboards
---

# Pin a tile to a Power BI dashboard from Excel

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before you can pin a tile from your Excel workbook, you must connect that workbook to the Power BI service. Connecting a workbook brings a linked read-only version of that workbook into the Power BI service and allows you to pin ranges to dashboards. You can even pin an entire worksheet to a dashboard.
If a workbook has been shared with you, you can view the tiles pinned by the owner but can't create any dashboard tiles yourself.

For in-depth information about how Excel and Power BI work together, see [Get data from Excel workbook files](/power-bi/connect-data/service-excel-workbook-files).

Watch Will demonstrate several ways to import data from, and connect to, Excel workbooks.

> [!NOTE]
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.youtube.com/embed/l8JoB7w0zJA]

## Connect your Excel workbook from OneDrive for work or school to Power BI

When you choose **Connect**, your workbook appears in Power BI just like it would in Excel Online. However, unlike Excel Online, you have some great features to help you pin elements from your worksheets right to your dashboards.

You can’t edit your workbook in Power BI, but if you need to make some changes, you can select **Edit** from the **Workbooks** tab of your workspace. Then choose to edit your workbook in Excel Online or open it in Excel on your computer. Any changes you make are saved to the workbook on OneDrive.

1. Upload your workbook to your OneDrive for work or school.

1. From Power BI, [connect to that workbook](../connect-data/service-excel-workbook-files.md) by going to **My workspace** and selecting **Upload > OneDrive - Business** and navigating to the location where you saved the Excel file. Select the file and choose **Upload**.

    :::image type="content" source="media/service-dashboard-pin-tile-from-excel/power-bi-connect.png" alt-text="Screenshot of My workspace, highlighting Upload and OneDrive for business.":::

1. In Power BI, the workbook is added to your workspace. The :::image type="icon" source="media/service-dashboard-pin-tile-from-excel/pbi_workbookicon.png"::: icon indicates an Excel workbook.

    :::image type="content" source="media/service-dashboard-pin-tile-from-excel/power-bi-workbooks.png" alt-text="Screenshot showing Excel workbooks in a workspace.":::

1. Open the workbook in Power BI by selecting the workbook name.

    Changes you make to the workbook in Power BI aren't saved and don't affect the original workbook on OneDrive for work or school. If you sort, filter, or change values in Power BI, those changes can't be saved or pinned. If you need to save changes, select **Edit** from the upper-right corner to open it for editing in Excel Online or Excel. Changes made this way might take a few minutes to update in the tiles on the dashboards.

    :::image type="content" source="media/service-dashboard-pin-tile-from-excel/power-bi-opened.png" alt-text="Screenshot showing Excel Online in Power BI.":::

## Pin a range of cells to a dashboard

One way to add a new [dashboard tile](../consumer/end-user-tiles.md) is from within an Excel workbook in Power BI. Ranges can be pinned from Excel workbooks that have been saved in your OneDrive for work or school or another group-shared document library. The ranges can contain data, charts, tables, PivotTables, PivotCharts, and other Excel parts.

1. Highlight the cells that you'd like to pin to a dashboard.

    :::image type="content" source="media/service-dashboard-pin-tile-from-excel/pbi_selectrange.png" alt-text="Screenshot showing selected cells in an Excel workbook.":::

1. Select the pin :::image type="icon" source="../media/pin-icon.png"::: icon.
1. Pin the tile to an existing dashboard or to a new dashboard.

   * Existing dashboard: select the name of the dashboard from the dropdown.
   * New dashboard: type the name of the new dashboard.

    :::image type="content" source="media/service-dashboard-pin-tile-from-excel/pbi_dashdialog1.png" alt-text="Screenshot showing the Pin to dashboard dialog.":::

1. Select **Pin**. A success message near the top right corner lets you know the range was added as a tile to your dashboard.

    :::image type="content" source="media/service-dashboard-pin-tile-from-excel/power-bi-pin.png" alt-text="Screenshot showing the pinned to dashboard dialog.":::

1. Select **Go to dashboard**. From here, you can [create or edit a dashboard tile](service-dashboard-edit-tile.md). By default, selecting the pinned tile opens the workbook in Power BI.

## Pin an entire table or PivotTable to a dashboard

Follow the previous steps except instead of selecting a range of cells, select an entire table or PivotTable.

To pin a table, select the entire range of the table and be sure to include the headers. To pin a PivotTable, be sure to include every visible part of the PivotTable, including filters if used.

 :::image type="content" source="media/service-dashboard-pin-tile-from-excel/pbi_selecttable.png" alt-text="Screenshot of an Excel table with cells selected.":::

A tile created from a table or PivotTable shows the entire table. If you add, remove, or filter rows or columns in the original workbook, the rows or columns are also added, removed, or filtered in the tile.

## View the workbook linked to the tile

Selecting a workbook tile opens the linked workbook in Power BI. Since the workbook file is located on the owner’s OneDrive for work or school, viewing the workbook requires you to have read permissions for the workbook. If you don't have permission, you receive an error message.

> [!NOTE]
> The animation might use earlier versions of the Power BI service.

 :::image type="content" source="media/service-dashboard-pin-tile-from-excel/pin-from-excel.gif" alt-text="Animation of navigation through Excel Online workbook.":::

## Considerations and troubleshooting

Power BI uses Excel Services to retrieve the workbook tiles. Therefore, since some features from Excel aren't supported in Excel Services REST API, they aren't seen on tiles in Power BI, for example: Sparklines, icon set conditional formatting, and time slicers. For a full list of unsupported features, see [Unsupported Features in Excel Services REST API](/sharepoint/dev/general-development/unsupported-features-in-excel-services-rest-api).

## Related content

* [Share a Power BI dashboard that links to an Excel file in OneDrive](../collaborate-share/service-share-dashboard-that-links-to-excel-onedrive.md)
* [Get data from Excel workbook files](../connect-data/service-excel-workbook-files.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
