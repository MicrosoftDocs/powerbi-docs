---
title: Choose start-up view
description: Learn how to choose an item that will load automatically whenever you open your Power BI mobile app.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 03/30/2024
---
# Choose a launch item for your Power BI mobile app

A launch item is an item that has been configured to display whenever you launch your mobile app instead of the app home page. It's useful if you have specific content that you always go to when you open your app, and you want to save time by being taken directly to that content rather than having to navigate to it every time.

A launch item can be a report, a specific report page, a dashboard, a scorecard, an app, or even a specific report within an app.

Individual users can configure a launch item for themselves, and [organizations can configure launch items for groups of users](./mobile-app-configuration.md#launch-item-configuration-ios-and-android). However, at any one time, only one launch item can be active for a user's Power BI mobile app. The individual user decides whether to use their own launch item or their organization's launch item.

If your organization has created a launch item, when you start up your app, you'll have the option of accepting or declining the organization's selection. If you decline the selection, you can always change your mind and activate the org's launch item suggestion in the [Launch item settings](#manage-your-launch-items).

If both you and your organization have configured launch items, you can choose which to use in your mobile app settings. See [Manage your launch item](#manage-your-launch-items).

Setting up a launch item doesn't mean you lose any features of the mobile app. All your Power BI content, and all the app's navigation features and pages, including the home page, are all still fully accessible.

**Admins**: For information about setting up a launch item for your organization, see [Remotely configure Power BI app using mobile device management (MDM) tool](./mobile-app-configuration.md#launch-item-configuration-ios-and-android)

## Set up a launch item

To mark an item as the launch item, open the desired item, tap **More options (…)**, and choose **Set as launch item**.

:::image type="content" source="./media/mobile-apps-launch-item/set-as-launch-item-option.png" alt-text="Screenshot of Set as launch item option in the Power BI mobile apps." border="false":::

Once you set an item as the launch item, it will be readily identifiable throughout the app by an icon.

:::image type="content" source="./media/mobile-apps-launch-item/set-as-launch-item-icon.png" alt-text="Screenshot of launch item icon in the Power BI mobile apps.":::

## Change your launch item

If you want to change your launch item, just open the new desired item and set it as the launch item as [described above](#set-up-a-launch-item). The previous item will automatically be removed as the launch item.

## Remove your launch item

If you want to remove an item as the launch item, just go to the item, open the **More options (...)** menu, and tap **Remove as launch item**.

:::image type="content" source="./media/mobile-apps-launch-item/remove-as-launch-item-option.png" alt-text="Screenshot of Remove as launch item option in the Power BI mobile apps." border="false":::

## Manage your launch items

You can manage your launch items in the **Launch item** section of your app's settings.

First, open your app's settings. If there's an active launch item, you'll see it indicated there.

:::image type="content" source="./media/mobile-apps-launch-item/launch-item-indication-app-settings.png" alt-text="Screenshot showing Launch item indication in app settings." border="false":::

To manage the launch items, tap the setting to open the **Launch item** settings.

In the settings, you see your personal launch item, if any, and any item that the organization has suggested as the launch item.

:::image type="content" source="./media/mobile-apps-launch-item/launch-item-settings.png" alt-text="Screenshot of Launch item settings." border="false":::

Use the radio buttons to choose which launch item to use. Use the toggle switch to enable/disable the launch item functionality.

## Related content

Admins: [Remotely configure Power BI app using mobile device management (MDM) tool](./mobile-app-configuration.md#launch-item-configuration-ios-and-android)