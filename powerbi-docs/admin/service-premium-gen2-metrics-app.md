---
title: Monitor Power BI Premium Gen2 capacities with the Gen2 metrics app.
description: Learn how to use the Power BI Gen2 metrics app Metrics app, which lets you monitor Power BI Premium Gen2 capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 09/30/2021
LocalizationGroup: Premium 
---

# Use the Gen2 metrics app

The Power BI Premium utilization and metrics app is designed to provide monitoring capabilities for Power BI Gen2 Premium capacities. Monitoring your capacities is essential for making informed decisions on how to best  use your Premium capacity resources. For example, the app can help identify when to scale up your capacity or when to turn on autoscale.

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

#### Weekly trendlines

The top four visuals, titled *Weekly trendlines*, summarize the capacity's behavior over the past four weeks. This section is designed to provide a snapshot of your capacity, highlighting trends for the past four weeks. Here's a breakdown of each visual:

* **CPU** - Displays the total CPU power your capacity consumed over the past four weeks. Each data point is the aggregated sum of CPU used for the past seven days.

* **Active Artifacts** - Displays the number of Power BI items (such as reports, dashboards, and datasets) that used CPU during the past four weeks.

* **Active Users** - Displays the number of users that used the capacity during the past four weeks.

* **Cores** - Displays the number of cores used by the capacity in the past four weeks. Each data point is the maximum capacity size reported during that week. If your capacity used autoscaling or scaled up to a bigger size, the visual will show the increase.

#### Artifacts

The artifacts visual is divided into three sections. The first section includes a matrix table, the second is made up of a stacked column table, and the third section includes more visual aids.

* **Matrix table** - The matrix visual displays metrics for each Power BI item on the capacity. Items in the *Full ID* column are composed of a string that identifies them. The string's syntax is `workspace name \ item type \ item name`. You can expand each entry to show the various operations (such as queries and refreshes) the item performed.

    Here are a few examples of ways you can sort this visual:

    |Sort by          |Result   |
    |-----------------|---------|
    |CPU              |View the top CPUs that consumed Power BI items over the past two weeks |
    |Duration         |View the Power BI items that need the longest processing time during the past two weeks |
    |Users            |View the most popular Power BI items |
    |Memory           |View the Power BI items that have the largest memory footprint |
    |Throttling score |View the Power BI items that were affected the most due to overload penalty |
    |Performance delta|View the Power BI items that were affected the most due to performance degradation |

* **Stacked column table** - The stacked column table displays three values: *CPU*, *duration* (processing time) and *users*. It shows the top results for these values per Power BI item during the past two weeks. You can drill down to an individual day to identify daily patterns using an hourly view. Selecting each stacked column will filter the main matrix and the other visuals according to your selection.  

* **Visual aids** - The three visuals at the bottom of the page are *visual aids* that respond to your interactions with the visuals in the other sections. They show three important auxiliary metrics:

    * *Utilization* - Overload impact score. Showing a chart with a score representing the severity that overload had on the performance of a Power BI item. If no item is filtered, this chart shows the maximum value seen from all items at each load evaluation interval (30 seconds) in the past two weeks.

    * *Memory* - Memory footprint recorded for Power BI items over time. If no item is filtered this chart shows the maximum value seen from all items at each ten-minute time sample in the past two weeks.

    * *Degradation* - Performance profile changes. This visual shows the percentage of *fast*, *medium*, and *slow* operations from the total number of operations performed on a Power BI item, over the past two weeks. If no item is filtered, this chart shows the performance profile for *datasets* on the entire capacity.

### Evidence

This page provides information about overloads in your capacity. You can use it to establish which Power BI items (such as reports, dashboards, and datasets) cause overload, and which items are affected by this overload.

When you detect a Power BI item that causes overload, you can either optimize that item to reduce its impact on the capacity, or you can scale up the capacity.

The table below lists the visuals displayed in the evidence page according to their location in the page.

|Left  |Right  |
|---------|---------|
|**Artifacts causing overloading** - A timeline showing items that cause overloading. |**Artifacts causing overloading** - Displays the overloading items over time. |
|**Artifact utilization details** - A Utilization section that shows items that cause overload and items affected by it. |**Artifacts overloaded (seconds)** - Displays the items that were affected by overloading over time. |
|   |**Number of users overloaded** - Displays the number of users experiencing overload penalties. |

#### Artifacts causing overloading

You can visually identify the different Power BI items that cause overload, by using the **Artifacts causing overloading** timeline. Each day in the timeline displays items causing overload. Drill down to see an hourly timeline. The value shown is an aggregate of the CPU power consumed by artifacts when they overloaded the capacity.

#### Artifact utilization details

Use this visual to identify the Power BI items that generate impactful overload events. This is shown as an *Overloading score* when you select the *Overloaders* pivot. The overloading score for an artifact is derived from the severity of an overload event, and how frequently the overload event occurred over the past 14 days. This score has no physical property.

Switch to the *Overloaded artifacts* pivot to identify the items most affected by overload over the past 14 days. The overloading impact can affect either the item that's causing the overload, or other items that are hosted in the same capacity.

The Overloaded time value shown is the amount of processing time that was impacted by an overload penalty. This value is shown for each affected item, over the past 14 days.

#### Other timelines

The three timelines displayed on the right side of the evidence page show which activity created an overload penalty, which items were impacted, and how many users were impacted. Item are represented by different colors in each visual.

Below are two examples of using the timelines at the left of the evidence page, which can help to establish which action can be taken to resolve an overload.

* *Item overload that affects its own performance* - You can identify this by seeing columns with the same color in the *Artifacts causing overload* and *Artifacts overloaded* visuals. This item will likely benefit from optimization to make it run more smoothly.

* *Item overload that affects other items* - When an item causing overload is affecting other items and users in the capacity, you can optimize the item or scale the capacity. In some cases the capacity may not be able to support your level of traffic. You can easily resolve overloading from traffic spikes by using the optional autoscaling feature which will temporarily scale up the capacity. If such occurrences happen frequently, then it's possible an upgrade to a larger capacity is the best solution.

### Refresh

This page is designed to help you identify refresh CPU consumption power, and aspects concerning refresh performance.

At the top of the page there's a multi-selection pivot to allow you to focus on refreshing Power BI item types (such as reports, dashboards, and datasets), successful or failed operations, metrics of interest (CPU, Processing time or number of operations) and the type of refresh performed. Each of these pivots filters all the visuals in refresh page.

* **Refresh by artifact** - The top visual on the left shows the breakdown of the metric selected in the pivot at the top, in the past 14 days. These breakdowns can indicate which refresh optimization is more likely to reduce the capacity footprint or the data source load:

    * When you select *CPU*, you can identify whether to reduce the capacity footprint.

    * When *duration* is selected, you can identify which data source load to reduce.

* **Matrix table** - The matrix table describes all the metadata for each individual refresh operation that took place. Selecting a cell in the visual will filter the matrix to show specific events.  

    The matrix has a *ratio* column describing the ratio between CPU time and processing time. A low ratio suggests data source inefficiencies, where Power BI service is spending more time waiting for the data source, and less time processing the refresh.

* **Refresh operations** - On the right side of the refresh page, there's a timeline describing the CPU power, processing time or number of refreshes done each hour over the past 14 days. This visual is designed to help you identify patterns.

#### Release notes

The release notes page contains the release notes for each new version of the app. As the app updates automatically, it's a good idea to review the release notes from time to time.

## Limitations

* The app displays results for the last 14 or 28 days, depending on the visual.

* The app only displays memory measurements and performance breakdown for datasets.

* The Refresh page shown in the app doesn't work yet.

* The *Users* column in the visuals displays how many distinct users have been using a Power BI item (such as a report or dashboard). When you expand the measure to display user breakdown for different types of operations for this item, counting can become faulty.

### Help

This page provides a help summary for each one of the Gen2 metrics app pages. At the top there's a tab for each page in the app. Select a tab to review the help summary.

>[!NOTE]
>Each visual in the Gen2 metrics app has a **?** icon. Select this icon to learn more about the visual.

## Next steps

> [!div class="nextstepaction"]
> [Install the Gen2 metrics app](service-premium-install-gen2-app.md)
