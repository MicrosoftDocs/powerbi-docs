---
title: Diganostic logging for the Power BI Embedded service in Azure | Microsoft Docs
description: Learn about setting up diagnostic logging for the Power BI Embedded service in Azure.
author: markingmyname
ms.author: maghan
manager: kfile
ms.service: power-bi-embedded
ms.topic: conceptual
ms.date: 07/31/2018
ms.reviewer: ''

---
# Diagnostic logging for Power BI Embedded

An important part of the [Power BI Embedded](https://azure.microsoft.com/en-us/services/power-bi-embedded/) solution in Azure is monitoring how your capacities are performing. With [Azure resource diagnostic logs](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-overview-of-diagnostic-logs), you can monitor and send logs to [Azure Storage](https://azure.microsoft.com/services/storage/), stream them to [Azure Event Hubs](https://azure.microsoft.com/services/event-hubs/), and export them to [Log Analytics](https://azure.microsoft.com/services/log-analytics/), a service of [Azure](https://www.microsoft.com/cloud-platform/operations-management-suite).

## What's logged?

You can select **Engine**, or the **AllMetrics** categories.

### Engine

Selecting **Engine** logs all [xEvents](https://docs.microsoft.com/sql/analysis-services/instances/monitor-analysis-services-with-sql-server-extended-events). You cannot select individual events.

| Event Name | Event Description |
|:--------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Audit Login | Records all new connection events since the trace started such as when a client requested a connection to a server running an instance of Microsoft SQL Server Analysis Services. |
| Session Initialize | Collects the session initialization events. |
| Vertipaq Query Begin | VertiPaq SE query begin |
| Query Begin | Collects all query begin events since the trace started. |
| Query End | Collects all query end events since the trace started. |
| Vertipaq Query End | VertiPaq SE query end |
| Audit Logout | Records all new disconnect events since the trace started such as when a client issues a disconnect command. |
| Error | Records all new error events since the trace started. |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |
|  |  |

| Property Name | Vertipaq Query End Example | Property Description |  |  |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|--------|--------------------------------------|
| EventClass | XM_SEQUERY_END | Event Class is used to categorize events. |  |  |
| EventSubclass | 0 | Event Subclass provides additional information about each event class. (e.g. 0: VertiPaq Scan) |  |  |
| RootActivityId | ff217fd2-611d-43c0-9c12-19e202a94f70 | Root activity ID. |  |  |
| CurrentTime | 2018-04-06T18:30:11.9137358Z | Time at which the event started, when available. |  |  |
| StartTime | 2018-04-06T18:30:11.9137358Z | Time at which the event started, when available. |  |  |
| JobID | 0 | Job ID for progress. |  |  |
| ObjectID | 464 | Object ID |  |  |
| ObjectType | 802012 | ObjectType |  |  |
| ObjectName | SalesLT Customer | ObjectName |  |  |
| ObjectPath | 5eaa550e-06ac-4adf-aba9-dbf0e8fd1527.Model.SalesLT Customer | Object path. A comma-separated list of parents, starting with the object's parent. |  |  |
| ObjectReference | <Object><Table>SalesLT Customer</Table><Model>Model</Model><Database>5eaa550e-06ac-4adf-aba9-dbf0e8fd1527</Database></Object> | Object reference. Encoded as XML for all parents, using tags to describe the object. |  |  |
| EndTime | 2018-04-06T18:30:11.9137358Z | Time at which the event ended. |  |  |
| Duration | 0 | Amount of time (in milliseconds) taken by the event. |  |  |
| SessionType | User | Session type (what entity caused the operation). |  |  |
| ProgressTotal | 0 | Progress total. |  |  |
| IntegerData | 0 | Integer data. |  |  |
| Severity | 0 | Severity level of an exception. |  |  |
| Success | 1 | 1 = success. 0 = failure (for example, a 1 means success of a permissions check and a 0 means a failure of that check). |  |  |
| Error | 0 | Error number of a given event. |  |  |
| TextData | SET DC_KIND=\"AUTO\"";  SELECT  [SalesLT Customer (464)].[rowguid (606)] AS [SalesLT Customer (464)$rowguid (606)]  FROM [SalesLT Customer (464)];      [Estimated size (volume | marshalling bytes): 850 | 6800]" | Text data associated with the event. |
| ConnectionID | 3 | Unique connection ID. |  |  |
| DatasetID | 5eaa550e-06ac-4adf-aba9-dbf0e8fd1527 | Name of the database in which the statement of the user is running. |  |  |
| SessionID | 3D063F66-A111-48EE-B960-141DEBDA8951 | Session GUID. |  |  |
| SPID | 180 | Server process ID. This uniquely identifies a user session. This directly corresponds to the session GUID used by XML/A. |  |  |
| ClientProcessID | null | The process ID of the client application. |  |  |
| ApplicationName | null | Name of the client application that created the connection to the server. |  |  |
| CapacityName | pbi641fb41260f84aa2b778a85891ae2d97 | Name of the server producing the event. |  |  |
| RequestParameters |  |  |  |  |
| RequestProperties |  |  |  |  |

### AllMetrics

The Metrics category logs the same [Server metrics](https://docs.microsoft.com/azure/analysis-services/analysis-services-monitor#server-metrics) displayed in Metrics.

## Setup diagnostics logging

### Azure portal

1. In [Azure portal](https://portal.azure.com) > Power BI embedded > dedicated capacity, click **Diagnostic logs** in the left navigation, and then click **Turn on diagnostics**.

    ![Turn on diagnostic logging for Power BI Embedded in the Azure portal](media/azure-pbie-diag-logs/azure-pbie-diag-logs-01.png)

2. In **Diagnostic settings**, specify the following options:

    * **Name**. Enter a name for the logs to create.

    * **Archive to a storage account**. To use this option, you need an existing storage account to connect to. See [Create a storage account](https://docs.microsoft.com/azure/storage/common/storage-create-storage-account). Follow the instructions to create a Resource Manager, general-purpose account, then select your storage account by returning to this page in the portal. It may take a few minutes for newly created storage accounts to appear in the drop-down menu.
    * **Stream to an event hub**. To use this option, you need an existing Event Hub namespace and event hub to connect to. To learn more, see [Create an Event Hubs namespace and an event hub using the Azure portal](https://docs.microsoft.com/azure/event-hubs/event-hubs-create). Then return to this page in the portal to select the Event Hub namespace and policy name.
    * **Send to Log Analytics**. To use this option, either use an existing workspace or create a new Log Analytics workspace by following the steps to [create a new workspace](https://docs.microsoft.com/en-us/azure/log-analytics/log-analytics-quick-collect-azurevm#create-a-workspace) in the portal. For more information on viewing your logs in Log Analytics, see [View logs in Log Analytics](#view-in-loganalytics).

    * **Engine**. Select this option to log xEvents. If you're archiving to a storage account, you can select the retention period for the diagnostic logs. Logs are autodeleted after the retention period expires.
    * **Service**. Select this option to log service level events. If you are archiving to a storage account, you can select the retention period for the diagnostic logs. Logs are autodeleted after the retention period expires.
    * **Metrics**. Select this option to store verbose data in [Metrics](https://docs.microsoft.com/azure/analysis-services/analysis-services-monitor#server-metrics). If you are archiving to a storage account, you can select the retention period for the diagnostic logs. Logs are autodeleted after the retention period expires.

3. Click **Save**.

    If you receive an error that says "Failed to update diagnostics for \<workspace name>. The subscription \<subscription id> is not registered to use microsoft.insights." follow the [Troubleshoot Azure Diagnostics](https://docs.microsoft.com/azure/log-analytics/log-analytics-azure-storage) instructions to register the account, then retry this procedure.

    If you want to change how your diagnostic logs are saved at any point in the future, you can return to this page to modify settings.

### PowerShell

Here are the basic commands to get you going. If you want step-by-step help on setting up logging to a storage account by using PowerShell, see the tutorial later in this article.

To enable metrics and diagnostics logging by using PowerShell, use the following commands:

* To enable storage of diagnostics logs in a storage account, use this command:

   ```powershell
   Set-AzureRmDiagnosticSetting -ResourceId [your resource id] -StorageAccountId [your storage account id] -Enabled $true
   ```

   The storage account ID is the resource ID for the storage account where you want to send the logs.

* To enable streaming of diagnostics logs to an event hub, use this command:

   ```powershell
   Set-AzureRmDiagnosticSetting -ResourceId [your resource id] -ServiceBusRuleId [your service bus rule id] -Enabled $true
   ```

   The Azure Service Bus rule ID is a string with this format:

   ```powershell
   {service bus resource ID}/authorizationrules/{key name}
   ```

* To enable sending diagnostics logs to a Log Analytics workspace, use this command:

   ```powershell
   Set-AzureRmDiagnosticSetting -ResourceId [your resource id] -WorkspaceId [resource id of the log analytics workspace] -Enabled $true
   ```

* You can obtain the resource ID of your Log Analytics workspace by using the following command:

   ```powershell
   (Get-AzureRmOperationalInsightsWorkspace).ResourceId
   ```

You can combine these parameters to enable multiple output options.

### REST API

Learn how to [change diagnostics settings by using the Azure Monitor REST API](https://msdn.microsoft.com/library/azure/dn931943.aspx). 

### Resource Manager template

Learn how to [enable diagnostics settings at resource creation by using a Resource Manager template](https://docs.microsoft.com/azure/monitoring-and-diagnostics/monitoring-enable-diagnostic-logs-using-template).

## Manage your logs

Logs are typically available within a couple hours of setting up logging. It's up to you to manage your logs in your storage account:

* Use standard Azure access control methods to secure your logs by restricting who can access them.
* Delete logs that you no longer want to keep in your storage account.
* Be sure to set a retention period for so old logs are deleted from your storage account.