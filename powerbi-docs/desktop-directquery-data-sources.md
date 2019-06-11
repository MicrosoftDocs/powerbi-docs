---
title: Data sources supported by DirectQuery in Power BI
description: Get a list of which data sources can use DirectQuery.
author: davidiseminger
ms.author: davidi
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 05/31/2019
LocalizationGroup: Connect to data
---

# Data sources supported by DirectQuery in Power BI

**Power BI Desktop** and the **Power BI service** have many data sources to which you can connect and get access to data. This article describes which data sources for Power BI support the connection method known as **DirectQuery**. For more information about DirectQuery, see [**DirectQuery in Power BI**](desktop-directquery-about.md).

The following data sources support DirectQuery in Power BI:

* Amazon Redshift
* AtScale (Beta)
* Azure Data Explorer
* Azure HDInsight Spark
* [Azure SQL Database](service-azure-sql-database-with-direct-connect.md)
* [Azure SQL Data Warehouse](service-azure-sql-data-warehouse-with-direct-connect.md)
* Google BigQuery
* HDInsight Interactive Query
* IBM DB2 database
* IBM Netezza
* Impala (version 2.x)
* Oracle Database (version 12 and above)
* Oracle Essbase
* SAP Business Warehouse Application Server
* SAP Business Warehouse Message Server
* SAP HANA
* Snowflake
* Spark (version 0.9 and above)
* SQL Server
* Teradata Database
* Vertica

Data sources that have **(Beta)** or **(Preview)** after their name are subject to change, and are not supported for production use. They might also not be supported after publishing a report to the **Power BI service**, which means that opening a published report or exploring the dataset can result in an error.

The only difference between **(Beta)** and **(Preview)** data sources is that **(Preview)** sources must be enabled as a Preview feature before they become available for use. To enable a **(Preview)** data connector, in **Power BI Desktop** go to **File > Options and Settings > Options**, and then select **Preview features**.

> [!NOTE]
> DirectQuery queries to SQL Server require authentication using current Windows authentication credentials or database credentials to establish access. Alternate credentials are not supported.
>

## On-premises gateway requirements
The following table specifies whether an **On-premises data gateway** is required to connect to the specified data source, after publishing a report to the **Power BI service**.

| Source | Gateway required? |
| --- | --- |
| Amazon Redshift |No |
| Azure HDInsight Spark (Beta) |No |
| Azure SQL Database |No |
| Azure SQL Data Warehouse |No |
| Google BigQuery |No |
| IBM Netezza |Yes |
| Impala (version 2.x) |Yes |
| Oracle Database |Yes |
| SAP Business Warehouse Application Server |Yes |
| SAP Business Warehouse Message Server |Not yet supported in the **Power BI service** |
| SAP HANA |Yes |
| Snowflake |Yes |
| Spark (beta), version 0.9 and later |Yes |
| SQL Server |Yes |
| Teradata Database |Yes |

## Single sign-on (SSO) for DirectQuery sources

When the SSO option is enabled and your users access reports built atop the data source, Power BI sends their authenticated Azure AD credentials in the queries to the underlying data source. This enables Power BI to respect the security settings that are configured at the data source level.

The SSO option takes affect across all datasets that use this data source. It does not affect the authentication method used for import scenarios. The following data sources support SSO for connections through DirectQuery:

- Azure SQL Database
- Azure SQL Data Warehouse
- Impala
- SAP HANA
- SAP BW
- Spark
- SQL Server
- Teradata

> [!Note]
> Azure Multi-Factor Authentication (MFA) is not supported. Users who want to use SSO with DirectQuery must be exempted from MFA.

## Next steps
For more information about DirectQuery, check out the following resources:

* [DirectQuery in Power BI](desktop-directquery-about.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
* [On-premises data gateway](service-gateway-onprem.md)

