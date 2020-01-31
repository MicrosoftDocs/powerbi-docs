---
title: Embed report with the Power BI tab for Microsoft Teams
description: With Power BI's tab for Microsoft Teams, you can easily embed interactive Power BI reports in channels and chats.
author: LukaszPawlowski
ms.author: lukaszp
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
LocalizationGroup: Share your work
ms.date: 01/31/2020
---

# Embed report with the Power BI tab for Microsoft Teams

With Power BI's updated report tab for Microsoft Teams, you can easily embed interactive Power BI reports in Microsoft Teams channels and chats.

Use the Power BI tab for Microsoft Teams to help your colleagues find the data your team uses and to discuss the data within your team channels.

## Requirements

For the **Power BI tab for Microsoft Teams** to work, the following is required:
•	A Power BI Pro license or the report is contained in a [Power BI Premium capacity (EM or P SKU)](service-premium-what-is.md) with a Power BI license.
•	The Power BI tab for Microsoft Teams.
•	The user must sign into Power BI service to activate their Power BI license to consume the report.
•	The user must have permission to view the report.

## Embed your report
To embed your report into a Microsoft Teams channel or chat, add it as described below.

1. Open the desired channel or chat in Microsoft Teams and select the **+** icon.
//TODO insert image of + icon

2. Select the Power BI tab.
// TODO insert image of the power bi tab

3. Use the provided options to pick a report from a Workspace, Shared with me, or a Power BI app
//TODO insert image of the power bi tab experience

4. The Tab name is updated automatically to match the name of the report name, but you can change it. 

5. Press **Save**


## Grant access to reports

Embedding a report in Microsoft Teams doesn't automatically give users permission to view the report - you need to [allow users to view the report in Power BI](service-share-dashboards.md). You can use an Office 365 Group for your Team to make it easier. 

> [!IMPORTANT]
> Make sure to review who can see the report within the Power BI service and grant access to those not listed.

One way to ensure everyone on your team has access to reports you embed is to place them in a single workspace in Power BI and give the Office 365 Group for your team access to the workspace.

## Known issues and limitations

* Power BI does not support the same localized languages that Microsoft Teams does. As a result, you may not see proper localization within the embedded report.
* Power BI dashboards can’t be embedded in the Power BI Tab for Microsoft Teams.
* A user without a Power BI license or permission to the report will see a "Content is not available" message.
* You may encounter issues if using Internet Explorer 10. <!--You can look at the [browsers support for Power BI](consumer/end-user-browsers.md) and for [Office 365](https://products.office.com/office-system-requirements#Browsers-section). -->
* [URL filters](service-url-filters.md) are not supported with the Power BI tab for Microsoft Teams.

## Next steps
* [Share a dashboard with colleagues and others](service-share-dashboards.md)  
* [Create and distribute an app in Power BI](service-create-distribute-apps.md)  
* [What is Power BI Premium?](service-premium-what-is.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
