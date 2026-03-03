---
title: Work with semantic models in the Power BI apps for mobile devices
description: Learn how to refresh a semantic model, view its info, and see links to its related reports in the Power BI app for iOS and Android mobile devices.
author: dknappettmsft 
ms.author: daknappe
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 03/19/2025
---
# Work with semantic models in the Power BI apps for mobile devices

As the owner of a semantic model, or a user who has access to the semantic model, the Power BI app for mobile devices provides the following capabilities:

* You can view the semantic model's info and refresh status.
* You can refresh the semantic model.
* You get notified in the app whenever semantic model refresh fails, so that you can address the issue in a timely manner.
* You can view a list of the semantic model's related content. The items on the list are hyperlinked so that you can open them right from the list. Currently, only related reports are shown.

Semantic model support in the mobile apps focuses on viewing semantic model info and refresh status, on triggering semantic model refresh to address simple scheduled refresh errors, and on getting links to related content. Use the Power BI service to perform more advanced semantic model management tasks and to handle more complicated semantic model refresh errors.

## View semantic model info and refresh a semantic model

If you're the owner of a semantic model or a user who has access to the semantic model, use the following steps to view semantic model info and/or refresh the semantic model.

1. Navigate to the workspace where the semantic model is located and tap the **Semantic models** tab. All the semantic models you have access to in that workspace will be listed. A warning symbol indicates semantic model refresh failures.

    :::image type="content" source="../explore-reports/mobile/media/mobile-apps-dataset-refresh/power-bi-app-dataset-list.png" alt-text="Screenshot of semantic model list page in the Power BI mobile app." border="false":::

1. Tap the semantic model you want to refresh. The Semantic model info page opens, showing some details about the semantic model. If there was a refresh failure, you can tap **See more** to display failure details. You'll be able to copy the details to facilitate investigating the failure.

    :::image type="content" source="../explore-reports/mobile/media/mobile-apps-dataset-refresh/power-bi-app-dataset-info-page.png" alt-text="Screenshot of semantic model info page in the Power BI mobile app." border="false":::

3.	Tap **Refresh now** if you want to refresh the semantic model. This button is disabled if a refresh is already in progress.

## Respond to a refresh failure notification

If you're a semantic model owner, or a [specified recipient for scheduled refresh failure notifications](refresh-data.md#getting-refresh-failure-notifications) for the semantic model, you'll receive a notification on your mobile app when there's a scheduled refresh failure. Tap the notification to open the semantic model info page, where you can view error details and refresh the semantic model.

:::image type="content" source="../explore-reports/mobile/media/mobile-apps-dataset-refresh/power-bi-app-dataset-failure-notification.png" alt-text="Screenshot of semantic model refresh failure notification in the Power BI mobile app." border="false":::

## Find a semantic model's related content

To find and access a semantic model's related content:

1. Navigate to the workspace where the semantic model is located and tap the **Semantic models** tab. All the semantic models you have access to in that workspace will be listed.

1. Tap the semantic model whose related content you want to see.

1. The semantic model's info page opens. Tap **Linked content** to display the list of content that is built on the semantic model. The list shows only the related content you have access to. The name of the workspace each item is located in is shown directly below the item's name.

    :::image type="content" source="../explore-reports/mobile/media/mobile-apps-dataset-refresh/power-bi-app-dataset-linked-content.png" alt-text="Screenshot of semantic model linked content page in the Power BI mobile app." border="false":::

    > [!NOTE]
    > Currently, only related reports are listed.

1. Tap the related item you're interested in to open it.

## Related content

- [Getting refresh failure notifications](refresh-data.md#getting-refresh-failure-notifications)
