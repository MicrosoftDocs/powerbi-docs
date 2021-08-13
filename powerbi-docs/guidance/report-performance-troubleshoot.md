---
title: Troubleshoot report performance in Power BI
description: Troubleshooting guide to diagnose slow report performance in Power BI.
author: peter-myers
ms.author: kfollis
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: troubleshooting
ms.date: 04/15/2020
---

# Troubleshoot report performance in Power BI

This article provides guidance that enables developers and administrators to troubleshoot slow report performance. It applies to Power BI reports, and also Power BI paginated reports.

Slow reports can be identified by report users who experience reports that are slow to load, or slow to update when interacting with slicers or other features. When reports are hosted on a Premium capacity, slow reports can also be identified by monitoring the [Power BI Premium Metrics app](../admin/service-admin-premium-monitor-capacity.md). This app helps you to monitor the health and capacity of your Power BI Premium subscription.

## Follow flowchart steps

Use the following flowchart to help understand the cause of slow performance, and to determine what action to take.

:::image type="content" source="media/report-performance-troubleshoot/flowchart.png" alt-text="Image shows the flowchart, which is fully described in the article text." border="true":::

There are six flowchart terminators, each describing action to take:

|Terminator|Action(s)|
|---------|---------|
|![Flowchart terminator 1.](media/common/icon-01-red-30x30.png)|Manage capacity<br />Scale capacity |
|![Flowchart terminator 2.](media/common/icon-02-red-30x30.png)|Investigate capacity activity during typical report usage|
|![Flowchart terminator 3.](media/common/icon-03-red-30x30.png)|Architecture change<br />Consider Azure Analysis Services<br />Check on-premises gateway|
|![Flowchart terminator 4.](media/common/icon-04-red-30x30.png)|Consider Azure Analysis Services<br />Consider Power BI Premium|
|![Flowchart terminator 5.](media/common/icon-05-red-30x30.png)|Use Power BI Desktop Performance Analyzer<br />Optimize report, model, or DAX|
|![Flowchart terminator 6.](media/common/icon-06-red-30x30.png)|Raise support ticket|

## Take action

The first consideration is to understand if the slow report is hosted on a Premium capacity.

### Premium capacity

When the report is hosted on a Premium capacity, use the **Power BI Premium Metrics app** to determine if the report-hosting capacity frequently exceeds capacity resources. It's the case for CPU when it frequently exceeds 80%. For memory, it's when the [active memory metric](../admin/service-premium-metrics-app.md#the-active-memory-metric) exceeds 50. When there's pressure on resources, it may be time to [manage or scale the capacity](../admin/service-admin-premium-manage.md) (flowchart terminator 1). When there are adequate resources, investigate capacity activity during typical report usage (flowchart terminator 2).

### Shared capacity

When the report is hosted on shared capacity, it's not possible to monitor capacity health. You'll need to take a different investigative approach.

First, determine if slow performance occurs at specific times of the day or month. If it does—and many users are opening the report at these times—consider two options:

- Increase query throughput by migrating the dataset to [Azure Analysis Services](/azure/analysis-services/analysis-services-overview), or a Premium capacity (flowchart terminator 4).
- Use Power BI Desktop [Performance Analyzer](../create-reports/desktop-performance-analyzer.md) to find out how each of your report elements—such as visuals and DAX formulas—are doing. It's especially useful to determine whether it's the query or visual rendering that's contributing to performance issues (flowchart terminator 5).

If you determine there's no time pattern, next consider if slow performance is isolated to a specific geography or region. If it is, it's likely that the data source is remote and there's slow network communication. In this case, consider:

- Changing architecture by using [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) (flowchart terminator 3).
- Optimizing [on-premises data gateway performance](/data-integration/gateway/service-gateway-performance) (flowchart terminator 3).

Finally, if you determine there's no time pattern _and_ slow performance occurs in all regions, investigate whether slow performance occurs on specific devices, clients, or web browsers. If it doesn't, use Power BI Desktop [Performance Analyzer](../create-reports/desktop-performance-analyzer.md), as described earlier, to optimize the report or model (flowchart terminator 5).

When you determine specific devices, clients, or web browsers contribute to slow performance, we recommend creating a support ticket through the [Power BI support page](https://powerbi.microsoft.com/support/) (flowchart terminator 6).

## Next steps

For more information about this article, check out the following resources:

- [Power BI guidance](index.yml)
- [Monitoring report performance](monitor-report-performance.md)
- [Performance Analyzer](../create-reports/desktop-performance-analyzer.md)
- Whitepaper: [Planning a Power BI Enterprise Deployment](https://go.microsoft.com/fwlink/?linkid=2057861)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
