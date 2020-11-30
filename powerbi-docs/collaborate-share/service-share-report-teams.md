---
title: Share directly to Microsoft Teams from the Power BI service
description: You can share Power BI dashboards and reports directly to Microsoft Teams from the Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 07/31/2020
---

# Share directly to Microsoft Teams from the Power BI service

You can share Power BI dashboards, reports, and visuals directly to Microsoft Teams from the Power BI service. Use the **Share to Teams** feature to quickly start conversations when you view reports and dashboards in the Power BI service.

## Requirements

To use the **Share to Teams** functionality in Power BI, ensure this setting:

- Power BI administrators haven't disabled **Share to Teams** tenant setting in the Power BI admin portal. This setting allows organizations to hide the **Share to Teams** buttons. See the [Power BI admin portal](../admin/service-admin-portal.md#share-to-teams) article for details.

See [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md) for background on how Power BI and Microsoft Teams work together, including other requirements.

## Share Power BI content to Microsoft Teams

Follow these steps to share links to reports, dashboards, and visuals in the Power BI service to Microsoft Teams channels and chats.

1. Select one of these options:

   * **Share to Teams** in the action bar of a dashboard or report:

       ![Screenshot of Share to Teams button in the action bar.](media/service-share-report-teams/service-teams-share-to-teams-action-bar-button.png)
    
   * **Share to Teams** in the context menu for a single visual:
    
      ![Screenshot of Share to Teams button in a visual contextual menu.](media/service-share-report-teams/service-teams-share-to-teams-visual-context-menu.png)

1. In the **Share to Microsoft Teams** dialog box, select the team or channel you want to send the link to. You can enter a message if you want. You might be asked to sign in to Microsoft Teams first.

    ![Screenshot of Share to Microsoft Teams dialog box with information and message.](media/service-share-report-teams/service-teams-share-to-teams-dialog.png)

1. Select **Share** to send the link.
    
1. The link is added to existing conversations or starts a new chat.

    ![Screenshot of Microsoft Teams conversation with link to a Power BI item.](media/service-share-report-teams/service-teams-share-to-teams-deep-link.png)

1. Select the link to open the item in the Power BI service.

1. If you used the contextual menu for a specific visual, the visual is highlighted when the report opens.

    ![Screenshot of Power BI report opened with a specific visual highlighted.](media/service-share-report-teams/service-teams-share-to-teams-spotlight-visual.png)


## Known issues and limitations

- Users without a Power BI license or permission to access the report see a "Content is not available" message.
- The **Share to Teams** buttons might not work if your browser uses strict privacy settings. Use the **Having trouble? Try opening in a new window** option if the dialog box doesn't open correctly.
- **Share to Teams** doesn't include a link preview.
- Link previews and **Share to Teams** don't give users permissions to view the item. Permissions must be managed separately.
- The **Share to Teams** button isn't available in visual context menus when a report author sets **More options** to **Off** for the visual.
- See the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article for other issues.

## Next steps

- [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
