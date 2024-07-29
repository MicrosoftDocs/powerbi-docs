---
title: Monitoring data reference for Power BI Embedded
description: Learn about using Power BI Embedded to monitor critical applications and business processes that rely on Azure resources.
ms.date: 07/30/2024
ms.custom: horz-monitor, engagement-fy23
ms.topic: reference
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
#customer intent: As a developer, I want to learn how to monitor my Power BI Embedded application so that I can ensure it's running smoothly.
---
# Power BI Embedded monitoring data reference

[!INCLUDE [horz-monitor-ref-intro](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-intro.md)]

See [Monitor Power BI Embedded](monitor-power-bi-embedded.md) for details on the data you can collect for Power BI Embedded and how to use it.

> [!TIP]
> Use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to monitor your capacity.

[!INCLUDE [horz-monitor-ref-metrics-intro](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-metrics-intro.md)]

### <a name="capacities"></a>Supported metrics for Microsoft.PowerBIDedicated/capacities

The following table lists the metrics available for the Microsoft.PowerBIDedicated/capacities resource type.

[!INCLUDE [horz-monitor-ref-metrics-tableheader](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-metrics-tableheader.md)]

[!INCLUDE [Microsoft.PowerBIDedicated/capacities](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/reference/metrics/microsoft-powerbidedicated-capacities-metrics-include.md)]

This table provides additional information about the preceding table.

| Name | Metric | Description |
|:-----|:-------|:------------|
| CPU | cpu_metric | CPU utilization. |
| CPU Per Workload | cpu_workload_metric | CPU utilization per workload. |
| Overload | overload_metric | Resource overload, 1 if resource is overloaded, otherwise 0. |

[!INCLUDE [horz-monitor-ref-metrics-dimensions-intro](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-metrics-dimensions-intro.md)]

[!INCLUDE [horz-monitor-ref-no-metrics-dimensions](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-no-metrics-dimensions.md)]

[!INCLUDE [horz-monitor-ref-resource-logs](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-resource-logs.md)]

### Supported resource logs for Microsoft.PowerBIDedicated/capacities

[!INCLUDE [Microsoft.PowerBIDedicated/capacities](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/reference/logs/microsoft-powerbidedicated-capacities-logs-include.md)]

[!INCLUDE [horz-monitor-ref-logs-tables](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-logs-tables.md)]

### Power BI Embedded Microsoft.PowerBIDedicated/capacities

| Table | Description |
|:------|:------------|
| [AzureActivity](/azure/azure-monitor/reference/tables/azureactivity#columns) | Entries from the Azure Activity log that provides insight into any subscription-level or management group level events that occurred in Azure. |
| [AzureMetrics](/azure/azure-monitor/reference/tables/azuremetrics#columns) | Stores resource logs for Azure services that use Azure Diagnostics mode. Resource logs describe the internal operation of Azure resources. |
| [AzureDiagnostics](/azure/azure-monitor/reference/tables/azurediagnostics#columns) | Metric data emitted by Azure services that measure their health and performance. |

[!INCLUDE [horz-monitor-ref-activity-log](~/../reusable-content/ce-skilling/azure/includes/azure-monitor/horizontals/horz-monitor-ref-activity-log.md)]

- [Analytics resource provider operations](/azure/role-based-access-control/resource-provider-operations#Analytics)

You can select **Engine** and the **AllMetrics** categories or either.

### Engine

The engine category instructs the resource to log the events listed in the following table. For each event, there are properties.

|     Event Name     |     Event Description     |
|----------------------------|----------------------------------------------------------------------------------|
|    Audit Login    |    Records all new connection to   the engine events since the trace started.    |
|    Session Initialize    |    Records all session   initialization events since the trace started.    |
|    Vertipaq Query Begin    |    Records all VertiPaq SE query   begin events since the trace started.    |
|    Query Begin    |    Records all query begin events   since the trace started.    |
|    Query End    |    Records all query end events   since the trace started.    |
|    Vertipaq Query End    |    Records all VertiPaq SE query   end events since the trace started.    |
|    Audit Logout    |    Records all disconnect from   engine events since the trace started.    |
|    Error    |    Records all engine error   events since the trace started.    |

#### Event example

The following table shows an event example.

| Property Name | Vertipaq Query End Example | Property Description |
|---|---|---|
| EventClass | XM_SEQUERY_END | Event Class is used to categorize events. |
| EventSubclass | 0 | Event Subclass provides additional information about each event class. (for example, 0: VertiPaq Scan) |
| RootActivityId | ff217fd2-611d-43c0-9c12-19e202a94f70 | Root activity ID. |
| CurrentTime | 2018-04-06T18:30:11.9137358Z | Time at which the event started when available. |
| StartTime | 2018-04-06T18:30:11.9137358Z | Time at which the event started when available. |
| JobID | 0 | Job ID for progress. |
| ObjectID | 464 | Object ID |
| ObjectType | 802012 | ObjectType |
| EndTime | 2018-04-06T18:30:11.9137358Z | Time at which the event ended. |
| Duration | 0 | Amount of time (in milliseconds) taken by the event. |
| SessionType | User | Session type (what entity caused the operation). |
| ProgressTotal | 0 | Progress total. |
| IntegerData | 0 | Integer data. |
| Severity | 0 | Severity level of an exception. |
| Success | 1 | 1 = success. 0 = failure. For example, a `1` means success of a permissions check and a `0` means a failure of that check. |
| Error | 0 | Error number of a given event. |
| ConnectionID | 3 | Unique connection ID. |
| DatasetID | 5eaa550e-06ac-4adf-aba9-dbf0e8fd1527 | ID of the semantic model in which the statement of the user is running. |
| SessionID | 3D063F66-A111-48EE-B960-141DEBDA8951 | Session GUID. |
| SPID | 180 | Server process ID. This process ID uniquely identifies a user session. This ID directly corresponds to the session GUID used by XML/A. |
| ClientProcessID | null | The process ID of the client application. |
| ApplicationName | null | Name of the client application that created the connection to the server. |
| CapacityName | pbi641fb41260f84aa2b778a85891ae2d97 | The name of the Power BI Embedded capacity resource. |

### AllMetrics

Checking the **AllMetrics** option logs the data of all the metrics that you can use with a Power BI Embedded resource.

The following table lists the operations related to Power BI Embedded that might appear in the Activity log.

## Schemas

Power BI Embedded uses the **Power BI Dedicated** schema.

## Example script for scaling a capacity

To scale a capacity resource, you can use the [ScaleUp-Automation-RunBook.ps1](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/PowerShell%20Scripts/ScaleUp-Automation-RunBook.ps1) PowerShell RunBook script.

The script uses Power BI and Azure Resource Manager REST APIs that are called in Azure Automation and triggered by Azure alert.

You can either copy the script, or download it as part of the [PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples) repository, by selecting the green *code* button, and downloading the ZIP.

## Related content

- See [Monitor Power BI Embedded](monitor-power-bi-embedded.md) for a description of monitoring Power BI Embedded.
- See [Monitor Azure resources with Azure Monitor](/azure/azure-monitor/essentials/monitor-azure-resource) for details on monitoring Azure resources.
