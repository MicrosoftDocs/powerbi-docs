---
title: Set data alerts in the Power BI mobile apps
description: Learn to set alerts in the Power BI mobile apps to notify you when data in a dashboard changes beyond limits you set.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 04/06/2021
---
# Set data alerts in the Power BI mobile apps
Applies to:

| ![iPhone](./media/mobile-set-data-alerts-in-the-mobile-apps/iphone-logo-50-px.png) | ![iPad](./media/mobile-set-data-alerts-in-the-mobile-apps/ipad-logo-50-px.png) | ![Android phone](./media/mobile-set-data-alerts-in-the-mobile-apps/android-phone-logo-50-px.png) | ![Android tablet](./media/mobile-set-data-alerts-in-the-mobile-apps/android-tablet-logo-50-px.png) |
|:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |

You can set alerts on dashboards in the Power BI mobile apps and in the Power BI service. Alerts notify you when data in a tile changes beyond limits you set. Alerts work for tiles featuring a single number, such as cards and gauges, but not with streaming data. You can set data alerts on your mobile device and see them in the Power BI service, and vice versa. Only you can see the data alerts you set, even if you share a dashboard or a snapshot of a tile.

You can set alerts on tiles if you have a Power BI Pro license, or if the shared dashboard is in a Premium capacity. 

> [!WARNING]
> Data-driven alert notifications provide information about your data. If your device gets stolen, we recommend going to the Power BI service to turn off all data-driven alert rules. 
> 
> Learn more about [managing data alerts in the Power BI service](../../create-reports/service-set-data-alerts.md).
> 
> 

## Data alerts on an iPhone or iPad
### Set an alert on an iPhone or iPad
1. Tap a number or gauge tile in a dashboard to open it in focus mode.  
   
   ![Screenshot of a dashboard, showing the gauge tile in focus mode.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-card-visual.png)
2. Tap the bell icon :::image type="icon" source="media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-alert-icon.png" border="false"::: to add an alert.  
3. Tap **Add alert rule**.
   
   ![Screenshot of the alert rule, showing no alerts set.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-add-alert-rule.png)
4. Choose to receive alerts above or below a value, then set the value.
   
   ![Screenshot of the alert settings, showing the alert title and value to set](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-set-alert-threshold.png)
5. Decide whether to receive hourly or daily alerts, and whether to also receive an email when you get the alert.
   
   > [!NOTE]
   > You don't receive alerts every hour or every day unless the data has actually refreshed in that time.
   > 
   > 
6. You can change the alert title, too.
7. Tap **Save**.
8. A single tile can have alerts for values both above and below thresholds. In **Manage alerts**, tap **Add alert rule**.
   
   ![Screenshot of the Manage alert, showing a pointer to add an alert rule.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-add-another-alert-rule.png)

### Manage alerts on your iPhone or iPad
You can manage individual alerts on your mobile device or [manage all your alerts in the Power BI service](../../create-reports/service-set-data-alerts.md).

1. In a dashboard, tap a number or gauge tile that has an alert.  
   
   ![Screenshot of the dashboard on an iPhone or iPad, showing the number tile that has an alert.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-card-visual_has_alert.png)

2. Tap the bell icon :::image type="icon" source="media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-has-alert-icon.png" border="false":::.  
3. Tap the name of the alert to edit it, tap the slider to turn off email alerts, or tap the garbage can to delete the alert.
   
    ![Screenshot of an alert, pointing to the alert name, garbage can to delete the alert, and slider to turn the alert off.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-edit-delete-alert.png)

## Data alerts on an Android device
### Set an alert on an Android device
1. In a Power BI dashboard, tap a number or gauge tile to open it.  
2. Tap the bell icon :::image type="icon" source="media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-alert-icon.png" border="false"::: to add an alert.  
   
   ![Screenshot of the dashboard on an Android device, showing the number tile that has an alert.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-tap-alert.png)
3. Tap the plus icon (+).
   
   ![Screenshot of the Manage alerts, showing a pointer to the plus icon.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-plus-alert.png)
4. Choose to receive alerts above or below a value, and type the value.
   
   ![Screenshot of the alert setting, showing pointers to Save and Done.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-tablet-set-alert-condition.png)
5. Tap **Done**.
6. Decide whether to receive hourly or daily alerts, and whether to also receive an email when you get the alert.
   
   > [!NOTE]
   > You don't receive alerts every hour or every day unless the data has actually refreshed in that time.
   > 
   > 
7. You can change the alert title, too.
8. Tap **Save**.

### Manage alerts on an Android device
You can manage individual alerts in the Power BI mobile app or [manage all your alerts in the Power BI service](../../create-reports/service-set-data-alerts.md).

1. In a dashboard, tap a card or gauge tile that has an alert.  
2. Tap the solid bell icon :::image type="icon" source="media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-filled-alert-bell.png" border="false":::.  
3. Tap the alert to change a value or turn it off.
   
    ![Screenshot of the Manage alert tile, showing the plus icon to add an alert.](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-manage-alerts.png)
4. Tap the plus icon (+) to add another alert to the same tile.
5. To delete the alert altogether, tap the garbage can icon ![Garbage can icon](media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-android-delete-alert-icon.png).

## Receiving alerts
You receive alerts in the Power BI [Notification Center](mobile-apps-notification-center.md) on your mobile device or in the Power BI service, along with notifications about new dashboards that someone has shared with you.

Data sources are often set to refresh daily, although some refresh more often. When the data in the dashboard is refreshed, if the data being tracked reaches one of the thresholds you've set, several things will happen.

1. Power BI checks to see if it's been more than an hour or more than 24 hours (depending on the option you selected) since the last alert was sent.
   
   As long as the data is past the threshold, you'll get an alert every hour or every 24 hours.
2. If you've set the alert to send you an email, you'll find something like this in your Inbox.
   
   ![Screenshot of an email notification, showing the alert.](media/mobile-set-data-alerts-in-the-mobile-apps/powerbi-alerts-email.png)
3. Power BI adds a message to your [Notification center](mobile-apps-notification-center.md) and adds a yellow dot to bell icon :::image type="icon" source="media/mobile-set-data-alerts-in-the-mobile-apps/powerbi-alert-tile-notification-icon.png" border="false"::: on the title bar.


4. Tap the bell icon :::image type="icon" source="media/mobile-set-data-alerts-in-the-mobile-apps/powerbi-alert-tile-notification-icon.png" border="false"::: or the global navigation button ![global navigation button](./media/mobile-set-data-alerts-in-the-mobile-apps/power-bi-iphone-alert-global-nav-button.png) to [open your **Notification center**](mobile-apps-notification-center.md) and see the alert details.

> [!NOTE]
> Alerts only work on data that is refreshed. When data refreshes, Power BI looks to see if an alert is set for that data. If the data has reached an alert threshold, an alert is triggered.

## Tips and troubleshooting
* Alerts currently aren't supported for Bing tiles or card tiles with date/time measures.
* Alerts only work with numeric data.
* Alerts only work on data that is refreshed. They don't work on static data.
* Alerts don't work with tiles that contain streaming data.

## Related content

* [Manage your alerts in the Power BI service](../../create-reports/service-set-data-alerts.md)
* [Power BI Mobile Notification Center](mobile-apps-notification-center.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)