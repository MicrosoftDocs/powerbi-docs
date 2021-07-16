---
title: Set data alerts in the Power BI service
description: Learn to set alerts to notify you when data in your dashboards changes beyond limits you set in Microsoft Power BI service.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom: video-JbL2-HJ8clE
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/23/2021
LocalizationGroup: Dashboards
---

# Data alerts in the Power BI service

Set alerts to notify you when data in your dashboards changes beyond limits you set.

You can set alerts on tiles in your My Workspace. You can also set alerts if someone shares a dashboard that's in a [Premium capacity](../admin/service-premium-what-is.md). If you have a Power BI Pro license, you can set alerts on tiles in any other workspace, too. Alerts can only be set on tiles pinned from report visuals, and only on gauges, KPIs, and cards. Alerts can be set on visuals created from streaming datasets that you pin from a report to a dashboard. Alerts can't be set on streaming tiles created directly on the dashboard using **Add tile** > **Custom streaming data**.

Only you can see the alerts you set, even if you share your dashboard. Even the dashboard owner can't see alerts you set on your view of their dashboard. Data alerts are fully synchronized across platforms; set and view data alerts [in the Power BI mobile apps](../consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md) and in the Power BI service. They aren't available for Power BI Desktop. You can even automate and integrate alerts with Power Automate. You can try it yourself in this [Power Automate and Power BI](../collaborate-share/service-flow-integration.md) article.

![tiles](media/service-set-data-alerts/powerbi-alert-types-new.png)

> [!WARNING]
> Data-driven alert notifications provide information about your data. If you view your Power BI data on a mobile device and that device is lost or stolen, we recommend using the Power BI service to turn off all data-driven alert rules.

## Set data alerts in the Power BI service

Watch Amanda add some alerts to tiles on the dashboard. Then follow the step-by-step instructions below the video to try it out yourself.

<iframe width="560" height="315" src="https://www.youtube.com/embed/JbL2-HJ8clE" frameborder="0" allowfullscreen></iframe>

This example uses a card tile from the Retail Analysis sample dashboard. [Get the Retail Analysis sample](sample-retail-analysis.md#get-the-content-pack-for-this-sample) if you want to follow along.

1. Start on a dashboard. From the **Total stores** tile, select the ellipses.

   ![Total Stores tile](media/service-set-data-alerts/powerbi-card.png)

1. Select **Manage alerts** to add one or more alerts for **Total Stores**.

   ![Screenshot of the More options menu with Manage alerts highlighted.](media/service-set-data-alerts/manage-alerts.png) 

1. To start, select **+ Add alert rule**, ensure the **Active** slider is set to **On**, and give your alert a title. Titles help you easily recognize your alerts.

   ![Screenshot shows the Manage alerts window with Add alert rule, Alert for Total Stores, and Alert title called out.](media/service-set-data-alerts/powerbi-alert-title.png)

1. Scroll down and enter the alert details.  In this example, you'll create an alert that notifies you once a day if the number of total stores goes above 100.

   ![Manage alerts window, set Threshold](media/service-set-data-alerts/power-bi-set-alert-details.png)

    Alerts appear in your **Notification center**. Power BI also sends you an email about the alert, if you select the check box.

1. Select **Save and close**.

## Receiving alerts

When the tracked data reaches one of the thresholds you've set, several things happen. First, Power BI checks to see if it's been more than an hour or more than 24 hours (depending on the option you selected) since the last alert. If the data is past the threshold, you'll get an alert.

Next, Power BI sends an alert to your **Notification center** and, optionally, an email. Each alert contains a direct link to your data. Select the link to see the relevant tile where you can explore, share, and learn more.  

* If you've set the alert to send you an email, you'll find something like this in your Inbox.

   ![Alert email](media/service-set-data-alerts/powerbi-alerts-email.png)

* Power BI adds a message to your **Notification center** and adds a new alert icon to the applicable tile.

   ![Notification icon in Power BI service](media/service-set-data-alerts/powerbi-alert-notifications.png)

* Your **Notification center** displays the alert details.

    ![read the Alert](media/service-set-data-alerts/powerbi-alert-notification.png)

   > [!NOTE]
   > Alerts only work on refreshed data. When data refreshes, Power BI looks to see if an alert is set for that data. If the data has reached an alert threshold, Power BI triggers an alert.

## Managing alerts

There are many ways to manage your alerts:

* From the dashboard tile.

* From the Power BI Settings menu.

* On a tile in the [Power BI mobile apps](../consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md).

### From the dashboard tile

1. If you need to change or remove an alert for a tile, reopen the **Manage alerts** window by selecting **Manage alerts**.

   ![Screenshot of Manage alerts on the More options menu.](media/service-set-data-alerts/manage-alerts.png) 

    Power BI displays the alert(s) that you've set for that tile.

    ![Screenshot shows the Manage alerts window.](media/service-set-data-alerts/powerbi-see-alerts.png)

1. To modify an alert, select the arrow to the left of the alert name.

    ![arrow next to Alert name](media/service-set-data-alerts/powerbi-see-alerts-arrow.png)

1. To delete an alert, select the trashcan to the right of the alert name.

      ![trashcan icon selected](media/service-set-data-alerts/powerbi-see-alerts-delete.png)

### From the Power BI settings menu

1. Select the gear icon from the Power BI menu bar and select **Settings**.

    ![gear icon](media/service-set-data-alerts/powerbi-gear-icon.png).

1. Under **Settings** select **Alerts**.

    ![Alerts tab of Settings window](media/service-set-data-alerts/powerbi-alert-settings.png)

1. From here you can turn alerts on and off, open the **Manage alerts** window to make changes, or delete the alert.

## Considerations and troubleshooting

* Alerts aren't supported for card tiles with date/time measures.
* Alerts only work with numeric data types.
* Alerts only work on refreshed data. They don't work on static data.
* Alerts only work on streaming datasets if you build a KPI, card, or gauge report visual and then pin that visual to the dashboard.


## Next steps

* [Create a Power Automate that includes a data alert](../collaborate-share/service-flow-integration.md).

* [Set data alerts on your mobile device](../consumer/mobile/mobile-set-data-alerts-in-the-mobile-apps.md).

* [What is Power BI?](../fundamentals/power-bi-overview.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
