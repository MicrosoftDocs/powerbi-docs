<properties
   pageTitle="Set data alerts in the Power BI app for Android tablets"
   description="Learn to set alerts to notify you when data in a dashboard changes beyond limits you set in the Power BI app for Android tablets and in the Power BI service."
   services="powerbi"
   documentationCenter=""
   authors="maggiesMSFT"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/10/2017"
   ms.author="maggies"/>

# Set data alerts in the Power BI mobile app for Android tablets

You can set alerts in the Power BI mobile app for Android tablets and in the Power BI service to notify you when data in a dashboard changes beyond limits you set. Alerts work for tiles featuring a single number, such as cards and gauges. You can set data alerts in the Power BI mobile app and see them in the Power BI service, and vice versa. Only you can see the data alerts you set, even if you share a dashboard or a snapshot of a tile.

> [AZURE.WARNING] Data-driven alert notifications provide information about your data. If your device gets stolen, we recommend going to the Power BI service to turn off all data-driven alert rules. 
> 
> Learn more about [managing data alerts in the Power BI service](powerbi-service-set-data-alerts.md).

## Set an alert

1.  Tap a number or gauge tile in a dashboard to open it.  

2.  Tap the bell icon ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-alert-icon.png) to add an alert.  

    ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-tablet-number-tile.png)

3.  Tap the plus icon (+).

    ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-tablet-no-alerts-yet.png)

4.  Choose to receive alerts above or below a value, and type the value.

    ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-tablet-set-alert-condition.png)

4.  Tap **Done**.

5.  Decide whether to receive hourly or daily alerts, and whether to also receive an email when you get the alert.

    >**Note**: You don't receive alerts every hour or every day unless the data has actually refreshed in that time.

6.  You can change the alert title, too.

6.  Tap **Save**.


## Receiving alerts

You receive alerts in the Power BI [Notification Center](powerbi-mobile-notification-center.md) in the Power BI mobile app or in the Power BI service, along with notifications about new dashboards that someone has shared with you.

Data sources are often set to refresh daily, although some refresh more often. When the data in the dashboard is refreshed, if the data being tracked reaches one of the thresholds you've set, several things will happen.

1.  Power BI checks to see if it's been more than an hour or more than 24 hours (depending on the option you selected) since the last alert was sent.

    As long as the data is past the threshold, you'll get an alert every hour or every 24 hours.

2.  If you've set the alert to send you an email, you'll find something like this in your Inbox.

    ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/powerbi-alerts-email.png)

3.  Power BI adds a message to your [**Notification center**](powerbi-mobile-notification-center.md).

4. Tap the main menu icon ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-notification-icon-border.png) to open the Notification center and see the alert details.

>**Note**: Alerts only work on data that is refreshed. When data refreshes, Power BI looks to see if an alert is set for that data. If the data has reached an alert threshold, an alert is triggered.

## Manage alerts

You can manage individual alerts in the Power BI mobile app or [manage all your alerts in the Power BI service](powerbi-service-set-data-alerts.md).

### Manage alerts in the Power BI mobile app

1.  In a dashboard, tap a card or gauge tile that has an alert.  

2.  Tap the solid bell icon ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-alert-yes-icon.png).  

3. Tap the alert to change a value or turn it off.

    ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-tablet-manage-alert.png)

4. Tap the plus icon (+) to add another alert to the same tile.

4. To delete the alert altogether, tap the garbage can icon ![](media/powerbi-mobile-set-data-alerts-in-the-android-tablet-mobile-app/power-bi-android-delete-alert-icon.png).

## Tips and troubleshooting
- Alerts currently aren't supported for Bing tiles or card tiles with date/time measures.
- Alerts only work with numeric data.
- Alerts only work on data that is refreshed. They don't work on static data.

## See also  
- [Manage your alerts in the Power BI service](powerbi-service-set-data-alerts.md)
- [Power BI Mobile Notification Center](powerbi-mobile-notification-center.md)
- [Get started with Power BI](powerbi-service-get-started.md)  
- More questions? [Try the Power BI Community](http://community.powerbi.com/)
