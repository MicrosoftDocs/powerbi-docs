<properties 
   pageTitle="Reports in the Power BI mobile app for Windows 10"
   description="Reports in the Power BI mobile app for Windows 10"
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/13/2016"
   ms.author="maggies"/>
# Reports in the Power BI mobile app for Windows 10

A report is an interactive view of your data, with visuals representing different findings and insights from that data. You [create and customize reports in the Power BI service (https://powerbi.com)](powerbi-service-reports.md).

Then you view and interact with those reports in the [Power BI mobile app for Windows 10](powerbi-mobile-win10phone-app-get-started.md).

## Open a Power BI report

-   In **My workspace** or in a group, tap a report.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppReptsMenu.png)

    >**Note**: If you have [imported whole Excel files into Power BI](powerbi-bring-in-whole-excel-files.md), when you tap them in the app, they open in a browser window.

-   Or: On a dashboard, tap a tile, then tap the Open Report icon ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_Win10app_OpenRptIcon.png).

    >**Note**: Not all tiles can open in a report. For example, tiles you create by asking a question in the Q&A box don't open reports when you tap them.
	Also, to open the sample reports, you need to sign in to Power BI.

## See other pages in a Power BI report

-   Tap the tabs at the bottom of the page. 

## Sort a chart in a Power BI report

1.  Tap the chart. 

2.  Tap the ellipsis (...) in the upper-right corner, tap the **Sort by** arrow, then tap the field name.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppSort.png)

3.  To reverse the sort order, tap **A\>Z** or **Z\>A**. 

## Cross-filter and highlight a Power BI report page

-   Tap a bar or column in a chart.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppHighlight.png)

    Tapping the three bubbles in the bubble chart highlights related values in the other charts. Because the bar chart in the upper-right shows percentages, some highlighted values are larger than the total values and some are smaller. 

## Filter a Power BI report

You can always filter individual visuals in a Power BI report by using the fields in the visual itself as filters. You can also filter whole pages in a report, if you or the report creator has [added filters to the page](powerbi-service-add-a-filter-to-a-report.md) in the Power BI service ([https://powerbi.com](http://powerbi.com/)). You can also add other fields to a visual as filters in the Power BI service. 

> **Note**  If you don't have Edit permission for a report, you can change the filters, but you can't save those changes. 

1. In a report, expand the Filters pane, if it's collapsed.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppCollapsFilter.png)

    If the report creator has set page-level filters, when you select a visual you see filters for the page and the visual.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinApp_PgVizFilter.png)

2. Select check boxes for the values you want.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinApp_PageFilter.png)

3. Or you can switch the filtering mode. Tap **Advanced filtering** ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppAdvFilter.png) at the end of the list of values, to select values using expressions instead.

 -   Number fields offer expressions such as **is less than**, **is greater than**, **is not**, and **is blank**.

        ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppAdvFilterOptions.png)

 -   Text fields offer expressions such as **contains**, **doesn't start with**, and **is not**.

4.  To add other fields to the Filters pane, go to the Power BI service ([https://powerbi.com](http://powerbi.com/)), [add filters to the page](powerbi-service-add-a-filter-to-a-report.md), and save the report.

## Drill down and up in a chart

You can drill down in some charts to see the values that make up one part of the chart. To [add drill down to a visual](powerbi-service-drill-down-in-a-visualization.md), edit the report in the Power BI service ([https://powerbi.com](http://powerbi.com/)).

-   Double-tap a bar, column, or other part of a chart to drill into the details for that part — in this case, the red **FD-02 **bubble.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppDrillDown.png)

-   To drill back up, tap and hold or right-click the chart, and tap the up arrow in the upper-right corner.

    ![](media/powerbi-mobile-reports-in-the-windows-app/PBI_WinAppDrillBackUp.png)

### See also

[Get started with the Power BI app for Windows 10 devices](powerbi-service-windows-app-get-started.md).

