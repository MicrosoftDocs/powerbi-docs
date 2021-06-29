---
title: Use one column to sort another in a Power BI report
description: In Power BI, you can change how a visual looks by sorting it by different data fields.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'sunaraya'
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/28/2021
LocalizationGroup: Create reports
---
# Use one column to sort another in a Power BI report

When you're editing a report in Power BI Desktop and the Power BI service, you can choose a column to define the sort order of another column by setting the **Sort by column**.

Let's look at a common example. You have data from each month of the year, and it's currently sorted alphabetically. You want to sort it chronologically. 

![Sort by Column button](media/desktop-sort-by-column/power-bi-column-tools.png)

If you're reading a report, you can also change how the values in a visual are sorted. See [Change how a chart is sorted in a Power BI report](../consumer/end-user-change-sort.md) for details.

## Set the Sort by column

To set a different column to sort by, both columns need to be at the same level of granularity. For example, to sort a column of weekday *names*, you need a column that contains a *number* for each day of the week. The sort order will apply to any visual in the report that contains the sorted column. In the following example, the months are being sorted alphabetically, but we
 want them to be sorted chronologically.

1. Select the column that you want to sort, in our case, **Month**. Note that the months in the visual are sorted alphabetically. In the **Fields** pane, the **Column tools** tab becomes active.
   
    ![Active Sort by Column button, visual sorted alphabetically](media/desktop-sort-by-column/power-bi-alphabetical-sort.png)

1. Select **Sort by Column**, then select the field you want to sort the other field by, in this case, **Month Number**.

    ![Sort by Column menu, select Month Number](media/desktop-sort-by-column/power-bi-new-sort.png)

1. The visual automatically sorts in the order we want: chronologically by the month of the year.

    ![Sort by Column menu, visual sorted chronologically](media/desktop-sort-by-column/power-bi-chronological-sort.png)


<!---
This functionality is no longer active.

## Getting back to default column for sorting
You can sort by any column you'd like, but there may be times when you want the visual to return to its default sorting column. No problem. For a visual that has a sort column selected, open the **More options** menu and select that column again, and the visualization returns to its default sort column.

For example, here's our previous chart:

![Initial visualization](media/desktop-sort-by-column/sortbycolumn_6.png)

When we go back to the menu and select **SalesQuantity** again, the visual defaults to being ordered alphabetically by **Manufacturer**, as shown in the following image.

![Default sort order](media/desktop-sort-by-column/sortbycolumn_7.png)

With so many options for sorting your visuals, creating just the chart or image you want is easy.
--->

## Next steps

You might also be interested in the following articles:

* [Change how a chart is sorted in a Power BI report](../consumer/end-user-change-sort.md)
* [Use cross-report drillthrough in Power BI Desktop](desktop-cross-report-drill-through.md)
* [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
