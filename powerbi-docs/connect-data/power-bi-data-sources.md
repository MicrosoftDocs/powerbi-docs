---
title: Power BI data sources
description: This article lists the data sources that Power BI supports, including information about DirectQuery and the on-premises data gateway.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 02/17/2023
---

# Power BI data sources

The following table shows the data sources that Power BI supports for datasets, including information about DirectQuery and the on-premises data gateway. For information about dataflows, see [Connect to data sources for Power BI dataflows](../transform-model/dataflows/dataflows-configure-consume.md).

> [!NOTE]
> Because this table is so long, we've split it up alphabetically in order to retain the headers.

## Data sources A-B

| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| Access database | Yes | Yes | No | Yes <sup>1</sup> | Yes | Yes |
| Actian | Yes | Yes | Yes | Yes | No | Yes |
| ActiveDirectory | Yes | Yes | No | Yes | Yes | Yes |
| Adobe Analytics | Yes | Yes | No | No | No | No |
| Amazon Athena | Yes | Yes | Yes | Yes | Yes | Yes |
| Amazon Redshift | Yes | Yes | Yes | Yes | No | Yes |
| Anaplan | Yes | Yes | No | Yes | No | Yes |
| appFigures | Yes | Yes | No | No | No | No |
| AssembleViews | Yes | Yes | No | Yes | No | Yes |
| AtScale cubes | Yes | Yes | Yes | Yes | No | Yes |
| Autonomy Data Analytics | Yes | Yes | No | Yes | No | Yes |
| Azure Analysis Services | Yes | Yes | Yes | No | No | No |
| Azure Blob Storage | Yes | Yes | No | Yes | No | Yes |
| Azure Cosmos DB | Yes | Yes | Yes | No | No | Yes |
| Azure Cost Management | Yes | Yes | No | No | No | Yes |
| Azure Data Explorer (Kusto) | Yes | Yes | Yes | Yes | No | Yes |
| Azure Data Lake Storage Gen1 | Yes | Yes | No | No | No | No |
| Azure Data Lake Storage Gen2 | Yes | Yes | No | Yes | No | Yes |
| Azure Databricks | Yes | Yes | Yes | Yes | No | Yes |
| Azure DevOps | Yes | Yes | No | No | No | No |
| Azure DevOps Server | Yes | Yes | No | Yes | Yes | No |
| Azure HDInsight (HDFS) | Yes | Yes | No | No | No | No |
| Azure HDInsight Spark | Yes | Yes | Yes | No | No | Yes |
| Azure SQL Database | Yes | Yes | Yes | Yes  | No | Yes |
| Azure Synapse | Yes | Yes | Yes | Yes  | No | Yes |
| Azure Synapse Analytics workspaces | Yes | Yes | No | Yes | No | Yes |
| Azure Table Storage | Yes | Yes | No | Yes | No | Yes |
| BI Connector | Yes | Yes | Yes | Yes | Yes | Yes |
| BI360 - Budgeting & Financial Reporting | Yes | Yes | No | No | No | No |
| Bloomberg Data and Analytics | Yes | Yes | No | Yes | No | Yes |
| BQE Core | Yes | Yes | No | Yes | No | Yes |



## Data sources C-D
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| Data Virtuality LDW | Yes | Yes | Yes | Yes | Yes | Yes |
| Data.World - Get Dataset | Yes | Yes | No | No | No | No |
| Microsoft Dataverse | Yes | Yes | Yes | Yes | No | Yes |
| Delta Sharing | Yes | Yes | No | Yes | No | Yes |
| Denodo | Yes | Yes | Yes | Yes | Yes | Yes |
| Dremio | Yes | Yes | Yes | Yes | No | Yes |
| Dynamics 365 (online) | Yes | Yes | No | No | No | No |
| Dynamics 365 Business Central | Yes | Yes | No | No | No | Yes |
| Dynamics 365 Business Central (on-premises) | Yes | Yes | No | No | No | No |
| Dynamics 365 Customer Insights | Yes | Yes | No | No | No | Yes |
| Dynamics NAV | Yes | Yes | No | No | No | No |



## Data sources E-G
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| Emigo Data Source | Yes | Yes | No | No | No | Yes |
| Entersoft Business Suite | Yes | Yes | No | No | No | Yes |
| EQuIS | Yes | Yes | No | Yes | No | Yes |
| Essbase | Yes | Yes | Yes | Yes | Yes | No |
| Exasol | Yes | Yes | Yes | Yes | Yes | Yes |
| Excel | Yes <sup>2</sup> | Yes <sup>2</sup> | No | Yes <sup>2</sup> | No <sup>3</sup> | Yes |
| File | Yes | Yes | No | Yes | Yes | Yes |
| Folder | Yes | Yes | No | Yes | Yes | Yes |
| GitHub | Yes | Yes | No | No | No | No |
| Google Analytics | Yes | Yes | No | No | No | No |
| Google BigQuery | Yes | Yes | Yes | Yes | No | Yes |
| Google Sheets | Yes | Yes | No | Yes | No | Yes |




## Data sources H-K
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| Hadoop File (HDFS) | Yes | No | No | No | No | No |
| Hive LLAP | Yes | Yes | Yes | Yes | No | No |
| HDInsight Interactive Query | Yes | Yes | Yes | No | No | No |
| IBM DB2 | Yes | Yes | Yes <sup>7</sup> | Yes | No | Yes |
| IBM Informix Database | Yes | Yes | No | Yes | No | No |
| IBM Netezza | Yes | Yes | Yes | Yes | Yes | No |
| Impala | Yes | Yes | Yes | Yes | Yes | Yes |
| Indexima | Yes | Yes | Yes | Yes | Yes | Yes |
| Industrial App Store | Yes | Yes | No | No | No | Yes |
| Information Grid | Yes | Yes | No | No | No | Yes |
| Intersystems IRIS | Yes | Yes | Yes | Yes | Yes | Yes |
| Intune Data Warehouse | Yes | Yes | No | No | No | Yes |
| Jethro ODBC | Yes | Yes | Yes | Yes | Yes | Yes |
| JSON | Yes | Yes | No | Yes | No <sup>3</sup> | Yes |
| Kognitwin | Yes | Yes | No | Yes | No | Yes |
| Kyligence Enterprise | Yes | Yes | Yes | Yes | Yes | Yes |

## Data sources M-O
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| MailChimp (deprecated) | Yes | Yes | No | No | No | No |
| MariaDB | Yes | Yes | Yes | Yes | Yes | Yes |
| Marketo | Yes | Yes | No | No | No | No |
| MarkLogic ODBC | Yes | Yes | Yes | Yes | Yes | Yes |
| Microsoft Azure Consumption Insights | Yes | Yes | No | No | No | No |
| Microsoft Exchange | Yes | Yes | No | No | No | No |
| Microsoft Exchange Online individual accounts  <sup>8</sup> | Yes | Yes | No | No | No | Yes |
| Mixpanel | Yes | Yes | No | No | No | No |
| MySQL | Yes | Yes | No | Yes | Yes | Yes |
| OData | Yes | Yes | No | Yes | No | Yes |
| ODBC | Yes | Yes | No | Yes | Yes | Yes |
| OleDb | Yes | Yes | No | Yes | Yes | No |
| Oracle | Yes | Yes | Yes <sup>9</sup> | Yes | Yes | Yes |


## Data sources P-R
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| Palantir Foundry | Yes | Yes | Yes | Yes | Yes | Yes |
| Paxata <sup>6</sup> | Yes | Yes | No | Yes | No | Yes |
| PDF | Yes | Yes | No | Yes | No <sup>3</sup> | Yes |
| Planview Enterprise One - CTM | Yes | Yes | No | No | No | No |
| Planview Enterprise One - PRM | Yes | Yes | No | No | No | No |
| Planview Projectplace | Yes | Yes | No | No | No | Yes |
| PostgreSQL | Yes | Yes | Yes | Yes | No | Yes |
| Power BI dataflows | Yes | Yes | Yes | No | No | Yes |
| Power BI datasets | Yes | Yes | Yes | No | No | No |
| Power platform dataflows | Yes | Yes | No | No | No | Yes |
| Python script | Yes | Yes <sup>4</sup> | No | Yes <sup>4</sup> | Yes | No |
| QubolePresto | Yes | Yes | Yes | Yes | Yes | Yes |
| Quick Base | Yes | Yes | No | Yes | Yes | Yes |
| QuickBooks Online | Yes | Yes | No | No | No | No |
| R script | Yes | Yes <sup>4</sup> | No | Yes <sup>4</sup> | No | No |
| Roamler | Yes | Yes | No | Yes | No | Yes |


## Data sources S
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| Salesforce Objects | Yes | Yes | No | No | No | Yes |
| Salesforce Reports | Yes | Yes | No | No | No | Yes |
| SAP Business Warehouse Message Server | Yes | Yes | Yes | Yes | Yes | Yes |
| SAP Business Warehouse Server | Yes | Yes | Yes | Yes | Yes | Yes |
| SAP HANA | Yes | Yes | Yes | Yes | Yes | Yes |
| SharePoint Folder | Yes | Yes | No | Yes | No <sup>3</sup> | Yes |
| SharePoint List | Yes | Yes | No | Yes | No <sup>3</sup> | Yes |
| SharePoint Online List | Yes | Yes | No | Yes | No | Yes |
| Smartsheet | Yes | Yes | No | No | No | Yes |
| Snowflake | Yes | Yes | Yes | Yes | No | Yes |
| SoftOne BI | Yes | Yes | No | Yes | No | Yes |
| Spark | Yes | Yes | Yes | Yes | No | Yes |
| SparkPost | Yes | Yes | No | No | No | No |
| SQL Server | Yes | Yes | Yes | Yes | Yes | Yes |
| SQL Server Analysis Services | Yes | No | Yes | Yes | Yes | No |
| SISCC-SDMX | Yes | Yes | No | Yes | No | No |
| Starburst Enterprise | Yes | Yes | Yes | Yes | No | Yes |
| Stripe | Yes | Yes | No | No | No | No |
| SumTotal | Yes | Yes | No | Yes | No | Yes |
| SurveyMonkey | Yes | Yes | No | Yes | No | Yes |
| SweetIQ | Yes | Yes | No | No | No | No |
| Sybase | Yes | Yes | No | Yes | Yes | Yes |

## Data sources T-Z
| Data source | Connect from Desktop | Connect and refresh from service | DirectQuery / Live connection | Gateway (supported) | Gateway (required) | Power BI Dataflows |
|---|---|---|---|---|---|---|
| TeamDesk | Yes | Yes | No | Yes | No | Yes |
| TenForce | Yes | Yes | No | No | No | Yes |
| Teradata | Yes | Yes | Yes | Yes | Yes | Yes |
| Text/CSV | Yes | Yes | No | Yes | No <sup>3</sup> | Yes |
| Twilio | Yes | Yes | No | No | No | No |
| tyGraph | Yes | Yes | No | No | No | No |
| Usercube | Yes | Yes | No | Yes | No | Yes |
| Vertica | Yes | Yes | Yes | Yes | Yes | Yes |
| Web | Yes | Yes | No | Yes | Yes <sup>5</sup> | Yes |
| Webtrends | Yes | Yes | No | No | No | Yes |
| Workplace Analytics | Yes | Yes | No | Yes | No | No |
| XML | Yes | Yes | No | Yes | No <sup>4</sup> | Yes |
| Zendesk | Yes | Yes | No | No | No | No |

<sup>1</sup> Supported with the [ACE OLEDB provider](https://www.microsoft.com/download/details.aspx?id=54920), installed on the same machine as the gateway.

<sup>2</sup> Excel 1997-2003 files (.xls) require the [ACE OLEDB provider](https://www.microsoft.com/download/details.aspx?id=54920).

<sup>3</sup> Required for the on-premises version of the technology.

<sup>4</sup> Supported only with the [personal gateway](service-gateway-personal-mode.md).

<sup>5</sup> Required for .html, .xls, and Access Databases

<sup>6</sup> Paxata is supported in the version of Power BI Desktop optimized for Power BI Report Server. It isn't supported in Power BI reports published to Power BI Report Server. See [Power BI report data sources in Power BI Report Server](../report-server/data-sources.md) for the list of supported data sources.

<sup>7</sup> DirectQuery works properly with the IBM DB2 connecter in Power BI Desktop, however, DirectQuery does *not* work with IBM DB2 when using the IBM driver to connect to IBM DB2. 


<sup>8</sup> Recurring meetings cannot be displayed when imported using the Exchange Online connector.

<sup>9</sup> Decimal precision is limited to 15. 

## Considerations and limitations

- Many data connectors for Power BI Desktop require Internet Explorer 10 (or newer) for authentication. 
- Some data sources are available in Power BI Desktop optimized for Power BI Report Server, but aren't supported when published to Power BI Report Server. See [Power BI report data sources in Power BI Report Server](../report-server/data-sources.md) for the list of supported data sources.
- Power BI Desktop and the Power BI service may send multiple queries for any given query, to get schema information or the data itself, based in part on whether data is cached. This behavior is by design. 

## Single sign-on (SSO) for DirectQuery sources

When the SSO option is enabled and your users access reports built atop the data source, Power BI sends their authenticated Azure AD credentials in the queries to the underlying data source. This enables Power BI to respect the security settings that are configured at the data source level.
The SSO option takes effect across all datasets that use this data source. It does not affect the authentication method used for import scenarios. The following data sources support SSO for connections through DirectQuery:

- Azure Data Explorer
- Azure Databricks
- Azure SQL Database
- Azure Synapse
- Impala
- SAP HANA
- SAP BW
- SAP BW Message Server
- Snowflake
- Spark
- SQL Server
- Teradata

## Next steps

[Connect to data in Power BI Desktop](desktop-quickstart-connect-to-data.md)  
[Using DirectQuery in Power BI](desktop-directquery-about.md)  
[What is an on-premises data gateway?](service-gateway-onprem.md)  
[Power BI report data sources in Power BI Report Server](../report-server/data-sources.md)
