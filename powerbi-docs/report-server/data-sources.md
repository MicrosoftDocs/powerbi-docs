---
title: Power BI report data sources in Power BI Report Server
description: Power BI reports can connect to a number of data sources. Depending on how data is used, different data sources are available.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 06/04/2024
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
| SQL Server Database |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| SQL Server Analysis Services |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| Azure SQL Database |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark:  |
| Azure Analysis Services database |Yes :white_check_mark: |No  :no_entry: |Yes :white_check_mark: |
| Azure Synapse Analytics (formerly SQL Data Warehouse) |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| Access Database |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Active Directory |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Amazon Athena |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Amazon Redshift |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure Blob Storage |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Azure Cosmos DB |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure Data Explorer (Kusto) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure Data Lake Store |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure HDInsight (HDFS) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure HDInsight Spark |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure Table Storage |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Denodo |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Dynamics 365 (online) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Excel |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Facebook |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Folder |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Google Analytics |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Google BigQuery |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Hadoop File (HDFS) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| IBM DB2 Database |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| IBM Netezza |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Impala |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| JSON |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Microsoft Exchange |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Microsoft Exchange Online |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| MySQL Database |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| OData Feed |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| ODBC |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| OLE DB |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Oracle Database |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| PostgreSQL Database |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| Power BI dataset in the Power BI service |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Power BI dataset in Power BI Report Server |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Projectplace for Power BI |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| R Script |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Salesforce Objects |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Salesforce Reports |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SAP Business Warehouse server |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| SAP HANA Database |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| SharePoint File (on-premises) |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| SharePoint Folder (on-premises) |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| SharePoint List (on-premises) |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| SharePoint Online File |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SharePoint Online Folder |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SharePoint Online List |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Smartsheet |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Snowflake |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Spark |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Sybase Database |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Teradata |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| Text/CSV |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| Vertica |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Web |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| XML |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |
| appFigures (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Common Data Service (Legacy) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Dynamics 365 for Customer Insights (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Dynamics 365 for Financials (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| GitHub (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| IBM Informix database (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| MailChimp (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Microsoft Azure Consumption Insights (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Mixpanel (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Planview Enterprise One - CTM (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Planview Enterprise One - PRM (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| QuickBooks Online (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SparkPost (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SQL Sentry (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Stripe (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SweetIQ (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Troux (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Twilio (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| tyGraph (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Visual Studio Team Services (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Webtrends Analytics (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Zendesk (Beta) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Other data sources available but not listed above |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |

> [!IMPORTANT]
> Row-level security configured at the data source should work for certain DirectQuery (SQL Server, Azure SQL Database, Oracle and Teradata) and live connections assuming Kerberos is configured properly in your environment.
> 
> 

## List of supported authentication methods for model refresh

Power BI Report Server does not support OAuth-based authentication for model refresh. Some data sources such as Excel or Access databases make use of a separate step like File or Web to connect to data.

| **Data source** | **Anonymous Authentication** | **Key Authentication** | **Username and Password** | **Windows Authentication** |
| --- | --- | --- | --- | --- |
| SQL Server Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| SQL Server Analysis Services |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| Azure SQL Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |
| Azure Analysis Services database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: (1) |No  :no_entry: |
| Azure Synapse Analytics (formerly SQL Data Warehouse) |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |
| Active Directory |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| Amazon Athena |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Amazon Redshift |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Azure Blob Storage |Yes :white_check_mark: |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure Cosmos DB |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Azure Data Explorer (Kusto) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Azure Data Lake Store |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Azure HDInsight (HDFS) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Azure HDInsight Spark |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Azure Table Storage |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Denodo |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Dynamics 365 (online) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Facebook |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Folder |No  :no_entry: |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |
| Google Analytics |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Google BigQuery |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Hadoop File (HDFS) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| IBM DB2 Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| IBM Netezza |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Impala |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Microsoft Exchange |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Microsoft Exchange Online |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| MySQL Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| OData Feed |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| ODBC |Yes :white_check_mark: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| OLE DB |Yes :white_check_mark: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| Oracle Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| PostgreSQL Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |
| Power BI service |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Projectplace |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| R Script |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Salesforce Objects |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Salesforce Reports |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| SAP Business Warehouse server |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |
| SAP HANA Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| SharePoint File (on-premises) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |
| SharePoint Folder (on-premises) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |
| SharePoint List (on-premises) |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |
| SharePoint Online File |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| SharePoint Online Folder |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| SharePoint Online List |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Smartsheet |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Snowflake |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Spark |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Sybase Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| Teradata |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: (2) |
| Vertica |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Web (3) |Yes :white_check_mark: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |
| appFigures (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Common Data Service (Legacy) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Dynamics 365 for Customer Insights (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Dynamics 365 for Financials (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| GitHub (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| IBM Informix database (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| MailChimp (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Microsoft Azure Consumption Insights (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Mixpanel (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Planview Enterprise One - CTM (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Planview Enterprise One - PRM (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| QuickBooks Online (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| SparkPost (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| SQL Sentry (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Stripe (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| SweetIQ (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Troux (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Twilio (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| tyGraph (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Visual Studio Team Services (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Webtrends Analytics (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Zendesk (Beta) |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |
| Other data sources available but not listed above |No  :no_entry: |No  :no_entry: |No  :no_entry: |No  :no_entry: |

(1) For Azure Analysis Services data source, you must have multifactor authentication (MFA) disabled for the credentials being used to connect to the data source. If you need multifactor authentication enabled for your environment, review [Microsoft Entra Conditional Access](/azure/active-directory/conditional-access/overview) as an option to disable multifactor authentication for the credentials used in the data source.

(2) Using LDAP authentication with Teradata (enabled in Power BI Desktop by using the Command Prompt command 'setx PBI_EnableTeradataLdap true') is not supported for model refresh.

(3) Power BI Report Server has a limitation when using web data: only data files from web can be refreshed. Data based on Page or By example aren't refreshable. This limitation is because the M expressions created with Web.BrowserContents and Web.Page can't be refreshed. **Power BI Report Server can only refresh Web.Contents data sources.**

## List of supported authentication methods for DirectQuery

Power BI Report Server does not support OAuth-based authentication for DirectQuery.

> [!NOTE]
> Power BI DirectQuery reports must include "Encrypt=True;TrustServerCertificate=True" as part of the connection string on data sources, or apply the "PBI_SQL_TRUSTED_SERVERS" environment variable on their Power BI Report Server.

| **Data source** | **Anonymous Authentication** | **Key Authentication** | **Username and Password** | **Windows Authentication** | **Integrated Windows Authentication** |
| --- | --- | --- | --- | --- | --- |
| SQL Server Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| SQL Server Analysis Services |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| Azure SQL Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Azure Analysis Services database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: (1) |No  :no_entry: |No  :no_entry: |
| Azure Synapse Analytics (formerly SQL Data Warehouse) |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| Oracle Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |
| SAP Business Warehouse server |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |No  :no_entry: |No  :no_entry: |
| SAP HANA Database |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: (2) |
| Teradata |No  :no_entry: |No  :no_entry: |Yes :white_check_mark: |Yes :white_check_mark: |Yes :white_check_mark: |

(1) For Azure Analysis Services data source, you must have multifactor authentication (MFA) disabled for the credentials being used to connect to the data source. If you need multifactor authentication enabled for your environment, review [Microsoft Entra Conditional Access](/azure/active-directory/conditional-access/overview) as an option to disable multifactor authentication for the credentials used in the data source.

(2) SAP HANA supports DirectQuery with Integrated Windows Authentication only when using it as a relational database in the published Power BI Desktop file (.pbix).

## Related content

* [Data sources for Power BI reports](../connect-data/power-bi-data-sources.md) in the Power BI service

Now that you've connected to your data source, [create a Power BI report](quickstart-create-powerbi-report.md) using data from that data source.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
