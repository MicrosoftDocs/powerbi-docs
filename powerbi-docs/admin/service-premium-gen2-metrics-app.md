---
title: Monitor Power BI Premium Gen2 capacities with the Gen2 metrics app.
description: Learn how to use the Power BI Gen2 metrics app Metrics app, which lets you monitor Power BI Premium Gen2 capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 08/17/2021
LocalizationGroup: Premium 
---

# Use the Gen2 metrics app (preview)

The Power BI Premium utilization and metrics app is designed to provide monitoring capabilities for Power BI Gen2 Premium capacities. Monitoring your capacities is essential for making informed decisions on how to best  utilize your Premium capacity resources. For example, the app can help identify when to scale up your capacity or when to turn on autoscale.

The app is updated regularly with new features and functionalities and provides the most in-depth information into how your capacities are performing.

To [install the Gen2 metrics app](service-premium-install-gen2-app.md), you must be a capacity admin. Once installed, anyone in the organization with the right permissions can view the app.

## App pages

The Gen2 metrics app has two pages:

* [Overview](#overview)

* [Release Notes](#release-notes)

### Overview

This page provides an overview of the capacity performance. It is divided into the three sections listed below.

At the top of each page, the **CapacityID** field allows you to select the capacity the app shows results for.

#### Weekly trendlines

The top four visuals, titled *Weekly trendlines*, summarize the capacity's behavior over the past four weeks. This section is designed to provide a snapshot of your capacity, highlighting trends for the past four weeks. Here's a breakdown of each visual:

* **CPU** - Displays the total CPU power your capacity consumed over the past four weeks. Each data point is the aggregated sum of CPU used for the past seven days.

* **Active Artifacts** - Displays the number of Power BI items (such as reports, dashboards and datasets) that used CPU during the past four weeks.

* **Active Users** - Displays the number of users that used the capacity during the past four weeks.

* **Cores** - Displays the number of cores used by the capacity in the past four weeks. Each data point is the maximum capacity size reported during that week. If your capacity used autoscaling or scaled up to a bigger size, the visual will show the increase.

#### Artifacts

The artifacts visual is divided into three sections. The first section includes a matrix table, the second is made up of a stacked column table and the third section includes additional visual aids.

* **Matrix table** - The matrix visual displays metrics for each Power BI item on the capacity. Items in the *Full ID* column are comprised of a string that identifies them. The string's syntax is `workspace name \ item type \ item name`. You can expand each entry to show the various operations (such as queries and refreshes) the item performed.

    Here are a few examples of ways you can sort this visual:

    |Sort by          |Result   |
    |-----------------|---------|
    |CPU              |View the top CPUs that consumed Power BI items over the past two weeks |
    |Duration         |View the Power BI items that need the longest processing time during the past two weeks |
    |Users            |View the most popular Power BI items |
    |Memory           |View the Power BI items that have the largest memory footprint |
    |Throttling score |View the Power BI items that were impacted the most due to overload penalty |
    |Performance delta|View the Power BI items that were impacted the most due to performance degradation |

* **Stacked column table** - The stacked column table displays three values: *CPU*, *duration* (processing time) and *users*. It shows the top results for these values per Power BI item during the past two weeks. You can drill down to an individual day to identify daily patterns using an hourly view. Selecting each stacked column will filter the main matrix and the other visuals according to your selection.  

* **Visual aids** - The three visuals at the bottom of the page are *visual aids* that respond to your interactions with the visuals in the other sections. They show three important auxiliary metrics:

    * *Utilization* - Overload impact score. Showing a chart with a score representing the severity that overload had on the performance of a Power BI item. When no item is filtered, this chart shows the maximum value seen from all items at each load evaluation interval (30 seconds) in the past two weeks.

    * *Memory* - Memory footprint recorded for Power BI items over time. When no item is filtered this chart shows the maximum value seen from all items at each ten minute time sample in the past two weeks.

    * *Degradation* - Performance profile changes. This visual shows the percentage of *fast*, *medium* and *slow* operations from the total number of operations performed on a Power BI item, over the past two weeks. When no item is filtered this chart shows the performance profile for *datasets* on the entire capacity.

#### Release notes

The release notes page contains the release notes for each new version of the app. As the app updates automatically, it's a good idea to review the release notes from time to time.

## Limitations

* The app displays results for the last 14 or 28 days, depending on the visual.

* The app only displays memory measurements and performance breakdown for datasets.

* Refresh Page does not work.

* The *Users* column in the visuals displays how many distinct users have been using a Power BI item (such as a report or dashboard). When you expand the measure to display user breakdown for different types of operations for this item, counting can become faulty.

## Next steps

> [!div class="nextstepaction"]
> [Install the Gen2 metrics app](service-premium-install-gen2-app.md)
