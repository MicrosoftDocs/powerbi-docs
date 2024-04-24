---
title: Power BI data sources
description: This article lists the data sources that Power BI supports, including information about DirectQuery and the on-premises data gateway.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 06/09/2023
---

# Power BI data sources

Power BI uses Power Query to connect to data sources. **Power BI data sources** are documented in the following article: [Power Query (including Power BI) connectors](/power-query/connectors/).

Each data source article in the Power Query documentation describes the capabilities of the data connector, such as whether DirectQuery is supported. The following image shows the **Capabilities supported** section for [Azure Data Explorer (Kusto)](/power-query/connectors/azure-data-explorer#capabilities-supported), where it states that DirectQuery is supported for the connector in Power BI. If DirectQuery (or any other capability) isn't listed, the capability isn't supported. 

:::image type="content" source="media/power-bi-data-sources/power-bi-data-sources-01.png" alt-text="Screenshot showing DirectQuery as a capability of a data connector.":::


For a list of the connectors available in Power Query, see [connectors in Power Query](/power-query/connectors/).

For information about dataflows in Power BI, see [connect to data sources for Power BI dataflows](../transform-model/dataflows/dataflows-configure-consume.md).


## Considerations and limitations

- Many data connectors for Power BI Desktop require Internet Explorer 10 (or newer) for authentication. 
- Some data sources are available in Power BI Desktop optimized for Power BI Report Server, but aren't supported when published to Power BI Report Server. See [Power BI report data sources in Power BI Report Server](../report-server/data-sources.md) for the list of supported data sources.
- Power BI Desktop and the Power BI service may send multiple queries for any given query, to get schema information or the data itself, based in part on whether data is cached. This behavior is by design, for more information, see the Power Query article that describes [why a query may run multiple times](/power-query/multiple-queries).


## Related content

The following articles provide more information about Power BI and connecting to data:

- [Connectors in Power Query](/power-query/connectors/)
- [Connect to data in Power BI Desktop](desktop-quickstart-connect-to-data.md)  
- [Using DirectQuery in Power BI](desktop-directquery-about.md)  
- [What is an on-premises data gateway?](service-gateway-onprem.md)  
- [Power BI report data sources in Power BI Report Server](../report-server/data-sources.md)
