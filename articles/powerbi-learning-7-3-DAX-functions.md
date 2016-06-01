<properties
   pageTitle="DAX Functions"
   description="An overview of the breadth of functions available in DAX"
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
   courseDuration="13m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2016"
   ms.author="davidi"/>

# DAX Functions

DAX has a number of aggregation functions, such as SUM, AVERAGE, MIN, and MAX. These functions work only on numeric columns, and generally can aggregate only one column at a time. However, the aggregation functions that end in "x", such such as SUMX, can work on multiple columns at the same time. These functions iterate through the table and evaluate the expression for each row.

Counting functions in DAX include COUNT, COUNTA, COUNTBLANK, COUNTROWS, and DISTINCTCOUNT. These count different elements, such as distinct values, non-empty values, and table rows.

Logical functions in DAX include AND, OR, NOT, IF, and IFERROR. These can also be expressed with operators -- for example, AND can be rendered as &&. Use operators when you need more than 2 conditions in your formula, but otherwise use the function for readability.

Information functions in DAX include ISBLANK, ISNUMBER, ISTEXT, ISNONTEXT, and ISERROR. While these can be situationally useful, there is also value in knowing the data type of your columns ahead of time.

DAX uses the MAX and MIN functions to both aggregate values and to compare values.

Text functions in DAX include CONCATENTATE, REPLACE, SEARCH, UPPER, and FIXED. These work very similar to the functions of the same name in Excel.

Date functions in DAX include DATE, HOUR, NOW, EOMONTH, and WEEKDAY. While these functions are useful to calculate and extract information from date values, they do not apply to time intelligence, which uses a date table.
