---
title: Monitor Power BI Embedded
description: Learn how to monitor data from Microsoft Power BI Embedded by using Azure Monitor and PowerShell commands.
ms.date: 07/30/2024
ms.custom: horz-monitor
ms.topic: conceptual
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
# customer intent: As a developer, I want to learn how to monitor my Power BI Embedded application so that I can ensure it's running smoothly.
---
# Monitor Power BI Embedded

[!INCLUDE [horz-monitor-intro](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-intro.md)]

> [!TIP]
> You can also use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to monitor your capacity.

<!-- ## Insights. OPTIONAL. If your service has Azure Monitor insights, add the following include and add information about what your insights provide. You can refer to another article that gives details or add a screenshot. 
[!INCLUDE [horz-monitor-insights](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-insights.md)] -->

[!INCLUDE [horz-monitor-resource-types](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-resource-types.md)]

For more information about the resource types for Power BI Embedded, see [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md).

[!INCLUDE [horz-monitor-data-storage](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-data-storage.md)]

[!INCLUDE [horz-monitor-platform-metrics](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-platform-metrics.md)]

For a list of available metrics for Power BI Embedded, see [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md#metrics).

<!-- ## OPTIONAL [TODO-replace-with-service-name] metrics
If your service uses any non-Azure Monitor based metrics, add the following include and more information.
[!INCLUDE [horz-monitor-custom-metrics](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-non-monitor-metrics.md)] -->

[!INCLUDE [horz-monitor-resource-logs](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-resource-logs.md)]

For the available resource log categories, their associated Log Analytics tables, and the log schemas for Power BI Embedded, see [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md#resource-logs).

[!INCLUDE [horz-monitor-activity-log](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-activity-log.md)]

Although platform metrics and the Azure Monitor activity log are collected and stored automatically, you can route them to other locations by using diagnostic settings. Diagnostic settings define where resource logs and metrics for a particular resource should be sent.

Resource logs aren't collected and stored until you create at least one diagnostic setting and route it to a location. When you create a diagnostic setting, you specify which categories of resource logs to collect. The categories for Power BI Embedded are listed in the [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md#resource-logs).

For more information about how to create and configure diagnostic settings by using the Azure portal, Azure CLI, or Azure PowerShell, see [Diagnostic settings in Azure Monitor](/azure/azure-monitor/platform/diagnostic-settings).

[!INCLUDE [horz-monitor-analyze-data](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-analyze-data.md)]

[!INCLUDE [horz-monitor-external-tools](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-external-tools.md)]

[!INCLUDE [horz-monitor-kusto-queries](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-kusto-queries.md)]

Here's an example of a query that completes in less than five minutes (300,000 milliseconds):

```kusto
    search *
    | where Type == "AzureDiagnostics"
    | where ( OperationName == "QueryEnd" )
    | where toint(Duration_s) < 300000   
```

[!INCLUDE [horz-monitor-alerts](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-alerts.md)]

### Power BI Embedded alert rules

You can set alerts for any metric, log entry, or activity log entry listed in the [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md).

[!INCLUDE [horz-monitor-advisor-recommendations](~/reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-advisor-recommendations.md)]

## Related content

- See [Power BI Embedded monitoring data reference](monitor-Power BI Embedded-reference.md) for a reference of the metrics, logs, and other important values created for Power BI Embedded.
- See [Monitoring Azure resources with Azure Monitor](/azure/azure-monitor/essentials/monitor-azure-resource) for general details on monitoring Azure resources.
