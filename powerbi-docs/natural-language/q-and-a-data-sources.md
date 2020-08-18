---
title: Use natural language with import, live connect and direct query
description: In this article we will look at how the Q&A feature works with the different types of data sources available within Power BI and also look inside the concepts of indexing and caching.
author: mohaali

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 07/01/2020
ms.author: mohaali
---

## What data sources are supported in Q&A

Q&A is supported in the following configurations:

- Import mode
- Live connect mode – Either with On Premise SSAS or with Azure Analysis Services or with Power BI Datasets
- Direct Query – Azure Synapse, Azure SQL, and SQL Server 2019, although other sources may work in direct query mode, we do not officially support these sources.

By default, Q&A is enabled inside a report if you utilize the Q&A visual. A prompt will appear if you are using Direct Query or Live connect. You can explicitly turn on/off the natural language capabilities for a report by going into options.

![Q&A desktop options](media/qna-desktop-options.png)

## How does indexing work with Q&A

When you enable Q&A, an index is built in order to quickly provide real time feedback to the user and to help interpret the user’s questions. The index can take some time to be built and will consist of the following elements and limitations.

- All column names and tables will be inserted into the index unless it has been explicitly turned off from within the Q&A tooling.
- All text values less than 100 characters will be indexed. Text values greater than 100 characters will not be indexed. 
- Q&A will store a maximum of 5 Million unique values in its index, if you exceed this threshold, the index will not hold all the potential values and this may decrease the accuracy of the results you receive from Q&A
- If an error occurs during indexing, the index will remain in a partial state and will be recreated on the next refresh, see refresh indexes below

## How often is the index refreshed and cached

In Power BI Desktop, the index will be created at the time you use Q&A, a small icon will appear letting you know the index is being built. During this time, the Q&A visual including suggestions may take some time to load.

In Power BI Service, the index is recreated on publish/republish and refresh. The Q&A index is not always created automatically and will sometimes be based upon an on-demand basis. This is to optimize the dataset refreshes. For Direct Query, we will index the data at most once per day to reduce the impact on the Direct Query source.

## Next steps

You can integrate natural language in your reports in a variety of ways. For more information, see these articles:

* [Q&A visual](../visuals/power-bi-visualization-q-and-a.md)
* [Q&A best practices](q-and-a-best-practices.md)
