<properties
   pageTitle="DirectQuery for Oracle and Teradata databases"
   description="DirectQuery for Oracle and Teradata databases"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/11/2017"
   ms.author="davidi"/>

# DirectQuery for Oracle and Teradata Databases

With Power BI Desktop you can connect to Oracle and Teradata databases directly using DirectQuery.

In this release, you can choose to connect to Oracle or Teradata databases using either **Import** or **DirectQuery**:

-   If you connect using **DirectQuery**, no data is imported or copied into Power BI Desktop. As you create or interact with a visualization, Power BI Desktop queries the underlying data source to get the necessary data to respond to your interaction, which means you’re always viewing current data. See [Use DirectQuery in Power BI Desktop](powerbi-desktop-use-directquery.md) for a description of DirectQuery.

-   If you connect with **Import**, data is imported into Power BI Desktop upon connection to the database, and interaction with the data is based on what was imported.

DirectQuery for Oracle and Teradata databases is available for Power BI Desktop and for the Power BI service.
