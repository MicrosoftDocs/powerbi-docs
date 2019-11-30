---
title: Referencing Power Query queries
description: Guidance for referencing Power Query queries.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/30/2019
ms.author: v-pemyer
---

# Referencing Power Query queries

This article targets you as a data modeler working with Power BI Desktop. The focus of this article provides guidance when defining Power Query queries that reference other queries. A referenced query is one that uses the output of another query as its source.

Consider several queries: **Query 1** sources data from a web service, and its load is disabled. **Query 2**, **Query 3**, and **Query 4** all reference **Query 1**, and their outputs are loaded to the data model.

![Query Dependencies view, displaying queries described in the previous paragraph.](media/power-query-referenced-queries/query-dependencies-web-service.png)

When the data model is refreshed, it's often assumed that Power Query retrieves and caches the **Query1** result, and that the result can be used by referenced queries. This thinking is incorrect. In fact, Power Query executes all queries separately, and so in this example it retrieves data from the web service four times. It will result in slow data refreshes, and could negatively impact the data source.

> [!NOTE]
> Power Query caching is a complicated topic. Power Query may cache some data sources when the data load **Enable parallel loading of tables** property is disabled.
>
> Further, the use of the [Table.Buffer](/powerquery-m/table-buffer) function in **Query1** won't eliminate the additional querying. This function buffers a table to memory. The buffered table can only be addressed within the _same_ query.

## Recommendations

Generally, we recommend you reference queries to avoid the duplication of logic across your queries. However, as discussed in this article, this design approach can result in slow data refreshes and overburdened data sources.

We recommend you create a [dataflow](service-dataflows-overview.md) instead. Using a dataflow can improve data refresh time, and reduce impact on your data sources.

You can design the dataflow to encapsulate the source data and transformations. As the dataflow is a persisted store of data in the Power BI service, its data retrieval is fast. So, even when referencing queries result in multiple requests for the data, data refresh times will be improved.

## Next steps

For more information related to referencing queries, check out the following resources:

- [Self-service data prep in Power BI](service-dataflows-overview.md)
- [Creating and using dataflows in Power BI](service-dataflows-create-use.md)
- Guy in a Cube video: [Inside Power Query reference queries for Power BI and Excel](https://www.youtube.com/watch?v=3uKNNZqBIkg)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
