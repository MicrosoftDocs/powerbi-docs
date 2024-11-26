---
title: Data sources for natural language Q&A
description: Learn about import, live connect, and DirectQuery data sources for Power BI natural language Q&A. Understand Q&A indexing and caching.
author: mohaali
ms.author: mohaali
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 09/26/2023
ms.custom: kr2b-contr-experiment
---

# Data sources for natural language Q&A

The Q&A feature in Power BI lets you quickly get answers about your data by using natural language to ask questions about the data. This article describes supported configurations for Q&A, and how indexing and caching improve performance for each configuration.

## Supported data sources

Power BI Q&A supports the following configurations of data sources in the Power BI Desktop:

- Import mode.
- Live connect mode with on-premises SQL Server Analysis Services, Azure Analysis Services, or Power BI datasets. However, DirectLake and Lakehouse Power BI datasets are not supported.
- DirectQuery with Azure Synapse Analytics, Azure SQL, or SQL Server 2019. Other sources might work in direct query mode, but aren't officially supported.

Using a Q&A visual in a report enables natural language Q&A by default. If you're using DirectQuery or live connect, a prompt appears.

In Power BI Desktop, to explicitly turn natural language capabilities on or off for a report:

1. Go to **File** > **Options and settings** > **Options**.
1. Under **Current File** > **Data Load**, select or deselect **Turn on Q&A to ask natural language questions about your data**.

:::image type="content" source="media/q-and-a-data-sources/qna-desktop-options.png" alt-text="Screenshot showing the Power BI Desktop Q&A options.":::

For more information, see [Limitations of Power BI Q&A](q-and-a-limitations.md).

<a name="how-does-indexing-work-with-qa"></a>
## Q&A indexing

Enabling Q&A builds an index, to quickly provide real-time feedback to the user and help interpret their questions. The index can take some time to build. The index has the following characteristics:

- All column names and tables are inserted into the index unless they're explicitly turned off from within the Q&A tooling.
- All text values of fewer than 100 characters are indexed. Text values of 100 characters and more aren't indexed.
- The Q&A index stores a maximum of 5 million unique values. If you exceed this number, the index doesn't hold all the potential values, which might decrease Q&A accuracy.
- The Q&A index is built based on the first 1,000 model entities (tables and fields). If your data model exceeds this number, the index doesn't hold all the potential model entities, which might decrease Q&A accuracy.
- If an error occurs during indexing, the index remains in a partial state, and recreates on the next refresh.

## Index refresh and caching

Power BI Desktop creates the index when you use Q&A. A small icon appears when the index is building. While the index is building, the Q&A visual and suggestions might take some time to load.

If your model changes or the index becomes outdated, the index must update. Because the index can take time to rebuild, the index updates only if you use Q&A in the same session as when the changes happen.

In the Power BI service, the index recreates on publish, republish, and refresh. Q&A index creation isn't always automatic, and can happen on demand to optimize the dataset refreshes. For DirectQuery, Q&A data indexes at most once per day, to reduce the impact on the DirectQuery source.

## Related content

For more information on integrating natural language in your reports, see:

* [Create a Q&A visual in a report in Power BI](../visuals/power-bi-visualization-q-and-a.md)
* [Best practices to optimize Q&A in Power BI](q-and-a-best-practices.md)
