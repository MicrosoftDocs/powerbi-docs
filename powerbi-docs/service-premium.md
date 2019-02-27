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
ms.date: 01/15/2019
ms.custom: seodec18

LocalizationGroup: Premium
---

# What is Microsoft Power BI Premium?

Microsoft Power BI Premium provides resources dedicated to running the Power BI service for your organization. It gives you more dependable performance and enables larger data volumes. Premium also enables widespread distribution of content without requiring you to purchase per-user Pro licenses for content consumers.  

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

| Capacity Node | Total v-cores<br/>*(Backend+frontend)*  | Backend V-Cores <sup>[1](#fn1)</sup> | Frontend V-Cores <sup>[2](#fn2)</sup> | DirectQuery/live connection limits | Max concurrent refreshes |  Availability
| --- | --- | --- | --- | --- | --- | --- | --- |
| EM1 (month to month) |1 v-core |0.5 v-cores, 2.5-GB RAM |0.5 v-cores |3.75 per second |  1 | Available |
| EM2 (month to month) |2 v-cores |1 v-core, 5-GB RAM |1 v-core |7.5 per second |  2 | Available |
| EM3 (month to month) |4 v-cores |2 v-cores, 10-GB RAM |2 v-cores | | 3 |  Available |
| P1 |8 v-cores |4 v-cores, 25-GB RAM |4 v-cores |30 per second | 6 | Available (month to month is also available) |
| P2 |16 v-cores |8 v-cores, 50-GB RAM |8 v-cores |60 per second | 12 | Available |
| P3 |32 v-cores |16 v-cores, 100-GB RAM |16 v-cores |120 per second | 24 | Available |
| | | | | | | |

<a name="fn1">1</a>: Frontend v-cores are responsible for the web service. For example, dashboard and report document management, access rights management, scheduling, APIs, uploads and downloads, and generally for everything that relates to the user experience. 

<a name="fn2">2</a>: Backend v-cores are responsible for the heavy lifting, like query processing, cache management, running R servers, data refresh, natural language processing, real-time feeds, and server-side rendering of reports and images. With the backend v-cores, a certain amount of memory is reserved as well. Having sufficient memory becomes especially important when dealing with large data models or with a large number of active datasets.

## Workloads in Premium capacity

Think of a workload in Power BI as one of the many services you can expose to users. By default, capacities for **Power BI Premium** and **Power BI Embedded** support only the workload associated with running Power BI queries in the cloud.

We now offer preview support for two additional workloads: **Paginated reports** and **Dataflows**. You enable these workloads in the Power BI admin portal or through the Power BI REST API. You also set the maximum memory each workload can consume, so that you can control how the different workloads affect each other.

### Default memory settings

The following tables show the default and minimum memory values, based on the different [capacity nodes](#premium-capacity-nodes) available. Memory is dynamically allocated to dataflows, but it is statically allocated to paginated reports. For more information, see the next section, [Considerations for paginated reports](#considerations-for-paginated-reports).

#### Microsoft Office SKUs for software as a service (SaaS) scenarios

|                     | EM3                      | P1                       | P2                      | P3                       |
|---------------------|--------------------------|--------------------------|-------------------------|--------------------------|
| Paginated reports | N/A | 20% default; 10% minimum | 20% default; 5% minimum | 20% default; 2.5% minimum |
| Dataflows | 20% default; 8% minimum  | 20% default; 4% minimum  | 20% default; 2% minimum | 20% default; 1% minimum  |
| | | | | |

#### Microsoft Azure SKUs for platform as a service (PaaS) scenarios

|                  | A1                       | A2                       | A3                      | A4                       | A5                      | A6                        |
|-------------------|--------------------------|--------------------------|-------------------------|--------------------------|-------------------------|---------------------------|
| Paginated reports | N/A                      | N/A                      | N/A                     | 20% default; 10% minimum | 20% default; 5% minimum | 20% default; 2.5% minimum |
| Dataflows         | 27% default; 27% minimum | 20% default; 16% minimum | 20% default; 8% minimum | 20% default; 4% minimum  | 20% default; 2% minimum | 20% default; 1% minimum   |

### Considerations for paginated reports

If using the paginated reports workload, keep in mind paginated reports allow you to run your own code when rendering a report (such as dynamically changing text color based on content). Given this fact, we secure Power BI Premium capacity by running paginated reports in a contained space within the capacity. We assign the maximum memory you specify to this space, whether or not the workload is active. If you use Power BI reports or dataflows in the same capacity, make sure you set memory low enough for paginated reports that it doesn't negatively affect the other workloads.

In rare circumstances, the paginated reports workload can become unavailable. In this case, the workload shows an error state in the admin portal, and users see timeouts for report rendering. To mitigate this issue, disable the workload then enable it again.

## Power BI Report Server

Power BI Premium also includes the capability to run Power BI Report Server on-premises in your organization. To learn more, see [Get started with Power BI Report Server](report-server/get-started.md).

## Next steps

[Power BI Premium FAQ](service-premium-faq.md)
[How to purchase Power BI Premium](service-admin-premium-purchase.md)
[Microsoft Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
