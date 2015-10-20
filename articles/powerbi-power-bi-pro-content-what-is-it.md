<properties 
   pageTitle="Power BI Pro content - what is it?"
   description="Power BI Pro content - what is it?"
   services="powerbi" 
   documentationCenter="" 
   authors="davidiseminger" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/16/2015"
   ms.author="davidi"/>

# Power BI Pro content - what is it?  

Power BI free and Pro licenses are different based on the kind of content users can consume.  **Power BI Pro content** is a dashboard, report, or dataset that uses a connection or other functionality (such as hourly refresh) that is only available to consume with a Power BI Pro license.

If your content contains any of the following items, it's Power BI Pro content:

-   Data from a direct query dataset, such as [SQL Server Analysis Services](powerbi-sql-server-analysis-services-tabular-data.md) tabular data, [Azure SQL Database](powerbi-azure-sql-database-with-direct-connect.md), [Azure SQL Data Warehouse](powerbi-azure-sql-data-warehouse-with-direct-connect.md), or Apache [Spark for HDInsight](powerbi-spark-on-hdinsight-with-direct-connect.md).

-   Data from a [dataset that refreshes more frequently than daily](powerbi-refresh-data.md).

-   Data from a dataset that connects to on-premises data using the Power BI [Personal Gateway](powerbi-personal-gateway.md) or Power BI [Data Management Gateway](powerbi-admin-data-management-gateway-in-office-365.md).

-   A dashboard or report that's installed from an [organizational content pack](powerbi-service-organizational-content-packs-introduction.md).

-   A dashboard, report, or dataset that's contained in a [group workspace](powerbi-service-groups.md).

-   A dashboard that contains data streamed at a rate above 10k rows/hour.

Conversely, if your content contains only the following items it will be consumable by both Power BI free and Pro users:

-   A dashboard or report connected to content packs for services (e.g. Dynamics CRM, Salesforce, and Google Analytics).

-   A dashboard or report with data imported from files such as Excel spreadsheets, Power BI Desktop, and CSV.

For example, if you create a manufacturing dashboard that updates progress multiple times during the day, anyone *consuming* that dashboard would need a Power BI Pro license. Or, if you create a report using the Power BI AS Connector, then another that uses Personal Gateway, anyone *consuming or interacting* with either of those reports would need a Power BI Pro license.

If you want to share your Power BI Pro content with users, they can sign up for a [free trial of Power BI Pro](powerbi-free-trial-for-power-bi-pro.md), and gain access to your content during the trial period.

For a list of Power BI Pro features (and how those features compare to a free Power BI license), take a look at [Power BI Pricing](https://powerbi.microsoft.com/pricing).