<properties
   pageTitle="Introduction to DAX"
   description="Learn what DAX is and some of its basic building blocks"
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
   courseDuration="8m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2016"
   ms.author="davidi"/>

# Introduction to DAX

DAX is the language of Power BI, and other BI offerings from Microsoft such as Power Pivot and SSAS Tabular.

DAX concepts are simple and straightforward, but it's also powerful. DAX uses some unique programming concepts and patterns, which can make it difficult to fully use and understand. Traditional ways of learning languages may not be the best approach to DAX, so the goal of this chapter is to teach you concepts and theory which will help later on in your Power BI work.

DAX is a functional language, which means the full executed code is contained inside a function. In DAX, functions can contain other, nested functions, conditional statements, and value references. Execution in DAX starts from the innermost function or parameter, and works outward. In Power BI, DAX formulas are written in a single line, so formatting your functions correctly is important for readability.

DAX is designed to work with tables, so it has just two primary data types: Numeric and Other. Numeric can include integers, decimals, and currency. Other can include strings and binary objects. This means that if you build your DAX function to work on one type of number, you can be assured that it will work on any other Numeric data.

DAX uses operator overloading, which means that you can mix data types in your calculations and the results will change based on the type of data used in the inputs. Conversion happens automatically. While this means that you don't have to know the data types of the columns that you are working with in Power BI, it also means that sometimes conversion can happen in unexpected ways. It's good practice to understand the data you are using to ensure that your operators are behaving as anticipated.

There is one data type in particular that you'll likely be working with a lot in Power BI: DateTime. DateTime is stored as a floating point value with both integer and decimal parts. DateTime can be used accurately for calculations of any time period after March 1, 1900.
