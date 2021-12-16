---
title: Monitor Power BI Premium Gen2 capacities with the Gen2 metrics app.
description: Learn how to use the Power BI Gen2 metrics app Metrics app, which lets you monitor Power BI Premium Gen2 capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 11/01/2021
LocalizationGroup: Premium 
---

# Use the Gen2 metrics app

The Power BI Premium utilization and metrics app is designed to provide monitoring capabilities for Power BI Gen2 Premium capacities. Monitoring your capacities is essential for making informed decisions on how to best use your Premium capacity resources. For example, the app can help identify when to scale up your capacity or when to turn on [autoscale](service-premium-auto-scale.md).

>[!NOTE]
>When turning on autoscale, make sure there are no [Azure policies](/azure/governance/policy/overview) preventing autoscale from working.

The app is updated often with new features and functionalities and provides the most in-depth information into how your capacities are performing.

To [install the Gen2 metrics app](service-premium-install-gen2-app.md), you must be a capacity admin. Once installed, anyone in the organization with the right permissions can view the app.

The Gen2 metrics app has five pages:

* [Overview](#overview)

* [Evidence](#evidence)

* [Refresh](#refresh)

* [Release Notes](#release-notes)

* [Help](#help)

## Overview

This page provides an overview of the capacity performance. It's divided into the three sections listed below.

At the top of each page, the **CapacityID** field allows you to select the capacity the app shows results for.

:::image type="content" source="media/service-premium-gen2-metrics-app/overview-page.png" alt-text="A screenshot showing the overview page in the Power BI Gen2 metrics app, with the capacity I D selector highlighted.":::

### Artifacts

The *artifacts* section is made up of two visuals, one on top of the other, in the left side of the report. The top visual is a stacked column table, and below it is a matrix table.

:::image type="content" source="media/service-premium-gen2-metrics-app/artifacts-section.png" alt-text="A screenshot showing the artifacts section, in the overview page, in the Power BI Gen2 metrics app.":::

#### Multi metric column chart

A stacked column table that provides an hourly view of your capacity's usage. Drill down to a specific day to identify daily patterns. Selecting each stacked column will filter the main matrix and the other visuals according to your selection.

:::image type="content" source="media/service-premium-gen2-metrics-app/multi-metric-column-chart.png" alt-text="A screenshot showing the multi metric column chart, in the overview page, in the Power BI Gen2 metrics app.":::

The Multi metric column chart displays the four values listed below. It shows the top results for these values per Power BI item during the past two weeks.

:::image type="content" source="media/service-premium-gen2-metrics-app/multi-metric-column-chart-values.png" alt-text="A screenshot showing the multi metric column chart with the values row highlighted.":::

* **CPU** - CPU processing time in seconds.

* **Duration** - Processing time in seconds.

* **Operations** - The number of Power BI operations that took place.

* **Users** - The number of users that performed operations.

#### Matrix by artifact and operation

A matrix table that displays metrics for each Power BI item on the capacity.

:::image type="content" source="media/service-premium-gen2-metrics-app/matrix-table.png" alt-text="A screenshot showing the matrix by artifact and operation visual, in the overview page, in the Power BI Gen2 metrics app.":::

To gain a better understanding of your capacity's performance, you can sort this table according to the parameters listed below.

:::image type="content" source="media/service-premium-gen2-metrics-app/matrix-table-parameters.png" alt-text="A screenshot showing the matrix by artifact and operation visual parameter headers.":::

* **Artifacts** - A list of Power BI items active during the selected period of time. The item name is a string with the syntax: `item name \ item type \ workspace name`. You can expand each entry to show the various operations (such as queries and refreshes) the item performed.

* **CPU (s)** - CPU processing time in seconds. Sort to view the top CPUs that consumed Power BI items over the past two weeks.

* **Duration (s)** - Processing time in seconds. Sort to view the Power BI items that needed the longest processing time during the past two weeks.

* **Users** - In this table the term *users* refers to Power BI items. Sort to view the most popular Power BI items.

* **Artifact Size** - The amount of memory a Power BI item needs. Sort to view the Power BI items that have the largest memory footprint.

* **Overloaded minutes** - Displays a sum of 30 minutes increments were overloading occurred at least once. Sort to view the Power BI items that were effected the most due to overload penalty.

* **Performance delta** - Displays the performance effect on Power BI items. A positive value indicates that the performance is improving, and a negative value indicates that the performance is degrading. Sort to view the Power BI items that were effected the most due to performance degradation.

### Performance

The *performance* section is made up of four visuals, one on top of the other, in the middle of the report.

:::image type="content" source="media/service-premium-gen2-metrics-app/performance-section.png" alt-text="A screenshot showing the performance section, in the overview page, in the Power BI Gen2 metrics app.":::

#### CPU over time

Displays a chart with the selected capacity's CPU usage over time. Filters applied to the page in the [Multi metric column chart](#multi-metric-column-chart), affect this chart's display as follows:

* *No filters applied* - Columns display the peak time point per hour.

* *Filters are applied* -  The visuals displays every 30 second time point.

>[!NOTE]
>Peak is calculated as the highest number of seconds from both *interactive* and *background* operations.

To access the [Timepoint](#timepoint) page, right-click an overloaded time point, select **Drill through** and then select **TimePoint Detail**.

:::image type="content" source="media/service-premium-gen2-metrics-app/timepoint-drillthrough.png" alt-text="A screenshot showing the time point drill through option in the C P U overtime chart.":::

The...

* **Interactive CPU** - Red columns represent the number of CPU seconds used during *interactive operations* in a 30 second period.

    *Interactive* operations cover a wide range of resources triggered by Power BI users. These operations are handled by front end cores and are associated with interactive page loads.

* **Background** - Blue columns represent the number of CPU seconds used during *background* in a 30 second period.

    *Background* operations cover Power BI backend processes that are not directly triggered by users, such as data refreshes. These operations are handled by backend cores.

* **CPU Limit** - A yellow dotted line that shows the threshold of the allowed number of CPU seconds for the selected capacity. Columns that stretch above this line, represent time points where the capacity is overloaded.

#### Overloaded minutes per hour

Displays a chart with a score that represents the severity that overload had on the performance of a Power BI item. If no item is filtered, this chart shows the maximum value seen from all items at each load evaluation interval (30 seconds) in the past two weeks.

#### Artifact size

Displays the memory footprint recorded for Power BI items over time. If no item is filtered this chart shows the maximum value seen from all items at each ten minute time sample in the past two weeks.

#### Performance profile

Displays the percentage of fast, medium, and slow operations from the total number of operations performed on a Power BI item, over the past two weeks. If no item is filtered, this chart shows the performance profile for datasets on the entire capacity.

### Weekly trendlines

The *weekly trendlines* section is made up of four visuals, one on top of the other, in the right side of the report. These visuals summarize the capacity's behavior over the past four weeks. This section is designed to provide a snapshot of your capacity, highlighting trends for the past four weeks.

:::image type="content" source="media/service-premium-gen2-metrics-app/weekly-trendlines.png" alt-text="A screenshot showing the weekly trendlines section, in the overview page, in the Power BI Gen2 metrics app.":::

#### CPU

Displays the total CPU power your capacity consumed over the past four weeks. Each data point is the aggregated sum of CPU used for the past seven days.

#### Active Artifacts

Displays the number of Power BI items (such as reports, dashboards, and datasets) that used CPU during the past four weeks.

#### Active Users

Displays the number of users that used the capacity during the past four weeks.

#### Cores

Displays the number of cores used by the capacity in the past four weeks. Each data point is the maximum capacity size reported during that week. If your capacity used autoscaling or scaled up to a bigger size, the visual will show the increase.

### Evidence

This page provides information about overloads in your capacity. You can use it to establish which Power BI items (such as reports, dashboards, and datasets) cause overload, and which items are affected by this overload.

>[!NOTE]
>This page only displays data when the capacity is overloaded.

When you detect a Power BI item that causes overload, you can either optimize that item to reduce its impact on the capacity, or you can scale up the capacity.

:::image type="content" source="media/service-premium-gen2-metrics-app/evidence-page.png" alt-text="A screenshot showing the evidence page in the Power BI Gen2 metrics app.":::

The table below lists the visuals displayed in the evidence page according to their location in the page.

|Left  |Right  |
|---------|---------|
|**Artifacts causing overloading** - A timeline showing items that cause overloading. |**Artifacts causing overloading** - Displays the overloading items over time. |
|**Artifact utilization details** - A Utilization section that shows items that cause overload and items affected by it. |**Artifacts overloaded (seconds)** - Displays the items that were affected by overloading over time. |
|   |**Number of users overloaded** - Displays the number of users experiencing overload penalties. |

#### Artifacts causing overloading

You can visually identify the different Power BI items that cause overload, by using the *Artifacts causing overloading* timeline. Each day in the timeline displays items causing overload. Drill down to see an hourly timeline. The value shown is an aggregate of the CPU power consumed by artifacts when they overloaded the capacity.

#### Artifact utilization details

Use this visual to identify the Power BI items that generate impactful overload events. This is shown as an *Overloading score* when you select the *Overloaders* pivot. The overloading score for an artifact is derived from the severity of an overload event, and how frequently the overload event occurred over the past 14 days. This score has no physical property.

Switch to the *Overloaded artifacts* pivot to identify the items most affected by overload over the past 14 days. The overloading impact can affect either the item that's causing the overload, or other items that are hosted in the same capacity.

The *Overloaded* time value shown is the amount of processing time that was impacted by an overload penalty. This value is shown for each affected item, over the past 14 days.

#### Overloading windows

Use this visual to understand whether overload or autoscale events happen due to a single Power BI item, or many items. Each Power BI item is given a different color.

Each column represents a 30 second window where CPU usage for the capacity exceeded allowance. The height of the column represents the amount of CPU used during overloaded times.

The 30 second CPU allowance is determined by the number of v-cores your capacity has. When autoscale is turned on, each added autoscale CPU adds 15 seconds to the allowance. When autoscale isn't turned on, or if autoscale is fully utilized, penalties are applied to interactive operations in the next 30 second window. You can see a visualization of these penalties in the [Artifacts overloaded (seconds)](#artifacts-overloaded-(seconds)) chart.

#### Artifacts overloaded (seconds)

Use this visual to understand whether overloading Power BI items impact themselves or produce a noisy neighbor problem by impacting the performance of other items. Each item is given a different color.

The column height represents the duration time of operations subject to overload penalties, that occur when autoscale isn't turned on or used to its maximum.

#### Number of users overloaded

Use this visual to understand how widespread the impact of overload is. The visual will help you determine whether a single user is impacted by an overload event, or whether the overload event impacts multiple users.

The column height represents the number of distinct users affected when overload occurs.

### Refresh

This page is designed to help you identify refresh CPU consumption power, and aspects concerning refresh performance.

:::image type="content" source="media/service-premium-gen2-metrics-app/refresh-page.png" alt-text="A screenshot showing the refresh page in the Power BI Gen2 metrics app.":::

At the top of the page there's a multi-selection pivot allowing you to focus on refreshing the page according to the filters listed below. Each of these pivots filters all the visuals in the refresh page.

:::image type="content" source="media/service-premium-gen2-metrics-app/refresh-page-filters.png" alt-text="A screenshot showing the filters in the refresh page.":::

* **Artifact Kind** - Filter the page by Power BI item type, such as report, dataset and dashboard.

* **Status** - Filter the page by failed or successful operations.

* **Metric** - Filter the page by one of the following:

    * *CPU* - CPU consumption

     * *Duration* - Operations processing time

    * *Operations* - Number of operations

* **Operation** - Filter according to the type of operation selected.

#### Refresh by artifact

Displays the breakdown of the metric selected in the pivot at the top, in the past 14 days. These breakdowns can indicate which refresh optimization is more likely to reduce the capacity footprint or the data source load:

* When you select *CPU*, you can identify whether to reduce the capacity footprint.

* When you select *Duration*, you can identify which data source load to reduce.

#### Duration

Each column represents the number of seconds it took to compete a single operation per hour, over a 14 day period.

#### CPU

Each column represents the number of CPU seconds used to compete a single operation per hour, over a 14 day period.

#### Operations

Each column represents the number of seconds it took to compete a single operation per hour, over a 14 day period.

#### Matrix table

The matrix table describes all the metadata for each individual refresh operation that took place. Selecting a cell in the visual will filter the matrix to show specific events.  

The matrix has a *Ratio* column describing the ratio between CPU time and processing time. A low ratio suggests data source inefficiencies, where Power BI service is spending more time waiting for the data source, and less time processing the refresh.

#### Refresh operations

On the right side of the refresh page, there are two visuals designed to help you identify patterns.

* **Timeline** - Displays the number of operations per day, for the past 14 days.

* **Score card** - Displays the total number of performed operations.

### Timepoint

This page provides a detailed view of every operation resulted in CPU activity in a given timepoint. Use this page to understand which interactive and background operations contributed the most to CPU usage.

To get to this page follow these instructions:

1. In the **Overview** page, right-click the  
You can only get to this page by using the drill through feature from the visual in the top right corner of the *Overview* and *Evidence* pages.

When the total combined CPU for interactive and background operations exceeds the 30 second timepoint allowance, the capacity is overloaded and depending on whether autoscale is enabled or not, throttling is applied.

* **Autoscale is enabled** - If the capacity has autoscale enabled, a new v-core will get added for the next 24 hours, and will be shown as an increased value in the CPU limit line.

    >[!NOTE]
    >When autoscale is enabled, if the capacity reaches the maximum number of v-cores allowed by the autoscale operation, throttling is applied.

* **Autoscle isn't enabled** - If autoscale is not enabled, throttling gets applied to every interactive operation in the subsequent timepoint.

#### Top row visuals

This section describes the operations of the visuals in the top row of the timepoint page.

* **Top left visual** - Displays the timepoint used to drill through to this page.

* **Heartbeat line chart** - Shows a 60 minute window of CPU activity. Use this visual to establish the duration of peaks and troughs.

    * *Vertical red line* - The timepoint you currently drilled to view. The visual shows the 30 minutes of CPU activity leading to the selected timepoint, as well as the 30 minutes of CPU activity after the selected time point.

    * *Blue line* - Total CPUs.

    * *Yellow line* - The capacity allowance.

    >[!NOTE]
    >If the blue line is above the yellow line the capacity is overloaded.

* **Interactive operations card** - Displays the total number of interactive operations that contributed to the CPU's activity during this timepoint.

* **Background operations card** - Displays the total number of background operations that contributed to the CPU's activity during this timepoint.

* **SKU card** - Displays the current SKU.

* **Capacity CPU card** - Displays the total number of CPU seconds allowed for this capacity, for a given 30 second timepoint window.

#### Interactive Operations

A table showing every interactive operation that contributed CPU usage in the timepoint used to drill through to this page. Once an interactive operation completes, 100% of the CPU seconds used by the interactive operation get attributed to the timepoint window.

* **Artifact** - The name of the Power BI item, its type, and its workspace details.

* **Operation** - The type of interactive operation.

* **Start** - The time the interactive operation began.

* **End** - The time the interactive operation finished.

* **Status** - An indication showing if the operation succeeded or failed.

    >[!NOTE]
    >CPU usage for failed operations is counted when determining if the capacity is in overload.

* **User** - The name of the user attributed to the interactive operation.

* **Duration** - The number of seconds the interactive operation took to complete.

* **CPU** - The number of CPU seconds used by the interactive operation. This metric contributes to determine if the capacity exceeds the total number of CPU seconds allowed for the capacity.

* **Throttling** - The number of seconds of throttling applied to this interactive operation because of the capacity being overloaded in the previous timepoint.

* **% Of Capacity** - Interactive CPU operations as a proportion of the overall capacity allowance.

#### Background Operations

A table showing every background operation that contributed CPU usage to the timepoint window used to drill through to this page. Every background operation that completed in the prior 24 hours (defined as a 2,880 x 30 second timepoint window), contributes a small portion of its total usage to the CPU value. This means that a background operation that completed the previous day can contribute some CPU activity to determine if the capacity is in overload.

* **Artifact** - The name of the Power BI item, its type, and its workspace details.

* **Operation** - The type of background operation.

* **Start** -The time the background operation began.

* **End** - The time the background operation finished.

* **Status** - An indication showing if the operation succeeded or failed.

    >[!NOTE]
    >CPU usage for failed operations is counted when determining if the capacity is in overload.

* **Duration** - The number of seconds the background operation took to complete.

* **Total CPU** -  The total number of CPU seconds used by the background operation. A small portion of this metric contributes to determine if the capacity exceeds the total number of CPU seconds for the current timepoint window.

* **Timepoint CPU** - This metric is the *total CPU* metric divided by 2,880, and is used to determine how much CPU the background operation contributes to this timepoint.  

### Release notes

The release notes page contains the release notes for each new version of the app. As the app updates automatically, it's a good idea to review the release notes from time to time.

### Help

This page provides a help summary for each one of the Gen2 metrics app pages. At the top there's a tab for each page in the app. Select a tab to review the help summary.

>[!NOTE]
>Each visual in the Gen2 metrics app has a **?** icon. Select this icon to learn more about the visual.

## Considerations and limitations

* The app displays results for the last 14 or 28 days, depending on the visual.

* The app only displays memory measurements and performance breakdown for datasets.

* The app only supports monitoring datasets that use [import mode](./../connect-data/service-dataset-modes-understand.md). To monitor [Power BI service live connections](./../connect-data/desktop-report-lifecycle-datasets.md) use *Azure Analysis Services*.


* The Refresh page shown in the app doesn't work yet.

* The *Users* column in the visuals displays how many distinct users have been using a Power BI item (such as a report or dashboard). When you expand the measure to display user breakdown for different types of operations for this item, counting can become faulty.

## Next steps

> [!div class="nextstepaction"]
> [Install the Gen2 metrics app](service-premium-install-gen2-app.md)
