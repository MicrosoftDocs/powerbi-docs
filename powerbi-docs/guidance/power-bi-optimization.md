---
title: "Optimization guide for Power BI"
description: "This article provides guidance that enables developers and administrators to produce and maintain optimized Power BI solutions. You can optimize your solution at different architectural layers."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Optimization guide for Power BI

This article provides guidance that enables developers and administrators to produce and maintain optimized Power BI solutions. You can optimize your solution at different architectural layers. Layers include:

- The data source(s)
- The data model
- Visualizations, including dashboards, Power BI reports, and Power BI paginated reports
- The environment, including capacities, data gateways, and the network

## Optimizing the data model

The data model supports the entire visualization experience. Data models are either hosted in the Power BI ecosystem or externally (by using DirectQuery or Live Connection), and in Power BI they are referred to as *semantic models*. It's important to understand your options, and to choose the appropriate semantic model type for your solution. There are three semantic model table storage modes: Import, DirectQuery, and Composite. For more information, see [Semantic models in the Power BI service](../connect-data/service-datasets-understand.md), and  [Semantic model modes in the Power BI service](../connect-data/service-dataset-modes-understand.md).

For specific semantic model table storage mode guidance, see:

- [Data reduction techniques for Import modeling](import-modeling-data-reduction.md)
- [DirectQuery model guidance in Power BI Desktop](directquery-model-guidance.md)
- [Composite model guidance in Power BI Desktop](composite-model-guidance.md)

### Optimizing for report authors and model consumers

The semantic model is the foundation of all reporting in Power BI. Consumers of the semantic model can create Power BI reports in Power BI Desktop by connecting to a published semantic model or connecting to data and creating a local semantic model. The semantic model can also be used to create Power BI reports in the browser, create [Power BI explorations](../consumer/explore-data-service.md), create [paginated reports](../consumer/end-user-paginated-report.md), create [DAX queries](../transform-model/dax-query-view.md), and create reports in Excel with [Analyze in Excel](../collaborate-share/service-connect-power-bi-datasets-excel.md), [connecting to Power BI in Excel](../collaborate-share/service-connect-excel-power-bi-datasets.md), or [exporting data from a report visual](../visuals/power-bi-visualization-export-data.md), as well as many other reporting tools. A semantic model author can help semantic model consumers understand and utilize the semantic model with how they build the model.

- **Names**: Tables, columns, and measures in the semantic model with descriptive names. For example, 'Store Sales' as a table name is more intuitive than 'Table1'.
- **Descriptions**: Tables, columns, and measures in the model can have descriptions added to them to provide more detail than can fit in the name. Explain not only what they include but how they should be used.
- **Hide**: You can hide tables, columns, and measures in the model to show only what you expect them to use in a report. For example, relationship columns may be an ID that is not necessary for reporting and can be hidden as it's not expected to be used in a report, or data columns that have a measure to aggregate the column could be hidden to encourage use of the measure instead. Hidden objects can always be unhidden later by the model consumer, so they will still be available, but hiding can provide focus.
- **Hierarchies**: You can create hierarchies to convey the hierarchy across multiple columns. For example, a Calendar hierarchy may contain Year, Month, Day columns, and a Product hierarchy may contain Category, Sub-Category, Product columns. Right-click a column to create a hierarchy.
- **Measures**: You can use [measures](../transform-model/desktop-measures.md) to aggregate data columns in the semantic model to provide consistency across reports. Measures can range from the SUM of a column, to a health index combining multiple aggregations in a specific way or comparing aggregations across time periods, such as daily average this month compared to the daily average of the same month last year. Measures can also be surfaced in Power BI search and other features, such as [Metrics and Scorecards](../create-reports/service-goals-introduction.md).
- **Formats**: You can specify how a column or measure is displayed in a visual, by default. Values in visuals can be customized further in the visual. Format options include if it has a thousands comma, how many decimal places, how a date is shown, etc. You can also apply [custom](../create-reports/desktop-custom-format-strings.md) or [dynamic](../create-reports/desktop-dynamic-format-strings.md) formats.
- **Data category**: You can specify a column [data category](../transform-model/desktop-data-categorization.md), such as if it's a Country or Web URL.

These are common features of Power BI semantic model that can be leveraged to help your report authors and model consumers. There are many others, such as [calculation groups](../transform-model/calculation-groups.md), [field parameters](../create-reports/power-bi-field-parameters.md), [what if parameters](../transform-model/desktop-what-if.md), and [grouping and binning columns](../create-reports/desktop-grouping-and-binning.md), which should be evaluated to see if they apply your specific reporting needs.

## Optimizing visualizations

Power BI visualizations can be dashboards, Power BI reports, or Power BI paginated reports. Each has different architectures, and so each has their own guidance.

### Dashboards

It's important to understand that Power BI maintains a cache for your dashboard tiles—except live report tiles, and streaming tiles. If your semantic model enforces dynamic [row-level security (RLS)](/fabric/security/service-admin-row-level-security), be sure to understand performance implications as tiles will cache on a per-user basis.

When you pin live report tiles to a dashboard, they're not served from the query cache. Instead, they behave like reports, and make queries to v-cores on the fly.

As the name suggests, retrieving the data from the cache provides better and more consistent performance than relying on the data source. One way to take advantage of this functionality is to have dashboards be the first landing page for your users. Pin often-used and highly requested visuals to the dashboards. In this way, dashboards become a valuable "first line of defense", which delivers consistent performance with less load on the capacity. Users can still click through to a report to analyze details.

For DirectQuery and live connection semantic models, the cache is updated on a periodic basis by querying the data source. By default, it happens every hour, though you can configure a different frequency in the semantic model settings. Each cache update will send queries to the underlying data source to update the cache. The number of queries that generate depends on the number of visuals pinned to dashboards that rely on the data source. Notice that if row-level security is enabled, queries are generated for each different security context. For example, consider there are two different roles that categorize your users, and they have two different views of the data. During query cache refresh, Power BI generates two sets of queries.

### Power BI reports

There are several recommendations for optimizing Power BI report designs.

> [!NOTE]
> When reports are based on a DirectQuery semantic model, for additional report design optimizations, see [DirectQuery model guidance in Power BI Desktop (Optimize report designs)](directquery-model-guidance.md#optimize-report-designs).

#### Apply the most restrictive filters

The more data that a visual needs to display, the slower that visual is to load. While this principle seems obvious, it's easy to forget. For example: suppose you have a large semantic model. Based on that semantic model, you build a report with a table. End users use slicers on the page to get to the rows they want—typically, they're only interested in a few dozen rows.

A common mistake is to leave the default view of the table unfiltered—that is, all 100M+ rows. The data for these rows loads into memory and is uncompressed at every refresh. This processing creates huge demands for memory. The solution: use the "Top N" filter to reduce the max number of items that the table displays. You can set the max item to larger than what users would need, for example, 10,000. The result is the end-user experience doesn't change, but memory use drops greatly. And most importantly, performance improves.

A similar design approach to the above is suggested for every visual in your report. Ask yourself, is all the data in this visual needed? Are there ways to filter the amount of data shown in the visual with minimal impact to the end-user experience? Remember, tables in particular can be expensive.

#### Limit visuals on report pages

The above principle applies equally to the number of visuals added to a report page. It's highly recommended you limit the number of visuals on a particular report page to only what is necessary. [Drillthrough pages](report-drillthrough.md) and [report page tooltips](report-page-tooltips.md) are great ways to provide additional details without jamming more visuals onto the page.

#### Evaluate custom visual performance

Be sure to put each custom visual through its paces to ensure high performance. Poorly optimized Power BI visuals can negatively affect the performance of the entire report.

### Power BI paginated reports

Power BI paginated report designs can be optimized by applying best practice design to the report's data retrieval. For more information, see [Data retrieval guidance for paginated reports](report-paginated-data-retrieval.md).

Also, ensure your capacity has sufficient memory allocated to the [paginated reports workload](../enterprise/service-admin-premium-workloads.md#paginated-reports).

## Optimizing the environment

You can optimize the Power BI environment by configuring capacity settings, sizing data gateways, and reducing network latency.

### Capacity settings

When using capacities—available with Power BI Premium (P SKUs), Premium Per User (PPU) licenses, or Power BI Embedded (A SKUs, A4-A6)—you can manage capacity settings. For more information, see [Microsoft Fabric capacity licenses](/fabric/enterprise/licenses#capacity-license) and [Managing Premium capacities](../enterprise/service-premium-capacity-manage.md).

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

### Gateway sizing

A gateway is required whenever Power BI must access data that isn't accessible directly over the Internet. You can install the [on-premises data gateway](../connect-data/service-gateway-onprem.md) on a server on-premises, or VM-hosted Infrastructure-as-a-Service (IaaS).

To understand gateway workloads and sizing recommendations, see [On-premises data gateway sizing](gateway-onprem-sizing.md).

### Network latency

Network latency can impact report performance by increasing the time required for requests to reach the Power BI service, and for responses to be delivered. Tenants in Power BI are assigned to a specific region.

> [!TIP]
> To determine where your tenant is located, see [Where is my Power BI tenant located?](../admin/service-admin-where-is-my-tenant-located.md)

When users from a tenant access the Power BI service, their requests always route to this region. As requests reach the Power BI service, the service may then send additional requests—for example, to the underlying data source, or a data gateway—which are also subject to network latency.

Tools such as [Azure Speed Test](https://azurespeedtest.azurewebsites.net/) provide an indication of network latency between the client and the Azure region. In general, to minimize the impact of network latency, strive to keep data sources, gateways, and your Power BI capacity as close as possible. Preferably, they reside within the same region. If network latency is an issue, try locating gateways and data sources closer to your Power BI capacity by placing them inside cloud-hosted virtual machines.

## Monitoring performance

You can monitor performance to identify bottlenecks. Slow queries—or report visuals—should be a focal point of continued optimization. Monitoring can be done at design time in Power BI Desktop, or on production workloads in Power BI Premium capacities. For more information, see [Monitoring report performance in Power BI](monitor-report-performance.md).

## Related content

For more information about this article, check out the following resources:

- [Power BI guidance](index.yml)
- [Monitoring report performance](monitor-report-performance.md)
- [Fabric adoption roadmap](fabric-adoption-roadmap.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
