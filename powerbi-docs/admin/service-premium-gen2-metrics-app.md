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

## App pages

The Gen2 metrics app has five pages:

* [Overview](#overview)

* [Evidence](#evidence)

* [Refresh](#refresh)

* [Release Notes](#release-notes)

* [Help](#help)

The pages labeled **Evidence** and **Refresh** don't work yet.

### Overview

This page provides an overview of the capacity performance. It's divided into the three sections listed below.

At the top of each page, the **CapacityID** field allows you to select the capacity the app shows results for.

:::image type="content" source="media/service-premium-gen2-metrics-app/overview-page.png" alt-text="A screenshot showing the overview page in the Power BI Gen2 metrics app, with the capacity I D selector highlighted.":::

#### Weekly trendlines

The top four visuals, titled *Weekly trendlines*, summarize the capacity's behavior over the past four weeks. This section is designed to provide a snapshot of your capacity, highlighting trends for the past four weeks. Here's a breakdown of each visual:

* **CPU** - Displays the total CPU power your capacity used over the past week to process Power BI reports, dashboards and datasets.

    :::image type="content" source="media/service-premium-gen2-metrics-app/overview-page-cpu.png" alt-text="A screenshot showing the C P U tab in the weekly trendlines visual, in the overview page, in the Power BI Gen2 metrics app.":::

* **Duration** - Displays the 

    :::image type="content" source="media/service-premium-gen2-metrics-app/overview-page-duration.png" alt-text="A screenshot showing the duration tab in the weekly trendlines visual, in the overview page, in the Power BI Gen2 metrics app.":::

* **Operations** - Displays the number of users that used the capacity during the past four weeks.

    :::image type="content" source="media/service-premium-gen2-metrics-app/overview-page-operations.png" alt-text="A screenshot showing the operations tab in the weekly trendlines visual, in the overview page, in the Power BI Gen2 metrics app.":::

* **Users** - Displays the number of distinct users who used the capacity during each seven day period.

    :::image type="content" source="media/service-premium-gen2-metrics-app/overview-page-users.png" alt-text="A screenshot showing the users tab in the weekly trendlines visual, in the overview page, in the Power BI Gen2 metrics app.":::

#### Artifacts

The artifacts visual is a stacked column table that displays the top results per Power BI item during the past two weeks. You can drill down to an individual day to identify daily patterns using an hourly view.

:::image type="content" source="media/service-premium-gen2-metrics-app/overview-page-artifacts.png" alt-text="A screenshot showing the artifact visual, in the overview page, in the Power BI Gen2 metrics app.":::

Here are a few examples of ways you can sort this visual:

|Sort by            |Result   |
|-------------------|---------|
|CPU                |View the top CPUs that consumed Power BI items over the past two weeks |
|Duration           |View the Power BI items that need the longest processing time during the past two weeks |
|Users              |View the most popular Power BI items |
|Artifact size      |  |
|Overloaded minutes |  |
|Performance delta  |View the Power BI items that were affected the most due to performance degradation |

### Evidence

This page provides information about overloads in your capacity. You can use it to establish which Power BI items (such as reports, dashboards, and datasets) cause overload, and which items are affected by this overload.

>[!NOTE]
>This page only displays data when the capacity is overloaded.

When you detect a Power BI item that causes overload, you can either optimize that item to reduce its impact on the capacity, or you can scale up the capacity.

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

#### Other timelines

The three timelines displayed on the right side of the evidence page show which activity created an overload penalty, which items were impacted, and how many users were impacted. Items are represented by different colors in each visual.

Below are two examples of using these timelines, to establish which action can be taken to resolve an overload.

* *Item overload that affects its own performance* - You can identify this by seeing columns with the same color in the *Artifacts causing overload* and *Artifacts overloaded* visuals. This item will likely benefit from optimization to make it run more smoothly.

* *Item overload that affects other items* - When an item causing overload is affecting other items and users in the capacity, you can optimize the item or scale the capacity. In some cases the capacity may not be able to support your level of traffic. You can easily resolve overloading from traffic spikes by using the optional autoscaling feature which will temporarily scale up the capacity. If such occurrences happen frequently, it's most likely that an upgrade to a larger capacity is the best solution.

### Refresh

This page is designed to help you identify refresh CPU consumption power, and aspects concerning refresh performance.

At the top of the page there's a multi-selection pivot allowing you to focus on refreshing Power BI item types (such as reports, dashboards, and datasets), successful or failed operations, metrics of interest (CPU, Processing time or number of operations) and the type of refresh performed. Each of these pivots filters all the visuals in the refresh page.

* **Refresh by artifact** - The top visual on the left shows the breakdown of the metric selected in the pivot at the top, in the past 14 days. These breakdowns can indicate which refresh optimization is more likely to reduce the capacity footprint or the data source load:

    * When you select *CPU*, you can identify whether to reduce the capacity footprint.

    * When you select *duration*, you can identify which data source load to reduce.

* **Matrix table** - The matrix table describes all the metadata for each individual refresh operation that took place. Selecting a cell in the visual will filter the matrix to show specific events.  

    The matrix has a *ratio* column describing the ratio between CPU time and processing time. A low ratio suggests data source inefficiencies, where Power BI service is spending more time waiting for the data source, and less time processing the refresh.

* **Refresh operations** - On the right side of the refresh page, there's a timeline describing the CPU power, processing time or number of refreshes done each hour over the past 14 days. This visual is designed to help you identify patterns.

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
