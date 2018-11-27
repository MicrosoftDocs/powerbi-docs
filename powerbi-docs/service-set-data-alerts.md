---
title: Set data alerts in the Power BI service
description: Learn to set alerts to notify you when data in your dashboards changes beyond limits you set in Microsoft Power BI service.
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
featuredvideoid: JbL2-HJ8clE

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 02/28/2018
ms.author: maggies

LocalizationGroup: Dashboards
---
# Data alerts in Power BI service
Set alerts to notify you when data in your dashboards changes beyond limits you set. 

You can set alerts on tiles if you have a Power BI Pro license, or if a dashboard has been shared with you from a [Premium capacity](service-premium.md). Alerts can only be set on tiles pinned from report visuals, and only on gauges, KPIs and cards. Alerts can be set on visuals created from streaming datasets that have been pinned from a report to a dashboard, but cannot be set on streaming tiles created directly on the dashboard using **Add tile** > **Custom streaming data**. 

Only you can see the alerts you set, even if you share your dashboard. Data alerts are fully synchronized across platforms; set and view data alerts [in the Power BI mobile apps](consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md) and in the Power BI service. They are not available for Power BI Desktop. Alerts can even be [automated and integrated with Microsoft Flow](https://flow.microsoft.com) - [try it out yourself](service-flow-integration.md).

![tiles](media/service-set-data-alerts/powerbi-alert-types-new.png)

> [!WARNING]
> Data-driven alert notifications provide information about your data. If you view your Power BI data on a mobile device and that device gets stolen, we recommend using the Power BI service to turn off all data-driven alert rules.
> 
> 

## Set data alerts in Power BI service
Watch Amanda add some alerts to tiles on her dashboard. Then follow the step-by-step instructions below the video to try it out yourself.

<iframe width="560" height="315" src="https://www.youtube.com/embed/JbL2-HJ8clE" frameborder="0" allowfullscreen></iframe>

This example uses a card tile from the Retail Analysis sample dashboard.

1. Start on a dashboard. From a dashboard gauge, KPI, or card tile, select the ellipses.
   
   ![Total Stores tile](media/service-set-data-alerts/powerbi-card.png)
2. Select the bell icon ![Alert icon](media/service-set-data-alerts/power-bi-bell-icon.png) to add one or more alerts for **Total stores**.
   
1. To start, select **+ Add alert rule**, ensure the slider is set to **On**, and give your alert a title. Titles help you easily recognize your alerts.
   
   ![Manage alerts window](media/service-set-data-alerts/powerbi-alert-title.png)
4. Scroll down and enter the alert details.  In this example we'll create an alert that notifies us once a day if the number of total stores goes above 100. Alerts will appear in our Notification center. And we'll have Power BI send us an email as well.
   
   ![Manage alerts window, set Threshold](media/service-set-data-alerts/power-bi-set-alert-details.png)
5. Select **Save**.

## Receiving alerts
When the data being tracked reaches one of the thresholds you've set, several things will happen. First, Power BI checks to see if it's been more than an hour or more than 24 hours (depending on the option you selected) since the last alert was sent. As long as the data is past the threshold, you'll get an alert.

Next, Power BI sends an alert to your notification center and, optionally, in email. Each alert contains a direct link to your data. Select the link to see the relevant tile where you can explore, share, and learn more.  

1. If you've set the alert to send you an email, you'll find something like this in your Inbox.
   
   ![Alert email](media/service-set-data-alerts/powerbi-alerts-email.png)
2. Power BI adds a message to your **Notification center** and adds a new alert icon to the applicable tile.
   
   ![Notification icon in Power BI service](media/service-set-data-alerts/powerbi-alert-notifications.png)
3. Open your Notification center to see the alert details.
   
    ![read the Alert](media/service-set-data-alerts/powerbi-alert-notification.png)
   
   > [!NOTE]
   > Alerts only work on data that is refreshed. When data refreshes, Power BI looks to see if an alert is set for that data. If the data has reached an alert threshold, an alert is triggered.
   > 
   > 

## Managing alerts
There are many ways to manage your alerts: From the dashboard tile itself, from the Power BI Settings menu, on an individual tile in the [Power BI mobile app on the iPhone](consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md) or in the [Power BI mobile app for Windows 10](consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md).

### From the tile itself
1. If you need to change or remove an alert for a tile, re-open the **Manage alerts** window by selecting the bell icon ![Alert icon](media/service-set-data-alerts/power-bi-bell-icon.png). All the alerts that you've set for that tile are displayed.
   
    ![Manage alerts window](media/service-set-data-alerts/powerbi-see-alerts.png).
2. To modify an alert, select the arrow to the left of the alert name.
   
    ![arrow next to Alert name](media/service-set-data-alerts/powerbi-see-alerts-arrow.png).
3. To delete an alert, select the trashcan to the right of the alert name.
   
      ![trashcan icon selected](media/service-set-data-alerts/powerbi-see-alerts-delete.png)

### From the Power BI settings menu
1. Select the gear icon from the Power BI menubar.
   
    ![gear icon](media/service-set-data-alerts/powerbi-gear-icon.png).
2. Under **Settings** select **Alerts**.
   
    ![Alerts tab of Settings window](media/service-set-data-alerts/powerbi-alert-settings.png)
3. From here you can turn alerts on and off, open the **Manage alerts** window to make changes, or delete the alert.

## Tips and troubleshooting
* Alerts are currently not supported for Bing tiles, or card tiles with date/time measures.
* Alerts only work with numeric data types.
* Alerts only work on data that is refreshed. They do not work on static data.
* Alerts will only work on streaming datasets if you build a KPI/card/gauge report visual and then pin that visual to the dashboard.

## Next steps
[Create a Microsoft Flow that includes a data alert](service-flow-integration.md)    
[Set data alerts on your mobile device](consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md)    
[What is Power BI?](power-bi-overview.md)    
More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

