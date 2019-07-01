---
title: Guidance for deploying a data gateway for Power BI
description: Learn best practices and considerations for deploying a gateway for Power BI.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 06/20/2019
ms.author: mblythe

LocalizationGroup: Gateways
---

# Guidance for deploying a data gateway for Power BI

This article provides guidance and considerations for deploying a data gateway for Power BI in your network environment.

For information about how to download, install, configure, and manage the on-premises data gateway, see [What is an on-premises data gateway](/data-integration/gateway/service-gateway-onprem). You can also find out more about the on-premises data gateway and Power BI by visiting the [Microsoft Power blog](https://powerbi.microsoft.com/blog/) and the [Microsoft Power BI Community](https://community.powerbi.com/) site.

## Installation considerations for the on-premises data gateway

Before installing the on-premises data gateway for your Power BI cloud service, there are a handful of considerations you should keep in mind. The following sections describe these considerations.

### Number of users

The number of users consuming a report that's using the gateway is an important metric in deciding where to install the gateway. Here are some questions to consider:

* Are users using these reports at different times of the day?
* What types of connections are they using (DirectQuery or Import)?
* Are all users using the same report?

If users are all accessing a given report at the same time each day, you'll want to make sure you install the gateway on a machine that's capable of handling all those requests (see the following sections for performance counters and minimum requirements that can help you determine this).

There is a constraint in **Power BI** that allows only *one* gateway per *report*, so even if a report is based on multiple data sources, all such data sources must go through a single gateway. However, if a dashboard is based on *multiple* reports, you can use a dedicated gateway for each contributing report, and thereby distribute the gateway load among those multiple reports that contribute to that single dashboard.

### Connection type

**Power BI** offers two types of connections: **DirectQuery** and **Import**. Not all data sources support both connection types, and many reasons may contribute to choosing one over the other, such as security requirements, performance, data limits, and data model sizes. You can learn more about connection types and supported data sources in the [list of available data source types](service-gateway-data-sources.md#list-of-available-data-source-types).

Depending on which type of connection is used, gateway usage can be different. For example, you should try to separate **DirectQuery** data sources from **Scheduled Refresh** data sources whenever possible (assuming they're in different reports and can be separated). Doing so prevents the gateway from having thousands of DirectQuery requests queued up, at the same time as the morning's scheduled refresh of a large size data model that's used for the company's main dashboard. Here's what to consider for each:

* For **Scheduled Refresh**: depending on your query size and the number of refreshes occurring per day, you can choose to stay between the recommended minimum hardware requirements or upgrade to a higher performance machine. If a given query is not folded, transformations occur on the gateway machine, and as such, the gateway machine benefits from having more available RAM.

* For **DirectQuery**: a query is be sent each time any user opens the report or looks at data. So if you anticipate more than 1,000 users accessing the data concurrently, you'll want to make sure your computer has robust and capable hardware components. More CPU cores will result in better throughput for a **DirectQuery** connection.

The requirements for a machine on which you install can be found in the on-premises data gateway [installation requirements](/data-integration/gateway/service-gateway-install#requirements).

### Location

The location of the gateway installation can have significant impact on your query performance, so try to make sure your gateway, data source locations, and the Power BI tenant are as close as possible to each other to minimize network latency. To determine your Power BI tenant location, in the Power BI service select the **?** icon in the upper-right corner, and then select **About Power BI**.

![Determine your Power BI tenant location](media/service-gateway-deployment-guidance/powerbi-gateway-deployment-guidance_02.png)

Also, if you intend to use the Power BI gateway with Azure Analysis Services, be sure that the data regions in both match. For more information about setting data regions for multiple services, watch [this video](https://guyinacube.com/2018/01/power-bi-azure-analysis-services-gateway-data-region/).

## Next steps

* [Configuring proxy settings](/data-integration/gateway/service-gateway-proxy)  
* [Troubleshoot gateways - Power BI](service-gateway-onprem-tshoot.md)  
* [On-premises data gateway FAQ - Power BI](service-gateway-power-bi-faq.md)  

More questions? [Try the Power BI Community](http://community.powerbi.com/)

