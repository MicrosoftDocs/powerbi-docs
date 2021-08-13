---
title: Optimization guide for Power BI
description: Optimization guide for Power BI.
author: peter-myers
ms.author: kfollis
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 04/02/2021
---

# Optimization guide for Power BI

This article provides guidance that enables developers and administrators to produce and maintain optimized Power BI solutions. You can optimize your solution at different architectural layers. Layers include:

- The data source(s)
- The data model
- Visualizations, including dashboards, Power BI reports, and Power BI paginated reports
- The environment, including capacities, data gateways, and the network

## Optimizing the data model

The data model supports the entire visualization experience. Data models are either external-hosted or internal-hosted, and in Power BI they are referred to as _datasets_. It's important to understand your options, and to choose the appropriate dataset type for your solution. There are three dataset modes: Import, DirectQuery, and Composite. For more information, see [Datasets in the Power BI service](../connect-data/service-datasets-understand.md), and  [Dataset modes in the Power BI service](../connect-data/service-dataset-modes-understand.md).

For specific dataset mode guidance, see:

- [Data reduction techniques for Import modeling](import-modeling-data-reduction.md)
- [DirectQuery model guidance in Power BI Desktop](directquery-model-guidance.md)
- [Composite model guidance in Power BI Desktop](composite-model-guidance.md)

## Optimizing visualizations

Power BI visualizations can be dashboards, Power BI reports, or Power BI paginated reports. Each has different architectures, and so each has their own guidance. 

### Dashboards

It's important to understand that Power BI maintains a cache for your dashboard tiles—except live report tiles, and streaming tiles. For more information, see [Data refresh in Power BI (Tile refresh)](../connect-data/refresh-data.md#tile-refresh). If your dataset enforces dynamic [row-level security (RLS)](../admin/service-admin-rls.md), be sure to understand performance implications as tiles will cache on a per-user basis.

When you pin live report tiles to a dashboard, they're not served from the query cache. Instead, they behave like reports, and make queries to back-end cores on the fly.

As the name suggests, retrieving the data from the cache provides better and more consistent performance than relying on the data source. One way to take advantage of this functionality is to have dashboards be the first landing page for your users. Pin often-used and highly requested visuals to the dashboards. In this way, dashboards become a valuable "first line of defense", which delivers consistent performance with less load on the capacity. Users can still click through to a report to analyze details.

For DirectQuery and live connection datasets, the cache is updated on a periodic basis by querying the data source. By default, it happens every hour, though you can configure a different frequency in the dataset settings. Each cache update will send queries to the underlying data source to update the cache. The number of queries that generate depends on the number of visuals pinned to dashboards that rely on the data source. Notice that if row-level security is enabled, queries are generated for each different security context. For example, consider there are two different roles that categorize your users, and they have two different views of the data. During query cache refresh, Power BI generates two sets of queries.

### Power BI reports

There are several recommendations for optimizing Power BI report designs.

> [!NOTE]
> When reports are based on a DirectQuery dataset, for additional report design optimizations, see [DirectQuery model guidance in Power BI Desktop (Optimize report designs)](directquery-model-guidance.md#optimize-report-designs).

#### Apply the most restrictive filters

The more data that a visual needs to display, the slower that visual is to load. While this principle seems obvious, it's easy to forget. For example: suppose you have a large dataset. Atop of that dataset, you build a report with a table. End users use slicers on the page to get to the rows they want—typically, they're only interested in a few dozen rows.

A common mistake is to leave the default view of the table unfiltered—that is, all 100M+ rows. The data for these rows loads into memory and is uncompressed at every refresh. This processing creates huge demands for memory. The solution: use the "Top N" filter to reduce the max number of items that the table displays. You can set the max item to larger than what users would need, for example, 10,000. The result is the end-user experience doesn't change, but memory use drops greatly. And most importantly, performance improves.

A similar design approach to the above is suggested for every visual in your report. Ask yourself, is all the data in this visual needed? Are there ways to filter the amount of data shown in the visual with minimal impact to the end-user experience? Remember, tables in particular can be expensive.

#### Limit visuals on report pages

The above principle applies equally to the number of visuals added to a report page. It's highly recommended you limit the number of visuals on a particular report page to only what is necessary. [Drillthrough pages](report-drillthrough.md) and [report page tooltips](report-page-tooltips.md) are great ways to provide additional details without jamming more visuals onto the page.

#### Evaluate custom visual performance

Be sure to put each custom visual through its paces to ensure high performance. Poorly optimized Power BI visuals can negatively affect the performance of the entire report.

### Power BI paginated reports

Power BI paginated report designs can be optimized by applying best practice design to the report's data retrieval. For more information, see [Data retrieval guidance for paginated reports](report-paginated-data-retrieval.md).

Also, ensure your capacity has sufficient memory allocated to the [paginated reports workload](../admin/service-admin-premium-workloads.md#paginated-reports).

## Optimizing the environment

You can optimize the Power BI environment by configuring capacity settings, sizing data gateways, and reducing network latency.

### Capacity settings

When using capacities—available with Power BI Premium (P SKUs), Premum Per User (PPU) licenses, or
Power BI Embedded (A SKUs, A4-A6)—you can manage capacity settings. For more information, see [Managing Premium capacities](../admin/service-premium-capacity-manage.md). For guidance on how to optimize your capacity, see [Optimizing Premium capacities](../admin/service-premium-capacity-optimize.md).

### Gateway sizing

A gateway is required whenever Power BI must access data that isn't accessible directly over the Internet. You can install the [on-premises data gateway](../connect-data/service-gateway-onprem.md) on a server on-premises, or VM-hosted Infrastructure-as-a-Service (IaaS).

To understand gateway workloads and sizing recommendations, see [On-premises data gateway sizing](gateway-onprem-sizing.md).

### Network latency

Network latency can impact report performance by increasing the time required for requests to reach the Power BI service, and for responses to be delivered. Tenants in Power BI are assigned to a specific region.

> [!TIP]
> To determine where your tenant is located, see [Where is my Power BI tenant located?](../admin/service-admin-where-is-my-tenant-located.md)

When users from a tenant access the Power BI service, their requests always route to this region. As requests reach the Power BI service, the service may then send additional requests—for example, to the underlying data source, or a data gateway—which are also subject to network latency.

Tools such as [Azure Speed Test](https://azurespeedtest.azurewebsites.net/) provide an indication of network latency between the client and the Azure region. In general, to minimize the impact of network latency, strive to keep data sources, gateways, and your Power BI cluster as close as possible. Preferably, they reside within the same region. If network latency is an issue, try locating gateways and data sources closer to your Power BI cluster by placing them inside cloud-hosted virtual machines.

## Monitoring performance

You can monitor performance to identify bottlenecks. Slow queries—or report visuals—should be a focal point of continued optimization. Monitoring can be done at design time in Power BI Desktop, or on production workloads in Power BI Premium capacities. For more information, see [Monitoring report performance in Power BI](monitor-report-performance.md).

## Next steps

For more information about this article, check out the following resources:

- [Power BI guidance](index.yml)
- [Monitoring report performance](monitor-report-performance.md)
- Whitepaper: [Planning a Power BI Enterprise Deployment](https://go.microsoft.com/fwlink/?linkid=2057861)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)




