---
title: What is Microsoft Power BI Premium?
description: Power BI Premium is dedicated capacity for your organization or team, giving you more dependable performance and larger data volumes, without requiring you to purchase per-user licenses.
author: minewiskan
ms.author: owend
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 03/12/2019
ms.custom: seodec18

LocalizationGroup: Premium
---

# What is Microsoft Power BI Premium?

> [!NOTE]
> This article is currently being updated to describe new features, provide more details, and improve readability. For the latest information, see [Deploying and Managing Power BI Premium Capacities](whitepaper-powerbi-premium-deployment.md).

Power BI Premium provides resources dedicated to running the Power BI service for your organization. It gives you more dependable performance and enables larger data volumes. Premium also enables widespread distribution of content without requiring you to purchase per-user Pro licenses for content consumers.  

## Premium capacity and shared capacity

You take advantage of Power BI Premium by assigning workspaces to a *Premium capacity*. Premium capacity is a dedicated resource for your organization. Workspaces not assigned to a premium capacity are in a *shared capacity*. With shared capacity, your workloads run on computational resources shared by other customers.

The following image shows the relationship between Premium capacity and shared capacity, using the Contoso organization as an example.

![Illustration of Power BI Premium](media/service-premium/premium-chart.png)

| Area | Description |
| --- | --- |
| **(1)** Items within a Premium capacity | <ul><li>Accessing app workspaces (as members or admins) and publishing apps requires a Power BI Pro license.<li>Sharing an app requires a Pro license, but consuming an app doesn't.<li>All dashboard recipients, regardless of the license they're assigned, can set data alerts.<li>REST APIs for embedding use a service account with a Pro license, rather than a user account.</ul> |
| **(2)** My workspace in shared capacity | <ul><li>Sharing and consuming an app both require a Pro license.</ul> |
| **(3)** App workspaces in shared capacity | <ul><li>Any app usage requires a Pro license.</ul>|
| | |

In shared capacity, Power BI puts more limits on individual users to ensure quality of experience for all users. By default, your workspace is in a shared capacity, including your personal *My workspace* and App workspaces.

The following table provides a summary of the differences between shared capacity and Premium capacity:

|  | Shared capacity | Power BI Premium capacity |
| --- | --- | --- |
| **Refresh rate** |8/day |48/day |
| Isolation with dedicated hardware |![Not available](media/service-premium/not-available.png) |![](media/service-premium/available.png) |
| Enterprise Distribution to *all users* | | |
| Apps and sharing |![Not available](media/service-premium/not-available.png) |![](media/service-premium/available.png) |
| Embedded API and controls |![Not available](media/service-premium/not-available.png) |![](media/service-premium/available.png)<sup>[1](#fnt1)</sup> |
| Publish Power BI reports on-premises |![Not available](media/service-premium/not-available.png) |![](media/service-premium/available.png) |
| | | |

<a name="fnt1">1</a> Future enhancements coming to Power BI Premium.



### Premium capacity nodes

Power BI Premium is available in node configurations with different v-core capacities. For more information about specific SKU offerings and costs, see [Power BI pricing](https://powerbi.microsoft.com/pricing/). A [cost calculator](https://powerbi.microsoft.com/calculator/) is also available. For information regarding embedded analytics capacity planning, see [Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy). To summarize:

* P nodes can be used for embedded or service deployments.

* EM nodes can be used for embedded deployments only. EM nodes do not have access to premium capabilities, such as sharing apps to users that don't have a Power BI Pro license.

| Capacity Node | Total v-cores<br/>*(Backend+frontend)*  | Backend V-Cores <sup>[1](#fn1)</sup> | Frontend V-Cores <sup>[2](#fn2)</sup> | DirectQuery/live connection limits | Max concurrent refreshes |
| --- | --- | --- | --- | --- | --- |
| EM1 (month to month) |1 v-core |0.5 v-cores, 2.5-GB RAM |0.5 v-cores |3.75 per second |  1 |
| EM2 (month to month) |2 v-cores |1 v-core, 5-GB RAM |1 v-core |7.5 per second |  2 |
| EM3 (month to month) |4 v-cores |2 v-cores, 10-GB RAM |2 v-cores | 15 | 3 |
| P1 |8 v-cores |4 v-cores, 25-GB RAM |4 v-cores |30 per second | 6 |
| P2 |16 v-cores |8 v-cores, 50-GB RAM |8 v-cores |60 per second | 12 |
| P3 |32 v-cores |16 v-cores, 100-GB RAM |16 v-cores |120 per second | 24 |
| | | | | | |

<a name="fn1">1</a>: Frontend v-cores are responsible for the web service. For example, dashboard and report document management, access rights management, scheduling, APIs, uploads and downloads, and generally for everything that relates to the user experience. 

<a name="fn2">2</a>: Backend v-cores are responsible for the heavy lifting, like query processing, cache management, running R servers, data refresh, natural language processing, real-time feeds, and server-side rendering of reports and images. With the backend v-cores, a certain amount of memory is reserved as well. Having sufficient memory becomes especially important when dealing with large data models or with a large number of active datasets.

## Workloads in Premium capacity

By default, Power BI Premium and Power BI Embedded capacities support only the workload associated with running Power BI queries in the cloud. Premium also supports additional workloads for **AI**, **Dataflows**, and **Paginated reports**. Before these workloads can use your capacity's resources, they must be enabled in the Power BI admin portal or through the Power BI REST API. Each workload has default settings for the maximum amount of memory each workload can consume. However, you can configure different memory consumption settings to determine how the workloads affect each other and consume your capacity resources. To learn more, see [Configure workloads](service-admin-premium-workloads.md).

## Power BI Report Server

Power BI Premium also includes the capability to run Power BI Report Server on-premises in your organization. To learn more, see [Get started with Power BI Report Server](report-server/get-started.md).

## Next steps

[Deploying and Managing Power BI Premium Capacities](whitepaper-powerbi-premium-deployment.md)   
[How to purchase Power BI Premium](service-admin-premium-purchase.md)   
[Power BI Premium FAQ](service-premium-faq.md)   



More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
