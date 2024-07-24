---
title: Referencing Power Query queries
description: Guidance for referencing Power Query queries.
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/30/2019
---

# Referencing Power Query queries

This article targets you as a data modeler working with Power BI Desktop. It provides you with guidance when defining Power Query queries that reference other queries.

Let's be clear about what this means: _When a query references a second query, it's as though the steps in the second query are combined with, and run before, the steps in the first query._

Consider several queries: **Query1** sources data from a web service, and its load is disabled. **Query2**, **Query3**, and **Query4** all reference **Query1**, and their outputs are loaded to the data model.

![Diagram showing the Query Dependencies view, displaying queries described in the previous paragraph.](media/power-query-referenced-queries/query-dependencies-web-service.png)

When the data model is refreshed, it's often assumed that Power Query retrieves the **Query1** result, and that it's reused by referenced queries. This thinking is incorrect. In fact, Power Query executes **Query2**, **Query3**, and **Query4** separately.

You can think that **Query2** has the **Query1** steps embedded into it. It's the case for **Query3** and **Query4**, too. The following diagram presents a clearer picture of how the queries are executed.

![Diagram showing a modified version of the Query Dependencies view, displaying Query 2, Query 3, and Query 4.](media/power-query-referenced-queries/query-dependencies-web-service-concept.png)

**Query1** is executed three times. The multiple executions can result in slow data refresh and negatively impact on the data source.

The use of the [Table.Buffer](/powerquery-m/table-buffer) function in **Query1** won't eliminate the additional data retrieval. This function buffers a table to memory, and the buffered table can only be used within the same query execution. So, in the example, if **Query1** is buffered when **Query2** is executed, the buffered data couldn't be used when **Query3** and **Query4** are executed. They themselves will buffer the data twice more. (This result could in fact compound the negative performance, because the table will be buffered by each referencing query.)

> [!NOTE]
> Power Query caching architecture is complex, and it's not the focus of this article. Power Query can cache data retrieved from a data source. However, when it executes a query, it may retrieve the data from the data source more than once.

## Recommendations

Generally, we recommend you reference queries to avoid the duplication of logic across your queries. However, as described in this article, this design approach can contribute to slow data refreshes and overburden data sources.

We recommend you create a [dataflow](../transform-model/dataflows/dataflows-introduction-self-service.md) instead. Using a dataflow can improve data refresh time and reduce impact on your data sources.

You can design the dataflow to encapsulate the source data and transformations. As the dataflow is a persisted store of data in the Power BI service, its data retrieval is fast. So, even when referencing queries result in multiple requests for the dataflow, data refresh times can be improved.

In the example, if **Query1** is redesigned as a dataflow entity, **Query2**, **Query3**, and **Query4** can use it as a data source. With this design, the entity sourced by **Query1** will be evaluated only once.

## Related content

For more information related to this article, check out the following resources:

- [Self-service data prep in Power BI](../transform-model/dataflows/dataflows-introduction-self-service.md)
- [Creating and using dataflows in Power BI](../transform-model/dataflows/dataflows-create.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
