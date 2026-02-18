---
title: "Tutorial: Create a report from an Excel workbook in Power BI"
description: This tutorial shows how you can quickly create a report from an Excel workbook in Power BI Desktop and publish it to the Power BI service.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 02/18/2026
ai-usage: ai-assisted
LocalizationGroup: Data from files
#customer intent: As a business analyst, I want to create a visually appealing and informative report from Excel data in Power BI Desktop so that I can effectively communicate key insights and performance metrics to my manager and colleagues.
---

# Tutorial: Create a report from an Excel workbook in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In this tutorial, you create a report from start to finish.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-excel-report-service.png" alt-text="Screenshot of the completed Power BI report in the Power BI service." lightbox="media/desktop-excel-stunning-report/power-bi-excel-report-service.png":::

Your manager wants to see a report on your latest sales figures. They request an executive summary of:

- Which month and year had the most profit?
- Where is the company seeing the most success (by country/region)?
- Which product and segment should the company continue to invest in?

By using the sample finance workbook, you can build this report in no time.

In this tutorial, you:

> [!div class="checklist"]
>
> - Download sample data.
> - Prepare your data with a few transformations.
> - Build a report with a title, visuals, and a slicer.
> - Publish your report to the Power BI service so you can share it with your colleagues.

## Prerequisites

Before starting this tutorial, make sure you have:

- [Power BI Desktop](https://www.microsoft.com/power-platform/products/power-bi/desktop) installed on your computer.
- A Power BI account if you plan to publish your report to the Power BI service. If you don't have an account, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).
- Basic familiarity with Excel and Power BI Desktop interface.

> [!NOTE]
> This tutorial guides you through data preparation and report creation. You need to complete the data preparation steps before building visuals, as the report design depends on having a properly structured and cleaned data model ready.
>
> Screenshots in this tutorial might differ slightly from what you see in the latest version of Power BI Desktop, as the interface is updated regularly. The steps and functionality remain the same.

## Get data

You can get the data for this tutorial using one of two methods: connect to the sample directly from Power BI Desktop, or download and open it in Power BI Desktop.

### Get data in Power BI Desktop

When you open Power BI Desktop, select **Learn with sample data** from the Home page.

In the dialog that opens, choose **Load sample data**.

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

    Changing data types is the data cleaning step that users perform most often. In this case, the units sold are in decimal form. It doesn't make sense to have 0.2 or 0.5 of a unit sold, so change it to a whole number.

1. To make the segments easier to see in the chart later, format the data in the Segment column. Select the **Segment** column. On the **Transform** tab, select **Format**, and then select **UPPERCASE**.

1. Shorten the column name from **Month Name** to just **Month**. Double-click the **Month Name** column, and rename it to **Month**.

1. On the **Product** column header, select the dropdown and clear the box next to **Montana**. The Montana product was discontinued last month, so filter this data from the report to avoid confusion.
1. Each transformation appears in the list under **Query Settings** in **APPLIED STEPS**.
1. Back on the **Home** tab, select **Close & Apply**. The data is almost ready for building a report.

    The sigma symbol in the Data list indicates a field that Power BI detects as numeric. Power BI uses a calendar symbol to denote a date field.

## Write DAX expressions (optional)

Writing *measures* and creating *tables* in the *DAX* formula language provides flexibility for data modeling. There's lots to learn about DAX in the Power BI documentation. For now, let's write a basic expression to create a new measure, and another expression to create a whole table.

> [!IMPORTANT]
> **DAX expressions not working?** If you're using a non-English locale (such as Spanish, French, or German), you might need to use semicolons (`;`) instead of commas (`,`) to separate function arguments in DAX formulas. For example, use `DATE(2013;01;01)` instead of `DATE(2013,01,01)`. Also, make sure the table name in your formula matches exactly what appears in your Data pane (it should be **financials** if you followed the earlier steps).
>
> **Syntax error when pasting?** If you copy a DAX formula from this article and paste it into Power BI Desktop, you might see a "syntax is incorrect" or similar error message. This error can happen if:
>
> - Quotation marks are converted to "smart quotes" (curly quotes) during copy. Replace any curly quotes (`"` or `"`) with straight quotes (`"`).
> - Hidden characters or line breaks are introduced during copy. Delete the formula and retype it manually, or paste into a plain text editor first to remove formatting.
> - Your regional settings require different separators (see the locale note above).

### Create a new measure

1. On the **Home** ribbon, select **New measure**.
1. Copy and paste this expression in the formula bar at the top of the report canvas to add all the numbers in the Units Sold column.

    ```dax
    Total Units Sold = SUM(financials[Units Sold])
    ```

    > [!TIP]
    > **Getting an error about "Units"?** Verify that the column name in your Data pane matches exactly. If your column is named differently (such as **Units_Sold** or **UnitsSold**), update the formula to match. You can also try typing the formula manually instead of copying it, as hidden characters can sometimes cause syntax errors.

1. Select the check mark to commit. The measure is added to the list in the Data pane.

### Create a new table

1. Select the **Table view** icon on the left.
1. On the **Home** ribbon, select **New table**.
1. Copy and paste this expression in the formula bar to generate a Calendar table of all dates between January 1, 2013, and December 31, 2014.

    ```dax
    Calendar = CALENDAR(DATE(2013,01,01),DATE(2014,12,31))
    ```

    If your locale uses semicolons as list separators, use this version instead:

    ```dax
    Calendar = CALENDAR(DATE(2013;01;01);DATE(2014;12;31))
    ```

    > [!NOTE]
    > **Getting a syntax error?** Copy-paste issues are common with DAX formulas. If you see "The syntax for this expression is incorrect," try these solutions:
    > - **Type it manually**: The most reliable fix is to type the formula directly in the formula bar instead of copying it.
    > - **Regional settings**: Use semicolons (`;`) instead of commas (`,`) if your region requires it (see alternate formula above).
    > - **Smart quotes**: Replace curly quotes (`"` or `"`) with straight quotes (`"`).
    > - **Hidden characters**: Invisible characters from web pages can cause errors. Delete the formula and retype it.

1. Select the check mark to commit.
1. Select **Model view** on the left.
1. Drag the **Date** field from the Calendar table to the **Date** field in the financials table to join the tables and create a *relationship* between them. In the **New relationship** dialog that opens, select **Save** to apply the selections that Power BI automatically fills in for you.

     :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-relationship.png" alt-text="Screenshot of relationship between Date fields.":::

## Build your report

After you transform and load your data, create your report. In the left rail, select **Report view**.

In the Data pane on the right, you see the fields in the data model you created.

Build the final report, one visual at a time.

:::image type="content" source="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png" alt-text="Screenshot of all the elements of the report, by number." lightbox="media/desktop-excel-stunning-report/power-bi-report-by-numbers.png":::

### Visual 1: Add a title

1. On the **Insert** ribbon, select **Text box**. Inside the text box, type "Executive Summary – Finance Report".
1. Select the text you typed. Make the font **bold** and set the **size** to 20.
1. Resize the box to fit on one line.

### Visual 2: Profit by date

Create a line chart to see which month and year had the highest profit.

1. From the Data pane, drag the **Profit** field to a blank area on the report canvas. By default, Power BI displays a column chart with one column, Profit.

1. Drag the **Date** field to the same visual. Power BI updates the column chart to show profit by date. The chart might show individual dates, or it might automatically group by month depending on your settings.
1. Configure the chart to show data grouped by month and year:
   1. In the **Visualizations** pane, select the **Build visual** tab.
   1. In the **X-axis** well, select the dropdown arrow next to **Date**.
   1. Select **Date Hierarchy**. This groups your data by Year, Quarter, Month, and Day levels.
   1. In the X-axis well, clear the checkboxes next to **Quarter** and **Day** to show only **Year** and **Month**.

   > [!TIP]
   > If you created a Calendar table in [Write DAX expressions: Create a new table](#create-a-new-table) earlier in this article, use the **Date** field from that Calendar table instead of the financials table for better hierarchy support.

   > [!NOTE]
   > **Can't find Date Hierarchy?** If the dropdown doesn't show **Date Hierarchy** as an option, or your chart still displays every individual date as a separate data point, try this: Remove the **Date** field from the X-axis well, then drag it back from the Data pane. When prompted, select **Date Hierarchy** instead of **Date**. If this option still doesn't appear, complete the [Write DAX expressions](#create-a-new-table) section to create a Calendar table, then use that table's Date field instead.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-column-chart-date.png" alt-text="Screenshot of column chart showing profit by month for two different years." lightbox="media/desktop-excel-stunning-report/power-bi-column-chart-date.png":::

1. On the Build visual tab, change the visualization type to **Line chart**. Now you can easily see that December 2014 had the highest profit.

### Visual 3: Profit by country/region

Create a map to see which country or region has the highest profits.

1. From the Data pane, drag the **Country/Region** field to a blank area on your report canvas. Power BI creates a visual, which might be a map, table, or other type depending on your settings.
1. If Power BI didn't create a map, select the visual and then select the **Map** icon (globe with dots) in the **Visualizations** pane to convert it to a map.
1. Drag the **Profit** field to the map. Power BI adds bubbles representing the relative profit of each location.
1. Verify the map shows bubbles on each country or region. If you see a filled map (shaded regions) instead of a bubble map (circles), select the visual and choose the **Map** icon (globe with dots) rather than the **Filled map** icon (shaded regions).

   > [!NOTE]
   > The default map visual type depends on your Power BI settings and version. You might see different map styles such as Azure Maps, Bing Maps, a filled map, or a bubble map. The key result is seeing relative profit sizes for each country or region represented visually on the map.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-map-visual.png" alt-text="Screenshot of map visual showing profit by country." lightbox="media/desktop-excel-stunning-report/power-bi-map-visual.png":::

    Europe seems to be performing better than North America.

### Visual 4: Sales by product and segment

Create a bar chart to determine which companies and segments to invest in.

1. Drag the two charts you created so they're side by side in the top half of the canvas. Save some room on the left side of the canvas.
1. Select a blank area in the lower half of your report canvas.
1. In the Data pane, select the **Sales**, **Product**, and **Segment** fields.

    Power BI automatically creates a clustered column chart visualizing the data.

1. Drag the handles on the chart so it's wide enough to fill the space under the two other visuals.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png" alt-text="Screenshot of line chart and map visual positioned under report title and over column chart." lightbox="media/desktop-excel-stunning-report/power-bi-line-column-chart-inline.png":::

    It looks like the company should continue to invest in the Paseo product and target the Small Business and Government segments.  

### Visual 5: Year slicer

Slicers are a valuable tool for filtering the visuals on a report page to a specific selection. In this case, you can create two different slicers to narrow in on performance for each month and year. One slicer uses the Date field in the original table. The other uses the [Date table you may have created in Write DAX expressions](#create-a-new-table) earlier in this tutorial.

#### Date slicer using the original table

1. In the Data pane, select the **Date** field in the financials table. Drag it to the blank area you reserved on the canvas.
1. In the Visualizations pane, choose **Slicer**.

    Power BI automatically creates a numeric range slicer. You can drag the ends to filter the date range. You can also change to a different type of slicer on the Visualization pane's Format visual tab. The options are under **Visual** > **Slicer settings** > **Options** > **Style**.

#### Date slicer using the DAX table

1. In the Data pane, select the **Date** field in the Calendar table. Drag it to the blank area on the canvas.
1. On the Visualizations pane's Build visual tab, choose **Slicer**.
1. In the Data pane, expand the **Date** field and clear the boxes for Quarter and Day so only Year and Month are left.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-date-hierarchy-trim.png" alt-text="Screenshot of changing the Date hierarchy.":::

1. Expand each year and resize the visual so that all months are visible.

    :::image type="content" source="media/desktop-excel-stunning-report/power-bi-hierarchy-date-slicer.png" alt-text="Screenshot of date hierarchy slicer with both years expanded to show all months.":::

    Use this slicer in the finished report.

Now, if your manager asks to see just 2013 data, you can use the slicer to select that year, or specific months of that year.

### Format the report (optional)

If you want to further customize the report, try these formatting steps.

#### Theme

- On the **View** ribbon, change the theme to **Executive**.

#### Format the visuals

With the appropriate visual selected, make the following changes on the **Visualizations** pane.

1. Select Visual 2, the column chart showing profit over time. Under **Format visual** > **General**, expand the **Title** section. Change the text in the **Text** field to "Profit by Month and Year" and change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.
1. Select Visual 3, the map. Under **Format visual** > **Visual**, expand **Map settings** and **Style**, then choose **Grayscale**. Under **Format visual** > **General**, expand the **Title** section and change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.
1. Select Visual 4, the clustered column chart showing sales by product and segment. Under **Format visual** > **General**, expand the **Title** section. Change the **Font** size to **16**. Expand **Effects** and toggle **Shadow** to **On**.
1. Select Visual 5, the year slicer. Under **Format visual** > **Visual**, expand **Slicer settings**. In the **Slicer header** section, increase the **Font** size to **16**.

   To add a "Select all" option: Expand the **Selection** section (you might need to scroll down) and toggle **Show "Select all" option** to **On**.

   > [!NOTE]
   > The **Selection** section only appears for hierarchy slicers (created from the Calendar table's Date Hierarchy). If you used a date range slicer from the financials table, this option isn't available. You can skip this step or create the Calendar table slicer as described in [Date slicer using the DAX table](#date-slicer-using-the-dax-table).

#### Add a background shape for the title

1. On the **Insert** tab in the ribbon at the top, select **Shapes** > **Rectangle**. Place it at the top of the page and adjust the dimensions to be the width of the page and height of the title.
1. In the **Format shape** pane, under **Shape**, expand the **Style** section and set **Border** to **Off**.
1. In the **Fill** section, change **Color** to **Theme color 5 #6B91C9** (blue).
1. On the **Format** tab in the ribbon, select **Send backward** > **Send to back** to position the shape behind the title text.
1. Select the text in Visual 1, the title, and change the font color to **White**.

#### Add a background shape for Visuals 2 and 3

1. On the **Insert** tab in the ribbon at the top, select **Shapes** > **Rectangle**, then adjust the dimensions to be the width and height of Visuals 2 and 3.
1. In the **Format shape** pane, on the **Shape** tab, expand the **Style** and **Border** sections and change the **Transparency** value to **100%**.
1. In the **Fill** section, set the **Color** to **White, 10% darker**.
1. On the **Format** tab in the ribbon, select **Send backward** > **Send to back** to position the rectangle behind the visuals.

### Finished report


This report answers your manager’s top questions:

- Which month and year had the most profit?

    December 2014.

- Which country or region is the company seeing the most success in?

    In Europe, specifically France and Germany.

- Which product and segment should the company continue to invest in?

    The company should continue to invest in the Paseo product and target the Small Business and Government segments.

## Save your report

- On the **File** menu, select **Save**, or hold **Ctrl** and then press the **S** key. If you're saving the report for the first time, provide a name and location to save it.

## Publish your report

To share your report with your manager and colleagues, publish it to the Power BI service. When you share with colleagues that have a Power BI account, they can interact with your report, but can't save changes.

1. In Power BI Desktop, select **Publish** on the **Home** tab.

    You might need to sign in to the Power BI service. If you don't have an account yet, you can [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web).

1. Select a destination in the Power BI service where the report will be saved, such as **My workspace**.
1. Select **Open 'your-file-name' in Power BI**. Your published report opens in the browser.
1. Select **Share** at the top of the report to share your report with others.

## Related content

- [Tutorial: Analyze sales data from Excel and an OData feed](../connect-data/desktop-tutorial-analyzing-sales-data-from-excel-and-an-odata-feed.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
