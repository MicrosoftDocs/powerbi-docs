---
title: Data sources in Power BI Desktop
description: Data sources in Power BI Desktop
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: complete
qualitydate: 04/29/2016

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 01/24/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Data sources in Power BI Desktop
With Power BI Desktop, you can connect to data from many different sources. A full list of available data sources is at the bottom of this page.

To connect to data, select **Get Data** from the **Home** ribbon. Selecting the down arrow, or the **Get Data** text on the button, shows the **Most Common** data types menu shown in the following image.

![Get Data](media/desktop-data-sources/data-sources_1.png)

Selecting **More…** from the **Most Common** menu displays the **Get Data** window. You can also bring up the **Get Data** window (and bypass the **Most Common** menu) by selecting the **Get Data** **icon button** directly.

![Get Data - All](media/desktop-data-sources/data-sources_2.png)

> [!NOTE]
> The Power BI team is continually expanding the data sources available to **Power BI Desktop** and the **Power BI service**. As such, you'll often see early versions of work-in-progress data sources marked as *Beta* or *Preview*. Any data source marked as *Beta* or *Preview* has limited support and functionality, and should not be used in production environments.
> 
> 

## Data Sources
Data types are organized in the following categories:

* All
* File
* Database
* Azure
* Online Services
* Other

The **All** category includes all data connection types from all categories.

The **File** category provides the following data connections:

* Excel
* Text/CSV
* XML
* JSON
* Folder
* SharePoint folder

The following image shows the **Get Data** window for **File**.

![Get Data - File](media/desktop-data-sources/data-sources_3.png)

> [!NOTE]
> In previous versions of Power BI Desktop, **CSV** and **Text** were separate data connection types. Those data connectors have been combined into **CSV/Text**.
> 
> 

The **Database** category provides the following data connections:

* SQL Server database
* Access database
* SQL Server Analysis Services database
* Oracle database
* IBM DB2 database
* IBM Informix database (Beta)
* IBM Netezza (Beta)
* MySQL database
* PostgreSQL database
* Sybase database
* Teradata database
* SAP HANA database
* SAP Business Warehouse Application Server
* SAP Business Warehouse Message Server (Beta)
* Amazon Redshift
* Impala
* Google BigQuery (Beta)
* Snowflake

> [!NOTE]
> Some database connectors require that you enable them by selecting **File > Options and settings > Options** then selecting **Preview Features** and enabling the connector. If you don't see some of the connectors mentioned above and want to use them, check your **Preview Features** settings. Also note that any data source marked as *Beta* or *Preview* has limited support and functionality, and should not be used in production environments.
> 
> 

The following image shows the **Get Data** window for **Database**.

![Get Data - Database](media/desktop-data-sources/data-sources_4.png)

The **Azure** category provides the following data connections:

* Azure SQL database
* Azure SQL Data Warehouse
* Azure Analysis Services database (Beta)
* Azure Blob Storage
* Azure Table Storage
* Azure Cosmos DB (Beta)
* Azure Data Lake Store
* Azure HDInsight (HDFS)
* Azure HDInsight Spark (Beta)
* HDInsight Interactive Query (Beta)

The following image shows the **Get Data** window for **Azure**.

![Get Data - Azure](media/desktop-data-sources/data-sources_5.png)

The **Online Services** category provides the following data connections:

* Power BI service
* SharePoint Online List
* Microsoft Exchange Online
* Dynamics 365 (online)
* Dynamics NAV (Beta)
* Dynamics 365 for Financials (Beta)
* Common Data Service (Beta)
* Microsoft Azure Consumption Insights (Beta)
* Visual Studio Team Services (Beta)
* Salesforce Objects
* Salesforce Reports
* Google Analytics
* Adobe Analytics
* appFigures (Beta)
* comScore Digital Analytix (Beta)
* Dynamics 365 for Customer Insights (Beta)
* Data.World - Get Dataset (Beta)
* Facebook
* GitHub (Beta)
* MailChimp (Beta)
* Marketo (Beta)
* Mixpanel (Beta)
* Planview Enterprise (Beta)
* Projectplace (Beta)
* QuickBooks Online (Beta)
* Smartsheet
* SparkPost (Beta)
* Stripe (Beta)
* SweetIQ (Beta)
* Troux (Beta)
* Twilio (Beta)
* tyGraph (Beta)
* Webtrends (Beta)
* Zendesk (Beta)

The following image shows the **Get Data** window for **Online Services**.

![Get Data - Online Services](media/desktop-data-sources/data-sources_6b.png)

The **Other** category provides the following data connections:

* Vertica (Beta)
* Kusto (Beta)
* Web
* SharePoint List
* OData Feed
* Active Directory
* Microsoft Exchange
* Hadoop File (HDFS)
* Spark (Beta)
* R script
* ODBC
* OLE DB
* Blank Query

The following image shows the **Get Data** window for **Other**.

![Get Data - Other](media/desktop-data-sources/data-sources_7a.png)

> [!NOTE]
> At this time, it's not possible to connect to custom data sources secured using Azure Active Directory.
> 
> 

## Connecting to a Data Source
To connect to a data source, select the data source from the **Get Data** window and select **Connect**. In the following image, **Web** is selected from the **Other** data connection category.

![Connect to Data](media/desktop-data-sources/data-sources_7b.png)

A connection window is displayed, specific to the type of data connection. If credentials are required, you’ll be prompted to provide them. The following image shows a URL being entered to connect to a Web data source.

![Web Data URL](media/desktop-data-sources/datasources_fromwebbox.png)

When the URL or resource connection information is entered, select **OK**. Power BI Desktop makes the connection to the data source, and presents the available data sources in the **Navigator**.

![Web Data Source](media/desktop-data-sources/datasources_fromnavigatordialog.png)

You can either load the data by selecting the **Load** button at the bottom of the **Navigator** pane, or edit the query before loading data by selecting the **Edit** button.

That’s all there is to connecting to data sources in Power BI Desktop! Try connecting to data from our growing list of data sources, and check back often - we continue to add to this list all the time.

## Next steps
There are all sorts of things you can do with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [Getting started with Power BI Desktop](desktop-getting-started.md)
* [Query overview with Power BI Desktop](desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](desktop-common-query-tasks.md)    
