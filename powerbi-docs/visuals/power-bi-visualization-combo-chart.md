---
title: Combo chart in Power BI
description: This tutorial about combo charts explains when to use them and how to build them in the Power BI service and Desktop.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.custom: video-lnv66cTZ5ho pbibetadocbug
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 10/01/2021
LocalizationGroup: Visualizations
---
# Create and use combo charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI, a combo chart is a single visualization that combines a line chart and a column chart. Combining the 2 charts into one lets you make a quicker comparison of the data.

Combo charts can have one or two Y axes.

## When to use a Combo chart

Combo charts are a great choice:

* when you have a line chart and a column chart with the same X axis.
* to compare multiple measures with different value ranges.
* to illustrate the correlation between two measures in one visualization.
* to check whether one measure meet the target which is defined by another measure
* to conserve canvas space.

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

### Prerequisites

This tutorial uses the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** > **Open report**

1. Find your copy of the **Retail Analysis Sample PBIX file**

1. Open the **Retail Analysis Sample PBIX file** in report view :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

## Create a basic, single-axis, Combo Chart

Watch Will create a combo chart using the Sales and Marketing sample.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

<iframe width="560" height="315" src="https://www.youtube.com/embed/lnv66cTZ5ho?list=PL1N57mwBHtN0JFoKSR0n-tBkUJHeMP2cP" frameborder="0" allowfullscreen></iframe>  

<a name="create"></a>

1. Start on a blank report page and create a column chart that displays this year's sales and gross margin by month.

   a.  From the Fields pane, select **Sales** \> **This Year Sales** > **Value**.

   b.  Drag **Sales** \> **Gross Margin This Year** to the **Value** well.

   c. Select **Time** \> **FiscalMonth** to add it to the **Axis** well.

   :::image type="content" source="media/power-bi-visualization-combo-chart/combotutorial1new.png" alt-text="Combo tutorial example.":::

1. Select **More options** (...) in the upper-right corner of the visualization, and select **Sort by > FiscalMonth**. To change the sort order, select the ellipsis again and choose either **Sort ascending** or **Sort descending**. For this example, use **Sort ascending**.

1. Convert the column chart to a combo chart. There are two combo charts available: **Line and stacked column** and **Line and clustered column**. With the column chart selected, from the **Visualizations** pane select the **Line and clustered column chart**.

   :::image type="content" source="media/power-bi-visualization-combo-chart/converttocombo-new2.png" alt-text="Convert combo chart example.":::

1. From the **Fields** pane, drag **Sales** \> **Last Year Sales** to the **Line Values** bucket.

   :::image type="content" source="media/power-bi-visualization-combo-chart/linevaluebucket.png" alt-text="Line values area showing Last Year Sales.":::

   Your combo chart should look something like this:

   :::image type="content" source="media/power-bi-visualization-combo-chart/combochartdone-new.png" alt-text="Combo chart done example.":::

## Create a combo chart with two axes

In this task, we'll compare gross margin and sales.

1. Create a new line chart that tracks **Gross Margin Last Year %** by **FiscalMonth**. Select the ellipsis to sort it by **FiscalMonth** and choose **Sort ascending**.
  
   In January GM% was 35%, peaked at 45% in April, dropped in July and peaked again in August. Will we see a similar pattern in sales last year and this year?

   :::image type="content" source="media/power-bi-visualization-combo-chart/combo1-new.png" alt-text="Combo chart example sales.":::

1. Add **This Year Sales > Value** and **Last Year Sales** to the line chart. The scale of **Gross Margin Last Year %** is much smaller than the scale of **Sales** which makes it difficult to compare.

   :::image type="content" source="media/power-bi-visualization-combo-chart/flatline-new.png" alt-text="Combo chart flatline example.":::

1. To make the visual easier to read and interpret, convert the line chart to a **Line and stacked column chart**.

   :::image type="content" source="media/power-bi-visualization-combo-chart/converttocombo-new.png" alt-text="Convert to combo chart example.":::

1. Drag **Gross Margin Last Year %** from **Column Values** into **Line Values**. Power BI creates two axes, thus allowing the datasets to be scaled differently; the left measures sales dollars and the right measures percentage. And we see the answer to our question; yes, we do see a similar pattern.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-clustered-combo.png" alt-text="Cluster combo chart example.":::

## Add titles to the axes

1. Select the paint roller icon :::image type="icon" source="media/power-bi-visualization-combo-chart/power-bi-paintroller.png"::: to open the Formatting pane.
1. Select the down arrow to expand the **Y-axis** options.
1. For **Y-Axis (Column)**, set **Position** to **Left**, set **Title** to **On**, **Style** to  **Show title only**, and **Display units** as **Millions**.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-open-y.png" alt-text="Combo chart open y example.":::

1. Under **Y-Axis (Column)**, scroll down until you see **Show secondary**. Because there are so many options for the Y axes, you may have to use both scrollbars. The Show secondary section displays options for formatting the line chart portion of the combo chart.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-secondary.png" alt-text="Combo chart secondary example.":::

1. For **Y-Axis (Line)**, leave **Position** as **Right**, turn **Title** to **On**, and leave **Style** as **Show title only**.

   Your combo chart now displays dual axes, both with titles.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-2-titles.png" alt-text="Combo chart titles example.":::

1. Optionally, modify the text font, size, and color and set other formatting options to improve the display and readability of the chart.

From here you might want to:

* [Add the combo chart as a dashboard tile](../create-reports/service-dashboard-tiles.md).
* Save the report.
* [Make the report more accessible for people with disabilities](../create-reports/desktop-accessibility-overview.md).

## Cross-highlighting and cross-filtering

Highlighting a column or line in a combo chart cross-highlights and cross-filters the other visualizations on the report page... and vice versa. Use [visual interactions](../create-reports/service-reports-visual-interactions.md) to change this default behavior.

## Considerations and limitations

Depending on the size of your combo chart, the data labels may or may not display.  If you don't see data labels, resize the combo chart. 

## Next steps

[Doughnut charts in Power BI](power-bi-visualization-doughnut-charts.md)

[Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
