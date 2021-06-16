---
title: Azure Log Analytics in Power BI - FAQ (Preview)
description: Frequently asked questions about Azure Log Analytics in Power BI
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 06/16/2021
LocalizationGroup: Transform and shape data
---
# Azure Log Analytics in Power BI - FAQ (Preview)

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a Log Analytics connection to their Power BI subscription. 

This article is a collection of Frequently Asked Questions (FAQ) for reference during the preview period. When **Azure Log Analytics for Power BI** becomes generally available, this FAQ will be incorporated into other articles about the feature.

## Frequently asked questions

**Question:**  Which Analysis Services events are supported? What will the logs look like?

*Answer:*  Refer to [events and schema](desktop-log-analytics-configure.md#events-and-schema) for details. 

**Question:**  The schema only contains GUID identifiers, can you include the item names?

*Answer:*  We do plan to expose Report Name, Workspace Name and others by the time the feature reaches General Availability.

**Question:**  Are tenant and workspace logs different? Are they copies?

*Answer:*  The tenant log is separate from the workspace logs. They are independent copies. You can capture both log types, or only one. The log schemas are exactly the same.

**Question:**  What happens if I send logs from many Power BI workspaces to the same Log Analytics Workspace? How do I differentiate? 

*Answer:*  All logs will end up in the same table. You can differentiate by filtering on the workspace ID.

**Question:**  What happens if I send tenant and workspace logs to the same Log Analytics Workspace? 

*Answer:*  Tenant logs are stored in table *PowerBIDatasetsTenantPreview*. Workspace logs are stored in table *PowerBIDatasetsWorkspacePreview*. A user with access to the Log Analytics workspace will be able to query both tables.

**Question:**  Can we configure Log Analytics for non-Premium workspaces? 

*Answer:*  No, currently only Premium workspaces are supported.

**Question:**  How long does it take for logs to appear in Log Analytics? 

*Answer:*  Typically within 5 minutes of the activity being generated in Power BI. The logs are sent continuously.

**Question:**  What happens when I disconnect Log Analytics? Will I lose my data?

*Answer:*  Disconnecting is a non-destructive operation. Logs will stop flowing to Log Analytics, but everything else remains unchanged. Power BI will not alter permissions or delete data.

**Question:**  How much data is retained in Log Analytics?

*Answer:*  The default retention period is 31 days. You can adjust data retention period within the Azure portal, which currently can be increased to 730 days (two years).

**Question:**  What if the tenant administrator disables workspace-level logging?

*Answer:*  No new Log Analytics configurations can be made at workspace-level if that occurs. Any existing workspaces that have Log Analytics already configured will continue to send logs.

**Question:**  Do you support Blob Store and Event Hub destinations in Log Analytics?

*Answer:*  These are not currently supported, but your feedback is welcomed on how useful you would find those destinations.

**Question:**  What happens if I move my workspace out of a Premium capacity?

*Answer:*  Currently the Log Analytics configuration will not be deleted, but logs will stop flowing when the dataset is not in a Premium capacity. If you move it back to Premium capacity, logs will begin to flow again.

**Question:**  Do you support Workspace v1 for Log Analytics?

*Answer:*  Currently Workspace v1 logs will only be captured at the tenant level. There is no ability to configure Log Analytics for individual v1 workspaces.

**Question:**  There are a lot of events logged from the AS Engine. Can I choose which ones I want?

*Answer:*  Currently you cannot choose which events to log.

**Question:**  How much will Log Analytics cost?

*Answer:*  Azure Log Analytics bills storage, ingestion, and analytical queries independently. Cost also depends on the geographic region and will vary depending on how much activity is generated, how long you choose to store the data and how often you query it. An average Premium capacity generates about 30GB of logs monthly, but this can be higher for heavily utilized capacities. Refer to the cost calculator for more information. 


## Next steps
The following articles can help you learn more about Power BI, and about its integration with Azure Log Analytics.

* [Using Azure Log Analytics in Power BI (Preview)](desktop-log-analytics-overview.md)
* [Configuring Azure Log Analytics for Power BI (Preview)](desktop-log-analytics-configure.md)