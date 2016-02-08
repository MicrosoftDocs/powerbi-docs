<properties 
   pageTitle="Considerations when connecting to data in Power BI"
   description="Considerations when connecting to data in Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/21/2016"
   ms.author="maggies"/>
# Considerations when connecting to data in Power BI

Connecting to data sources through Power BI is an easy way to get analytics and insights on data that is important to you. Power BI is designed to work well with a variety of data sources. More about [getting data into Power BI](powerbi-service-get-data.md).

When connecting to data sources through Power BI, there are some things to keep in mind across all sources:

### Have a valid account and credentials ready

Power BI connects to data sources on your behalf. These connections require valid accounts that meet the requirements of the specific data source. Check the individual service content pack pages for information on each of the data sources. More about [connecting to services with content packs](powerbi-content-packs-services.md).

### Turn off the pop-up blocker in your browser

Signing in to some data sources requires completing additional dialog boxes. Make sure you have the pop-up blocker disabled before connecting to the sources, so that you can complete the authentication flow correctly.

### Performance depends on the data source

Data sources have different connection methods and therefore different performance. Performance also depends on the size of your account and data. The more data you have, the longer loading and refreshing may take.

### Data sources have different refresh schedules

The refresh schedule is automatically configured for data sources, but many can be reconfigured if necessary. Select **Schedule Refresh** on a dataset to learn about that specific source. More about [data refresh in Power BI](powerbi-refresh-data.md).

### Each data source is different

Some of the data sources may have additional requirements, please review the individual Connect to… pages for specific details on the data sources you're trying to connect to.

### See also

[Get data](powerbi-service-get-data.md)

[Get started with Power BI](powerbi-service-get-started.md) 

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

