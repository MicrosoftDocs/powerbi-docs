---
title: Power BI embedded analytics capacity planning
description: Learn how to plan your capacity in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 11/24/2022
ms.custom: engagement-fy23
---

# Capacity planning in Power BI embedded analytics

Calculating the type of capacity you need for a Power BI embedded analytics deployment can be complicated. The capacity you need depends on several parameters, some of which are hard to predict.

Some of the things to consider when planning your capacity are:

* The data models you're using
* The number and complexity of required queries
* The hourly distribution of your application usage
* Data refresh rates
* Other usage patterns that are hard to predict

>[!NOTE]
>This article explains how to plan what capacity you need and how to do a load testing assessment for Power BI embedded analytics A-SKUs. To plan your capacity size for *EM* or *P* SKUs see [Planning your capacity size in advance](../../enterprise/service-premium-capacity-manage-gen2.md#planning-your-capacity-size-in-advance).

When planning your capacity, take the following steps:

1. [Optimize your performance and resource consumption](#optimize-your-performance-and-resource-consumption)
1. [Determine your minimum SKU](#determine-your-minimum-sku)
1. [Assess your capacity load](#assess-your-capacity-load)
1. [Set up your capacity auto-scale](#set-up-auto-scale)

## Optimize your performance and resource consumption

Before you start any capacity planning or load testing assessment, optimize the performance and resource consumption (especially memory footprint) of your reports and datasets​.

To optimize your performance, follow the guidelines in the following resources:

* [Optimization guide for Power BI](../../guidance/power-bi-optimization.md)
* [Best practices for faster performance in Power BI embedded analytics](embedded-performance-best-practices.md)

For a more detailed tutorial on optimizing performance, see our [learn module](/learn/modules/optimize-model-power-bi/).

## Determine your minimum SKU

The following table summarizes all the limitations that are dependent on the capacity size.​
To determine the minimum SKU for your capacity, check the **Max memory per dataset (GB)** column. Also, keep in mind the [current limitations](../../enterprise/service-premium-gen2-what-is.md#considerations-and-limitations).

[!INCLUDE [Power BI capacity and SKUs](../includes/capacity-table.md)]

## Assess your capacity load

To test or assess your capacity load:

1. Create a [**Gen2 Embedded capacity** in Azure](azure-pbie-create-capacity.md) for the testing. Use a subscription associated with the same Azure AD tenant as your Power BI tenant and a user account that's signed in to that same tenant.​

2. **Assign the workspace** (or workspaces) you’ll use to test to the Gen2 capacity you created. You can do this one of the following ways:

   * *Programmatically* with the [Groups AssignToCapacity API](/rest/api/power-bi/capacities/groups-assign-to-capacity). Check the assignment status with the [Groups CapacityAssignmentStatus API](/rest/api/power-bi/capacities/groups-capacity-assignment-status) or via a *PowerShell* script (see `AssignWorkspacesToCapacity` in [this sample](https://github.com/Azure-Samples/powerbi-powershell/blob/master/Zero-Downtime-Capacity-Scale.ps1)).
   * [*Manually*](../../enterprise/service-premium-capacity-manage-gen2.md#assigning-workspaces-to-capacities) as a workspace admin or via the Admin portal as a capacity admin (see also [Assign a workspace to a capacity using a master user](./move-to-production.md#assign-a-workspace-to-a-capacity-using-a-master-user))​.

3. As the capacity admin, [install the Gen2 capacity metrics app](../../enterprise/service-premium-install-gen2-app.md). Provide the capacity ID and time (in days) to monitor, and then refresh the data. For more information, see [Use the Gen2 metrics app](../../enterprise/service-premium-gen2-metrics-app.md).​

4. Use the [Power BI Capacity Load Assessment Tool](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/) to assess your capacity needs. This GitHub repository also includes a [video walk through](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/#video-walk-through). Use this tool carefully: test with up to a few dozen concurrent simulated users and extrapolate for higher concurrent loads (hundreds or thousands, depending on your needs.)​
For more information, see [Assess your capacity load](./load-assessment-planning-tool.md).   ​
Alternatively, use other load testing tools, but treat the iFrame as a black box and simulate user activity via JS code. ​

5. Use the [Premium Gen 2 Capacity metrics app](../../enterprise/service-premium-gen2-metrics-app.md)(that you​ installed in step 3) to monitor the capacity utilization incurred via the load testing tool. Alternatively, you can monitor the capacity by checking the [Gen2 metrics](./monitor-power-bi-embedded-reference.md) in [Azure Alerts]​(/azure/azure-monitor/alerts/alerts-overview).

Consider using a larger SKU for your capacity if the actual CPU incurred on your capacity by the load testing is approaching the capacity limit.

## Set up auto-scale

The autoscaling technique described here lets you can elastically resize your A-SKU capacity to address its current memory and CPU needs. ​

* Use the [Update Capacity API](/rest/api/power-bi-embedded/capacities/update) to up-scale or down-scale the capacity SKU. ​
See this [runbook PowerShell script capacity scale-up sample](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/PowerShell%20Scripts/ScaleUp-Automation-RunBook.ps1) on how to use the API call to create your own up-scale and down-scale scripts.​

* Use [Azure Monitor alerts](/azure/azure-monitor/alerts/alerts-overview) to track the Power BI Embedded capacity metrics:​

  * Overload (*1* if capacity’s CPU has surpassed 100% and is in overloaded state, otherwise *0*) ​
  * CPU (percentage of CPU utilization) ​
  * CPU Per Workload if specific workloads (like Paginated reports) are used. ​

When these metrics hit the values specified in the Azure Monitor Alert rules, the rules will trigger the execution of an up-scale or down-scale runbook script. ​
​
For example, you can create a rule that invokes the upscale capacity runbook to update the capacity to a higher SKU if Overload = 1 or if CPU = 95%. ​
You can also create a rule that invokes a downscale capacity runbook script to update the capacity to a lower SKU if the CPU drops below 50% (say 45%).​

You could also invoke upscale and downscale runbooks programmatically on demand before and after a dataset refresh is executed. This could ensure your capacity has enough RAM (GB) for large datasets using that capacity.

## Next steps

* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Power BI Embedded performance best practices](embedded-performance-best-practices.md)
