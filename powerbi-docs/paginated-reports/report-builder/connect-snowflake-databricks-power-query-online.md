---
title: "Connect paginated reports to data sources using Power Query"
description: Learn how to connect to Snowflake, Databricks and others with Power Query Online in Power BI Report Builder.
ms.date: 04/07/2025
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: JulCsc
ms.author: juliacawthra
ms.reviewer: nirusrin
---
# Connect paginated reports to data sources using Power Query in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In Power BI Report Builder, you can create paginated reports that are optimized for printing and sharing. You can connect to various data sources, such as SQL Server, Azure SQL Database, Dataverse, and more. But what if you want to connect to data sources that aren't natively supported by Power BI Report Builder, such as Snowflake, Databricks, AWS Redshift, and others? 

That's where Power Query Online comes in. Power Query Online is a data transformation and mashup engine that lets you access and transform data from hundreds of sources. You can use Power Query Online to connect to these data sources from Power BI Report Builder, and create datasets that you can use in your paginated reports.

## Prerequisites 

- To use the new Get Data feature in Power BI Report Builder, you need to have the latest version of Power BI Report Builder installed on your machine. You can [download Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513).  
- You need a paid license, either Power BI Pro or Premium Per User (PPU). To learn more, [check license requirements](../../fundamentals/end-user-license.md#licenses).
- You also need to sign in to Power BI Report Builder with your Power BI account.

## Get started 

Follow these steps to connect to a data source using Power Query Online: 

1. Start the process of getting data in one of these ways.

    Select **Get Data** from the toolbar. 

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-get-data-toolbar.png" alt-text="Screenshot showing select Get data on the toolbar." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-get-data-toolbar.png":::

    OR right-click **Data Sources or Datasets** in the Report Data pane, and select **Add Data Source**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/get-data-data-source.png" alt-text="Screenshot showing select Get data from  Data Sources.":::

    OR right-click **Data Sources or Datasets** in the Report Data pane, and select **Get data**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/get-data-dataset.png" alt-text="Screenshot showing select Get data from Datasets.":::

1. After you select **Get data**, select the data source that you want to connect to from the list, or search for it by name or category. For example, select Snowflake, a cloud data warehouse service. 

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-view-more-data-sources.png" alt-text="Screenshot showing select a data source." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-view-more-data-sources.png":::

1. Enter the required information to connect to the data source, such as the server name, database name, and authentication method.  

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-enter-credentials.png" alt-text="Screenshot showing enter your credentials." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-enter-credentials.png":::

    You can either use an existing shareable cloud connection or create a new connection.

   To connect to an on-premises data source, you will need to first create a gateway connection by following the steps outlined in [Add or remove a gateway data source](../../connect-data/service-gateway-data-sources.md). Once the gateway has been created, you can use the gateway connection details in the Connection Credentials section to connect to the on-premises data source. [Add or remove a gateway data source](../../connect-data/service-gateway-data-sources.md) also includes a list of supported on-premises data sources.

> [!NOTE]
> The recommended threshold for data volume when connecting to an on-premises data source is 500,000 rows with 15 to 20 columns before report processing slows down significantly leading to failures. Refer to [Performance and scalability considerations for paginated reports in Power BI service](../../guidance/report-paginated-performance-scalability-considerations.md) to learn more about paginated reports perfomance and scalability considerations.

  
1. After you select or create a connection, select **Next**. Select the tables that you want to use in your report and select **Transform Data**.  

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-choose-data.png" alt-text="Screenshot showing Select the tables that you want to use in your report and select Transform Data." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-choose-data.png":::

    This action opens the Power Query Editor, where you can transform and load your data. All Power Query editor functionality is available.

    As an example, I merged three tables in the Power Query Editor to create a new merged table named **ALL_Merged**. 

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-all-merged.png" alt-text="Screenshot showing a new merged table." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-all-merged.png":::

1. Select **Create** to add the data source and the dataset to Power BI Report Builder. You see a success message. Select **OK** for the dataset and data source to be created. 

1. You can see the data source (**PowerQuery**) and the dataset in the Report Data pane, under **Data Sources** and **Datasets**, respectively. You can also see the fields and the data types of the dataset in the Fields window. You can use these fields to design your paginated report. 

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-dataset-created.png" alt-text="Screenshot showing the new table.":::

## Edit an RDL dataset created by using Get Data 

You can edit the RDL dataset in the Get Data experience. For this, right-click the dataset and select **Edit Mashup**. This opens the Power Query editor, where you can edit the M query. 

:::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-edit-mashup.png" alt-text="Screenshot showing edit the mashup.":::

> [!NOTE]
> If you had defined a parameter in the Power Query editor, you have to define it again in Power BI Report Builder.


## How to bind parameters

If you want to define a parameter, follow these steps.

1. Define the parameter in Power Query in the Get Data experience. Learn more about [Parameters in Power Query](/power-query/power-query-query-parameters).

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-power-query-new-parameter.png" alt-text="Screenshot showing new parameter in Power Query.":::
   
    > [!NOTE]
    > Keep track of the exact parameter name and type. If you missed noting it down, you can **Edit Mashup** and find the parameter name.

1. In Power BI Report Builder, **Add parameter** by right-clicking the **Parameters** folder.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-report-builder-add-parameter.png" alt-text="Screenshot showing add parameter in Power BI Report Builder.":::

1. Enter the parameter name, prompt name, and data type, as you would when you set up parameters in Report Builder.

    > [!NOTE]
    > The data type must be as close as possible to the data type in Power Query in Step 1. For example, *decimal* in Power Query is closest to *float* in Power BI Report Builder.

1. Right-click the RDL dataset that you want the parameter for, and select **Dataset Properties**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-power-bi-report-builder-dataset-properties.png" alt-text="Screenshot showing dataset properties in Power BI Report Builder.":::

1. In the **Dataset Properties** dialog, select the **Parameters** tab and map the parameters. The **Parameter name** is the name defined in the **Get data** experience. The **Parameter Value** is the name defined in Power BI Report Builder.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-dataset-properties-parameter.png" alt-text="Screenshot showing parameters in dataset properties in Power BI Report Builder.":::
    
You can now build your report and use the parameters to render the report.


## How to change data source credentials after uploading to Power BI service

Now that you have built your paginated report and publish it to the Power BI service, if you need to change the data source credentials then follow these steps:

1. To locate the name of the shareable cloud connection:

    a. Right-click the dataset and select **Edit Mashup**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-edit-mashup.png" alt-text="Screenshot showing edit the mashup.":::

    b. Get the shareable cloud connection information.
   
    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-get-scc-edit.png" alt-text="Screenshot showing shareable cloud connection location.":::

1. After you locate the name, from the page header in the Power BI service, select the **Settings** icon, and then select **Manage connections and gateways**. Locate the connection and using context menu **Settings** option, update the data source credentials. See [Manage Connections and Gateways](../../connect-data/service-create-share-cloud-data-sources.md) to learn more about shareable cloud connections.

## Next steps 

After you have a dataset that you created using Power Query, you can use it to create a paginated report in Power BI Report Builder, as you would with any other RDL dataset. You can use the report design tools, such as the Properties window and the Grouping pane, to design the layout, the data regions, the expressions, and the groups of your report.

When you're done with the report design, you can save the report to your local machine, or publish it to the Power BI service, where you can share it with others, or view it in the Power BI mobile app. 

## Considerations and limitations

- Only one RDL dataset per M query is supported. 
- The last query in the **Queries** window in the Power Query editor is used to generate the RDL dataset.  
- Parameters aren't automatically bound in Power BI Report Builder. You must bind parameters like any other data source. See the [How to bind parameters](#how-to-bind-parameters) section in this article.
- If you set a parameter as a list in Power Query but you select a single value (as a default or while rendering the report), the report fails to render.
- When uploading paginated report that someone else authored, the Shareable Cloud Connection owner needs to share the cloud connection to the uploading identity.
- When uploading such paginated report using Service Principal, the author of report needs to [Take Over using API](/rest/api/power-bi/reports/take-over-in-group) and provide their user identity. Else report will fail to render on Power BI service.
- PQO does not currently support SSO connectivity

## Related content  

- [Power BI Report Builder](../report-builder-power-bi.md)
- [Intro to report data in Power BI Report Builder](../report-data/report-data.md)
- [Dynamic M query parameters in Power BI Desktop](../../connect-data/desktop-dynamic-m-query-parameters.md)
- [Authentication in Power Query Online](/power-query/connection-authentication-pqo)
