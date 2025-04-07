---
title: Chat in Microsoft Teams directly from the Power BI service
description: Learn how to share Power BI dashboards, reports, and semantic models directly to Microsoft Teams from the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 12/10/2024
#customer intent: As a Power BI user I want to learn how to share dashboards, repoorts and semantic models.
---

# Chat in Microsoft Teams directly from the Power BI service

You can open a Teams chat about Power BI dashboards, reports, visuals, and semantic models directly from the Power BI service. Use the **Chat in Teams** feature to quickly start conversations when you view reports, dashboards, and [semantic models](../connect-data/service-dataset-details-page.md#supported-actions) in the Power BI service.

## Requirements

To use the **Chat in Teams** functionality in Power BI, make sure the **Share to Teams** tenant setting in the Power BI admin portal is enabled. This setting allows organizations to hide the **Chat in Teams** button. For more information, see the [Power BI admin portal](/fabric/admin/service-admin-portal-export-sharing#enable-microsoft-teams-integration-in-the-power-bi-service) article.

See [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md) for background on how Power BI and Microsoft Teams work together, including other requirements.

## Chat about Power BI content in Microsoft Teams

Follow these steps to share links to reports, dashboards, visuals, and semantic models in the Power BI service, and in Microsoft Teams channels and chats.

1. In either the Power BI service or in Microsoft Teams, select one of these options:

   * **Chat in Teams** in the action bar of a dashboard, report, or semantic model:

       :::image type="content" source="media/service-share-report-teams/service-teams-share-to-teams-action-bar-button.png" alt-text="Screenshot that shows the Chat in Teams button in the action bar.":::

   * **Chat in Teams** in the context menu for a single visual:

       :::image type="content" source="media/service-share-report-teams/service-teams-share-to-teams-visual-context-menu.png" alt-text="Screenshot shows the Chat in Teams button in a visual contextual menu.":::

   * **Chat in Teams**  in the action bar of an app.

       :::image type="content" source="media/service-share-report-teams/service-teams-share-to-teams-action-bar-button-apps.png" alt-text="Screenshot that shows the Chat in Teams button in a visual contextual menu.":::

1. In the **Share to Microsoft Teams** dialog, select the person, group, or channel you want to send the link to. You can enter a message if you want. You might be asked to sign in to Microsoft Teams first.

    :::image type="content" source="media/service-share-report-teams/service-teams-share-to-teams-action-bar-button-pressed.png" alt-text="Screenshot that shows the Share to Microsoft Teams dialog.":::

1. Select **Share** to send the link. The link is added to existing conversations or starts a new chat.

    :::image type="content" source="media/service-share-report-teams/service-teams-share-to-teams-dialog.png" alt-text="Screenshot that shows the action bar button for apps.":::

1. Select the link to open the item in the Power BI service.

1. If you used the contextual menu for a specific visual, the visual is highlighted when the report opens.

    :::image type="content" source="media/service-share-report-teams/service-teams-share-to-teams-spotlight-visual.png" alt-text="Screenshot that highlights a section in an open Power BI report.":::

## Known issues and limitations

* Users without a Power BI license or permission to access the report see a "Content isn't available" message.
* The **Chat in Teams** button might not work if your browser uses strict privacy settings. Use the **Having trouble? Try opening in a new window** option if the dialog doesn't open correctly.
* **Chat in Teams** doesn't include a link preview.
* Link previews and **Chat in Teams** don't give users permissions to view the item. Permissions must be managed separately.
* The **Chat in Teams** button isn't available in visual context menus when a report author sets **More options** to **Off** for the visual.
* For other issues, see the [Known issues and limitations](service-collaborate-microsoft-teams.md#known-issues-and-limitations) section of the "Collaborate in Microsoft Teams" article.

## Related content

* [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md)

Questions? [Try asking the Power BI Community](https://community.powerbi.com/).
