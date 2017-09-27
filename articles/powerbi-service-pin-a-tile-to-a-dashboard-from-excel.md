<properties
   pageTitle="Pin a tile to a Power BI dashboard from Excel"
   description="Pin a tile to a Power BI dashboard from Excel on OneDrive for Business. Pin ranges, charts, tables"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   featuredVideoId="l8JoB7w0zJA"
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="09/26/2017"
   ms.author="mihart"/>

# Pin a tile to a Power BI dashboard from Excel
Before you can pin a tile from your Excel workbook, you'll connect that workbook to Power BI service (app.powerbi.com). Connecting a workbook essentially brings a linked read-only version of that workbook into Power BI service and allows you to pin ranges to dahboards. You can even pin an entire worksheet to a dashboard.  
If a workbook has been shared with you, you'll have the ability to view the tiles pinned by the owner, but not create any dashboard tiles yourself. 

For in-depth information about how Excel and Power BI work together, see [Get data from Excel workbook files](powerbi-service-excel-workbook-files.md).

Watch Will demonstrate several ways to import data from, and connect to, Excel workbooks. Then follow the step-by-step instructions below the video to try it out yourself using the [Financial sample](powerbi-service-download-the-financial-sample-workbook.md).

<iframe width="560" height="315" src="https://www.youtube.com/embed/l8JoB7w0zJA" frameborder="0" allowfullscreen></iframe>

## Connect your Excel workbook from OneDrive for Business to Power BI
When you choose **Connect**, your workbook will appear in Power BI just like it would in Excel Online. But, unlike Excel Online, you’ll have some great features to help you pin elements from your worksheets right to your dashboards.

You can’t edit your workbook in Power BI. But if you need to make some changes, you can select the pencil icon from the **Workbooks** tab of your workspace, and then choose to edit your workbook in Excel Online or open it in Excel on your computer. Any changes you make are saved to the workbook on OneDrive.


1.  Upload your workbook to your OneDrive for Business.

2. From Power BI, [connect to that workbook](powerbi-bring-in-whole-excel-files.md).

3.  In Power BI, the workbook is added to the **Workbooks** tab of your workspace.  The ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_workbookIcon.png) icon indicates this is an Excel workbook and a yellow asterisk indicates it's new.

     Changes you make to the workbook in Power BI are not saved and do not affect the original workbook on OneDrive for Business. If you sort, filter, or change values in Power BI, those changes cannot be saved or pinned. To update the workbook, select the pencil icon to open it in Excel Online. Changes to the workbook in Excel Online may take a few minutes to be updated in the tiles.     

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/power-bi-workbooks.png)

4.  Open the workbook in Power BI by selecting the workbook name.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/power-bi-opened.png)

   
## Pin a range of cells to a dashboard
One way to add a new [dashboard tile](powerbi-service-dashboard-tiles.md) is from within an Excel workbook in Power BI. Ranges can be pinned from Excel workbooks that have been saved in your OneDrive for Business or another group-shared document library. The ranges can contain data, charts, tables, PivotTables, PivotCharts, and other Excel parts.

1. Highlight the cells that you'd like to pin to a dashboard.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_selectRange.png)

2.  Select the pin ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-a-report/PBI_PinTile_Small.png) icon. 

3.  Pin the tile to an existing dashboard or to a new dashboard. 

    -   Existing dashboard: select the name of the dashboard from the dropdown.

    -   New dashboard: type the name of the new dashboard.

    ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_dashDialog1.png)

3.  Select **Pin**. A Success message (near the top right corner) lets you know the range was added, as a tile, to your dashboard. 

     ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/power-bi-go-to-dashboard.png)

4. Select **Go to dashboard**. From here you can [rename, resize, link, and move](powerbi-service-edit-a-tile-in-a-dashboard.md) the pinned visualization. By default, selecting the pinned tile opens the workbook in Power BI.

## Pin an entire table or pivot chart to a dashboard
Follow the steps above except instead of selecting a range of cells, select an entire table or pivot table.

To pin a table, select the entire range of the table and be sure to include the headers.  To pin a pivot table, be sure to include every visible part of the pivot table, including filters if used.

 ![](media/powerbi-service-pin-a-tile-to-a-dashboard-from-excel/PBI_selectTable.png)

A tile created from a table or pivot table will show the entire table.  If you add/remove/filter rows or columns in the original workbook, they will also be added/removed/filtered in the tile.

## View the workbook linked to the tile

Selecting a workbook tile opens the linked workbook in Power BI. Since the workbook file is located on the owner’s OneDrive for Business, viewing the workbook requires you have Read permissions for the workbook. If you do not have permission, you will receive an error message.  

##    Considerations and troubleshooting

Unsupported features: Power BI uses Excel Services to retrieve the workbook tiles. Therefore, since some features from Excel are not supported in Excel Services REST API, they will not be seen on tiles in Power BI. For example: Sparklines, icon set conditional formatting, and time slicers. For a full list of unsupported features see [Unsupported Features in Excel Services REST API](http://msdn.microsoft.com/library/office/ff394477.aspx)


## Next steps

[Share a dashboard that has links to an Excel workbook](powerbi-service-share-dashboard-that-links-to-excel.md)

[Get data from Excel workbooks](powerbi-service-excel-workbook-files.md)

[Dashboards in Power BI](powerbi-service-dashboards.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
