---
title: Refresh datasets from the Power BI apps for mobile devices
description: Learn how to refresh datasets using the Power BI app for iOS and Android mobile devices.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 07/10/2023
---
# Refresh datasets from the Power BI apps for mobile devices

As the owner of a dataset, or a user who has access to the dataset, you can view dataset info and refresh status, as well as trigger dataset refresh, directly from your Power BI mobile app. In addition, whenever a dataset you own has a scheduled refresh failure, you and [whoever you've specified to receive scheduled refresh failure notifications](../../connect-data/refresh-data.md#getting-refresh-failure-notifications), will get a notification in the app, so that the issue can be addressed in a timely manner.

Dataset support in the mobile apps focuses on viewing dataset info and refresh status, and triggering dataset refresh to address simple scheduled refresh errors. Use the Power BI service to perform more advanced dataset management tasks and to handle more complicated dataset refresh errors.

Dataset support is available in the Power BI apps for iOS and Android devices.

## View dataset info and refresh a dataset

If you're the owner of a dataset or a user who has access to the dataset, use the following steps to view dataset info and/or refresh the dataset.

1. Navigate to the workspace where the dataset is located and tap the **Datasets** tab. All the datasets you have access to in that workspace will be listed. A warning symbol indicates dataset refresh failures.

    :::image type="content" source="./media/mobile-apps-dataset-refresh/power-bi-app-dataset-list.png" alt-text="Screenshot of dataset list page in the Power BI mobile app." border="false":::

1. Tap the dataset you want to refresh. The Dataset info page opens, showing some details about the dataset. If there was a refresh failure, you can tap **See more** to display failure details. You'll be able to copy the details to facilitate investigating the failure.

    :::image type="content" source="./media/mobile-apps-dataset-refresh/power-bi-app-dataset-info-page.png" alt-text="Screenshot of dataset info page in the Power BI mobile app." border="false":::

3.	Tap **Refresh now** if you want to refresh the dataset. This button is disabled if a refresh is already in progress.

## Respond to a refresh failure notification

If you're a dataset owner, or a [specified recipient for scheduled refresh failure notifications](../../connect-data/refresh-data.md#getting-refresh-failure-notifications) for the dataset, you'll receive a notification on your mobile app when there's a scheduled refresh failure. Tap the notification to open the dataset info page, where you can view error details and refresh the dataset.

:::image type="content" source="./media/mobile-apps-dataset-refresh/power-bi-app-dataset-failure-notification.png" alt-text="Screenshot of dataset refresh failure notification in the Power BI mobile app." border="false":::

## Next steps

[Getting refresh failure notifications](../../connect-data/refresh-data.md#getting-refresh-failure-notifications)