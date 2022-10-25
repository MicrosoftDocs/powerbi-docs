---
title: Power BI embedded analytics capacity planning
description: Learn how to plan your capacity in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 04/24/2022
---

# Capacity planning in Power BI embedded analytics

Calculating the type of capacity you need for a Power BI embedded analytics deployment, can be complicated. The capacity you need depends on several parameters, some of them hard to predict.

Some of the things to consider when planning your capacity are:

* The data models you're using
* The number and complexity of required queries
* The hourly distribution of your application usage
* Data refresh rates
* Other usage patterns that are hard to predict

This article explains how to plan what capacity you need and do a load testing assessment for Power BI embedded analytics. This article applies to all Power BI embedded analytics gen2 capacities (*A*, *EM* or *P* SKUs).

For information about gen2 capacities and how they differ from gen1 capacities see [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md).

When planning your capacity, take the following steps:

1. [Optimize your performance and resource consumption](#optimize-your-performance-and-resource-consumption)
1. [Determine your minimum SKU](#determine-your-minimum-sku)
1. [Assess your capacity load](#assess-your-capacity-load)
1. [Set up your capacity auto-scale](#set-up-auto-scale)

## Optimize your performance and resource consumption

Before you start any capacity planning or load testing assessment you should optimize the performance and resource consumption (especially memory footprint) of your reports and datasets​.

To optimize your performance, follow the guidelines in the following resources:

* [Optimization guide for Power BI](../../guidance/power-bi-optimization.md)
* [Best practices for faster performance in Power BI embedded analytics](embedded-performance-best-practices.md)

For a more detailed tutorial on optimizing performance, see our [learn module](/learn/modules/optimize-model-power-bi/).

## Determine your minimum SKU

The following table summarizes all the limitations that are dependent on the capacity size.​
To determine the minimum SKU for your capacity, check the **Max memory per dataset (GB)** column. Also, keep in mind the [current limitations](../../enterprise/service-premium-gen2-what-is.md#considerations-and-limitations).

| Capacity SKUs | Total v-cores |Backend v-cores | Frontend v-cores | Max memory per dataset (GB)<sup>1, 2, 3</sup> | DirectQuery/Live connection (per second)<sup>1, 2</sup> | Max memory per query (GB)<sup>1, 2</sup> | Model refresh parallelism<sup>2</sup> |
| ----------------- | --- | ---- | ---- | --- | ------ | --- | ---- |
| EM1/A1            |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |   5  |
| EM2/A2            |   2 |  1   |  1   |   5 |   7.5  |  2  |  10  |
| EM3/A3            |   4 |  2   |  2   |  10 |  15    |  2  |  20  |
| P1/A4             |   8 |  4   |  4   |  25 |  30    |  6  |  40  |
| P2/A5             |  16 |  8   |  8   |  50 |  60    |  6  |  80  |
| P3/A6             |  32 | 16   | 16   | 100 | 120    | 10  | 160  |
| P4/A7<sup>4</sup> |  64 | 32   | 32   | 200 | 240    | 10  | 320  |
| P5/A8<sup>4</sup> | 128 | 64   | 64   | 400 | 480    | 10  | 640  |

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](../../enterprise/service-premium-install-gen2-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the datasets workload per capacity.

<sup>3</sup> The *Max memory per dataset (GB)* column (also called the *model size limit*) represents an upper bound for the dataset size. However, some memory must be reserved for operations such as dataset refreshes and queries. The maximum dataset size permitted on a capacity may be smaller than the numbers in this column.

<sup>4</sup> SKUs greater than 100 GB aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

## Assess your capacity load

To test or assess your capacity load:

1. Create a [**Gen2 Embedded capacity** in Azure](azure-pbie-create-capacity.md) for the testing. Use a subscription associated with the same Azure AD tenant as your Power BI tenant and a user account that's signed in to that same tenant.​

2. **Assign the workspace** (or workspaces) you’ll use to test to the Gen2 capacity you created. You can do this one of the following ways:

   * *Programmatically* with the [Groups AssignToCapacity API](/rest/api/power-bi/capacities/groups-assign-to-capacity). Check the assignment status with the [Groups CapacityAssignmentStatus API](/rest/api/power-bi/capacities/groups-capacity-assignment-status) or via a *PowerShell* script (see `AssignWorkspacesToCapacity` in [this sample](https://github.com/Azure-Samples/powerbi-powershell/blob/master/Zero-Downtime-Capacity-Scale.ps1)).
   * [*Manually*](../../enterprise/service-premium-capacity-manage-gen2.md#assigning-workspaces-to-capacities) as a workspace admin or via the Admin portal as a capacity admin (see also [Assign a workspace to a capacity using a master user](./move-to-production.md#assign-a-workspace-to-a-capacity-using-a-master-user))​.

3. As the capacity admin, install the Gen2 capacity metrics app and refresh its data after providing the capacity ID and the time in days to monitor (see relevant blog post and follow instruction in here) ​

4. Use the Power BI Capacity Load Assessment Tool on GitHub repository which also has a link to a video walk through here. Use carefully: test with up to a few dozens of concurrent simulated users and extrapolate for higher concurrent loads (100s, 1,000s)​
(Notice that the Power BI embedded analytics capacity planning doc page refers to the same tool but still refers to the old Gen1 premium capacity monitoring app that should be ignored). ​
Alternatively load test with other tools but treat the iFrame as a blackbox and simulate user activity via JS code. ​

5. Use the Premium Gen 2 Capacity metrics app (installed in step 3) to monitor your capacity utilization incurred via the load testing tool (step 4). Alternatively you can also monitor the capacity the Gen2 metrics  in Azure Alerts​

6. Consider using a larger SKU for your capacity if the actual CPU incurred on your capacity by the load testing (as reported in the capacity utilization metrics power BI app) is reaching or approaching the capacity limit.

## Set up auto-scale

### Using the planning tool

When running the tool, keep in mind the existing load on your capacities and make sure not to run load tests during top usage times.

Here are some examples of how you can use the planning tool.

* Capacity administrators can get a better understanding of how many users their capacity can handle in a given time frame.
* Report authors can understand the user load effect, as measured with Power BI desktop's [Performance Analyzer](../../create-reports/desktop-performance-analyzer.md).
* You can see renders happening in real time on your browser.
* Using SQL Server Profiler, you can [connect to the XMLA endpoints](../../enterprise/service-premium-connect-tools.md) of the capacities being measured, to see the queries being executed.
* The load test effects are visible in the premium capacity metrics app's Datasets page. Capacity admins can use this tool to generate load, and see how that load shows up.

### Reviewing the test results

To see the effects of the load test in the metrics app after the test runs, follow the instructions below. Expect up to a 15-minute lag from the time the test starts generating load, until the load is visible in the metrics.

1. Expand the **Datasets** tab of your [metrics app](../../enterprise/service-admin-premium-monitor-capacity.md) landing page.
2. Initiate an on-demand refresh by clicking **refresh now**.

    ![Power BI premium capacity metrics.](media/embedded-capacity-planning/embedded-capacity-planning.png)

## Power BI capacity tools GitHub repository

The [Power BI capacity tools GitHub repository](https://github.com/microsoft/PowerBI-Tools-For-Capacities) was created to host the capacity planning tool and other future tools and utilities.

The repository is open source and users are encouraged to contribute, add more tools related to Power BI Premium and Embedded capacities, and improve the existing ones.

## Next steps

* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Power BI Embedded performance best practices](embedded-performance-best-practices.md)
