---
title: Manage Microsoft Power BI Premium capacities
description: Describes management tasks for Power BI Premium capacities.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/29/2021
ms.custom:
LocalizationGroup: Premium
---

# Managing Premium capacities

Managing Power BI Premium involves creating, managing, and monitoring Premium capacities. This article provides an overview of capacities; see [Configure and manage capacities](service-admin-premium-manage.md) for step-by-step instructions.

## Creating and managing capacities

The **Capacity Settings** page of the Power BI Admin portal displays the number of v-cores purchased and Premium capacities available. The page allows Global administrators or Power BI service administrators to create Premium capacities from available v-cores, or to modify existing Premium capacities.

> [!NOTE]
> Power BI Premium recently released a new version of Premium, called **Premium Gen2**. Premium Gen2 will simplify the management of Premium capacities, and reduce management overhead. For more information, see [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).

> [!NOTE]
> You can also get Premium Per User (PPU) licenses for individuals, which provides many of the features and capabilities of a Premium capacity, and also incorporates all functionality included with a Power BI Pro license. For more information, see [Power BI Premium Per User](service-premium-per-user-faq.yml).

When creating a Premium capacity, administrators are required to define:

- Capacity name (unique within the tenant).
- Capacity admin(s).
- Capacity size.
- Region for data residency.

At least one Capacity Admin must be assigned. Users assigned as Capacity Admins can:

* Remove assigned workspaces from the capacity
* Manage user permissions and assign:
    * Additional Capacity Admins
    * Contributors - Users who are allowed to assign workspaces to that capacity (Capacity Admins are automatically also Contributors)
* Manage Autoscale settings for that capacity
* Setup email alerts for resource utilization level
* Track capacity resources usage using the dedicated out of the box app 

Capacity Admins cannot access workspace content unless explicitly assigned in workspace permissions. They also don't have access to all Power BI admin areas (unless explicitly assigned) such as usage metrics, audit logs, or tenant settings. Importantly, Capacity Admins do not have permissions to create new capacities or scale existing capacities. Admins are assigned on a per capacity basis, ensuring that they can only view and manage capacities to which they are assigned.

Capacity size is selected from an available list of SKU options, which is constrained by the number of available v-cores in the pool. It's possible to create multiple capacities from the pool, which could be sourced from one or more purchased SKUs. For example, a P3 SKU (32 v-cores) could be used to create three capacities: one P2 (16 v-cores), and two P1 (2 x 8 v-cores). The following image shows an example setup for the fictitious Contoso organization consisting of five Premium capacities (3 x P1, and 2 x P3) with each containing workspaces, and several workspaces in shared capacity.

![An example setup for the fictitious Contoso organization](media/service-premium-capacity-manage/contoso-organization-example.png)

A Premium capacity can be assigned to a region other than the home region of the Power BI tenant, known as multi-geo. Multi-geo provides administrative control over which datacenters within defined geographic regions your Power BI content resides. The rationale for a multi-geo deployment is typically for corporate or government compliance, rather than performance and scale. Report and dashboard loading still involves requests to the home region for metadata. To learn more, see [Multi-Geo support for Power BI Premium](service-admin-premium-multi-geo.md).

Power BI service administrators and Global Administrators can modify Premium capacities. Specifically, they can:

* Change the capacity size to scale-up or scale-down resources.
* Add or remove Capacity Admins.
* Add or remove users that have assignment permissions.
* Change regions.

>[!NOTE]
>Service and global administrators do not have access to capacity metrics unless explicitly added as capacity admins.

Contributor assignment permissions are required to assign a workspace to a specific Premium capacity. The permissions can be granted to the entire organization, specific users, or groups.

By default, Premium capacities support workloads associated with running Power BI queries. Premium capacities also support additional workloads: **AI (Cognitive Services)**, **Paginated Reports**, and **Dataflows**. Each workload requires configuring the maximum memory (as a percentage of total available memory) that can be used by the workload. It's important to understand that increasing maximum memory allocations can impact the number of active models that can be hosted and the throughput of refreshes. 

Memory is dynamically allocated to dataflows, but is statically allocated to paginated reports. The reason for statically allocating the maximum memory is that paginated reports run within a secured contained space of the capacity. Care should be taken when setting paginated reports memory as it reduces available memory for loading models. To learn more, see the [Default memory settings](service-admin-premium-workloads.md#default-memory-settings).

For Premium Gen2, no memory settings or updates are required. All workloads have all the memory they need, within the limits of your capacity SKU.

Deleting a Premium capacity is possible and won't result in the deletion of its workspaces and content. Instead, it moves any assigned workspaces to shared capacity. When the Premium capacity was created in a different region, the workspace is moved to shared capacity of the home region. 

Deleting a Premium capacity is possible and won't result in the deletion of its workspaces and content. Instead, it moves any assigned workspaces to shared capacity. When the Premium capacity was created in a different region, the workspace is moved to shared capacity of the home region. 

Capacities have limited resources, defined by each capacity SKU. Resources consumption by Power BI items (such as reports and dashboards) across capacities can be tracked using the [metrics app](service-premium-install-gen2-app.md).

### Assigning workspaces to capacities

Workspaces can be assigned to a Premium capacity in the Power BI Admin portal or, for a workspace, in the **Workspace** pane.

Capacity Admins, as well as Global Administrators or Power BI service administrators, can bulk assign workspaces in the Power BI Admin portal. Bulk assigned can apply to:

- **Workspaces by users** - All workspaces owned by those users, including personal workspaces, are assigned to the Premium capacity. This will include the reassignment of workspaces when they are already assigned to a different Premium capacity. In addition, the users are also assigned workspace assignment permissions.

- **Specific workspaces**
- **The entire organization's workspaces** - All workspaces, including personal workspaces, are assigned to the Premium capacity. All current and future users are assigned workspace assignment permissions. This approach is not recommended. A more targeted approach is preferred.

You can enable Premium capabilities in a workspace by setting the proper license mode. To set a license mode, you must be both a workspace admin, and have assignment permissions. To enable Premium capabilities for P and EM SKUs, set the license mode to Premium per capacity. To enable Premium capabilities for A SKU’s, set the license mode to Embedded. To enable Premium capabilities for Premium Per User (PPU), mark the license mode as Premium Per User. To remove a workspace from Premium, mark the workspace license mode as Pro.

![Using the Workspace pane to assign a workspace to a Premium capacity](media/service-premium-capacity-manage/assign-workspace-capacity-02.png)

Workspace admins can remove a workspace from a capacity (to shared capacity) without requiring assignment permission. Removing workspaces from reserved capacities effectively relocates the workspace to shared capacity. Note that removing a workspace from a Premium capacity may have negative consequences resulting, for example, in shared content becoming unavailable to Power BI Free licensed users, or the suspension of scheduled refresh when they exceed the allowances supported by shared capacities.

In the Power BI service, a workspace assigned to a Premium capacity is easily identified by the diamond icon that adorns the workspace name.

![Identifying a workspace assigned to a Premium capacity](media/service-premium-capacity-manage/premium-diamond-icon.png)

### Planning your capacity size in advance

Different Premium capacity SKUs have different amounts of resources that are made available to support Power BI items (such as reports, dashboards and datasets) processed by each capacity. The SKUs differentiate by the number of standard v-cores they have. The most influential resources to consider when sizing in advance are:

* **CPU power** – The amount of CPU power each capacity has is a function of its base v-core and the number of [autoscale](service-premium-auto-scale.md) cores it has (purchased in-advance and allocated in advance during capacity instantiation). The CPU power exhaustion of a capacity is measured by aggregating CPU power used across all the Power BI items it processes. The more operations done against more items, the higher the CPU spend.

* **Item size** - The size of a Power BI item relates to the amount of data available for processing inside the item. Size can have multiple dimensions depending on the item. Datasets size for example is determined by the footprint the dataset has in memory while being processed. Different items may have size measures that are defined differently. The size footprint across the capacity, unlike CPU, is not aggregated across all active items but is evaluated per item only. This means a capacity can support multiple items running concurrently if neither of those items exceeds the capacity size limit.

Due to the individually enforced nature of a Power BI item's size measure, the size usually dictates how big a capacity should be. For example, if you have a P1 SKU, datasets are supported up to a [limit of 25Gb](service-premium-what-is.md#capacity-nodes). As long as your datasets do not exceed this value, the SKU should meet your needs. You can evaluate a typical dataset’s size by measuring the memory footprint of the Power BI Desktop tool. A a typical item's usage pattern will dictate its CPU power spend, which if exhausted can severely degrade report interaction performance for end-users. Therefore, once you have a typical report for evaluation, it will be beneficial to use that report in a load test, and evaluate the results to determine whether a higher SKU size or turning on autoscale is required.

#### How to decide when to turn on autoscale? 

Using the Power BI Premium [Capacity Utilization and Metrics app](service-premium-install-gen2-app.md) will indicate cases of overload impact in the *overloaded minutes* visual, in the overview page. You can evaluate the severity of the impact of those overload minutes by using the evidence page, where you can track how much impact an overload moment had, what Power BI items it impacted and how many users got affected. If based on your evaluation the impact is too high, you should turn on autoscale.  

#### How to decide when to scale up to a higher SKU?

 There are two different indicators that suggest you need to scale up your capacity:  

* Using autoscale beyond a certain degree, is not economically viable. If your autoscaling patterns lead you to consume more than 25% of your capacity size on a regular basis, it may be less costly to upgrade your capacity to a higher SKU since your capacity CPU Power requirements are significantly higher than the capacity’s original power. Here we consider over 25% as both how many cores got added and how long were they added for. For example, a P1 SKU with 8 v-cores that uses auto scale in a way that is equivalent to two additional cores consistently applied, will cost the same as a P2.

* The size of your Power BI items approach or exceed capacity limits. If the item size of any of the items reported in the metrics app approaches your capacity limit or exceeds it, operations against that item will fail. Therefore if a critical item approaches those limits (80% of the capacity size) it is advisable to consider upgrading the capacity in advance, to avoid interruption of service should that item exceed the capacity limit.

## Monitoring capacities

Monitoring Premium capacities provides administrators with an understanding of how the capacities are performing. Capacities can be monitored by using the Power BI Admin portal or the **Power BI Premium Capacity Metrics** (Power BI) app.

### Power BI Admin portal

In the Admin portal, for each capacity, the **Health** tab provides summary metrics for the capacity and each enabled workload. Metrics show an average over the past seven days.  

At the capacity level, metrics are cumulative of all enabled workloads. the following metrics are provided:

- **CPU UTILIZATION** - Provides average CPU utilization as a percentage of total available CPU for the capacity.  
- **MEMORY USAGE** - Provides average memory usage (in GB) as a total of available memory for the capacity. 

For each enabled workload, CPU utilization and memory usage are provided, as well as a number of workload specific metrics. For example, for the Dataflow workload, **Total Count** shows total refreshes for each dataflow, and **Average Duration** shows the average duration of refresh for the dataflow.

![Capacity Health tab in the portal](media/service-premium-capacity-manage/admin-portal-health-dataflows.png)

To learn more about all available metrics for each workload, see [Monitor capacities in the Admin portal](service-admin-premium-monitor-portal.md).

The monitoring capabilities in the Power BI Admin portal are designed to provide a quick summary of key capacity metrics. For more detailed monitoring, it's recommended you use the **Power BI Premium Capacity Metrics** app.

### Power BI Premium Capacity Metrics app

The [Power BI Premium Capacity Metrics app](https://appsource.microsoft.com/en-us/product/power-bi/pbi_pcmm.capacity-metrics-dxt?tab=Overview) is a Power BI app available to capacity admins and is installed like any other Power BI app. It contains a dashboard and report.

![Power BI Premium Capacity Metrics app](media/service-premium-capacity-manage/capacity-metrics-app.png)

When the app opens, the dashboard is loaded to present numerous tiles expressing an aggregated view over all capacities of which the user is a Capacity Admin. The dashboard layout includes five main sections:

- **Overview** - App version, number of capacities and workspaces
- **System Summary** - Memory and CPU metrics
- **Dataset Summary** - Number of datasets, DQ/LC, refresh, and query metrics
- **Dataflow Summary** - Number of dataflows, and dataset metrics
- **Paginated Report Summary** - Refresh and view metrics

The underlying report, from which the dashboard tiles were pinned, can be accessed by clicking on any dashboard tile. It provides a more detailed perspective of each of the dashboard sections and supports interactive filtering. 

Filtering can be achieved by setting slicers by date range, capacity, workspace and workload (report, dataset, dataflow), and by selecting elements within report visuals to cross filter the report page. Cross filtering is a powerful technique to narrow down to specific time periods, capacities, workspaces, datasets, etc. and can be very helpful when performing root cause analysis.

For detailed information about dashboard and report metrics in the app, see [Monitor Premium capacities with the app](service-admin-premium-monitor-capacity.md).

### Interpreting metrics

Metrics should be monitored to establish a baseline understanding of resource usage and workload activity. If the capacity becomes slow, it is important to understand which metrics to monitor, and the conclusions you can make.

Ideally, queries should complete within a second to deliver responsive experiences to report users and enable higher query throughput. It is usually of lesser concern when background processes - including refreshes - take longer times to complete.

In general, slow reports can be an indication of an over-heating capacity. When reports fail to load, this is an indication of an over-heated capacity. In either situation, the root cause could be attributable to many factors, including:

- **Failed queries** certainly indicate memory pressure, and that a model could not be loaded into memory. The Power BI service will attempt to load a model for 30 seconds before failing.

- **Excessive query wait times** can be due to several reasons:
  - The need for the Power BI service to first evict model(s) and then load the to-be-queried model (recall that higher dataset eviction rates alone are not an indication of capacity stress, unless accompanied by long query wait times that indicate memory thrashing).
  - Model load times (especially the wait to load a large model into memory).
  - Long running queries.
  - Too many LC\DQ connections (exceeding capacity limits).
  - CPU saturation.
  - Complex report designs with an excessive number of visuals on a page (recall that each visual is a query).

- **Long query durations** can indicate that model designs are not optimized, especially when multiple datasets are active in a capacity, and just one dataset is producing long query durations. This suggests that the capacity is sufficiently resourced, and that the in-question dataset is sub-optimal or just slow. Long running queries can be problematic as they can block access to resources required by other processes.
- **Long refresh wait times** indicate insufficient memory due to many active models consuming memory, or that a problematic refresh is blocking other refreshes (exceeding parallel refresh limits).

A more detailed explanation of how to use the metrics is covered in the [Optimizing Premium capacities](service-premium-capacity-optimize.md) article.

## Acknowledgments

This article was written by Peter Myers, Data Platform MVP and independent BI expert with [Bitwise Solutions](https://www.bitwisesolutions.com.au/).

## Next steps

> [!div class="nextstepaction"]
> [Optimizing Premium capacities](service-premium-capacity-optimize.md)   
> [!div class="nextstepaction"]
> [Configure workloads in a Premium capacity](service-admin-premium-workloads.md)   

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

Power BI has introduced Power BI Premium Gen2 as a preview offering, which improves the Power BI Premium experience with improvements in the following:
* Performance
* Per-user licensing
* Greater scale
* Improved metrics
* Autoscaling
* Reduced management overhead

For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).
