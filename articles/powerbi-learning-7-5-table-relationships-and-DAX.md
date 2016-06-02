<properties
   pageTitle="Table Relationships and DAX"
   description="Create expressions across multiple tables with relational functions"
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
   courseDuration="11m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2016"
   ms.author="davidi"/>

# Table Relationships and DAX

DAX has relational functions that let you interact with tables that have established relationships. For example, TABLE follows relationships and returns the value of a column, while RELATEDTABLE follows relationships and returns all the rows in relationship with the current one. RELATED works on many-to-one relationships, while RELATEDTABLE is for one-to-many relationships.

You can use relational functions to build expressions that include values across multiple tables. DAX will return a result with one of these functions regardless of the length of the chain of the relationship.
