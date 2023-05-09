---
title: "Tutorial: Microsoft Fabric for Power BI users"
description: Get started using Microsoft Fabric with Power BI by creating a multidimensional model and creating a report.
author: itsnotaboutthecell
ms.author: alpowers
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 05/21/2023
ms.custom: "https://github.com/microsoft/powerbi-desktop-samples/blob/main/AdventureWorks%20Sales%20Sample/AdventureWorks%20Sales.xlsx"
LocalizationGroup: Get started
---
# Tutorial: Fabric for Power BI users

In this tutorial, you'll learn how to use Dataflows Gen2 and Pipelines to ingest data into a Lakehouse and create a dimensional model. You'll also learn how to generate a beautiful report automatically to display the latest sales figures from start to finish in just 45 minutes.

Using a [Contoso](https://www.microsoft.com/en-us/download/details.aspx?id=18279) sample dataset we can build an end-to-end solution in no time.

Let’s get started!

> [!div class="checklist"]
> * Prepare and load data into a lakehouse
> * Build a dimensional model in a lakehouse
> * Automatically create a report with quick create

## Prerequisites

- Before you start, if you aren't signed up yet, [sign up for a free trial](service-self-service-signup-for-power-bi.md).
- Create a [new workspace](../collaborate-share/service-create-the-new-workspaces.md) and assign a Fabric capacity.
     - An existing workspace can also be used, although we recommend using a nonproduction workspace for simplicity of the tutorial.
- Download the Power Query template file that contains sample queries for [Conotoso](NEED TO UPDATE LINK) data.

## Create a lakehouse to store data

We start by creating a lakehouse to store our data, Dataflows Gen2 to prepare and transform columns, and a pipeline to handle the orchestration of a scheduled refresh and e-mail activity.

---

Navigate to your workspace and select **New**. Then select **Show all**.

:::image type="content" source="media/fabric-getting-started/ShowAllItems.png" alt-text="Screen shot of the Show all option in the new item menu.":::

In the **New** item creation screen, select **Lakehouse** under the Data engineering category.

:::image type="content" source="media/fabric-getting-started/NewLakehouse.png" alt-text="Screen shot of Data engineering items.":::

Set the Lakehouse name to **SalesLakehouse**. Then select **Create**.

:::image type="content" source="media/fabric-getting-started/NameLakehouse.png" alt-text="Screen shot of naming a name Lakehouse.":::

Once you're in the Lakehouse editor, select **New Dataflow Gen2**.

> [!NOTE]
> You can also select *Get data* from the ribbon and then **New Dataflow Gen2**.

:::image type="content" source="media/fabric-getting-started/NewDataflowGen2.png" alt-text="Screen shot of Get data drop down in the Lakehouse editor.":::

Learn more about the [lakehouse](NEED LINK).

## Prepare and load data into your lakehouse

Once you're in the **Power Query Online** editor for Dataflows Gen2, select **Import from a Power Query template** and choose the template file downloaded from the [prerequisites](#prerequisites).

:::image type="content" source="media/fabric-getting-started/ImportPowerQueryTemplate.png" alt-text="Screen shot of watermarks in the Dataflows Gen2 editor.":::

Select the **DimDate** query under the **Data load** query group and then select on **Configure connection**. If necessary, set the authentication type to **Anonymous** before selecting **Connect**.

:::image type="content" source="media/fabric-getting-started/ConfigureConnection.png" alt-text="Screen shot of the configure connection menu.":::

With the **DimDate** query selected, in the data preview window, change the data type of the **DateKey** column to **Date/Time** by selecting the icon in the top left.

> [!NOTE]
> The lakehouse only supports *datetime* data types. If you attempt to load *date* only data, an error message is presented.

:::image type="content" source="media/fabric-getting-started/TransformColumnDateTime.png" alt-text="Screen shot of changing data types within the Power Query editor.":::

Select **Replace current** within the **Change column type** window.

:::image type="content" source="media/fabric-getting-started/ChangeColumnType.png" alt-text="Screen shot of the change column type menu.":::

### Add a data destination

With the **DimDate** table selected, from the **Home** tab, select **Add data destination** and then select the **Lakehouse** option menu item.

:::image type="content" source="media/fabric-getting-started/LakehouseDataDestination.png" alt-text="Screen shot of the get data destination Lakehouse option.":::

If necessary, set the authentication to **Organizational account** and then select **Next**.

:::image type="content" source="media/fabric-getting-started/ConnectToLakehouse.png" alt-text="Screen shot of the Connect to data destination menu.":::

From the navigator, select the workspace used for this tutorial and expand to view all **Lakehouse** items. Select **SalesLakehouse** and confirm that the default **New table** is selected before selecting **Next** to continue.

:::image type="content" source="media/fabric-getting-started/NewTable.png" alt-text="Screen shot of the destination target navigator item.":::

Set the **Update method** to **Replace** and then select **Save settings**.

> [!CAUTION]
> Setting the update method to *Replace* deletes all existing data and replace it with the new data on each subsequent refresh.

:::image type="content" source="media/fabric-getting-started/ReplaceMethod.png" alt-text="Screen shot of the destination settings menu option.":::

In the bottom right corner of the **Power Query Online** editor, you can find the configured **Data destination** settings for your query where you can further customize or remove.

:::image type="content" source="media/fabric-getting-started/DataDestinationDimDate.png" alt-text="Screen shot of the configured data destination.":::

Before moving on to the next section of this tutorial, make sure to perform the [same steps](#add-a-data-destination) as above to configure the Lakehouse as your data destination for each of the following queries.

| Query |
| :-- |
| DimCustomer |
| DimEmployee |
| DimProduct |
| DimStore |

---

Select the **FactOnlineSales** query under the **Data transformation** query group and from the **Home** tab, select **Add data destination** and then select the **Lakehouse** option.

:::image type="content" source="media/fabric-getting-started/DataDestinationFactOnlineSales.png" alt-text="Screen shot of the Data destination Lakehouse target option.":::

If necessary, set the authentication to **Organizational account** and then select **Next**.

:::image type="content" source="media/fabric-getting-started/ConnectToLakehouse.png" alt-text="Screen shot of the Connect to data destination menu.":::

From the navigator, select the workspace used for this tutorial and expand to view all **Lakehouse** items. Select **SalesLakehouse** and confirm that the default **New table** is selected before selecting **Next** to continue.

:::image type="content" source="media/fabric-getting-started/NewTableFactOnlineSales.png" alt-text="Screen shot of the destination target navigator window.":::

Set the **Update method** to **Append** and then select **Save settings**.

> [!NOTE]
> This process inserts data, preserving the existing rows within the table on each subsequent refresh.

:::image type="content" source="media/fabric-getting-started/AppendMethod.png" alt-text="Screen shot of the destination settings menu selection.":::

Select **Publish** to save your dataflow and exit the **Power Query Online** editor.

:::image type="content" source="media/fabric-getting-started/Publish.png" alt-text="Screen shot of the publish button within Power Query Online.":::

Hover above the created dataflow in your workspace, select the ellipses **(...)** and the **Properties** option.

:::image type="content" source="media/fabric-getting-started/DataflowProperties.png" alt-text="Screen shot of the dataflows properties in a workspace.":::

Change the name of the dataflow to **OnlineSalesDataflow** and select **Save**.

:::image type="content" source="media/fabric-getting-started/DataflowName.png" alt-text="Screen shot of renaming a dataflow option.":::

### Orchestrate a data pipeline

Using pipelines, we first orchestrate the refresh of our data flow. If an error occurs, we send a customized Outlook email that includes important details.

---

Select the **Lakehouse** item named **SalesLakehouse** within your workspace.

:::image type="content" source="media/fabric-getting-started/SalesLakehouseItem.png" alt-text="Screen shot of renaming an existing dataflow.":::

Once you're in the Lakehouse editor, select **New data pipeline**.

> [!NOTE]
> You can also select *Get data* from the ribbon and then **New data pipeline**.

:::image type="content" source="media/fabric-getting-started/NewDataPipeline.png" alt-text="Screen shot of watermarks in the Lakehouse editor.":::

Set the pipeline name to **SalesPipeline**. Then select **Create**.

:::image type="content" source="media/fabric-getting-started/NewPipelineName.png" alt-text="Screen shot of the pipeline name menu option.":::

Close the Copy data assistant by selecting **Cancel**. If you’re prompted to confirm exiting the copy data window, select **Yes, cancel**.

:::image type="content" source="media/fabric-getting-started/CloseCopyDataAssistant.png" alt-text="Screen shot of the copy data assistant menu.":::

Once you’re in the pipeline editor, select **Add pipeline activity** and then select **Dataflow**.

> [!NOTE]
> You can also select *Dataflow* from the ribbon.

:::image type="content" source="media/fabric-getting-started/AddDataflowActivity.png" alt-text="Screen shot of the pipeline watermark canvas and the add activity option.":::

Select the dataflow activity within the pipeline editor and change its **Name** value to **OnlineSalesActivity** within the General section.

:::image type="content" source="media/fabric-getting-started/DataflowActivityName.png" alt-text="Screen shot of the dataflow name value.":::

With the dataflow activity still selected, select **Settings** and choose **OnlineSalesDataflow** from the Dataflow list. If necessary to update the list, select the **Refresh** icon.

:::image type="content" source="media/fabric-getting-started/DataflowActivityDataflow.png" alt-text="Screen shot of the dataflow selection setting.":::

Select the **Activities** tab and then the **Office365 Outlook** activity. 
**Note:** If a **Grant consent** window appears, select **Ok**, sign in with your organizational account and then select **Allow access**.

:::image type="content" source="media/fabric-getting-started/Office365Activity.png" alt-text="Screen shot of the Office365 Outlook activity information.":::

Select the **Office365 Outlook** activity within the pipeline editor and change its **Name** value to **Mail on failure** within the General section.

:::image type="content" source="media/fabric-getting-started/Office365ActivityName.png" alt-text="Screen shot of the Office365 Outlook activity name.":::

With the Office365 Outlook activity still selected, select **Settings**. Update the **To** field to your e-mail address and the **Subject** to **Pipeline failure**. Select the **Add dynamic content [Alt+Shift+D]** for the mail Body.

> [!NOTE]
> More e-mail configuration options such as From (Send as), Cc, Bcc, Sensitivity label and more are available from *Advanced properties*.

:::image type="content" source="media/fabric-getting-started/Office365ActivitySettings.png" alt-text="Screen shot of the Office365 Outlook settings.":::

In the **Pipeline expression builder**, paste the expression code block below.

```cpp
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

:::image type="content" source="media/fabric-getting-started/ExpressionBuilder.png" alt-text="Screen shot of the Office365 Outlook activity with expression builder.":::

Select **System variables** and insert the following variables by clicking on the corresponding name from the table below.

| Value name | Line | System variable |
| :- | :- | :- |
| Pipeline: | 3 | Pipeline name |
| Workspace: | 6 | Workspace name |

:::image type="content" source="media/fabric-getting-started/SystemVariables.png" alt-text="Screen shot of the pipeline system variables.":::

Select **Functions** and insert the following function by clicking on the corresponding name from the table below. Once complete select **OK**.

| Value name | Line | System variable |
| :- | :- | :- |
| Time: | 9 | utcnow |

:::image type="content" source="media/fabric-getting-started/Functions.png" alt-text="Screen shot of pipeline functions.":::

Select **OnlineSalesActivity** and from the available path options, select and hold the **"X" (On fail)** to create an arrow that will be dropped on the **Mail on failure** activity. This activity will now be invoked if the **OnlineSalesActivity** fails.

:::image type="content" source="media/fabric-getting-started/OnFailure.png" alt-text="Screen shot of the on failure path.":::

From the **Home** tab, select **Schedule**. Once you have updated the following configurations, select **Apply** to save your changes.

| Name | Value |
| :- | :- |
| Scheduled run | On |
| Repeat | Daily |
| Time | 12:00:00 AM |

:::image type="content" source="media/fabric-getting-started/Schedule.png" alt-text="Screen shot of on failure branch.":::

From the **Home** tab, select **Run**. If a dialog window is displayed select the **Save and run** option to continue.

:::image type="content" source="media/fabric-getting-started/Run.png" alt-text="Screen shot of the run option from the home tab.":::

To monitor the pipeline’s current status, you can view the **Output** table, which displays the current activity progress. The table will periodically refresh on its own, or you can manually select the refresh icon to update it.

:::image type="content" source="media/fabric-getting-started/Output.png" alt-text="Screen shot of the current pipeline activity progress.":::

When the status returns **Succeeded**, you can proceed to the next section of the tutorial by returning to your workspace.

:::image type="content" source="media/fabric-getting-started/ReturnToWorkspace.png" alt-text="Screen shot of the side rail with workspace selection.":::

Learn more about [pipelines](NEED LINK)

## Create a semantic model in the Lakehouse

The data you loaded is almost ready for reporting. Let’s first use the SQL endpoint to create relationships and SQL views in our lakehouse. This allows us to easily access our data within a semantic model, which is a metadata model that contains physical database objects that are abstracted and modified into logical dimensions. It's designed to present data for analysis according to the structure of the business.

### Create relationships

This model is a star schema that you might see from data warehouses: It resembles a star. The center of the star is a Fact table. The surrounding tables are called Dimension tables, which are related to the Fact table with relationships.

---

In the workspace view, select the **SQL Endpoint** item named **SalesLakehouse**.

:::image type="content" source="media/fabric-getting-started/SQLEndpoint.png" alt-text="Screen shot of the SQL endpoint item in a workspace.":::

Once in the Explorer, select the **Model** view at the bottom of the screen to begin creating relationships.

:::image type="content" source="media/fabric-getting-started/ModelView.png" alt-text="Screen shot of the Model view selection.":::

Create a relationship by dragging and dropping the column **CustomerKey** from the **FactOnlineSales** table, to the **CustomerKey** on the **DimCustomer** table. 

Once in the **Create Relationship** window ensure that you have selected the correct tables, columns and settings below. Select **Confirm** to continue.

| Make this relationship active | From: Table 1 (column) | To: Table 2 (column) | Cardinality | Cross filter direction | 
| :----- |:----- | :------ | :----- | :----- | 
| ☑ | FactOnlineSales (CustomerKey) | DimCustomer (CustomerKey) | Many to one (*:1) | Single |

:::image type="content" source="media/fabric-getting-started/CreateRelationship.png" alt-text="Screen shot of Relationship between the FactOnlineSales and DimCustomer table.":::

Perform these same steps for each of the remaining tables and columns listed below to create relationships.

| Make this relationship active | From: Table 1 (column) | To: Table 2 (column) | Cardinality | Cross filter direction | 
| :----- |:----- | :------ | :----- | :----- |
| ☑ | FactOnlineSales (ProductKey) | DimProduct (ProductKey) | Many to one (*:1) | Single |
| ☑ | FactOnlineSales (StoreKey) | DimStore (StoreKey) | Many to one (*:1) | Single |
| ☑ | FactOnlineSales (DateKey) | DimDate (DateKey) | Many to one (*:1) | Single |
| ☑ | DimEmployee (StoreKey) | DimStore (StoreKey) | Many to one (*:1) | Both |

Below is a finished view of the semantic model with all the created relationships included.

:::image type="content" source="media/fabric-getting-started/StarSchema.png" alt-text="Screen shot of table relationships in the model view pane.":::

### Write a measure in DAX

Let's write a basic measure that calculates the total sales amount by due date on the sales order instead of the default order date.

Select the **FactOnlineSales** table in the **Tables** folder. On the **Home** tab, select **New measure**.

:::image type="content" source="media/fabric-getting-started/NewMeasure.png" alt-text="Screen shot of table relationships in the model view.":::

In the formula editor, copy and paste or type the measure below to calculate the total sales amount. Select the **check mark** to commit.

```dax
Total Sales Amount = SUM(FactOnlineSales[SalesAmount])
```

:::image type="content" source="media/fabric-getting-started/TotalSalesAmount.png" alt-text="Screen shot of Select the check mark to commit a DAX measure.":::

### Create a SQL view

Let’s write a SQL statement that calculates the total sales amount by month. We’ll then save this statement as a view in our lakehouse. This will allow us to easily access the total sales amount by month in the future.

On the **Home** tab, select **New SQL query**.

:::image type="content" source="media/fabric-getting-started/NewSQL.png" alt-text="Screen shot of New SQL query from the home tab.":::

In the query editor, copy and paste or type the query below to calculate the total sales amount by month number in descending order. Once entered, select **Run** to view results.

```sql
SELECT 
MONTH(DateKey) as "MonthNumber",
SUM(SalesAmount) as "TotalSalesAmount"
FROM FactOnlineSales
GROUP BY MONTH(DateKey)
```

:::image type="content" source="media/fabric-getting-started/RunSQL.png" alt-text="Screen shot of SQL query editor.":::

Highlight the full query text and select **Save as view**.

:::image type="content" source="media/fabric-getting-started/SaveView.png" alt-text="Screen shot of Save as view option.":::

In the Save as view window, set the **View name** to **TotalSalesByMonth** and then select **OK**.

:::image type="content" source="media/fabric-getting-started/SaveAsView.png" alt-text="Screen shot of Save as view window.":::

In the Explorer, expand the **Views** section and select **TotalSalesByMonth** to view the results in the **Data preview**.

:::image type="content" source="media/fabric-getting-started/TotalSalesByMonthView.png" alt-text="Screen shot of Views with the Lakehouse explorer.":::

Once you're done exploring the SQL endpoint editor, you can proceed to the next section of the tutorial by returning to your workspace.

:::image type="content" source="media/fabric-getting-started/ReturnToWorkspaceAfterView.png" alt-text="Screen shot of the side rail and selection of the workspace.":::

## Autocreate a report

Now that you’ve modeled your data, it's time to visualize and explore your data using quick create.

---

In the workspace view, hover above the item type **Dataset (default)** and item name **SalesLakehouse**. Select the ellipses **( … )** and choose **Auto-create report**.

:::image type="content" source="media/fabric-getting-started/AutoCreateReport.png" alt-text="Screen shot of the Autocreate report option with a workspace.":::

A report is automatically generated for you and dynamically updates based upon column selections in the **Your data** pane. 

- The displayed report may differ from the image below.

:::image type="content" source="media/fabric-getting-started/AutoCreateFinishedReport.png" alt-text="Screen shot of the finished Auto-create report.":::

Select **Save** from the ribbon to save a copy to the current workspace

- To enter the complete visual authoring experience, you can select **Edit** on the ribbon.

:::image type="content" source="media/fabric-getting-started/SaveReport.png" alt-text="Screen shot of the Save button when visualizing data.":::

In the Save your report dialog box, type **Sales Summary** in the **Enter a name for your report** field. Select **Save** once complete.

:::image type="content" source="media/fabric-getting-started/SaveYourReport.png" alt-text="Screen shot of the Save button completing its process when visualizing data.":::

You can learn more about [quick create](../create-reports/service-quick-create-report.md).

## Next steps

Congratulations on completing the tutorial! If you created a workspace for the tutorial, you can choose to delete it now. Alternatively, you can remove the individual items that were created during the tutorial.

We hope this tutorial has shown how Power BI users can easily provide insights into data at any level of scale with Microsoft Fabric.