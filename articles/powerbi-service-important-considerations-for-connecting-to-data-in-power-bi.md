<properties 
   pageTitle="Important considerations for connecting to data in Power BI"
   description="Important considerations for connecting to data in Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="09/28/2015"
   ms.author="v-anpasi"/>
# Important considerations for connecting to data in Power BI

Connecting to data sources through Power BI is an easy way to get analytics and insights on data that is important to you. Power BI is designed to work well with a variety of data sources:

-   Data from [Excel and Power BI Desktop files](powerbi-service-get-data-from-files.md).

-   Content packs with ready-made dashboards, reports, and datasets for [SaaS ](https://support.powerbi.com/knowledgebase/topics/88770) applications. Connecting to these SaaS applications requires an existing subscription to that application. In addition to establishing a data connection, Power BI  provides pre-built dashboards and reports for each of these applications.

-   Connectors to [databases and other datasets](https://support.powerbi.com/knowledgebase/topics/88773), such as [Azure SQL Database](powerbi-azure-sql-database-with-direct-connect.md) and SQL Server [Analysis Services tabular data](powerbi-sql-server-analysis-services-tabular-data.md).

When connecting to data sources through Power BI, there are some things to consider across all sources:

**Ensure you have a valid account and credentials ready**

Power BI connects to these data sources on your behalf. These connections require valid accounts that meet the requirements of the specific data source. Please check the individual Connect to… pages for information on each of the data sources.

**Disable Pop-up blocker in your browser**

Some of the data source log-in flows require popping up additional dialogs. Please ensure you have pop-ups disabled before connecting to the sources, so that you can complete the authentication flow correctly.

**Performance will depend on the data source**

Each of the data sources may have different connection methods and therefore different performance. The performance will also depend on the size of your account and data. The more data you have the longer loading and refreshing may take.

**Each source may have a different refresh schedule**

The refresh schedule is automatically configured for these sources but many of them can be reconfigured if necessary. Select schedule refresh on an imported data set to learn more about the refresh schedule for a specific source.

**Each data source is a little different**

Some of the data sources may have additional requirements, please review the individual Connect to… pages for specific details on the data sources you're trying to connect to.

**Be careful not to overwrite data sources**

## See Also:

[Get data](powerbi-service-get-data.md)

[Get started with Power BI](powerbi-service-get-started.md) 

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

