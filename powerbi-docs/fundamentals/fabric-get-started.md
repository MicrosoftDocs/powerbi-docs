---
title: "Tutorial: Microsoft Fabric for Power BI users"
description: Get started using Microsoft Fabric with Power BI by creating a dimensional model and creating a report.
author: itsnotaboutthecell
ms.author: alpowers
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 01/31/2024
ms.custom: ""
LocalizationGroup: Get started
---
# Tutorial: Fabric for Power BI users

In this tutorial, you learn how to use Dataflows Gen2 and Pipelines to ingest data into a Lakehouse and create a dimensional model. You also learn how to generate a beautiful report automatically to display the latest sales figures from start to finish in just 45 minutes.

Let’s get started.

> [!div class="checklist"]
>
> * Prepare and load data into a lakehouse
> * Build a dimensional model in a lakehouse
> * Automatically create a report with quick create

## Prerequisites

* Before you start, ask your Fabric administrator to [enable Fabric for your organization](/fabric/admin/fabric-switch)
* If you aren't signed up yet, [sign up for a free trial](service-self-service-signup-for-power-bi.md).
* Create a [new workspace](../collaborate-share/service-create-the-new-workspaces.md) and assign a Fabric capacity.
     * An existing workspace can also be used, although we recommend using a nonproduction workspace for simplicity of the tutorial.
* Download the [Power Query template](https://github.com/microsoft/pbiworkshops/raw/main/_Asset%20Library/Source_Files/ContosoSales.pqt) file that contains sample queries for Contoso data.

## Create a lakehouse to store data

We start by creating a lakehouse to store our data, Dataflows Gen2 to prepare and transform columns, and a pipeline to handle the orchestration of a scheduled refresh and e-mail activity.

---

1. Navigate to your workspace and select **New**. Then select **More options**.

    :::image type="content" source="media/fabric-get-started/show-all-item.png" alt-text="Screenshot of More options in the new item menu.":::

1. In the **New** item creation screen, select **Lakehouse** under the Data engineering category.

    :::image type="content" source="media/fabric-get-started/new-lakehouse.png" alt-text="Screenshot of Data engineering items.":::

1. Set the Lakehouse name to **SalesLakehouse**. Then select **Create**.

    :::image type="content" source="media/fabric-get-started/name-lakehouse.png" alt-text="Screenshot of naming a name Lakehouse.":::

1. Once you're in the Lakehouse editor, select **New Dataflow Gen2**.

    > [!NOTE]
    > You can also select *Get data* from the ribbon and then **New Dataflow Gen2**.

    :::image type="content" source="media/fabric-get-started/new-dataflow-gen2.png" alt-text="Screenshot of Get data drop down in the Lakehouse editor.":::

## Prepare and load data into your lakehouse

Take the following steps to load data into your lakehouse:

1. Once you're in the **Power Query Online** editor for Dataflows Gen2, select **Import from a Power Query template** and choose the template file downloaded from the [prerequisites](#prerequisites).

    :::image type="content" source="media/fabric-get-started/import-power-query-template.png" alt-text="Screenshot of watermarks in the Dataflows Gen2 editor.":::

1. Select the **DimDate** query under the **Data load** query group and then select on **Configure connection**. If necessary, set the authentication type to **Anonymous** before selecting **Connect**.

    :::image type="content" source="media/fabric-get-started/configure-connection.png" alt-text="Screenshot of the Configure connection menu.":::

1. With the **DimDate** query selected, in the data preview window, change the data type of the **DateKey** column to **Date/Time** by selecting the icon in the top left.

    :::image type="content" source="media/fabric-get-started/transform-column-date-time.png" alt-text="Screenshot of changing data types within the Power Query editor.":::

1. Select **Replace current** within the **Change column type** window.

    :::image type="content" source="media/fabric-get-started/change-column-type.png" alt-text="Screenshot of the change column type menu.":::

### Add a data destination

Take the following steps to add a data destination:

1. With the **DimDate** table selected, from the **Home** tab, select **Add data destination** and then select the **Lakehouse** option menu item.

    :::image type="content" source="media/fabric-get-started/lakehouse-data-destination.png" alt-text="Screenshot of the get data destination Lakehouse option.":::

1. If necessary, set the authentication to **Organizational account** and then select **Next**.

    :::image type="content" source="media/fabric-get-started/connect-to-lakehouse.png" alt-text="Screenshot of the Connect to data destination menu.":::

1. From the navigator, select the workspace used for this tutorial and expand to view all **Lakehouse** items. Select **SalesLakehouse** and confirm that the default **New table** is selected before selecting **Next** to continue.

    :::image type="content" source="media/fabric-get-started/new-table.png" alt-text="Screenshot of the destination target navigator item.":::

1. Set the **Update method** to **Replace** and then select **Save settings**.

    > [!CAUTION]
    > Setting the update method to *Replace* deletes all existing data and replaces it with the new data on each subsequent refresh.

    :::image type="content" source="media/fabric-get-started/replace-method.png" alt-text="Screenshot of the destination settings menu option.":::

    > [!NOTE]
    > In the bottom right corner of the **Power Query Online** editor, you can find the configured **Data destination** settings for your query where you can further customize or remove.

     :::image type="content" source="media/fabric-get-started/data-destination-dim-date.png" alt-text="Screenshot of the configured data destination.":::

1. Before moving on to the next section of this tutorial, make sure to perform the [same steps](#add-a-data-destination) as you took earlier in this section to configure the Lakehouse as your data destination for each of the following queries.

     | Query |
     | :-- |
     | DimCustomer |
     | DimEmployee |
     | DimProduct |
     | DimStore |

1. Select the **FactOnlineSales** query under the **Data transformation** query group. From the **Home** tab, select **Add data destination**. Select the **Lakehouse** option.

    :::image type="content" source="media/fabric-get-started/data-destination-fact-online-sales.png" alt-text="Screenshot of the Data destination Lakehouse target option.":::

1. If necessary, set the authentication to **Organizational account** and then select **Next**.

    :::image type="content" source="media/fabric-get-started/connect-to-lakehouse.png" alt-text="Screenshot of the Connect to data destination menu.":::

1. From the navigator, select the workspace used for this tutorial and expand to view all **Lakehouse** items. Select **SalesLakehouse** and confirm that the default **New table** is selected before selecting **Next** to continue.

    :::image type="content" source="media/fabric-get-started/new-table-fact-online-sales.png" alt-text="Screenshot of the destination target navigator window.":::

1. Set the **Update method** to **Append** and then select **Save settings**.

    > [!NOTE]
    > This process inserts data, preserving the existing rows within the table on each subsequent refresh.

    :::image type="content" source="media/fabric-get-started/append-method.png" alt-text="Screenshot of the destination settings menu selection.":::

1. Select **Publish** to save your dataflow and exit the **Power Query Online** editor.

    :::image type="content" source="media/fabric-get-started/publish.png" alt-text="Screenshot of the publish button within Power Query Online.":::

1. Hover above the created dataflow in your workspace, select the ellipses **(...)** and the **Properties** option.

    :::image type="content" source="media/fabric-get-started/dataflow-properties.png" alt-text="Screenshot of the dataflows properties in a workspace.":::

1. Change the name of the dataflow to **OnlineSalesDataflow** and select **Save**.

    :::image type="content" source="media/fabric-get-started/dataflow-name.png" alt-text="Screenshot of renaming a dataflow option.":::

### Orchestrate a data pipeline

Using pipelines, we first orchestrate the refresh of our data flow. If an error occurs, we send a customized Outlook email that includes important details.

1. Select the **Lakehouse** item named **SalesLakehouse** within your workspace.

    :::image type="content" source="media/fabric-get-started/sales-lakehouse-item.png" alt-text="Screenshot of renaming an existing dataflow.":::

2. Once you're in the Lakehouse editor, select **New data pipeline**.

    > [!NOTE]
    > You can also select *Get data* from the ribbon and then **New data pipeline**.

    :::image type="content" source="media/fabric-get-started/new-data-pipeline.png" alt-text="Screenshot of watermarks in the Lakehouse editor.":::

3. Set the pipeline name to **SalesPipeline**. Then select **Create**.

    :::image type="content" source="media/fabric-get-started/new-pipeline-name.png" alt-text="Screenshot of the pipeline name menu option.":::

4. Close the Copy data assistant by selecting **Cancel**. If you’re prompted to confirm exiting the copy data window, select **Yes, cancel**.

    :::image type="content" source="media/fabric-get-started/close-copy-data-assistant.png" alt-text="Screenshot of the copy data assistant menu.":::

5. Once you’re in the pipeline editor, select **Add pipeline activity**, and then select **Dataflow**.

    > [!NOTE]
    > You can also select *Dataflow* from the ribbon.

    :::image type="content" source="media/fabric-get-started/add-dataflow-activity.png" alt-text="Screenshot of the pipeline watermark canvas and the Add activity option.":::

6. Select the dataflow activity within the pipeline editor and change its **Name** value to **OnlineSalesActivity** within the General section.

    :::image type="content" source="media/fabric-get-started/dataflow-activity-name.png" alt-text="Screenshot of the dataflow name value.":::

7. With the dataflow activity still selected, select **Settings** and choose **OnlineSalesDataflow** from the Dataflow list. If necessary to update the list, select the **Refresh** icon.

    :::image type="content" source="media/fabric-get-started/dataflow-activity-dataflow.png" alt-text="Screenshot of the dataflow selection setting.":::

8. Select the **Activities** tab and then the **Office365 Outlook** activity. 

    > [!NOTE]
    > If a **Grant consent** window appears, select **Ok**, sign in with your organizational account and then select **Allow access**.

    :::image type="content" source="media/fabric-get-started/office-365-activity.png" alt-text="Screenshot of the Office365 Outlook activity information.":::

9. Select the **Office365 Outlook** activity within the pipeline editor and change its **Name** value to **Mail on failure** within the General section.

    :::image type="content" source="media/fabric-get-started/office-365-activity-name.png" alt-text="Screenshot of the Office365 Outlook activity name.":::

10. With the Office365 Outlook activity still selected, select **Settings**. Update the **To** field to your e-mail address and the **Subject** to **Pipeline failure**. Select the **Add dynamic content [Alt+Shift+D]** for the mail Body.

    > [!NOTE]
    > More e-mail configuration options such as From (Send as), Cc, Bcc, Sensitivity label and more are available from *Advanced properties*.

    :::image type="content" source="media/fabric-get-started/office-365-activity-settings.png" alt-text="Screenshot of the Office365 Outlook settings.":::

11. In the **Pipeline expression builder**, paste the following expression code block:

    ```
    @concat(
        'Pipeline: '
        , 
        , '<br>'
        , 'Workspace: '
        , 
        , '<br>'
        , 'Time: '
        , 
    )
    ```

    :::image type="content" source="media/fabric-get-started/expression-builder.png" alt-text="Screenshot of the Office365 Outlook activity with expression builder.":::

12. Select **System variables** and insert the following variables by selecting the corresponding name from the following table.

    | Value name | Line | System variable |
    | :- | :- | :- |
    | Pipeline: | 3 | Pipeline ID |
    | Workspace: | 6 | Workspace ID |

    :::image type="content" source="media/fabric-get-started/system-variables.png" alt-text="Screenshot of the pipeline system variables.":::

13. Select **Functions** and insert the following function by selecting the corresponding name from the following table. Once complete select **OK**.

    | Value name | Line | System variable |
    | :- | :- | :- |
    | Time: | 9 | utcnow |

    :::image type="content" source="media/fabric-get-started/functions.png" alt-text="Screenshot of pipeline functions.":::

14. Select **OnlineSalesActivity**.  From the available path options, select the **"X" (On fail)**. This creates an arrow that is dropped on the **Mail on failure** activity. This activity is now invoked if the **OnlineSalesActivity** fails.

     :::image type="content" source="media/fabric-get-started/on-failure.png" alt-text="Screenshot of the on failure path.":::

15. From the **Home** tab, select **Schedule**. Once you update the following configurations, select **Apply** to save your changes.

     | Name | Value |
     | :- | :- |
     | Scheduled run | On |
     | Repeat | Daily |
     | Time | 12:00:00 AM |

     :::image type="content" source="media/fabric-get-started/schedule.png" alt-text="Screenshot of on failure branch." lightbox="media/fabric-get-started/schedule.png":::

16. From the **Home** tab, select **Run**. If a dialog window is displayed select the **Save and run** option to continue.

    :::image type="content" source="media/fabric-get-started/run.png" alt-text="Screenshot of the run option from the home tab." lightbox="media/fabric-get-started/run.png":::

    To monitor the pipeline’s current status, you can view the **Output** table, which displays the current activity progress. The table periodically refreshes on its own, or you can manually select the refresh icon to update it.

    :::image type="content" source="media/fabric-get-started/output.png" alt-text="Screenshot of the current pipeline activity progress.":::

17. When the status returns **Succeeded**, you can proceed to the next section of the tutorial by returning to your workspace.

     :::image type="content" source="media/fabric-get-started/return-to-workspace.png" alt-text="Screenshot of the side rail with workspace selection.":::

## Create a semantic model in the Lakehouse

The data you loaded is almost ready for reporting. Let’s first use the SQL endpoint to create relationships and SQL views in our lakehouse. This allows us to easily access our data within a semantic model, which is a metadata model that contains physical database objects that are abstracted and modified into logical dimensions. It's designed to present data for analysis according to the structure of the business.

### Create relationships

This model is a star schema that you might see from data warehouses: It resembles a star. The center of the star is a Fact table. The surrounding tables are called Dimension tables, which are related to the Fact table with relationships.

---

1. In the workspace view, select the **SQL Endpoint** item named **SalesLakehouse**.

    :::image type="content" source="media/fabric-get-started/sql-endpoint.png" alt-text="Screenshot of the SQL endpoint item in a workspace.":::

2. Once in the Explorer, select the **Model** view at the bottom of the screen to begin creating relationships.

    :::image type="content" source="media/fabric-get-started/model-view.png" alt-text="Screenshot of the Model view selection.":::

3. Create a relationship by dragging and dropping the column **CustomerKey** from the **FactOnlineSales** table, to the **CustomerKey** on the **DimCustomer** table. 

4. Once in the **Create Relationship** window ensure that you select the correct tables, columns and settings as showing in the following table. Select **Confirm** to continue.

    | Make this relationship active | From: Table 1 (column) | To: Table 2 (column) | Cardinality | Cross filter direction | 
    | :----- |:----- | :------ | :----- | :----- | 
    | ☑ | FactOnlineSales (CustomerKey) | DimCustomer (CustomerKey) | Many to one (*:1) | Single |

    :::image type="content" source="media/fabric-get-started/create-relationship.png" alt-text="Screenshot of Relationship between the FactOnlineSales and DimCustomer table.":::

5. Perform these same steps for each of the remaining tables and columns listed in the following table to create relationships.

    | Make this relationship active | From: Table 1 (column) | To: Table 2 (column) | Cardinality | Cross filter direction | 
    | :----- |:----- | :------ | :----- | :----- |
    | ☑ | FactOnlineSales (ProductKey) | DimProduct (ProductKey) | Many to one (*:1) | Single |
    | ☑ | FactOnlineSales (StoreKey) | DimStore (StoreKey) | Many to one (*:1) | Single |
    | ☑ | FactOnlineSales (DateKey) | DimDate (DateKey) | Many to one (*:1) | Single |
    | ☑ | DimStore (StoreKey) | DimEmployee (StoreKey) | Many to one (*:1) | Both |

     The following image shows a finished view of the semantic model with all the created relationships included.

     :::image type="content" source="media/fabric-get-started/star-schema.png" alt-text="Screenshot of table relationships in the model view pane." lightbox="media/fabric-get-started/star-schema.png":::

### Write a measure in DAX

Let's write a basic measure that calculates the total sales amount.

1. Select the **FactOnlineSales** table in the **Tables** folder. On the **Home** tab, select **New measure**.

    :::image type="content" source="media/fabric-get-started/new-measure.png" alt-text="Screenshot of table relationships in the model view.":::

2. In the formula editor, copy and paste or type the following measure to calculate the total sales amount. Select the **check mark** to commit.

    ```dax
    Total Sales Amount = SUM(FactOnlineSales[SalesAmount])
    ```

    :::image type="content" source="media/fabric-get-started/total-sales-amount.png" alt-text="Screenshot of Select the check mark to commit a DAX measure.":::

### Create a SQL view

Let’s write a SQL statement that calculates the total sales amount by month. We’ll then save this statement as a view in our lakehouse. This allows us to easily access the total sales amount by month in the future.

1. On the **Home** tab, select **New SQL query**.

    :::image type="content" source="media/fabric-get-started/new-sql.png" alt-text="Screenshot of New SQL query from the home tab.":::

2. In the query editor, copy and paste or type this query to calculate the total sales amount by month number in descending order. Once entered, select **Run** to view results.

    ```sql
    SELECT 
    MONTH(DateKey) as "MonthNumber",
    SUM(SalesAmount) as "TotalSalesAmount"
    FROM FactOnlineSales
    GROUP BY MONTH(DateKey)
    ```

    :::image type="content" source="media/fabric-get-started/run-sql.png" alt-text="Screenshot of SQL query editor.":::

3. Highlight the full query text and select **Save as view**.

    :::image type="content" source="media/fabric-get-started/save-view.png" alt-text="Screenshot of Save as view option.":::

4. In the Save as view window, set the **View name** to **TotalSalesByMonth** and then select **OK**.

    :::image type="content" source="media/fabric-get-started/save-as-view.png" alt-text="Screenshot of Save as view window.":::

5. In the Explorer, expand the **Views** section and select **TotalSalesByMonth** to view the results in the **Data preview**.

    :::image type="content" source="media/fabric-get-started/total-sales-by-month-view.png" alt-text="Screenshot of Views with the Lakehouse explorer.":::

     Once you're done exploring the SQL endpoint editor, you can proceed to the next section of the tutorial by returning to your workspace.

     :::image type="content" source="media/fabric-get-started/return-to-workspace-after-view.png" alt-text="Screenshot of the side rail and selection of the workspace.":::

## Autocreate a report

Now that you’ve modeled your data, it's time to visualize and explore your data using quick create.

---

1. In the workspace view, hover above the item type **Dataset (default)** and item name **SalesLakehouse**. Select the ellipses **( … )** and choose **Auto-create report**.

    :::image type="content" source="media/fabric-get-started/auto-create-report.png" alt-text="Screenshot of the Autocreate report option with a workspace." lightbox="media/fabric-get-started/auto-create-report.png":::

    A report is automatically generated for you and dynamically updates based upon column selections in the **Your data** pane. 

    - The displayed report may differ from the image.

    :::image type="content" source="media/fabric-get-started/auto-create-finished-report.png" alt-text="Screenshot of the finished Auto-create report.":::

2. Select **Save** from the ribbon to save a copy to the current workspace

    - To enter the complete visual authoring experience, you can select **Edit** on the ribbon.

    :::image type="content" source="media/fabric-get-started/save-report.png" alt-text="Screenshot of the Save button when visualizing data.":::

3. In the Save your report dialog box, type **Sales Summary** in the **Enter a name for your report** field. Select **Save** once complete.

    :::image type="content" source="media/fabric-get-started/save-your-report.png" alt-text="Screenshot of the Save button completing its process when visualizing data.":::

You can learn more about [quick create](../create-reports/service-quick-create-report.md).

## Related content

Congratulations on completing the tutorial. If you created a workspace for the tutorial, you can choose to delete it now. Alternatively, you can remove the individual items that were created during the tutorial.

We hope this tutorial showed how Power BI users can easily provide insights into data at any level of scale with Microsoft Fabric.
