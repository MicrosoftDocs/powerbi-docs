---
title: Paginated reports capacity planning for Power BI Premium
description: Plan your Power BI Premium capacity for using it with paginated reports.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 10/18/2021
LocalizationGroup: Premium
---
# Paginated reports capacity planning

Learn how to plan your [Premium capacity](./../enterprise/service-premium-gen2-what-is.md) to get the best performance out of your [paginated reports](paginated-reports-report-builder-power-bi.md), at a minimum cost. If you're migrating to Power BI from a different business intelligence tool, consider reading the articles listed below before you decide which capacity to use.

* [Power BI migration overview](./../guidance/powerbi-migration-overview.md).

* [Migrate SQL Server Reporting Services reports to Power BI](./../guidance/migrate-ssrs-reports-to-power-bi.md) - Aimed at report authors and Power BI administrators who are interested in migrating Report Definition Language (*.rdl*) reports to Power BI from SQL Server Reporting Services (SSRS).

## Capacity planning

Calculating the type of capacity you need depends on several parameters such as the number of visuals in your reports, the complexity of queries against the report and the quality of your data source or data model. You should also consider the current use of your capacity during peak times, before you add paginated reports to it.

Before you start planning which capacity you need, review the [Capacities and SKUs](./../enterprise/service-premium-gen2-what-is.md#capacities-and-skus) table, to see which resources are offered by each capacity.

When you plan your capacity, consider the following:

* The complexity of the report design. Nested [tablix](/sql/reporting-services/report-design/tablix-data-region-report-builder-and-ssrs),  multiple subreport and multiple row and column groups add to the complexity of the design, and require capacity resources. report-builder-tables-matrices-lists

* The amount of data retrieved by the report. The more data the report needs, the more resources it requires from your capacity.

* The number of report parameters and parameter values used by your reports. More values and parameters, require more resources from your capacity.

### How many users can a SKU handle?

To test paginated reports on different capacities, we executed three different types of workloads against different SKU sizes. Each workload consisted of a concurrently rendering single report, with different sizes.

* **Small** – Data aggregation table built over 100 rows from an Azure SQL data source.

* **Medium** – Data aggregation table built over 100,000 rows from an Azure SQL data source.

* **Large** - Data aggregation table built over 250,000 rows from an Azure SQL data source.

Our analysis for Power BI Premium shows that the number of concurrent users at any given time, including daily peak times, doesn't tend to exceed five percent of the total user base.  

Based on the five percent concurrency ratio, the following table describes the approximate maximum number of users that a SKU can handle, before it's [overloaded](./../enterprise/service-premium-smoothing.md#how-to-detect-overload).

| Workload   | P1 SKU      | P2 SKU      |
|------------|-------------|-------------|
| **Small**  | 1,600 users | 3,200 users |
| **Medium** | 1,200 users | 2,400 users |
| **Large**  | 800 users   | 1,600 users |

Take into consideration that the numbers in the table refer to designated capacities that don't run other operations. Your capacity may already use CPU resources for operations such as:

* Data retrieval and processing

* Other workload and background operations

* Complex data grouping and reshaping

* Data filtering

## Using the metrics app

Using the [Gen2 metrics app](./../enterprise/service-premium-gen2-metrics-app.md) you can estimate the impact of your paginate report on your capacity. The app measures your CPU usage over time, allowing you to understand how your capacity is performing.

To test your paginated report, we suggest that you use a dedicated clean capacity. A clean capacity helps isolate results from the impact of other users and workloads. For this test, we suggest using an *A SKU*.

Depending on the targeted test scenario, for example average or maximum usage validation, select or create a report representative of the anticipated resource consumption, and upload it to a Premium workspace in the capacity you created for the test.

Run the report several times, and use the metrics app to get the average CPU seconds spent to run your report. When calculating the time it took to run your report, consider the following:

* The app shows aggregate values, you might need to divide the results by the number of times you run the report.

* There are multiple Power BI items and operations that might be involved in report rendering. You might need to sum their CPU consumption.

### Calculate the max report renders

Use this formula to calculate the maximum concurrent report renders that a capacity can handle, before it [overloads](./../enterprise/service-premium-smoothing.md#how-to-detect-overload).

$ \text {max concurrent report renders} = {\text {number of capacity SKU cores} \times {30} \over \text {your report's CPU processing time}} $

### Calculate the max number of users

Using the estimated [five percent concurrency](#how-many-users-can-a-sku-handle) for the correlation between the number of total users, and the maximum concurrent renders, you can get the number of total users a SKU can handle.

$ \text {max SKU users} = {\text {max concurrent reports renders} \over 0.05} $

### Calculate capacity resources for multiple reports

You can use an extended formula to estimate the capacity needed for different report usages.

Upload several paginated reports with different usages, and use the metric app to get the average CPU processing time for each one. When you have all the information, use this formula.

$ \text {max concurrent report renders} = {\text {number of capacity SKU cores} \times {30} \over {\text {report A CPU usage} \times \text {report A CPU processing time}} + \text {report B CPU usage} \times \text {report B CPU processing time} + \text {...report N CPU usage} \times \text{...report N CPU processing time}}$

## Examples

This section includes two examples, one for the [regular calculation](#regular-calculation) and another for the [advanced calculation](#advanced-calculation).

#### Regular calculation

Let’s assume that you're running a paginated report on a *P1 SKU* that has four cores. The total CPU usage for 20 runs is 10 seconds, so the average CPU time per reports is two seconds.

$ 60 = {4 \times {30} \over 2} $

When using the second formula, you get a maximum of 1,200 users.

$ 1,200 = {60 \over 0.05} $

For *P2 SKUs*, you can multiply these numbers by two, as the capacity has twice the number of CPU cores. The sum of all your report usages should be equal to one.

#### Advanced calculation

Let’s assume that you have three paginated reports with the following CPU usage:

| Report | CPU usage | CPU processing time (in seconds) |
|--------|-----------|----------------------------------|
| A      | 60%       |  2                               |
| B      | 30%       |  5                               |
| C      | 10%       | 10                               |

The formulas for a *P1 SKU* will be:

| Value | Formula |
|-------|---------|
|Max concurrent report renders | $ ~32.4 = {4 \times {30} \over 0.6 \times{2} + 0.3 \times{5} + 0.1 \times{10}} $ |
|Total SKU users | $ ~650 = {32.4 \over 0.05} $ |

## Next steps

>[!div class="nextstepaction"]
>[What is Power BI Premium Gen2?](./../enterprise/service-premium-gen2-what-is.md)

>[!div class="nextstepaction"]
>[What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)

>[!div class="nextstepaction"]
>[Performance smoothing](./../enterprise/service-premium-smoothing.md)

>[!div class="nextstepaction"]
>[Using Autoscale with Power BI Premium](./../enterprise/service-premium-auto-scale.md)
