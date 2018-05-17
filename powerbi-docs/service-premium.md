---
title: Power BI Premium - what is it?
description: Power BI Premium is dedicated capacity for your organization or team, giving you more dependable performance and larger data volumes, without requiring you to purchase per-user licenses.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 02/05/2018
ms.author: mblythe

LocalizationGroup: Premium
---
# Power BI Premium - what is it?
Power BI Premium provides resources dedicated to running the Power BI service for your organization or team, giving you more dependable performance and larger data volumes. Premium also enables widespread distribution of content without requiring you to purchase per-user licenses for viewers.

You can take advantage of Power BI Premium by assigning workspaces to a Premium capacity. *Premium capacity* is a dedicated resource for your organization. For workspaces that are not assigned to a premium capacity, these will be in a shared capacity.

*Shared capacity* is the experience you are used to with Power BI, where your workloads run on computational resources shared by other customers. In shared capacity, more limits are placed on individual users to ensure quality of the experience for all users.

[!INCLUDE [powerbi-premium-illustration](./includes/powerbi-premium-illustration.md)]

<iframe width="560" height="315" src="https://www.youtube.com/embed/lNQDkN0GXzU?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>

## Capacity tiers
There are two types of capacity within Power BI. Shared capacity and Power BI Premium capacity. Here is a look at what the differences are between them.

|  | Shared capacity | Power BI Premium capacity |
| --- | --- | --- |
| **Refresh rate** |8/day |Not restricted |
| **Isolation with dedicated hardware** |![](media/service-premium/not-available.png "Not available") |![](media/service-premium/available.png "Available") |
| **Enterprise Distribution to** ***all users*** | | |
| Apps |![](media/service-premium/not-available.png "Not available") |![](media/service-premium/available.png "Available")<sup>1</sup> |
| Embedded API and controls |![](media/service-premium/not-available.png "Not available") |![](media/service-premium/available.png "Available")<sup>2</sup> |
| **Publish Power BI reports on-premises** |![](media/service-premium/not-available.png "Not available") |![](media/service-premium/available.png "Available") |

*<sup>1</sup> Free user consumption in apps includes viewing content in web and mobile, using Q&A, Quick Insights, Cortana, export to CSV, Excel and PowerPoint. A Pro license is required for other activities that are not listed, such as creating reports on shared datasets and Analyze in Excel. Learn more about [Power BI Free vs Pro](service-free-vs-pro.md) functionality.*  
*<sup>2</sup> Future enhancements coming to Power BI Premium post GA.*

### Premium capacity
To start using a Power BI Premium capacity, you need to assign a workspace to a capacity. For more information on how to assign a workspace to a premium capacity, see [Manage Power BI Premium](service-admin-premium-manage.md).

When a workspace is backed by premium capacity, you enjoy the benefits of Power BI Premium.

* Scheduled refreshes: users prior were limited to 8x a day when scheduling refreshes with imported models. This limitation is lifted for datasets in Premium workspaces. This does not apply to the scheduled cache refresh settings for DirectQuery. Those remain the same between Premium and Shared capacities.
* Isolation with dedicated hardware – by nature of shared capacity, the performance of your reports and dashboards may be impacted by the resource demands of other workloads in the capacity, despite our safeguards against it. Conversely, Premium provides more consistent, dependable performance for your workloads by isolating it from unrelated workloads.

If an app is backed by premium capacity (i.e. it was published from an app workspace that is currently assigned to Premium), the published app can then be used by any user in your organization regardless of the license they are assigned. This means that even Power BI Free users can use those published apps.

### Shared capacity
By default, your workspace will be in shared capacity. This includes your personal *My workspace* along with App workspaces. A Shared capacity is the experience you are used to with Power BI, where your workloads run on computational resources shared by other customers.

<a name="premiumskus"/>

### Premium capacity nodes
Power BI Premium is available in node configurations with different v-core capacities. For more information about specific SKU offereings and cost, see [Power BI pricing](https://powerbi.microsoft.com/pricing/). A [cost calculator](https://powerbi.microsoft.com/calculator/) is also available. For information regarding embedded analytics capacity planning, see [Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy).

* P nodes can be used for embedded or service deployments
* EM nodes can be used for embedded deployments only
* EM1 and EM2 

>[!NOTE]
>Links in this table only operate properly for users who are Office 365 global admins - others receive a 404 error. 

| Capacity Node | Total v-cores<br/>*(Backend + frontend)* | Backend V-Cores | Frontend V-Cores | DirectQuery/live connection limits | Max page renders at peak hour | Availability |
| --- | --- | --- | --- | --- | --- | --- |
| [EM1 (month to month)](https://portal.office.com/SubscriptionDetails?OfferId=4004702D-749C-4F74-BF47-3048F1833780&adminportal=1) |1 v-core |.5 v-cores, 2.5GB RAM |.5 v-cores |3.75 per second |150-300 |Available |
| [EM2 (month to month)](https://portal.office.com/SubscriptionDetails?OfferId=4004702D-749C-4F74-BF47-3048F1833780&adminportal=1) |2 v-cores |1 v-core, 5GB RAM |1 v-core |7.5 per second |301-600 |Available |
| [EM3 (month to month)](https://portal.office.com/SubscriptionDetails?OfferId=4004702D-749C-4F74-BF47-3048F1833780&adminportal=1) |4 v-cores |2 v-cores, 10GB RAM |2 v-cores | |601-1,200 |Available |
| [P1](https://portal.office.com/SubscriptionDetails?OfferId=b3ec5615-cc11-48de-967d-8d79f7cb0af1&adminportal=1) |8 v-cores |4 v-cores, 25GB RAM |4 v-cores |30 per second |1,201-2,400 |Available ([month to month](https://portal.office.com/SubscriptionDetails?OfferId=E4C8EDD3-74A1-4D42-A738-C647972FBE81&adminportal=1) is also available) |
| [P2](https://portal.office.com/SubscriptionDetails?OfferId=062F2AA7-B4BC-4B0E-980F-2072102D8605&adminportal=1) |16 v-cores |8 v-cores, 50GB RAM |8 v-cores |60 per second |2,401-4,800 |Available |
| [P3](https://portal.office.com/SubscriptionDetails?OfferId=40c7d673-375c-42a1-84ca-f993a524fed0&adminportal=1) |32 v-cores |16 v-cores, 100GB RAM |16 v-cores |120 per second |4,801-9600 |Available |

* The frontend v-cores are responsible for the web service, dashboard and report document management, access rights management, scheduling, APIs, uploads and downloads, and generally for everything that relates to the user experience.
* The backend v-cores are responsible for the heavy lifting: query processing, cache management, running R servers, data refresh, natural language processing, real-time feeds, and server-side rendering of reports and images. With the backend v-cores, a certain amount of memory is reserved as well. Having sufficient memory becomes especially important when dealing with large data models or with a large number of active datasets.

## Power BI Report Server
Power BI Premium includes the right to run Power BI Report Server on-premises. For more infomation, see [Get started with Power BI Report Server](report-server/get-started.md).

## Next steps
[Power BI Premium FAQ](service-premium-faq.md)  
[Power BI Premium release notes](service-premium-release-notes.md)  
[How to purchase Power BI Premium](service-admin-premium-purchase.md)  
[Managing Power BI Premium](service-admin-premium-manage.md)  
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)  
[Administering Power BI in your organization](service-admin-administering-power-bi-in-your-organization.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

