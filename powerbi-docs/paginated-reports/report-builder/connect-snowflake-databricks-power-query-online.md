---
title: Connect Paginated Reports to Data Sources Using Power Query
description: Learn how to connect to Snowflake, Databricks and others with Power Query Online in Power BI Report Builder.
ms.date: 08/05/2026
ai-usage: ai-assisted
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: JulCsc
ms.author: juliacawthra
ms.reviewer: nirusrin, abhishekgupt
---
# Connect paginated reports to data sources by using Power Query in Power BI Report Builder

**Applies to:** [!INCLUDE [applies-to-report-builder](../../includes/applies-to-version/report-builder.md)]

In Power BI Report Builder, you can create paginated reports that are optimized for printing and sharing. You can connect to various data sources, such as SQL Server, Azure SQL Database, and Dataverse. But what if you want to connect to data sources that Power BI Report Builder doesn't natively support, such as Snowflake, Databricks, and AWS Redshift?

Use Power Query Online. Power Query Online is a data transformation and mashup engine that you can use to access and transform data from hundreds of sources. By using Power Query Online, you can connect to these data sources from Power BI Report Builder and create datasets that you can use in your paginated reports.

## Prerequisites

- The latest version of Power BI Report Builder (15.7.1819.28 or later) installed on your machine. [Download Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513).
- A paid license, either Power BI Pro or Premium Per User (PPU). For more information, see [licensing requirements](../../fundamentals/end-user-license.md#licenses).
- Sign in to Power BI Report Builder with your Power BI account.

## Get started

Follow these steps to connect to a data source by using Power Query Online:

1. Start the process of getting data in one of these ways:

    - Select **Power Query** from the toolbar.

        :::image type="content" source="media/connect-snowflake-databricks-power-query-online/power-query-button-data-ribbon-toolbar.png" alt-text="Screenshot that shows the Power Query button on the toolbar." lightbox="media/connect-snowflake-databricks-power-query-online/power-query-button-data-ribbon-toolbar.png":::

    - Right-click **Data Sources** in the Report Data pane, and select **Add Power Query Data Source**.

        :::image type="content" source="media/connect-snowflake-databricks-power-query-online/add-power-query-data-source-context-menu.png" alt-text="Screenshot that shows Add Power Query Data Source in the Report Data pane." lightbox="media/connect-snowflake-databricks-power-query-online/add-power-query-data-source-context-menu.png":::

    - Right-click **Datasets** in the Report Data pane, and select **Add Power Query Dataset**.

        :::image type="content" source="media/connect-snowflake-databricks-power-query-online/add-power-query-dataset-report-data-pane.png" alt-text="Screenshot that shows Add Power Query Dataset in the Report Data pane." lightbox="media/connect-snowflake-databricks-power-query-online/add-power-query-dataset-report-data-pane.png":::

1. Select the data source that you want to connect to from the list, or search for it by name or category. For example, select Snowflake, a cloud data warehouse service.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/power-query-new-source-data-connector-list.png" alt-text="Screenshot that shows selecting a data source from the list." lightbox="media/connect-snowflake-databricks-power-query-online/power-query-new-source-data-connector-list.png":::

1. Enter the required information to connect to the data source, such as the server name, database name, and authentication method.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/snowflake-connection-credentials-dialog.png" alt-text="Screenshot that shows entering data source connection credentials." lightbox="media/connect-snowflake-databricks-power-query-online/snowflake-connection-credentials-dialog.png":::

    You can either use an existing shareable cloud connection or create a new connection.

    To connect to an on-premises data source, first create a gateway connection by following the steps in [Add or remove a gateway data source](../../connect-data/service-gateway-data-sources.md). After you create the gateway, use the gateway connection details in the **Connection credentials** section to connect to the on-premises data source. [Add or remove a gateway data source](../../connect-data/service-gateway-data-sources.md) also includes a list of supported on-premises data sources.

    > [!NOTE]
    > The recommended threshold for data volume when connecting to an on-premises data source is 1,000,000 rows with 15 to 20 columns. Beyond that threshold, report processing slows down significantly and might fail. For more information, see [Performance and scalability considerations for paginated reports in the Power BI service](../../guidance/report-paginated-performance-scalability-considerations.md).

1. After you select or create a connection, select **Next**. Select the tables that you want to use in your report, and then select **Transform Data**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/snowflake-navigator-select-tables-transform-data.png" alt-text="Screenshot that shows selecting tables in the navigator and choosing Transform Data." lightbox="media/connect-snowflake-databricks-power-query-online/snowflake-navigator-select-tables-transform-data.png":::

    This action opens the Power Query Editor, where you can transform and load your data. All Power Query Editor functionality is available.

    For example, you can merge three tables in the Power Query Editor to create a new merged table named **ALL_Merged**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/power-query-editor-all-merged-table.png" alt-text="Screenshot that shows the merged ALL_Merged table in the Power Query Editor." lightbox="media/connect-snowflake-databricks-power-query-online/power-query-editor-all-merged-table.png":::

1. Select **Create** to add the data source and the dataset to Power BI Report Builder. When the success message appears, select **OK** to create the dataset and data source.

1. Confirm that the data source (**PowerQuery**) and the dataset appear in the Report Data pane, under **Data Sources** and **Datasets**. You can also see the fields and data types of the dataset in the Fields window. Use these fields to design your paginated report.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/report-data-pane-powerquery-datasource-dataset.png" alt-text="Screenshot that shows the new Power Query data source and dataset in the Report Data pane." lightbox="media/connect-snowflake-databricks-power-query-online/report-data-pane-powerquery-datasource-dataset.png":::

## Edit an RDL dataset created by using Get data

You can edit the RDL dataset in the **Get data** experience. Right-click the dataset and select **Edit Mashup**. The Power Query Editor opens, where you can edit the M query.

:::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-edit-mashup.png" alt-text="Screenshot that shows the Edit Mashup option in the Power Query Editor." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-edit-mashup.png":::

> [!NOTE]
> If you define a parameter in the Power Query Editor, you must define it again in Power BI Report Builder.

## Bind parameters

To define a parameter, follow these steps.

1. Define the parameter in Power Query in the **Get data** experience. For more information, see [Parameters in Power Query](/power-query/power-query-query-parameters).

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-power-query-new-parameter.png" alt-text="Screenshot that shows creating a new parameter in Power Query." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-power-query-new-parameter.png":::

    > [!NOTE]
    > Keep track of the exact parameter name and type. If you didn't note it, you can select **Edit Mashup** to find the parameter name.

1. In Power BI Report Builder, right-click the **Parameters** folder and select **Add parameter**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-report-builder-add-parameter.png" alt-text="Screenshot that shows adding a parameter in Power BI Report Builder." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-report-builder-add-parameter.png":::

1. Enter the parameter name, prompt name, and data type, as you would when you set up parameters in Report Builder.

    > [!NOTE]
    > The data type must be as close as possible to the data type in Power Query in the previous step. For example, *decimal* in Power Query is closest to *float* in Power BI Report Builder.

1. Right-click the RDL dataset that you want the parameter for, and select **Dataset Properties**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-power-bi-report-builder-dataset-properties.png" alt-text="Screenshot that shows Dataset Properties in Power BI Report Builder." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-power-bi-report-builder-dataset-properties.png":::

1. In the **Dataset Properties** dialog, select the **Parameters** tab and map the parameters. The **Parameter Name** is the name defined in the **Get data** experience. The **Parameter Value** is the name defined in Power BI Report Builder.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/paginated-dataset-properties-parameter.png" alt-text="Screenshot that shows parameters mapped on the Parameters tab of Dataset Properties." lightbox="media/connect-snowflake-databricks-power-query-online/paginated-dataset-properties-parameter.png":::

You can now build your report and use the parameters to render the report.

## Change data source credentials after uploading to the Power BI service

After you build your paginated report and publish it to the Power BI service, follow these steps to change the data source credentials:

1. To find the connection ID for the shareable cloud connection, right-click the dataset and select **Dataset Properties**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/report-data-pane-dataset-properties-menu.png" alt-text="Screenshot that shows Dataset Properties for the Power Query dataset." lightbox="media/connect-snowflake-databricks-power-query-online/report-data-pane-dataset-properties-menu.png":::

1. Under **Connections** on the **Query** tab, right-click the **connection ID** for the connection whose credentials you want to change and select **Copy**. Then select **Manage**.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/dataset-properties-copy-connection-id-manage.png" alt-text="Screenshot that shows copying the connection ID and selecting Manage." lightbox="media/connect-snowflake-databricks-power-query-online/dataset-properties-copy-connection-id-manage.png":::

1. After you select **Manage**, the Power BI service opens **Manage connections and gateways**. In the search bar in the upper-right corner, enter the connection ID you copied in the previous step to find the connection.

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/search-connection-id-manage-connections-gateways.png" alt-text="Screenshot that shows searching for the connection ID in Manage connections and gateways." lightbox="media/connect-snowflake-databricks-power-query-online/search-connection-id-manage-connections-gateways.png":::

1. Use the **Settings** option in the context menu to update the data source credentials. For more information about shareable cloud connections, see [Manage connections and gateways](../../connect-data/service-create-share-cloud-data-sources.md).

    :::image type="content" source="media/connect-snowflake-databricks-power-query-online/snowflake-connection-settings-credentials.png" alt-text="Screenshot that shows the Settings option to update data source credentials." lightbox="media/connect-snowflake-databricks-power-query-online/snowflake-connection-settings-credentials.png":::

## Next steps

After you have a dataset that you created using Power Query, you can use it to create a paginated report in Power BI Report Builder, as you would with any other RDL dataset. Use the report design tools, such as the Properties window and the Grouping pane, to design the layout, data regions, expressions, and groups of your report.

When you finish the report design, you can save the report to your local machine, or publish it to the Power BI service, where you can share it with others or view it in the Power BI mobile app.

## Considerations and limitations

- You can use only one RDL dataset per M query.
- The last query in the **Queries** window in the Power Query Editor generates the RDL dataset.
- Power BI Report Builder doesn't automatically bind parameters. You must bind parameters like any other data source. See the [Bind parameters](#bind-parameters) section in this article.
- If you set a parameter as a list in Power Query but select a single value (as a default or while rendering the report), the report fails to render.
- When you upload a paginated report that someone else authored, the shareable cloud connection owner needs to share the cloud connection with the uploading identity.
- When you upload such a paginated report by using a service principal, the report author needs to [take over the report by using the API](/rest/api/power-bi/reports/take-over-in-group) and provide their user identity. Otherwise, the report fails to render in the Power BI service.
- Power Query Online doesn't currently support single sign-on (SSO) connectivity.

## Related content

- [Power BI Report Builder](../report-builder-power-bi.md)
- [Intro to report data in Power BI Report Builder](../report-data/report-data.md)
- [Dynamic M query parameters in Power BI Desktop](../../connect-data/desktop-dynamic-m-query-parameters.md)
- [Authentication in Power Query Online](/power-query/connection-authentication-pqo)