---
title: 'Revenue Opportunities sample for Power BI: Take a tour'
description: Learn how to get the Revenue Opportunities sample for Power BI. Take a tour of the features used in this sample.
author: kfollis
ms.author: kfollis
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 06/22/2023
LocalizationGroup: Samples
---

# Revenue Opportunities sample for Power BI: Take a tour

The Revenue Opportunities built-in sample contains a report and semantic model for a software company that has two sales channels: *direct* and *partner*. The sales manager created this dashboard to track opportunities and revenue by region, deal size, and channel.

:::image type="content" source="media/sample-revenue-opportunities/revenue-opportunity-dashboard.png" alt-text="Screenshot that shows the dashboard for the Revenue Opportunities sample." lightbox="media/sample-revenue-opportunities/revenue-opportunity-dashboard.png":::

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created samples using real, anonymized data. The data is available as a built-in sample in the Power BI service and a *.pbix* Power BI Desktop file. For more information, see [Samples for Power BI](sample-datasets.md).

This tour explores the Revenue Opportunities built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop, you can also follow along by using the sample *.pbix* file in Power BI Desktop.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Fabric free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Revenue Opportunities** sample.

1. Select the sample. It opens in Reading mode.

   Power BI imports the built-in sample, adding a report and semantic model to your **My workspace**.

### Get the .pbix file for this sample

Alternatively, you can download the Revenue Opportunities sample as a *.pbix* file, which is designed for use with Power BI Desktop.

1. Open the GitHub Samples repository to the [Revenue Opportunities sample .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/new-power-bi-service-samples/Revenue%20Opportunities.pbix).

1. Select **Download** in the upper-right corner. The sample downloads automatically to your *Downloads* folder.

If you'd like to view it in the Power BI service, you can publish it there.

1. Open the file in Power BI Desktop and select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog box, choose a workspace, and then **Select**.

   Power BI imports the sample, adding the report and semantic model to your selected workspace.

## Explore the report

To open the Revenue Opportunities report, go to your workspace and select the **Revenue Opportunities** report.

:::image type="content" source="media/sample-revenue-opportunities/power-bi-select-report.png" alt-text="Screenshot shows the Revenue Opportunities sample report and semantic model links.":::

You can edit current visualizations and create your own visualizations that use the semantic model for this sample. This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

Select **Edit** in the **Power BI** header bar to explore in the editing view:

- See how the pages are made, the fields in each chart, and the filters on the pages.
- Add pages and charts, based on the same data.
- Change the visualization type for each chart.
- Pin charts of interest to your dashboard.

Save or discard your changes.

### Opportunity Overview page

The **Opportunity Overview** page of the report has two card visualizations, a tree diagram, and other visualizations. Stakeholders can interact with different visualizations to understand your data.

1. Under **Pages**, select **Opportunity Overview** if the page isn't already open. Card visualizations display a single number. Cards display values for **Opportunity Revenue** and **Opportunity Count**.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-card-visual.png" alt-text="Screenshot shows two card visualizations that present data from the semantic model.":::

1. A treemap visualization of the **Opportunity Count by Region** appears below those cards. Right-click the **East** region. In the context menu, select **Drill down**.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-drill-down.png" alt-text="Screenshot shows the drilled down data of the region visualization." lightbox="media/sample-revenue-opportunities/power-bi-drill-down.png":::

   The visualization now shows the component areas that make up the East region. The other visualizations now reflect only the East region.

1. Now select a product from the **Product Code** selector.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-select-product.png" alt-text="Screenshot shows report page with a particular product code selected." lightbox="media/sample-revenue-opportunities/power-bi-select-product.png":::

1. Right-click **Opportunity Count by Region**. From the context menu, select **Drill through** > **Detail**. The report opens the **Detail** page for the data that you're examining.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-detail.png" alt-text="Screenshot shows the detail view that contains numbers reflecting the selected values." lightbox="media/sample-revenue-opportunities/power-bi-detail.png":::

1. Select the **Opportunity Overview** page to return to that report page. In **Opportunity Count by Region**, right-click. Select **Drill up** to see all regions again.

You can select a field in any visualization to view that data for that selection in all the visualizations.

Hover over any field to see the details of that field as a *tooltip*. A Power BI report provides a default value for tooltips. You can add any value to the tooltips for a visualization. For more information, see [Customize tooltips in Power BI](desktop-custom-tooltips.md).

## Create a Revenue Opportunities dashboard

A Power BI *dashboard* is a single page that contains visualizations that can come from one or more reports, and each report is based on one semantic model. You can also generate visualizations on the dashboard by using the Q&A *Ask a question about your data* feature to explore the data associated with a report. Think of a dashboard as an entryway into the underlying reports and semantic models. Select a visualization to take you to the report that was used to create it.

To create a dashboard in the Power BI service:

1. Open a report by selecting it in a workspace.

1. To add all of the visualizations in a page to a dashboard, from the report menu, select **...** (More options) > **Pin to a dashboard**.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-pin-page-dashboard.png" alt-text="Screenshot shows a Power BI report page with the pin to dashboard option highlighted.":::

   Or, to add a single visualization to a dashboard, hover over it and then select **Pin visual**.

1. In **Pin to dashboard**, select **New Dashboard** and enter a name for your dashboard.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-new-dashboard.png" alt-text="Screenshot shows the Pin to dashboard dialog box for adding to a new dashboard.":::

   You can add visuals to an existing dashboard to show visualizations from different reports.

1. Then select **Pin live**.

Your new dashboard now appears in **My workspace**.

For more information, see [Introduction to dashboards for Power BI designers](service-dashboards.md).

### Create new dashboard visualizations

A dashboard offers the ability to ask questions about data in natural language to create visuals. It doesn't matter how you create your dashboard or which tiles it has. You can ask questions about any semantic model attached to your dashboard.

1. In the dashboard, select **Ask a question about your data**.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-ask-revenue-state.png" alt-text="Screenshot shows suggestions to choose to query the data." lightbox="media/sample-revenue-opportunities/power-bi-ask-revenue-state.png":::

1. Select a question, such as *what is the opportunity count by state*. The dashboard creates a bar chart.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-ask-revenue-state-bar-chart.png" alt-text="Screenshot shows a bar chart that the dashboard created based on the question." lightbox="media/sample-revenue-opportunities/power-bi-ask-revenue-state-bar-chart.png":::

   You can add more data fields to your question. Try *what is the opportunity count by state by fact month* or *what is the opportunity count by state by factored revenue*.

1. You might want a different way to present this information than a bar chart. Update your question to *what is the opportunity count by state as a map*. The dashboard displays the same data as a map. Look under **Visualizations** where the map is selected.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-ask-revenue-state-map.png" alt-text="Screenshot shows a pie chart that the dashboard created based on the question." lightbox="media/sample-revenue-opportunities/power-bi-ask-revenue-state-map.png":::

   Try some other visualizations. There are different bar charts, scatter charts, and line charts. You can select a table to display the data as numbers. Find a visualization that presents your data in the best way for your purposes. For more information about visualizations, see [Visualization types in Power BI](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md).

1. To save your visualization to a dashboard, select **Pin visual**.

   :::image type="content" source="media/sample-revenue-opportunities/power-bi-pin-visual.png" alt-text="Screenshot shows the Pin visual option to add your new visualization to a dashboard.":::

You can save it to this current dashboard or create a new dashboard for it, as you did in the previous section.

## Related content

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started creating in the Power BI service](../fundamentals/service-get-started.md).
