---
title: Troubleshoot report performance in Power BI
description: Troubleshooting guide to diagnose slow report performance in Power BI.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: troubleshooting
ms.date: 04/16/2024
---

# Troubleshoot report performance in Power BI

This article provides guidance that enables developers and administrators to troubleshoot slow report performance. It applies to Power BI reports, and also Power BI paginated reports.

Slow reports can be identified by report users who experience reports that are slow to load, or slow to update when interacting with slicers or other features. When reports are hosted on a Premium capacity or [Fabric capacity](/fabric/enterprise/licenses), slow reports can also be identified by monitoring the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app). This app helps you to monitor the health and capacity of your Power BI Premium subscription.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Follow flowchart steps

Use the following flowchart to help understand the cause of slow performance, and to determine what action to take.

:::image type="content" source="media/report-performance-troubleshoot/flowchart.png" alt-text="Image shows the flowchart, which is fully described in the article text." border="false":::

There are six flowchart terminators, each describing action to take:

| **Terminator** | **Action(s)** |
|---|---|
| ![Flowchart terminator 1.](../media/legend-number/legend-number-01-fabric.svg) | &bull;&nbsp;Manage capacity. <br/>&bull;&nbsp;Scale capacity. |
| ![Flowchart terminator 2.](../media/legend-number/legend-number-02-fabric.svg) | &bull;&nbsp;Investigate capacity activity during typical report usage. |
| ![Flowchart terminator 3.](../media/legend-number/legend-number-03-fabric.svg) | &bull;&nbsp;Architecture change. <br/>&bull;&nbsp;Consider Azure Analysis Services. <br/>&bull;&nbsp;Check on-premises gateway. |
| ![Flowchart terminator 4.](../media/legend-number/legend-number-04-fabric.svg) | &bull;&nbsp;Consider Azure Analysis Services. <br/>&bull;&nbsp;Consider Power BI Premium. |
| ![Flowchart terminator 5.](../media/legend-number/legend-number-05-fabric.svg) | &bull;&nbsp;Use Power BI Desktop Performance Analyzer. <br/>&bull;&nbsp;Optimize report, model, or DAX. |
| ![Flowchart terminator 6.](../media/legend-number/legend-number-06-fabric.svg) | &bull;&nbsp;Raise support ticket. |

## Take action

The first consideration is to understand if the slow report is hosted on a Premium capacity.

### Premium capacity

When the report is hosted on a Premium capacity, use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to determine if the report-hosting capacity frequently exceeds capacity resources. When there's pressure on resources, it may be time to [manage or scale the capacity](../enterprise/service-admin-premium-manage.md) (flowchart terminator 1). When there are adequate resources, investigate capacity activity during typical report usage (flowchart terminator 2).

### Shared capacity

When the report is hosted on shared capacity, it's not possible to monitor capacity health. You'll need to take a different investigative approach.

First, determine if slow performance occurs at specific times of the day or month. If it does—and many users are opening the report at these times—consider two options:

- Increase query throughput by migrating the semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) to [Azure Analysis Services](/azure/analysis-services/analysis-services-overview), or a Premium capacity (flowchart terminator 4).
- Use Power BI Desktop [Performance Analyzer](../create-reports/desktop-performance-analyzer.md) to find out how each of your report elements—such as visuals and DAX formulas—are doing. It's especially useful to determine whether it's the query or visual rendering that's contributing to performance issues (flowchart terminator 5).

If you determine there's no time pattern, next consider if slow performance is isolated to a specific geography or region. If it is, it's likely that the data source is remote and there's slow network communication. In this case, consider:

- Changing architecture by using [Azure Analysis Services](/azure/analysis-services/analysis-services-overview) (flowchart terminator 3).
- Optimizing [on-premises data gateway performance](/data-integration/gateway/service-gateway-performance) (flowchart terminator 3).

Finally, if you determine there's no time pattern *and* slow performance occurs in all regions, investigate whether slow performance occurs on specific devices, clients, or web browsers. If it doesn't, use Power BI Desktop [Performance Analyzer](../create-reports/desktop-performance-analyzer.md), as described earlier, to optimize the report or model (flowchart terminator 5).

When you determine specific devices, clients, or web browsers contribute to slow performance, we recommend creating a support ticket through the [Power BI support page](https://powerbi.microsoft.com/support/) (flowchart terminator 6).

## Related content

For more information about this article, check out the following resources:

- [Power BI guidance](index.yml)
- [Fabric adoption roadmap](fabric-adoption-roadmap.md)
- [Monitoring report performance](monitor-report-performance.md)
- [Performance Analyzer](../create-reports/desktop-performance-analyzer.md)
- Questions? [Try asking the Power BI community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
