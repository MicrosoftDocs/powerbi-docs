---
title: Configure automatic aggregations 
description: Describes how to enable and configure automatic aggregations to optimize query performance for DirectQuery datasets.
author: minewiskan
ms.author: owend
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 08/02/2021
LocalizationGroup: Admin
---
# Configure automatic aggregations (Preview)

Configuring automatic aggregations includes enabling the feature for a DirectQuery dataset and configuring one or more scheduled refreshes. After several iterations of the training and refresh operations have run, you can return to dataset settings to fine-tune the percentage of report queries that use the in-memory aggregations cache. Before completing these steps, be sure you fully understand the functionality and limitations described in [Automatic aggregations](aggregations-auto.md).

> [!IMPORTANT]
> Automatic aggregations is in **Preview**. When in preview, functionality and documentation are likely to change.

## Enable

You must have dataset Owner permissions to enable automatic aggregations. Workspace admins can take over dataset owner permissions.

1. In dataset Settings, expand **Optimize performance**.
1. Click the **Enable automatic aggregations** slider to **On**. If the enable slider is greyed out, ensure Data source credentials for the dataset are configured and signed in.
    
    :::image type="content" source="media/aggregations-automatic-configure/auto-aggs-enable.png" alt-text="Enable automatic aggregations":::

1. In **Refresh schedule**, specify a refresh frequency and time zone. If the Refresh schedule controls are disabled, verify the data source configuration including gateway connection (if necessary) and data source credentials.
1. Click **Add another time**, and then specify one or more refreshes.

    :::image type="content" source="media/aggregations-automatic-configure/auto-aggs-refresh.png" alt-text="Configure aggregations refresh dialog":::

    You must schedule at least one refresh. The first refresh for the frequency you select will include both a *training* operation and a refresh that loads new and updated aggregations into the in-memory cache. Schedule more refreshes to ensure report queries that hit the aggregations cache are getting results that are most in-sync with the backend data source. To learn more, see [Refresh operations](aggregations-auto.md#refresh-operations).

1. Click **Apply**.

## Fine-tuning

Both user-defined and system-generated aggregations tables are part of the dataset, contribute to the dataset size, and are subject to existing Power BI dataset size constraints. Aggregations processing also consumes resources and impacts dataset refresh durations. An optimal configuration strikes a balance between providing pre-aggregated results from the in-memory aggregations cache for the most frequently used report queries, while accepting slower results for outlier and ad-hoc queries in exchange for faster training and refresh times and a reduced burden on system resources.

### Adjusting the percentage

By default, the aggregations cache setting that determines the percentage of report queries that will use aggregations from the in-memory cache is 75%. Increasing the percentage means a greater number of report queries are ranked higher and therefore aggregations for them are included in the in-memory aggregations cache. While a higher percentage can mean more queries are answered from the in-memory cache, it can also mean **longer training and refresh times**. Adjusting to a lower percentage, on the other hand, can mean shorter training and refresh times, and less resource utilization, but report visualization performance could diminish because fewer report queries would be answered by the in-memory aggregations cache, as those report queries instead must then roundtrip to the data source.

Before the system can determine the optimal aggregations to include in the cache, it must first know the report query patterns being used most often. Be sure to allow several iterations of the training/refresh operations to be completed before adjusting the percentage of queries that will use the aggregations cache. This gives the training algorithm time to analyze report queries over a broader time period and self-adjust accordingly. For example, if you've scheduled refreshes for daily frequency, you might want to wait a full week. User reporting patterns on some days of the week may be different than others.

#### To adjust the percentage

1. In dataset Settings, expand **Optimize performance**.
1. Use the Adjust the percentage of queries that will use the aggregated caches slider to increase or decrease the percentage to the desired value. As you adjust the percentage, the Query performance impact lift chart provides estimated query response times.

    :::image type="content" source="media/aggregations-automatic-configure/auto-aggregations-adjust-percentage.png" alt-text="Adjust percentage":::

1. Click **Apply**.

### Estimating query performance impact

The **Query performance impact** lift chart provides estimated report query run times as a function of the percentage of queries that will use cached aggregations. The chart will initially show 0.0 for all metrics until at least one training/refresh operation is performed. After an initial training/refresh operation, the chart can help you determine if adjusting the percentage of queries that use the in-memory aggregations cache can potentially further improve query response.

:::image type="content" source="media/aggregations-automatic-configure/lift-chart.png" alt-text="Lift chart":::

Threshold appears as a marker line on the lift chart and indicates the target query response time for your reports. You can then fine-tune the percentage of queries that will use the aggregations cache to determine a new query percentage that meets the desired threshold.

#### Metrics

**DirectQuery** - An estimated duration in seconds for a report query sent to and returned from the data source by using DirectQuery. Queries that cannot be answered by the in-memory aggregations cache will typically be within this estimate.

**Current query percentage** - An estimated duration in seconds for report queries answered from the in-memory aggregations cache, based on the percentage setting for the most recent training/refresh operation.

**New query percentage** - An estimated duration in seconds for report queries answered from the in-memory aggregations cache for the newly selected percentage. As the percentage slider is changed, this metric reflects the potential change.

## Disable

When disabling automatic aggregations, existing system-created aggregation tables remain in the dataset. Power BI continues to use them to get query results whenever possible. By disabling automatic aggregations, you are only disabling the self-training and self-optimization processes. If you want to revert a dataset back to its initial state, you must republish the original from the .pbix model.

## See also

[Automatic aggregations](aggregations-auto.md)  
[User-defined aggregations](../transform-model/aggregations-advanced.md)  
[DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)  
