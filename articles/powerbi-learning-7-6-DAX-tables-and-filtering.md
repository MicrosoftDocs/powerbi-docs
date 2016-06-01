<properties
   pageTitle="DAX Tables and Filtering"
   description="Filter and evaluate tables using advanced table functions"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""
   featuredVideoId=""
   courseDuration="30m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2016"
   ms.author="davidi"/>

# DAX Tables and Filtering

DAX has a rich set of table functions, such as FILTER, ALL, VALUES, DISTINCT, and RELATEDTABLE. These return a full table rather than a value, and typically you would use the results of a table function in further analysis as part of a greater expression, rather than a final value. When you use a table function, the results inherit the relationships of their columns.

You can mix table functions in your expression, as long as each one uses a table, and returns a table. For example, FILTER (ALL (Table), Condition) would put a filter over the entirety of Table, ignoring any current filter content.

The DISTINCT function returns the distinct values of a column that are also visible in the current context. So to reference our earlier example, while ALL ignores filters, DISTINCT observes them.

One common question that Power BI report builders want to answer is, "How many values do I have for this column?". This is a simple question to answer with a table right in front of you, but DAX approaches it in a different way, particularly when there's a relationship between tables.

For example, Power BI and DAX will include values that are not properly cross-indexed. If the incoming relationship is broken, DAX adds a new row to the related table that has blanks in every field, and links it to the unindexed row to guarantee referential integrity. If your function includes blank rows, such as ALL, they will then be included in the number of values for that column.

You can also create entire calculated tables using DAX functions. These require a name and a table function. Calculated tables can be used like any other table, including establishing relationships.
