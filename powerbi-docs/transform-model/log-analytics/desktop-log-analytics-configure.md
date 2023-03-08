---
title: Configure Azure Log Analytics in Power BI
description: Learn how to connect to  and set up Azure Log Analytics so that you can use it in the Power BI service.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 02/07/2023
LocalizationGroup: Transform and shape data
---
# Configure Azure Log Analytics for Power BI

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a Log Analytics connection to their Power BI subscription. This article describes how the integration between Log Analytics and Power BI works and how to configure it for your environment.

There are two elements to getting Azure Log Analytics working for Power BI:

* Configuring your Azure subscription in the Azure portal.
* Enabling Log Analytics for Power BI in the Power BI Admin portal.

The following sections take you through the steps in each, in turn.

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-17.png" alt-text="Screenshot showing a connected Log Analytics workspace in Power BI.":::

## Pre-requisites

Before you can configure Log Analytics integration from Power BI, you need to [create a Log Analytics Workspace](/azure/azure-monitor/logs/quick-create-workspace) in the Azure portal. You must also give permission in Azure for the Power BI service to write logs. The exact requirements are:

* Register the 'microsoft.insights' resource provider in the Azure subscription where you'll collect Power BI log data.
* The user who sets up Log Analytics integration in Power BI must be in the Owner role for the Log Analytics Workspace. See the FAQ for workarounds if the Owner role can't be given.
* The service principal 'Power BI Service' must be in the Owner role for the Log Analytics Workspace.

The following section shows you how to meet these three requirements.

### Enable the 'microsoft.insights' Resource Provider

Log Analytics requires the 'microsoft.insights' resource provider enabled at the Azure subscription level. The following steps take you through the process.

1. Sign in to the Azure portal, and select the subscription you want to use with Log Analytics and that contains your Log Analytics workspaces. In the **Settings** section, select **Resource providers** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-08.png" alt-text="Screenshot showing the settings section of the Log Analytics menu.":::

2. Search for **microsoft.insights** under **Resource providers**. Then select **Register**.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-09.png" alt-text="Screenshot of selecting registering microsoft.insights in the Azure portal.":::

### Set Permissions

1. Make sure the user configuring Log Analytics integration and the Power BI Service principal are in the **Owner** role of the Log Analytics workspace. When you select **Access control (IAM)** for the subscription in the Azure portal, and then choose **Role assignments** from the top selections in the panel, the current user must see at least two entries: **Owner** for the user who configures Log Analytics (1, in the following image), and **Owner** for the Power BI service (2, in the following image).

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-10.png" alt-text="Screenshot of ensuring proper credentials in the Azure portal.":::

After you've completed those steps, the Azure Log Analytics configuration portion is complete. The next section shows you how to continue and complete the configuration in the Power BI Admin portal.

## Allow Workspace-level Logging from the Admin Portal

A Power BI administrator must complete the following step to enable Azure Log Analytics for Power BI Premium workspaces. This process lets Power BI Premium workspace administrators send their workspace logs to Azure Log Analytics when the pre-requisites have been met.

1. In the **Power BI Admin portal**, navigate to **Tenant Settings > Audit and usage settings**. Then expand **Azure Log Analytics connections for workspace administrators**. To allow workspace admins to enable Log Analytics, switch the slider to **Enabled**, and specify the needed security groups under **Apply to**, as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-19.png" alt-text="Screenshot of allowing Log Analytics for Premium workspaces.":::

## Configure Logging in a Premium Workspace

1. In the **Premium** workspace, workspace admins can enable Log Analytics. To do so, navigate to **Settings** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-15.png" alt-text="Screenshot of selecting Settings for a Premium workspace.":::

2. In the **Settings** pane, select **Azure connections**. Then expand **Log Analytics** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-16.png" alt-text="Screenshot of expanding Azure connections.":::

3. Select the Azure subscription, Resource group, and then the Log Analytics workspace configured in the previous section. Then choose **Save**. When successfully completed, the expanded **Tenant-level Log Analytics** section should look similar to the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-17.png" alt-text="Screenshot of the Azure Connections tab after connecting to Azure.":::

## Disconnect Azure Log Analytics

You can disconnect from Azure Log Analytics to stop sending logs to Azure. To disconnect, in the **Power BI Workspace Settings**, navigate to the **Log Analytics** settings. Then select the Disconnect from Azure button, and choose save.

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-18.png" alt-text="Screenshot of the Azure Connections tab highlighting the Disconnect from Azure button.":::

 Select **Save** to disconnect.

> [!NOTE]
> When you disconnect a Power BI workspace from Azure Log Analytics, logs are not deleted. Your data remains in the Azure and follows the storage and retention policies you set there.

## Usage scenarios

There are many ways that Azure Log Analytics and Power BI can help solve real-world challenges for your organization. Here are a few to consider:

* Identifying periods of high or unusual Analysis Services engine activity by capacity, workspace, report, or user.
* Analyzing query performance and trends, including external DirectQuery operations.
* Analyzing dataset refresh duration, overlaps, and processing steps.
* Analyzing custom operations sent by using the Premium XMLA endpoint.

Send us feedback in the Power BI Community for how you're using logging and how it has helped your organization.

## Error conditions and resolutions

The following table provides a collection of common errors, the events or configurations that triggered them, and suggested resolutions.

| **Trigger Condition** | **Type** | **Message** |
| --- | --- | --- |
| User doesn't have permission to write to the Log Analytics Workspace | Error - cannot proceed | You need write permissions on this Log Analytics workspace to connect it to Power BI. Contact the person in your organization who manages Azure subscriptions to fix this problem. |
| User doesn't have permission to write to the Log Analytics workspace account | Error - cannot proceed | You need write permissions on this Log Analytics workspace to connect it to Power BI. |
| Doesn't have access to any Azure subscriptions | Error - cannot proceed | You don't have access to any Azure subscriptions. Ask the person who manages Azure subscriptions in your organization to assign you contributor access or higher. |
| Doesn't have access to any Azure Log Analytics workspaces within that subscription | Error - cannot proceed | You don't have access to an Azure Log Analytics workspace. Ask the person who manages Azure subscriptions in your organization to add you to the Log Analytics owner or contributor role. |
| Workspace-level Log Analytics disabled when trying to connect | Information | Ask your tenant admin to grant workspace admins permission to connect Log Analytics workspaces. |
| Workspace-level Log Analytics disabled when trying to disconnect | Information | Your tenant admin revoked permission for workspace admins to connect their own Azure Log Analytics workspaces. If you disconnect, you can't connect to another one. |

## Events and schema

After you enabled Azure Log Analytics, it logs the following **event categories**. For more information on these events, see [Analysis Services trace events](/analysis-services/trace-events/analysis-services-trace-events).

* AggregateTableRewriteQuery
* Command
* Deadlock
* DirectQuery
* Discover
* Error
* ProgressReport
* Query
* Session Initialize
* VertiPaqSEQuery

The following table describes the **schema**.

| Property | Existing Azure Analysis Services property | Description |
| --- | --- | --- |
| **ApplicationContext** | ApplicationContext_s | Property bag of unique identifiers providing details about the application executing the request. for example, report ID. |
| **ApplicationName** | ApplicationName_s | Contains the name of the client application that created the connection to the server. This column is populated with the values passed by the application rather than the displayed name of the program. |
| **ArtifactId** | | Unique identifier of the resource logging the data. |
| **ArtifactKind** | | Type of artifact logging the operation, for example,  Dataset |
| **ArtifactName** | DatabaseName_s | The name of the Power BI artifact logging this operation. |
| **LogAnalyticsCategory**  | Unique | Category of the events, like Audit/Security/Request. |
| **CorrelationId** | | The ID for correlated events. Can be used to identify correlated events between multiple tables. |
| **CpuTimeMs** | CPUTime_s | Amount of CPU time (in milliseconds) used by the event. |
| **CustomerTenantId** | | Customer's Power BI tenant identifier. |
| **DatasetMode** | | The mode of the dataset. Import, DirectQuery, or Composite. |
| **DurationMs** | Duration_s | Amount of time (in milliseconds) taken by the operation. |
| **EventText** | TextData_s | Contains verbose information associated with the operation, for example, DAX Query |
| **ExecutingUser** | EffectiveUsername_s | The user executing the operation. |
| **Identity** | | Information about user and claims. |
| **Level** | Severity_s | Contains the severity level of the operation being logged. Success, Informational, Warning, or Error. |
| **OperationDetailName** | EventSubclass_s | More details about the operation. |
| **OperationName** | EventClass_s | The operation associated with the log record. |
| **PremiumCapacityId** | | Unique identifier of the Premium capacity hosting the artifact being operated on. |
| **ProgressCounter** | ProgressTotal_s | Progress counter. |
| **ProgressReportBegin** | | Collects all progress report begin events since the trace was started.  |
| **ProgressReportCurrent** | | Collects all progress report current events since the trace was started.    |
| **ProgressReportError** | | Collects all progress report error events since the trace was started.  |
| **Status** | | Status of the operation.  |
| **StatusCode** | Error_s | Status code of the operation. It covers success and failure. |
| **TenantId** | | Unique identifier of Microsoft's Power BI tenant. This property doesn't refer to the customer tenant. |
| **TimeGenerated** | | The timestamp (UTC) of when the log was generated. |
| **User** | User_s | The user that is associated with the running operation. Used when an end-user identity must be impersonated on the server. |
| **VertipaqSEQueryBegin** |  | Vertipaq storage engine query start time.   |
| **VertipaqSEQueryEnd** |  | Vertipaq storage engine query end time.   |
| **WorkspaceId** | | Unique identifier of the workspace containing the artifact being operated on. |
| **WorkspaceName** | ServerName_s | Name of the workspace containing the artifact. |
| **XmlaObjectPath** | ObjectPath_s | Object path. A comma-separated list of parents, starting with the object's parent. |
| **XmlaProperties** | RequestProperties_s | Properties of the XMLA request. |
| **XmlaRequestId** | RootActivityId_g | Unique Identifier of request. |
| **XmlaSessionId** | SPID_s | Analysis Services session identifier. |

## Sample Log Analytics KQL queries

The following collection of sample queries might be helpful when using Azure Log Analytics with Power BI. They can be executed directly in the Azure portal or through APIs to query the latest data, typically about 5-10 minutes old.

```sql
// log count per day for last 30d
PowerBIDatasetsWorkspace
| where TimeGenerated > ago(30d)
| summarize count() by format_datetime(TimeGenerated, 'yyyy-MM-dd')


// average query duration by day for last 30d
PowerBIDatasetsWorkspace
| where TimeGenerated > ago(30d)
| where OperationName == 'QueryEnd'
| summarize avg(DurationMs) by format_datetime(TimeGenerated, 'yyyy-MM-dd')


//query duration percentiles for a single day in 1 hour bins
PowerBIDatasetsWorkspace
| where TimeGenerated >= todatetime('2021-04-28') and TimeGenerated <= todatetime('2021-04-29')
| where OperationName == 'QueryEnd'
| summarize percentiles(DurationMs, 0.5, 0.9) by bin(TimeGenerated, 1h)


// refresh durations by workspace and dataset for last 30d
PowerBIDatasetsWorkspace
| where TimeGenerated > ago(30d)
| where OperationName == 'CommandEnd'
| where ExecutingUser contains 'Power BI Service'
| where EventText contains 'refresh'
| project PowerBIWorkspaceName, DatasetName = ArtifactName, DurationMs

```

## Next steps

The following articles can help you learn more about Power BI, and about its integration with Azure Log Analytics.

* [Using Azure Log Analytics in Power BI (Preview)](desktop-log-analytics-overview.md)
* [Azure Log Analytics in Power BI FAQ](desktop-log-analytics-faq.md)
* [What is Power BI Premium?](../../enterprise/service-premium-what-is.md)
* [Workspaces in Power BI](../../collaborate-share/service-new-workspaces.md)
