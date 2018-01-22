---
title: 'Customer Profitability sample for Power BI: Take a tour'
description: 'Customer Profitability sample for Power BI: Take a tour'
services: powerbi
documentationcenter: ''
author: amandacofsky
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 01/22/2018
ms.author: mihart

---
# Customer Profitability sample for Power BI: Take a tour
The “Customer Profitability Sample” content pack contains a dashboard, report, and dataset for a company that manufactures marketing materials. This dashboard was created by a CFO to see key metrics about her five business unit managers (aka executives), products, customers, and gross margins (GM). At a glance she can see what factors are impacting profitability.

This sample is part of a series that illustrates how you can use Power BI with business-oriented data, reports and dashboards. This is real data from obviEnce ([www.obvience.com](http://www.obvience.com/)) that has been anonymized.

## Prerequisites

Before you can use the sample, you must first download it as a content pack, .pbix file, or Excel workbook.

### Get the content pack for this sample

1. Open the Power BI service (app.powerbi.com) and log in.
2. In the bottom left corner select **Get data**.
   
    ![](media/sample-datasets/power-bi-get-data.png)
3. On the Get Data page that appears, select the **Samples** icon.
   
   ![](media/sample-datasets/power-bi-samples-icon.png)
4. Select the **Customer Profitability Sample**, then choose **Connect**.  
   
   ![Get Data](media/sample-customer-profitability/get-supplier-sample.png)
5. Power BI imports the content pack and adds a new dashboard, report, and dataset to your current workspace. The new content is marked with a yellow asterisk. Use the samples to take Power BI for a test run.  
   
   ![Asterisk](media/sample-customer-profitability/supplier-sample-asterisk.png)
  
### Get the .pbix file for this sample

Alternatively, you can download the sample as a .pbix file, which is designed for use with Power BI Desktop. 

[Customer Profitability Sample PBIX](http://download.microsoft.com/download/6/A/9/6A93FD6E-CBA5-40BD-B42E-4DCAE8CDD059/Customer Profitability Sample PBIX.pbix)

### Get the Excel workbook for this sample

You can also download just the dataset [(Excel workbook) for this sample](http://go.microsoft.com/fwlink/?LinkId=529781). The workbook contains Power View sheets that you can view and modify. To see the raw data, select **Power Pivot > Manage**.

## What is our dashboard telling us?

Under **My Workspace**, find the dashboard for the Customer Profitability sample:

![Dashboard for the Customer Profitability sample](media/sample-customer-profitability/power-bi-dash.png)

### Company-wide dashboard tiles
These tiles give our CFO a view of the high-level company metrics important to her.  When she sees something interesting, she can select a tile to dig into the data.

1. Our company gross margin is 42.5%.
2. We have 80 customers.
3. We sell 5 different products.
4. We had our lowest revenue variance% to budget in February, followed by our highest in March.
5. Most of our revenue comes from the East and North regions. Gross margin has never exceeded budget, with ER-0 and MA-0 requiring some further investigation.
6. Total revenue for the year is close to budget.

### Manager-specific dashboard tiles
These tiles provide a team scorecard. The CFO needs to keep track of her managers and these tiles give her a high level overview of profit – using GM%. If the GM% trend is unexpected for any manager, then she can investigate further.

Annelie’s GM% is the lowest, but we see a steady increase since March. Valery, on the other hand, has seen her GM% drop significantly. And Andrew had a volatile year. Click on any of the manager-specific tiles to open the underlying report. The report has 3 pages and opens to the “Industry Margin Analysis” page.

## Explore the pages in the report
Our report has 3 pages:

* "Team Scorecard" focuses on the performance of the 5 managers and their "books of business."
* "Industry Margin Analysis" provides a way to analyze our profitability compared to what's going on in our entire industry.
* "Executive Scorecard" provides a view of each of our managers formatted for viewing in Cortana.

### Team Scorecard page
![](media/sample-customer-profitability/customer2.png)

Let’s look at two of the team members in detail and see what insights can be gained. In the slicer on the left, select Andrew's name to filter the report page to display only data about Andrew.

* For a quick KPI, look at Andrew’s **Revenue Status** - he is green. He’s performing well.
* The “Revenue Var % to Budget by Month”  Area chart shows that except for a dip in February, Andrew is doing pretty well overall. His dominant region is East and he handles 49 customers and 5 (out of 7) products. His GM% isn’t the highest or lowest.
* The “RevenueTY and Revenue Var % to Budget by Month” shows a steady even profit story.But when you filter by clicking on the square for **Central** in the region treemap, you discover that Andrew has revenue only in March and only in Indiana. Is this intentional or is this something that needs looking into?

Now on to Valery. In the slicer, select Valery’s name to filter the report page to display only data about her.  
![](media/sample-customer-profitability/customer3.png)

* Notice the red KPI for **RevenueTY Status**. This definitely needs further investigation.
* Her revenue variance also paints a worrying picture – she is not meeting her revenue margins.
* Valery has only 9 customers, handles only 2 products and works almost-exclusively with customers in the north. This specialization could explain wide fluctuations in her metrics.
* Selecting the **North** square in the treemap shows that Valery’s gross margin in the North is consistent with her overall margin.
* Selecting the other **Region** squares tells an interesting story: her GM% ranges from 23% to 79% and her revenue numbers, in all regions except North, are extremely seasonal.

Continue digging to find out why Valery’s area is not performing well. Look at regions, the other business units, and the next page in the report – “Industry Margin Analysis.”

### Industry Margin Analysis
This report page provides a different slice of the data. It looks at gross margin for the entire industry, broken down by segment. The CFO uses this page to compare company and business unit metrics to industry metrics to help her explain trends and profitability. You might wonder why the “Gross Margin by Month and Executive Name” area chart is on this page, since it is team-specific. Having it here lets us filter the page by business unit manager.  
![](media/sample-customer-profitability/customer6.png)

How does profitability vary by industry? How do the products and customers break down by industry? Select one or more industries from the top left. (Start from the CPG industry) To clear the filter, select the eraser icon.

On the bubble chart, the CFO looks for the largest bubbles since these are the ones that have the biggest impact on revenue. Filtering the page by manager by clicking on their names in the area chart makes it easy to see each manager’s impact by industry segment.

* Andrew's area of influence spans many different industry segments with widely varying GM% (most on the positive side) and Var%. 
* Annelie's chart is similar, except that she concentrates on only a handful of industry segments with a focus on the Federal segment and a focus on Gladius product. 
* Carlos has a clear focus on the Services segment, with good profit. He's greatly improved variance % for the High Tech segment and a new segment for him, Industrial, performed exceptionally well compared to budget. 
* Tina works with a handful of segments and has the highest GM%, but the mostly small size of her bubbles shows that her impact on the company's bottom line is minimal. 
* Valery, who is responsible for only one product, works in only 5 industry segments. Her industry influence is seasonal, but always produces a large bubble, indicating a significant impact on the company’s bottom line. Does industry explain her negative performance?

### Executive Scorecard
This page is formatted as an Answer Card for Cortana. To learn more, see [create Answer Cards for Cortana](service-cortana-answer-cards.md)

## Dig into the data by asking questions with Q&A
For our analysis, it would be helpful to determine which industry generates the most revenue for Valery. Let’s use Q&A.

1. Select **Power BI** in the top navigation bar to return to the dashboard.
2. Select the Q&A question box at the top of the dashboard.
   
    ![](media/sample-customer-profitability/customer4.png)
3. Type **total revenue by industry for Valery**. Notice how the visualization updates as you type the question.
   
    ![](media/sample-customer-profitability/customer5.png)
   
   Distribution is the biggest revenue area for Valery.

### Dig deeper by adding filters
Let's take a look at the *Distribution* industry.  

1. Return to the dashboard and select the area chart with Andrew's Gross Margin Trend. This opens the report to the "Industry Margin Analysis" page.
2. Without selecting any visualizations on the report page, expand the filter pane on the right. The Filters pane should display only Page level filters.  
   
   ![](media/sample-customer-profitability/power-bi-filters.png)
3. Locate the filter for **Industry** and select the arrow to expand the list. Let's add a page filter for the Distribution industry. First, clear all selections by clearing the **Select All** checkbox. Then select **Distribution.**  
   
   ![](media/sample-customer-profitability/customer7.png)
4. The "Gross margin by Month and Executive Name" area chart tells us that only Valery and Tina have customers in this industry and Valery only worked with this industry from June to November.   
5. Select **﻿Tina**﻿ and then **Valery** in the "Gross Margin by Month and Executive" area chart legend. Notice Tina's portion of "Total Revenue by Product" is really small compared to Valery. 
6. To see actual revenue, return to the dashboard and use Q&A to ask **total revenue for distribution by scenario by executive**.  
   
   ![](media/sample-customer-profitability/customer8.png)

We can similarly explore other industries and even add customers to our visuals to understand causes for Valery's performance.

This is a safe environment to play in. You can always choose not to save your changes. But if you do save them, you can always go to **Get Data** for a new copy of this sample.

You can also [download just the dataset (Excel workbook) for this sample](http://go.microsoft.com/fwlink/?LinkId=529781).

## Next steps: Connect to your data
We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into customer data. Now it is your turn — connect to your own data. With Power BI you can connect to a wide variety of data sources. Learn more about [getting started with Power BI](service-get-started.md).

[Back to Samples in Power BI](sample-datasets.md)  

