---
title: "Tutorial: Create a paginated report and upload it to the Power BI service"
description: Learn how to connect to a sample Azure SQL database, use a wizard in Report Builder to create a paginated report, then upload it to any workspace in the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: tutorial
ms.date: 06/28/2024
---

# Tutorial: Create a paginated report and upload it to the Power BI service

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)]

This tutorial explains how to connect to a sample Azure SQL database, use a wizard in Power BI Report Builder to create a paginated report with a table that wraps to multiple pages, and then upload the paginated report to any workspace in the Power BI service.

:::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-report-service.png" alt-text="Screenshot showing a paginated report in the Power BI service." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-report-service.png":::

Here are the steps you complete in this tutorial:

> [!div class="checklist"]
> - Create an Azure sample database.
> - Create a matrix in Power BI Report Builder with the help of a wizard.
> - Format the report with title, page numbers, and column headings on each page.
> - Format the currency.
> - Upload the report to the Power BI service.

## Prerequisites

Here are the prerequisites for creating the paginated report:

- Install [Power BI Report Builder from the Microsoft Download Center](https://aka.ms/pbireportbuilder) for free.

- If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).

- Follow the quickstart [Create an Azure SQL database sample in the Azure portal](/azure/sql-database/sql-database-get-started-portal). Copy and save the value in the **Server name** box on the **Overview** tab. Remember the user name and password you created in Azure.

License requirements for publishing Power BI paginated reports (.rdl files) are the same as for Power BI reports (.pbix files).

- With a free license, you can publish paginated reports to My Workspace in the Power BI service. For more information, see [Feature availability for users with free licenses in the Power BI service](../consumer/end-user-features.md#licenses).
- With a Power BI Pro license or a PPU license, you can publish paginated reports to other workspaces. You also need at least a [contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) in the workspace.

## Create the matrix with a wizard

1. Start Power BI Report Builder from your computer.

     The **Getting Started** dialog box opens.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-get-started.png" alt-text="Screenshot showing the Report Builder Getting Started screen." lightbox="media/paginated-reports-quickstart-aw/power-bi-get-started.png":::
  
1. In the left pane, verify that **New Report** is selected, and in the right pane, select **Table or Matrix Wizard**.

1. In the **Choose a dataset** page, select **Create a dataset** > **Next**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-create-dataset.png" alt-text="Screenshot showing where to find the Create a dataset option.":::

1. In the **Choose a connection to a data source** page, select **New**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-new-data-source-connection.png" alt-text="Screenshot showing where to select New for a data source connection.":::

     The **Data Source Properties** dialog box opens.

1. You can name a data source anything you want, using characters and underscores. For this tutorial, in the **Name** box, type **MyAzureDataSource**.

1. In the **Select connection type** box, select **Microsoft Azure SQL Database**.

1. Select **Build** next to the **Connection string** box.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-build.png" alt-text="Screenshot showing where to select the Build option in Data source properties.":::

     The **Connection Properties** dialog box opens.

1. **In the Azure portal:** Go back to the Azure portal and select **SQL databases**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-azure-portal.png" alt-text="Screenshot showing the SQL database in the Azure portal Resources list." lightbox="media/paginated-reports-quickstart-aw/power-bi-azure-portal.png":::

1. Select the Azure SQL database you created in the quickstart "Create an Azure SQL database sample in the Azure portal" in the **Prerequisites** section of this article.

1. On the **Overview** tab, copy the value in the **Server name** box.

1. **In Report Builder**: Go back to Report Builder. In the **Connection Properties** dialog box, under **Server name**, paste the server name you copied.

1. For **Log on to the server**, make sure **Use SQL Server Authentication** is selected, then type the user name and password you created in Azure for the sample database.

1. Under **Connect to a database**, select the drop-down arrow and select the database name you created in Azure.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-connection-properties.png" alt-text="Screenshot of the Connection Properties dialog box, showing where to find the Connect to a database options." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-connection-properties.png":::

1. Select **Test Connection**. You see the **Test results** message that **Test connection succeeded**.

1. Select **OK** > **OK**.

   Now in the **Connection string** box, Report Builder displays your new connection string you.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-connection-string.png" alt-text="Screenshot showing where to find the Connection string on the Data Source Properties screen." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-connection-string.png":::

1. Select **OK**.

1. In the **Choose a connection to a data source** page, you see "(in this Report)" under your new data source connection. Select that data source > **Next**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-my-azure-data-source.png" alt-text="Screenshot showing where to select the data source.":::

1. Enter the same user name and password in the box > **Next**.

1. In the **Design a query** page, expand **SalesLT**, expand **Tables**, and select these tables:

    - Address
    - Customer
    - Product
    - ProductCategory
    - SalesOrderDetail
    - SalesOrderHeader

     Because **Relationships** > **Auto Detect** is selected, Report Builder detects the relationships between these tables.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-design-query.png" alt-text="Screenshot of the Design a query screen." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-design-query.png":::

1. Select **Run Query**. Report Builder displays the **Query results**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-query-results.png" alt-text="Screenshot showing where the Query results list appears." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-query-results.png":::

1. Select **Next**.

1. In the **Arrange fields** page, drag these fields from the **Available fields** box to the **Row groups** box:

    - CompanyName
    - SalesOrderNumber
    - Product_Name

1. Drag these fields from the **Available fields** box to the **Values** box:

    - OrderQty
    - UnitPrice
    - LineTotal

    Report Builder automatically makes the fields in the **Values** box sums.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-drag-fields.png" alt-text="Screenshot of the Arrange fields screen, showing where to find the Row groups and Values sections." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-drag-fields.png":::

1. In the **Choose the layout** page, keep all the default settings, but clear the checkbox next to **Expand/collapse groups**. In general, the expand/collapse groups feature is great, but this time you want the table to wrap to multiple pages.

1. Select **Next** > **Finish**. The table is displayed on the design surface.

## What you created

Let's pause for a moment to look at the results of the wizard.

:::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-wizard-results.png" alt-text="Screenshot showing the results of the Matrix wizard, with numbers labeling each section." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-wizard-results.png":::

1. In the **Report Data** pane, you see the embedded Azure data source and the embedded dataset based on it, both of which you created.

2. The design surface is about 6 inches wide. On the design surface, you see the matrix, displaying column headings and placeholder values. The matrix has six columns and appears to be only five rows tall.

3. **Order Qty**, **Unit Price**, and **Line Total** are all sums, and each row group has a subtotal.

    You still don't see actual data values. You need to run the report to see them.

4. In the **Properties** pane, the selected matrix is called Tablix1. A *tablix* in Report Builder is a data region that displays data in rows and columns. It can be either a table or a matrix.

5. In the **Grouping** pane, you see the three row groups you created in the wizard:

   - CompanyName
   - Sales Order
   - Product Name

   This matrix doesn't have any column groups.

### Run the report

To see the actual values, you need to run the report.

1. Select **Run** in the **Home** toolbar.

   Now you see the values. The matrix has many more rows than you saw in Design view. Note that Report Builder says it's page **1** of **2?**. Report Builder loads the report as quickly as possible, so it only retrieves enough data for a few pages at a time. The question mark indicates that Report Builder is still loading the data.

   :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-run-report.png" alt-text="Screenshot of a report, showing where to find the page number and page navigation arrows.":::

## Format the report

Now you have a report with a matrix that wraps to 33 pages. Let's add some other features and improve how it looks. You can run the report after every step, if you want to see how it's coming along.

- On the **Run** tab of the ribbon, select **Design**, so you can continue modifying it.

### Set page width

Typically a paginated report is formatted for printing, and a typical page is 8 1/2 X 11 inches.

1. Drag the ruler to make the design surface 7 inches wide. The default margins are 1 inch on each side, so the side margins need to be narrower.

1. Click in the gray area around the design surface to show the **Report** properties.

    If you don’t see the **Properties** pane, select the **View** tab > **Properties**.

1. Expand **Margins** and change **Left** and **Right** from 1 inch to 0.75 inches.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-set-margins.png" alt-text="Screenshot of report properties, showing where to see and edit the report margins.":::

### Add a report title

1. Select the words **Click to add title** at the top of the page, then type **Sales by Company**.

2. Select the title text, and in the **Properties** pane under **Font**, change **Color** to **Blue**.

### Add a page number

You noticed the report has a date and time stamp in the footer. You can add a page number to the footer, too.

1. At the bottom of the design surface, you see **[&ExecutionTime]** on the right in the footer.

1. In the **Report Data** pane, expand the **Built-in Fields** folder. Drag **Page Number** to the left side of the footer, at the same height as **[&ExecutionTime]**.

1. Drag the right side of the **[&PageNumber]** box to make it square.

1. On the **Insert** tab, select **Text Box**.

1. Click to the right of **[&PageNumber]**, type "of", then make the text box square.

1. Drag **Overall Total Pages** to the footer, to the right of "of", then drag its right side to make it square, too.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-add-page-numbers.png" alt-text="Screenshot of the Report Data pane, showing where to drag a build-in field into a footer.":::

### Make the table wider

Now you can make the matrix wide enough to fill the width of the page, and make the text columns wider so the names don't scroll as much.

1. Select the matrix, then select the **Company Name** column.

1. Hover over the gray bar at the top of the matrix at the right edge of the **Company Name** column. Drag to the right, until the column ends at 1 3/8 inches.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-drag-column.png" alt-text="Screenshot showing where to drag the edge of a column to make it wider.":::

1. Drag the right edge of **Product Name** until the column ends at 3 3/4 inches.

Now the matrix is almost as wide as the print area.

### Format the currency

If you noticed when you ran the report, the dollar amounts aren't formatted as currency yet.

1. Select the upper-left **[Sum(OrderQty)]** cell, hold down the Shift key, and select the lower-right **[Sum(LineTotal)]** cell.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-select-money-cells.png" alt-text="Screenshot showing where to select cells with currency values.":::

1. On the **Home** tab, select the dollar sign (**$**) currency symbol, then select the arrow next to **Placeholder styles** > **Sample Values**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-format-currency.png" alt-text="Screenshot showing where to select Sample Values.":::

    Now you can see the values are formatted as currency.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-display-sample-values.png" alt-text="Screenshot showing report values formatted as currency.":::

### Add column headers on each page

One more formatting improvement before publishing the report to the Power BI service: making the column headers show up on each page in the report.

1. In the far-right end of the top bar in the **Grouping** pane, select the drop-down arrow > **Advanced Mode**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-advanced-mode.png" alt-text="Screenshot showing where to select Advanced Mode." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-advanced-mode.png":::

1. Select the top **Static** bar in the **Row Groups**. You see that the **Company Name** cell in the matrix is selected.

   :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-static-group.png" alt-text="Screenshot showing where to select the Static bar.":::

1. In the **Properties** pane, you're looking at the properties for **Tablix Member**. Set **KeepWithGroup** to **After** and **RepeatOnNewPage** to **True**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-repeat-on-new-page.png" alt-text="Screenshot showing where to find the properties for Tablix Member." lightbox="":::

    It's time to run the report and see how it looks now.

1. Select **Run** on the **Home** tab.

1. Select **Print Layout**, if it's not already selected. Now the report has 29 pages. Scroll through a few pages. You see the currency is formatted, the columns have headings on every page, and the report has a footer with page numbers and date and time stamp on every page.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-finished-page.png" alt-text="Screenshot of a sample report with Print Layout selected.":::

1. Save the report to your computer.

## Upload the report to the service

Now that you created this paginated report, you can upload it to the Power BI service.

1. In the [Power BI service](https://app.powerbi.com) nav pane, select **Workspaces** > **Create workspace**.

1. Name your workspace **Azure AW** or other unique name. You're the only member for now.

1. In your new workspace, select **Upload** > **Browse**. Navigate to where you saved the file > **Open**.

   Power BI imports your file, and you see it under **Reports** on the App list page.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-app-list.png" alt-text="Screenshot showing where the report appears in the Reports list on the App list page.":::

1. Select the report to view it.

1. If you get an error, you might need to reenter your credentials. Select the ellipses to the right of the report, then choose **Manage**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-manage-report.png" alt-text="Screenshot showing where to select Manage to manage your report.":::

1. Select **Edit credentials** and enter the credentials you used in Azure when you created the Azure database.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-edit-credentials.png" alt-text="Screenshot showing where to select Edit credentials.":::

1. Now you can view your paginated report in the Power BI service.

## Related content

[What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
