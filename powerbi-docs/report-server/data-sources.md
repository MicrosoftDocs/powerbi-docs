---
title: Power BI report data sources in Power BI Report Server
description: Power BI reports can connect to a number of data sources. Depending on how data is used, different data sources are available.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 06/04/2023
---

# Power BI report data sources in Power BI Report Server
Power BI reports can connect to a number of data sources. Depending on how data is used, different data sources are available. Data can be imported or data can be queried directly using DirectQuery, or a live connection to SQL Server Analysis Services. Some data sources are available in Power BI Desktop that is optimized for use with Power BI Report Server, but they aren't supported when published to Power BI Report Server.

The data sources below are specific to Power BI reports used within Power BI Report Server. For information about data sources supported with paginated reports (.rdl), see [Data Sources Supported by Reporting Services](/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

> [!IMPORTANT]
> All data sources in a Power BI Desktop report must support configuring scheduled refresh.
>  

## List of supported data sources

| **Data source** | **Cached data** | **Scheduled refresh** | **Live/DirectQuery** |
| --- | --- | --- | --- |
| SQL Server Database |Yes |Yes |Yes |
| SQL Server Analysis Services |Yes |Yes |Yes |
| Azure SQL Database |Yes |Yes |Yes |
| Azure Analysis Services database |Yes |No |Yes |
| Azure Synapse Analytics (formerly SQL Data Warehouse) |Yes |Yes |Yes |
| Access Database |Yes |Yes |No |
| Active Directory |Yes |Yes |No |
| Amazon Athena |Yes |No |No |
| Amazon Redshift |Yes |No |No |
| Azure Blob Storage |Yes |Yes |No |
| Azure Cosmos DB |Yes |No |No |
| Azure Data Explorer (Kusto) |Yes |No |No |
| Azure Data Lake Store |Yes |No |No |
| Azure HDInsight (HDFS) |Yes |No |No |
| Azure HDInsight Spark |Yes |No |No |
| Azure Table Storage |Yes |Yes |No |
| Denodo |Yes |No |No |
| Dynamics 365 (online) |Yes |No |No |
| Excel |Yes |Yes |No |
| Facebook |Yes |No |No |
| Folder |Yes |Yes |No |
| Google Analytics |Yes |No |No |
| Google BigQuery |Yes |No |No |
| Hadoop File (HDFS) |Yes |No |No |
| IBM DB2 Database |Yes |Yes |No |
| IBM Netezza |Yes |No |No |
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
| Power BI dataset in the Power BI service |No |No |No |
| Power BI dataset in Power BI Report Server |No |No |No |
| Projectplace for Power BI |Yes |No |No |
| R Script |Yes |No |No |
| Salesforce Objects |Yes |No |No |
| Salesforce Reports |Yes |No |No |
| SAP Business Warehouse server |Yes |Yes |Yes |
| SAP HANA Database |Yes |Yes |Yes |
| SharePoint File (on-premises) |Yes |Yes |No |
| SharePoint Folder (on-premises) |Yes |Yes |No |
| SharePoint List (on-premises) |Yes |Yes |No |
| SharePoint Online File |Yes |No |No |
| SharePoint Online Folder |Yes |No |No |
| SharePoint Online List |Yes |No |No |
| Smartsheet |Yes |No |No |
| Snowflake |Yes |No |No |
| Spark |Yes |No |No |
| Sybase Database |Yes |Yes |No |
| Teradata |Yes |Yes |Yes |
| Text/CSV |Yes |Yes |No |
| Vertica |Yes |No |No |
| Web |Yes |Yes |No |
| XML |Yes |Yes |No |
| appFigures (Beta) |Yes |No |No |
| Common Data Service (Legacy) |Yes |No |No |
| Dynamics 365 for Customer Insights (Beta) |Yes |No |No |
| Dynamics 365 for Financials (Beta) |Yes |No |No |
| GitHub (Beta) |Yes |No |No |
| IBM Informix database (Beta) |Yes |No |No |
| MailChimp (Beta) |Yes |No |No |
| Microsoft Azure Consumption Insights (Beta) |Yes |No |No |
| Mixpanel (Beta) |Yes |No |No |
| Planview Enterprise One - CTM (Beta) |Yes |No |No |
| Planview Enterprise One - PRM (Beta) |Yes |No |No |
| QuickBooks Online (Beta) |Yes |No |No |
| SparkPost (Beta) |Yes |No |No |
| SQL Sentry (Beta) |Yes |No |No |
| Stripe (Beta) |Yes |No |No |
| SweetIQ (Beta) |Yes |No |No |
| Troux (Beta) |Yes |No |No |
| Twilio (Beta) |Yes |No |No |
| tyGraph (Beta) |Yes |No |No |
| Visual Studio Team Services (Beta) |Yes |No |No |
| Webtrends Analytics (Beta) |Yes |No |No |
| Zendesk (Beta) |Yes |No |No |
| Other data sources available but not listed above |Yes |No |No |

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
| Azure SQL Database |No |No |Yes |No |
| Azure Analysis Services database |No |No |Yes (1) |No |
| Azure Synapse Analytics (formerly SQL Data Warehouse) |No |No |Yes |No |
| Active Directory |No |No |Yes |Yes |
| Amazon Athena |No |No |No |No |
| Amazon Redshift |No |No |No |No |
| Azure Blob Storage |Yes |Yes |No |No |
| Azure Cosmos DB |No |No |No |No |
| Azure Data Explorer (Kusto) |No |No |No |No |
| Azure Data Lake Store |No |No |No |No |
| Azure HDInsight (HDFS) |No |No |No |No |
| Azure HDInsight Spark |No |No |No |No |
| Azure Table Storage |No |Yes |No |No |
| Denodo |No |No |No |No |
| Dynamics 365 (online) |No |No |No |No |
| Facebook |No |No |No |No |
| Folder |No |No |No |Yes |
| Google Analytics |No |No |No |No |
| Google BigQuery |No |No |No |No |
| Hadoop File (HDFS) |No |No |No |No |
| IBM DB2 Database |No |No |Yes |Yes |
| IBM Netezza |No |No |No |No |
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
| Projectplace |No |No |No |No |
| R Script |No |No |No |No |
| Salesforce Objects |No |No |No |No |
| Salesforce Reports |No |No |No |No |
| SAP Business Warehouse server |No |No |Yes |No |
| SAP HANA Database |No |No |Yes |Yes |
| SharePoint File (on-premises) |Yes |No |No |Yes |
| SharePoint Folder (on-premises) |Yes |No |No |Yes |
| SharePoint List (on-premises) |Yes |No |No |Yes |
| SharePoint Online File |No |No |No |No |
| SharePoint Online Folder |No |No |No |No |
| SharePoint Online List |No |No |No |No |
| Smartsheet |No |No |No |No |
| Snowflake |No |No |No |No |
| Spark |No |No |No |No |
| Sybase Database |No |No |Yes |Yes |
| Teradata |No |No |Yes |Yes (2) |
| Vertica |No |No |No |No |
| Web (3) |Yes |No |Yes |Yes |
| appFigures (Beta) |No |No |No |No |
| Common Data Service (Legacy) |No |No |No |No |
| Dynamics 365 for Customer Insights (Beta) |No |No |No |No |
| Dynamics 365 for Financials (Beta) |No |No |No |No |
| GitHub (Beta) |No |No |No |No |
| IBM Informix database (Beta) |No |No |No |No |
| MailChimp (Beta) |No |No |No |No |
| Microsoft Azure Consumption Insights (Beta) |No |No |No |No |
| Mixpanel (Beta) |No |No |No |No |
| Planview Enterprise One - CTM (Beta) |No |No |No |No |
| Planview Enterprise One - PRM (Beta) |No |No |No |No |
| QuickBooks Online (Beta) |No |No |No |No |
| SparkPost (Beta) |No |No |No |No |
| SQL Sentry (Beta) |No |No |No |No |
| Stripe (Beta) |No |No |No |No |
| SweetIQ (Beta) |No |No |No |No |
| Troux (Beta) |No |No |No |No |
| Twilio (Beta) |No |No |No |No |
| tyGraph (Beta) |No |No |No |No |
| Visual Studio Team Services (Beta) |No |No |No |No |
| Webtrends Analytics (Beta) |No |No |No |No |
| Zendesk (Beta) |No |No |No |No |
| Other data sources available but not listed above |No |No |No |No |

(1) For Azure Analysis Services data source, you must have multifactor authentication (MFA) disabled for the credentials being used to connect to the data source. If you need multifactor authentication enabled for your environment, review [Microsoft Entra Conditional Access](/azure/active-directory/conditional-access/overview) as an option to disable multifactor authentication for the credentials used in the data source.

(2) Using LDAP authentication with Teradata (enabled in Power BI Desktop by using the Command Prompt command 'setx PBI_EnableTeradataLdap true') is not supported for model refresh.

(3) Power BI Report Server has a limitation when using web data: only data files from web can be refreshed. Data based on Page or By example aren't refreshable. This limitation is because the M expressions created with Web.BrowserContents and Web.Page can't be refreshed. **Power BI Report Server can only refresh Web.Contents data sources.**

## List of supported authentication methods for DirectQuery

Power BI Report Server does not support OAuth-based authentication for DirectQuery.

> [!NOTE]
> Power BI DirectQuery reports must include "Encrypt=True;TrustServerCertificate=True" as part of the connection string on data sources, or apply the "PBI_SQL_TRUSTED_SERVERS" environment variable on their Power BI Report Server.

| **Data source** | **Anonymous Authentication** | **Key Authentication** | **Username and Password** | **Windows Authentication** | **Integrated Windows Authentication** |
| --- | --- | --- | --- | --- | --- |
| SQL Server Database |No |No |Yes |Yes |Yes |
| SQL Server Analysis Services |No |No |Yes |Yes |Yes |
| Azure SQL Database |No |No |Yes |No |No |
| Azure Analysis Services database |No |No |Yes (1) |No |No |
| Azure Synapse Analytics (formerly SQL Data Warehouse) |No |No |Yes |No |No |
| Oracle Database |No |No |Yes |Yes |Yes |
| SAP Business Warehouse server |No |No |Yes |No |No |
| SAP HANA Database |No |No |Yes |Yes |Yes (2) |
| Teradata |No |No |Yes |Yes |Yes |

(1) For Azure Analysis Services data source, you must have multifactor authentication (MFA) disabled for the credentials being used to connect to the data source. If you need multifactor authentication enabled for your environment, review [Microsoft Entra Conditional Access](/azure/active-directory/conditional-access/overview) as an option to disable multifactor authentication for the credentials used in the data source.

(2) SAP HANA supports DirectQuery with Integrated Windows Authentication only when using it as a relational database in the published Power BI Desktop file (.pbix).

## Related content

* [Data sources for Power BI reports](../connect-data/power-bi-data-sources.md) in the Power BI service

Now that you've connected to your data source, [create a Power BI report](quickstart-create-powerbi-report.md) using data from that data source.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
