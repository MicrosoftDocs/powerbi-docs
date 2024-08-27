---
title: Data sources for the Power BI service
description: Learn about different data sources and how to get and refresh data sources and semantic models in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: concept-article
ms.date: 08/28/2024
LocalizationGroup: Get started
#customer intent: As a Power BI user, I want to learn about data sources I can connect to so that I can effectively explore, analyze, and visualize my data in Power BI.
---

# Data sources for the Power BI service

Data is the core of Power BI. You can explore data by creating charts and dashboards or by asking questions with **Q&A**. The visualizations and answers get their underlying data from a semantic model, which comes from a data source.

This article focuses on data source types that you can connect to from the Power BI service. There are many other types of data sources. To use these other data sources in the Power BI service, you might first need to use Power BI Desktop or the advanced data query and modeling features in Excel. For more information, see [Databases](#databases) and [Other data sources](#other-data-sources).

## Discover content

You can use the OneLake data hub to discover existing data and reports.  

On your Power BI site, select **OneLake data hub** in the navigation pane:

:::image type="content" source="media/service-get-data/onelake-data-hub-open.png" alt-text="Screenshot that shows the OneLake data hub in the navigation pane.":::

The tiles at the top of the page show recommended data items. For example, data can be recommended because it's promoted by someone in your organization or because it was accessed recently.

:::image type="content" source="media/service-get-data/recommended-data.png" alt-text="Screenshot that shows the Recommended data tiles.":::

Below those tiles is a list of data that you have access to. You can filter to show all data, your own data, or data endorsed by someone in your organization:

:::image type="content" source="media/service-get-data/all-data.png" alt-text="Screenshot that shows the list of existing data.":::

You can select **Apps** on the navigation pane to discover apps published by other people in your organization. At the top right of that tab, select **Get apps** to choose apps from online services that you use:

:::image type="content" source="media/service-get-data/power-bi-apps.png" alt-text="Screenshot that shows the Apps tab in the Power BI service.":::

Many services have *template apps* for Power BI. Most services require an account. For more information, see [Connect to services you use with Power BI](service-connect-to-services.md).

## Create content

To create content, you can import or create files or databases.

### Files

To import files:

1. Go to the workspace to which you want to import the files. Select **New** and then **Semantic model**:

   :::image type="content" source="media/service-get-data/new-menu.png" alt-text="Screenshot that shows the New menu in My Workspace.":::

1. Select **Excel** or **CSV**. You can also paste or manually enter data.

   :::image type="content" source="media/service-get-data/add-data.png" alt-text="Screenshot that shows the choices under Add data to start building a report.":::

When you import Excel or CSV files or manually create a workbook, Power BI imports any supported data in tables and any data model into a new Power BI semantic model.

You can also upload files. Use this method for *.pbix* files. When you upload Excel files from OneDrive or SharePoint, Power BI creates a connection to the file. When you upload a local file, Power BI adds a copy of the file to the workspace.

To upload files, on the **My workspace** tab, select **Upload** to upload local files or files from SharePoint or OneDrive:

:::image type="content" source="media/service-get-data/upload.png" alt-text="Screenshot that shows the options in the Upload menu in My Workspace.":::

Following are some types of files that you can add:

- **Excel** workbooks, or *.xlsx* and *.xlsm* files, can include different data types. For example, workbooks can include data that you enter into worksheets yourself, or data that you query and load from external data sources by using Power Query. Power Query is available via **Get & Transform Data** on the **Data** tab of Excel, or via **Get External Data** in Power Pivot. You can import data from tables in worksheets or import data from a data model. For more information, see [Get data from files for Power BI](service-get-data-from-files.md).

- **Power BI Desktop**, or *.pbix* report files, query and load data from external data sources to create reports. In Power BI Desktop, you can extend your data model by using measures and relationships, and publish the *.pbix* files to the Power BI service. Power BI Desktop is intended for advanced users who have a thorough understanding of their data sources, data querying and transformation, and data modeling. For more information, see [Connect to data in Power BI Desktop](desktop-connect-to-data.md).

- **Comma-separated value**, or *.csv* files, are simple text files with rows of data that contain values separated by commas. For example, a *.csv* file that contains name and address data might have many rows, each with values for first name, last name, street address, city, and state. You can't import data into a *.csv* file, but many applications, like Excel, can save simple table data as *.csv* files.

- For other file types, like XML (*.xml*) or text (*.txt*), you can use Excel **Get & Transform Data** to query, transform, and load the data first. You can then import the Excel file into the Power BI service.

Where you store your files makes a significant difference. OneDrive provides the greatest flexibility and integration with Power BI. You can also keep your files on your local drive, but if you need to refresh the data, there are a few extra steps. For more information, see [Get data from files for Power BI](service-get-data-from-files.md).

### Databases

You can connect Azure databases to Power BI to get analytics and reports that provide real-time insights. For example, you can connect to Azure SQL Database and explore data by creating reports in Power BI. Whenever you slice data or add a field to a visualization, Power BI queries the database directly.

For more information, see:

- [Azure and Power BI](service-azure-and-power-bi.md)
- [Azure SQL Database with DirectQuery](service-azure-sql-database-with-direct-connect.md)
- [Azure Synapse Analytics with DirectQuery](service-azure-sql-data-warehouse-with-direct-connect.md)

You can also use Power BI Desktop or Excel to connect to, query, and load data into data models for various other databases. You can then import the file into Power BI where a semantic model exists. If you configure scheduled refresh, Power BI uses the configuration and connection information from the file to connect directly to the data source. Power BI queries for updates and loads the updates into the semantic model. For more information, see [Connect to data sources in Power BI Desktop](desktop-connect-to-data.md).

### Other data sources

You can use hundreds of different data sources with Power BI. The data must be in a format consumable by the Power BI service. Power BI can then use the data to create reports and dashboards and answer questions with **Q&A**.

Some data sources already have data formatted for the Power BI service. These sources are similar to template apps from service providers like Google Analytics and Twilio. SQL Server Analysis Services tabular model databases are also ready to use.

In other cases, you might need to query and load the data you want into a file. For example, your organization might store logistics data in a data warehouse database on a server. But the Power BI service can connect to that database and explore its data only if it's a tabular model database. You can use Power BI Desktop or Excel to query and load the logistics data into a tabular data model that you then save as a file. You can import that file into Power BI where a semantic model exists.

If the logistics data in the database changes every day, you can refresh the Power BI semantic model. When you import the data into the semantic model, you also import the connection information from Power BI Desktop or the Excel file.

If you configure a scheduled refresh or do a manual refresh on the semantic model, Power BI uses the connection information with other settings to connect directly to the database. Power BI then queries for updates and loads those updates into the semantic model. You probably need an [on-premises data gateway](service-gateway-onprem.md) to help secure any data transfer between an on-premises server and Power BI. When the transfer is complete, visualizations in reports and dashboards refresh automatically.

So even if you can't connect to your data source directly from the Power BI service, you can still get your data into Power BI. It just takes a few more steps and maybe some help from your IT department. For more information, see [Data sources in Power BI Desktop](desktop-data-sources.md).

## Semantic models and data sources

You might see the terms *semantic model* and *data source* used synonymously. But semantic models and data sources are two different things, although they're related.

Power BI creates a semantic model automatically when you connect to and import data from a file, template app, or live data source. A semantic model contains information about the data source and data source credentials. The semantic model also often includes a subset of data copied from the data source. When you create visualizations in reports and dashboards, you often look at data from the semantic model.

The data in a semantic model comes from a data source. For example, data could come from the following data sources:

- An online service like Google Analytics or QuickBooks
- A database in the cloud like Azure SQL Database
- A database or file on a local computer or a server in your organization

## Data refresh

If you save your file on a local drive or on a drive in your organization, you might need an on-premises gateway to be able to refresh the semantic model in Power BI. The computer that stores the file must be running during the refresh. You can also reimport your file, or use **Publish** from Excel or Power BI Desktop, but those processes aren't automated.

If you save your files on OneDrive for work or school or on a SharePoint team site, your semantic model, reports, and dashboard are always up to date. Because both OneDrive and Power BI are in the cloud, Power BI can connect directly to your files or import the files into Power BI. Power BI connects about once every hour and checks for updates. The semantic model and any visualizations refresh automatically if there are any updates.

Template apps from services also automatically update, once a day in most cases. You can manually refresh these apps, but whether you see updated data depends on the service provider. Updates to template apps from people in your organization depend on the data sources they use and how the app creator configured the refresh.

Azure databases like SQL Database, Azure Synapse Analytics, and Spark in Azure HDInsight are cloud data sources. The Power BI service is also in the cloud, so Power BI can connect to those data sources live by using [DirectQuery](desktop-directquery-about.md). With DirectQuery, Power BI is always in sync, and you don't need to set up a scheduled refresh.

SQL Server Analysis Services is a live connection to Power BI just like an Azure cloud database. The difference is that the database is on a server in your organization. This type of connection requires an on-premises gateway, which your IT department can configure.

Data refresh is an important consideration when you use Power BI. For more information, see [Data refresh in Power BI](refresh-data.md).

## Considerations and limitations

Data sources for the Power BI service have the following limitations. Other limitations apply to specific features, but the following list applies to the full Power BI service:

- **Semantic model size limit**. Semantic models stored in shared capacities in the Power BI service have a 1-GB size limit. For larger semantic models, use [Power BI Premium](../enterprise/service-premium-what-is.md).

- **Distinct values in a column**. When a Power BI semantic model caches data in Import mode, it can store a limit of 1,999,999,997 distinct values in a column.

- **Row limit**. When you use DirectQuery, Power BI imposes a limit on the query results that it sends to your underlying data source. If the query sent to the data source returns more than 1 million rows, you see an error and the query fails. The underlying data can still contain more than 1 million rows. You're unlikely to reach this limit, because most reports aggregate the data into smaller sets of results.

- **Column limit**. The maximum number of columns allowed across all tables in a semantic model is 16,000 columns. This limit applies to the Power BI service and to semantic models Power BI Desktop uses. Power BI uses this limit to track the number of both columns and tables in the semantic model, which means the maximum number of columns is 16,000 minus one for each table in the semantic model.

- **Data source user limit**. The maximum number of data sources allowed per user is 1,000. This limit applies only to the Power BI service.

- **Single sign-on (SSO) considerations**. DirectQuery models can enable SSO access to their data sources, which allows the security in the source system to be implicitly applied to the DAX queries executed by each user. SSO can be enabled for each source connection that supports SSO (not all connection types support SSO), and each SSO connection might require configuring a gateway or VNET for certain types of sources. You can read more about enabling SSO for gateways in the [SSO for data gateways](service-gateway-sso-overview.md) article.

    Querying the SSO-enabled DirectQuery model using a Service Principal Name (SPN) isn't supported, since the SPN credential can't be passed through to the DirectQuery source. Instead, use a User Principal Name (UPN) to execute such queries against the SSO-enabled DirectQuery semantic model.

## Related content

- [Connect to the services you use with Power BI](service-connect-to-services.md)
- [Get data from files for Power BI](service-get-data-from-files.md)
- [Data refresh in Power BI](refresh-data.md)
- [DirectQuery in Power BI](desktop-directquery-about.md)
- [What is an on-premises data gateway?](service-gateway-onprem.md)
- [Data sources in Power BI Desktop](desktop-data-sources.md)
