---
title: "Power BI usage scenarios: Self-service real-time analytics"
description: "Learn how business analysts can produce real-time Power BI reports."
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI usage scenarios: Self-service real-time analytics

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This usage scenario focuses on how a business analyst can produce _real-time_ Power BI reports. What's meant by real-time is that the data is always current, and report consumers aren't required to interact with visualizations. Data visualizations should refresh automatically to always show current data.

Real-time reports allow organizations to monitor and make confident decisions based on up-to-date data.

> [!NOTE]
> In this article, the term _real-time_ actually means _near real-time_. Near real-time means that there's always a degree of delay (known as latency), due to data processing and network transmission time.

> [!IMPORTANT]
> Microsoft has announced a retirement date for real-time streaming in Power BI. for more information, see [Announcing the retirement of real-time streaming in Power BI](https://powerbi.microsoft.com/blog/announcing-the-retirement-of-real-time-streaming-in-power-bi/).

To develop self-service real-time analytics, the business analyst will first need to create (or connect to) a [DirectQuery semantic model](../connect-data/service-dataset-modes-understand.md#directquery-mode). They can then build a report and set up its [automatic page refresh](../create-reports/desktop-automatic-page-refresh.md) settings. Once set up, Power BI automatically refreshes report pages to show current data.

> [!TIP]
> You can also achieve real-time analytics in Power BI by using _push datasets_. However, this topic is out of scope for this self-service real-time usage scenario because it targets developers. Push datasets usually involve developing a programmatic solution.

For a complete understanding of Power BI real-time analytics, work through the [Monitor data in real-time with Power BI](/training/modules/monitor-data-real-time-power-bi/) learning path.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components that support self-service real-time analytics. The primary objective is on creating a DirectQuery model and building Power BI reports that use automatic page refresh.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-self-service-real-time-analytics/usage-scenario-self-service-real-time-analytics-inline.svg" alt-text="Diagram shows self-service real-time analytics, which is about monitoring near real-time data. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-self-service-real-time-analytics/usage-scenario-self-service-real-time-analytics-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#self-service-real-time-analytics) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The above diagram depicts the following user actions, tools, and features:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators use Power BI Desktop to create a DirectQuery model. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Power BI Desktop sends native queries to the underlying data source in order to retrieve current data. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Content creators build a report that will display near real-time updates by enabling and setting up [automatic page refresh](../create-reports/desktop-automatic-page-refresh.md). |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | When ready, the content creators publish their Power BI Desktop file (.pbix) or Power BI project file (.pbip) to a workspace in the Power BI service or Fabric portal. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Once published, the workspace contains a new report and DirectQuery semantic model. When the workspace is a personal or Pro workspace, the minimum automatic page refresh interval is 30 minutes (even when the report creator sets a lower interval). |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | When report consumers open a report page that has automatic page refresh enabled, data visualizations refresh automatically to show current data. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Some data sources may require an On-premises data gateway or VNet gateway for data refresh, like those that reside within a private organizational network. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Each visual on an automatic page refresh page queries the semantic model to retrieve current data from the underlying data source. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | When an automatic page refresh report is stored in a workspace that uses **Fabric capacity**, **Premium capacity**, or **Premium Per User** [workspace type](../collaborate-share/service-create-the-new-workspaces.md#premium-capacity-settings), Power BI can automatically refresh on intervals of one minute or more. It's also possible to use the change detection refresh type so Power BI can avoid unnecessary refreshes. When the change detection refresh type is set, at each refresh interval, Power BI sends change detection queries to determine whether data has changed since the last automatic refresh. When Power BI detects change, it refreshes all visuals on the page. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Report consumers view up-to-date content from a workspace or Power BI app. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Capacity administrators can enable or disable the automatic page refresh feature. When the feature is disabled, automatic page refresh won't work for any reports stored in workspaces assigned to the capacity. Capacity administrators can also set a minimum refresh interval and a minimum execution interval. These minimum intervals will override any report page setting that uses a lower interval. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | Fabric administrators oversee and monitor activity in the Fabric portal. |

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Key points

The following are some key points to emphasize about the self-service real-time analytics scenario.

### Supported data sources

The automatic page refresh feature doesn't work for reports connected to [import models](../connect-data/service-dataset-modes-understand.md#import-mode), where all tables use import [storage mode](../transform-model/desktop-storage-mode.md). The feature only works when the Power BI report connects to a semantic model that:

- Includes [DirectQuery storage mode](../connect-data/service-dataset-modes-understand.md#directquery-mode) tables.
- Uses incremental refresh to get the latest data in real-time with DirectQuery. This capability is described later in this topic.
- Is a [live connection](../connect-data/service-datasets-understand.md#external-hosted-models) to a tabular model in Azure Analysis Services (AAS) or SQL Server Analysis Services (SSAS).
- Is a [push dataset](../connect-data/service-real-time-streaming.md#push-data-to-semantic-models).

A DirectQuery model is an alternative to an import model. Models developed in DirectQuery mode don't import data. Instead, they consist only of metadata defining the model structure. When the model is queried, native queries are used to retrieve data from the underlying data source.

From a self-service perspective, the business analyst can add DirectQuery storage tables to their model in Power BI Desktop, providing the data source supports this storage mode. Typically, relational databases are supported by DirectQuery. For a full listing of data sources that support DirectQuery, see [Data sources supported by DirectQuery](../connect-data/power-bi-data-sources.md).

A business analyst can also enhance an import model by setting up incremental refresh. By enabling the _Get the latest data in real-time with DirectQuery_ option (only supported by Premium workspaces), Power BI Desktop adds a DirectQuery partition to ensure the latest data is retrieved. For more information, see [Incremental refresh and real-time data for semantic models](../connect-data/incremental-refresh-overview.md).

The business analyst can also create a [live connection](../connect-data/desktop-report-lifecycle-datasets.md#connect-to-semantic-models-in-the-power-bi-service-from-power-bi-desktop) to an existing tabular model that includes DirectQuery storage mode tables.

### Involve data source owners

Before publishing an automatic page refresh report, it's a good idea to first discuss the real-time requirements with the data source owners. That's because automatic page refresh can place a significant workload on the data source.

Consider a single report page that's set to refresh every five minutes and that includes two visuals. When the report page is open, Power BI will send at least 24 queries per hour (12 refreshes multiplied by two visuals) to the underlying data source. Now consider that 10 report consumers open the same report page at the same time. In this case, Power BI will send 240 queries per hour.

It's important to discuss the real-time requirements, including the number of visuals on the report page and the desired refresh interval. When the use case is justified, the data source owner can take proactive steps by scaling up the data source resources. They can also optimize the data source by adding useful indexes and materialized views. For more information, see [DirectQuery model guidance in Power BI Desktop](directquery-model-guidance.md#optimize-data-source-performance).

### Refresh type

The automatic page refresh feature supports two refresh types.

- **Fixed interval**: Updates all page visuals based on a fixed interval, which can be from every one second to multiple days.
- **Change detection**: Updates all page visuals providing that source data has changed since the last automatic refresh. It avoids unnecessary refreshes, which can help to reduce resource consumption for the Power BI service and the underlying data source. Power BI only supports this refresh type for Premium workspaces and for data models hosted by Power BI. Remote data models, which are hosted in AAS or SSAS, aren't supported.

To set up change detection, you must create a special type of measure called a _change detection measure_. For example, a change detection measure might query for the maximum sales order number. Power BI uses the change detection measure to query the data source. Each time, Power BI stores the query result so it can compare it with the next result (according to the refresh interval you set). When the results differ, Power BI refreshes the page.

A model can only have one change detection measure, and there can only be a maximum of 10 change detection measures per tenant.

For more information, see [Refresh types](../create-reports/desktop-automatic-page-refresh.md#refresh-types).

### Capacity administration

When a workspace is attached to a Premium capacity, capacity administrators can enable or disable the automatic page refresh feature for the capacity. When the feature is disabled, automatic page refresh won't work for any report stored in any of the attached workspaces.

Capacity administrators can also set a minimum refresh interval (default five minutes) and a minimum execution interval (default five minutes). The execution interval determines the frequency of change detection queries. When a report page interval is less that the capacity minimum interval, Power BI will use the capacity minimum interval.

> [!NOTE]
> Minimum intervals don't apply to reports open in Power BI Desktop.

When there are performance issues related to automatic page refresh, a capacity administrator can:

- Scale up the capacity to a larger Premium SKU.
- Raise the minimum intervals.

For more information, see [Page refresh intervals](../create-reports/desktop-automatic-page-refresh.md#page-refresh-intervals).

### Gateway setup

Typically, a [data gateway](../connect-data/service-gateway-onprem.md) is required when accessing data sources that reside within the private organizational network or a virtual network. The gateway supports the DirectQuery operations (visual queries and change detection queries).

### System oversight

The [activity log](../enterprise/service-admin-auditing.md) records user activities that occur in the Power BI service. Power BI administrators can use the activity log data that's collected to perform [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md) to help them understand usage patterns and adoption.

By using the [Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) that's available to administrators, you can visualize how much of the capacity is being used by low-priority queries. Low-priority queries consist of automatic page refresh queries and model refresh queries. Change detection queries aren't low priority.

## Related content

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
