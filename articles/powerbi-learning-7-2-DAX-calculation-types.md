<properties
   pageTitle="DAX Calculation Types"
   description="Create calculated columns and measures in Power BI using DAX forumulas"
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
   courseDuration="20m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2016"
   ms.author="davidi"/>

# DAX Calculation types

The general format of table names in DAX is 'TableName'[ColumnName]. The quotes around the table name are mandatory if the name contains any spaces. You can also omit the table name completely and just use the column name, but this is poor practice for clear functions. Column names must always include the square brackets.

You can create calculated columns in Power BI using only a DAX formula. The required elements are a mew column name, and at least one function or expression. If you reference a table or column in your calculated column formula, you do not need to specify a row in the table -- Power BI will know to calculate the column for the current row.

You can also create a measure using only a DAX formula. Again, the required elements are a mew measure name, and at least one function or expression. Measures are usually aggregated data.

You should use a calculated column when you want to slice or filter on the value, or if you want a calculation for every row in your table. You should use a measure when you are calculating percentages or ratios, or you need complex aggregations.
