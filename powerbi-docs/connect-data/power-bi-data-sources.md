---
title: Power BI data sources
description: This article lists the data sources that Power BI supports, including information about DirectQuery and the on-premises data gateway.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: concept-article
ms.date: 09/29/2025
#customer intent: As a Power BI user, I want to understand the data sources supported by Power BI and their capabilities so that I can effectively connect and analyze my data.
---

# Power BI data sources

This article provides information about Power BI data sources, including considerations, limitations, and links to more resources.

Power BI uses Power Query to connect to data sources. Power BI data sources are documented in [Power Query (including Power BI) connectors](/power-query/connectors/).

Each data source article in the Power Query documentation describes connector capabilities, like whether DirectQuery is supported. The following image shows the Capabilities supported section for [Azure Data Explorer (Kusto)](/power-query/connectors/azure-data-explorer#capabilities-supported), which shows that DirectQuery is supported in Power BI. If DirectQuery (or any other capability) isn't listed, the capability isn't supported. 

:::image type="content" source="media/power-bi-data-sources/power-bi-data-sources-01.png" alt-text="Screenshot of the Capabilities supported section for the Azure Data Explorer connector showing DirectQuery listed as a supported capability.":::

For a list of the connectors available in Power Query, see [Connectors in Power Query](/power-query/connectors/).

For information about dataflows in Power BI, see [Configure and consume a dataflow](../transform-model/dataflows/dataflows-configure-consume.md).

## Considerations and limitations

- Many data connectors for Power BI Desktop require Internet Explorer 10 or later for authentication.
- Some data sources appear in Power BI Desktop optimized for Power BI Report Server, but Power BI Report Server doesn't support them after you publish. See [Power BI report data sources in Power BI Report Server](../report-server/data-sources.md) for the list of supported data sources.
- Power BI Desktop and the Power BI service might send multiple queries to get schema information or data, depending on whether data is cached. It's by design. For details, see [why a query might run multiple times](/power-query/multiple-queries).

## Related content

- [Connectors in Power Query](/power-query/connectors/)
- [Connect to data in Power BI Desktop](desktop-quickstart-connect-to-data.md)  
- [Using DirectQuery in Power BI](desktop-directquery-about.md)  
- [What is an on-premises data gateway?](service-gateway-onprem.md)  
- [Power BI report data sources in Power BI Report Server](../report-server/data-sources.md)
