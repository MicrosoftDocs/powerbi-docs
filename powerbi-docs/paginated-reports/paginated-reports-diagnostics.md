---
title: View Diagnostics  for Power BI Paginated Reports
description: Learn how to view, read, and use the diagnostics feature of a paginated report rendered in the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: concept-article
ms.date: 12/01/2025
ai-usage: ai-assisted
ms.custom: sfi-image-nochange
---

# View diagnostics for Power BI paginated reports

[!INCLUDE [applies-yes-service-no-report-builder-no-desktop](../includes/applies-yes-service-no-report-builder-no-desktop.md)]

In this article, you learn how to view, read, and use the diagnostics feature of a paginated report rendered in the Power BI service. Diagnostics data provides report viewers with the ability to read displayed data on performance metrics and rendering. 

:::image type="content" source="media/paginated-reports-diagnostics/diagnostics-card.png" alt-text="Screenshot of the dialog box for diagnostics." lightbox="media/paginated-reports-diagnostics/diagnostics-card.png"::: 

Any user with at least a Contributor role in a workspace can use this feature. Read more about [workspace roles](../collaborate-share/service-roles-new-workspaces.md).

## View diagnostics

- On the **View** menu for a paginated report, select **Diagnostics**.

    :::image type="content" source="media/paginated-reports-diagnostics/paginated-view-diagnostics.png" alt-text="Screenshot of the diagnostics ribbon option on the View menu." lightbox="media/paginated-reports-diagnostics/paginated-view-diagnostics.png":::

    When you select the diagnostics button the dialog box appears.

## Diagnostics data that's captured

The following table describes the data that's captured in the diagnostics dialog.

| Property    | Description   |
|---|-----|
| Report ID            | Paginated Report internal object ID.  |
| Report Name          | The name of the paginated report rendered. |
| Capacity Throttled   | Each capacity consists of a defined number of v-cores. The CPU time measured in utilization records reflects the v-cores' utilization, and that utilization determines if the workload exceeds the available resources. This value is displayed as either yes or no. For additional information, see [Power BI Premium capacity load, overload, and autoscale - Power BI](../enterprise/service-premium-concepts.md#how-capacity-size-limits-are-enforced-when-viewing-reports).  |
| Request ID           | Paginated Report internal object ID.  |
| Data Retrieval time  | Number of milliseconds (ms) spent retrieving the data from its source. |
| Row Count            | Number of rows returned from queries.|
| Processing Time      | Number of milliseconds (ms) spent processing the report. |
| Rendering Time       | Number of milliseconds (ms) spent rendering the report. |
| Rendering ID         | Paginated Render and ProcessParameters IDs can be used to correlate the OperationName in the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app). |
| Start Time in UTC    | Start time in UTC indicates the duration of a report process. It can be used in conjunction with the rendering ID (OperationName) start and end time in the [Microsoft Fabric Capacity Metrics app.](/fabric/enterprise/metrics-app). |
| Render Format        | JSONRPL, PDF, XLSX  |
| Content Size         | Size of rendered reports in kilobytes (kb). |
|Execution environment| The environment in which the report run. |
|Non-optimized expressions| A list of unoptimized report expressions |

## Considerations and limitations

This feature isn't available in [Power BI apps](../explore-reports/end-user-apps.md) or in the [paginated report visual](../visuals/paginated-report-visual.md). It's designed for report authors to view performance data coming from a paginated report in the Power BI service.  

## Related content

[View a paginated report in the Power BI service](../explore-reports/paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community.](https://community.powerbi.com/)
