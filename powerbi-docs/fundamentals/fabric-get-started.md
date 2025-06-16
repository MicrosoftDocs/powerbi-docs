---
title: "Tutorial: Microsoft Fabric for Power BI users"
description: Get started using Microsoft Fabric with Power BI by creating a dimensional model and creating a report.
author: itsnotaboutthecell
ms.author: alpowers
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 06/16/2025
ms.custom: ""
LocalizationGroup: Get started
---
# Tutorial: Fabric for Power BI users

In this tutorial, you learn how to use Dataflows Gen2 and Pipelines to ingest data into a Lakehouse and create a dimensional model. You also learn how to generate a beautiful report automatically to display the latest sales figures from start to finish in just 45 minutes.

Let’s get started!

> [!div class="checklist"]
>
> * Prepare and load data into a lakehouse
> * Build a dimensional model in a lakehouse
> * Automatically create a report with quick create

## Prerequisites

* Before you start, if you haven't enabled Fabric yet, [enable Fabric for your organization](/fabric/admin/fabric-switch)
* If you aren't signed up yet, [sign up for a free trial](service-self-service-signup-for-power-bi.md).
* Create a [new workspace](../collaborate-share/service-create-the-new-workspaces.md) and assign a Fabric capacity.
     * An existing workspace can also be used, although we recommend using a nonproduction workspace for simplicity of the tutorial.
* Download the [Power Query template](https://github.com/microsoft/pbiworkshops/raw/main/_Asset%20Library/Source_Files/ContosoSales.pqt) file that contains sample queries for Contoso data.

## Create a lakehouse to store data

We start by creating a lakehouse to store our data, Dataflows Gen2 to prepare and transform columns, and a pipeline to handle the orchestration of a scheduled refresh and e-mail activity.

---

1. Navigate to your workspace and select **New item**.

    :::image type="content" source="media/fabric-get-started/new-item.png" alt-text="Screenshot of the Show all option in the new item menu.":::

1. In the **New** item creation screen, search for or select the **Lakehouse** item.

    :::image type="content" source="media/fabric-get-started/new-lakehouse.png" alt-text="Screenshot of a new lakehouse creation.":::

1. Set the Lakehouse name to **SalesLakehouse**. Then select **Create**.

    :::image type="content" source="media/fabric-get-started/name-lakehouse.png" alt-text="Screenshot of naming a name Lakehouse.":::

1. Once you're in the Lakehouse editor, select **New Dataflow Gen2**.

    > [!NOTE]
    > You can also select *Get data* from the ribbon and then **New Dataflow Gen2**.

    :::image type="content" source="media/fabric-get-started/new-dataflow-gen2.png" alt-text="Screenshot of Get data drop down in the Lakehouse editor.":::

1. Update the name of the dataflow to **OnlineSalesDataflow** and select **Create**.

## Prepare and load data into your lakehouse

Take the following steps to load data into your lakehouse:

1. Once you're in the **Power Query Online** editor for Dataflows Gen2, select **Import from a Power Query template** and choose the template file downloaded from the [prerequisites](#prerequisites).

    :::image type="content" source="media/fabric-get-started/import-power-query-template.png" alt-text="Screenshot of watermarks in the Dataflows Gen2 editor.":::

1. Select the **DimDate** query under the **Data load** query group. If necessary, select **Configure connection** and set the authentication type to **Anonymous** before selecting **Connect**.

1. With the **DimDate** query selected, in the data preview window, change the data type of the **DateKey** column to **Date/Time** by selecting the icon in the top left.

    :::image type="content" source="media/fabric-get-started/transform-column-date-time.png" alt-text="Screenshot of changing data types within the Power Query editor.":::

1. Select **Replace current** within the **Change column type** window.


### Configure a data destination

Take the following steps to update a default data destination:

1. While the **DimDate** table is still selected, direct your attention to the data destination settings located in the bottom right-hand corner and hover over the configured Lakehouse to explore its properties.

    Our Lakehouse, which we previously set up in our workspaces, serves as the central entry point and destination for all our tables. Additionally, the update method is defaulted to be **Replace**, ensuring that previous data is automatically removed and new data written during each refresh cycle.

    :::image type="content" source="media/fabric-get-started/default-destination.png" alt-text="Screenshot of the Data destination section and configuration options.":::

1. Next we'll modify the data destination settings for the **FactOnlineSales** table by first selecting the table and then reviewing the data destination settings located in the bottom right-hand corner.

    Since the **FactOnlineSales** table's source is constantly changing, we want to optimize our refreshes by appending data to an existing table. To achieve this, we’ll delete the data destination settings, by clicking on the **X** icon to remove.

    :::image type="content" source="media/fabric-get-started/modify-data-destination.png" alt-text="Screenshot of the data destination modify section and settings icon.":::

1. With the **FactOnlineSales** query still active, select the **+** symbol to add a data destination and select **Lakehouse**.

    If necessary, set the authentication to **Organizational account** and then select **Next**.

    :::image type="content" source="media/fabric-get-started/add-lakehouse-destination.png" alt-text="Screenshot of the add data destination sources menu.":::

1. From the navigator, select the workspace used for this tutorial and expand to view all **Lakehouse** items. Select **SalesLakehouse** and confirm that the default **New table** is selected before selecting **Next** to continue.

    :::image type="content" source="media/fabric-get-started/new-table-fact-online-sales.png" alt-text="Screenshot of the destination target navigator window.":::

1. Deselect the **Use automatic settings** and set the **Update method** to **Append** and then select **Save settings**.

    > [!NOTE]
    > This process inserts data, preserving the existing rows within the table on each subsequent refresh.

    :::image type="content" source="media/fabric-get-started/append-method.png" alt-text="Screenshot of the destination settings menu selection.":::

1. From the **Home** tab select **Save & run**.

    :::image type="content" source="media/fabric-get-started/save-and-run.png" alt-text="Screenshot of the save and run button within Power Query Online.":::

1. On the left side-rail select the **X** on the **OnlineSalesDataflow** item to exit the **Power Query Online** editor.

    :::image type="content" source="media/fabric-get-started/close-dataflow.png" alt-text="Screenshot of the publish button within Power Query Online.":::

### Orchestrate a data pipeline

Using pipelines, we first orchestrate the refresh of our data flow. If an error occurs, we send a customized Outlook email that includes important details.

1. Navigate to your workspace and select **New item**.

    :::image type="content" source="media/fabric-get-started/new-item.png" alt-text="Screenshot of the Show all option in the new item menu.":::

1. In the **New** item creation screen, search for or select the **Data pipeline** item.

    :::image type="content" source="media/fabric-get-started/new-item-data-pipeline.png" alt-text="Screenshot of a new data pipeline creation.":::

1. Set the pipeline name to **SalesPipeline**. Then select **Create**.

    :::image type="content" source="media/fabric-get-started/new-pipeline-name.png" alt-text="Screenshot of the pipeline name menu option.":::

1. Once you’re in the pipeline editor, select **Pipeline activity**, and then select **Dataflow**.

    > [!NOTE]
    > You can also select *Dataflow* from the ribbon.

    :::image type="content" source="media/fabric-get-started/add-dataflow-activity.png" alt-text="Screenshot of the pipeline watermark canvas and the add activity option.":::

1. Select the dataflow activity within the pipeline editor and change its **Name** value to **OnlineSalesActivity** within the General section.

    :::image type="content" source="media/fabric-get-started/dataflow-activity-name.png" alt-text="Screenshot of the dataflow name value.":::

1. With the dataflow activity still selected, select **Settings** and choose **OnlineSalesDataflow** from the Dataflow list. If necessary to update the list, select the **Refresh** icon.

    :::image type="content" source="media/fabric-get-started/dataflow-activity-dataflow.png" alt-text="Screenshot of the dataflow selection setting.":::

1. Select the **Activities** tab and then the **Office365 Outlook** activity.

    > [!NOTE]
    > If a **Grant consent** window appears, select **Ok**, sign in with your organizational account and then select **Allow access**.

    :::image type="content" source="media/fabric-get-started/office-365-activity.png" alt-text="Screenshot of the Office365 Outlook activity information.":::

1. Select the **Office365 Outlook** activity within the pipeline editor and change its **Name** value to **Mail on failure** within the General section.

    :::image type="content" source="media/fabric-get-started/office-365-activity-name.png" alt-text="Screenshot of the Office365 Outlook activity name.":::

1. With the Office365 Outlook activity still selected, select **Settings**. Update the **To** field to your e-mail address and the **Subject** to **Pipeline failure**. Select the **View in expression builder** for the mail Body.

    > [!NOTE]
    > More e-mail configuration options such as From (Send as), Cc, Bcc, Sensitivity label and more are available from *Advanced properties*.

    :::image type="content" source="media/fabric-get-started/office-365-activity-settings.png" alt-text="Screenshot of the Office365 Outlook settings.":::

1. In the **Pipeline expression builder**, paste the following expression code block in the text block at the top of the page:

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

1. Select **System variables** and insert the following variables by selecting the corresponding name from the following table.

    | Value name | Line | System variable |
    | :- | :- | :- |
    | Pipeline: | 3 | Pipeline ID |
    | Workspace: | 6 | Workspace ID |

    :::image type="content" source="media/fabric-get-started/system-variables.png" alt-text="Screenshot of the pipeline system variables.":::

1. Select **Functions** and insert the following function by selecting the corresponding name from the following table. Once complete select **OK**.

    | Value name | Line | System variable |
    | :- | :- | :- |
    | Time: | 9 | utcnow |

    :::image type="content" source="media/fabric-get-started/functions.png" alt-text="Screenshot of pipeline functions.":::

1. Select **OnlineSalesActivity** and from the available path options, select and hold the **"X" (On fail)** to create an arrow that will be dropped on the **Mail on failure** activity. This activity will now be invoked if the **OnlineSalesActivity** fails.

     :::image type="content" source="media/fabric-get-started/on-failure.png" alt-text="Screenshot of the on failure path.":::

1. From the **Home** tab, select **Schedule**. Once you have updated the following configurations, select **Apply** to save your changes.

     | Name | Value |
     | :- | :- |
     | Scheduled run | On |
     | Repeat | Daily |
     | Time | 12:00:00 AM |

1. From the **Home** tab, select **Run**. If a dialog window is displayed select the **Save and run** option to continue.

    To monitor the pipeline’s current status, you can view the **Output** table, which displays the current activity progress. The table will periodically refresh on its own, or you can manually select the refresh icon to update it.

    :::image type="content" source="media/fabric-get-started/output.png" alt-text="Screenshot of the current pipeline activity progress.":::

1. When the status returns **Succeeded**, you can proceed to the next section of the tutorial by returning to your workspace.

     :::image type="content" source="media/fabric-get-started/return-to-workspace.png" alt-text="Screenshot of the side rail with workspace selection.":::

## Create a semantic model in the Lakehouse

The data you loaded is almost ready for reporting. Let’s first use the tables in the lakehouse to create a semantic model, which is a metadata layer that organizes and transforms physical data into logical objects. The semantic model is designed to reflect your business structure and make the data easier to analyze.

1. In the workspace view, select the **SalesLakehouse** item.

    :::image type="content" source="media/fabric-get-started/lakehouse-item-selection.png" alt-text="Screenshot of selecting the lakehouse item in a workspace.":::

1. Once in the Explorer, from the **Home** tab select **New semantic model**.

1. In the New semantic model window, name your model **SalesModel**. Then, expand both the **dbo** schema and the **Tables** group. Select the following tables, and select **Confirm**.

    | Table name |
    | :-- |
    | DimCustomer |
    | DimDate |
    | DimEmployee |
    | DimProduct |
    | DimStore |
    | FactOnlineSales |

    :::image type="content" source="media/fabric-get-started/new-semantic-model-tables.png" alt-text="Screenshot of a new semanitc model from lakehouse tables.":::


### Create relationships

This model is a star schema that you might see from data warehouses: It resembles a star. The center of the star is a Fact table. The surrounding tables are called Dimension tables, which are related to the Fact table with relationships.

---

1. Create a relationship by dragging and dropping the column **CustomerKey** from the **FactOnlineSales** table, to the **CustomerKey** on the **DimCustomer** table.

1. Once in the **Create Relationship** window ensure that you have selected the correct tables, columns and settings as showing in the following table. Select **Confirm** to continue.

    | Make this relationship active | From: Table 1 (column) | To: Table 2 (column) | Cardinality | Cross filter direction | 
    | :----- |:----- | :------ | :----- | :----- | 
    | ☑ | FactOnlineSales (CustomerKey) | DimCustomer (CustomerKey) | Many to one (*:1) | Single |

1. Perform these same steps for each of the remaining tables and columns listed in the following table to create relationships.

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

1. Select the **FactOnlineSales** table and on the **Home** tab, select **New measure**.

1. In the formula editor, copy and paste or type the following measure to calculate the total sales amount. Select the **check mark** to commit.

    ```dax
    Total Sales Amount = SUM(FactOnlineSales[SalesAmount])
    ```

    :::image type="content" source="media/fabric-get-started/total-sales-amount.png" alt-text="Screenshot of Select the check mark to commit a DAX measure.":::

## Autocreate a report

Now that you’ve modeled your data, it's time to visualize and explore your data using quick create.

---

1. Return to your workspace by selecting it from the left side-rail. Then, hover over the **SalesModel** item, select the ellipses **( … )**, and choose **Auto-create report**.

    :::image type="content" source="media/fabric-get-started/auto-create-report.png" alt-text="Screenshot of the Autocreate report option with a workspace." lightbox="media/fabric-get-started/auto-create-report.png":::

    A report is automatically generated for you and dynamically updates based upon column selections in the **Your data** pane. 

    - The displayed report may differ from the image below.

    :::image type="content" source="media/fabric-get-started/auto-create-finished-report.png" alt-text="Screenshot of the finished Auto-create report.":::

1. Select **Save** from the ribbon to save a copy to the current workspace

    > [!NOTE]
    > To enter the complete visual authoring experience, you can select **Edit** on the ribbon.

You can learn more about [quick create](../create-reports/service-quick-create-report.md).

## Related content

Congratulations on completing the tutorial! If you created a dedicated workspace for this tutorial, you can now choose to delete it. Alternatively, feel free to clean up by removing individual items created during the process.

We hope this tutorial has demonstrated how Power BI users can easily uncover insights at any scale using Microsoft Fabric.
