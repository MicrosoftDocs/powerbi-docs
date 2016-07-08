<properties 
   pageTitle="Set data alerts in the iPhone app"
   description="Learn to set alerts to notify you when data in a dashboard changes beyond limits you set in the Power BI mobile app on the iPhone and in the Power BI service."
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
   ms.date="07/07/2016"
   ms.author="maggies"/>

# Set data alerts in the iPhone app (Power BI for iOS)  

You can set alerts to notify you when data in a dashboard changes beyond limits you set in the Power BI mobile app on the iPhone and in the Power BI service. Alerts work for tiles featuring a single number, such as cards, gauges, and KPIs. You can set data alerts on your iPhone and see them in the Power BI service, and vice versa. Only you can see the data alerts you set, even if you share a dashboard or a snapshot of a tile.

1.  Tap a number, gauge, or KPI tile in a dashboard to open it.  

2.  Tap the bell icon ![](media/powerbi-mobile-set-data-alerts-in-the-iphone-app/PBI_iPhoneBellIconUnselect.png) to add an alert.  
  
    ![](media/powerbi-mobile-set-data-alerts-in-the-iphone-app/PBI_iPhoneNumberTile.png)

3.  Type numbers to receive alerts above or below a value, or both.  
  
    ![](media/powerbi-mobile-set-data-alerts-in-the-iphone-app/PBI_iPhoneAlertSetting.png)

4.  Decide whether to receive hourly or daily alerts.
    >Note: You don't receive alerts every hour or every day unless the data has actually changed every hour.
    
5.  Decide whether to also receive an email when you get the alert.
6.  Tap **Save**.

## View alerts

You receive alerts in the Power BI [Notification Center](powerbi-mobile-notification-center.md) on your iPhone or in the Power BI service, along with notifications about new dashboards that someone has shared with you.

Data sources are often set to refresh daily, although some refresh more often. When the data in the dashboard is refreshed, you'll receive an alert if the new value is above or below the number you set.

![](media/powerbi-mobile-set-data-alerts-in-the-iphone-app/PBI_iPhoneAlertSet.png)

## Manage alerts

You can manage individual alerts on your iPhone or [manage all your alerts in the Power BI service](powerbi-service-set-data-alerts.md).

### Manage an alert on your iPhone

1.  In a dashboard, tap the card, gauge, or KPI tile that has an alert to open it.  

2.  Tap the bell icon ![](media/powerbi-mobile-set-data-alerts-in-the-iphone-app/PBI_iPhoneBellIconUnselect.png).  
  
    ![](media/powerbi-mobile-set-data-alerts-in-the-iphone-app/PBI_iPhoneNumberTile.png)

3. Change a value, or tap Clear, Remove, or something else to remove it. 

## Tips and troubleshooting
- You can't set alerts for dashboards that have been shared with you.
- Alerts currently aren't supported for Bing tiles or card tiles with date/time measures.
- Alerts only work with numeric data.
- Alerts only work on data that is refreshed. They don't work on static data.

### See also  
- [Manage your alerts in the Power BI service](powerbi-service-set-data-alerts.md) 
- [Get started with the iPhone app for Power BI](powerbi-mobile-iphone-app-get-started.md)  
- [Get started with Power BI](powerbi-service-get-started.md)  