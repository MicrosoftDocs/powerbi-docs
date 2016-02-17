<properties
   pageTitle="Pin a tile to a Power BI dashboard from Excel"
   description="Pin a tile to a Power BI dashboard from Excel on OneDrive for Business. Pin ranges, charts, tables"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/16/2016"
   ms.author="mihart"/>

# Pin a tile to a Power BI dashboard from Excel

## Pin a range from an Excel workbook to a dashboard

﻿One way to add a new [dashboard tile](powerbi-service-dashboard-tiles.md) is from within an Excel workbook. Ranges can be pinned from Excel workbooks that have been saved in your OneDrive for Business or another group-shared document library. The ranges can contain data, charts, tables, PivotTables, PivotCharts, and other Excel parts.


>**NOTE**:  You can view, but not pin, tiles from workbooks that have been shared with you.

## Connect your Excel workbook from OneDrive for Business to Power BI

1.  Upload your workbook to your OneDrive for Business.

2. From Power BI, [connect to that workbook](powerbi-bring-in-whole-excel-files.md).

3.  In Power BI, the workbook is listed in the left navigation pane under **Reports**. The ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_workbookIcon.png) icon indicates this is an Excel workbook and the yellow asterisk indicates it's new.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_pinnedFromExcel.png)

    Open the workbook in Power BI by selecting the report name.

>**NOTE:**  Changes you make to the workbook in Power BI are not saved and do not affect the original workbook on OneDrive for Business. If you sort, filter, or change values in Power BI, those changes cannot be saved or pinned. To update the workbook, open it in Excel Online by selecting the ellipses and choosing **Edit**. Changes to the workbook may take a few minutes to be updated in the tiles.     


## Pin a range to a dashboard

1. Highlight the cells that you'd like to pin to a dashboard.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_selectRange.png)

2.  Select the pin ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-a-report/PBI_PinTile_Small.png) icon. 

3.  Pin the tile to an existing dashboard or to a new dashboard. 

    -   Existing dashboard: select the name of the dashboard from the dropdown.

    -   New dashboard: type the name of the new dashboard.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_dashDialog1.png)

3.  Select **Pin**.

    A Success message (near the top right corner) lets you know the range was added, as a tile, to your dashboard.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_pinnedToDash1.png)

4.  From the navigation pane, select the dashboard with the new tile. There, you can [rename, resize, link, and move](powerbi-service-edit-a-tile-in-a-dashboard.md) the pinned visualization.

## Pin an entire table or pivot chart to a dashboard

1.  To pin a table or pivot table, select the entire range of the table.

  - For tables, make sure to include the headers.

  - For pivot tables, make sure to include every visible part of the pivot table, including filters if used.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_selectTable.png)

2. Follow steps 2-4 above.

>**NOTE**: A tile created from a table or pivot table will show the entire table.  If you add/remove/filter rows or columns in the original workbook, they will also be added/removed/filtered in the tile.

## View the workbook linked to the tile

Clicking a workbook tile opens the linked workbook. Since the workbook file is located on the owner’s OneDrive for Business, viewing the workbook requires you have Read permissions for the workbook. If you do not have permission to view the file, you will receive an error message. For more information, see [Dashboard tiles in Power BI](powerbi-service-dashboard-tiles.md)

>NOTE: Unsupported features: Power BI uses Excel Services to retrieve the workbook tiles. Therefore, since some features from Excel Desktop are not supported in Excel Services REST API, they will not be seen on tiles in Power BI. For example: Sparklines, icon set conditional formatting, time slicers. For a full list of unsupported features see [Unsupported Features in Excel Services REST API](http://msdn.microsoft.com/library/office/ff394477.aspx)


## See also

[Share a dashboard that has links to an Excel workbook](powerbi-service-share-dashboard-that-links-to-excel.md)

[Bring whole Excel files into Power BI](powerbi-bring-in-whole-excel-files.md)

[Reports in Power BI](powerbi-service-reports.md)

[Power BI Preview - Basic Concepts](powerbi-service-basic-concepts.md)

[Dashboards in Power BI Preview](powerbi-service-dashboards.md)
