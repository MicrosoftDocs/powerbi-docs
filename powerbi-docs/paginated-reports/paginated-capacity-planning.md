---
title: Paginated reports capacity planning for Power BI Premium
description: Plan your Power BI Premium capacity for using it with paginated reports.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 01/21/2024
LocalizationGroup: Premium
---

# Paginated reports capacity planning

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)]

Learn how to plan your [Premium capacity](./../enterprise/service-premium-what-is.md) to get the best performance out of your [paginated reports](paginated-reports-report-builder-power-bi.md), at a minimum cost. If you're migrating to Power BI from a different business intelligence tool, consider reading the articles listed below before you decide which capacity to use.

* [Power BI migration overview](./../guidance/powerbi-migration-overview.md).

* [Migrate SQL Server Reporting Services reports to Power BI](./../guidance/migrate-ssrs-reports-to-power-bi.md) - Aimed at report authors and Power BI administrators who are interested in migrating Report Definition Language (*.rdl*) reports to Power BI from SQL Server Reporting Services (SSRS).

## Capacity planning

Calculating the type of capacity you need depends on several factors such as the number of visuals in your reports, the complexity of queries against the report and the quality of your data source or data model. You should also consider the current use of your capacity during peak times, before you add paginated reports to it.

Before you start planning which capacity you need, review the [Capacities and SKUs](./../enterprise/service-premium-what-is.md#capacities-and-skus) table, to see which resources are offered by each capacity.

When you plan your capacity, consider the following:

* The complexity of the report design. Nested [tablix](report-builder-tables-matrices-lists.md), multiple subreport and multiple row and column groups add to the complexity of the design, and require capacity resources.

* The amount of data retrieved by the report. The more data the report needs, the more resources it requires from your capacity.

* The way your report retrieves data. When you use connectors, drivers or gateways, data retrieval might take longer, require more resources and as a result become more expensive.

* When you export large reports into formats such as Excel and PDF, it requires more resources than reading every page, using toggles, and searching within the reports.

### How many users can a SKU handle?

To test paginated reports on different capacities, we executed three different types of workloads against different SKU sizes. Each workload consisted of a concurrently rendering single report, with different sizes.

* **Small** – Data aggregation table built over 100 rows from an Azure SQL data source.

* **Medium** – Data aggregation table built over 100,000 rows from an Azure SQL data source.

* **Large** - Data aggregation table built over 250,000 rows from an Azure SQL data source.

Our analysis for Power BI Premium shows that the number of concurrent users at any given time, including daily peak times, doesn't tend to exceed five percent of the total user base.  

Based on the five percent concurrency ratio, the following table describes the approximate maximum number of users that a SKU can handle, before it's [overloaded](/fabric/enterprise/throttling#track-overages-and-rejected-operations). When your capacity is overloaded, throttling will occur on your capacity. For more information, see [What happens to traffic during overload if I don't autoscale?](./../enterprise/service-premium-faq.yml#what-happens-to-traffic-during-overload-if-i-don-t-autoscale-)

| Workload   | F64 or P1 SKUs | F128 or P2 SKUs |
|------------|----------------|-----------------|
| **Small**  | 2,500 users    | 5,000 users     |
| **Medium** | 1,900 users    | 3,800 users     |
| **Large**  | 1,300 users     | 2,600 users     |

Take into consideration that the numbers in the table refer to designated capacities that don't run other operations. Your capacity may already use CPU resources for operations such as:

* Data retrieval and processing

* Other workload and background operations

* Complex data grouping and reshaping

* Data filtering

## Concurrent requests

Each workload on a capacity, including the paginated reports workload, has a maximum of 500 concurrent report renders at any given time. If your capacity is rendering 100 reports and has 200 requests for [exporting paginated reports](./../developer/embedded/export-paginated-report.md), you have 200 concurrent report render requests left.

To avoid congestion, plan your concurrent requests load in advance. If you exceed the concurrent requests limit, you’ll encounter the *Too Many Requests (429)* error.

## Using the metrics app

Using the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) you can estimate the impact of your paginated report on your capacity. The app measures your CPU usage over time, allowing you to understand how your capacity is performing.

To test your paginated report, we suggest that you use a dedicated clean capacity. A clean capacity helps isolate results from the impact of other users and workloads.

Depending on the targeted test scenario, for example average or maximum usage validation, select or create a report representative of the anticipated resource consumption, and upload it to a Premium/Fabric workspace in the capacity you created for the test.

Run the report several times, and use the metrics app to get the average CPU seconds spent to run your report. When calculating the time it took to run your report, consider the following:

* The app shows aggregate values, you might need to divide the results by the number of times you run the report.

* There are multiple Power BI items and operations that might be involved in report rendering. You might need to sum their CPU consumption.

* There are multiple Power BI items and operations that might be involved in report rendering as renders may take a long time. A long running operation in the *Timepoint* page can be displayed as a list of operations, with none of the durations longer than 30 seconds. You might need to sum the render operations CPU consumption. Sorting by the start time can help display the full history of the render.

### Calculate the max report renders

Use this formula to calculate the maximum concurrent report renders that a capacity can handle, before it [overloads](/fabric/enterprise/throttling#track-overages-and-rejected-operations). To learn more about Capacity Units (CU), SKU and Power BI v-cores, refer to [Capacity](/fabric/enterprise/licenses#capacity).

```$ \text {max concurrent report renders} = {\text {capacity units for your capacity} \times {30} \over \text {your report's CPU processing time (in seconds)} \times {8}} $```

### Calculate the max number of users

Using the estimated [five percent concurrency](#how-many-users-can-a-sku-handle) for the correlation between the number of total users, and the maximum concurrent renders, you can get the number of total users a SKU can handle.

```$ \text {max SKU users} = {\text {max concurrent report renders} \over 0.05} $```

### Calculate capacity resources for multiple reports

You can use an extended formula to estimate the capacity needed for different report usages.

Upload several paginated reports with different number of daily renders, and use the metrics app to get the average CPU processing time for each one. The sum of all your report renders per day should be equal to 100%. When you have all the information, use this formula.

```$ \text {max concurrent report renders} = {\text {capacity units for your capacity} \times {30} \over {8} \times {{\text {A renders} \times \text {A processing time}} + \text {B renders} \times \text {B processing time} + \text {...} + \text{N renders} \times \text{N processing time}}}$```

## Examples

This section includes two examples, one for the [regular calculation](#regular-calculation) and another for the [advanced calculation](#advanced-calculation).

#### Regular calculation

Let’s assume that you're running a paginated report on an *F64* or *P1* SKU that has eight cores. The total CPU usage for 10 runs is 40 seconds, so the average CPU time per reports is four seconds.

```$ 60 = {8 \times {30} \over 4} $```

When using the second formula, you get a maximum of 1,200 users.

```$ 1,200 = {60 \over 0.05} $```

For *F128* or *P2* SKUs, you can multiply these numbers by two, as the capacity has twice the number of CPU cores.

#### Advanced calculation

Let’s assume that you have three paginated reports with the daily rendering percent listed in the table below.

| Report | Number of rendered reports per day | CPU processing time (in seconds) |
|--------|------------------------------------|----------------------------------|
| A      | 60%                                |  4                               |
| B      | 30%                                | 10                               |
| C      | 10%                                | 20                               |

The formulas for an *F64* or a *P1* SKU will be:

| Value | Formula |
|-------|---------|
|Max concurrent report renders | $ ~32.4 = {8 \times {30} \over 0.6 \times{4} + 0.3 \times{10} + 0.1 \times{20}} $ |
|Total SKU users | $ ~650 = {32.4 \over 0.05} $ |

## Related content

* [What is Power BI Premium?](./../enterprise/service-premium-what-is.md)

* [What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)

* [Performance smoothing](/fabric/enterprise/throttling)

* Using Autoscale with Power BI Premium](./../enterprise/service-premium-auto-scale.md)


