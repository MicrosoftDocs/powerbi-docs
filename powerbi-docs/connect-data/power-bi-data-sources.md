---
title: Power BI data sources
description: This article lists the data sources that Power BI supports, including information about DirectQuery and the on-premises data gateway.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 03/29/2023
---

# Power BI data sources

Power BI uses Power Query to connect to data sources. The data sources available in Power BI are documented in Power Query documentation, including information about DirectQuery and the on-premises data gateway. 

Information about Power Query data sources, which also apply to Power BI, are available in the [connectors in Power Query](/power-query/connectors/) article.

For information about dataflows in Power BI, see [Connect to data sources for Power BI dataflows](../transform-model/dataflows/dataflows-configure-consume.md).


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

[Connectors in Power Query](/power-query/connectors/)
[Connect to data in Power BI Desktop](desktop-quickstart-connect-to-data.md)  
[Using DirectQuery in Power BI](desktop-directquery-about.md)  
[What is an on-premises data gateway?](service-gateway-onprem.md)  
[Power BI report data sources in Power BI Report Server](../report-server/data-sources.md)
