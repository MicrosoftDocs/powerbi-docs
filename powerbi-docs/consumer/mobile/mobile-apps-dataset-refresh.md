---
title: Refresh semantic models from the Power BI apps for mobile devices
description: Learn how to refresh semantic models using the Power BI app for iOS and Android mobile devices.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 11/15/2023
---
# Refresh semantic models from the Power BI apps for mobile devices

As the owner of a semantic model ([previously known as a Power BI dataset](../../connect-data/service-datasets-rename.md)), or a user who has access to the semantic model, you can view semantic model info and refresh status, as well as trigger semantic model refresh, directly from your Power BI mobile app. In addition, whenever a semantic model you own has a scheduled refresh failure, you and [whoever you've specified to receive scheduled refresh failure notifications](../../connect-data/refresh-data.md#getting-refresh-failure-notifications) will get a notification in the app, so that the issue can be addressed in a timely manner.

Semantic model support in the mobile apps focuses on viewing semantic model info and refresh status, and triggering semantic model refresh to address simple scheduled refresh errors. Use the Power BI service to perform more advanced semantic model management tasks and to handle more complicated semantic model refresh errors.

This article applies to the Power BI apps for iOS and Android devices.

## View semantic model info and refresh a semantic model

If you're the owner of a semantic model or a user who has access to the semantic model, use the following steps to view semantic model info and/or refresh the semantic model.

1. Navigate to the workspace where the semantic model is located and tap the **Semantic models** tab. All the semantic models you have access to in that workspace will be listed. A warning symbol indicates semantic model refresh failures.

    :::image type="content" source="./media/mobile-apps-dataset-refresh/power-bi-app-dataset-list.png" alt-text="Screenshot of semantic model list page in the Power BI mobile app." border="false":::

1. Tap the semantic model you want to refresh. The Semantic model info page opens, showing some details about the semantic model. If there was a refresh failure, you can tap **See more** to display failure details. You'll be able to copy the details to facilitate investigating the failure.

    :::image type="content" source="./media/mobile-apps-dataset-refresh/power-bi-app-dataset-info-page.png" alt-text="Screenshot of semantic model info page in the Power BI mobile app." border="false":::

3.	Tap **Refresh now** if you want to refresh the semantic model. This button is disabled if a refresh is already in progress.

## Respond to a refresh failure notification

If you're a semantic model owner, or a [specified recipient for scheduled refresh failure notifications](../../connect-data/refresh-data.md#getting-refresh-failure-notifications) for the semantic model, you'll receive a notification on your mobile app when there's a scheduled refresh failure. Tap the notification to open the semantic model info page, where you can view error details and refresh the semantic model.

:::image type="content" source="./media/mobile-apps-dataset-refresh/power-bi-app-dataset-failure-notification.png" alt-text="Screenshot of semantic model refresh failure notification in the Power BI mobile app." border="false":::

## Related content

- [Getting refresh failure notifications](../../connect-data/refresh-data.md#getting-refresh-failure-notifications)