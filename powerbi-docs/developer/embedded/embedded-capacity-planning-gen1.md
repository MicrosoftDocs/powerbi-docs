---
title: Power BI embedded analytics capacity planning for Gen1
description: Learn how to plan your gen1 capacity in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 04/24/2022
---

# Gen1 Capacity planning in Power BI embedded analytics

Calculating the type of gen1 capacity you need for a Power BI embedded analytics deployment, can be complicated. The capacity you need depends on several parameters, some of them hard to predict.

Some of the things to consider when planning your capacity are:

* The data models you're using
* The number and complexity of required queries
* The hourly distribution of your application usage
* Data refresh rates
* More usage patterns that are hard to predict

This article explains how to simplify capacity planning for Power BI embedded analytics by using the [Power BI Capacity Load Assessment Tool](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/), created for automating load testing for Power BI embedded analytics capacities (*A*, *EM* or *P* SKUs).

## Planning tool

 The [Power BI Capacity Load Assessment Tool](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/) can help you understand how much user load your capacity can handle. It uses PowerShell to create automated load tests against your capacities, and lets you choose which reports to test, and how many concurrent users to simulate.

The tool generates load on a capacity by continuously rendering each report with new filter values (to prevent unrealistically good performance due to report caching), until the token required for authenticating the tool against the service, expires.

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
