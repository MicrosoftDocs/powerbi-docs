---
title: Power BI report data sources in Power BI Report Server
description: Power BI reports can connect to a number of data sources. Depending on how data is used, different data sources are available.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 05/17/2018
ms.author: maggies

---
# Power BI report data sources in Power BI Report Server
Power BI reports can connect to a number of data sources. Depending on how data is used, different data sources are available. Data can be imported or data can be queried directly using DirectQuery or a live connection to SQL Server Analysis Services.

These data sources are specific to Power BI reports used within Power BI Report Server. For information about data sources supported with paginated reports (.rdl), see [Data Sources Supported by Reporting Services](https://docs.microsoft.com/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

> [!IMPORTANT]
> All data sources in a Power BI Desktop report must support configuring scheduled refresh.
>  

## List of supported data sources

Other data sources may work even though they aren't on the supported list.

| **Data source** | **Cached data** | **Scheduled refresh** | **Live/DirectQuery** |
| --- | --- | --- | --- |
| SQL Server Database |Yes |Yes |Yes |
| SQL Server Analysis Services |Yes |Yes |Yes |
| Azure SQL Database |Yes |Yes |Yes |
| Azure SQL Data Warehouse |Yes |Yes |Yes |
| Excel |Yes |Yes |No |
| Access Database |Yes |Yes |No |
| Active Directory |Yes |Yes |No |
| Amazon Redshift |Yes |No |No |
| Azure Blob Storage |Yes |Yes |No |
| Azure Data Lake Store |Yes |No |No |
| Azure HDInsight (HDFS) |Yes |No |No |
| Azure HDInsight (Spark) |Yes |Yes |No |
| Azure Table Storage |Yes |Yes |No |
| Dynamics 365 (online) |Yes |No |No |
| Facebook |Yes |No |No |
| Folder |Yes |Yes |No |
| Google Analytics |Yes |No |No |
| Hadoop File (HDFS) |Yes |No |No |
| IBM DB2 Database |Yes |Yes |No |
| Impala |Yes |No |No |
| JSON |Yes |Yes |No |
| Microsoft Exchange |Yes |No |No |
| Microsoft Exchange Online |Yes |No |No |
| MySQL Database |Yes |Yes |No |
| OData Feed |Yes |Yes |No |
| ODBC |Yes |Yes |No |
| OLE DB |Yes |Yes |No |
| Oracle Database |Yes |Yes |Yes |
| PostgreSQL Database |Yes |Yes |No |
| Power BI service |No |No |No |
| R Script |Yes |No |No |
| Salesforce Objects |Yes |No |No |
| Salesforce Reports |Yes |No |No |
| SAP Business Warehouse server |Yes |Yes |Yes |
| SAP HANA Database |Yes |Yes |Yes |
| SharePoint Folder (on-premises) |Yes |Yes |No |
| SharePoint List (on-premises) |Yes |Yes |No |
| SharePoint Online List |Yes |No |No |
| Snowflake |Yes |No |No |
| Sybase Database |Yes |Yes |No |
| Teradata Database |Yes |Yes |Yes |
| Text/CSV |Yes |Yes |No |
| Web |Yes |Yes |No |
| XML |Yes |Yes |No |
| appFigures (Beta) |Yes |No |No |
| Azure Analysis Services database |Yes |No |Yes |
| Azure Cosmos DB (Beta) |Yes |No |No |
| Azure HDInsight Spark (Beta) |Yes |No |No |
| Common Data Service (Beta) |Yes |No |No |
| comScore Digital Analytix (Beta) |Yes |No |No |
| Dynamics 365 for Customer Insights (Beta) |Yes |No |No |
| Dynamics 365 for Financials (Beta) |Yes |No |No |
| GitHub (Beta) |Yes |No |No |
| Google BigQuery (Beta) |Yes |No |No |
| IBM Informix database (Beta) |Yes |No |No |
| IBM Netezza (Beta) |Yes |No |No |
| Kusto (Beta) |Yes |No |No |
| MailChimp (Beta) |Yes |No |No |
| Microsoft Azure Consumption Insights (Beta) |Yes |No |No |
| Mixpanel (Beta) |Yes |No |No |
| Planview Enterprise (Beta) |Yes |No |No |
| Projectplace (Beta) |Yes |No |No |
| QuickBooks Online (Beta) |Yes |No |No |
| Smartsheet |Yes |No |No |
| Spark (Beta) |Yes |No |No |
| SparkPost (Beta) |Yes |No |No |
| SQL Sentry (Beta) |Yes |No |No |
| Stripe (Beta) |Yes |No |No |
| SweetIQ (Beta) |Yes |No |No |
| Troux (Beta) |Yes |No |No |
| Twilio (Beta) |Yes |No |No |
| tyGraph (Beta) |Yes |No |No |
| Vertica (Beta) |Yes |No |No |
| Visual Studio Team Services (Beta) |Yes |No |No |
| Webtrends (Beta) |Yes |No |No |
| Zendesk (Beta) |Yes |No |No |

> [!IMPORTANT]
> Row-level security configured at the data source should work for certain DirectQuery (SQL Server, Azure SQL Database, Oracle and Teradata) and live connections assuming Kerberos is configured properly in your environment.
> 
> 

## List of supported authentication methods for model refresh

Power BI Report Server does not support OAuth-based authentication for model refresh. Some data sources such as Excel or Access databases make use of a separate step like File or Web to connect to data.

| **Data source** | **Anonymous Authentication** | **Key Authentication** | **Username and Password** | **Windows Authentication** |
| --- | --- | --- | --- | --- |
| SQL Server Database |No |No |Yes |Yes |
| SQL Server Analysis Services |No |No |Yes |Yes |
| Web |Yes |No |Yes |Yes |
| Azure SQL Database |No |No |Yes |No |
| Azure SQL Data Warehouse |No |No |Yes |No |
| Active Directory |No |No |Yes |Yes |
| Amazon Redshift |No |No |No |No |
| Azure Blob Storage |Yes |Yes |No |No |
| Azure Data Lake Store |No |No |No |No |
| Azure HDInsight (HDFS) |No |No |No |No |
| Azure HDInsight (Spark) |Yes |Yes |No |No |
| Azure Table Storage |No |Yes |No |No |
| Dynamics 365 (online) |No |No |No |No |
| Facebook |No |No |No |No |
| Folder |No |No |No |Yes |
| Google Analytics |No |No |No |No |
| Hadoop File (HDFS) |No |No |No |No |
| IBM DB2 Database |No |No |Yes |Yes |
| Impala |No |No |No |No |
| Microsoft Exchange |No |No |No |No |
| Microsoft Exchange Online |No |No |No |No |
| MySQL Database |No |No |Yes |Yes |
| OData Feed |Yes |Yes |Yes |Yes |
| ODBC |Yes |No |Yes |Yes |
| OLE DB |Yes |No |Yes |Yes |
| Oracle Database |No |No |Yes |Yes |
| PostgreSQL Database |No |No |Yes |No |
| Power BI service |No |No |No |No |
| R Script |No |No |No |No |
| Salesforce Objects |No |No |No |No |
| Salesforce Reports |No |No |No |No |
| SAP Business Warehouse server |No |No |Yes |No |
| SAP HANA Database |No |No |Yes |Yes |
| SharePoint Folder (on-premises) |Yes |No |No |Yes |
| SharePoint List (on-premises) |Yes |No |No |Yes |
| SharePoint Online List |No |No |No |No |
| Snowflake |No |No |No |No |
| Sybase Database |No |No |Yes |Yes |
| Teradata Database |No |No |Yes |Yes |
| appFigures (Beta) |No |No |No |No |
| Azure Analysis Services database (Beta) |No |No |No |No |
| Azure Cosmos DB (Beta) |No |No |No |No |
| Azure HDInsight Spark (Beta) |No |No |No |No |
| Common Data Service (Beta) |No |No |No |No |
| comScore Digital Analytix (Beta) |No |No |No |No |
| Dynamics 365 for Customer Insights (Beta) |No |No |No |No |
| Dynamics 365 for Financials (Beta) |No |No |No |No |
| GitHub (Beta) |No |No |No |No |
| Google BigQuery (Beta) |No |No |No |No |
| IBM Informix database (Beta) |No |No |No |No |
| IBM Netezza (Beta) |No |No |No |No |
| Kusto (Beta) |No |No |No |No |
| MailChimp (Beta) |No |No |No |No |
| Microsoft Azure Consumption Insights (Beta) |No |No |No |No |
| Mixpanel (Beta) |No |No |No |No |
| Planview Enterprise (Beta) |No |No |No |No |
| Projectplace (Beta) |No |No |No |No |
| QuickBooks Online (Beta) |No |No |No |No |
| Smartsheet |No |No |No |No |
| Spark (Beta) |No |No |No |No |
| SparkPost (Beta) |No |No |No |No |
| SQL Sentry (Beta) |No |No |No |No |
| Stripe (Beta) |No |No |No |No |
| SweetIQ (Beta) |No |No |No |No |
| Troux (Beta) |No |No |No |No |
| Twilio (Beta) |No |No |No |No |
| tyGraph (Beta) |No |No |No |No |
| Vertica (Beta) |No |No |No |No |
| Visual Studio Team Services (Beta) |No |No |No |No |
| Webtrends (Beta) |No |No |No |No |
| Zendesk (Beta) |No |No |No |No |

## List of supported authentication methods for DirectQuery

Power BI Report Server does not support OAuth-based authentication for DirectQuery.

| **Data source** | **Anonymous Authentication** | **Key Authentication** | **Username and Password** | **Windows Authentication** | **Integrated Windows Authentication** |
| --- | --- | --- | --- | --- | --- |
| SQL Server Database |No |No |Yes |Yes |Yes |
| SQL Server Analysis Services |No |No |Yes |Yes |Yes |
| Azure SQL Database |No |No |Yes |No |No |
| Azure SQL Data Warehouse |No |No |Yes |No |No |
| Oracle Database |No |No |Yes |Yes |Yes |
| SAP Business Warehouse server |No |No |Yes |No |No |
| SAP HANA Database |No |No |Yes |Yes |No |
| Teradata Database |No |No |Yes |Yes |Yes |


## Next steps
Now that you've connected to your data source, [create a Power BI report](quickstart-create-powerbi-report.md) using data from that data source.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

