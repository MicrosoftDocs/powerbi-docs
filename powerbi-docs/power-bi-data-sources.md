---
title: Power BI data sources
description: This article lists the data sources that Power BI supports, including information about DirectQuery and the on-premises data gateway.
author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 11/22/2019
ms.author: kfollis
---

# Power BI data sources

The following table shows the data sources that Power BI supports for datasets, including information about DirectQuery and the on-premises data gateway. For information about dataflows, see [Connect to data sources for Power BI dataflows](service-dataflows-data-sources.md).

| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) |
|---|---|---|---|---|---|---|---|
| Access database | Yes | Yes | No | Yes <sup>1</sup> | Yes |
| ActiveDirectory | Yes | Yes | No | Yes | Yes |
| Adobe Analytics | Yes | Yes | No | No | No |
| Amazon Redshift | Yes | Yes | Yes | Yes | No |
| appFigures | Yes | Yes | No | No | No |
| AtScale cubes | Yes | Yes | Yes | Yes | No |
| Azure Analysis Services | Yes | Yes | Yes | Yes <sup>2</sup> | No |
| Azure Blob Storage | Yes | Yes | No | Yes | No |
| Azure Cosmos DB | Yes | Yes | No | No | No |
| Azure Cost Management | Yes | Yes | No | No | No |
| Azure Data Explorer (kusto) | Yes | Yes | Yes | No | No |
| Azure Data Lake Storage Gen1 | Yes | Yes | No | No | No |
| Azure Data Lake Storage Gen2 | Yes | Yes | No | No | No |
| Azure DevOps | Yes | Yes | No | No | No |
| Azure DevOps Server | Yes | Yes | No | Yes | Yes |
| Azure HDInsight (HDFS) | Yes | Yes | No | No | No |
| Azure HDInsight Spark | Yes | Yes | Yes | No | No |
| Azure SQL Database | Yes | Yes | Yes | Yes <sup>2</sup> | No |
| Azure SQL Data Warehouse | Yes | Yes | Yes | No | No |
| Azure Table Storage | Yes | Yes | No | Yes | No |
| BI Connector | Yes | Yes | Yes | Yes | Yes |
| BI360 - Budgeting & Financial Reporting | Yes | Yes | No | No | No |
| Common Data Service | Yes | Yes | No | No | No |
| Data.World - Get Dataset | Yes | Yes | No | No | No |
| Denodo | Yes | Yes | Yes | Yes | Yes |
| Dremio | Yes | Yes | Yes | Yes | Yes |
| Dynamics 365 (online) | Yes | Yes | No | No | No |
| Dynamics 365 Business Central | Yes | Yes | No | No | No |
| Dynamics 365 Business Central (on-premises) | Yes | Yes | No | No | No |
| Dynamics 365 Customer Insights | Yes | Yes | No | No | No |
| Dynamics NAV | Yes | Yes | No | No | No |
| Emigo Data Source | Yes | Yes | No | No | No |
| Entersoft Business Suite | Yes | Yes | No | No | No |
| Essbase | Yes | Yes | Yes | Yes | Yes |
| Exasol | Yes | Yes | Yes | Yes | Yes |
| Excel | Yes <sup>3</sup> | Yes <sup>3</sup> | No | Yes <sup>3</sup> | No <sup>4</sup> |
| Facebook | Yes | Yes | No | No | No |
| File | Yes | Yes | No | Yes | Yes |
| Folder | Yes | Yes | No | Yes | Yes |
| GitHub | Yes | Yes | No | No | No |
| Google Analytics | Yes | Yes | No | No | No |
| Google BigQuery | Yes | Yes | No | No | No |
| Hadoop File (HDFS) | Yes | No | No | No | No |
| HDInsight Interactive Query | Yes | Yes | Yes | No | No |
| IBM DB2 | Yes | Yes | Yes | Yes | Yes |
| IBM Informix Database | Yes | Yes | No | Yes | Yes |
| IBM Netezza | Yes | Yes | Yes | Yes | Yes |
| Impala | Yes | Yes | Yes | Yes | Yes |
| Indexima | Yes | Yes | Yes | Yes | Yes |
| Industrial App Store | Yes | Yes | No | No | No |
| Information Grid | Yes | Yes | No | No | No |
| Intersystems IRIS | Yes | Yes | Yes | Yes | Yes |
| Intune Data Warehouse | Yes | Yes | No | No | No |
| Jethro ODBC | Yes | Yes | Yes | Yes | Yes |
| JSON | Yes | Yes | No | Yes** | No <sup>4</sup> |
| Kyligence Enterprise | Yes | Yes | Yes | Yes | Yes |
| MailChimp | Yes | Yes | No | No | No |
| Marketo | Yes | Yes | No | No | No |
| MarkLogic ODBC | Yes | Yes | Yes | Yes | Yes |
| Microsoft Azure Consumption Insights | Yes | Yes | No | No | No |
| Microsoft Exchange | Yes | Yes | No | Yes | No |
| Microsoft Exchange Online | Yes | Yes | No | No | No |
| Microsoft Graph Security | Yes | Yes | No | Yes | No |
| Mixpanel | Yes | Yes | No | No | No |
| MySQL | Yes | Yes | No | Yes | Yes |
| OData | Yes | Yes | No | Yes | No |
| ODBC | Yes | Yes | No | Yes | Yes |
| OleDb | Yes | Yes | No | Yes | Yes |
| Oracle | Yes | Yes | Yes | Yes | Yes |
| Paxata | Yes | Yes | No | Yes | No |
| PDF | Yes | Yes | No | Yes | No <sup>4</sup> |
| Planview Enterprise One - CTM | Yes | Yes | No | No | No |
| Planview Enterprise One - PRM | Yes | Yes | No | No | No |
| Planview Projectplace | Yes | Yes | No | No | No |
| PostgreSQL | Yes | Yes | Yes | Yes | Yes |
| Power BI dataflows | Yes | Yes | No | No | No |
| Power BI datasets | Yes | Yes | Yes | No | No |
| Power platform dataflows | Yes | Yes | No | No | No |
| Python script | Yes | Yes <sup>5</sup> | No | Yes <sup>5</sup> | Yes |
| QubolePresto | Yes | Yes | Yes | Yes | Yes |
| Quick Base | Yes | Yes | No | Yes | Yes |
| QuickBooks Online | Yes | Yes | No | No | No |
| R script | Yes | Yes <sup>5</sup> | No | Yes <sup>5</sup> | No |
| Roamler | Yes | Yes | No | Yes | No |
| Salesforce Objects | Yes | Yes | No | No | No |
| Salesforce Reports | Yes | Yes | No | No | No |
| SAP Business Warehouse Message Server | Yes | Yes | Yes | Yes | Yes |
| SAP Business Warehouse Server | Yes | Yes | Yes | Yes | Yes |
| SAP HANA | Yes | Yes | Yes | Yes | Yes |
| SharePoint Folder | Yes | Yes | No | Yes | No <sup>4</sup> |
| SharePoint List | Yes | Yes | No | Yes | No <sup>4</sup> |
| SharePoint Online List | Yes | Yes | No | Yes <sup>2</sup> | No |
| Smartsheet | Yes | Yes | No | No | No |
| Snowflake | Yes | Yes | Yes | Yes | Yes |
| Spark | Yes | Yes | Yes | Yes | No |
| SparkPost | Yes | Yes | No | No | No |
| SQL Server | Yes | Yes | Yes | Yes | Yes |
| SQL Server Analysis Services | Yes | Yes | Yes | Yes | Yes |
| Stripe | Yes | Yes | No | No | No |
| SurveyMonkey | Yes | Yes | No | Yes | No |
| SweetIQ | Yes | Yes | No | No | No |
| Sybase | Yes | Yes | No | Yes | Yes |
| TeamDesk | Yes | Yes | No | Yes | No |
| Tenforce | Yes | Yes | No | No | No |
| Teradata | Yes | Yes | Yes | Yes | Yes |
| Text/CSV | Yes | Yes | No | Yes | No <sup>4</sup> |
| Twilio | Yes | Yes | No | No | No |
| tyGraph | Yes | Yes | No | No | No |
| Vertica | Yes | Yes | Yes | Yes | Yes |
| Web | Yes | Yes | No | Yes | Yes |
| Webtrends | Yes | Yes | No | No | No |
| Workforce Dimensions | Yes | Yes | No | Yes | No |
| XML | Yes | Yes | No | Yes | No <sup>4</sup> |
| Zendesk | Yes | Yes | No | No | No |
| | | | | | | | |

<sup>1</sup> Supported with the [ACE OLEDB provider](https://www.microsoft.com/download/details.aspx?id=54920), installed on the same machine as the gateway.

<sup>2</sup> Supported with the same M function as the on-premises version.

<sup>3</sup> Excel 1997-2003 files (.xls) require the [ACE OLEDB provider](https://www.microsoft.com/download/details.aspx?id=54920).

<sup>4</sup> Required for the on-premises version of the technology.

<sup>5</sup> Supported only with the [personal gateway](service-gateway-personal-mode.md).

## Single sign-on (SSO) for DirectQuery sources

When the SSO option is enabled and your users access reports built atop the data source, Power BI sends their authenticated Azure AD credentials in the queries to the underlying data source. This enables Power BI to respect the security settings that are configured at the data source level.
The SSO option takes effect across all datasets that use this data source. It does not affect the authentication method used for import scenarios. The following data sources support SSO for connections through DirectQuery:

- Azure SQL Database
- Azure SQL Data Warehouse
- Impala
- SAP HANA
- SAP BW
- SAP BW Message Server
- Spark
- SQL Server
- Teradata

> [!Note]
> Azure Multi-Factor Authentication (MFA) is not supported. Users who want to use SSO with DirectQuery must be exempted from MFA.

## Next steps

[Connect to data in Power BI Desktop](desktop-quickstart-connect-to-data.md)  
[Using DirectQuery in Power BI](desktop-directquery-about.md)  
[SQL Server Analysis Services live data in Power BI](sql-server-analysis-services-tabular-data.md)  
[What is an on-premises data gateway?](service-gateway-onprem.md)  
