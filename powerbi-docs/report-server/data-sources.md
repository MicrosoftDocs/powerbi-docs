---
title: Power BI report data sources in Power BI Report Server
description: Power BI reports can connect to many data sources. Depending on how data is used, different data sources are available.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 07/15/2025
---

# Power BI report data sources in Power BI Report Server

Power BI reports can connect to multiple data sources. Depending on how data is used, different data sources are available. Data can be imported or data can be queried directly using DirectQuery, or a live connection to SQL Server Analysis Services. Some data sources are available in Power BI Desktop that is optimized for use with Power BI Report Server, but they aren't supported when published to Power BI Report Server.

The data sources here are specific to Power BI reports used within Power BI Report Server. For information about data sources supported with paginated reports (.rdl), see [Data Sources Supported by Reporting Services](/sql/reporting-services/report-data/data-sources-supported-by-reporting-services-ssrs).

> [!IMPORTANT]
> All data sources in a Power BI Desktop report must support configuring scheduled refresh.

## List of supported data sources

| Data source | Cached data | Scheduled refresh | Live/DirectQuery |
| --- | --- | --- | --- |
| SQL Server Database | ✅ | ✅ | ✅ |
| SQL Server Analysis Services | ✅ | ✅ | ✅ |
| Azure SQL Database | ✅ | ✅ | ✅ |
| Azure Analysis Services database | ✅ | ❌ | ✅ |
| Azure Synapse Analytics (formerly SQL Data Warehouse) | ✅ | ✅ | ✅ |
| Access Database | ✅ | ✅ | ❌ |
| Active Directory | ✅ | ✅ | ❌ |
| Amazon Athena | ✅ | ❌ | ❌ |
| Amazon Redshift | ✅ | ❌ | ❌ |
| Azure Blob Storage | ✅ | ✅ | ❌ |
| Azure Cosmos DB | ✅ | ❌ | ❌ |
| Azure Data Explorer (Kusto) | ✅ | ❌ | ❌ |
| Azure Data Lake Store | ✅ | ❌ | ❌ |
| Azure HDInsight (HDFS) | ✅ | ❌ | ❌ |
| Azure HDInsight Spark | ✅ | ❌ | ❌ |
| Azure Table Storage | ✅ | ✅ | ❌ |
| Denodo | ✅ | ❌ | ❌ |
| Dynamics 365 (online) | ✅ | ❌ | ❌ |
| Excel | ✅ | ✅ | ❌ |
| Facebook | ✅ | ❌ | ❌ |
| Folder | ✅ | ✅ | ❌ |
| Google Analytics | ✅ | ❌ | ❌ |
| Google BigQuery | ✅ | ❌ | ❌ |
| Hadoop File (HDFS) | ✅ | ❌ | ❌ |
| IBM DB2 Database | ✅ | ✅ | ❌ |
| IBM Netezza | ✅ | ❌ | ❌ |
| Impala | ✅ | ❌ | ❌ |
| JSON | ✅ | ✅ | ❌ |
| Microsoft Exchange | ✅ | ❌ | ❌ |
| Microsoft Exchange Online | ✅ | ❌ | ❌ |
| MySQL Database | ✅ | ✅ | ❌ |
| OData Feed | ✅ | ✅ | ❌ |
| ODBC | ✅ | ✅ | ❌ |
| OLE DB | ✅ | ✅ | ❌ |
| Oracle Database | ✅ | ✅ | ✅ |
| PostgreSQL Database | ✅ | ✅ | ✅ |
| Power BI dataset in the Power BI service | ❌ | ❌ | ❌ |
| Power BI dataset in Power BI Report Server | ❌ | ❌ | ❌ |
| Projectplace for Power BI | ✅ | ❌ | ❌ |
| R Script | ✅ | ❌ | ❌ |
| Salesforce Objects | ✅ | ❌ | ❌ |
| Salesforce Reports | ✅ | ❌ | ❌ |
| SAP Business Warehouse server | ✅ | ✅ | ✅ |
| SAP HANA Database | ✅ | ✅ | ✅ |
| SharePoint File (on-premises) | ✅ | ✅ | ❌ |
| SharePoint Folder (on-premises) | ✅ | ✅ | ❌ |
| SharePoint List (on-premises) | ✅ | ✅ | ❌ |
| SharePoint Online File | ✅ | ❌ | ❌ |
| SharePoint Online Folder | ✅ | ❌ | ❌ |
| SharePoint Online List | ✅ | ❌ | ❌ |
| Smartsheet | ✅ | ❌ | ❌ |
| Snowflake | ✅ | ❌ | ❌ |
| Spark | ✅ | ❌ | ❌ |
| Sybase Database | ✅ | ✅ | ❌ |
| Teradata | ✅ | ✅ | ✅ |
| Text/CSV | ✅ | ✅ | ❌ |
| Vertica | ✅ | ❌ | ❌ |
| Web | ✅ | ✅ | ❌ |
| XML | ✅ | ✅ | ❌ |
| appFigures (Beta) | ✅ | ❌ | ❌ |
| Common Data Service (Legacy) | ✅ | ❌ | ❌ |
| Dynamics 365 for Customer Insights (Beta) | ✅ | ❌ | ❌ |
| Dynamics 365 for Financials (Beta) | ✅ | ❌ | ❌ |
| GitHub (Beta) | ✅ | ❌ | ❌ |
| IBM Informix database (Beta) | ✅ | ❌ | ❌ |
| MailChimp (Beta) | ✅ | ❌ | ❌ |
| Microsoft Azure Consumption Insights (Beta) | ✅ | ❌ | ❌ |
| Mixpanel (Beta) | ✅ | ❌ | ❌ |
| Planview Enterprise One - CTM (Beta) | ✅ | ❌ | ❌ |
| Planview Enterprise One - PRM (Beta) | ✅ | ❌ | ❌ |
| QuickBooks Online (Beta) | ✅ | ❌ | ❌ |
| SparkPost (Beta) | ✅ | ❌ | ❌ |
| SQL Sentry (Beta) | ✅ | ❌ | ❌ |
| Stripe (Beta) | ✅ | ❌ | ❌ |
| SweetIQ (Beta) | ✅ | ❌ | ❌ |
| Troux (Beta) | ✅ | ❌ | ❌ |
| Twilio (Beta) | ✅ | ❌ | ❌ |
| tyGraph (Beta) | ✅ | ❌ | ❌ |
| Visual Studio Team Services (Beta) | ✅ | ❌ | ❌ |
| Webtrends Analytics (Beta) | ✅ | ❌ | ❌ |
| Zendesk (Beta) | ✅ | ❌ | ❌ |
| Other data sources available but not listed here | ✅ | ❌ | ❌ |

> [!IMPORTANT]
> Row-level security configured at the data source should work for certain DirectQuery (SQL Server, Azure SQL Database, Oracle, and Teradata) and live connections assuming Kerberos is configured properly in your environment.

## List of supported authentication methods for model refresh

Power BI Report Server doesn't support OAuth-based authentication for model refresh. Some data sources such as Excel or Access databases make use of a separate step like File or Web to connect to data.

| Data source | Anonymous authentication | Key authentication | Username and password | Windows authentication |
| --- | --- | --- | --- | --- |
| SQL Server Database | ❌ | ❌ | ✅ | ✅ |
| SQL Server Analysis Services | ❌ | ❌ | ✅ | ✅ |
| Azure SQL Database | ❌ | ❌ | ✅ | ❌ |
| Azure Analysis Services database | ❌ | ❌ | ✅ (1) | ❌ |
| Azure Synapse Analytics (formerly SQL Data Warehouse) | ❌ | ❌ | ✅ | ❌ |
| Active Directory | ❌ | ❌ | ✅ | ✅ |
| Amazon Athena | ❌ | ❌ | ❌ | ❌ |
| Amazon Redshift | ❌ | ❌ | ❌ | ❌ |
| Azure Blob Storage | ✅ | ✅ | ❌ | ❌ |
| Azure Cosmos DB | ❌ | ❌ | ❌ | ❌ |
| Azure Data Explorer (Kusto) | ❌ | ❌ | ❌ | ❌ |
| Azure Data Lake Store | ❌ | ❌ | ❌ | ❌ |
| Azure HDInsight (HDFS) | ❌ | ❌ | ❌ | ❌ |
| Azure HDInsight Spark | ❌ | ❌ | ❌ | ❌ |
| Azure Table Storage | ❌ | ✅ | ❌ | ❌ |
| Denodo | ❌ | ❌ | ❌ | ❌ |
| Dynamics 365 (online) | ❌ | ❌ | ❌ | ❌ |
| Facebook | ❌ | ❌ | ❌ | ❌ |
| Folder | ❌ | ❌ | ❌ | ✅ |
| Google Analytics | ❌ | ❌ | ❌ | ❌ |
| Google BigQuery | ❌ | ❌ | ❌ | ❌ |
| Hadoop File (HDFS) | ❌ | ❌ | ❌ | ❌ |
| IBM DB2 Database | ❌ | ❌ | ✅ | ✅ |
| IBM Netezza | ❌ | ❌ | ❌ | ❌ |
| Impala | ❌ | ❌ | ❌ | ❌ |
| Microsoft Exchange | ❌ | ❌ | ❌ | ❌ |
| Microsoft Exchange Online | ❌ | ❌ | ❌ | ❌ |
| MySQL Database | ❌ | ❌ | ✅ | ✅ |
| OData Feed | ✅ | ✅ | ✅ | ✅ |
| ODBC | ✅ | ❌ | ✅ | ✅ |
| OLE DB | ✅ | ❌ | ✅ | ✅ |
| Oracle Database | ❌ | ❌ | ✅ | ✅ |
| PostgreSQL Database | ❌ | ❌ | ✅ | ❌ |
| Power BI service | ❌ | ❌ | ❌ | ❌ |
| Projectplace | ❌ | ❌ | ❌ | ❌ |
| R Script | ❌ | ❌ | ❌ | ❌ |
| Salesforce Objects | ❌ | ❌ | ❌ | ❌ |
| Salesforce Reports | ❌ | ❌ | ❌ | ❌ |
| SAP Business Warehouse server | ❌ | ❌ | ✅ | ❌ |
| SAP HANA Database | ❌ | ❌ | ✅ | ✅ |
| SharePoint File (on-premises) | ✅ | ❌ | ❌ | ✅ |
| SharePoint Folder (on-premises) | ✅ | ❌ | ❌ | ✅ |
| SharePoint List (on-premises) | ✅ | ❌ | ❌ | ✅ |
| SharePoint Online File | ❌ | ❌ | ❌ | ❌ |
| SharePoint Online Folder | ❌ | ❌ | ❌ | ❌ |
| SharePoint Online List | ❌ | ❌ | ❌ | ❌ |
| Smartsheet | ❌ | ❌ | ❌ | ❌ |
| Snowflake | ❌ | ❌ | ❌ | ❌ |
| Spark | ❌ | ❌ | ❌ | ❌ |
| Sybase Database | ❌ | ❌ | ✅ | ✅ |
| Teradata | ❌ | ❌ | ✅ | ✅ (2) |
| Vertica | ❌ | ❌ | ❌ | ❌ |
| Web (3) | ✅ | ❌ | ✅ | ✅ |
| appFigures (Beta) | ❌ | ❌ | ❌ | ❌ |
| Common Data Service (Legacy) | ❌ | ❌ | ❌ | ❌ |
| Dynamics 365 for Customer Insights (Beta) | ❌ | ❌ | ❌ | ❌ |
| Dynamics 365 for Financials (Beta) | ❌ | ❌ | ❌ | ❌ |
| GitHub (Beta) | ❌ | ❌ | ❌ | ❌ |
| IBM Informix database (Beta) | ❌ | ❌ | ❌ | ❌ |
| MailChimp (Beta) | ❌ | ❌ | ❌ | ❌ |
| Microsoft Azure Consumption Insights (Beta) | ❌ | ❌ | ❌ | ❌ |
| Mixpanel (Beta) | ❌ | ❌ | ❌ | ❌ |
| Planview Enterprise One - CTM (Beta) | ❌ | ❌ | ❌ | ❌ |
| Planview Enterprise One - PRM (Beta) | ❌ | ❌ | ❌ | ❌ |
| QuickBooks Online (Beta) | ❌ | ❌ | ❌ | ❌ |
| SparkPost (Beta) | ❌ | ❌ | ❌ | ❌ |
| SQL Sentry (Beta) | ❌ | ❌ | ❌ | ❌ |
| Stripe (Beta) | ❌ | ❌ | ❌ | ❌ |
| SweetIQ (Beta) | ❌ | ❌ | ❌ | ❌ |
| Troux (Beta) | ❌ | ❌ | ❌ | ❌ |
| Twilio (Beta) | ❌ | ❌ | ❌ | ❌ |
| tyGraph (Beta) | ❌ | ❌ | ❌ | ❌ |
| Visual Studio Team Services (Beta) | ❌ | ❌ | ❌ | ❌ |
| Webtrends Analytics (Beta) | ❌ | ❌ | ❌ | ❌ |
| Zendesk (Beta) | ❌ | ❌ | ❌ | ❌ |
| Other data sources available but not listed here | ❌ | ❌ | ❌ | ❌ |

(1) For Azure Analysis Services data source, you must have multifactor authentication (MFA) disabled for the credentials being used to connect to the data source. If you need MFA enabled for your environment, review [Microsoft Entra Conditional Access](/azure/active-directory/conditional-access/overview) as an option to disable MFA for the credentials used in the data source.

(2) Using LDAP authentication with Teradata (enabled in Power BI Desktop by using the Command Prompt command `setx PBI_EnableTeradataLdap true`) isn't supported for model refresh.

(3) Power BI Report Server has a limitation when using web data: only data files from web can be refreshed. Data based on `Page` or `By example` aren't refreshable. This limitation is because the M expressions created with `Web.BrowserContents` and `Web.Page` can't be refreshed. **Power BI Report Server can only refresh Web.Contents data sources.**

## List of supported authentication methods for DirectQuery

Power BI Report Server doesn't support OAuth-based authentication for DirectQuery.

> [!NOTE]
> Power BI DirectQuery reports must include "Encrypt=True;TrustServerCertificate=True" as part of the connection string on data sources, or apply the "PBI_SQL_TRUSTED_SERVERS" environment variable on their Power BI Report Server.

| Data source | Anonymous authentication | Key authentication | Username and password | Windows authentication | Integrated Windows authentication |
| --- | --- | --- | --- | --- | --- |
| SQL Server Database | ❌ | ❌ | ✅ | ✅ | ✅ |
| SQL Server Analysis Services | ❌ | ❌ | ✅ | ✅ | ✅ |
| Azure SQL Database | ❌ | ❌ | ✅ | ❌ | ❌ |
| Azure Analysis Services database | ❌ | ❌ | ✅ (1) | ❌ | ❌ |
| Azure Synapse Analytics (formerly SQL Data Warehouse) | ❌ | ❌ | ✅ | ❌ | ❌ |
| Oracle Database | ❌ | ❌ | ✅ | ✅ | ✅ |
| SAP Business Warehouse server | ❌ | ❌ | ✅ | ❌ | ❌ |
| SAP HANA Database | ❌ | ❌ | ✅ | ✅ | ✅ (2) |
| Teradata | ❌ | ❌ | ✅ | ✅ | ✅ |

(1) For Azure Analysis Services data source, you must have MFA disabled for the credentials being used to connect to the data source. If you need MFA enabled for your environment, review [Microsoft Entra Conditional Access](/azure/active-directory/conditional-access/overview) as an option to disable MFA for the credentials used in the data source.

(2) SAP HANA supports DirectQuery with Integrated Windows Authentication only when using it as a relational database in the published Power BI Desktop file (.pbix).

## Related content

- [Data sources for Power BI reports](../connect-data/power-bi-data-sources.md) in the Power BI service
- Now that you're connected to your data source, [create a Power BI report](quickstart-create-powerbi-report.md) using data from that data source.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
