---
title: Configuring Azure Log Analytics in Power BI (Preview)
description: How to configure Azure Log Analytics in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 06/17/2021
LocalizationGroup: Transform and shape data
---
# Configuring Azure Log Analytics for Power BI (Preview)

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a Log Analytics connection to their Power BI subscription. This article describes how the integration between Log Analytics and Power BI works, and how to configure it for your environment. 

There are two elements to getting Azure Log Analytics working for Power BI: configuring your Azure subscription in the Azure portal, and configuring Power BI in the Power BI Admin portal. The following sections take you through the steps in each, in turn.

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-17.png" alt-text="Screenshot of connecting Log Analytics to Power B I.":::

## Configure Azure Log Analytics

Using Azure Log Analytics with Power BI requires some configuration of your Azure subscription. Make sure the user configuring the Log Analytics integration is also an **Owner** of the Log Analytics workspace. The following steps take you through the process.

1. Log into the Azure portal, select the subscription you want to use with Log Analytics and that contains your Log Analytics workspaces. Tn the **Settings** section, select **Resource providers** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-08.png" alt-text="Screenshot of selecting Resource providers in the Azure portal.":::

2. Search for **microsoft.insights** under **Resource providers** and then select **Register**. 

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-09.png" alt-text="Screenshot of selecting registering microsoft.insights in the Azure portal.":::

3. Make sure the user configuring Log Analytics integration is also an **Owner** of the Log Analytics workspace. When you select **Access control (IAM)** for the subscription in the Azure portal, and then select **Role assignments** from the top selections in the panel, the current user must see at least two entries: **Admin** or **Owner** for the Log Analytics workspace (1, in the following image), and **Owner** or **Contributor** for the Power BI service (2, in the following image).

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-10.png" alt-text="Screenshot of ensuring proper credentials in the Azure portal.":::


Once you've completed those steps, the Azure Log Analytics configuration portion is complete. The next section shows you how to continue and complete the configuration in the Power BI Admin portal.

## Configure the Power BI Admin portal

There are two scopes for integrating Log Analytics for Power BI: tenant and workspace. The following sections describe each in turn.

### Tenant-level configuration

Complete the following steps to enable Azure Log Analytics for your Power BI tenant. Remember that you can configure either or *both* scopes for Azure Log Analytics; if you're doing both, you need to complete the steps for each scope independently.

1. In the **Power BI Admin portal** navigate to **Tenant Settings > Azure connections (Preview)** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-11.png" alt-text="Screenshot of selecting Azure connections in the Power B I Admin portal.":::

2. Expand the **Tenant-level Log Analytics (Preview)** section, then select **Connect to Azure** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-13.png" alt-text="Screenshot of selecting Connect to Azure.":::

3. Select the Azure subscription, Resource group, and then the Log Analytics workspace configured in the previous section, then select **Save**. When successfully completed, the expanded **Tenant-level Log Analytics (Preview)** section will look similar to the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-14.png" alt-text="Screenshot of completed configuration for connecting to Azure.":::


When completed, tenant-level logging is enabled and ready for further configuration.

### Workspace-level configuration

Complete the following steps to enable Azure Log Analytics for a Power BI Premium workspace. 

1. In the **Power BI Admin portal** navigate to **Tenant Settings > Azure connections (Preview)** and expand the **Workspace-level Log Analytics permissions (preview)**. To allow workspace admins to enable Log Analytics, select the checkbox as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-12.png" alt-text="Screenshot of allowing Log Analytics for Premium workspaces.":::


1. In the **Premium** workspace, workspace admins can enable Log Analytics. To do so, navigate to **Settings** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-15.png" alt-text="Screenshot of selecting Settings for a Premium workspace.":::

2. In the **Settings** pane, select **Azure connections (preview)**, then expand **Log Analytics** as shown in the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-16.png" alt-text="Screenshot of expanding Azure connections (preview).":::

3. Select the Azure subscription, Resource group, and then the Log Analytics workspace configured in the previous section, then select **Save**. When successfully completed, the expanded **Tenant-level Log Analytics (Preview)** section will look similar to the following image.

    :::image type="content" source="media/desktop-log-analytics-overview/log-analytics-17.png" alt-text="Screenshot of settings configuration for log analytics when connecting to Azure.":::


## Disconnect Azure Log Analytics

You can disconnect from Azure Log Analytics using the Power BI Admin portal, for either the tenant scope or the workspace scope. To disconnect, In the **Power BI Admin portal**, navigate to the **Log Analytics** settingsThe following image shows the warning displayed when the **Disconnect from Azure** button is selected.

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-18.png" alt-text="Screenshot of disconnect warning.":::

 Select **Save** to disconnect. 


## Usage scenarios

There are many ways that Azure Log Analytics and Power BI can help solve real-world challenges for your organization. Here are a few to consider:

* Identifying periods of high or unusual activity
* Analyzing dataset refresh 
* Analyzing custom operations sent using the Premium XMLA endpoint

There are also differences in patterns and use for the tenant scope, and the workspace scope. Send us feedback in the Power BI Community for how you're using logging, and how it has helped your organization.

## Error conditions and resolutions
The following table provides a collection of common errors, the events or configurations that triggered them, and suggested resolutions. 

| **Trigger Condition** | **Type** | **Message** |
| --- | --- | --- |
| User doesn't have permission to write to the Log Analytics Workspace | Error - cannot proceed | You need write permissions on this Log Analytics workspace to connect it to Power BI. Contact the person in your organization who manages Azure subscriptions to fix this. |
| User doesn't have permission to write to the Log Analytics workspace account | Error - cannot proceed | You need write permissions on this Log Analytics workspace to connect it to Power BI. |
| Does not have access to any Azure subscriptions | Error - cannot proceed | You don't have access to any Azure subscriptions. Ask the person who manages Azure subscriptions in your organization to grant you contributor access or higher. |
| Does not have access to any Azure Log Analytics workspaces within that subscription | Error - cannot proceed | You don't have access to an Azure Log Analytics workspace. Ask the person who manages Azure subscriptions in your organization to add you to the Log Analytics owner or contributor role. |
| Workspace-level Log Analytics disabled when trying to connect | Information | Ask your tenant admin to grant workspace admins permission to connect Log Analytics workspaces. |
| Workspace-level Log Analytics disabled when trying to disconnect | Information | Your tenant admin revoked permission for workspace admins to connect their own Azure Log Analytics workspaces. If you disconnect, you won't be able to connect to another one. |


## Events and schema

Once enabled, Azure Log Analytics will log the following **events**. For more information on these events, see [Analysis Services trace events](/analysis-services/trace-events/analysis-services-trace-events?view=asallproducts-allversions).

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
| **CustomerTenantId** |   | Unique identifier of the Power BI tenant. |
| **WorkspaceId** |   | Unique identifier of the workspace being operated on. |
| **PremiumCapacityId** |   | Unique identifier of the Premium capacity being operated on. |
| **ApplicationContext** | ApplicationContext\_s | Property bag of unique identifiers providing details about the application executing the request. For example, report ID. |
| **ApplicationName** | ApplicationName\_s | Contains the name of the client application that created the connection to the server. This column is populated with the values passed by the application rather than the displayed name of the program. |
| **ClientHostName** | ClientHostName\_s | The name of the computer on which the client application is running. This column is populated with the values passed by the client application. |
| **ClientProcessId** | ClientProcessID\_s | Contains the process ID of the client application. |
| **ConnectionId** | ConnectionID\_s | Unique identifier of the connection. |
| **CPUTime** | CPUTime\_s | Amount of CPU time (in milliseconds) used by the event. |
| **DatabaseName** | DatabaseName\_s | Contains the name of the database in which the query is running. |
| **Duration** | Duration\_s | Amount of time (in milliseconds) taken by the event. |
| **EffectiveUsername** | EffectiveUsername\_s | The user on whose behalf the operation is running. Used when an end-user identity must be impersonated on the server. |
| **Error** | Error\_s | Contains the error number of any error associated with the event. |
| **EventClass** | EventClass\_s | Event Class is used to categorize events. |
| **EventSubclass** | EventSubclass\_s | Event Subclass provides additional information about each event class. |
| **IntegerData** | IntegerData\_s | Contains the integer data associated with the reported event, such as the current count of the number of rows processed for a processing event. |
| **ObjectId** | ObjectID\_s | Object ID. |
| **ObjectName** | ObjectName\_s | The name of the object for which the event occurred. |
| **ObjectPath** | ObjectPath\_s | Object path. A comma-separated list of parents, starting with the object's parent. |
| **ObjectReference** | ObjectReference\_s | Object reference. Encoded as XML for all parents, using tags to describe the object. |
| **ObjectType** | ObjectType\_s | Identifies the type of object associated with a particular lock. For example, a lock timeout on a database will indicate the object type 100002, which is the Database object type |
| **ProgressTotal** | ProgressTotal\_s | An integer representing how many rows have been processed in the current operation at a point in time |
| **RequestParameters** | RequestParameters\_s | Contains the parameters for parameterized queries and commands associated with the event. |
| **RequestProperties** | RequestProperties\_s | Contains the properties of the XMLA request. |
| **SessionId** | SessionID\_g | Unique identifier of a session which represents multiple transactions occurring within the same scope, e.g.,  Sharing calculated members |
| **Severity** | Severity\_s | Contains the server process ID (SPID) that uniquely identifies the user session associated with the query event. The SPID directly corresponds to the session GUID used by XMLA. |
| **SpId** | SPID\_s | Server process ID. This uniquely identifies a user session. This directly corresponds to the session GUID used by XML/A. |
| **StartTime** | StartTime\_t | Contains the time at which the event started, when available. |
| **Success** | Success\_s | Indicates if the operation was successful. 1 = success. 0 = failure. |
| **TextData** | TextData\_s | Contains verbose information associated with the event |
| **RootActivityId** | RootActivityId\_g | Unique Identifier of request |


## Sample queries
The following collection of sample queries may be helpful when using Azure Log Analytics with Power BI.


```sql
// log count per day for last 30d
PowerBIDatasetsTenantPreview
| where TimeGenerated > ago(30d)
| summarize count() by format_datetime(TimeGenerated, 'yyyy-MM-dd')

// average query duration by day for last 30d
PowerBIDatasetsTenantPreview
| where TimeGenerated > ago(30d)
| where OperationName == 'QueryEnd'
| summarize avg(Duration) by format_datetime(TimeGenerated, 'yyyy-MM-dd')


//query duration percentiles for a single day in 1 hour bins
PowerBIDatasetsTenantPreview
| where TimeGenerated >= todatetime('2020-10-28') and TimeGenerated <= todatetime('2020-10-29')
| where OperationName == 'QueryEnd'
| summarize percentiles(Duration, 0.5, 0.9) by bin(TimeGenerated, 1h)


// refresh durations by workspace and dataset for last 7d
PowerBIDatasetsTenantPreview
| where TimeGenerated > ago(30d)
| where OperationName == 'CommandEnd'
| where EffectiveUsername contains 'system'
| where TextData contains 'refresh'
| extend DatasetId = extract('^.*<DatabaseID>(.*)</DatabaseID>.*$', 1 , TextData)
| project TimeGenerated, WorkspaceId, DatasetId, DurationSeconds = Duration/1000
```



## Next steps
The following articles can help you learn more about Power BI, and about its integration with Azure Log Analytics.

* [Using Azure Log Analytics in Power BI (Preview)](desktop-log-analytics-overview.md)
* [Troubleshoot XMLA endpoint connectivity](../../admin/troubleshoot-xmla-endpoint.md)
* [What is Power BI Premium?](../../admin/service-premium-what-is.md)
* [Organize work in the new workspaces in Power BI](../../collaborate-share/service-new-workspaces.md)
* [Creating a dataflow](../dataflows/dataflows-create.md)
* [Dataflows best practices](../dataflows/dataflows-best-practices.md)