---
title: Tutorial:Set data alerts on the Power BI service dashboards
description: In this tutorial you'll learn to set alerts to notify you when data in your dashboards changes beyond limits you set in the Microsoft Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: mihart
featuredvideoid: removed
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 08/13/2021
#Customer intent: As a Power BI service consumer, I want to learn how to create and update a data alert so that I get notified when important data changes above/below my set threshold.
LocalizationGroup: Dashboards
---
# Tutorial: Set alerts on Power BI dashboards

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yynn.md)]


Set alerts in the Power BI service to notify you when data on a dashboard changes above or below limits you set. Alerts can be set on tiles pinned from report visuals or from Power BI Q&A, and only on gauges, KPIs, and cards. 

:::image type="content" source="media/end-user-alerts/card-gauge-kpi.png" alt-text="Screenshot showing part of a dashboard that includes a tile, a card, and a KPI.":::

Alerts can be created on dashboards:
- that you have created and saved in **My workspace**
- that have been shared with you in a [Premium reserved capacity](end-user-license.md). 
- in any workspace you can access, if you have a Power BI Pro or Premium Per User (PPU) license.    

Alerts only work on data that is refreshed. When data refreshes, Power BI looks to see if an alert is set for that data. If the data has reached an alert threshold, an alert is triggered. 

This feature is still evolving, so refer to the [Tips and troubleshooting section below](#tips-and-troubleshooting).



Only you can see the alerts you set, even if you share your dashboard. Data alerts are fully synchronized across platforms; set and view data alerts [in the Power BI mobile apps](mobile/mobile-set-data-alerts-in-the-mobile-apps.md), in Power BI for Teams, and in the Power BI service. 

> [!WARNING]
> These alerts provide information about your data. If you view your Power BI data on a mobile device and that device gets stolen, we recommend using the Power BI service to turn off all alerts.
> 

This tutorial covers the following.
> [!div class="checklist"]
> * Who can set alerts
> * Which visuals support alerts
> * Who can see my alerts
> * Do alerts work on Power BI Desktop and mobile
> * How to create an alert
> * Where will I receive my alerts

## Prerequisites

If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.

1. This example uses a dashboard card tile from the Sales & Marketing sample. Open the Power BI service (app.powerbi.com), sign in, and open your **My Workspace**.

   :::image type="content" source="media/end-user-alerts/power-bi-my-workspace.png" alt-text="Screenshot showing the left panel of Power BI, with My workspace called out.":::

2. In the bottom-left corner, select **Get data**.

   :::image type="content" source="media/end-user-alerts/power-bi-get-data.png" alt-text="Screenshot showing the Get data menu item.":::

3. On the Get data page that appears, select **Samples**.

4. Select the Sales and Marketing Sample, then choose **Connect**.

   :::image type="content" source="media/end-user-alerts/power-bi-sample.png" alt-text="Screenshot showing various samples, including the Sales amd Marketing sample.":::

5. After Power BI has connected to the sample, select **Go to dashboard** from the dialog that appears.

   :::image type="content" source="media/end-user-alerts/power-bi-go-to-dashboard.png" alt-text="Screenshot showing a message indicating that the dashboard is ready and a button labeled Go to dashboard.":::

## Add an alert to a dashboard tile

1. From a dashboard gauge, KPI, or card tile, select the ellipsis.

   :::image type="content" source="media/end-user-alerts/power-bi-card.png" alt-text="Screenshot of a card tile showing market share, with an ellipsis called out in the upper right corner.":::

1. Select the alert icon :::image type="icon" source="media/end-user-alerts/power-bi-alert-icon.png":::, or **Manage alerts**, to add one or more alerts for the **Market share** card.

   :::image type="content" source="media/end-user-alerts/power-bi-manage.png" alt-text="Screenshot showing the shortcut menu of the ellipsis, with Manage alerts called out.":::

1. On the **Manage alerts** pane, select **+ Add alert rule**.  Ensure the slider is set to **On**, and give your alert a title. Titles help you easily recognize your alerts.

   :::image type="content" source="media/end-user-alerts/power-bi-alert-manage.png" alt-text="Screenshot showing the Add alert rule window. The Alert title box contains a title, and the Active slider is set to On.":::

1. Scroll down and enter the alert details.  In this example we'll create an alert that notifies us once a day if our market share increases to 40 or higher. Alerts will appear in our [Notification center](end-user-notification-center.md). And we'll have Power BI send us an email as well.

   :::image type="content" source="media/end-user-alerts/power-bi-manage-alert-detail.png" alt-text="Screenshot showing the Manage alerts window. The Condition box is set to Above, the Threshold box contains 40, and the email check box is selected.":::

1. Select **Save and close**.

## Receiving alerts
When the data being tracked reaches one of the thresholds you've set, several things happen. First, Power BI checks to see if it has been more than an hour, or more than 24 hours (depending on the option you selected), since the last alert was sent. As long as the data is past the threshold, you'll get an alert.

Next, Power BI sends an alert to your Notification center and, optionally, in email. Each alert contains a direct link to your data. Select the link to see the relevant tile.  

1. If you've set the alert to send you an email, you'll find something like this in your Inbox. This is an alert we set for the **Sentiment** card.

   :::image type="content" source="media/end-user-alerts/power-bi-email.png" alt-text="Screenshot showing an email message for the Alert for Sentiment alert. A link in the message is labeled Go to dashboard.":::
2. Power BI also adds a message to your **Notification center**.

   :::image type="content" source="media/end-user-alerts/power-bi-task.png" alt-text="Screenshot showing the Power BI menu bar. The Search box and a few icon buttons are visible. The notification icon is called out.":::
3. Open your Notification center to see the alert details.

   :::image type="content" source="media/end-user-alerts/power-bi-notifications.png" alt-text="Screenshot showing the Notification center, with the notification icon called out and a few notifications visible.":::
   
  

## Managing alerts

There are many ways to manage your alerts: from the dashboard tile itself, from the Power BI Settings menu, on an individual tile in the [Power BI mobile app on the iPhone](mobile/mobile-set-data-alerts-in-the-mobile-apps.md) or in the [Power BI mobile app for Windows 10](mobile/mobile-set-data-alerts-in-the-mobile-apps.md).

### From the tile itself

1. If you need to change or remove an alert for a tile, re-open the **Manage alerts** window by selecting the alert icon :::image type="icon" source="media/end-user-alerts/power-bi-alert-icon.png":::. All the alerts that you've set for that tile are displayed.

   :::image type="content" source="media/end-user-alerts/power-bi-manage-alert.png" alt-text="Screenshot showing the Manage alerts window, with the Alert for Market Share alert visible.":::
2. To modify an alert, select the arrow to the left of the alert name.

   :::image type="content" source="media/end-user-alerts/power-bi-alert-modify.png" alt-text="Screenshot showing the Manage alerts window. Next to the Alert for Market Share alert, the arrow is called out.":::
3. To delete an alert, select the trashcan to the right of the alert name.

   :::image type="content" source="media/end-user-alerts/power-bi-delete.png" alt-text="Screenshot showing the Manage alerts window. Next to the Alert for Market Share alert, the trashcan icon is called out.":::

### From the Power BI settings menu

1. Select the gear icon from the Power BI menubar.

   :::image type="content" source="media/end-user-alerts/power-bi-gear-icon.png" alt-text="Screenshot showing the Power BI menu bar. The Search box and a few icon buttons are visible. The gear icon is called out.":::

2. Under **Settings** select **Alerts**.

   :::image type="content" source="media/end-user-alerts/power-bi-settings.png" alt-text="Screenshot showing the Alerts tab of the Settings window. A few alerts are visible, and the Alerts tab is called out.":::

3. From here you can turn alerts on and off, open the **Manage alerts** window to make changes, or delete the alert.

## Tips and troubleshooting 

* If you are unable to set an alert for a gauge, KPI, or card, contact your Power BI admin or IT help desk for help. Sometimes alerts are turned off or unavailable for your dashboard or for specific types of dashboard tiles.
* Alerts only work on data that is refreshed. They do not work on static data. Most of the samples supplied by Microsoft are static. 
* The ability to receive and view shared content requires a Power BI Pro license, a Premium Per User license, or for the report to be saved in Premium reserved capacity. For more information, read [Which license do I have?](end-user-license.md).
* Alerts can be set on visuals created from streaming datasets that are pinned from a report to a dashboard. Alerts can't be set on streaming tiles created directly on the dashboard using **Add tile** > **Custom streaming data**.


## Clean up resources
Instructions for deleting alerts are explained above. In brief, select the gear icon from the Power BI menubar. Under **Settings** select **Alerts** and delete the alert.

> [!div class="nextstepaction"]
> [Set data alerts on your mobile device](mobile/mobile-set-data-alerts-in-the-mobile-apps.md)


