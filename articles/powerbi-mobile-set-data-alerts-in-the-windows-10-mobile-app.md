<properties 
   pageTitle="Set data alerts in the Power BI mobile app for Windows 10"
   description="Learn to set alerts to notify you when data in a dashboard changes beyond limits you set in the Power BI mobile app for Windows 10 and in the Power BI service."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="mblythe" 
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
   ms.date="07/25/2016"
   ms.author="maggies"/>

# Set data alerts in the Power BI mobile app for Windows 10  

You can set alerts in the Power BI mobile app for Windows 10 and in the Power BI service to notify you when data in a dashboard changes beyond limits you set. Alerts work for tiles featuring a single number, such as cards, gauges, and KPIs. You can set data alerts in the Power BI mobile app and see them in the Power BI service, and vice versa. Only you can see the data alerts you set, even if you share a dashboard or a snapshot of a tile.

1.  Tap a number, gauge, or KPI tile in a dashboard to open it.  

2.  Tap the bell icon ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-alert-bell-off.png) to add an alert.  
  
    ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-tap-alert.png)

3.  Tap the plus icon (+).

    ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-no-alerts-yet.png)

4.  Choose to receive alerts above or below a value, then set the value.
  
    ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-set-alert.png)

4.  Decide whether to receive hourly or daily alerts, and whether to also receive an email when you get the alert.

    >**Note**: You don't receive alerts every hour or every day unless the data has actually refreshed in that time.
    
6.  You can change the alert title, too.

6.  Tap **Save**.

7.  A single tile can have alerts for values both above and below thresholds. In **Manage alerts**, tap the plus sign (+).

    ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-add-another-alert.png)

## View alerts

You receive alerts in the Power BI [Notification Center](powerbi-mobile-notification-center.md) in the Power BI mobile app or in the Power BI service, along with notifications about new dashboards that someone has shared with you.

Data sources are often set to refresh daily, although some refresh more often. When the data in the dashboard is refreshed, you receive an alert if the new value is above or below the number you set.

## Manage alerts

You can manage individual alerts in the Power BI mobile app or [manage all your alerts in the Power BI service](powerbi-service-set-data-alerts.md).

### Manage alerts in the Power BI mobile app

1.  In a dashboard, tap a card, gauge, or KPI tile that has an alert.  

2.  Tap the bell icon ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-alert-bell-on.png).  
  
    ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-has-alerts.png)

3. Tap the alert to change a value or turn it off. 

    ![](media/powerbi-mobile-set-data-alerts-in-the-windows-10-mobile-app/power-bi-windows-10-add-another-alert.png)

## Tips and troubleshooting
- You can't set alerts for dashboards that have been shared with you.
- Alerts currently aren't supported for Bing tiles or card tiles with date/time measures.
- Alerts only work with numeric data.
- Alerts only work on data that is refreshed. They don't work on static data.

### See also  
- [Manage your alerts in the Power BI service](powerbi-service-set-data-alerts.md) 
- [Power BI Mobile Notification Center](powerbi-mobile-notification-center.md)
- [Get started with Power BI](powerbi-service-get-started.md)  