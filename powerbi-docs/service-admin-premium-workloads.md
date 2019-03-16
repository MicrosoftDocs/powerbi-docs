---
title: How to configure workloads in Power BI Premium
description: Learn how to configure workloads in a Power BI Premium capacity.
author: minewiskan
ms.author: owend
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 03/15/2019

LocalizationGroup: Premium
---

# Configure workloads in a Premium capacity

This article describes enabling and configuring workloads for Power BI Premium capacities. By default, capacities support only the workload associated with running Power BI queries. You can also enable and configure additional workloads for **[AI (Cognitive Services)](service-cognitive-services.md)**, **[Dataflows](service-dataflows-overview.md#dataflow-capabilities-on-power-bi-premium)**, and **[Paginated reports](paginated-reports-save-to-power-bi-service.md)**.

## Default memory settings

Query workloads are optimized for and limited by resources determined by your Premium capacity SKU. Premium capacities also support additional workloads that can use your capacity's resources. Default memory values for these workloads are based on the capacity nodes available for your SKU. Max memory settings are not cumulative. Memory up to the max value specified is dynamically allocated for AI and dataflows, but is statically allocated for paginated reports. 

### Microsoft Office SKUs for software as a service (SaaS) scenarios

|                     | EM2                      | EM3                       | P1                      | P2                       | P3                       |
|---------------------|--------------------------|--------------------------|-------------------------|--------------------------|--------------------------|
| AI (Cognitive Services) | 20% default; min TBD| 20% default; min TBD | 20% default; min TBD | 20% default; min TBD | 20% default; min TBD |
| Dataflows | N/A |20% default; 12% minimum  | 20% default; 5% minimum  | 20% default; 3% minimum | 20% default; 2% minimum  |
| Paginated reports | N/A |N/A | 20% default; 10% minimum | 20% default; 5% minimum | 20% default; 2.5% minimum |
| | | | | | |

### Microsoft Azure SKUs for platform as a service (PaaS) scenarios

|                  | A1                       | A2                       | A3                      | A4                       | A5                      | A6                        |
|-------------------|--------------------------|--------------------------|-------------------------|--------------------------|-------------------------|---------------------------|
| AI (Cognitive Services) | N/A                      | 20% default; min TBD                      | 20% default; min TBD                     | 20% default; min TBD | 20% default; min TBD | 20% default; min TBD |
| Dataflows         | 40% default; 40% minimum | 24% default; 24% minimum | 20% default; 12% minimum | 20% default; 5% minimum  | 20% default; 3% minimum | 20% default; 2% minimum   |
| Paginated reports | N/A                      | N/A                      | N/A                     | 20% default; 10% minimum | 20% default; 5% minimum | 20% default; 2.5% minimum |
| | | | | | |

## Configure workloads

Maximize your capacity's available resources by enabling workloads only if they will be used. Change memory settings only when you have determined default settings are not meeting your capacity resource requirements.  

### To configure workloads in the Power BI admin portal

1. In **Capacity settings** > **PREMIUM CAPACITIES**, select a capacity.

1. Under **MORE OPTIONS**, expand **Workloads**.

1. Enable one or more workloads, and set a value for **Max Memory**.   

    
    ![Enable workloads](media/service-admin-premium-workloads/admin-portal-workloads.png)

1. Click **Apply**.

> [!NOTE]
> If enabling the paginated reports workload, paginated reports allow you to run your own code when rendering a report (such as dynamically changing text color based on content). Power BI Premium runs paginated reports in a contained space within the capacity. The maximum memory you specify to this space is used whether or not the workload is active. If you use Power BI reports or dataflows in the same capacity, make sure you set memory low enough for paginated reports that it doesn't negatively affect the other workloads. In rare circumstances, the paginated reports workload can become unavailable. In this case, the workload shows an error state in the admin portal, and users see timeouts for report rendering. To mitigate this issue, disable the workload then enable it again.

### REST API

Workloads can be enabled and assigned to a capacity by using the [Capacities](https://docs.microsoft.com/rest/api/power-bi/capacities) REST APIs.

## Monitoring workloads

The [Power BI Premium Capacity Metrics app](service-admin-premium-monitor-capacity.md) provides dataset, dataflows, and paginated reports metrics to monitor workloads enabled for your capacities. 

## Next steps

[Power BI Premium capacity resource management and optimization](service-premium-understand-how-it-works.md)   
[Self-service data prep in Power BI with Dataflows](service-dataflows-overview.md)   
[What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)   

More questions? [Ask the Power BI Community](http://community.powerbi.com/)