---
title: Power BI embedded analytics capacity planning
description: Determine which capacity to use in Power BI embedded analytics. See how to choose an SKU, assess your capacity load, and automatically resize your capacity.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 01/12/2024
ms.custom: engagement-fy23
---

# Capacity planning in Power BI embedded analytics

Calculating the type of capacity you need for a Power BI embedded analytics deployment can be complicated. The capacity you need depends on several parameters, some of which are hard to predict.

Some of the things to consider when planning your capacity are:

* The data models you're using.
* The number and complexity of required queries.
* The hourly distribution of your application usage.
* Data refresh rates.
* Other usage patterns that are hard to predict.

>[!NOTE]
>This article explains how to plan what capacity you need and how to do a load testing assessment for Power BI embedded analytics A-SKUs.

When planning your capacity, take the following steps:

1. [Optimize your performance and resource consumption](#optimize-your-performance-and-resource-consumption).
1. [Determine your minimum SKU](#determine-your-minimum-sku).
1. [Assess your capacity load](#assess-your-capacity-load).
1. [Set up your capacity autoscale](#set-up-autoscale).

## Optimize your performance and resource consumption

Before you start any capacity planning or load testing assessment, optimize the performance and resource consumption (especially the memory footprint) of your reports and semantic models.

To optimize your performance, follow the guidelines in the following resources:

* [Optimization guide for Power BI](../../guidance/power-bi-optimization.md)
* [Best practices for faster performance in Power BI embedded analytics](embedded-performance-best-practices.md)

For a detailed tutorial on optimizing performance, see the [Optimize a model for performance in Power BI](/training/modules/optimize-model-power-bi) training module.

## Determine your minimum SKU

The following table summarizes all the limitations that are dependent on the capacity size. To determine the minimum SKU for your capacity, check the *Max memory (GB)* column under the *Semantic model* header. Also, keep in mind the [current limitations](../../enterprise/service-premium-gen2-what-is.md#considerations-and-limitations).

[!INCLUDE [Power BI capacity and SKUs](../../includes/capacity-table.md)]

## Assess your capacity load

To test or assess your capacity load:

1. Create a [Premium Power BI Embedded capacity in Azure](azure-pbie-create-capacity.md) for the testing. Use a subscription associated with the same Microsoft Entra tenant as your Power BI tenant and a user account that's signed in to that same tenant.​

2. Assign the workspace (or workspaces) you'll use to test to the Premium capacity you created. You can assign a workspace in one of the following ways:

   * *Programmatically* with the [Groups AssignToCapacity API](/rest/api/power-bi/capacities/groups-assign-to-capacity). Check the assignment status with the [Groups CapacityAssignmentStatus API](/rest/api/power-bi/capacities/groups-capacity-assignment-status) or via a *PowerShell* script. For sample code, see the `AssignWorkspacesToCapacity` function in the [Zero-Downtime-Capacity-Scale sample on GitHub](https://github.com/Azure-Samples/powerbi-powershell/blob/master/Zero-Downtime-Capacity-Scale.ps1).
   * *Manually* as a workspace admin or via the Admin portal as a capacity admin. For more information, see [Assign a workspace to a capacity by using a master user](./move-to-production.md#assign-a-workspace-to-a-capacity-by-using-a-master-user).

3. As the capacity admin, [install the Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app-install). Provide the capacity ID and time (in days) to monitor, and then refresh the data.

4. Use the [Power BI Capacity Load Assessment Tool](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/) to assess your capacity needs. This GitHub repository also includes a [video walk-through](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/#video-walk-through). Use this tool carefully: test with up to a few dozen concurrent simulated users and extrapolate for higher concurrent loads (hundreds or thousands, depending on your needs.) For more information, see [Assess your capacity load](./load-assessment-planning-tool.md).
Alternatively, use other load testing tools, but treat the iFrame as a black box and simulate user activity via JavaScript code.

5. Use the *Microsoft Fabric Capacity Metrics* app that you​ installed in step 3 to monitor the capacity utilization incurred via the load testing tool. Alternatively, you can monitor the capacity by checking the [Premium metrics](./monitor-power-bi-embedded-reference.md) by using [alerts in Azure Monitor](/azure/azure-monitor/alerts/alerts-overview).

Consider using a larger SKU for your capacity if the actual CPU incurred on your capacity by the load testing is approaching the capacity limit.

## Set up autoscale

You can use the following autoscaling technique to elastically resize your A-SKU capacity to address its current memory and CPU needs.

* Use the [Capacities Update API](/rest/api/power-bi-embedded/capacities/update) to scale the capacity SKU up or down.
To see how to use the API to create your own scripts for scaling up and down, see a [runbook PowerShell script capacity scale-up sample](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/PowerShell%20Scripts/ScaleUp-Automation-RunBook.ps1).

* Use [Monitor alerts](/azure/azure-monitor/alerts/alerts-overview) to track the following Power BI Embedded capacity metrics:

  * Overload (*1* if your capacity's CPU has surpassed 100 percent and is in an overloaded state, otherwise *0*)
  * CPU (percentage of CPU utilization)
  * CPU Per Workload if specific workloads (like paginated reports) are used

* Configure the Monitor alerts so that when these metrics hit the specified values, a script run is triggered that scales the capacity up or down.

For example, you can create a rule that invokes the scale-up capacity runbook to update the capacity to a higher SKU if the overload is 1 or if the CPU value is 95 percent.
You can also create a rule that invokes a scale-down capacity runbook script to update the capacity to a lower SKU if the CPU value drops below 45 or 50 percent.

You can also invoke scale-up and scale-down runbooks programmatically on demand before and after a semantic model is refreshed. This approach ensures your capacity has enough RAM (GB) for large semantic models that use that capacity.

## Related content

* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Power BI Embedded performance best practices](embedded-performance-best-practices.md)
