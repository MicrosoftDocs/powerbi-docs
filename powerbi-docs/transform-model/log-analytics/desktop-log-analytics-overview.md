---
title: Using Azure Log Analytics in Power BI (Preview)
description: Overview of how to use log analytics in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 06/16/2021
LocalizationGroup: Transform and shape data
---
# Using Azure Log Analytics in Power BI (Preview)

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a Log Analytics connection to their Power BI subscription. This article describes how the integration between Log Analytics and Power BI works, and provides examples of how you can use Azure Log Analytics in your Power BI Premium subscription. 

Azure Log Analytics (LA) is a service within [Azure Monitor](https://azure.microsoft.com/services/monitor/), which uses the Azure Analysis Services engine to create logs. The Azure Monitor suite lets you collect, analyze, and act on telemetry data from your Azure and on-premises environments. It offers long-term storage, an ad-hoc query interface and API access to allow data export and integration with other systems. 

The Power BI integration with Log Analytics exposes events from the Analysis Services engine. The events are derived from existing [diagnostic logs available for Azure Analysis Services](/azure/analysis-services/analysis-services-logging). 

Once connected to Power BI, data is sent continuously and is available in Log Analytics in approximately 5 minutes. The following diagram shows how Azure Monitor operates, with the path taken by Power BI highlighted.

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-01.png" alt-text="Diagram of how Azure Monitor works with Power B I.":::

The following sections describe the integration of Azure Log Analytics with Power BI, the requirements necessary to connect Azure Log Analytics to Power BI, and considerations to keep in mind.


## Available scopes for logging

Logging is supported at two levels for Power BI: for the entire tenant, or for a workspace. Tenant logs are separate from workspace logs, an independent copy of the log information. You can configure logging at the tenant level, at the workspace level, or both.

The following table describes more about each scope.


|**Configuration level**  |**Role / permission**  |**Destination Table in Log Analytics**  |**Details**  |
|---------|---------|---------|---------|
|Tenant   |Power BI administrator, or Log Analytics workspace owner |PowerBIDatasetsTenantPreview  | - Logs activity from entire tenant <br> - Premium workspaces only       |
|Workspace     |Power BI workspace owner, or Log Analytics workspace owner     |PowerBIDatasetsWorkspacePreview  |- Must be allowed by the tenant administrator<br>- Logs activity from the workspace only<br>- Premium workspaces only<br>- Workspace v2 only |

With these two scopes, it's good to have examples of how you might put logging to use in Power BI. The following section provides some examples.

## Examples of logging scenarios

This section provides some examples of how you might configure Log Analytics for Power BI, and how selections you make will impact what is logged, and how the information is provided.

**Example 1: Tenant logs only**

In this example, only tenant logs are gathered, and are sent to a dedicated Log Analytics workspace:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-02.png" alt-text="Diagram of example one, sending logs at tenant level only.":::

**Example 2: Workspace logs for one workspace only**

In example two, only workspace logs from *Workspace A* are sent to a dedicated Log Analytics workspace, with no tenant logs:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-03.png" alt-text="Diagram of example two, sending workspace logs only to another workspace.":::

**Example 3: Workspace logs sent to dedicated Log Analytics workspaces**

In this example, workspace logs from two different workspaces are each sent to separate, dedicated Log Analytics workspaces:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-04.png" alt-text="Diagram of example three, separate workspace logs sent do dedicated log workspaces.":::

**Example 4: Tenant and workspace logs sent to dedicated Log Analytics workspaces**

In example four, tenant logs are sent to a dedicated Log Analytics workspace, and logs from two different workspaces are each sent to separate, dedicated Log Analytics workspaces:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-05.png" alt-text="Diagram of example four, tenant and workspace logs sent to dedicated log workspaces.":::

**Example 5: Workspace logs sent to dedicated Log Analytics workspaces**

In this example, tenant logs are sent to a dedicated Log Analytics workspace, and all workspace logs are each sent to a single dedicated Log Analytics workspace:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-06.png" alt-text="Diagram of example five, tenant and workspace logs sent to separate log workspaces.":::

**Example 6: Tenant ant workspace logs sent to a single Log Analytics workspaces**

In this last example, tenant and workspace logs are sent to a single Log Analytics workspace:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-07.png" alt-text="Diagram of example six, tenant and workspace logs sent to one log workspace.":::

These examples highlight the various ways you can use Azure Log Analytics with Power BI, and get the log information you need.

In another article, you can see how to configure Azure Log Analytics to work with Power BI, with specific steps and requirements to get your logging working properly.


## Considerations and limitations
Keep the following considerations and limitations in mind when working with Azure Log Analytics and Power BI:

* Only Premium workspaces are supported, however Log Analytics settings appear for non-Premium workspaces
* Only the user who originally configured Log Analytics can view the existing Log Analytics configuration in Power BI. To any other admin or owner, Log Analytics screens appear unconfigured. Attempts by other admins or owners to configure those Log Analytics settings result in a permissions error.
* The *TimeGenerated* attribute is recording all 59.999 seconds for every *timestamp*. Hours and minutes are correct.
* The *Duration* attribute may be blank.
* Datasets created on the web by uploading a CSV files do not generate logs. 
* If the tenant administrator disables workspace-level Log Analytics, workspace owners will not be able to delete previously configured Log Analytics configurations.

## Next steps
The following articles provide more information about Power BI and its many features:

* [Configuring Azure Log Analytics for Power BI (Preview)](desktop-log-analytics-configure.md)
* [What is Power BI Premium?](../../admin/service-premium-what-is.md)
* [Organize work in the new workspaces in Power BI](../../collaborate-share/service-new-workspaces.md)
* [Creating a dataflow](../dataflows/dataflows-create.md)
* [Dataflows best practices](../dataflows/dataflows-best-practices.md)