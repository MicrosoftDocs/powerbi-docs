---
title: Using Azure Log Analytics in Power BI
description: Overview of how to use log analytics in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Transform and shape data
---
# Using Azure Log Analytics in Power BI

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a Log Analytics connection to their Power BI subscription. This article describes how the integration between Log Analytics and Power BI works, and provides examples of how you can use Azure Log Analytics in your Power BI Premium subscription. 

Azure Log Analytics (LA) is a service within [Azure Monitor](https://azure.microsoft.com/services/monitor/) which Power BI uses to save activity logs. The Azure Monitor suite lets you collect, analyze, and act on telemetry data from your Azure and on-premises environments. It offers long-term storage, an ad-hoc query interface and API access to allow data export and integration with other systems. 

The Power BI integration with Log Analytics exposes events from the Analysis Services engine. The events are derived from existing [diagnostic logs available for Azure Analysis Services](/azure/analysis-services/analysis-services-logging). 

Once connected to Power BI, data is sent continuously and is available in Log Analytics in approximately 5 minutes. The following diagram shows how Azure Monitor operates, with the path taken by Power BI highlighted.

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-01.png" alt-text="Diagram of how Azure Monitor works with Power BI.":::

The following sections describe the integration of Azure Log Analytics with Power BI, the requirements necessary to connect Azure Log Analytics to Power BI, and considerations to keep in mind.


## Available scopes for logging

An Azure Log Analytics connection is currently supported for Premium workspaces in Power BI. The following table provides more information about the Workspace-level Log Analytics configuration.


|**Configuration level**  |**Role / permission**  |**Destination Table in Log Analytics**  |**Details**  |
|---------|---------|---------|---------|
|Workspace     |Power BI workspace owner, or Log Analytics workspace owner     |PowerBIDatasetsWorkspace  |- Must be allowed by the tenant administrator<br>- Logs activity from the workspace only<br>- Premium workspaces only<br>- Workspace v2 only |

The following section provides examples of how you might put logging to use in Power BI.

## Examples of logging scenarios

This section provides some examples of how you might configure Log Analytics for Power BI, and how selections you make will impact what is logged, and how the information is provided.

**Example 1: Workspace logs for one workspace only**

In this example, only workspace logs from *Workspace A* are sent to a dedicated Log Analytics workspace:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-03.png" alt-text="Diagram of example one, sending workspace logs only to another workspace.":::

**Example 2: Workspace logs sent to dedicated Log Analytics workspaces**

In this example, workspace logs from two differentPower BI workspaces are each sent to separate, dedicated Log Analytics workspaces:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-04.png" alt-text="Diagram of example two, separate workspace logs sent to dedicated log workspaces.":::

These examples highlight the various ways you can use Azure Log Analytics with Power BI, and get the log information you need.

In another article, you can see how to configure Azure Log Analytics to work with Power BI, with specific steps and requirements to get your logging working properly.

**Example 3: Workspace logs sent to dedicated Log Analytics workspace**

In this example, workspace logs from multiple Power BI workspaces are each sent to a dedicated Log Analytics workspace:

:::image type="content" source="media/desktop-log-analytics-overview/log-analytics-20.png" alt-text="Diagram of example three, separate workspace logs sent to dedicated log workspace.":::

These examples highlight the various ways you can use Azure Log Analytics with Power BI, and get the log information you need.

In another article, you can see how to configure Azure Log Analytics to work with Power BI, with specific steps and requirements to get your logging working properly.



## Considerations and limitations
Keep the following considerations and limitations in mind when working with Azure Log Analytics and Power BI:

* [Sovereign cloud](https://powerbi.microsoft.com/clouds/) support is currently limited to US Department of Defense and US Government Community Cloud High.
* Only Premium workspaces are supported.
* Only Workspace v2 support Log Analytics connections.
* Azure Log Analytics doesn't support tenant migration.
* Activities are only captured for semantic models physically hosted within the Premium workspace where you configure logging. For example, if you configure logging for Premium workspace A, you won't see logs for any reports within that use semantic models hosted in [Azure Analysis Services](https://azure.microsoft.com/services/analysis-services/#overview). You also won't see any logs for [shared semantic models](../../connect-data/service-datasets-share.md) that aren't in Premium workspace A. To capture activities for shared semantic models, configure logging on the workspace that contains the shared semantic model, not the workspace that contains the report.
* Semantic models created on the web by uploading a CSV file don't generate logs.
* If you have Multi-Factor Auth (MFA) in place for Azure but not Power BI, the configuration screens will give general Azure errors. A workaround is to first sign in to the [Azure portal](https://portal.azure.com), complete the MFA challenge and then log into Power BI in the same browser session.
* If you're using private links/VNets to isolate your Log Analytics workspaces, data ingestion into Log Analytics is unaffected. However, the [Log Analytics Template app(https://appsource.microsoft.com/product/power-bi/pbi_pcmm.powerbiloganalyticsforasengine?tab=Overview)] won't work because it relies on a public endpoint that is no longer accessible by the Power Service as a private link. A workaround is to use the [.pbit report template(https://github.com/microsoft/PowerBI-LogAnalytics-Template-Reports)] and refresh the data from inside the private VNet. You must set up a custom DNS mapping to ensure the public endpoint uses a private internal IP.
* For the Log Analytics feature, Power BI only sends data to the *PowerBIDatasetsWorkspace* table and doesn't send data to the to *PowerBIDatasetsTenant* table. This avoids storing duplicate data about log analytics in both locations. 


## Related content
The following articles provide more information about Power BI and its many features:

* [Configuring Azure Log Analytics for Power BI](desktop-log-analytics-configure.md)
* [Azure Log Analytics in Power BI FAQ](desktop-log-analytics-faq.md)
* [What is Power BI Premium?](../../enterprise/service-premium-what-is.md)
* [Organize work in workspaces in Power BI](../../collaborate-share/service-new-workspaces.md)
* [Creating a dataflow](../dataflows/dataflows-create.md)
* [Dataflows best practices](../dataflows/dataflows-best-practices.md)
