---
title: Troubleshoot report performance in Power BI
description: Troubleshooting guide to diagnose slow report performance in Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 03/07/2020
ms.author: v-pemyer
---

# Troubleshoot report performance in Power BI

This article provides guidance that enables developers and administrators to troubleshoot slow report performance. It applies to Power BI reports, and also Power BI paginated reports.

Slow reports can be identified by report users who experience reports that are slow to load, or slow to update when interacting with slicers or other features. When reports are hosted on a Premium capacity, slow reports can also be identified by monitoring the [Power BI Premium Metrics app](../service-admin-premium-monitor-capacity.md). This app helps you to monitor the health and capacity of your Power BI Premium subscription.

## Follow flowchart steps

Use the following flowchart to help understand the cause of slow performance, and to determine what action to take.

:::image type="content" source="media/report-performance-troubleshoot/flowchart.png" alt-text="Image shows the flowchart, which is fully described in the article text." border="true":::

There are six flowchart terminators, each describing action to take:

|Key|Action|
|---------|---------|
|:::image type="content" source="media/common/icon-red-01.png" alt-text="Flowchart terminator 1." border="true":::|Manage capacity<br />Scale capacity |
|:::image type="content" source="media/common/icon-red-02.png" alt-text="Flowchart terminator 2." border="true":::|Investigate capacity activity during typical report usage|
|:::image type="content" source="media/common/icon-red-03.png" alt-text="Flowchart terminator 3." border="true":::|Architecture change<br />Consider Azure Analysis Services<br />Check on-premises gateway|
|:::image type="content" source="media/common/icon-red-04.png" alt-text="Flowchart terminator 4." border="true":::|Consider Azure Analysis Services<br />Consider Power BI Premium|
|:::image type="content" source="media/common/icon-red-05.png" alt-text="Flowchart terminator 5." border="true":::|Use Power BI Desktop Performance Analyzer<br />Optimize report, model, or DAX|
|:::image type="content" source="media/common/icon-red-06.png" alt-text="Flowchart terminator 6." border="true":::|Raise support ticket|

1. Manage capacity; Scale capacity
2. Investigate capacity activity during typical report usage
3. Architecture change; Consider Azure Analysis Services; Check on-premises gateway
4. Consider Azure Analysis Services; Consider Power BI Premium
5. Use Power BI Desktop Performance Analyzer; Optimize report, model, or DAX
6. Raise support ticket

## Take action

The first consideration is to understand if the slow report is hosted on a Premium capacity.

### Premium capacity

When the report is hosted on a Premium capacity, use the **Power BI Premium Metrics app** to determine if the report-hosting capacity frequently exceeds capacity resources. It's the case for CPU when it frequently exceeds 80%. For memory, it's when the [active memory metric](../service-premium-metrics-app.md#the-active-memory-metric) exceeds 50. When there's pressure on resources, it may be time to [manage or scale the capacity](../service-admin-premium-manage.md) :::image type="content" source="media/common/icon-red-01.png" alt-text="Flowchart terminator 1." border="true":::. When there are adequate resources, investigate capacity activity during typical report usage :::image type="content" source="media/common/icon-red-02.png" alt-text="Flowchart terminator 2." border="true":::.

### Shared capacity

When the report is hosted on shared capacity, it's not possible to monitor capacity health. You'll need to take a different investigative approach.

First, determine if slow performance occurs at specific times of the day or month. If it does—and many users are opening the report at these times—consider two options:

- Increase query throughput by migrating the dataset to [Azure Analysis Services](/azure/analysis-services/analysis-services-overview), or a Premium capacity :::image type="content" source="media/common/icon-red-04.png" alt-text="Flowchart terminator 4." border="true":::.
- Use Power BI Desktop [Performance Analyzer](../desktop-performance-analyzer.md) to find out how each of your report elements—such as visuals and DAX formulas—are doing. It's especially useful to determine whether it's the query or visual rendering that's contributing to performance issues :::image type="content" source="media/common/icon-red-05.png" alt-text="Flowchart terminator 5." border="true":::.

If you determine there's no time pattern, next consider if slow performance is isolated to a specific geography or region. If it is, it's likely that the data source is remote and there's slow network communication. In this case, consider:

- Changing architecture by using [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) :::image type="content" source="media/common/icon-red-03.png" alt-text="Flowchart terminator 3." border="true":::.
- Optimizing [on-premises data gateway performance](/data-integration/gateway/service-gateway-performance) :::image type="content" source="media/common/icon-red-03.png" alt-text="Flowchart terminator 3." border="true":::.

Finally, if you determine there's no time pattern _and_ slow performance occurs in all regions, investigate whether slow performance occurs on specific devices, clients, or web browsers. If it doesn't, use Power BI Desktop [Performance Analyzer](../desktop-performance-analyzer.md), as described earlier, to optimize the report or model :::image type="content" source="media/common/icon-red-05.png" alt-text="Flowchart terminator 5." border="true":::.

When you determine specific devices, clients, or web browsers contribute to slow performance, we recommend creating a support ticket through the [Power BI support page](https://powerbi.microsoft.com/support/) :::image type="content" source="media/common/icon-red-06.png" alt-text="Flowchart terminator 6." border="true":::.

## Next steps

For more information about this article, check out the following resources:

- [Power BI guidance](index.yml)
- [Monitoring report performance](monitor-report-performance.md)
- [Performance Analyzer](../desktop-performance-analyzer.md)
- Whitepaper: [Planning a Power BI Enterprise Deployment](https://go.microsoft.com/fwlink/?linkid=2057861)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
