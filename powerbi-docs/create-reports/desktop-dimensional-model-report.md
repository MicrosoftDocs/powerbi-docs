---
title: "Tutorial: From dimensional model to stunning report in Power BI Desktop"
description: In this tutorial, you start with a dimensional model and build a beautiful report from start to finish in 20 minutes.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: tutorial
ms.date: 07/14/2022
ms.custom: "https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.xlsx"
LocalizationGroup: Reports
---
# Tutorial: From dimensional model to stunning report in Power BI Desktop 

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

In this tutorial, you start with a dimensional model and build a beautiful report from start to finish in 45 minutes.

You work at AdventureWorks and your manager wants to see a report on your latest sales figures. They've requested an executive summary of: 

- Which day had the most sales in February 2019? 
- Which country/region is the company seeing the most success in? 
- Which product category and reseller business types should the company continue to invest in? 

Using our [AdventureWorks Sales sample Excel workbook](https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.xlsx), we can build this report in no time. Here’s what the final report will look like.

:::image type="content" source="media/desktop-dimensional-model-report/adventureworks-finished-report.png" alt-text="Screenshot of Finished AdventureWorks report.":::

Want to see the finished product? You can also download the [completed Power BI .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.pbix).

>[!NOTE]
>If you'd rather work with data in SQL databases, the **[AdventureWorks sample databases](/sql/samples/adventureworks-install-configure)** article features links to downloadable AdventureWorks SQL sample databases in a GitHub repository. If you do go with a SQL database, you'll have to modify various steps in this tutorial.

Let’s get started! 

In this tutorial, you'll learn to:

> [!div class="checklist"]
> * Prepare your data with a few transformations
> * Build a report with a title, three visuals, and a slicer
> * Publish your report to the Power BI service so you can share it with your colleagues

## Prerequisites

- Before you start, you need to [download Power BI Desktop](../fundamentals/desktop-get-the-desktop.md). 
- If you're planning to publish your report to the Power BI service and you aren't signed up yet, [sign up for a free trial](../fundamentals/service-self-service-signup-for-power-bi.md). 

## Get data: Download the sample 

1. Download the [AdventureWorks Sales sample Excel workbook](https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.xlsx). 

1. Open Power BI Desktop. 

1. In the **Data** section of the **Home** ribbon, select **Excel**. 

1. Navigate to where you saved the sample workbook, and select **Open**. 

## Prepare your data 

In the Navigator pane, you have the option to *transform* or *load* the data. The Navigator provides a preview of your data so you can verify that you have the correct range of data. Numeric data types are italicized. In this tutorial, we're going to transform the data before loading.

Select all tables, and choose **Transform Data**. Make sure not to select the sheets (labeled *_data*). 

:::image type="content" source="media/desktop-dimensional-model-report/desktop-load-tables.png" alt-text="Screenshot of Load tables in Navigator.":::

Check that the data types of the columns match the data types in the following table. To let Power BI detect data types for you, select a query, then select one or more columns. On the **Transform** tab, select **Detect Data Type**. To make any changes to the detected data type, on the **Home** tab, select **Data Type**, then select the appropriate data type from the list.

:::image type="content" source="media/desktop-dimensional-model-report/power-query-change-data-types.png" alt-text="Screenshot of Check the data types of the columns.":::


|Query  |Column  |Data type  |
|---------|---------|---------|
|Customer  |  CustomerKey | Whole Number |
|Date | DateKey |    Whole Number     |
|     | Date | Date      |
|     | MonthKey  | Whole Number |
|Product  | ProductKey | Whole Number  | 
|     | Standard Cost | Decimal Number  | 
|     | List Price | Decimal Number  | 
|Reseller  | ResellerKey | Whole Number  | 
|Sales   | SalesOrderLineKey | Whole Number  | 
|     | ResellerKey  | Whole Number  | 
|     | CustomerKey | Whole Number  | 
|     | ProductKey  | Whole Number  | 
|     | OrderDateKey | Whole Number  | 
|     | DueDateKey  | Whole Number  | 
|     | ShipDateKey | Whole Number  | 
|     | SalesTerritoryKey | Whole Number  | 
|     | Order Quantity   | Whole Number  | 
|     | Unit Price  | Decimal Number  | 
|     | Extended Amount  | Decimal Number  | 
|     | Unit Price Discount Pct | Percentage  | 
|     | Product Standard Cost | Decimal Number  | 
|     | Total Product Cost | Decimal Number  | 
|     | Sales Amount | Decimal Number  | 
| SalesTerritory  | SalesTerritoryKey | Whole Number  | 
|  SalesOrder   |  SalesOrderLineKey | Whole Number  | 

Back on the **Home** tab, select **Close & Apply**. 

:::image type="content" source="media/desktop-dimensional-model-report/power-query-close-and-apply.png" alt-text="Screenshot of Power Query Close and Apply button.":::

## Model your data 

The data you loaded is almost ready for reporting. Let’s inspect the data model and make some changes. 

Select **Model View** on the left. 

:::image type="content" source="media/desktop-dimensional-model-report/desktop-select-model-view.png" alt-text="Screenshot of Select Model view in Power BI Desktop.":::

Your data model should look like the following image, with each table in a box. 

:::image type="content" source="media/desktop-dimensional-model-report/desktop-data-model-1.png" alt-text="Screenshot of The data model to start with.":::

### Create relationships

This model is a typical *star schema* that you might see from data warehouses: It resembles a star. The center of the star is a Fact table. The surrounding tables are called Dimension tables, which are related to the Fact table with relationships. The Fact table contains numerical information about sales transactions, such as Sales Amount and Product Standard Cost. The Dimensions provide context so you can, among other things, analyze: 

- What Product was sold... 
- to which Customer... 
- by which Reseller... 
- in which Sales Territory.  

If you look closely, you notice that all Dimension tables are related to the Fact with a Relationship, except for the Date table. Let’s add some relationships to Date now. Drag the DateKey from the Date table to OrderDateKey on the Sales table. You've created a so-called "one-to-many" relationship from Date to Sales, as indicated by the **1** and the asterisk * (many) at the two ends of the line.  

The relationship is "one-to-many" because we have one or more Sales orders for a given Date. If each date had only one Sales order, the relationship would be "one-to-one". The little arrow in the middle of the line indicates the "cross-filtering direction." It indicates that you can use values from the Date table to filter the Sales table, so the relationship allows you to analyze when a Sales order was placed.  

:::image type="content" source="media/desktop-dimensional-model-report/desktop-date-sales-relationship.png" alt-text="Screenshot of Relationship between the Sales and Date table.":::

The Sales table contains more information about dates related to Sales orders, such as Due Date and Ship Date. Let’s add two more relationships to the Date table by dragging: 

- DateKey to DueDateKey 
- DateKey to ShipDateKey 
    
:::image type="content" source="media/desktop-dimensional-model-report/desktop-date-sales-relationships-done.png" alt-text="Screenshot of Three relationships between Sales and Date tables.":::

You notice that the first relationship, on OrderDateKey, is active, shown by the continuous line. The other two are inactive, shown by the dashed lines. Power BI uses the active relationship by default to relate Sales and Date. Hence, a sum of SalesAmount is calculated by Order Date, not Due Date or Ship Date. You can influence this behavior. See [Extra credit: Write a measure in DAX](#extra-credit-write-a-measure-in-dax) later in this tutorial.

### Hide key columns

The typical star schema contains several keys that hold the relationships between Facts and Dimensions. Normally we don't want to use any key columns in our reports. Let’s hide the key columns from view, so the Fields List shows fewer fields, and the data model is easier to use. 

Go over all tables and hide any column whose name ends with *Key*: 

Select the **Eye** icon next to the column and choose **Hide in report view**.

:::image type="content" source="media/desktop-dimensional-model-report/desktop-column-visible.png" alt-text="Screenshot of Visible column with Eye icon.":::

You can also select the **Eye** icon next to the column in the Properties pane.

Hidden fields have this icon, an eye with a line through it. 

:::image type="content" source="media/desktop-dimensional-model-report/desktop-column-hidden.png" alt-text="Screenshot of Field with the hidden Eye icon.":::
 
Hide these fields.

|Table  |Column  |
|---------|---------|
|Customer  | CustomerKey |
|Date     | DateKey |
|     | MonthKey |
|Product     | ProductKey  |
|Reseller   | ResellerKey  |
|Sales     | CustomerKey  |
|     | DueDateKey |
|     | OrderDateKey |
|     | ProductKey |
|     | ResellerKey        |
|     | SalesOrderLineKey        |
|     | SalesTerritoryKey        |
|     | ShipDateKey        |
| SalesOrder    | SalesOrderLineKey |
| SalesTerritory  | SalesTerritoryKey |

Your data model should now look like this data model, with relationships between Sales and all the other tables, and all the key fields hidden: 

:::image type="content" source="media/desktop-dimensional-model-report/desktop-data-model-2-hidden-columns.png" alt-text="Screenshot of Data model with hidden key columns.":::

### Create hierarchies

Now that our data model is easier to consume because of the hidden columns, we can add a few *hierarchies* to make the model even easier to use. Hierarchies enable easier navigation of groupings. For example, cities are in a State or Province, which is in a Country or Region. 

Create the following hierarchies. 

1. Right-click the highest level, or the least granular, field in the hierarchy and choose **Create hierarchy**. 

1. In the **Properties** pane, set the **Name** of the hierarchy and set the levels. 

1. Then **Apply Level Changes**. 

    :::image type="content" source="media/desktop-dimensional-model-report/desktop-hierarchy-properties.png" alt-text="Screenshot of Hierarchy Properties pane.":::

You can also rename levels in a hierarchy in the Properties pane after you add them. You'll need to rename the Year and Quarter level of the Fiscal hierarchy in the Date table. 

Here are the hierarchies you need to create.

| Table |Hierarchy name |Levels  |
|---------|---------|---------|
|Customer     | Geography   | Country-Region  |
|     | | State-Province  |
|     |         | City |
|     |         | Postal Code |
|     |         | Customer   |
|Date     | Fiscal  | Year (Fiscal Year)  |
|     |         | Quarter (Fiscal Quarter) |
|     |         | Month |
|     |         | Date |
| Product  | Products | Category |
|     |         | Subcategory |
|     |         | Model |
|     |         | Product |
| Reseller   | Geography | Country-Region |
|     |         | State-Province |
|     |         | City  |
|     |         | Postal Code  |
|     |         | Reseller |
| SalesOrder  | Sales Orders | Sales Order |
|     |         | Sales Order Line |
| SalesTerritory    | Sales Territories | Group |
|     |         | Country-Region |
|     |         | Region |
 
Your data model should now look like the following data model. It has the same tables, but each dimension table contains a hierarchy: 

:::image type="content" source="media/desktop-dimensional-model-report/desktop-data-model-3-added-hierarchies.png" alt-text="Screenshot of Data model with dimension tables with hierarchies.":::

### Rename tables

To finish modeling, let's rename the following tables in the Properties pane: 

|Old table name  |New table name  |
|---------|---------|
|SalesTerritory    |  Sales Territory   |
|SalesOrder  |  Sales Order   |

This step is necessary because Excel table names can't contain spaces.

Now your final data model is ready.

:::image type="content" source="media/desktop-dimensional-model-report/desktop-data-model-4-renamed-tables.png" alt-text="Screenshot of Completed data model with renamed tables.":::

## Extra credit: Write a measure in DAX 

Writing *measures* in the DAX formula language is super powerful for data modeling. There's lots to [learn about DAX in the Power BI documentation](/dax/). For now, let's write a basic measure that calculates the total sales amount by due date on the sales order instead of the default order date. This measure uses the [USERELATIONSHIP function](/dax/userelationship-function-dax) to activate the relationship between Sales and Date on DueDate for the context of the measure. It then uses [CALCULATE](/dax/calculate-function-dax) to sum the Sales Amount in that context.

1. Select Data View on the left. 

    :::image type="content" source="media/desktop-dimensional-model-report/desktop-open-data-view.png" alt-text="Screenshot of Select Data view on the left.":::

1. Select the Sales table in the Fields list.

    :::image type="content" source="media/desktop-dimensional-model-report/desktop-select-sales-table.png" alt-text="Screenshot of Select the Sales table in the Fields list.":::

1. On the **Home** ribbon, select **New Measure**. 

1. Select or type this measure to calculate the total sales amount by due date on the sales order instead of the default order date:

    ```dax
    Sales Amount by Due Date = CALCULATE(SUM(Sales[Sales Amount]), USERELATIONSHIP(Sales[DueDateKey],'Date'[DateKey]))
    ```

1. Select the check mark to commit. 

    :::image type="content" source="media/desktop-dimensional-model-report/desktop-adding-a-dax-measure.png" alt-text="Screenshot of Select the check mark to commit the DAX measure.":::

## Build your report 

Now that you’ve modeled your data, it's time to create your report. Go to Report View. In the Fields pane on the right, you see the fields in the data model you created.

Let’s build the final report, one visual at a time. 

:::image type="content" source="media/desktop-dimensional-model-report/adventureworks-finished-report-with-numbers.png" alt-text="Screenshot of Finished report, with numbers marking each visual.":::

### Visual 1: Add a title 

1. On the **Insert** ribbon, select **Text Box**. Type *Executive Summary – Sales Report*. 

1. Select the text you typed. Set the font size to **20** and **Bold**. 

    :::image type="content" source="media/desktop-dimensional-model-report/executive-summary-text-box.png" alt-text="Screenshot of Format the Executive Summary text.":::

1. In the **Format text box** pane, under **Effects**, toggle the **Background** to **Off**. 

1. Resize the box to fit on one line. 

### Visual 2: Sales Amount by Date 

Next you create a line chart to see which month and year had the highest sales amount.

1. From the Fields pane, drag the **Sales Amount** field from the **Sales** table to a blank area on the report canvas. By default, Power BI displays a column chart with one column, Sales Amount. 

1. Drag the **Month** field from the **Fiscal** hierarchy in the **Date** table and drop it on the column chart. 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-year.png" alt-text="Screenshot of Create a column chart with a column for each year.":::

1. In the **Fields** section of the Visualizations pane, in the X-axis box, remove the **Fiscal Year** and **Fiscal Quarter** fields: 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-year-remove-year-and-quarter.png" alt-text="Screenshot of In the Fields section of the Visualizations pane, remove the Year and Quarter fields.":::

1. In the Visualizations pane, change the visualization type to **Area Chart**. 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-year-change-to-area.png" alt-text="Screenshot of Change the column chart to an area chart.":::

1. If you added the DAX measure in the extra credit above, add it to **Y-axis** as well. 
1. Open the Format pane, expand the **Lines** section, and in **Colors**, change **Sales Amount by Due Date** to a more contrasting color, such as red.

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-year-add-DAX-measure.png" alt-text="Screenshot of Sales Amount by Due Date as area chart.":::

    As you can see, Sales Amount by Due Date trails slightly behind Sales Amount. This proves that it uses the relationship between the Sales and Date tables that uses DueDateKey. 

 

### Visual 3: Order Quantity by Reseller Country-Region 

Now we'll create a map to see in which Country or Region the Resellers have the highest Order Quantity Amount.

1. From the Fields pane, drag the **Country-Region** field from the **Reseller** table to a blank area on your report canvas. Power BI creates a map. 

1. Drag the **Order Quantity** field from the **Sales** table and drop it on the map. Make sure **Country-Region** is in the **Location** well and **Order Quantity** in the **Bubble size** well. 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-order-quantity-by-reseller-country-region.png" alt-text="Screenshot of Map of order quantity by country/region.":::

### Visual 4: Sales Amount by Product Category and Reseller Business type 

Next we create a column chart to investigate which products are sold by what type of reseller business.

1. Drag the two charts you've created to be side by side in the top half of the canvas. Save some room on the left side of the canvas. 

1. Select a blank area in the lower half of your report canvas. 

1. In the Fields pane, select **Sales Amount** from **Sales**, **Product Category** from **Product**, and **Business Type** from **Reseller**.
    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-product-category-field-well.png" alt-text="Screenshot of Check that Category and Business Type are on Rows and Sales Amount is selected as Values.":::
    
    Power BI automatically creates a clustered column chart. Change the visualization to a **Matrix**: 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-product-category-change-to-matrix.png" alt-text="Screenshot of Change the clustered column chart to a matrix.":::

1. Drag the **Business Type** field from **Columns**, and put it under **Category** in **Rows**.
1. With the matrix still selected, in the Filters pane, under **Business Type**, **Select all**, then clear the **[Not Applicable]** box. 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-product-category-filter-not-applicable.png" alt-text="Screenshot of Filter out Not Applicable business type.":::

1. Drag the matrix so it's wide enough to fill the space under the two upper charts. 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-product-category-increase-width.png" alt-text="Screenshot of Widen the matrix to fill the report.":::

1. In the Format pane for the matrix, search for *conditional*. In the **Cell elements** section, turn on **Data bars**. Select the **fx** option, and set a lighter color for the positive bar. Select **OK**. 

1. Increase the width of the Sales Amount column so it fills the whole area by dragging the matrix.

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-amount-by-product-category-add-databars.png" alt-text="Screenshot of Matrix with data bars for Sales Amount.":::

It looks like Bikes have a higher Sales Amount overall and the Value Added Resellers sell the most, closely followed by Warehouses. For Components, the Warehouses sell more than the Value Added Resellers. 

### Visual 5: Fiscal calendar slicer 

Slicers are a valuable tool for filtering the visuals on a report page to a specific selection. In this case, we can create a slicer to narrow in on performance for each month, quarter, and year. 

1. In the Fields pane, select the **Fiscal** hierarchy from the **Date** table and drag it to the blank area on the left of the canvas. 

1. In the Visualizations pane, choose **Slicer**. 

    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-add-fiscal-calendar-slicer.png" alt-text="Screenshot of Add a report sales calendar slicer.":::

1. In the Fields section of the Visualizations pane, remove **Quarter** and **Date** so only **Year** and **Month** are left. 
 
    :::image type="content" source="media/desktop-dimensional-model-report/report-sales-add-fiscal-calendar-slicer-remove-quarter-and-date.png" alt-text="Screenshot of Remove Quarter and Date from the Fiscal slicer.":::

Now if your manager asks to see data only for a specific month, you can use the slicer to switch between years or specific months in each year. 

## Extra credit: Format the report 

If you want to do some light formatting on this report to add more polish, here are a few easy steps. 

### Theme 

- On the **View** ribbon, select **Themes**, and change the theme to **Executive**. 

    :::image type="content" source="media/desktop-dimensional-model-report/formatting-report-change-theme.png" alt-text="Screenshot of Choose the Executive theme.":::

### Spruce up the visuals 

Make the following changes on the **Format** tab in the Visualizations pane.

:::image type="content" source="media/desktop-dimensional-model-report/formatting-report-formatting-pane.png" alt-text="Screenshot of the Format tab in the Visualizations pane.":::

> [!TIP]
> A quick way to find the setting you want to change is by typing in the **Search** box in the Format pane.

**Visual 2, Sales Amount by Date**

1. Select Visual 2, Sales Amount by Date. 
1. In the **Title** section, if you didn't add the DAX measure, change **Text** to "Sales Amount by Order Date". 

    If you did add the DAX measure, change **Text** to "Sales Amount by Order Date / Due Date". 

    Make sure you get the **Title** section for the visual itself, because the axes and the legend can also have titles.

    :::image type="content" source="media/desktop-dimensional-model-report/visual-2-title.png" alt-text="Screenshot of Title section of the Format pane.":::

1. Set **Text** size to **16 pt**. 
1. On the **General** tab, toggle **Shadow** to **On**. 

**Visual 3, Order Quantity by Reseller Country-Region**

1. Select Visual 3, Order Quantity by Reseller Country-Region. 
1. In the **Map setting** section, change **Style** to **Grayscale**. 
1. On the **General** tab, in the **Title** section, change **Text** to "Order Quantity by Reseller Country-Region".
1. Set **Text size** to **16 pt**. 
1. Also on the **General** tab, toggle **Shadow** to **On**.

**Visual 4, Sales Amount by Product Category and Reseller Business Type**

1. Select Visual 4, Sales Amount by Product Category and Reseller Business Type. 
1. On the **General** tab, in the **Title** section, change **Text** to "Sales Amount by Product Category and Reseller Business Type".
1. Set **Text size** to **16 pt**. 
1. Also on the **General** tab, toggle **Shadow** to **On**.

**Visual 5, Fiscal calendar slicer**

1. Select Visual 5, Fiscal calendar slicer.
1. In the **Slicer settings** section, under **Selection**, toggle **Show "Select all"** option to **On**. 
1. In the **Slicer header** section, set **Text size** to **16 pt**. 

### Add a background shape for the title 

1. On the **Insert** ribbon, select **Shapes** > **Rectangle**. 
1. Place it at the top of the page, and stretch it to be the width of the page and height of the title. 
1. In the **Style** pane, in the **Border** section, change **Transparency** to **100%**. 
1. In the **Fill** section, change **Fill color** to **Theme color 5 #6B91C9 (blue)**. 
1. On the **Format** ribbon, select **Send backward** > **Send to back**. 

    :::image type="content" source="media/desktop-dimensional-model-report/format-ribbon-send-back.png" alt-text="Screenshot of the Format ribbon, Send to back menu option.":::

1. Select the text in Visual 1, the title, and change **Font color** to **White**. 

## Finished report 

Select **FY2019** in the slicer.

:::image type="content" source="media/desktop-dimensional-model-report/adventureworks-finished-report.png" alt-text="Screenshot of Your final completed report.":::

In summary, this report answers your manager’s top questions: 

- Which day had the most sales in February 2019? 
    February 25, with a sales amount of $253,915.47. 

- Which country/region is the company seeing the most success in? 
    In the United States, with an order quantity of 132,748. 

- Which product category and reseller business types should the company continue to invest in? 
    The company should continue to invest in the Bikes category and the Value Added Reseller and Warehouse reseller businesses. 

## Save your report 

- On the **File** menu, select **Save**. 


## Publish to the Power BI service to share 

To share your report with your manager and colleagues, publish it to the Power BI service. When you share with colleagues that have a Power BI account, they can interact with your report, but can’t save changes.

1. In Power BI Desktop, on the **Home** ribbon select **Publish**. 
1. You may need to sign in to the Power BI service. If you don't have an account yet, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web). 

1. Select a destination such as My workspace in the Power BI service > **Select**. 

1. Select **Open 'your-file-name' in Power BI**. Your completed report opens in the browser. 

1. Select **Share** at the top of the report to share your report with others.

## Related content 

- Download the [completed Power BI .pbix file](https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.pbix)
- Learn more about [DAX and data modeling in Power BI Desktop](/training/modules/dax-power-bi-models/)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
