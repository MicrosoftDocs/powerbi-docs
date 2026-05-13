---
title: "Tutorial: Create a Paginated Report and Upload It to the Power BI Service"
description: Learn how to connect to an Azure SQL database, create a paginated report with Power BI Report Builder, format it with currency and page numbers, and upload it to the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: tutorial
ms.date: 12/01/2025
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
---

# Tutorial: Create a paginated report and upload it to the Power BI service

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)]

This tutorial shows you how to create a paginated report and upload it to the Power BI service. You start by connecting to a sample Azure SQL database. Next, you use a wizard in Power BI Report Builder to create a paginated report with a table that spans multiple pages. Finally, you upload the paginated report to any workspace in the Power BI service.

:::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-report-service.png" alt-text="Screenshot showing a paginated report in the Power BI service." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-report-service.png":::

Complete the following steps in this tutorial:

> [!div class="checklist"]
> - Create an Azure sample database.
> - Create a matrix in Power BI Report Builder by using a wizard.
> - Format the report with a title, page numbers, and column headings on each page.
> - Format the currency.
> - Upload the report to the Power BI service.

## Prerequisites

To create the paginated report, complete the following prerequisites:

- Install [Power BI Report Builder from the Microsoft Download Center](https://aka.ms/pbireportbuilder) for free.

- If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- Follow the quickstart [Create an Azure SQL database sample in the Azure portal](/azure/sql-database/sql-database-get-started-portal). Copy and save the value in the **Server name** box on the **Overview** tab. Remember the user name and password you created in Azure.

The license requirements for publishing Power BI paginated reports (.rdl files) are the same as for Power BI reports (.pbix files).

- With a free license, you can publish paginated reports to **My Workspace** in the Power BI service. For more information, see [Feature availability for users with free licenses in the Power BI service](../fundamentals/end-user-features.md#licenses).
- With a Power BI Pro license or a Power BI Premium Per User (PPU) license, you can publish paginated reports to other workspaces. You also need at least a [contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) in the workspace.

## Create the matrix with a wizard

1. Start Power BI Report Builder on your computer.

    The **Getting Started** dialog box opens.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-get-started.png" alt-text="Screenshot showing the Report Builder Getting Started screen." lightbox="media/paginated-reports-quickstart-aw/power-bi-get-started.png":::

1. In the left pane, verify that **New Report** is selected. In the right pane, select **Table or Matrix Wizard**.

1. In the **Choose a dataset** page, select **Create a dataset** > **Next**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-create-dataset.png" alt-text="Screenshot showing where to find the Create a dataset option." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-create-dataset.png":::

1. In the **Choose a connection to a data source** page, select **New**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-new-data-source-connection.png" alt-text="Screenshot showing where to select New for a data source connection." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-new-data-source-connection.png":::

    The **Data Source Properties** dialog box opens.

1. You can name a data source anything you want, using characters and underscores. For this tutorial, in the **Name** box, type **MyAzureDataSource**.

1. In the **Select connection type** box, select **Microsoft Azure SQL Database**.

1. Select **Build** next to the **Connection string** box.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-build.png" alt-text="Screenshot showing where to select the Build option in Data source properties." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-build.png":::

    The **Connection Properties** dialog box opens.

1. In the Azure portal, select the Azure SQL database you created in the quickstart "Create an Azure SQL database sample in the Azure portal" in the Prerequisites section of this article.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-azure-portal.png" alt-text="Screenshot showing the SQL database in the Azure portal Resources list." lightbox="media/paginated-reports-quickstart-aw/power-bi-azure-portal.png":::

1. On the **Overview** tab for your Azure SQL database, copy the value in the **Server name** box.

1. Go back to **Report Builder**, and in the **Connection Properties** dialog box, under **Server name**, paste the server name you copied.

1. For **Log on to the server**, make sure **Use SQL Server Authentication** is selected. Then type the user name and password you created in Azure for the sample database.

1. Under **Connect to a database**, select the drop-down arrow and select the database name you created in Azure.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-connection-properties.png" alt-text="Screenshot of the Connection Properties dialog box, showing where to find the Connect to a database options." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-connection-properties.png":::

1. Select **Test Connection**. You see the **Test results** message, showing that **Test connection succeeded**.

1. Select **OK**.

    Now in the **Connection string** box, Report Builder displays your new connection string.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-connection-string.png" alt-text="Screenshot showing where to find the Connection string on the Data Source Properties screen." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-data-source-properties-connection-string.png":::

1. Select **OK**.

1. In the **Choose a connection to a data source** page, you see "(in this Report)" under your new data source connection. Select that data source, and select **Next**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-my-azure-data-source.png" alt-text="Screenshot showing where to select the data source." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-my-azure-data-source.png":::

1. In the **Design a query** page, expand **SalesLT**, expand **Tables**, and select these tables:

    - Address
    - Customer
    - Product
    - ProductCategory
    - SalesOrderDetail
    - SalesOrderHeader

     Because you selected **Relationships** > **Auto Detect**, Report Builder detects the relationships between these tables.

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

1. Select **Next**. In the **Choose the layout** page, keep all the default settings, but clear the checkbox next to **Expand/collapse groups**. In general, the expand/collapse groups feature is great, but this time you want the table to wrap to multiple pages.

1. Select **Next** > **Finish**. The table is displayed on the design surface.

## What you created

Let's pause for a moment to look at the results of the wizard.

:::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-wizard-results.png" alt-text="Screenshot showing the results of the Matrix wizard, with numbers labeling each section." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-wizard-results.png":::

1. In the **Report Data** pane, you see the embedded Azure data source and the embedded dataset based on it, both of which you created.

1. The design surface is about 6 inches wide. On the design surface, you see the matrix, displaying column headings and placeholder values. The matrix has six columns and appears to be only five rows tall.

1. **Order Qty**, **Unit Price**, and **Line Total** are all sums, and each row group has a subtotal.

    You still don't see actual data values. You need to run the report to see them.

1. If you don't see the **Properties** pane, select the **View tab > Properties**. In the **Properties** pane, the selected matrix is called Tablix1. A *tablix* in Report Builder is a data region that displays data in rows and columns. It can be either a table or a matrix.

1. In the **Grouping** pane, you see the three row groups you created in the wizard:

   - CompanyName
   - Sales Order
   - Product Name

   This matrix doesn't have any column groups.

### Run the report

To see the actual values, run the report.

- Select **Run** in the **Home** toolbar.

   Now you see the values. The matrix has many more rows than you saw in Design view. Report Builder lists the page as **1** of **2?**. Report Builder loads the report as quickly as possible, so it only retrieves enough data for a few pages at a time. The question mark indicates that Report Builder is still loading the data.

   :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-run-report.png" alt-text="Screenshot of a report, showing where to find the page number and page navigation arrows." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-run-report.png":::

## Format the report

Now you have a report with a matrix that wraps to 33 pages. Add some other features and improve how it looks. You can run the report after every step, if you want to see how it's coming along.

- On the **Run** tab of the ribbon, select **Design**, so you can continue modifying it.

### Set page width

Typically, you format a paginated report for printing, and a typical page is 8.5 x 11 inches.

1. Drag the ruler to make the design surface 7 inches wide. The default margins are 1 inch on each side, so the side margins need to be narrower.

1. Select the gray area around the design surface to show the **Report** properties.

    If you don't see the **Properties** pane, select the **View** tab > **Properties**.

1. Expand **Margins** and change **Left** and **Right** from 1 inch to 0.75 inches.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-set-margins.png" alt-text="Screenshot of report properties, showing where to see and edit the report margins." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-set-margins.png":::

### Add a report title

1. Select **Click to add title** at the top of the page, and type **Sales by Company**.

1. Select the title text, and in the **Properties** pane under **Font**, change **Color** to **Blue**.

### Add a page number

You noticed the report has a date and time stamp in the footer. You can add a page number to the footer, too.

1. At the bottom of the design surface, you see **[&ExecutionTime]** on the right side in the footer.

1. In the **Report Data** pane, expand the **Built-in Fields** folder. Drag **Page Number** to the left side of the footer, at the same height as **[&ExecutionTime]**.

1. Drag the right side of the **[&PageNumber]** box to make it square.

1. On the **Insert** tab, select **Text Box**.

1. Select to the right of **[&PageNumber]**, type "of", and make the text box square.

1. Drag **Overall Total Pages** to the footer, to the right of "of", and drag its right side to make it square, too.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-add-page-numbers.png" alt-text="Screenshot of the Report Data pane, showing where to drag a build-in field into a footer." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-add-page-numbers.png":::

### Make the table wider

Now you can make the matrix wide enough to fill the width of the page, and make the text columns wider so the names don't scroll as much.

1. Select the matrix, and then select the **Company Name** column.

1. Hover over the gray bar at the top of the matrix at the right edge of the **Company Name** column. Drag towards the right, until the column ends at 1 3/8 inches.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-drag-column.png" alt-text="Screenshot showing where to drag the edge of a column to make it wider." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-drag-column.png":::

1. Drag the right edge of **Product Name** until the column ends at 3 3/4 inches.

Now the matrix is almost as wide as the print area.

### Format the currency

If you noticed when you ran the report, the dollar amounts aren't formatted as currency yet.

1. Select the upper-left **[Sum(OrderQty)]** cell, hold down the Shift key, and select the lower-right **[Sum(LineTotal)]** cell.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-select-money-cells.png" alt-text="Screenshot showing where to select cells with currency values." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-select-money-cells.png":::

1. On the **Home** tab, select the dollar sign (**$**) currency symbol, and then select the arrow next to **Placeholder styles** > **Sample Values**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-format-currency.png" alt-text="Screenshot showing where to select Sample Values." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-format-currency.png":::

    Now you can see the values are formatted as currency.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-display-sample-values.png" alt-text="Screenshot showing report values formatted as currency." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-display-sample-values.png":::

### Add column headers on each page

Before you publish the report to the Power BI service, make one more formatting improvement: make the column headers show up on each page in the report.

1. In the far-right end of the top bar in the **Grouping** pane, select the drop-down arrow > **Advanced Mode**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-advanced-mode.png" alt-text="Screenshot showing where to select Advanced Mode." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-advanced-mode.png":::

1. Select the top **Static** bar in the **Row Groups**. You see that the **Company Name** cell in the matrix is selected.

   :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-static-group.png" alt-text="Screenshot showing where to select the Static bar." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-static-group.png":::

1. In the **Properties** pane, you're looking at the properties for **Tablix Member**. Set **KeepWithGroup** to **After** and **RepeatOnNewPage** to **True**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-repeat-on-new-page.png" alt-text="Screenshot showing where to find the properties for Tablix Member." lightbox="":::

    Run the report to see how it looks now.

1. Select **Run** on the **Home** tab.

1. Select **Print Layout**. Now the report has 29 pages. Scroll through a few pages. You see the currency is formatted, the columns have headings on every page, and the report has a footer with page numbers and date and time stamp on every page.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-finished-page.png" alt-text="Screenshot of a sample report with Print Layout selected." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-finished-page.png":::

1. Save the report to your computer.

## Upload the report to the service

Now that you created this paginated report, upload it to the Power BI service.

1. In the [Power BI service](https://app.powerbi.com) nav pane, select **Workspaces** > **+ New workspace**.

1. In **Create a workspace**, name your workspace **Azure AW** or another unique name. You're the only member for now. Select **Apply**.

1. In your new workspace, select **Browse** from the left-hand menu. Select your file from the list, or go to where you saved the file and open it.

    Power BI imports your file, and you see it under **Reports** on the App list page.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-app-list.png" alt-text="Screenshot showing where the report appears in the Reports list on the App list page." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-app-list.png":::

1. Select the report and view it.

1. If you get an error, you might need to reenter your credentials. Select the ellipses to the right of the report, and then choose **Manage**.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-manage-report.png" alt-text="Screenshot showing where to select Manage to manage your report." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-manage-report.png":::

1. Select **Edit credentials** and enter the credentials you used in Azure when you created the Azure database.

    :::image type="content" source="media/paginated-reports-quickstart-aw/power-bi-paginated-edit-credentials.png" alt-text="Screenshot showing where to select Edit credentials." lightbox="media/paginated-reports-quickstart-aw/power-bi-paginated-edit-credentials.png":::

1. Now you can view your paginated report in the Power BI service.

## Related content

[What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
