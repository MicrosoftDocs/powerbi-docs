---
title: Tutorial for setting data alerts on Power BI service dashboards.
description: In this tutorial, you learn to set alerts to notify you when data in your dashboards changes beyond limits you set in the Microsoft Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: mihart
featuredvideoid: removed
ms.service: powerbi
ms.subservice: pbi-explore
ms.custom: sample-sales-and-marketing sample
ms.search.form: Set alerts on dashboards
ms.topic: tutorial
ms.date: 08/06/2024
#Customer intent: As a Power BI service consumer, I want to learn how to create and update a data alert so that I get notified when important data changes above/below my set threshold.
LocalizationGroup: Dashboards
---
# Tutorial: Set alerts on Power BI dashboards

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yynn.md)]

Use this tutorial to set alerts in the Power BI service to notify you when data on a dashboard changes above or below limits you set. Alerts can be set on tiles pinned from report visuals or from Power BI Q&A. Alerts can be set only on gauges, KPIs, and cards. When you set an alert, the only person who sees those alerts is you.

:::image type="content" source="media/end-user-alerts/card-gauge-kpi.png" alt-text="Screenshot showing part of a dashboard that includes a tile, a card, and a KPI.":::

Alerts only work on data that is refreshed. When data refreshes, Power BI looks to see if an alert is set for that data. If the data reaches an alert threshold, an alert is triggered.

This tutorial covers the following.
> [!div class="checklist"]
> * Who can set dashboard alerts
> * Which visuals support alerts
> * Who can see my alerts
> * Do alerts work on Power BI Desktop and mobile
> * How to create an alert
> * Where will I receive my alerts

## Prerequisites

* A Power BI license. To sign in to Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.
* Access to a dashboard with one of the following types of tile: gauge, KPI, or card. 
* A semantic model that refreshes.

## Who can set alerts

Alerts can be created in the Power BI service by customers with any license type. Set alerts on dashboard tiles:
- created in **My workspace**.
- shared with you in a [Premium reserved capacity](end-user-license.md). 
- saved in any workspace you can access, if you have a Power BI Pro or Premium Per User (PPU) license.

## Who can see alerts I create?

Only you can see the alerts you set, even if you share your dashboard. Data alerts are fully synchronized across platforms; set and view data alerts in the Power BI service,  [in the Power BI mobile apps](mobile/mobile-set-data-alerts-in-the-mobile-apps.md), and in Power BI for Teams. 

> [!WARNING]
> These alerts provide information about your data. If you view your Power BI data on a mobile device and that device gets stolen, we recommend using the Power BI service to turn off all alerts.

## Add an alert to a dashboard tile

Alerts can be set on three types of tiles (gauges, KPIs, and cards) on a Power BI dashboard. This tutorial uses the Sales and Marketing sample. To follow along, open the sample from the left nav pane **Learn** tab. Open the *Market share* report page and pin the **% Units Market Share** card to a dashboard.

1. From a dashboard gauge, KPI, or card tile, select the ellipses (...).

1. Select the alert icon, :::image type="icon" source="media/end-user-alerts/power-bi-alert-icon.png"::: or **Manage alerts**, to add one or more alerts for the **Market share** card.

1. On the **Manage alerts** pane, select **+ Add alert rule**. Ensure the slider is set to **On**, and give your alert a title. Titles help you easily recognize your alerts.

   :::image type="content" source="media/end-user-alerts/power-bi-alert.png" alt-text="Screenshot showing the rule window. The Alert title box contains a title, and the Active slider is set to On.":::

1. Scroll down and enter the alert details. In this example, we create an alert that notifies us once a day if our market share increases to 40% (.4) or higher. We opt to have Power BI send us an email when an alert is triggered. Triggered alerts also appear in our Notification center. 

   :::image type="content" source="media/end-user-alerts/power-bi-set-threshold.png" alt-text="Screenshot showing the window for managing alerts. The Condition is set to Above.":::

1. Select **Save and close**.

## Receiving alerts
When the data being tracked reaches one of the thresholds you set, several things happen. First, Power BI checks to see if more than an hour has passed, or more than 24 hours (depending on the option you selected), since the last alert was sent. As long as the data is past the threshold, you get an alert.

Next, Power BI sends an alert to your Notification center and, optionally, in email. Each alert contains a direct link to your data. Select the link to see the relevant tile.  

1. When you set the alert to send you an email, you find something like this in your Inbox. This email is from an alert we set for the **Sentiment** card.

   :::image type="content" source="media/end-user-alerts/power-bi-email.png" alt-text="Screenshot showing an email message for the Alert for Sentiment alert. A link in the message is labeled Go to dashboard.":::
2. Power BI also adds a message to your **Notification center**.

   :::image type="content" source="media/end-user-alerts/power-bi-task.png" alt-text="Screenshot showing the Power BI menu bar. The Search box and a few icon buttons are visible. The notification icon is called out.":::
3. Open your Notification center to see the alert details.

   :::image type="content" source="media/end-user-alerts/power-bi-notifications.png" alt-text="Screenshot showing the Notification center, with the notification icon called out and a few notifications visible.":::

## Managing alerts

There are many ways to manage your alerts: from the dashboard tile itself, from the Power BI Settings menu, on an individual tile in the [Power BI mobile app on the iPhone,](mobile/mobile-set-data-alerts-in-the-mobile-apps.md) or in the [Power BI mobile app for Windows 10](mobile/mobile-set-data-alerts-in-the-mobile-apps.md).

### From the tile itself

1. If you need to change or remove an alert for a tile, reopen the **Manage alerts** window. All the alerts that you set for that tile are displayed.

   :::image type="content" source="media/end-user-alerts/power-bi-manage-alert.png" alt-text="Screenshot showing the window for managing alerts, with the Alert for Market Share alert visible.":::
2. To modify an alert, select the arrow to the left of the alert name.

   :::image type="content" source="media/end-user-alerts/power-bi-alert-modify.png" alt-text="Screenshot showing the window for managing alerts. Next to the Alert for Market Share alert, the arrow is called out.":::
3. To delete an alert, select the trashcan to the right of the alert name.

   :::image type="content" source="media/end-user-alerts/power-bi-delete.png" alt-text="Screenshot showing the  window for managing alerts. Next to the Alert for Market Share alert, the trashcan icon is called out.":::

### From the Power BI settings menu

1. Select the gear icon from the Power BI menubar.

   :::image type="content" source="media/end-user-alerts/power-bi-gear-icon.png" alt-text="Screenshot showing the Power BI menu bar. The Search box and a few icon buttons are visible. The gear icon is called out.":::

2. Under **Settings** select **Notifications** > **Power BI Alerts**.

   :::image type="content" source="media/end-user-alerts/power-bi-setting.png" alt-text="Screenshot showing the Alerts tab of the Settings window. A few alerts are visible, and the Alerts tab is called out.":::

3. From here you can turn alerts on and off, open the **Manage alerts** window to make changes, or delete the alert.

## Considerations and limitations 

* If you're unable to set an alert for a gauge, KPI, or card, contact your Power BI admin or IT help desk for help. Sometimes alerts are turned off or unavailable for your dashboard or for specific types of dashboard tiles.
* Alerts only work on data that is refreshed. They don't work on static data. Most of the samples supplied by Microsoft are static. 
* The ability to receive and view shared content requires a few conditions to be met. Those conditions are that you have a Power BI Pro license, a Premium Per User license, or the report is saved in Premium reserved capacity. For more information, read [Which license do I have?](end-user-license.md).
* Alerts can be set on visuals created from streaming datasets that are pinned from a report to a dashboard. Alerts can't be set on streaming tiles created directly on the dashboard using **Add tile** > **Custom streaming data**.


## Clean up resources
Delete the alerts you created in this tutorial. Select the gear icon from the Power BI menubar. Under **Settings** select **Notifications** > **Power BI Alerts** and delete the alert.

> [!div class="nextstepaction"]
> [Set data alerts on your mobile device](mobile/mobile-set-data-alerts-in-the-mobile-apps.md)
