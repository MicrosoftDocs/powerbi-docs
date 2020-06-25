---
title: "Tutorial: From Excel workbook to stunning report in Power BI Desktop"
description: This tutorial shows how you can quickly create a stunning report from an Excel workbook.
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: tutorial
ms.date: 06/24/2020
ms.author: maggies

LocalizationGroup: Data from files
---
# Tutorial: From Excel workbook to stunning report in Power BI Desktop

In this tutorial, you build a beautiful report from start to finish in 20 mins! 

shape 

Your manager wants to see a report on your latest sales figures. They have requested an executive summary of: 

- Which month and year had the most profit? 
- Where is the company seeing the most success (by country)? 
- Which product and segment should the company continue to invest in? 

Using our sample finance workbook, we can build this report in no time. Here’s what the final report will look like. Let’s get started! 

> [!div class="checklist"]
> * Download sample data
> * Prepare your data with a few transformations
> * Build a report with a title, three visuals, and a slicer
> * Publish your report to the Power BI service so you can share it with your colleagues

## Prerequisites

- Before you start, you need to [download Power BI Desktop](https://powerbi.microsoft.com/desktop/).
- If you're planning to publish your report to the Power BI service and you aren't signed up yet, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

## Get data 

There are two ways to get data for this tutorial.

### Get data in Power BI Desktop

When you open Power BI Desktop, select **Try a sample dataset** from the blank canvas screen. If you have landed on this tutorial from the sample dataset dialog box, go ahead and choose **Load data**.

Shape 

### Download the sample

You can also download the sample workbook directly. 

1. Download the [Financial sample Excel workbook](https://go.microsoft.com/fwlink/?LinkID=521962).
1. Open Power BI Desktop.
1. In the **Data** section of the **Home** ribbon, select **Excel**.
1. Navigate to where you saved the sample workbook, and select **Open**.

## Prepare your data 

In **Navigator**, you have the option to *transform* or *load* the data. The Navigator provides a preview of your data so you can verify that you have the correct range of data. Numeric data types are italicized. If you need to make changes, you should transform your data before loading. To make the visualizations easier to read later, we do want to transform the data now. 

1. Select the **Financials** table. 
1. Choose **Transform Data**. 

    Shape 

    The top data cleaning step users encounter is changing data types. In this case, the units sold are in decimal form. It doesn’t make sense to have 0.2 or 0.5 of a unit sold, does it? So let’s change that to whole number. 

1. Select the **Units Sold** column. On the **Home** tab, select **Data Type**, then select **Whole Number**. Choose **Replace current** to change the column type. 

    Shape 

    We also want to make the segments easier to see in the chart later. Let’s format the Segment column to uppercase. 

1. Select the **Segment** column. On the **Transform** tab, select **Format**, then select **UPPERCASE**.

    Shape 

     

1. Let's shorten the column name from **Month Name** to just **Month**. Double-click the **Month Name** column, and rename to just **Month**.  

    Shape 

     We know the Montana product was discontinued last month, so we want to filter this data from our report to avoid confusion. 

1. In the **Product** column, select the dropdown and clear the box next to **Montana**. 

    Shape 

1. Back on the **Home** tab, select **Close & Apply**. Our data is ready for building a report. 

    Shape 

### Extra credit: Write a measure in DAX

Writing *measures* in the *DAX* formula language is super powerful for data modeling. There's lots to learn about DAX in the Power BI documentation. For now, let's write a basic measure and join two tables. 

1. Select **Data View** on the left. 

1. On the **Home** ribbon, select **New Table**. 

1. Type this measure to generate a Calendar table of all dates between January 1, 2013, and December 31, 2014.  

    `Calendar = CALENDAR(DATE(2013,01,01),Date(2014,12,31))` 

2. Select the check mark to commit.

    Shape 

1. Now select **Model View** on the left. 

1. Drag the **Date** field from the Financials table to the **Date** field in the Calendar table to join the tables, and create a *relationship* between them.  

    Shape 

## Build your report 

Now that you've transformed and loaded your data, it's time to create your report. In the Fields pane on the right, you see the fields in the data model you created. 

Let’s build the final report, one visual at a time. 

shape

### Visual 1: Add a title 

1. On the **Insert** ribbon, select **Text Box**. Type “Executive Summary – Finance Report”. 
1. Select the text you typed. Set the font size to 20 and bold. 
1. In the Visualizations pane, toggle the **Background** to **Off**. 
1. Resize the box to fit on 1 line. 

### Visual 2: Profit by Date 

Create a line chart to see which month and year had the highest profit. 

1. From the Fields pane, drag the Profit field to a blank area on the report canvas. By default, Power BI displays a bar chart. 
1. Drag the Date field to the same visual. Power BI updates the bar chart to show profit by date. 
1. In the **Fields** section of the Visualizations pane, select the drop-down in the **Axis** value and change Date from Date Hierarchy to Date. 

    shape

1. In the Visualizations pane, change the visualization type to **Line chart**. 

Now you can easily see that December 2014 had the most profit. 

Shape 

### Visual 3: Profit by Country 

Create a map to see which country had the highest profits.

- From the Fields pane, drag the Country and the Profit fields to a blank area on your report canvas. 

    Power BI creates a map visual with bubbles representing the relative profit of each location. 

    Europe seems to be performing better than North America. 

    Shape

### Visual 4: Sales by Product and Segment 

Create a bar chart to determine which companies and segments to invest in.

1. Select a blank area on your report canvas. 

1. In the Fields pane, select the Sales, Product, and Segment fields. 

    Power BI automatically creates a bar chart. 

    Looks like the company should continue to invest in the Paseo product and target the Small Business and Government segments.  

    Shape

### Visual 5: Year slicer 

Slicers are a valuable tool for filtering the visuals on a report page to a specific selection. In this case, we can create a slicer to narrow in on performance for each month and year.  

1. In the Fields pane, select Date. 
2. In the Visualizations pane, choose **Slicer**. 
3. In the Fields section of the Visualizations pane, select the drop-down in **Fields**. Remove Quarter and Day so only Year and Month are left. 
4. Expand each year and resize the visual, so all months are visible.

Now if your manager asks to see just 2013 data, you can use the slicer to switch between years, or specific months of each year. 

Shape 


### Extra credit: Format the report

If you want to do some light formatting on this report to add more polish, here are a few easy steps. 

**Theme**

- On the **View** ribbon, change the theme to **Executive**.  

Shape 

**Spruce up the visuals** 

On the **Format** tab in the Visualizations pane: 

1. Select Visual 2. In the **Title** section, change **Title text** to “Profit by Month and Year” and **Text size** to **16 pt**. Toggle **Shadow** to **On**. 

1. Select Visual 3. In the **Map styles** section, change **Theme** to **Grayscale**. In the **Title** section, change title **Text size** to **16 pt**. Toggle **Shadow** to **On**.

1. Select Visual 4. Change **Text size** to **16 pt**. Toggle **Shadow** to **On**.

1. Select Visual 5. In the **Selection controls** section, toggle **Show "Select all" option** to **On**. In the **Slicer header** section, increase **Text size** to **16 pt**. 

#### Add background shapes

**The title**

1. On the **Insert** ribbon, select **Shapes** > **Rectangle**, and stretch it the be the width and height of the title. 
1. In the **Format shape** pane, in the **Line** section, change **Transparency** to **100%**. 
1. In the **Fill color** section, change **Fill color** to **Theme color 5 #6B91C9** (blue). 
1. On the **Format** tab, select **Send backward** > **Send to back**. 
1. Select the text in Visual 1, the title, and change the font color to **White**. 

**Visuals 2 and 3**

1. On the **Insert** ribbon, select **Shapes** > **Rectangle**, and stretch it the be the width and height of Visuals 2 and 3. 
1. In the **Format shape** pane, in the **Line** section, change **Transparency** to **100%**. 
1. On the **Format** tab, select **Send backward** > **Send to back**. 

## End result

Your final polished report will look like this:  

shape

In summary, this report answers your manager’s top questions: 

- Which month and year had the most profit? 

    December 2014 

- Where is the company seeing the most success (by country)? 

    In Europe, specifically France and Germany. 

- Which product and segment should the company continue to invest in? 

    The company should continue to invest in the Paseo product and target the Small Business and Government segments. 

## Save your report

- On the **File** menu, select **Save**.

## Publish to the Power BI service to share 

To share the report with your manager and colleagues, you can publish this report to the Power BI service. When you share with colleagues that have a Power BI account, they can interact with your report, but can’t save changes. 

1. In Power BI Desktop, select **Publish** on the **Home** ribbon. 
1. Select a destination such as **My workspace** in the Power BI service.
1. Go to the Power BI service (app.powerbi.com) in the browser. 
1. In the workspace where you saved the report, open the report to view it on the web. 
1. To share your report, at the top of the report, select **Share**.

## Next steps

- [Tutorial: Analyze sales data from Excel and an OData feed](../connect-data/desktop-tutorial-analyzing-sales-data-from-excel-and-an-odata-feed.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
