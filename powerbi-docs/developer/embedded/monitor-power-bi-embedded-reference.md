---
title: Monitoring Power BI Embedded data reference
description: Important reference material needed when you monitor Power BI Embedded.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.custom: subject-monitoring
ms.date: 08/02/2021
---

# Monitoring Power BI Embedded data reference

See [Monitor Power BI Embedded](monitor-power-bi-embedded.md) for details on collecting and analyzing monitoring data for Power BI Embedded.

>[!TIP]
>You can also use the [Premium Gen2 Monitoring App](../../admin/service-premium-gen2-metrics-app.md) to monitor your [Embedded Gen 2](power-bi-embedded-generation-2.md) capacity.

## Metrics

This section lists all the automatically collected platform metrics collected for Power BI Embedded.  

|Metric Type | Resource Provider / Type Namespace<br/> and link to individual metrics |
|-------|-----|
| Capacities | [Microsoft.PowerBIDedicated/capacities](/azure/azure-monitor/platform/metrics-supported#microsoftpowerbidedicatedcapacities) |

### Capacities

Resource Provider and Type: [Microsoft.PowerBIDedicated/capacities](/azure/azure-monitor/platform/metrics-supported#microsoftpowerbidedicatedcapacities)

| Name | Metric | Unit | Description |
|:---|:-------|:-----|:------------|
|CPU (Gen2) |cpu_metric |Percent |CPU utilization. Supported only for Power BI Embedded Generation 2 resources. |
|CPU Per Workload (Gen2) |cpu_workload_metric |Percent |CPU utilization per workload. Supported only for Power BI Embedded Generation 2 resources. |
|Overload (Gen2) |overload_metric |0/1 |Resource overload, 1 if resource is overloaded, otherwise 0. Supported only for Power BI Embedded Generation 2 resources. |
|Memory (Gen1) |memory_metric               |Bytes        |Memory. Range 0-3 GB for A1, 0-5 GB for A2, 0-10 GB for A3, 0-25 GB for A4, 0-50 GB for A5 and 0-100 GB for A6. Supported only for Power BI Embedded Generation 1 resources. |
|Memory Thrashing (Datasets) (Gen1) |memory_thrashing_metric     |Percent      |Average memory thrashing. Supported only for Power BI Embedded Generation 1 resources. |
|QPU High Utilization (Gen1) |qpu_high_utilization_metric |Count        |QPU High Utilization In Last Minute, 1 For High QPU Utilization, Otherwise 0. Supported only for Power BI Embedded Generation 1 resources. |
|Query Duration (Datasets) (Gen1) |QueryDuration               |Milliseconds |DAX Query duration in last interval. Supported only for Power BI Embedded Generation 1 resources. |
|Query Pool Job Queue Length (Datasets) (Gen1) |QueryPoolJobQueueLength     |Count        |Number of jobs in the queue of the query thread pool. Supported only for Power BI Embedded Generation 1 resources. |

## Metric dimensions

For more information on what metric dimensions are, see [Multi-dimensional metrics](/azure/azure-monitor/platform/data-platform-metrics#multi-dimensional-metrics).

Power BI Embedded does not have any metrics that contain dimensions.

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
| [Power BI Embedded](/azure/azure-monitor/reference/tables/tables-resourcetype#power-bi-embedded) |See a list of tables below |

### Power BI Embedded

| Table |  Description |
|:---------|:-------------|
| [AzureActivity](/azure/azure-monitor/reference/tables/azureactivity) | Entries from the Azure Activity log that provides insight into any subscription-level or management group level events that have occurred in Azure.    |
| [AzureDiagnostics](/azure/azure-monitor/reference/tables/azurediagnostics)   | Stores resource logs for Azure services that use Azure Diagnostics mode. Resource logs describe the internal operation of Azure resources. |
| [AzureMetrics](/azure/azure-monitor/reference/tables/azuremetrics)   | Metric data emitted by Azure services that measure their health and performance. |

For a reference of all Azure Monitor Logs / Log Analytics tables, see the [Azure Monitor Log Table Reference](/azure/azure-monitor/reference/tables/tables-resourcetype).

## Activity log

You can select **Engine** and/or the **AllMetrics** categories.

### Engine

The engine category instructs the resource to log the events listed below. For each event, there are properties.

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

The table below shows an event example.

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
| DatasetID | 5eaa550e-06ac-4adf-aba9-dbf0e8fd1527 | Id of the dataset in which the statement of the user is running. |
| SessionID | 3D063F66-A111-48EE-B960-141DEBDA8951 | Session GUID. |
| SPID | 180 | Server process ID. This uniquely identifies a user session. This directly corresponds to the session GUID used by XML/A. |
| ClientProcessID | null | The process ID of the client application. |
| ApplicationName | null | Name of the client application that created the connection to the server. |
| CapacityName | pbi641fb41260f84aa2b778a85891ae2d97 | The name of the Power BI Embedded capacity resource. |

### AllMetrics

Checking the **AllMetrics** option logs the data of all the metrics that you can use with a Power BI Embedded resource.

The following table lists the operations related to Power BI Embedded that may be created in the Activity log.

## Schemas

Power BI Embedded uses the **Power BI Dedicated** schema.

## Example script for scaling a capacity

To scale a capacity resource, you can use the [ScaleUp-Automation-RunBook.ps1](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/PowerShell%20Scripts/ScaleUp-Automation-RunBook.ps1) PowerShell runbook script.

The script uses Power BI and ARM REST APIs, and can be called in Azure automation, and triggered by Azure alert.

You can either copy the script, or download it as part of the [PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples) repository, by selecting the green *code* button, and downloading the ZIP.

## Next steps

>[!div class="nextstepaction"]
>[Monitor Azure Power BI Embedded](monitor-power-bi-embedded.md)

>[!div class="nextstepaction"]
>[Azure resource diagnostic logging](/azure/monitoring-and-diagnostics/monitoring-overview-of-diagnostic-logs)

>[!div class="nextstepaction"]
>[Set-AzureRmDiagnosticSetting](/powershell/module/azurerm.insights/Set-AzureRmDiagnosticSetting)
