---
title: Combo chart in Power BI
description: This tutorial about combo charts explains when to use them and how to build them in the Power BI service and Desktop.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'mihart'
ms.custom: video-lnv66cTZ5ho, pbibetadocbug, sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 06/30/2022
LocalizationGroup: Visualizations
---
# Create and use combo charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI, a combo chart is a single visualization that combines a line chart and a column chart. Combining the two charts into one lets you make a quicker comparison of the data.

Combo charts can have one or two Y axes.

## When to use a combo chart

Combo charts are a great choice:

* when you have a line chart and a column chart with the same X axis.
* to compare multiple measures with different value ranges.
* to illustrate the correlation between two measures in one visualization.
* to check whether one measure meets the target defined by another measure
* to conserve canvas space.

## How to create a combo chart  

<a name="create"></a>

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity.

# [Power BI Desktop](#tab/powerbi-desktop)

To follow along, use the [Retail Analysis sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix).

1. From the upper left section of the menubar, select **File** > **Open report**.

1. Find your copy of the **Retail Analysis Sample PBIX file**.

1. Open the **Retail Analysis Sample PBIX file** in report view. :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-report-view.png":::

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

# [Power BI service](#tab/powerbi-service)

To follow along, use the [Retail Analysis sample](../create-reports/sample-retail-analysis.md).

1. On the Home page of the Power BI service, scroll down to **Getting started with Power BI** and select **Sample reports**.

    :::image type="content" source="media/power-bi-visualization-combo-chart/get-data-samples.png" alt-text="Screenshot of Discover content link to Samples.":::

1. Choose **Retail Analysis Sample**. Power BI loads the sample semantic model.

1. From the menubar, select **Edit** :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-edit-icon.png":::.

1. Select :::image type="icon" source="media/power-bi-visualization-kpi/power-bi-yellow-tab.png"::: to add a new page.

---

## Create a basic single-axis combo chart

1. Start on a blank report page and create a column chart that displays this year's sales and gross margin by month.

   a. From the Fields pane, select **Sales** \> **This Year Sales** > **Value**.

   b. Select **Sales** \> **Gross Margin This Year** and drag it to the **Y-axis** well.

   c. Select **Time** \> **FiscalMonth** and drag it to the **X-axis** well.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-column-chart-values.png" alt-text="Screenshot of the initial column chart values.":::

1. The new visualization is similar to this one.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-column-chart-visualization.png" alt-text="Screenshot of the column chart visualization.":::

1. In the upper-right corner of the visual, select the **More options** ellipsis (...) and select **Sort axis** \> **FiscalMonth**.

    :::image type="content" source="media/power-bi-visualization-kpi/power-bi-sort-by-fiscal-month.png" alt-text="Screenshot of the More options (ellipsis) menu expanded with Sort axis and FiscalMonth.":::

1. Select the ellipsis again and choose **Sort axis** \> **Sort ascending**.

1. Convert the column chart to a combo chart. There are two combo charts available: **Line and stacked column** and **Line and clustered column**. With the column chart selected, from the **Visualizations** pane select the **Line and clustered column chart**.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-line-and-clustered-column-chart-icon.png" alt-text="Screenshot of the line and clustered column chart icon in the Visualizations pane.":::

1. From the **Fields** pane, drag **Sales** \> **Last Year Sales** to the **Line y-axis** bucket.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-combo-chart-fields.png" alt-text="Screenshot of combo chart fields.":::

   Your combo chart should look something like this:

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-combo-chart-visualization.png" alt-text="Screenshot of the completed single-axis combo chart visualization.":::

## Create a combo chart with two axes

In this task, we compare gross margin and sales.

1. Create a new line chart that tracks **Gross Margin Last Year %** by **FiscalMonth**. 

1. Select the ellipsis to sort it by **FiscalMonth**, then select the ellipsis again and choose **Sort axis** \> **Sort ascending**.
  
1. In January, GM% was 35%, peaked at 45% in April, dropped in July and peaked again in August. Will we see a similar pattern in sales last year and this year?

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-gross-margin-line-chart.png" alt-text="Line chart showing last year's gross margin percentage.":::

1. Add **This Year Sales** \> **Value** and **Last Year Sales** to the line chart. The scale of **Gross Margin Last Year %** is much smaller than the scale of **Sales** which makes it difficult to compare.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-line-chart-scales.png" alt-text="Line chart showing Values, Sales, and Gross Margin percentage at the same scale.":::

1. To make the visual easier to read and interpret, convert the line chart to a **Line and stacked column chart**.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-line-and-stacked-column-chart-icon.png" alt-text="Icon for Line and stacked column chart.":::

1. Drag **Gross Margin Last Year %** from **Column y-axis** into **Line y-axis**. 

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-line-and-stacked-column-chart-fields.png" alt-text="Screenshot of combo chart fields showing Line y-axis field.":::

1. Power BI creates two axes, thus allowing the semantic models to be scaled differently; the left measures sales dollars and the right measures percentage. And we see the answer to our question: yes, we do see a similar pattern.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-clustered-combo.png" alt-text="Cluster combo chart example.":::

## Add titles to the axes

1. Select the paintbrush icon :::image type="icon" source="media/power-bi-visualization-combo-chart/power-bi-paintbrush.png"::: to open the **Formatting** pane.

1. Set **Y-axis** to **On**, then select the down arrow to expand the **Y-axis** options.

1. Set **Y-axis** \> **Values** > **Display units** to **Millions**.

1. Set **Y-axis** \> **Title** to **On**, then set **Style** to **Show title only**

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-open-y.png" alt-text="Screenshot of the combo chart with Y-axis on.":::

1. Set **Secondary y-axis** to **On** to display options for formatting the line chart portion of the combo chart.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-secondary-y-axis.png" alt-text="Screenshot of the combo chart with Secondary y-axis on.":::

1. Under **Secondary y-axis**, set **Title** to **On**.

   Your combo chart now displays dual axes, both with titles.

   :::image type="content" source="media/power-bi-visualization-combo-chart/power-bi-two-titles.png" alt-text="Screenshot of the combo chart with dual axes and titles.":::

1. Optionally, modify the text font, size, and color and set other formatting options to improve the display and readability of the chart.

From here, you might want to:

* [Add the combo chart as a dashboard tile](../create-reports/service-dashboard-tiles.md).
* Save the report.
* [Make the report more accessible for people with disabilities](../create-reports/desktop-accessibility-overview.md).

## Cross-highlighting and cross-filtering

Highlighting a column or line in a combo chart cross-highlights and cross-filters the other visualizations on the report page, and vice versa. Use [visual interactions](../create-reports/service-reports-visual-interactions.md) to change this default behavior.

## Considerations and limitations

* The secondary y-axis (line values) automatically shows or hides by default if its data range sufficiently overlaps with the primary y-axis (column values). To force show or hide the secondary y-axis, toggle the top-level toggle switch to "On" or "Off" on the "Secondary y-axis" formatting card to override this automatic behavior.
* The data labels may or may not display, depending on the size of your combo chart. If you don't see data labels, resize the combo chart. 

## Related content

* [Doughnut charts in Power BI](power-bi-visualization-doughnut-charts.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
