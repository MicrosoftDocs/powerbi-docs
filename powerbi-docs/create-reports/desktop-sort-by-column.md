---
title: Sort one column by another column in Power BI
description: Learn how to change the look of a Power BI visual by sorting it by data fields. Use one column to define the sort order of another column.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'sunaraya'
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/11/2022
LocalizationGroup: Create reports
#customer intent: 
---


# Sort one column by another column in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

When you're editing a report in Power BI, you can choose a column to define the sort order of another column.
Here's a common example. You have a Month Name column, and when you add it to a visual, the months are being sorted alphabetically: April, August, December, February, and so on. However, you want them to be sorted chronologically. This article shows how to set the sort order of one column by a different column, in Power BI Desktop or in the Power BI service.

:::image type="content" source="media/desktop-sort-by-column/power-bi-alphabetical-sort-chart.png" alt-text="Screenshot of a line chart in Power BI Desktop.":::

> [!NOTE]
> When you're reading a report, you can also change how the values in a visual are sorted. See [Change how a chart is sorted in a Power BI report](../consumer/end-user-change-sort.md) for details.

## Set the column to use for sorting

To set a different column to sort by in Power BI Desktop, both columns need to be at the same level of granularity. For example, to sort a column of month names correctly, you need a column that contains a number for each month. The sort order applies to any visual in the report that contains the sorted column. In the following example, the months are sorted alphabetically, but they should be sorted chronologically.

1. Select the column that you want to sort, in this case, **Month**. Months in the visual are sorted alphabetically. In the **Fields** pane, the **Column tools** tab becomes active.

   :::image type="content" source="media/desktop-sort-by-column/power-bi-alphabetical-sort.png" alt-text="Screenshot of a Power BI Desktop chart with months. The Column tools tab is active, and the Sort by Column button is highlighted.":::

1. Select **Sort by Column**, then select the field you want to sort the other field by, in this case, **Month Number**.

:::image type="content" source="media/desktop-sort-by-column/power-bi-new-sort.png" alt-text="Screenshot of a chart with the months sorted alphabetically. The Sort by Column button is called out. In a menu below it, Month Number is highlighted.":::

1. The visual automatically sorts chronologically by the order of months in a year.

   :::image type="content" source="media/desktop-sort-by-column/power-bi-chronological-sort.png" alt-text="Screenshot of a line chart in Power BI Desktop with the months sorted chronologically.":::

## Set a different column to sort

To set a different column to sort by in the Power BI service, both columns need to be at the same level of granularity. For example, to sort a column of month *names*, you need a column that contains a *number* for each month. In the following example, the months are being sorted alphabetically, but they should be sorted chronologically.

1. On the canvas, select the visual. Then locate the **Month Number** field in the **Fields** pane.

   :::image type="content" source="media/desktop-sort-by-column/service-month-number-field.png" alt-text="Screenshot of the Visualizations and Fields panes in the Power BI service. In the Fields pane, the Month Number field is highlighted.":::

1. In the **Visualizations** pane, in the **Fields** section, locate the **Tooltip** fields bucket.

:::image type="content" source="media/desktop-sort-by-column/service-tooltips-fields-bucket.png" alt-text="Screenshot of the Power BI service Visualizations and Fields panes.":::

1. Drag the **Month Number** field from the **Fields** pane to the **Tooltip** fields bucket in the **Visualization** pane.

   :::image type="content" source="media/desktop-sort-by-column/service-drag-month-number.png" alt-text="Screenshot of the Power BI service. In the Visualizations pane, the Tooltips fields bucket contains the Month Number field and is highlighted.":::

1. In the upper-right corner of the visual, select **More options**. Select **Sort axis**, and then select **Month Number**.

   :::image type="content" source="media/desktop-sort-by-column/service-sort-month-number-ascending.png" alt-text="Screenshot of the Power BI service. The More options menu is visible, with the Sort axis and Month Number highlighted.":::

   Power BI sorts the visual chronologically by the order of months in a year.

   :::image type="content" source="media/desktop-sort-by-column/service-line-chart-month-number-sort.png" alt-text="Screenshot of a line chart in the Power BI service with the months sorted chronologically.":::

1. The **Month Number** is now visible in the visual's default tooltip.

   :::image type="content" source="media/desktop-sort-by-column/service-line-chart-default-tooltip.png" alt-text="Screenshot of a line chart in the Power B I service. A tooltip is visible. The tooltip contains a Month Number label and value.":::

   If you don't want the tooltip to contain the **Month Number**, use a custom tooltip that doesn't include that value. To learn how to create a custom tooltip, see [Create tooltips based on report pages in Power BI Desktop](desktop-tooltips.md).

   :::image type="content" source="media/desktop-sort-by-column/service-line-chart-custom-tooltip.png" alt-text="Screenshot of a line chart in the Power B I service. A custom tooltip is visible that contains a month and sales value, but no month number value.":::

---

<!---
This functionality is no longer active.

## Getting back to default column for sorting
You can sort by any column you'd like, but there may be times when you want the visual to return to its default sorting column. For a visual that has a sort column selected, open the **More options** menu and select that column again. The visualization returns to its default sort column.

For example, here's the previous chart:

![Initial visualization](media/desktop-sort-by-column/sortbycolumn_6.png)

Go to the menu and select **SalesQuantity** again, the visual defaults to being ordered alphabetically by **Manufacturer**, as shown in the following image.

![Default sort order](media/desktop-sort-by-column/sortbycolumn_7.png)

With so many options for sorting your visuals, creating just the chart or image you want is easy.
--->

## Related content

You might also be interested in the following articles:

* [Change how a chart is sorted in a Power BI report](../consumer/end-user-change-sort.md)
* [Use cross-report drillthrough in Power BI Desktop](desktop-cross-report-drill-through.md)
* [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
