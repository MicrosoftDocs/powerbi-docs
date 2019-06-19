---
title: 'Opportunity Analysis sample for Power BI: Take a tour'
description: 'Opportunity Analysis sample for Power BI: Take a tour'
author: maggiesMSFT
manager: kfile
ms.reviewer: amac

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/20/2019
ms.author: maggies

LocalizationGroup: Samples
---
# Opportunity Analysis sample for Power BI: Take a tour

## Overview of the Opportunity Analysis sample
The Opportunity Analysis Sample content pack contains a dashboard, report, and dataset for a software company that has two sales channels: *direct* and *partner*. The sales manager created this dashboard to track opportunities and revenue by region, deal size, and channel.

This sample relies on two measures of revenue:

* Revenue: A salesperson’s estimate of what the revenue will be.
* Factored revenue: Calculated as revenue X probability% and is accepted as being a more-accurate predictor of actual sales revenue. Probability is determined by the deal’s current *sales stage*.
  * Lead: 10%  
  * Qualify: 20%  
  * Solution: 40%  
  * Proposal: 60%  
  * Finalize: 80%

![Dashboard for the Opportunity Analysis sample](media/sample-opportunity-analysis/opportunity1.png)

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. It was created with real data by [obviEnce](http://www.obvience.com/), which has been anonymized. The data is available in several formats: content pack/app, .pbix Power BI Desktop file, or Excel workbook. See [Samples for Power BI](sample-datasets.md). 

This tutorial uses the Power BI service and the Opportunity Analysis Sample content pack. Because the report experiences are so similar, you can also follow along by using Power BI Desktop and the sample .pbix file. 

## Prerequisites

Before you can use the sample, you must first download it as a [content pack](#get-the-content-pack-for-this-sample), [.pbix file](#get-the-pbix-file-for-this-sample), or [Excel workbook](#get-the-excel-workbook-for-this-sample).

### Get the content pack for this sample

1. Open the Power BI service (app.powerbi.com), sign in, and open the workspace where you want to save the sample.

2. In the bottom-left corner, select **Get Data**.

    ![Select Get Data](media/sample-datasets/power-bi-get-data.png)
3. On the **Get Data** page that appears, select **Samples**.

4. Select **Opportunity Analysis Sample**, and then choose **Connect**.  

   ![Connect to sample](media/sample-opportunity-analysis/opportunity-connect.png)
5. Power BI imports the content pack, and then adds a new dashboard, report, and dataset to your current workspace.

   ![](media/sample-opportunity-analysis/opportunity-asterisk.png)

### Get the .pbix file for this sample

Alternatively, you can download the [Opportunity Analysis sample](http://download.microsoft.com/download/9/1/5/915ABCFA-7125-4D85-A7BD-05645BD95BD8/Opportunity%20Analysis%20Sample%20PBIX.pbix) as a .pbix file, which is designed for use with Power BI Desktop.

### Get the Excel workbook for this sample

If you want to view the data source for this sample, it's also available as an [Excel workbook](http://go.microsoft.com/fwlink/?LinkId=529782). The workbook contains Power View sheets that you can view and modify. To see the raw data, enable the Data Analysis add-ins, and then select **Power Pivot > Manage**. To enable the Power View and Power Pivot add-ins, see [Take a look at the Excel samples from inside Excel itself](sample-datasets.md#optional-take-a-look-at-the-excel-samples-from-inside-excel-itself) for details.

## What is our dashboard telling us?
Our sales manager has created a dashboard to track those metrics most important to her. When she sees something interesting, she can select a tile to look into the data:

- Company revenue is $2 billion and factored revenue is $461 million.
- Opportunity count and revenue follow a familiar funnel pattern, with totals decreasing with each subsequent stage.
- Most of our opportunities are in the East region.
- The large opportunities generate more revenue than the medium or small opportunities.
- Partner large deals generate more revenue: $8M on average versus $6M for direst sales.

Because the effort to land a deal is the same whether the deal is classified as large, medium, or small, our company should dig into the data to learn more about large opportunities.

Select the **Opportunity Count by Partner Driven, Sales Stage** tile to open page 1 of the report.  
![](media/sample-opportunity-analysis/opportunity2.png)

## Explore the pages in the report
### Page 1 of our report is titled “Opportunity Count Overview.”
![](media/sample-opportunity-analysis/opportunity3.png)

* East is our biggest region in terms of opportunity counts.  
* On the pie chart, select each region one at a time to filter the page. For each region, partners are pursuing significantly more large opportunities.   
* The Opportunity Count by Partner Driven and Opportunity Size column chart clearly shows that most of the large opportunities are partner-driven and more of the small and medium opportunities are not partner-driven.
* Select each Sales Stage in the bar chart in the bottom left to see the difference in regional count and notice that even though East is our biggest region in terms of counts, in the Solution, Proposal and Finalize stages all 3 regions have comparable counts. This means we close a higher percent of deals in Central and West.

### Page 2 of our report is titled “Revenue Overview.”
This page takes a similar look at the data but using a revenue perspective instead of count.  
![](media/sample-opportunity-analysis/opportunity4.png)

* East is our biggest region not only in opportunity count but in revenue also.  
* Filtering by Partner driven (select **Yes** in the legend in the top right) reveals revenue of $1.5B and $294M. Compare this to $644B and $166M for non-partner driven revenue.  
* Average revenue for large accounts is larger (8M) if the opportunity is partner driven as compared to 6M for non-partner driven business.  
* For partner driven business, average revenue for large opportunities is almost double that of medium-sized opportunities (4M).  
* Average revenue for small and medium businesses is comparable for both partner driven and non-partner driven business.   

Clearly our partners are doing a better job selling to customers.  It might make sense to funnel more deals through our partners.

### Page 3 of our report is titled "Region Stage Counts"
This page looks at similar data but breaks it down by region and stage.  
![](media/sample-opportunity-analysis/opportunity5.png)

* Filtering by East (select **East** in the pie chart) reveals that the opportunities in the east are split almost equal between partner driven and non-partner driven.
* Large opportunities are most common in the central region, small opportunities are most common in the east region, and medium opportunities are most common in the west region.

### Page 4 of our report is titled “Upcoming Opportunities”
Again, we’re looking at similar factors, but this time from a date/time perspective.  
![](media/sample-opportunity-analysis/opportunity6.png)

Our CFO uses this page to manage workload. By looking at the revenue opportunities by sales stage and month, she can plan appropriately.

* Average revenue for the Finalize stage is the highest. Closing these deals is a top priority.
* Filtering by month (by selecting the month name in the left slicer) shows that January has a high proportion of large deals in the Finalize stage with factored revenue of $75M. February, on the other hand, has mostly medium deals in Solution and Proposal stage.
* In general, the factored revenue numbers fluctuate based on sales stage, number of opportunities, and deal size. Add filters (using the filter pane on the right) for these factors to discover further insights.

This is a safe environment to play in. You can always choose not to save your changes. But if you do save them, you can always go to **Get Data** for a new copy of this sample.

## Next steps: Connect to your data
We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into opportunity tracking data. Now it’s your turn — connect to your own data. With Power BI, you can connect to a wide variety of data sources. Learn more about [getting started with Power BI](service-get-started.md).

[Download samples](sample-datasets.md)  
