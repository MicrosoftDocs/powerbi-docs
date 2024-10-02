---
title: Azure Log Analytics in Power BI - FAQ
description: Learn about how Power BI is integrating with Azure Log Analytics and the answers to frequently asked questions about the changes.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 10/01/2024
LocalizationGroup: Transform and shape data
#customer intent: As a Power BI user I want to learn about Azure Log  Analytics integration.
---
# Azure Log Analytics in Power BI - FAQ

Power BI is integrating with Azure Log Analytics (LA) to enable administrators and Premium workspace owners to configure a Log Analytics connection to their Power BI subscription.

## Frequently asked questions

### What areas of Power BI are available for Log Analytics integration?  

*Answer:* Semantic model activity logs (such as Analysis Services engine traces) are currently available.  

### When should I use Log Analytics for the Analysis Services engine?  

*Answer:* Engine logs are detailed and can be high volume and large, averaging 3-4 KB each for complex semantic models. Therefore we recommend carefully considering when to use logging for the Analysis Service engine. **Typical use cases for logging are performance investigations, scale/load testing or pre-release validation.**  

### Which Analysis Services events are supported? What do the logs look like?  

*Answer:*  For information on events and logs see [events and schema](desktop-log-analytics-configure.md#events-and-schema).  

### I can't get Owner permissions for Azure Log Analytics in my organization. Is there a workaround?  

*Answer:*  Yes, you need some help from administrators:  

OPTION 1:  
An Azure admin can grant you Owner rights in Log Analytics only to perform the initial configuration in Power BI. After you complete the initial configuration, they can reduce your access to Contributor or lower as required.  

OPTION 2:  
For workspace level configuration, you can add an Azure admin as a Power BI workspace admin and ask them to configure logging for your workspace. After logging is configured, you can remove their access to your workspace.

### I can't get workspace Admin permissions for Power BI in my organization. Is there a workaround?  

*Answer:*  Yes. Refer to option 2 in the previous question.  

### What happens if I send logs from many Power BI workspaces to the same Log Analytics workspace? How do I differentiate?  

*Answer:*  Each log entry is marked with the corresponding Power BI Workspace ID.

### Can we configure Log Analytics for non-Premium workspaces?  

*Answer:*  No, currently only Premium workspaces are supported.  

### How long does it take for logs to appear in Log Analytics?  

*Answer:*  Typically within 5 minutes of the activity being generated in Power BI. The logs are sent continuously.  

### What happens when I disconnect Log Analytics? Will I lose my data?  

*Answer:*  Disconnecting is a nondestructive operation. Logs stop flowing to Log Analytics, but everything else remains unchanged. Power BI doesn't alter permissions or delete data.  

### How much data is retained in Log Analytics?  

*Answer:*  The default retention period is 31 days. You can adjust data retention period within the Azure portal, which currently can be increased to 730 days (two years).  

### What if the tenant administrator disables workspace-level logging?  

*Answer:*  No new Log Analytics configurations can be made at the workspace-level if that occurs. Any existing workspaces that have Log Analytics already configured continue to send logs.  

### Do you support Blob Store and Event Hubs destinations in Log Analytics?  

*Answer:*  Blob Store and Event Hubs destinations aren't currently supported, but your feedback is welcomed on how useful you would find those destinations.  

### What happens if I move my workspace out of a Premium capacity?  

*Answer:*  Currently the Log Analytics configuration aren't deleted, but logs stop flowing when the semantic model isn't in a Premium capacity. If you move it back to Premium capacity, logs begin to flow again.  

### Do you support workspace v1 for Log Analytics?  

*Answer:*  There's no ability to configure Log Analytics for individual v1 workspaces.  

### There are numerous events logged from the Analysis Services engine. Can I choose which ones I want?  

*Answer:*  Currently you can't choose which events to log.  

### How much will Log Analytics cost?  

*Answer:*  Azure Log Analytics bills storage, ingestion, and analytical queries independently. Cost also depends on the geographic region. It varies depending on how much activity is generated, how long you choose to store the data, and how often you query it. An average Premium capacity generates about 35 GB of logs monthly, but the storage size of logs can be higher for heavily utilized capacities. For for information, see the [pricing calculator](https://azure.microsoft.com/pricing/calculator/).

## Related content

The following articles can help you learn more about Power BI, and about its integration with Azure Log Analytics.

* [Using Azure Log Analytics in Power BI](desktop-log-analytics-overview.md)
* [Configuring Azure Log Analytics for Power BI](desktop-log-analytics-configure.md)
