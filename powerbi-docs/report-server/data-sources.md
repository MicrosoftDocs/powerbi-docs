---
title: Power BI report data sources in Power BI Report Server
description: Power BI reports can connect to different data sources. Depending on how data is used, different data sources are available.
services: powerbi
documentationcenter: ''
author: markingmyname
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 11/01/2017
ms.author: maghan

---
# Power BI report data sources in Power BI Report Server
Power BI reports can connect to different data sources. Depending on how data is used, different data sources are available. Data can be imported or data can be queried directly using DirectQuery or a live connection to SQL Server Analysis Services.

These data sources are specific to Power BI reports used within Power BI Report Server. For information about data sources supported with paginated reports, see [Data Sources Supported by Reporting Services](https://docs.microsoft.com/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

> [!IMPORTANT]
> All data sources in a Power BI Desktop report must be supported to configure scheduled refresh.
> 
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
| Azure HDInsight (HDFS) |Yes |Yes |No |
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
| Azure Analysis Services database (Beta) |Yes |No |No |
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

## Next steps
Now that your data source is picked out, [create a report](quickstart-create-powerbi-report.md) using data from that data source.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

