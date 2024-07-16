---
title: Monitor Power BI Embedded data
description: Learn how to monitor data from Microsoft Power BI Embedded by using Azure Monitor and PowerShell commands.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: subject-monitoring
ms.topic: how-to
ms.date: 06/04/2024
# customer intent: As a developer, I want to learn how to monitor my Power BI Embedded application so that I can ensure it's running smoothly.
---

# Power BI Embedded monitoring data

When you have critical applications and business processes that rely on Azure resources, you want to monitor those resources for their availability, performance, and operation. This article describes the monitoring data that Microsoft Power BI Embedded generates and how you can use the features of Azure Monitor to analyze and set alerts for this data.

>[!TIP]
>You can also use the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app) to monitor your capacity.

## Power BI Embedded Overview page

For each Power BI Embedded instance in the Azure portal, the **Overview** page includes the following information:

* **Resource group**: The [resource group](/azure/azure-resource-manager/management/overview#resource-groups) the Power BI Embedded instance belongs to
* **Status**: The status of the Power BI Embedded instance
* **Location**: The location of the Power BI Embedded instance
* **Subscription**: The name of the Power BI Embedded instance subscription
* **Subscription ID**: The ID of the Power BI Embedded instance subscription
* **Resource name**: The name of the Power BI Embedded instance
* **SKU**: The SKU that the Power BI Embedded instance uses
* **Resource mode**: The mode of the Power BI Embedded resource

## What is Azure Monitor?

Power BI Embedded creates monitoring data by using [Azure Monitor](/azure/azure-monitor/overview). Azure Monitor is a full-stack monitoring service in Azure that provides a complete set of features to monitor your Azure resources. It can also monitor resources in other cloud services and on-premises.

For more information, see [Monitor Azure resources with Azure Monitor](/azure/azure-monitor/insights/monitor-azure-resource) to learn about:

* Azure Monitor and how it's integrated into the portal for other Azure services
* The types of data collected by Azure Monitor for Azure resources
* Azure Monitor tools that are used to collect and analyze data

The following sections build on this article by describing the specific data gathered for Power BI Embedded and provide examples for configuring data collection and analyzing this data with Azure tools.

## Monitoring data

Resources from different Azure services all generate monitoring data in the same format so that you can use the same Azure Monitor tools to analyze them. Power BI Embedded creates [monitoring data](/azure/azure-monitor/insights/monitor-azure-resource#monitoring-data-from-azure-resources) in the same format as these other Azure resources.

For information on the metrics and logs metrics that Power BI Embedded creates, see the [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md).

## Collection and routing

Although platform metrics and the Azure Monitor activity log are collected and stored automatically, you can route them to other locations by using diagnostic settings. Diagnostic settings define where resource logs and metrics for a particular resource should be sent.

Resource logs aren't collected and stored until you create at least one diagnostic setting and route it to a location. When you create a diagnostic setting, you specify which categories of resource logs to collect. The categories for Power BI Embedded are listed in the [Power BI Embedded monitoring data reference](monitor-power-bi-embedded-reference.md#resource-logs).

For more information about how to create and configure diagnostic settings by using the Azure portal, Azure CLI, or Azure PowerShell, see [Diagnostic settings in Azure Monitor](/azure/azure-monitor/platform/diagnostic-settings).

### Use Azure PowerShell to enable diagnostics

To enable metrics and diagnostics logging with Azure PowerShell, use the following Azure PowerShell commands. For information about how to use Azure PowerShell to enable diagnostics, see [Configure a Log Analytics workspace in Azure Monitor using PowerShell](/azure/azure-monitor/platform/powershell-workspace-configuration).

* To enable storage of diagnostics logs in a storage account, use this command:

    ```azurepowershell
    Set-AzDiagnosticSetting -ResourceId [your resource id] -StorageAccountId [your storage account id] -Enabled $true
    ```

    The storage account ID is the resource ID for the storage account where you want to send the logs.

* To enable streaming of diagnostics logs to an event hub, use this command:

    ```azurepowershell
    Set-AzDiagnosticSetting -ResourceId [your resource id] -ServiceBusRuleId [your service bus rule id] -Enabled $true
    ```

* The Azure Service Bus rule ID is a string with this format:

    ```azurepowershell
    {service bus resource ID}/authorizationrules/{key name}
    ```

* To enable sending diagnostics logs to a Log Analytics workspace, use this command:

    ```azurepowershell
        Set-AzDiagnosticSetting -ResourceId [your resource id] -WorkspaceId [resource id of the log analytics workspace] -Enabled $true
    ```

* Get the resource ID of your Log Analytics workspace with the following command:

    ```azurepowershell
    (Get-AzOperationalInsightsWorkspace).ResourceId
    ```

You can combine these parameters to enable multiple output options.

The metrics and logs you can collect are discussed in the following sections.

## Analyze metrics

You can analyze metrics for Power BI Embedded with metrics from other Azure services that use Azure Monitor metrics explorer by selecting **Metrics** from the **Azure Monitor** menu. For information about this tool, see [Get started with metrics explorer](/azure/azure-monitor/platform/metrics-getting-started).

For a list of the platform metrics collected for Power BI Embedded, see the [Monitoring Power BI Embedded data reference](monitor-power-bi-embedded-reference.md#metrics).

For a reference list, see [resource metrics supported in Azure Monitor](/azure/azure-monitor/platform/metrics-supported).

## Analyze logs

Data in Azure Monitor Logs is stored in tables where each table has its own set of unique properties.  

 All resource logs available through Azure Monitor share a [common top-level schema](/azure/azure-monitor/platform/diagnostic-logs-schema#top-level-common-schema) and each service has its own service-specific schema. For information about the schema for Power BI Embedded resource logs, see the [Power BI Embedded Data Reference](monitor-power-bi-embedded-reference.md#schemas).

The [Azure Monitor activity log](/azure/azure-monitor/platform/activity-log) is an Azure platform log that provides insight into subscription-level events. You can view it independently or route it to Azure Monitor Logs, where you can do much more complex queries using Log Analytics.  

For a list of the types of resource logs collected for Power BI Embedded, see [Resource logs](monitor-power-bi-embedded-reference.md#resource-logs).

For a list of the tables used by Azure Monitor Logs and queryable by Log Analytics, see [Supported metrics with Azure Monitor](monitor-power-bi-embedded-reference.md#azure-monitor-logs-tables)  

### Sample Kusto query

> [!IMPORTANT]
> When you select **Logs** from the Power BI Embedded menu, Log Analytics opens with the query scope set to the current Power BI Embedded resource. This means that log queries will only include data from that resource. If you want to run a query that includes data from another Power BI Embedded resource or data from other Azure services, select **Logs** from the **Azure Monitor** menu. For more information, see [Log query scope and time range in Azure Monitor Log Analytics](/azure/azure-monitor/log-query/scope/).

Here's an example of a query that completes in less than five minutes (300,000 milliseconds):

```kusto
    search *
    | where Type == "AzureDiagnostics"
    | where ( OperationName == "QueryEnd" )
    | where toint(Duration_s) < 300000   
```

## Alerts

Azure Monitor alerts proactively notify you when important conditions are found in your monitoring data. These alerts allow you to identify and address issues in your system before your customers notice them. You can set alerts on [metrics](/azure/azure-monitor/alerts/alerts-types#metric-alerts), [logs](/azure/azure-monitor/alerts/alerts-types#log-alerts), and the [activity log](/azure/azure-monitor/alerts/alerts-types#activity-log-alerts).

## Related content

Learn more about monitoring data:

* [Monitoring Power BI Embedded data reference](monitor-power-bi-embedded-reference.md)
* [Monitor Azure resources with Azure Monitor](/azure/azure-monitor/insights/monitor-azure-resource)
