---
title: "Tutorial: From Excel Workbook to Stunning Report in Power BI Desktop"
description: This tutorial shows how you can quickly create a stunning report in Power BI Desktop from an Excel workbook.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 12/01/2025
ai-usage: ai-assisted
LocalizationGroup: Data from files
#customer intent: As a business analyst, I want to create a visually appealing and informative report from Excel data in Power BI Desktop so that I can effectively communicate key insights and performance metrics to my manager and colleagues.
---

# Tutorial: From Excel workbook to stunning report in Power BI Desktop

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you create a beautiful report from start to finish in 20 minutes.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-report-service.png" alt-text="Screenshot of the completed Power BI report in the Power BI service." lightbox="media/desktop-excel-stunning-report/power-bi-excel-report-service.png":::

Your manager wants to see a report on your latest sales figures. They request an executive summary of:

- Which month and year had the most profit?
- Where is the company seeing the most success (by country/region)?
- Which product and segment should the company continue to invest in?

By using the sample finance workbook, you can build this report in no time. Here's what the final report looks like. Let's get started!

In this tutorial, you learn how to:

> [!div class="checklist"]
>
> - Download sample data.
> - Prepare your data with a few transformations.
> - Build a report with a title, three visuals, and a slicer.
> - Publish your report to the Power BI service so you can share it with your colleagues.

## Prerequisites

Before starting this tutorial, make sure you have:

- [Power BI Desktop](https://www.microsoft.com/power-platform/products/power-bi/desktop) installed on your computer.
- A Power BI account if you plan to publish your report to the Power BI service. If you don't have an account, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).
- Basic familiarity with Excel and Power BI Desktop interface.

> [!NOTE]
> This tutorial guides you through data preparation and report creation. You need to complete the data preparation steps before building visuals, as the report design depends on having a properly structured and cleaned data model ready.

## Get data

You can get the data for this tutorial using one of two methods: connect to the sample directly from Power BI Desktop, or download and open it in Power BI Desktop.

### Get data in Power BI Desktop

When you open Power BI Desktop, select **Learn with sample data** from the Home page.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-desktop-canvas-sample-dataset.png" alt-text="Screenshot of Learn with sample data tile highlighted in Power B I Desktop." lightbox="media/desktop-excel-stunning-report/power-bi-desktop-canvas-sample-dataset.png":::

In the dialog that opens, choose **Load sample data**.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-two-ways-load-data.png" alt-text="Screenshot of Two ways to use sample data > Load data.":::

### Download the sample

You can also download the sample workbook directly.

1. Download the [Financial Sample Excel workbook](https://go.microsoft.com/fwlink/?LinkID=521962). The file downloads automatically when you select the link.

   > [!TIP]
   > **Having trouble downloading?** If the download doesn't start automatically, try right-clicking the link and selecting **Save link as** or **Save target as**. You can also copy and paste this direct URL into your browser: `https://download.microsoft.com/download/1/4/E/14EDED28-6C58-4055-A65C-23B4DA81C4DE/Financial%20Sample.xlsx`

1. Open Power BI Desktop.
1. On the **Home** page, select **Excel workbook**.
1. Go to the folder where you saved the sample workbook and select **Open**.

## Prepare your data

In **Navigator**, you can *transform* or *load* the data. The preview lets you verify you have the expected range and detected data types. If you need to make changes, transform your data before loading. To make the visualizations easier to read later, transform the data for this exercise. As you make each transformation in Power Query Editor, you see it added to the list under **Query Settings** in **APPLIED STEPS**.

> [!IMPORTANT]
> Before you can load or transform data, you must select the checkbox next to the table or tables you want to use. If you skip this step, the **Load** and **Transform Data** buttons remain inactive.

1. Select the checkbox for the **financials** table, and then select **Transform Data**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-financial-navigator.png" alt-text="Screenshot of Power BI Navigator with Financial sample data." lightbox="media/desktop-excel-stunning-report/power-bi-financial-navigator.png":::

1. The Power Query Editor opens. Select the **Units Sold** column. On the **Transform** tab, select **Data Type**, and then select **Whole Number**. In the **Change Column Type** dialog that opens, choose **Replace current**.

    Changing data types is the data cleaning step that users most often. In this case, the units sold are in decimal form. It doesn't make sense to have 0.2 or 0.5 of a unit sold, so change it to a whole number.

    :::image type="content" source="media/desktop-excel-stunning-report/power-query-whole-number.png" alt-text="Screenshot of changing a decimal number to a whole number.":::

1. To make the segments easier to see in the chart later, format the data in the Segment column. Select the **Segment** column. On the **Transform** tab, select **Format**, and then select **UPPERCASE**.

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-upper-case.png" alt-text="Screenshot of changing the format from lowercase to uppercase.":::

1. Shorten the column name from **Month Name** to just **Month**. Double-click the **Month Name** column, and rename it to **Month**.  

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-month-name.png" alt-text="Screenshot of column name selected for editing.":::

1. On the **Product** column header, select the dropdown and clear the box next to **Montana**.

     The Montana product was discontinued last month, so filter this data from the report to avoid confusion.

     :::image type="content" source="media/desktop-excel-stunning-report/power-query-montana.png" alt-text="Screenshot of cleared checkbox for Montana value.":::

1. Each transformation appears in the list under **Query Settings** in **APPLIED STEPS**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-query-applied-steps.png" alt-text="Screenshot of transformations listed in applied steps.":::

1. Back on the **Home** tab, select **Close & Apply**. The data is almost ready for building a report.

    The sigma symbol in the Data list indicates a field that Power BI detects as numeric. Power BI uses a calendar symbol to denote a date field.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-fields-list-sigmas-date.png" alt-text="Screenshot of Data list with numeric fields and date field.":::

## Extra credit: Write two expressions in DAX

Writing *measures* and creating *tables* in the *DAX* formula language is super powerful for data modeling. There's lots to learn about DAX in the Power BI documentation. For now, let's write a basic expression to create a new measure, and another expression to create a whole table.

> [!IMPORTANT]
> **DAX expressions not working?** If you're using a non-English locale (such as Spanish, French, or German), you might need to use semicolons (`;`) instead of commas (`,`) to separate function arguments in DAX formulas. For example, use `DATE(2013;01;01)` instead of `DATE(2013,01,01)`. Also, make sure the table name in your formula matches exactly what appears in your Data pane (it should be **financials** if you followed the earlier steps).

### Create a new measure

1. On the **Home** ribbon, select **New measure**.

    :::image type="content" source="media/desktop-excel-stunning-report/desktop-new-measure-icon.png" alt-text="Screenshot of New measure icon on the Home ribbon." lightbox="media/desktop-excel-stunning-report/desktop-new-measure-icon.png":::

1. Copy and paste this expression in the formula bar at the top of the report canvas to add all the numbers in the Units Sold column.

    ```dax
    Total Units Sold = SUM(financials[Units Sold])
    ```

1. Select the check mark to commit. The measure is added to the list in the Data pane.
  
    :::image type="content" source="media/desktop-excel-stunning-report/dax-total-units-sold.png" alt-text="Screenshot of DAX expression Total Units Sold.":::

### Create a new table

1. Select the **Table view** icon on the left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-data-view.png" alt-text="Screenshot of Table view icon in Power BI Desktop.":::

1. On the **Home** ribbon, select **New table**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-new-table.png" alt-text="Screenshot of New Table button in the Home ribbon.":::

1. Copy and paste this expression in the formula bar to generate a Calendar table of all dates between January 1, 2013, and December 31, 2014.

    ```dax
    Calendar = CALENDAR(DATE(2013,01,01),DATE(2014,12,31))
    ```

    If your locale uses semicolons as list separators, use this version instead:

    ```dax
    Calendar = CALENDAR(DATE(2013;01;01);DATE(2014;12;31))
    ```

1. Select the check mark to commit.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-dax-expression.png" alt-text="Screenshot of DAX expression to create a calendar table.":::

    Here are the first 23 rows of the single-column table you just created.

    :::image type="content" source="media/desktop-excel-stunning-report/calendar-result.png" alt-text="Screenshot of calendar table created with DAX expression.":::

1. Select **Model view** on the left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-model-view.png" alt-text="Screenshot of Model view icon in Power BI Desktop.":::

1. Drag the **Date** field from the financials table to the **Date** field in the Calendar table to join the tables and create a *relationship* between them. In the **New relationship** dialog that opens, select **Save** to apply the selections that Power BI automatically fills in for you.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-relationship.png" alt-text="Screenshot of relationship between Date fields.":::

## Build your report

After you transform and load your data, create your report. In the left rail, select **Report view**.

:::image type="content" source="media/desktop-excel-stunning-report/report-view-icon.png" alt-text="Screenshot of Report view icon in Power BI Desktop.":::

In the Data pane on the right, you see the fields in the data model you created.

Build the final report, one visual at a time.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png" alt-text="Screenshot of all the elements of the report, by number." lightbox="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png":::

### Visual 1: Add a title

1. On the **Insert** ribbon, select **Text box**. Inside the text box, type "Executive Summary – Finance Report".
1. Select the text you typed. Make the font **bold** and set the **size** to 20.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-title-executive-summary.png" alt-text="Screenshot of text box title selected for formatting.":::

1. Resize the box to fit on one line.

### Visual 2: Profit by date

Create a line chart to see which month and year had the highest profit.

1. From the Data pane, drag the **Profit** field to a blank area on the report canvas. By default, Power BI displays a column chart with one column, Profit.

1. Drag the **Date** field to the same visual. Power BI updates the column chart to show profit over time.

1. Configure the chart to show data by month and year (not individual dates):

   1. In the **Visualizations** pane, look at the **X-axis** well on the **Build visual** tab.
   
   1. Select the dropdown arrow next to the **Date** field in the X-axis well.
   
   1. Select **Date Hierarchy** from the menu. This groups your data by Year, Quarter, Month, and Day levels.
   
   1. In the X-axis well, clear the checkboxes next to **Quarter** and **Day** to show only **Year** and **Month** on the chart.

   > [!TIP]
   > If you created a Calendar table in [Extra credit: Create a new table](#create-a-new-table) earlier in this article, use the **Date** field from that Calendar table instead of the financials table for better hierarchy support.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-column-chart-date.png" alt-text="Screenshot of column chart showing profit by month for two different years." lightbox="media/desktop-excel-stunning-report/power-bi-column-chart-date.png":::

1. On the Build visual tab, change the visualization type to **Line chart**.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-profit-date-line-chart.png" alt-text="Screenshot of changing column to line chart.":::

    Now you can easily see that December 2014 had the highest profit.

### Visual 3: Profit by country/region

Create a map to see which country/region had the highest profits.

1. From the Data pane, drag the **Country** field to a blank area on your report canvas. Power BI automatically creates a map visual.

1. Drag the **Profit** field to the map. Power BI adds bubbles representing the relative profit of each location to the map visual.

1. Verify the map shows bubbles on each country/region. If you see a different map style (such as a filled/shaded map), select the visual, then in the **Visualizations** pane, select the **Map** icon (globe with dots) to switch to a bubble map.

   > [!NOTE]
   > The map visual type depends on your Power BI settings and region. If you see an Azure Maps visual or a different style, the steps still work the same way. The key result is seeing relative profit sizes for each country/region.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-map-visual.png" alt-text="Screenshot of map visual showing profit by country." lightbox="media/desktop-excel-stunning-report/power-bi-map-visual.png":::

    Europe seems to be performing better than North America.

### Visual 4: Sales by product and segment

Create a bar chart to determine which companies and segments to invest in.

1. Drag the two charts you created to be side by side in the top half of the canvas. Save some room on the left side of the canvas.
1. Select a blank area in the lower half of your report canvas.

1. In the Data pane, select the **Sales**, **Product**, and **Segment** fields.

    Power BI automatically creates a clustered column chart visualizing the data.

1. Drag the handles on the chart so it's wide enough to fill the space under the two other visuals.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png" alt-text="Screenshot of line chart and map visual positioned under report title and over column chart." lightbox="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png":::

    It looks like the company should continue to invest in the Paseo product and target the Small Business and Government segments.  

### Visual 5: Year slicer

Slicers are a valuable tool for filtering the visuals on a report page to a specific selection. In this case, you can create two different slicers to narrow in on performance for each month and year. One slicer uses the Date field in the original table. The other uses the [Date table you may have created for "extra credit"](#create-a-new-table) earlier in this tutorial.

**Date slicer using the original table**

1. In the Data pane, select the **Date** field in the financials table. Drag it to the blank area you reserved on the canvas.
1. In the Visualizations pane, choose **Slicer**.

    Select the Slicer visual (funnel icon). Power BI automatically creates a numeric range slicer.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-slicer.png" alt-text="Screenshot of a date range slicer visual in Power BI Desktop.":::

    When you choose Slicer for the visual, you see the following image:

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-numeric-range.png" alt-text="Screenshot of Date numeric range slicer.":::

1. You can drag the ends to filter the date range. You can also change to a different type of slicer on the Visualization pane's Format visual tab. The options are under **Visual** > **Slicer settings** > **Options** > **Style**.

**Date slicer using the DAX table**

1. In the Data pane, select the **Date** field in the Calendar table. Drag it to the blank area on the canvas.
1. On the Visualizations pane's Build visual tab, choose **Slicer**.
1. In the Data pane, expand the **Date** field and clear the boxes for Quarter and Day so only Year and Month are left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-hierarchy-trim.png" alt-text="Screenshot of changing the Date hierarchy.":::

1. Expand each year and resize the visual so that all months are visible.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-hierarchy-date-slicer.png" alt-text="Screenshot of date hierarchy slicer with both years expanded to show all months.":::

    Use this slicer in the finished report.

Now, if your manager asks to see just 2013 data, you can use the slicer to select that year, or specific months of that year.

### Extra credit: Format the report

If you want to add polish to the report, try these formatting steps.

#### Theme

- On the **View** ribbon, change the theme to **Executive**.  

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-theme-executive.png" alt-text="Screenshot of selecting the Executive theme.":::

#### Spruce up the visuals

With the appropriate visual selected, make the following changes on the **Visualizations** pane.

1. Select Visual 2, the column chart showing profit over time. Under **Format visual** > **General**, expand the **Title** section. Change the text in the **Text** field to "Profit by Month and Year" and change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.

1. Select Visual 3, the map. Under **Format visual** > **Visual**, expand **Map settings** and **Style**, then choose **Grayscale**. Under **Format visual** > **General**, expand the **Title** section and change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.

1. Select Visual 4, the clustered column chart showing sales by product and segment. Under **Format visual** > **General**, expand the **Title** section. Change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.

1. Select Visual 5, the year slicer. Under **Format visual** > **Visual**, expand **Slicer settings**. Expand the **Selection** section (you might need to scroll down) and toggle **Show "Select all" option** to **On**. If you don't see the **Selection** section, make sure you have a hierarchy slicer (the slicer created from the Calendar table's Date Hierarchy). In the **Slicer header** section, increase the **Font** size to **16**.

#### Add a background shape for the title

1. On the **Insert** tab in the ribbon at the top, select **Shapes** > **Rectangle**. Place it at the top of the page and adjust the dimensions to be the width of the page and height of the title.
1. In the **Format shape** pane, under **Shape**, expand the **Style** section and set **Border** to **Off**.
1. In the **Fill** section, change **Color** to **Theme color 5 #6B91C9** (blue).

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-theme-color-5.png" alt-text="Screenshot of Theme color 5 highlighted.":::

1. On the **Format** tab in the ribbon, select **Send backward** > **Send to back** to position the shape behind the title text.
1. Select the text in Visual 1, the title, and change the font color to **White**.

#### Add a background shape for Visuals 2 and 3

1. On the **Insert** tab in the ribbon at the top, select **Shapes** > **Rectangle**, then adjust the dimensions to be the width and height of Visuals 2 and 3.
1. In the **Format shape** pane, on the **Shape** tab, expand the **Style** and **Border** sections and change the **Transparency** value to **100%**.
1. In the **Fill** section, set the **Color** to **White, 10% darker**.
1. On the **Format** tab in the ribbon, select **Send backward** > **Send to back** to position the rectangle behind the visuals.

### Finished report

Here's how your final, polished report looks:  

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png" alt-text="Screenshot of the final formatted report in Power BI Desktop." lightbox="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png":::

This report answers your manager’s top questions:

- Which month and year had the most profit?

    December 2014.

- Which country or region is the company seeing the most success in?

    In Europe, specifically France and Germany.

- Which product and segment should the company continue to invest in?

    The company should continue to invest in the Paseo product and target the Small Business and Government segments.

## Save your report

- On the **File** menu, select **Save**, or hold **Ctrl** and then press the **S** key. If you're saving the report for the first time, you're prompted for a name and location to save it.

## Publish to the Power BI service to share

To share your report with your manager and colleagues, publish it to the Power BI service. When you share with colleagues that have a Power BI account, they can interact with your report, but can't save changes.

1. In Power BI Desktop, select **Publish** on the **Home** tab.

    You might need to sign in to the Power BI service. If you don't have an account yet, you can [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. Select a destination in the Power BI service where the report will be saved, such as **My workspace**.
1. Select **Open 'your-file-name' in Power BI**.

    :::image type="content" source="media/desktop-excel-stunning-report/open-power-bi.png" alt-text="Screenshot of opening your report in the Power BI service.":::

    Your published report opens in the browser.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-report-service.png" alt-text="Screenshot of the completed Power BI report in the Power BI service.":::

1. Select **Share** at the top of the report to share your report with others.

## Related content

- [Tutorial: Analyze sales data from Excel and an OData feed](../connect-data/desktop-tutorial-analyzing-sales-data-from-excel-and-an-odata-feed.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
