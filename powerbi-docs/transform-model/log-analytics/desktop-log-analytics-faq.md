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

**Question:** What areas of Power BI are available for Log Analytics integration?  

*Answer:* Currently dataset activity logs (i.e. Analysis Services Engine traces) are available in the Preview. More areas of Power BI are planned for Azure Log Analytics integration in future.  

**Question:** When should I use Log Analytics for the Analysis Services Engine?  

*Answer:* Engine logs are very detailed and can be high volume and large, avergaging 3-4KB each for complex datasets. Therefore we recommend carefully considering when to use logging for the Analysis Service engine. **Typical use cases for logging are performance investigations, scale/load testing or pre-release validation.**  

**Question:**  Which Analysis Services events are supported? What will the logs look like?  

*Answer:*  Refer to [events and schema](desktop-log-analytics-configure.md#events-and-schema) for details.  

**Question:**  I cannot get Owner permissions for Azure Log Analytics in my organization, is there a workaround?  

*Answer:*  Yes, you will need some help from administrators:  
OPTION 1:  
An Azure admin can grant you Owner rights in Log Analytics only to perform the initial configuration in Power BI. After this, they can reduce your access to Contributor or lower as required.  
OPTION 2:  
For workspace level configuration, you can add an Azure admin as a Power BI Workspace admin and ask them to configure logging for your workspace. Once logging is configured you can remove their access to your workspace.

**Question:**  I cannot get Workspace Admin permissions for Power BI in my organization, is there a workaround?  

*Answer:*  Yes. Please refer to option 2 in the previous question.  

**Question:**  The schema only contains some GUID identifiers, can you include the item names?  

*Answer:*  We hope to expose Report Name, Workspace Name and others as the feature progresses towards General Availability.  

**Question:**  What happens if I send logs from many Power BI workspaces to the same Log Analytics Workspace? How do I differentiate?  

*Answer:*  This configuration is currently not supported. In future this will allow many workspace's logs to end up in the same Log analytics table. You can differentiate by filtering on the workspace ID.  

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

*Answer:*  There is no ability to configure Log Analytics for individual v1 workspaces.  

**Question:**  There are a lot of events logged from the AS Engine. Can I choose which ones I want?  

*Answer:*  Currently you cannot choose which events to log, though this feature is planned.  

**Question:**  How much will Log Analytics cost?  

*Answer:*  Azure Log Analytics bills storage, ingestion, and analytical queries independently. Cost also depends on the geographic region and will vary depending on how much activity is generated, how long you choose to store the data and how often you query it. An average Premium capacity generates about 35GB of logs monthly, but this can be higher for heavily utilized capacities. Refer to the cost calculator for more information.  


## Next steps
The following articles can help you learn more about Power BI, and about its integration with Azure Log Analytics.

* [Using Azure Log Analytics in Power BI (Preview)](desktop-log-analytics-overview.md)
* [Configuring Azure Log Analytics for Power BI (Preview)](desktop-log-analytics-configure.md)
