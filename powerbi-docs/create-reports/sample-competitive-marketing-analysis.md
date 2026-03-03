---
title: 'Competitive Marketing Analysis sample for Power BI: Take a tour'
description: Learn how to use Power BI with business-oriented data, reports, and dashboards, with this Competitive Marketing Analysis sample.
author: julcsc
ms.author: juliacawthra
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: concept-article
ms.update-cycle: 1095-days
ms.date: 09/11/2025
LocalizationGroup: Samples
---
# Competitive Marketing Analysis sample for Power BI: Take a tour

The Competitive Marketing Analysis sample contains a report and semantic model for a fictitious manufacturing company named VanArsdel Ltd. The VanArsdel Chief Marketing Officer (CMO) created this report to keep an eye on the industry and the company's market share, product volume, sales, and sentiment.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-marketing-analysis-report.png" alt-text="Screenshot of a page of the Competitive Marketing Analysis sample." lightbox="media/sample-competitive-marketing-analysis/power-bi-marketing-analysis-report.png":::

VanArsdel has many competitors but is the market leader in its industry. The CMO wants to increase market share and discover growth opportunities. However, for unknown reasons, VanArsdel's market share has started to decline, with significant dips in June.

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created samples using real, anonymized data. The data is available in the following formats: built-in sample in the Power BI service and *.pbix* Power BI Desktop file. See [Get the sample](#get-the-sample) in this article.

This tour explores the Competitive Marketing Analysis sample in the Power BI service. Because the report experience is similar in Power BI Desktop and in the service, you can also follow along by using the sample *.pbix* file in Power BI Desktop.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Fabric free license](../fundamentals/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see **Competitive Marketing Analysis**.

1. Select the sample. It opens the report in Reading mode.

   Power BI imports the built-in sample, adding a report and a semantic model to your **My workspace**.

### Get the .pbix file for this sample

Alternatively, you can download the Competitive Marketing Analysis sample as a *.pbix* file, which is designed for use with Power BI Desktop.

1. Open the GitHub Samples repository to the [Competitive Marketing Analysis sample .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/new-power-bi-service-samples/Competitive%20Marketing%20Analysis.pbix).

1. Select **Download** in the upper-right corner. It downloads automatically to your **Downloads** folder.

If you'd like to view it in the Power BI service, you can publish it there.

1. Open the file in Power BI Desktop and select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog box, choose a workspace, and then **Select**.

   Power BI imports the sample, adding the report and semantic model to your selected workspace.

## Explore the report

To open the Competitive Marketing Analysis report, go to your workspace and select that report:

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-select-martket-sample-report.png" alt-text="Screenshot shows My workspace with the Competitive Marketing Analysis report highlighted.":::

If you're following along in Power BI Desktop, open the *.pbix* file to see the report.

You can edit current visualizations and create your own visualizations that use the semantic model for this sample. This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

Select **Edit** in the **Power BI** header bar to explore in the editing view:

- See how the pages are made, the fields in each chart, and the filters on the pages.
- Add pages and charts, based on the same data.
- Change the visualization type for each chart.
- Pin charts of interest to your dashboard.

Save or discard your changes.

### Explore the Executive Overview page

The visualizations in a Power BI report aren't just pictures. The tiles allow you to interact with data in order to better understand and analyze that data. There are several ways to interact with the data.

1. Under **Pages**, select **Executive Overview**. The overview shows high-level results for different sales channels and products over time.

1. In the **Total Sales by Product and Channel** tile, right-click a bar. From the context menu, select **Drill through** > **Detailed Info**.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-overview-drill-through.png" alt-text="Screenshot shows the context menu for a data field with Drill through, then Detailed Info selected.":::

   The report opens a report page with data for the bar that you selected. This page is only visible by using the drill through feature. If you select **Edit** from the report header to enter Edit mode, the page is visible and editable there.

1. If you entered Edit mode, select **Reading view**. Then select **Executive Overview** to return to that page of the report.

### Add a tooltip

You can also learn about the data by using *tooltips*. To see a tooltip, hover over one of the elements of a tile.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-overview-hover-tooltip.png" alt-text="Screenshot shows a tooltip displayed by hovering over one of the visualizations.":::

Power BI automatically generates some tooltips, but you can add values to any visualization.

1. Select **Edit** and then select the **Total Sales by Product and Channel** tile.

1. Under **Visualizations**, scroll down to **Tooltips**.

1. Expand **KPI**, then drag **KPI** to the box under **Tooltips**.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-overview-add-tooltip.png" alt-text="Screenshot shows the Visualizations pane and the Data pane with a value for the tooltip.":::

1. Select **Reading view**. Be sure to save your changes.

   Hover over the visual to see your revised tooltip.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-overview-revise-tooltip.png" alt-text="Screenshot shows the tooltip, as revised, displayed by hovering over one of the visualizations.":::

### Explore the Top 10 Regions page

Under **Pages**, select **Top 10 Regions** to view that report page. In the **Total Sales by Channel and State**, hover over a value.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-region-hover-tooltip.png" alt-text="Screenshot shows a report page tooltip displayed in the Top 10 Regions page.":::

This tooltip is an entire report page. Such a page can contain as many visualizations as needed. Keep in mind that a large tooltip obscures a large part of your report.

#### Add a report page tooltip

You can add a report page tooltip to any visual.

1. Select **Edit** to enter Edit mode.

1. In the tabs at the bottom, select **Top 10 Regions**, then select the **Total Sales and ROI by State and Channel** visualization.

1. Select **Format visual** > **General**, and then expand **Tooltips**. For **Type**, select **Report page**. For **Page**, select **Tooltip**.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-region-set-tooltip.png" alt-text="Screenshot shows the Tooltips options for a visualization.":::

1. Select **Reading view** to leave Edit mode. Be sure to save your changes.

Hover over **Total Sales and ROI by State and Channel** to see the tooltip there.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-region-new-tooltip.png" alt-text="Screenshot shows the visual where the new tooltip has been added.":::

### Explore the Return on Investment page

You can always look at the raw numbers that underlie the visualizations. Power BI also provides tools for analyzing the data.

Under **Pages**, select **Return on Investment**. Right-click the **ROI by Product** visualization. From the context menu, select **Show as a table**.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-return-show-table.png" alt-text="Screenshot shows the context menu with the show as a table option.":::

The dashboard shows you the data a table.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-return-table.png" alt-text="Screenshot shows the data as a visual and as a table." lightbox="media/sample-competitive-marketing-analysis/power-bi-return-table.png":::

Power BI can also help you understand the causes of your data. Right-click on **ROI by Product**. From the context menu, select **Analyze** > **Find where this distribution is different**. The report provides this analysis.

:::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-return-analysis.png" alt-text="Screenshot shows analysis for the selected field." lightbox="media/sample-competitive-marketing-analysis/power-bi-return-analysis.png":::

## Create a Competitive Marketing Analysis dashboard

A Power BI *dashboard* is a single page that contains visualizations that can come from one or more reports, and each report is based on one semantic model. You can also generate visualizations on the dashboard by using the *Ask a question about your data* feature to explore the data associated with a report. Think of a dashboard as an entryway into the underlying reports and semantic models. Select a visualization to take you to the report that was used to create it.

To create a dashboard in the Power BI service:

1. Open a report by selecting it in a workspace.

1. To add all of the visualizations in a page to a dashboard, from the report menu, select **...** (More options) > **Pin to a dashboard**.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-pin-page-dashboard.png" alt-text="Screenshot shows a Power BI report page with the pin to dashboard option highlighted.":::

   Or, to add a single visualization to a dashboard, hover over it and then select **Pin visual**.

1. In **Pin to dashboard**, select **New dashboard** and enter a name for your dashboard.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-new-dashboard.png" alt-text="Screenshot shows the Pin to dashboard dialog box for adding to a new dashboard.":::

   You can add visuals to an existing dashboard to show visualizations from different reports.

1. Then select **Pin live**.

Your new dashboard now appears in **My workspace**.

For more information, see [Introduction to dashboards for Power BI designers](service-dashboards.md).

## Use Q&A to dig deeper in the dashboard

A dashboard offers the ability to ask questions about data in natural language to create visuals. It doesn't matter how you create your dashboard or which tiles it has. You can ask questions about any semantic model attached to your dashboard.

In this section, use the dashboard to find out, which segments drive sales? Do they match the industry trend?

1. In the dashboard, select **Ask a question about your data**.

   Even before you start typing, the dashboard displays suggestions to help you form your question.

1. In **Ask a question about your data**, enter *total units by segment*. The dashboard displays the data as a visualization.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-unit-segment.png" alt-text="Screenshot shows total units by segment as a stacked bar chart." lightbox="media/sample-competitive-marketing-analysis/power-bi-unit-segment.png":::

1. At the end of the query, add: *for VanArsdel*. Q&A interprets the question and displays an updated chart with the answer.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-unit-segment-vanarsdel.png" alt-text="Screenshot shows total units by segment for VanArsel as a stacked bar chart." lightbox="media/sample-competitive-marketing-analysis/power-bi-unit-segment-vanarsdel.png":::

   The product volume is mostly from the **Convenience** and **Moderation** segments. Your share in the **Moderation** and **Convenience** categories is high. VanArsdel competes in these segments.

1. Add *by region* to the query. The dashboard breaks down the results by region.

   :::image type="content" source="media/sample-competitive-marketing-analysis/power-bi-unit-segment-vanarsdel-region.png" alt-text="Screenshot shows total units by segment for VanArsel by region as a stacked bar chart." lightbox="media/sample-competitive-marketing-analysis/power-bi-unit-segment-vanarsdel-region.png":::

   > [!TIP]
   > Are any of these visualizations useful for future reference? Select **Pin visual** to add a visual to a new or existing dashboard.

1. Select **Exit Q&A** to return to the dashboard.

## Related content

After experimenting with this report, you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

Now that you've seen how Power BI dashboards, Q&A, and reports can provide insights into data, try connecting to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](../fundamentals/service-get-started.md).
