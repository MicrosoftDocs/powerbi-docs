---
title: 'Procurement Analysis sample: Take a tour'
description: Learn how to get the Procurement Analysis sample for Power BI. Take a tour of the features used in this sample.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: amac
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 03/22/2023
LocalizationGroup: Samples
---

# Procurement Analysis sample for Power BI: Take a tour

The Procurement Analysis built-in sample contains a dashboard, report, and semantic model that analyze a manufacturing company's spending on vendors by category and location. In the sample, we explore:

* Who the top vendors are.
* What categories we spend the most on.
* Which vendors give us the highest discount and when.

:::image type="content" source="media/sample-procurement/procurement-dashboard.png" alt-text="Screenshot that shows the dashboard for the Procurement Analysis sample.":::

This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards. The company [obviEnce](http://www.obvience.com) created this sample using real, anonymized data. The data is available in several formats: built-in sample in the Power BI service, *.pbix* Power BI Desktop file, or Excel workbook. See [Samples for Power BI](sample-datasets.md). 

This tutorial explores the Procurement Analysis built-in sample in the Power BI service. Because the report experience is similar in Power BI Desktop and in the service, you can also follow along by using the sample *.pbix* file in Power BI Desktop. 

## Prerequisites

You don't need a Power BI license to explore the sample in Power BI Desktop. You just need a [Fabric free license](../consumer/end-user-features.md) to explore the sample in the Power BI service, and save it to your **My workspace**.

## Get the sample

Before you can use the sample, you must first get the sample in one of the following ways:

- Get the [built-in sample in the Power BI service](#get-the-built-in-sample).
- Download the [.pbix file](#get-the-pbix-file-for-this-sample).
- Download the [Excel workbook](#get-the-excel-workbook-for-this-sample).

### Get the built-in sample

1. Open the Power BI service (`app.powerbi.com`), and select **Learn** in the left navigation.

1. On the **Learning center** page, under **Sample reports**, scroll until you see the **Procurement Analysis Sample**.

1. Select the sample. It opens in Reading mode.

1. Power BI imports the built-in sample, adding a new dashboard, report, and semantic model to your current workspace.

    :::image type="content" source="media/sample-procurement/procurement-entry.png" alt-text="Screenshot that shows the Procurement Analysis sample entries in the workspace.":::

    Select the dashboard to view the sample dashboard.

### Get the .pbix file for this sample

Alternatively, you can download the Procurement Analysis sample as a [.pbix file](https://download.microsoft.com/download/D/5/3/D5390069-F723-413B-8D27-5888500516EB/Procurement%20Analysis%20Sample%20PBIX.pbix), which is designed for use with Power BI Desktop. 

1. After you open the file in Power BI Desktop, select **File** > **Publish** > **Publish to Power BI** or choose **Publish** in the **Home** ribbon.

1. In the **Publish to Power BI** dialog, choose a workspace and then **Select**.

1. In the Power BI service, in your workspace, scroll down to the **Procurement Analysis Sample** report and select to open.

1. From the **More options** (...) menu, select **Pin to a dashboard**. Select **New dashboard**, enter a name, and choose **Pin live**.

The dashboard that you create this way isn't the same as the sample dashboard created by the built-in sample. You can still use Q&A and make changes to your dashboard.

### Get the Excel workbook for this sample

If you want to view the data source for this sample, it's also available as an Excel workbook. To see the raw data, enable the Data Analysis add-ins, and then select **Power Pivot > Manage**. 

If you want to get and use the Excel file in the Power BI service, follow these steps:

1. Download the sample from [Power BI Desktop samples](https://github.com/microsoft/powerbi-desktop-samples/tree/main/powerbi-service-samples). The file is called *Procurement Analysis Sample-no-PV.xlsx*.

1. Open the file in Excel and then select **File** > **Publish** > **Publish to Power BI**.

1. Select a workspace, such as **My workspace**, and choose **Export**.

   There are different ways to work with Excel files. For more information, see [Explore the Excel samples in Excel](sample-datasets.md#explore-excel-samples-in-excel).

1. In the Power BI service, the exported data appears as a semantic model in the selected workspace. Select **More options** (...) > **Auto-create report**.

1. Select **Save**, enter a name for your report, and then choose **Save**.

1. From the **More options** (...) menu, select **Pin to a dashboard**. Select **New dashboard**, enter a name, and choose **Pin live**.

The dashboard that you create this way isn't the same as the sample dashboard created by the built-in sample. You can still use Q&A and make changes to your dashboard.

## Spending trends

First, let's look for trends in spending by category and location.  

1. In the Power BI service, find the workspace where you saved the sample. Select the **Procurement Analysis Sample** report, then the **Spend Overview** page.

    If you're using Power BI Desktop, open the *.pbix file* and select the **Spend Overview** tab.

    :::image type="content" source="media/sample-procurement/spend-overview.png" alt-text="Screenshot that shows the Spend Overview page.":::

Note the following details:

* In the **Total Invoice by Month and Category** line chart, the **Direct** category has consistent spending, **Logistics** has a peak in December, and **Other** has a spike in February.
* In the **Total Invoice by Country/Region** map, most of our spending is in the United States.
* In the **Total Invoice by Sub Category** column chart, **Hardware** and **Indirect Goods & Services** are the biggest spend categories.
* In the **Total Invoice by Tier** bar chart, most of our business is done with our tier 1 (top 10) vendors. Doing so enables us to manage better vendor relationships.

### Spending in Mexico

Let's explore the spending areas in Mexico.

1. In the **Total Invoice by Country/Region** map, select the **Mexico** bubble. Notice that in the **Total Invoice by Sub Category** column chart, most spending is in the **Indirect Goods & Services** sub category.

    :::image type="content" source="media/sample-procurement/spend-overview-mexico.png" alt-text="Screenshot of the Spend Overview for Mexico.":::

2. Drill down into the **Indirect Goods & Services** column:

   * In the **Total Invoice by Sub Category** chart, select the drill-down arrow :::image type="icon" source="media/sample-procurement/drilldown-icon.png"::: in the upper-right corner of the chart.

   * Select the **Indirect Goods & Services** column.

      As you can see, the highest spending by far is for the **Sales & Marketing** subcategory.

   * Select **Mexico** in the map again.

      For Mexico, the biggest spending is in the **Maintenance & Repair** subcategory.

      :::image type="content" source="media/sample-procurement/drilldown-mexico.png" alt-text="Screenshot of Indirect Goods & Services drill-down for Mexico.":::

3. Select the up arrow on the upper-left corner of the chart to drill back up.
4. Select the drill-down arrow again to turn off the drill-down feature.  
5. In the top navigation pane, select **Procurement Analysis Sample** to return to the dashboard.

## Evaluate different cities

We can use highlighting to evaluate different cities.

1. Select the dashboard tile, **Total Invoice, Discount % By Month**, which opens the **Discount Analysis** page of the **Procurement Analysis Sample** report.

    If you're using Power BI Desktop, select the **Discount Analysis** tab.

2. In the **Total Invoice by City** tree map, select each city in turn to see how they compare. Notice that almost all of Miami's invoices are from tier 1 vendors.

   :::image type="content" source="media/sample-procurement/sample-discount-miami.png" alt-text="Screenshot of discount percentage by tier for Miami.":::

## Vendor discounts

Let's also explore the discounts available from vendors, and the time periods when we get the most discounts:
* Are the discounts different each month or do they remain the same?
* Do some cities get more discounts than others?

:::image type="content" source="media/sample-procurement/discount-analysis.png" alt-text="Screenshot of the discount analysis page.":::

### Discount by month

If you look at the **Total Invoice and Discount % by Month** combo chart, we see that February is the busiest month, and September is the least busy month. 

Look at the discount percent during these months. When volume increases, the discount shrinks, and when volume is low, the discount increases. The more we need the discount, the worse of a deal we get.

:::image type="content" source="media/sample-procurement/discount-month.png" alt-text="Screenshot of the discount by month chart.":::

### Discount by city

Another area to explore is the discount by city. Select each city in turn see how the other charts change:

* St. Louis had a large spike in total invoices in February and a large dip in discount savings in April.
* Mexico City has the highest discount percentage (11.05%) and Atlanta has the smallest (0.08%).

:::image type="content" source="media/sample-procurement/discount-city.png" alt-text="Screenshot of the discount by city chart.":::

## Edit the report

Select **Edit** in the **Power BI** header bar to explore in the editing view:

- See how the pages are made, the fields in each chart, and the filters on the pages.
- Add pages and charts, based on the same data.
- Change the visualization type for each chart.
- Pin charts of interest to your dashboard.

## Related content

This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always return to the **Learning center** for a new copy of this sample.

We hope this tour has shown how Power BI dashboards, Q&A, and reports can provide insights into sample data. Now it's your turn. Connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started creating in the Power BI service](../fundamentals/service-get-started.md).
