---
title: "Tutorial: From Excel workbook to stunning report in Power BI Desktop"
description: This tutorial shows how you can quickly create a stunning report from an Excel workbook.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 08/16/2024
LocalizationGroup: Data from files
---
# Tutorial: From Excel workbook to stunning report in Power BI Desktop

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you build a beautiful report from start to finish in 20 minutes! 

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-formatted-report.png" alt-text="Screenshot of finished Power BI report." lightbox="media/desktop-excel-stunning-report/power-bi-excel-formatted-report.png"::: 

Your manager wants to see a report on your latest sales figures. They've requested an executive summary of: 

- Which month and year had the most profit? 
- Where is the company seeing the most success (by country/region)? 
- Which product and segment should the company continue to invest in? 

Using our sample finance workbook, we can build this report in no time. Here’s what the final report will look like. Let’s get started! 

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> * Download sample data two different ways
> * Prepare your data with a few transformations
> * Build a report with a title, three visuals, and a slicer
> * Publish your report to the Power BI service so you can share it with your colleagues

## Prerequisites

- Before you start, you need to [download Power BI Desktop](https://powerbi.microsoft.com/desktop/).
- If you're planning to publish your report to the Power BI service and you aren't signed up yet, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

## Get data 

You can get the data for this tutorial using one of two methods.

### Get data in Power BI Desktop

When you open Power BI Desktop, select **Try a sample semantic model** from the blank canvas.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-desktop-canvas-sample-dataset.png" alt-text="Screenshot of Try a sample semantic model on the canvas." lightbox="media/desktop-excel-stunning-report/power-bi-desktop-canvas-sample-dataset.png"::: 

If you've landed on this tutorial from Power BI Desktop, go ahead and choose **Load data**.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-two-ways-load-data.png" alt-text="Screenshot of Two ways to use sample data > Load data.":::

### Download the sample

You can also download the sample workbook directly. 

1. Download the [Financial sample Excel workbook](https://go.microsoft.com/fwlink/?LinkID=521962).
1. Open Power BI Desktop.
1. In the **Data** section of the **Home** ribbon, select **Excel**.
1. Navigate to where you saved the sample workbook, and select **Open**.

## Prepare your data 

In **Navigator**, you have the option to *transform* or *load* the data. The Navigator provides a preview of your data so you can verify that you have the correct range of data. Numeric data types are italicized. If you need to make changes, transform your data before loading. To make the visualizations easier to read later, we do want to transform the data now. As you do each transformation, you see it added to the list under **Query Settings** in **Applied Steps** 

1. Select the **Financials** table, and choose **Transform Data**. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-financial-navigator.png" alt-text="Screenshot of Power BI Navigator with Financial sample data." lightbox="media/desktop-excel-stunning-report/power-bi-financial-navigator.png"::: 

1. Select the **Units Sold** column. On the **Transform** tab, select **Data Type**, then select **Whole Number**. Choose **Replace current** to change the column type. 

    The top data cleaning step users do most often is changing data types. In this case, the units sold are in decimal form. It doesn’t make sense to have 0.2 or 0.5 of a unit sold, does it? So let’s change that to whole number. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-query-whole-number.png" alt-text="Screenshot of changing a decimal number to a whole number."::: 

1. Select the **Segment** column. We want to make the segments easier to see in the chart later, so let’s format the Segment column. On the **Transform** tab, select **Format**, then select **UPPERCASE**.

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-upper-case.png" alt-text="screenshot of changing lowercase to uppercase headings.":::

1. Let's shorten the column name from **Month Name** to just **Month**. Double-click the **Month Name** column, and rename to just **Month**.  

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-month-name.png" alt-text="Screenshot of shortening column name.":::

1. In the **Product** column, select the dropdown and clear the box next to **Montana**. 

     We know the Montana product was discontinued last month, so we want to filter this data from our report to avoid confusion. 

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-montana.png" alt-text="Screenshot of deleting Montana values.":::

1. You see that each transformation has been added to the list under **Query Settings** in **Applied Steps**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-query-applied-steps.png" alt-text="Screenshot of list of applied steps.":::

1. Back on the **Home** tab, select **Close & Apply**. Our data is almost ready for building a report. 

    You see the Sigma symbol in the Data list? Power BI has detected that those fields are numeric. Power BI also indicates the date field with a calendar symbol.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-fields-list-sigmas-date.png" alt-text="Screenshot of Data list with numeric fields and date field.":::

## Extra credit: Write two expressions in DAX

Writing *measures* and creating *tables* in the *DAX* formula language is super powerful for data modeling. There's lots to learn about DAX in the Power BI documentation. For now, let's write a basic expression to create a new measure, and another expression to create a whole table.

### Create a new measure

1. On the **Home** ribbon, select **New measure**.

    :::image type="content" source="media/desktop-excel-stunning-report/desktop-new-measure-icon.png" alt-text="Screenshot of New measure icon on the Home ribbon." lightbox="media/desktop-excel-stunning-report/desktop-new-measure-icon.png":::

1. Type this expression to add all the numbers in the Units Sold column.

    ```dax
    Total Units Sold = SUM(financials[Units Sold])    
    ```
    
1. Select the check mark to commit.
    
    :::image type="content" source="media/desktop-excel-stunning-report/dax-total-units-sold.png" alt-text="Screenshot of DAX expression Total Units Sold.":::

 ### Create a new table
 
1. Now select the **Data** view on the left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-data-view.png" alt-text="Screenshot of Data View icon.":::

1. On the **Home** ribbon, select **New table**. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-new-table.png" alt-text="Screenshot of New Table icon.":::

1. Type this expression to generate a Calendar table of all dates between January 1, 2013, and December 31, 2014.

    ```dax
    Calendar = CALENDAR(DATE(2013,01,01),Date(2014,12,31))    
    ```

1. Select the check mark to commit.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-dax-expression.png" alt-text="Screenshot of DAX expression Calendar.":::

    Here are the first 23 rows of the single-column table you just created.

    :::image type="content" source="media/desktop-excel-stunning-report/calendar-result.png" alt-text="Screenshot of the calendar you created with the DAX expression.":::
   
1. Now select **Model** view on the left. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-model-view.png" alt-text="Screenshot of Model View icon.":::

1. Drag the **Date** field from the financials table to the **Date** field in the Calendar table to join the tables, and create a *relationship* between them.  

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-relationship.png" alt-text="Screenshot of relationship between Date fields.":::

## Build your report 

Now that you've transformed and loaded your data, it's time to create your report. In the left rail, select **Report view**. 

:::image type="content" source="media/desktop-excel-stunning-report/report-view-icon.png" alt-text="Screenshot of Report view icon.":::

In the Data pane on the right, you see the fields in the data model you created. 

Let’s build the final report, one visual at a time. 

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png" alt-text="Screenshot of relationship between Date fields." lightbox="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png":::

### Visual 1: Add a title 

1. On the **Insert** ribbon, select **Text Box**. Type “Executive Summary – Finance Report”. 
1. Select the text you typed. Set the **Font Size** to 20 and **Bold**. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-title-executive-summary.png" alt-text="Screenshot of formatting title.":::

1. Resize the box to fit on one line. 

### Visual 2: Profit by Date 

Now, you create a line chart to see which month and year had the highest profit. 

1. From the Data pane, drag the **Profit** field to a blank area on the report canvas. By default, Power BI displays a column chart with one column, Profit. 
1. Drag the **Date** field to the same visual. If you created a Calendar table in [Extra credit: Create a table in DAX](#create-a-new-table) earlier in this article, drag the **Date** field from your Calendar table instead. 

    Power BI updates the column chart to show profit by the two years.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-column-year.png" alt-text="Screenshot of Profit column chart.":::

1. In the **Add data to your visual** section of the Visualizations pane, select the drop-down in the **X-axis** value. Change **Date** from **Date Hierarchy** to **Date**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-hierarchy-trim.png" alt-text="Screenshot of changing Date hierarchy to Date.":::

    Power BI updates the column chart to show profit for each month.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-line-month.png" alt-text="Screenshot of column chart by month.":::

1. In the Visualizations pane, change the visualization type to **Line chart**. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-profit-date-line-chart.png" alt-text="Screenshot of changing column to bar chart.":::

    Now you can easily see that December 2014 had the most profit.

### Visual 3: Profit by Country/Region 

Create a map to see which country/region had the highest profits.

1. From the Data pane, drag the **Country** field to a blank area on your report canvas to create a map.
1. Drag the **Profit** field to the map.

    Power BI creates a map visual with bubbles representing the relative profit of each location. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-map-visual.png" alt-text="Screenshot of creating map chart.":::

    Europe seems to be performing better than North America. 

### Visual 4: Sales by Product and Segment 

Create a bar chart to determine which companies and segments to invest in.

1. Drag the two charts you've created to be side by side in the top half of the canvas. Save some room on the left side of the canvas. 
1. Select a blank area in the lower half of your report canvas. 

1. In the Data pane, select the **Sales**, **Product**, and **Segment** fields. 

    Power BI automatically creates a clustered column chart. 

1. Drag the chart so it's wide enough to fill the space under the two upper charts.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-clustered-column-chart-inline.png" alt-text="Screenshot of a clustered column chart." lightbox="media/desktop-excel-stunning-report/power-bi-clustered-column-chart-inline.png":::

    Looks like the company should continue to invest in the Paseo product and target the Small Business and Government segments.  

### Visual 5: Year slicer 

Slicers are a valuable tool for filtering the visuals on a report page to a specific selection. In this case, we can create two different slicers to narrow in on performance for each month and year. One slicer uses the date field in the original table. The other uses the [date table you may have created for "extra credit"](#create-a-new-table) earlier in this tutorial.


**Date slicer using the original table**

1. In the Data pane, select the **Date** field in the Financials table. Drag it to the blank area on the left of the canvas. 
2. In the Visualizations pane, choose **Slicer**. 

    Slicer is the icon with a funnel next to a tab, but without the small lightning bolt. Power BI automatically creates a numeric range slicer. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-numeric-range.png" alt-text="Screenshot of Date numeric range slicer.":::

1. You can drag the ends to filter, or select the arrow in the upper-right corner and change it to a different type of slicer.

**Date slicer using the DAX table**

1. In the Data pane, select the **Date** field in the Calendar table. Drag it to the blank area on the left of the canvas. 
2. In the Visualizations pane, choose **Slicer**. 
3. In the Data section of the Visualizations pane, select the drop-down in **Data**. Remove Quarter and Day so only Year and Month are left. 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-hierarchy-trim.png" alt-text="Screenshot of changing the Date hierarchy.":::

4. Expand each year and resize the visual, so all months are visible.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-hierarchy-date-slicer.png" alt-text="Screenshot of date hierarchy slicer.":::

    We'll use this slicer in the finished report.

Now if your manager asks to see just 2013 data, you can use either slicer to select years, or specific months of each year.

### Extra credit: Format the report

If you want to do some light formatting on this report to add more polish, here are a few easy steps. 

**Theme**

- On the **View** ribbon, change the theme to **Executive**.  

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-theme-executive.png" alt-text="Screenshot of selecting the Executive theme."::: 

**Spruce up the visuals** 

Make the following changes on the **Format** tab in the Visualizations pane.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-format-tab-visualizations.png" alt-text="Screenshot of the Format tab in the Visualizations pane.":::

1. Select Visual 2. In the **Title** section, change **Title text** to “Profit by Month and Year” and **Text size** to **16 pt**. Toggle **Shadow** to **On**. 

1. Select Visual 3. In the **Map styles** section, change **Theme** to **Grayscale**. In the **Title** section, change title **Text size** to **16 pt**. Toggle **Shadow** to **On**.

1. Select Visual 4. In the **Title** section, change title **Text size** to **16 pt**. Toggle **Shadow** to **On**.

1. Select Visual 5. In the **Selection controls** section, toggle **Show "Select all" option** to **On**. In the **Slicer header** section, increase **Text size** to **16 pt**. 

**Add a background shape for the title**

1. On the **Insert** ribbon, select **Shapes** > **Rectangle**. Place it at the top of the page, and stretch it to be the width of the page and height of the title. 
1. In the **Format shape** pane, in the **Visual border** section, set it to **Off**. 
1. In the **Fill** section, change **Fill color** to **Theme color 5 #6B91C9** (blue). 

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-theme-color-5.png" alt-text="Screenshot of Theme color 5.":::

1. On the **Format** tab, select **Send backward** > **Send to back**. 
1. Select the text in Visual 1, the title, and change the font color to **White**. 

**Add a background shape for visuals 2 and 3**

1. On the **Insert** ribbon, select **Shapes** > **Rectangle**, and stretch it to be the width and height of Visuals 2 and 3. 
1. In the **Format shape** pane, in the **Border** section, change **Transparency** to **100%**. 
2. In the **Fill** section, set the color to **White, 10% darker**.
3. On the **Format** tab, select **Send backward** > **Send to back**. 

### Finished report

Here's how your final polished report will look:  

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-formatted-report.png" alt-text="Screenshot of final, formatted report." lightbox="media/desktop-excel-stunning-report/power-bi-excel-formatted-report.png":::

In summary, this report answers your manager’s top questions: 

- Which month and year had the most profit? 

    December 2014 

- Which country/region is the company seeing the most success in? 

    In Europe, specifically France and Germany. 

- Which product and segment should the company continue to invest in? 

    The company should continue to invest in the Paseo product and target the Small Business and Government segments. 

## Save your report

- On the **File** menu, select **Save**, or hold **Ctrl** and then press the **S** key. If you're saving the report for the first time, you're prompted for a location to save it to.

## Publish to the Power BI service to share 

To share your report with your manager and colleagues, publish it to the Power BI service. When you share with colleagues that have a Power BI account, they can interact with your report, but can’t save changes. 

1. In Power BI Desktop, select **Publish** on the **Home** ribbon. 

    You may need to sign in to the Power BI service. If you don't have an account yet, you can [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. Select a destination such as **My workspace** in the Power BI service > **Select**.
1. Select **Open 'your-file-name' in Power BI**.

    :::image type="content" source="media/desktop-excel-stunning-report/open-power-bi.png" alt-text="Screenshot of opening your report in the Power BI service.":::

    Your completed report opens in the browser.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-report-service.png" alt-text="Screenshot of your completed Power B I report in the Power B I service."::: 

1. Select **Share** at the top of the report to share your report with others.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-share-report.png" alt-text="Screenshot of sharing your report from the Power BI service.":::

## Related content

- [Tutorial: Analyze sales data from Excel and an OData feed](../connect-data/desktop-tutorial-analyzing-sales-data-from-excel-and-an-odata-feed.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
