---
title: Embed Power BI reports in Microsoft Teams
description: Learn how to easily embed interactive Power BI reports in Microsoft Teams channels and chats.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
LocalizationGroup: Share your work
ms.date: 12/01/2022
---

# Embed Power BI content in Microsoft Teams

You can easily embed interactive Power BI reports in Microsoft Teams channels and chats. 

## Requirements

To embed a report on the **Power BI** tab in Teams, you need to meet these requirements:

- Teams has the **Power BI** tab.
- You have at least a Viewer role in the workspace that hosts the report. For information about the different roles, see [Roles in workspaces](service-roles-new-workspaces.md).

To view a report on the **Power BI** tab in Teams, your users need to meet these requirements:

- They're Teams users with access to channels and chats.
- They have permission in Power BI to view the report.

See [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md) for background on how Power BI and Microsoft Teams work together, including other requirements.

## Embed a report in Microsoft Teams

Follow these steps to embed your report in a Microsoft Teams channel or chat.

1. Open a channel or chat in Microsoft Teams, and select the **+** icon.

    ![Screenshot of how to add a tab to a channel or chat.](media/service-embed-report-microsoft-teams/service-embed-report-microsoft-teams-add.png)

1. Select the **Power BI** tab.

    ![Screenshot of the Microsoft Teams tab list showing Power BI.](media/service-embed-report-microsoft-teams/service-embed-report-microsoft-teams-tab.png)

1. Use the provided options to select a report from a workspace or a Power BI app.

    ![Screenshot of the Power BI tab for Microsoft Teams settings.](media/service-embed-report-microsoft-teams/service-embed-report-microsoft-teams-tab-settings.png)

    The tab name refreshes automatically to match the report name, but you can change it.

1. Select **Save**.

### Reports you can embed on the Power BI tab

You can embed the following report types on the **Power BI** tab:

- Power BI interactive reports (.pbix files)
- Power BI paginated reports (.rdl files)
- Reports in workspaces, including My workspace
- Reports in Power BI apps

## Start a conversation

When you add a Power BI report tab to Microsoft Teams, Microsoft Teams automatically creates a tab conversation for the report.

- Select the **Show tab conversation** icon in the upper-right corner.

    ![Screenshot of the Show tab conversation icon.](media/service-embed-report-microsoft-teams/power-bi-teams-conversation-icon.png)

    The first comment is a link to the report. Everyone in that Microsoft Teams channel can see and discuss the report in the conversation.

    ![Screenshot that shows the tab conversation.](media/service-embed-report-microsoft-teams/power-bi-teams-conversation-tab.png)

## Known issues and limitations

- In Microsoft Teams, when you export data from a visual in a Power BI report, the data is automatically saved to your *Downloads* folder. It's an Excel file called **data (*n*).xlsx**, where *n* is the number of times you've exported data to the same folder.
- You can't embed Power BI dashboards in the **Power BI** tab for Microsoft Teams.
- [URL filters](service-url-filters.md) aren't supported with the **Power BI** tab for Microsoft Teams.
- In national clouds, the **Power BI** tab isn't available.
- After you save the tab, you don't change the tab name through the tab settings. Use the **Rename** option to change it.
- For other issues, see "Known issues and limitations" in [Collaborate in Microsoft Teams](service-collaborate-microsoft-teams.md#known-issues-and-limitations).

## Next steps

- [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
