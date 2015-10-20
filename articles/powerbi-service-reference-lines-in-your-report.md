<properties 
   pageTitle="Reference lines in your report"
   description="Reference lines in your report"
   services="powerbi" 
   documentationCenter="" 
   authors="pcw3187" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="v-pawrig"/>
# Reference lines in your report

[← Knowledge Base](https://support.powerbi.com/knowledgebase)

You can use a calculated column to define a reference line.  Identify the table and column on which you want to create a reference line.  Select "New Column" in the ribbon and, in the formula bar, type the following formula:

    Target Value = 100

This calculated column will return the value 100 regardless of where it is used.  Your new column will show up in the Field List.  Add the Target Value calculated column to a line chart to show how any series relates to that specific reference line.  

[Learn more about calculated columns](https://support.powerbi.com/knowledgebase/articles/590598)

