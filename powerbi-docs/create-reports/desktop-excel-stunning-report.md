---
title: "Tutorial: Excel to stunning report in Power BI Desktop"
description: This tutorial shows how you can quickly create a stunning report in Power BI Desktop from an Excel workbook.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 02/13/2025
LocalizationGroup: Data from files
#customer intent: As a business analyst, I want to create a visually appealing and informative report from Excel data in Power BI Desktop so that I can effectively communicate key insights and performance metrics to my manager and colleagues.
---
# Tutorial: From Excel workbook to stunning report in Power BI Desktop

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you build a beautiful report from start to finish in 20 minutes!

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-report-service.png" alt-text="Screenshot of your completed Power B I report in the Power B I service." lightbox="media/desktop-excel-stunning-report/power-bi-excel-report-service.png":::

Your manager wants to see a report on your latest sales figures. They've requested an executive summary of:

- Which month and year had the most profit?
- Where is the company seeing the most success (by country/region)?
- Which product and segment should the company continue to invest in?

Using our sample finance workbook, we can build this report in no time. Here’s what the final report will look like. Let’s get started!

In this tutorial, you'll learn how to:

> [!div class="checklist"]
> * Download sample data.
> * Prepare your data with a few transformations.
> * Build a report with a title, three visuals, and a slicer.
> * Publish your report to the Power BI service so you can share it with your colleagues.

## Prerequisites

- Before you start, you need to [download Power BI Desktop](https://powerbi.microsoft.com/desktop/).
- If you're planning to publish your report to the Power BI service and you aren't signed up yet, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

## Get data

You can get the data for this tutorial using one of two methods.

### Get data in Power BI Desktop

When you open Power BI Desktop, select **Learn with sample data** from the Home page.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-desktop-canvas-sample-dataset.png" alt-text="Screenshot of Learn with sample data tile highlighted in Power B I Desktop." lightbox="media/desktop-excel-stunning-report/power-bi-desktop-canvas-sample-dataset.png":::

In the dialog that opens, choose **Load sample data**.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-two-ways-load-data.png" alt-text="Screenshot of Two ways to use sample data > Load data.":::

### Download the sample

You can also download the sample workbook directly.

1. Download the [Financial Sample Excel workbook](https://go.microsoft.com/fwlink/?LinkID=521962).
1. Open Power BI Desktop.
1. On the Home page, select **Excel workbook**.
1. Navigate to where you saved the sample workbook and select **Open**.

## Prepare your data

In **Navigator**, you have the option to *transform* or *load* the data. The Navigator provides a preview of your data so you can verify that you have the correct range of data. Numeric data types are italicized. If you need to make changes, transform your data before loading. To make the visualizations easier to read later, we want to transform the data for this exercise. As you make each transformation in Power Query Editor, you see it added to the list under **Query Settings** in **APPLIED STEPS**.

1. Select the checkbox for the **financials** table, then select **Transform Data**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-financial-navigator.png" alt-text="Screenshot of Power BI Navigator with Financial sample data." lightbox="media/desktop-excel-stunning-report/power-bi-financial-navigator.png":::

1. The Power Query Editor opens. Select the **Units Sold** column. On the **Transform** tab, select **Data Type**, then select **Whole Number**. In the **Change Column Type** dialog that opens, choose **Replace current**.

    The top data cleaning step users do most often is changing data types. In this case, the units sold are in decimal form. It doesn’t make sense to have 0.2 or 0.5 of a unit sold, so we change it to a whole number.

    :::image type="content" source="media/desktop-excel-stunning-report/power-query-whole-number.png" alt-text="Screenshot of changing a decimal number to a whole number.":::

1. Select the **Segment** column. We want to make the segments easier to see in the chart later, so let’s format the data in the Segment column. On the **Transform** tab, select **Format**, then select **UPPERCASE**.

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-upper-case.png" alt-text="Screenshot of changing the format from lowercase to uppercase.":::

1. Let's shorten the column name from **Month Name** to just **Month**. Double-click the **Month Name** column, and rename it to just **Month**.  

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-month-name.png" alt-text="Screenshot of column name selected for editing.":::

1. On the **Product** column header, select the dropdown and clear the box next to **Montana**.

     We know the Montana product was discontinued last month, so we want to filter this data from our report to avoid confusion.

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-montana.png" alt-text="Screenshot of cleared checkbox for Montana value.":::

1. You can see that each transformation has been added to the list under **Query Settings** in **APPLIED STEPS**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-query-applied-steps.png" alt-text="Screenshot of transformations listed in applied steps.":::

1. Back on the **Home** tab, select **Close & Apply**. Our data is almost ready for building a report.

    The sigma symbol in the Data list indicates a field that Power BI has detected is numeric. Power BI also indicates the date field with a calendar symbol.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-fields-list-sigmas-date.png" alt-text="Screenshot of Data list with numeric fields and date field.":::

## Extra credit: Write two expressions in DAX

Writing *measures* and creating *tables* in the *DAX* formula language is super powerful for data modeling. There's lots to learn about DAX in the Power BI documentation. For now, let's write a basic expression to create a new measure, and another expression to create a whole table.

### Create a new measure

1. On the **Home** ribbon, select **New measure**.

    :::image type="content" source="media/desktop-excel-stunning-report/desktop-new-measure-icon.png" alt-text="Screenshot of New measure icon on the Home ribbon." lightbox="media/desktop-excel-stunning-report/desktop-new-measure-icon.png":::

1. Copy and paste this expression in the designated area to add all the numbers in the Units Sold column.

    ```dax
    Total Units Sold = SUM(financials[Units Sold])    
    ```

1. Select the check mark to commit. The measure is added to the list in the Data pane.
  
    :::image type="content" source="media/desktop-excel-stunning-report/dax-total-units-sold.png" alt-text="Screenshot of DAX expression Total Units Sold.":::

### Create a new table

1. Now select the **Table view** icon on the left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-data-view.png" alt-text="Screenshot of Table view icon in Power B I Desktop.":::

1. On the **Home** ribbon, select **New table**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-new-table.png" alt-text="Screenshot of New Table button in the Home ribbon.":::

1. Copy and paste this expression in the designated area to generate a Calendar table of all dates between January 1, 2013, and December 31, 2014.

    ```dax
    Calendar = CALENDAR(DATE(2013,01,01),Date(2014,12,31))    
    ```

1. Select the check mark to commit.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-dax-expression.png" alt-text="Screenshot of DAX expression to create a calendar table.":::

    Here are the first 23 rows of the single-column table you just created.

    :::image type="content" source="media/desktop-excel-stunning-report/calendar-result.png" alt-text="Screenshot of calendar table created with DAX expression.":::

1. Now select **Model view** on the left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-model-view.png" alt-text="Screenshot of model view icon in Power B I Desktop.":::

1. Drag the **Date** field from the financials table to the **Date** field in the Calendar table to join the tables and create a *relationship* between them. In the **New relationship** dialog that opens, select **Save** to apply the selections that Power BI automatically filled in for you.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-relationship.png" alt-text="Screenshot of relationship between Date fields.":::

## Build your report

Now that you've transformed and loaded your data, it's time to create your report. In the left rail, select **Report view**.

:::image type="content" source="media/desktop-excel-stunning-report/report-view-icon.png" alt-text="Screenshot of report view icon in Power B I Desktop.":::

In the Data pane on the right, you see the fields in the data model you created.

Let’s build the final report, one visual at a time.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png" alt-text="Screenshot of all the elements of the report, by number." lightbox="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png":::

### Visual 1: Add a title

1. On the **Insert** ribbon, select **Text box**. Inside the text box, type “Executive Summary – Finance Report”.
1. Select the text you typed. Make the font **bold** and set the **size** to 20.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-title-executive-summary.png" alt-text="Screenshot of text box title selected for formatting.":::

1. Resize the box to fit on one line.

### Visual 2: Profit by date

Now you create a line chart to see which month and year had the highest profit.

1. From the Data pane, drag the **Profit** field to a blank area on the report canvas. By default, Power BI displays a column chart with one column, Profit.
1. Drag the **Date** field to the same visual. Power BI updates the column chart to show monthly profit for the two years.

   If you created a Calendar table in [Extra credit: Create a new table](#create-a-new-table) earlier in this article, expand the **Date** field in the Data pane, then select the checkbox for **Date Hierarchy**. Clear the checkboxes next to the **Quarter** and **Day** fields, or, alternatively, remove the fields from where they're listed in the **X-axis** well on the **Build a visual** tab of the **Visualizations** pane.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-column-chart-date.png" alt-text="Screenshot of column chart showing profit by month for two different years." lightbox="media/desktop-excel-stunning-report/power-bi-column-chart-date.png":::

1. On the Build visual tab, change the visualization type to **Line chart**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-profit-date-line-chart.png" alt-text="Screenshot of changing column to line chart.":::

    Now you can easily see that December 2014 had the highest profit.

### Visual 3: Profit by country/region

Create a map to see which country/region had the highest profits.

1. From the Data pane, drag the **Country** field to a blank area on your report canvas to create a map.
1. Drag the **Profit** field to the map.

    Power BI adds bubbles representing the relative profit of each location to the map visual.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-map-visual.png" alt-text="Screenshot of map visual showing profit by country." lightbox="media/desktop-excel-stunning-report/power-bi-map-visual.png":::

    Europe seems to be performing better than North America.

### Visual 4: Sales by product and segment

Create a bar chart to determine which companies and segments to invest in.

1. Drag the two charts you've created to be side by side in the top half of the canvas. Save some room on the left side of the canvas.
1. Select a blank area in the lower half of your report canvas.

1. In the Data pane, select the **Sales**, **Product**, and **Segment** fields.

    Power BI automatically creates a clustered column chart visualizing the data.

1. Drag the handles on the chart so it's wide enough to fill the space under the two upper charts.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png" alt-text="Screenshot of line chart and map visual positioned under report title and over column chart." lightbox="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png":::

    It looks like the company should continue to invest in the Paseo product and target the Small Business and Government segments.  

### Visual 5: Year slicer

Slicers are a valuable tool for filtering the visuals on a report page to a specific selection. In this case, we can create two different slicers to narrow in on performance for each month and year. One slicer uses the Date field in the original table. The other uses the [Date table you may have created for "extra credit"](#create-a-new-table) earlier in this tutorial.

**Date slicer using the original table**

1. In the Data pane, select the **Date** field in the financials table. Drag it to the blank area you reserved on the canvas.
1. In the Visualizations pane, choose **Slicer**.

    Slicer is the icon with a funnel next to a tab, but without the small lightning bolt. Power BI automatically creates a numeric range slicer.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-numeric-range.png" alt-text="Screenshot of Date numeric range slicer.":::

1. You can drag the ends to filter the date range. You can change to a different type of slicer on the Visualization pane's Format visual tab. The options are under **Visual** > **Slicer settings** > **Options** > **Style**.

**Date slicer using the DAX table**

1. In the Data pane, select the **Date** field in the Calendar table. Drag it to the blank area on the canvas.
1. On the Visualizations pane's Build visual tab, choose **Slicer**.
1. In the Data pane, expand the **Data** field and clear the boxes for Quarter and Day so only Year and Month are left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-hierarchy-trim.png" alt-text="Screenshot of changing the Date hierarchy.":::

1. Expand each year and resize the visual, so all months are visible.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-hierarchy-date-slicer.png" alt-text="Screenshot of date hierarchy slicer with both years expanded to show all months.":::

    We'll use this slicer in the finished report.

Now, if your manager asks to see just 2013 data, you can use the slicer to select that year, or specific months of that year.

### Extra credit: Format the report

If you want to do some light formatting on this report to add more polish, here are a few easy steps.

**Theme**

- On the **View** ribbon, change the theme to **Executive**.  

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-theme-executive.png" alt-text="Screenshot of selecting the Executive theme.":::

**Spruce up the visuals**

With the appropriate visual selected, make the following changes on the **Visualizations** pane.

1. Select Visual 2, the column chart showing profit over time. Under **Format visual** > **General**, expand the **Title** section. Change the text in the **Text** field to “Profit by Month and Year” and change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.

1. Select Visual 3, the map. Under **Format visual** > **Visual**, expand **Map settings** and **Style**, then choose **Grayscale**. Under **Format visual** > **General**, expand the **Title** section and change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.

1. Select Visual 4, the clustered column chart showing sales by product and segment. Under **Format visual** > **General**, expand the **Title** section. Change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.

1. Select Visual 5, the year slicer. Under **Format visual** > **Visual**, expand **Slicer settings** > **Selection** and toggle **Show "Select all" option** to **On**. In the **Slicer header** section, increase the **Font** size to **16**.

**Add a background shape for the title**

1. On the **Insert** tab in the ribbon at the top, select **Shapes** > **Rectangle**. Place it at the top of the page and adjust the dimensions to be the width of the page and height of the title.
1. In the **Format shape** pane, under **Shape**, expand the **Style** section and set **Border** to **Off**.
1. In the **Fill** section, change **Color** to **Theme color 5 #6B91C9** (blue).

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-theme-color-5.png" alt-text="Screenshot of Theme color 5 highlighted.":::

1. On the **Format** tab in the ribbon, select **Send backward** > **Send to back** to position the shape behind the title text.
1. Select the text in Visual 1, the title, and change the font color to **White**.

**Add a background shape for Visuals 2 and 3**

1. On the **Insert** tab in the ribbon at the top, select **Shapes** > **Rectangle**, and adjust the dimensions to be the width and height of Visuals 2 and 3.
1. In the **Format shape** pane, on the **Shape** tab, expand the **Style** and **Border** sections, then change the **Transparency** value to **100%**.
1. In the **Fill** section, set the **Color** to **White, 10% darker**.
1. On the **Format** tab in the ribbon, select **Send backward** > **Send to back** to position the rectangle behind the visuals.

### Finished report

Here's how your final, polished report will look:  

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png" alt-text="Screenshot of final, formatted report in Power B I Desktop." lightbox="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png":::

In summary, this report answers your manager’s top questions:

- Which month and year had the most profit?

    December 2014.

- Which country/region is the company seeing the most success in?

    In Europe, specifically France and Germany.

- Which product and segment should the company continue to invest in?

    The company should continue to invest in the Paseo product and target the Small Business and Government segments.

## Save your report

- On the **File** menu, select **Save**, or hold **Ctrl** and then press the **S** key. If you're saving the report for the first time, you're prompted for a name and location to save it to.

## Publish to the Power BI service to share

To share your report with your manager and colleagues, publish it to the Power BI service. When you share with colleagues that have a Power BI account, they can interact with your report, but can’t save changes.

1. In Power BI Desktop, select **Publish** on the **Home** tab.

    You might need to sign in to the Power BI service. If you don't have an account yet, you can [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. Select a destination in the Power BI service where the report will be saved, such as My workspace.
1. Select **Open 'your-file-name' in Power BI**.

    :::image type="content" source="media/desktop-excel-stunning-report/open-power-bi.png" alt-text="Screenshot of opening your report in the Power BI service.":::

    Your published report opens in the browser.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-report-service.png" alt-text="Screenshot of your completed Power B I report in the Power B I service.":::

1. Select **Share** at the top of the report to share your report with others.

## Related content

- [Tutorial: Analyze sales data from Excel and an OData feed](../connect-data/desktop-tutorial-analyzing-sales-data-from-excel-and-an-odata-feed.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
