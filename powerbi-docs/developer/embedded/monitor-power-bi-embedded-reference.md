---
title: Monitoring Power BI Embedded data reference
description: Learn about the important reference materials for using Power BI Embedded to monitor critical applications and business processes that rely on Azure resources.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.custom: subject-monitoring, engagement-fy23
ms.date: 06/04/2024
#customer intent: As a developer, I want to learn how to monitor my Power BI Embedded application so that I can ensure it's running smoothly.
---

# Monitor Power BI Embedded data reference

See [Monitor Power BI Embedded](monitor-power-bi-embedded.md) for details on collecting and analyzing monitoring data for Power BI Embedded.

>[!TIP]
>Use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to monitor your capacity.

## Metrics

This section lists all the automatically collected platform metrics for Power BI Embedded.  

|Metric Type | Resource Provider / Type Namespace<br/> and link to individual metrics |
|-------|-----|
| Capacities | [Microsoft.PowerBIDedicated/capacities](/azure/azure-monitor/platform/metrics-supported#microsoftpowerbidedicatedcapacities) |

### Capacities

Resource provider and type: [Microsoft.PowerBIDedicated/capacities](/azure/azure-monitor/platform/metrics-supported#microsoftpowerbidedicatedcapacities)

| Name | Metric | Unit | Description |
|:---|:-------|:-----|:------------|
|CPU |cpu_metric |Percent |CPU utilization. |
|CPU Per Workload |cpu_workload_metric |Percent |CPU utilization per workload. |
|Overload |overload_metric |0/1 |Resource overload, 1 if resource is overloaded, otherwise 0. |

## Metric dimensions

Power BI Embedded doesn't have any metrics that contain dimensions.

For information about metric dimensions, see [Multi-dimensional metrics](/azure/azure-monitor/platform/data-platform-metrics#multi-dimensional-metrics).

## Resource logs

This section lists the types of resource logs you can collect for Power BI Embedded.

For reference, see a list of [all resource logs category types supported in Azure Monitor](/azure/azure-monitor/platform/resource-logs-schema).

This section lists all the resource log category types collected for Power BI Embedded.  

|Resource Log Type | Resource Provider / Type Namespace<br/> and link to individual metrics |
|-------|-----|
| Capacities | [Microsoft.PowerBIDedicated/capacities](/azure/azure-monitor/platform/resource-logs-categories#microsoftpowerbidedicatedcapacities) |

## Azure Monitor Logs tables

This section refers to all of the Azure Monitor Logs Kusto tables relevant to Power BI Embedded and available for query by Log Analytics.

|Resource Type | Notes |
|-------|-----|
| [Power BI Embedded](/azure/azure-monitor/reference/tables/tables-resourcetype#power-bi-embedded) | See the following list of tables. |

### Power BI Embedded

| Table |  Description |
|:---------|:-------------|
| [AzureActivity](/azure/azure-monitor/reference/tables/azureactivity) | Entries from the Azure Activity log that provides insight into any subscription-level or management group level events that have occurred in Azure.    |
| [AzureDiagnostics](/azure/azure-monitor/reference/tables/azurediagnostics)   | Stores resource logs for Azure services that use Azure Diagnostics mode. Resource logs describe the internal operation of Azure resources. |
| [AzureMetrics](/azure/azure-monitor/reference/tables/azuremetrics)   | Metric data emitted by Azure services that measure their health and performance. |

For a reference of all Azure Monitor Logs and log analytics tables, see the [Azure Monitor Log table reference](/azure/azure-monitor/reference/tables/tables-resourcetype).

## Activity log

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
| Success | 1 | 1 = success. 0 = failure (for example, a 1 means success of a permissions check and a 0 means a failure of that check). |
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

The script uses Power BI and ARM REST APIs that are called in Azure Automation and triggered by Azure alert.

You can either copy the script, or download it as part of the [PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples) repository, by selecting the green *code* button, and downloading the ZIP.

## Related content

* [Monitor Azure Power BI Embedded](monitor-power-bi-embedded.md)
* [Azure resource diagnostic logging](/azure/monitoring-and-diagnostics/monitoring-overview-of-diagnostic-logs)
* [Set-AzureRmDiagnosticSetting](/powershell/module/azurerm.insights/Set-AzureRmDiagnosticSetting)
