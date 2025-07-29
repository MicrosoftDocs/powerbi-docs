---
title: "Tutorial: Microsoft Fabric for Power BI users"
description: Learn how to use Microsoft Fabric with Power BI by creating a dimensional model and building a report.
author: itsnotaboutthecell
ms.author: alpowers
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 06/16/2025
content_well_notification:
    - AI-contribution
ai-usage: ai-assisted
ms.custom: ""
LocalizationGroup: Get started
---

# Tutorial: Microsoft Fabric for Power BI users

In this tutorial, you'll learn how to use Microsoft Fabric to prepare, load, and model data for Power BI reporting. You'll use Dataflows Gen2 to ingest and transform data into a Lakehouse, orchestrate data refreshes with Pipelines, and build a dimensional model using Direct Lake mode. Finally, you'll automatically generate a report to visualize the latest sales data.

By the end of this tutorial, you'll be able to:

> [!div class="checklist"]
> * Prepare and load data into a lakehouse
> * Orchestrate a data pipeline to refresh data and send an email on failure
> * Create a semantic model in the Lakehouse
> * Automatically create a report with quick create

## Prerequisites

Before you begin, ensure you have the following:

- [Enable Fabric for your organization](/fabric/admin/fabric-switch) if you haven't already.
- [Sign up for a free trial](service-self-service-signup-for-power-bi.md) if you don't have access.
- Create a [new workspace](../collaborate-share/service-create-the-new-workspaces.md) and assign a Fabric capacity. You can use an existing workspace, but a nonproduction workspace is recommended for this tutorial.
- Download the [Power Query template](https://github.com/microsoft/pbiworkshops/raw/main/_Asset%20Library/Source_Files/ContosoSales.pqt) file containing sample queries for Contoso data.

## Create a lakehouse to store data

Start by creating a lakehouse to store your data. You'll use Dataflows Gen2 to prepare and transform it, and a pipeline to orchestrate scheduled refreshes and email notifications.

1. In your workspace, select **New item** at the top of the page.

    :::image type="content" source="media/fabric-get-started/new-item.png" alt-text="Screenshot of selecting New item in the workspace.":::

2. On the **New** item creation screen, search for or select **Lakehouse**.

    :::image type="content" source="media/fabric-get-started/new-lakehouse.png" alt-text="Screenshot of the Lakehouse creation screen.":::

3. Enter **SalesLakehouse** as the name (names can include letters, numbers, and underscores, but not special characters or spaces), then select **Create**.

    :::image type="content" source="media/fabric-get-started/name-lakehouse.png" alt-text="Screenshot showing the Lakehouse name input field.":::

4. In the Lakehouse editor, select **New Dataflow Gen2** from the ribbon.

    > [!NOTE]
    > Alternatively, select *Get data* from the ribbon, then choose **New Dataflow Gen2**.

    :::image type="content" source="media/fabric-get-started/new-dataflow-gen2.png" alt-text="Screenshot showing the 'Get data' dropdown with 'New Dataflow Gen2' highlighted.":::

5. Name the dataflow **OnlineSalesDataflow** (use only letters, numbers, and underscores), then select **Create**.

## Prepare and load data into your lakehouse using Dataflows Gen2

1. In the **Power Query Online** editor for Dataflows Gen2, select **Import from a Power Query template** and choose the **ContosoSales.pqt** template file you downloaded in the [prerequisites](#prerequisites).

    :::image type="content" source="media/fabric-get-started/import-power-query-template.png" alt-text="Screenshot of importing a Power Query template.":::

2. Select the **DimDate** query under the **Data load** group. If prompted, select **Configure connection**, set authentication to **Anonymous**, and select **Connect**.

3. With **DimDate** selected, in the data preview, find the **DateKey** column. Select the data type icon in the column header and choose **Date/Time** from the dropdown.

    :::image type="content" source="media/fabric-get-started/transform-column-date-time.png" alt-text="Screenshot of changing data types within the Power Query editor.":::

4. In the **Change column type** window, select **Replace current**.

### Configure data destinations

1. With **DimDate** selected, review the data destination settings in the bottom right. Hover over the configured Lakehouse to view its properties.

    The Lakehouse you created is the destination for all tables. The default update method is **Replace**, which overwrites previous data during each refresh.

    :::image type="content" source="media/fabric-get-started/default-destination.png" alt-text="Screenshot of the Data destination section and configuration options.":::

2. Select the **FactOnlineSales** table and review its data destination settings.

    Because the **FactOnlineSales** source changes frequently, optimize refreshes by appending new data. Remove its current data destination by selecting the **X** icon. Do not remove destinations for other tables.

    :::image type="content" source="media/fabric-get-started/modify-data-destination.png" alt-text="Screenshot of the data destination modify section and settings icon.":::

3. With **FactOnlineSales** still selected, select the **+** icon to add a data destination, then choose **Lakehouse**.

    If prompted, set authentication to **Organizational account** and select **Next**.

    :::image type="content" source="media/fabric-get-started/add-lakehouse-destination.png" alt-text="Screenshot showing the data destination modify section and settings icon.":::

4. In the navigator, select your workspace and expand to view all **Lakehouse** items. Select **SalesLakehouse** and ensure **New table** is selected, then select **Next**.

    :::image type="content" source="media/fabric-get-started/new-table-fact-online-sales.png" alt-text="Screenshot of the destination target navigator window.":::

5. In the data destination settings panel, clear **Use automatic settings**, set **Update method** to **Append**, and select **Save settings**.

    > [!NOTE]
    > The **Append** method adds new rows to the table during each refresh, preserving existing data.

    :::image type="content" source="media/fabric-get-started/append-method.png" alt-text="Screenshot of the destination settings menu selection.":::

6. From the **Home** tab, select **Save & run**.

    :::image type="content" source="media/fabric-get-started/save-and-run.png" alt-text="Screenshot of the save and run button within Power Query Online.":::

7. To exit the **Power Query Online** editor, select the **X** on the **OnlineSalesDataflow** item in the left side-rail.

    > [!NOTE]
    > Selecting **X** closes the editor but does not delete the dataflow.

    :::image type="content" source="media/fabric-get-started/close-dataflow.png" alt-text="Screenshot of the close button within Power Query Online.":::

## Orchestrate a data pipeline

Automate the refresh of your dataflow and handle errors by sending a customized Outlook email with key details.

1. In your workspace, select **New item**.

    :::image type="content" source="media/fabric-get-started/new-item.png" alt-text="Screenshot of selecting New item in the workspace.":::

2. On the **New** item creation screen, search for or select **Data pipeline**.

    :::image type="content" source="media/fabric-get-started/new-item-data-pipeline.png" alt-text="Screenshot of selecting Data pipeline as a new item.":::

3. Name the pipeline **SalesPipeline** and select **Create**.

    :::image type="content" source="media/fabric-get-started/new-pipeline-name.png" alt-text="Screenshot of the pipeline name input.":::

4. In the pipeline editor, select **Pipeline activity**, then choose **Dataflow**.

    > [!NOTE]
    > You can also select **Dataflow** from the ribbon.

    :::image type="content" source="media/fabric-get-started/add-dataflow-activity.png" alt-text="Screenshot of adding a Dataflow activity to the pipeline.":::

5. Select the dataflow activity in the pipeline editor. In the **General** section, set the **Name** to **OnlineSalesActivity**.

    :::image type="content" source="media/fabric-get-started/dataflow-activity-name.png" alt-text="Screenshot of naming the dataflow activity.":::

6. With the dataflow activity selected, go to **Settings** and choose **OnlineSalesDataflow** from the Dataflow list. If needed, select the **Refresh** icon to update the list.

    :::image type="content" source="media/fabric-get-started/dataflow-activity-dataflow.png" alt-text="Screenshot of selecting the dataflow in activity settings.":::

7. Select the **Activities** tab, then add the **Office365 Outlook** activity.

    > [!NOTE]
    > If prompted with a **Grant consent** window, select **Ok**, sign in with your organizational account, and allow access.

    :::image type="content" source="media/fabric-get-started/office-365-activity.png" alt-text="Screenshot of adding the Office365 Outlook activity.":::

8. Select the **Office365 Outlook** activity in the pipeline editor. In the **General** section, set the **Name** to **Mail on failure**.

    :::image type="content" source="media/fabric-get-started/office-365-activity-name.png" alt-text="Screenshot of naming the Office365 Outlook activity.":::

9. With the Office365 Outlook activity selected, go to **Settings**. Enter your email address in the **To** field and set the **Subject** to **Pipeline failure**. For the mail **Body**, select **View in expression builder**.

    > [!NOTE]
    > Additional email options such as From (Send as), Cc, Bcc, and Sensitivity label are available under *Advanced properties*.

    :::image type="content" source="media/fabric-get-started/office-365-activity-settings.png" alt-text="Screenshot of Office365 Outlook activity settings.":::

10. In the **Pipeline expression builder**, paste the following expression into the text block at the top of the page:

    ```text
    @concat(
        'Pipeline: '
        , pipeline().PipelineId
        , '<br>'
        , 'Workspace: '
        , pipeline().WorkspaceId
        , '<br>'
        , 'Time: '
        , utcnow()
    )
    ```

    This expression dynamically inserts the pipeline ID, workspace ID, and the current UTC time into the email body.

11. In the pipeline editor, select **OnlineSalesActivity**. Drag from the **"X" (On fail)** handle and drop it onto the **Mail on failure** activity. This ensures the email is sent if the dataflow activity fails.

    :::image type="content" source="media/fabric-get-started/on-failure.png" alt-text="Screenshot of configuring the on-failure path.":::

12. From the **Home** tab, select **Schedule**. Configure the schedule as follows, then select **Apply**:

    | Name           | Value         |
    | -------------- | ------------- |
    | Scheduled run  | On            |
    | Repeat         | Daily         |
    | Time           | 12:00:00 AM   |

13. From the **Home** tab, select **Run**. If prompted, select **Save and run** to continue.

    To monitor the pipeline’s status, view the **Output** table, which displays activity progress. The table refreshes automatically, or you can select the refresh icon to update it manually.

    :::image type="content" source="media/fabric-get-started/output.png" alt-text="Screenshot of pipeline activity progress.":::

14. When the status shows **Succeeded**, return to your workspace to continue with the tutorial.

    :::image type="content" source="media/fabric-get-started/return-to-workspace.png" alt-text="Screenshot of returning to the workspace.":::

## Create a semantic model in the Lakehouse

The data you loaded is almost ready for reporting. Next, use the tables in the lakehouse to create a semantic model—a metadata layer that organizes and transforms physical data into logical objects. The semantic model is designed to reflect your business structure and make the data easier to analyze.

1. In the workspace view, select the **SalesLakehouse** item.

    :::image type="content" source="media/fabric-get-started/lakehouse-item-selection.png" alt-text="Screenshot of the lakehouse item in a workspace.":::

2. Once in the Explorer, from the **Home** tab select **New semantic model**.

3. In the New semantic model window, name your model **SalesModel**. Then, expand both the **dbo** schema and the **Tables** group. Select the following tables, and select **Confirm**:

    | Table name      |
    | --------------  |
    | DimCustomer     |
    | DimDate         |
    | DimEmployee     |
    | DimProduct      |
    | DimStore        |
    | FactOnlineSales |

    :::image type="content" source="media/fabric-get-started/new-semantic-model-tables.png" alt-text="Screenshot showing the lakehouse item in a workspace.":::

### Create relationships

This model uses a star schema, common in data warehouses. The center of the star is a Fact table, surrounded by Dimension tables, which are related to the Fact table.

1. Create a relationship by dragging and dropping the **CustomerKey** column from the **FactOnlineSales** table to the **CustomerKey** column on the **DimCustomer** table.

2. In the **Create Relationship** window, ensure the following settings, then select **Confirm**:

    | Make this relationship active | From: Table 1 (column)         | To: Table 2 (column)     | Cardinality      | Cross filter direction |
    | :--------------------------- | :----------------------------- | :----------------------- | :--------------- | :--------------------- |
    | ☑                            | FactOnlineSales (CustomerKey)  | DimCustomer (CustomerKey)| Many to one (*:1)| Single                |

3. Repeat these steps for each of the following relationships:

    | Make this relationship active | From: Table 1 (column)         | To: Table 2 (column)     | Cardinality      | Cross filter direction |
    | :--------------------------- | :----------------------------- | :----------------------- | :--------------- | :--------------------- |
    | ☑                            | FactOnlineSales (ProductKey)   | DimProduct (ProductKey)  | Many to one (*:1)| Single                |
    | ☑                            | FactOnlineSales (StoreKey)     | DimStore (StoreKey)      | Many to one (*:1)| Single                |
    | ☑                            | FactOnlineSales (DateKey)      | DimDate (DateKey)        | Many to one (*:1)| Single                |
    | ☑                            | DimStore (StoreKey)            | DimEmployee (StoreKey)   | Many to one (*:1)| Both                  |

    The following image shows a finished view of the semantic model with all relationships included.

    :::image type="content" source="media/fabric-get-started/star-schema.png" alt-text="Screenshot of table relationships in the model view pane." lightbox="media/fabric-get-started/star-schema.png":::

### Write a measure in DAX

Create a basic measure to calculate the total sales amount.

1. Select the **FactOnlineSales** table and on the **Home** tab, select **New measure**.

2. In the formula editor, enter the following DAX measure, then select the **check mark** to commit:

    ```dax
    Total Sales Amount = SUM(FactOnlineSales[SalesAmount])
    ```

    :::image type="content" source="media/fabric-get-started/total-sales-amount.png" alt-text="Screenshot of Select the check mark to commit a DAX measure.":::

## Autocreate a report

Now that you’ve modeled your data, you can quickly visualize and explore it using quick create.

1. Return to your workspace by selecting it from the left side-rail. Hover over the **SalesModel** item, select the ellipses **( … )**, and choose **Auto-create report**.

    :::image type="content" source="media/fabric-get-started/auto-create-report.png" alt-text="Screenshot of the Autocreate report option with a workspace." lightbox="media/fabric-get-started/auto-create-report.png":::

    A report is automatically generated and updates dynamically based on column selections in the **Your data** pane.

    :::image type="content" source="media/fabric-get-started/auto-create-finished-report.png" alt-text="Screenshot of the finished Auto-create report.":::

2. Select **Save** from the ribbon to save a copy to the current workspace.

    > [!NOTE]
    > To enter the full visual authoring experience, select **Edit** on the ribbon.

Learn more about [quick create](../create-reports/service-quick-create-report.md).

## Related content

Congratulations on completing the tutorial! If you created a dedicated workspace for this tutorial, you can now choose to delete it, or remove individual items created during the process.

This tutorial demonstrates how Power BI users can easily uncover insights at any scale using Microsoft Fabric.
