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
ms.date: 02/26/2019

LocalizationGroup: Premium
---

# Configure workloads in a Premium capacity

## Configure workloads

By default, capacities support only the workload associated with running Power BI queries. Query workloads are optimized for and limited by resources determined by your Premium capacity SKU. 

For P1-P3 SKUs, you can also enable and configure additional workloads for [Dataflows](service-dataflows-overview.md) and [Paginated reports](paginated-reports-report-builder-power-bi.md). If enabled, these workloads can impact capacity resources. To learn more, see [Premium capacity resource management and optimization](service-premium-understand-how-it-works.md).

### To configure workloads in the Power BI admin portal

1. In **Capacity settings** > **PREMIUM CAPACITIES**, select a capacity.

1. Under **MORE OPTIONS**, expand **Workloads**.

1. Enable one or more workloads, and set a value for **Max Memory**.   
Max memory settings are not cumulative. They represent a percentage of overall memory that *can be used* for that workload.

    
    ![Enable workloads](media/premium-admin-configure-workloads/admin-portal-workloads.png)

1. Click **Apply**.


## Next steps

[Power BI Premium capacity resource management and optimization](service-premium-understand-how-it-works.md)   
[Self-service data prep in Power BI with Dataflows](service-dataflows-overview.md)   
[What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)   

More questions? [Ask the Power BI Community](http://community.powerbi.com/)