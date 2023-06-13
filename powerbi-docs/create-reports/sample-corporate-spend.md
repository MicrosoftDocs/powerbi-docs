---
title: 'Corporate Spend sample for Power BI: Take a tour'
description: Find out how to get the Corporate Spend sample for Power BI. Take a tour of the features used in this sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 06/16/2023
LocalizationGroup: Samples
---
# Corporate Spend sample for Power BI: Take a tour

The Corporate Spend built-in sample contains a report and dataset that analyzes the planned versus actual costs of an IT department. This comparison helps you understand how well the company planned for the year. You can investigate areas with huge deviations from the plan. The company in this example goes through a yearly planning cycle. Quarterly, it produces a new latest estimate (LE) to help analyze changes in IT spend over the fiscal year.

:::image type="content" source="media/sample-corporate-spend/power-bi-corporate-spend-dashboard.png" alt-text="Screenshot shows the dashboard for the Corporate Spend sample." lightbox="media/sample-corporate-spend/power-bi-corporate-spend-dashboard.png":::

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created samples using real, anonymized data. The data is available as a built-in sample in the Power BI service and a *.pbix* Power BI Desktop file. For more information, see [Samples for Power BI](sample-datasets.md).

This tour explores the Corporate Spend built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop, you can also follow along by using the sample *.pbix* file in Power BI Desktop.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Power BI free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Corporate Spend** sample.

1. Select the sample. It opens in Reading mode.

   Power BI imports the built-in sample, adding a report and dataset to your current workspace.

### Get the .pbix file for this sample

Alternatively, you can download the Corporate Spend sample as a .pbix file, which is designed for use with Power BI Desktop.

1. After you open the file in Power BI Desktop, select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog box, choose a workspace, and then **Select**.

   Power BI imports the sample, adding a report and dataset to your selected workspace.

## Create a Corporate Spend dashboard

A Power BI *dashboard* is a single page, often called a *canvas*. A dashboard tells a story through visualizations. You can create a dashboard from a Power BI report. You can use the *Ask a question about your data* feature to explore the data associated with a report.

To create a dashboard in the Power BI service:

1. Open a report by selecting it in a workspace.

   :::image type="content" source="media/sample-corporate-spend/select-power-bi-report.png" alt-text="Screenshot shows the Corporate Spend sample report and dataset links.":::

1. Hover over a visual and then select **Pin Visual**.

   :::image type="content" source="media/sample-corporate-spend/pin-power-bi-visual.png" alt-text="Screenshot shows a Power BI visual with the pin to dashboard option highlighted.":::

   Or, to add all of the visuals to a dashboard, from the report menu, select More options (**...**) > **Pin to a dashboard**.

1. In **Pin to dashboard**, select **New Dashboard** and enter a name for your dashboard.

   You can add visuals to an existing dashboard to show visualizations from different reports.

1. Then select **Pin Live**.

Your new dashboard now appears in **My workspace**.

### IT Spend Trend page

This section describes the visuals from the **IT Spend Trend** section of the sample report as they appear in a dashboard created from that page.

To see data for all regions, select **All regions** from Select Sales Region.

:::image type="content" source="media/sample-corporate-spend/power-bi-select-sales-region.png" alt-text="Screenshot shows selecting all regions in the from Select Sales Region.":::

All the visualizations on the canvas reflect this selection. The **Actual and Plan by IT Area** and **Actual by Period and Business Area** visualizations reflect data from all regions.

:::image type="content" source="media/sample-corporate-spend/power-bi-actual-spend-vizualization.png" alt-text="Screenshot shows two visualizations for actual spend for all regions.":::

Select **Aus and NZ** in the **Var Plan % by Sales Region** chart, and then observe the **Var Plan by IT Area** chart.

:::image type="content" source="media/sample-corporate-spend/power-bi-spend-region.png" alt-text="Screenshot shows visualizations for a selected region.":::

Now select **USA**. You can compare actual and planned spend for different selections.

:::image type="content" source="media/sample-corporate-spend/power-bi-spend-comparision.png" alt-text="Screenshot shows visualizations for a different region.":::

### Plan Variance Analysis page

Open the report and select the Plan Variance Analysis page from the **Pages** column. For **Select Sales Region**, select **All**.

The **Var Plan by Business Area** shows the variance for all regions.

:::image type="content" source="media/sample-corporate-spend/power-bi-plan-variance.png" alt-text="Screenshot shows two tiles in the report about Plan Variance.":::

Below that visualization, the **Var Plan % by Business Area** is presented as a table of values. If you want to view it as a visualization parallel to the one above it, edit the report.

1. In the menu bar, select **Edit**.

1. Select the table then, under **Visualizations**, select the **Stacked bar chart**.

   :::image type="content" source="media/sample-corporate-spend/power-bi-visualization.png" alt-text="Screenshot shows the visualizations to choose from for the data.":::

   Visualizations offers many options to display your data.

   :::image type="content" source="media/sample-corporate-spend/power-bi-visualization-no-table.png" alt-text="Screenshot shows the stacked bar chart visualization.":::

1. Select **Reading view** to exit the Edit mode and save your changes.

### Edit the report

As in the previous section, select **Edit** in the **Power BI** header bar to explore in the editing view:

- See how the pages are made, the fields in each chart, and the filters on the pages.
- Add pages and charts, based on the same data.
- Change the visualization type for each chart.
- Pin charts of interest to your dashboard.

Save or discard your changes.

## Ask questions of the data

A dashboard offers the ability to ask questions about data in natural language to create visuals. It doesn't matter how you create your dashboard or which tiles it has. You can ask questions about any dataset attached to your dashboard.

1. In the dashboard, select **Ask a question about your data**. Power BI suggests several questions as starting points.

   :::image type="content" source="media/sample-corporate-spend/dashboard-ask-question-suggestion.png" alt-text="Screenshot that shows suggested questions about your data." lightbox="media/sample-corporate-spend/dashboard-ask-question-suggestion.png":::

1. From **Try one of these to get started**, select **top cost element groups by var plan**.

   :::image type="content" source="media/sample-corporate-spend/dashboard-ask-question-visualization.png" alt-text="Screenshot that shows the results of selecting Top cost element groups by plan." lightbox="media/sample-corporate-spend/dashboard-ask-question-visualization.png":::

1. In the Q&A box, clear the previous entry and enter *what is the plan and var plan % by cost element sub group*.

   :::image type="content" source="media/sample-corporate-spend/dashboard-ask-question-graph.png" alt-text="Screenshot shows the result of the entry in the Q&A box described here." lightbox="media/sample-corporate-spend/dashboard-ask-question-graph.png":::

   Hover over a point for details and values.

1. Select **Exit Q&A** to return to the dashboard.

## Next steps

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started creating in the Power BI service](../fundamentals/service-get-started.md).
