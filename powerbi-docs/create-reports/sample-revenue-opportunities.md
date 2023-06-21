---
title: 'Revenue Opportunities sample for Power BI: Take a tour'
description: Learn how to get the Revenue Opportunities sample for Power BI. Take a tour of the features used in this sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 06/22/2023
LocalizationGroup: Samples
---

# Revenue Opportunities sample for Power BI: Take a tour

The Revenue Opportunities built-in sample contains a report and dataset for a software company that has two sales channels: *direct* and *partner*. The sales manager created this dashboard to track opportunities and revenue by region, deal size, and channel.

:::image type="content" source="media/sample-revenue-opportunities/revenue-opportunity-dashboard.png" alt-text="Screenshot that shows the dashboard for the Revenue Opportunities sample." lightbox="media/sample-revenue-opportunities/revenue-opportunity-dashboard.png":::

This sample relies on two measures of revenue:

- Revenue: A salesperson's estimate of the revenue.
- Factored revenue: Calculated as revenue X probability% and is accepted as being a more-accurate predictor of actual sales revenue. The deal's current *sales stage* determines probability:

  - Lead: 10%  
  - Qualify: 20%  
  - Solution: 40%  
  - Proposal: 60%  
  - Finalize: 80%

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com/) created samples using real, anonymized data. The data is available as a built-in sample in the Power BI service and a *.pbix* Power BI Desktop file. For more information, see [Samples for Power BI](sample-datasets.md).

This tour explores the Revenue Opportunities built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop, you can also follow along by using the sample *.pbix* file in Power BI Desktop.

## Prerequisites

You don't need a Power BI license to explore the samples in Power BI Desktop. You just need a [Power BI free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, get the sample in one of the following ways:

- Get the [built-in sample in the service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Revenue Opportunities** sample.

1. Select the sample. It opens in Reading mode.

   Power BI imports the built-in sample, adding a report and dataset to your current workspace.

## Get the .pbix file for this sample

Alternatively, you can download the Revenue Opportunities sample as a *.pbix* file, which is designed for use with Power BI Desktop.

1. Open the GitHub Samples repository to the [Revenue Opportunities sample .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/new-power-bi-service-samples/Revenue%20Opportunities.pbix).

1. Select **Download** in the upper-right corner. The sample downloads automatically to your *Downloads* folder.

If you'd like to view it in the Power BI service, you can publish it there.

1. Open the file in Power BI Desktop and select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog box, choose a workspace, and then **Select**.

   Power BI imports the sample, adding the report and dataset to your selected workspace.

## Explore the pages in the report

To open the Corporate Spend report, go to your workspace and select the **Revenue Opportunities** report.

:::image type="content" source="media/sample-revenue-opportunities/power-bi-select-report.png" alt-text="Screenshot shows the Revenue Opportunities sample report and dataset links.":::

### Opportunity Count Overview page

:::image type="content" source="media/sample-revenue-opportunities/opportunity-3.png" alt-text="Screenshot that shows the Opportunity Count Overview page." lightbox="media/sample-revenue-opportunities/opportunity-3.png":::

Note the following details:

- East is our biggest region in terms of opportunity counts.  
- On the **Opportunity Count by Region** pie chart, select each region in turn to filter the page by region. For each region, notice that partners are pursuing significantly more large opportunities.
- The **Opportunity Count by Partner Driven and Opportunity Size** column chart shows that most of the large opportunities are partner driven, while most of the small and medium opportunities aren't.
- In the **Opportunity Count by Sales Stage** bar chart, select each **Sales Stage** in turn to see the difference in regional count. Notice that although the East region has the largest opportunity count, all three regions in the Solution, Proposal, and Finalize sales stages have comparable counts. This result means we close a higher percent of deals in the Central and West regions.

### Revenue Analysis page

This page takes a similar look at the data, but uses a revenue perspective instead of count.  

:::image type="content" source="media/sample-revenue-opportunities/opportunity-4.png" alt-text="Screenshot that shows the Revenue Overview page." lightbox="media/sample-revenue-opportunities/opportunity-4.png":::

Note the following details:

- East is our biggest region, not only in opportunity count but also in revenue.  
- If you filter the **Revenue by Sales Stage and Partner Driven** chart by selecting **Yes** for **Partner Driven**, you see a revenue of \\$1.5 billion and a factored revenue of \\$294 million. Compare these amounts to \\$644 million and \\$166 million for nonpartner driven revenue.
- Average revenue for large accounts is larger at \\$8 million if the opportunity is partner driven, compared to \\$6 million for nonpartner driven business.  
- For partner driven businesses, average revenue for large-sized opportunities is almost double that of medium-sized opportunities.  
- Average revenue for small and medium businesses is comparable for both partner driven and nonpartner driven business.

Clearly our partners are doing a better job than nonpartners selling to customers. It might make sense to funnel more deals through our partners.

### Opportunity Count by Region and Stage

This page of the report looks at data similar to the data on the previous page but breaks it down by region and stage.

:::image type="content" source="media/sample-revenue-opportunities/opportunity-5.png" alt-text="Screenshot that shows the Opportunity Count by Region and Stage." lightbox="media/sample-revenue-opportunities/opportunity-5.png":::

Note the following details:

- If you select **East** in the **Opportunity Count by Region** pie chart to filter by the East region, you see that the opportunities in this region are split almost equally between partner driven and nonpartner driven.
- Large opportunities are most common in the Central region, small opportunities are most common in the East region, and medium opportunities are most common in the West region.

### Upcoming Opportunities by Month page

This page looks at similar factors, but from a date and time perspective.

:::image type="content" source="media/sample-revenue-opportunities/opportunity-6.png" alt-text="Screenshot that shows Upcoming Opportunities." lightbox="media/sample-revenue-opportunities/opportunity-6.png":::

Our CFO uses this page to manage workload. By looking at the revenue opportunities by sales stage and month, they can plan accordingly.

Note the following details:

- Average revenue for the Finalize sales stage is the highest. Closing these deals is a top priority.
- If you filter by month (by selecting a month in the **Month** slicer), you see that January has a high proportion of large deals in the Finalize sales stage with a factored revenue of $75 million. February, on the other hand, has mostly medium deals in the Solution and Proposal sales stages.
- In general, the factored revenue numbers fluctuate based on sales stage, number of opportunities, and deal size. Add filters for these factors by using the **Filter** pane on the right to discover further insights.

## Edit the report

Select **Edit** in the **Power BI** header bar to explore in the editing view:

- See how the pages are made, the fields in each chart, and the filters on the pages.
- Add pages and charts, based on the same data.
- Change the visualization type for each chart.
- Pin charts of interest to your dashboard.

## Create a Revenue Opportunities dashboard

A Power BI *dashboard* is a single page containing visualizations that can come from one or more reports, and each report is based on one dataset. You can also generate visualizations on the dashboard by using the Q&A *Ask a question about your data* feature to explore the data associated with a report. Think of a dashboard as an entryway into the underlying reports and datasets. Select a visualization to take you to the report that was used to create it.

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


### What's the dashboard telling us?

With the [built-in sample in the Power BI service](#get-the-built-in-sample), you have a report and a dashboard. Let's start the tour at the dashboard that the sales manager has created to track those metrics most important to them. When they see something interesting, they can select a tile to look into the data:

- Company revenue is \\$2 billion and factored revenue is \\$461 million.
- Opportunity count and revenue follow a familiar funnel pattern, with totals decreasing with each subsequent stage.
- Most of our opportunities are in the East region.
- Large opportunities generate more revenue than medium or small opportunities.
- Large partner deals generate more revenue: \\$8 million on average versus \\$6 million for direct sales.

Because the effort to land a deal is the same whether the deal is classified as large, medium, or small, our company should analyze the data to learn more about large opportunities.

1. In the Power BI service, find the workspace where you saved the sample, then select the **Revenue Opportunities Sample** dashboard.

    If you're using Power BI Desktop, open the *.pbix file* and select the **Opportunity Count** tab.

2. Select the **Opportunity Count by Partner Driven, Sales Stage** tile to open the first page of the Revenue Opportunities Sample report.

    :::image type="content" source="media/sample-revenue-opportunities/opportunity-2.png" alt-text="Screenshot that shows the tile for Opportunity Count by Partner Driven, Sales Stage.":::

## Next steps

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started creating in the Power BI service](../fundamentals/service-get-started.md).
