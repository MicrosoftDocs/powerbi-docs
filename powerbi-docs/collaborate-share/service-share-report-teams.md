---
title: Chat in Microsoft Teams directly from the Power BI service
description: Learn how to share Power BI dashboards, reports, and semantic models directly to Microsoft Teams from the Power BI service.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: maya.bendov
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 6/23/2025
#customer intent: As a Power BI user I want to learn how to share dashboards, repoorts and semantic models.
---

# Chat in Microsoft Teams directly from the Power BI service

You can open a Teams chat about Power BI dashboards, reports, visuals, and semantic models directly from the Power BI service. Use the **Chat in Teams** feature to quickly start conversations when you view reports, dashboards, and [semantic models](../connect-data/service-dataset-details-page.md#supported-actions) in the Power BI service.

## Requirements

To use the **Chat in Teams** functionality in Power BI, make sure the **Share to Teams** tenant setting in the Power BI admin portal is enabled. This setting allows organizations to hide the **Chat in Teams** button. For more information, see the [Power BI admin portal](/fabric/admin/service-admin-portal-export-sharing#enable-microsoft-teams-integration-in-the-power-bi-service) article.

See [Collaborate in Microsoft Teams with Power BI](service-collaborate-microsoft-teams.md) for background on how Power BI and Microsoft Teams work together, including other requirements.

## Chat about Power BI content in Microsoft Teams

Follow these steps to share links to reports, dashboards, visuals, and semantic models in the Power BI service, and in Microsoft Teams channels and chats.

### Chat in Teams button

If you're using a a report in *edit* mode, or you're working in a dashboard, semantic model, app, or single visual: 

1. Select the **Chat in Teams** button.
1. In the **Share to Microsoft Teams** dialog, indicate the recipient, and add an optional message.
2. Select **Share** to send the link. The link is added to existing conversations or starts a new chat.

    :::image type="content" source="media/service-share-report-teams/share-to-teams-link.png" alt-text="Screenshot that shows the share button and the Teams link.":::

1. Select the link to open the item in the Power BI service.

If you used the contextual menu for a specific visual, the visual is highlighted when the report opens.

### Share button

If you're using a report in *view* mode: 

1. Select the **Share** button.
1. In the **Send link** dialog, indicate the link recipient, and add an optional message.
1. Select the **Teams** icon. You might be asked to sign in to Microsoft Teams.

    :::image type="content" source="media/service-share-report-teams/send-link-dialog.png" alt-text="Screenshot that shows the send link dialog.":::

1. In the **Share to Microsoft Teams** dialog, verify the recipient and message, then select **Share** to send the link. The link is added to existing conversations or starts a new chat.

    :::image type="content" source="media/service-share-report-teams/share-to-teams-link.png" alt-text="Screenshot that shows the share button and the Teams link.":::
   
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
