---
title: Power BI embedded analytics assess load
description: Learn how to asses your capacity load so yuo can plan your Premium capacity in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/04/2024
#customer intent: As an Admin, I want to learn how to assess my capacity so that I can plan better.
---

# Assess your capacity load

This article explains how to simplify capacity planning for Power BI embedded analytics by using the [Power BI Capacity Load Assessment Tool](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/), created for automating load testing for Power BI embedded analytics capacities (*A*, *EM* or *P* SKUs).

## Load assessment tool

 The [Power BI Capacity Load Assessment Tool](https://github.com/microsoft/PowerBI-Tools-For-Capacities/tree/master/LoadTestingPowerShellTool/) can be used to for simulating interactive Power BI report traffic. It uses PowerShell to create automated load tests against your capacities, and lets you choose which reports to test, and how many concurrent users to simulate.

The tool generates load on a capacity by continuously rendering each report with new filter values (to prevent unrealistically good performance due to report caching), until the token required for authenticating the tool against the service, expires.

### Run the tool

When running the tool, keep in mind the existing load on your capacities and make sure not to run load tests during top usage times.

Here are some examples of how you can use the planning tool.

* Capacity administrators can get a better understanding of how many users their capacity can handle in a given time frame.
* Report authors can understand the user load effect, as measured with the Power BI desktop's [Performance Analyzer](../../create-reports/desktop-performance-analyzer.md).
* You can see renders happening in real time on your browser.
* Using [SQL Server Profiler](/sql/tools/sql-server-profiler/start-sql-server-profiler), you can [connect to the XMLA endpoints](../../enterprise/service-premium-connect-tools.md) of the capacities being measured, to see the queries being executed.
* See the load test effects in the premium capacity metrics app's **Datasets** page. Capacity admins can use this tool to generate load, and see how that load shows up.

### Review the test results

Review the results of your load assessment using the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app).

## Power BI capacity tools GitHub repository

The [Power BI capacity tools GitHub repository](https://github.com/microsoft/PowerBI-Tools-For-Capacities) was created to host the capacity planning tool and other future tools and utilities.

The repository is open source. Users are encouraged to contribute by adding more tools related to Power BI Premium and Embedded capacities, and improving the existing ones.

## Related content

* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Power BI Embedded performance best practices](embedded-performance-best-practices.md)
