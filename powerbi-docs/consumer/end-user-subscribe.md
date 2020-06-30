---
title: Subscribe yourself to reports and dashboards
description: Learn how to subscribe yourself to an emailed snapshot of a Power BI report or dashboard.
author: mihart
ms.author: mihart
ms.reviewer: cmfinlan
featuredvideoid: 
ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: how-to
ms.date: 05/11/2020
LocalizationGroup: Common tasks
---

# Subscribe to a report or dashboard in the Power BI service 

[!INCLUDE[consumer-appliesto-ynny](../includes/consumer-appliesto-ynny.md)]

[!INCLUDE [power-bi-service-new-look-include](../includes/power-bi-service-new-look-include.md)]

It's never been easier to stay up-to-date on your most important dashboards and reports. Subscribe to report pages and dashboards that matter most to you, and Power BI will email a snapshot to your inbox. You tell Power BI how often you want to receive the emails: daily, weekly, or when the data refresh. You can even set a specific time for Power BI to send the emails or have it run now.  In all, you can set up to 24 different subscriptions per report or dashboard.

The email and snapshot will use the language set in Power BI settings (see [Supported languages and countries/regions for Power BI](../fundamentals/supported-languages-countries-regions.md)). If no language is defined, Power BI uses the language according to the locale setting in your current browser. To see or set your language preference, select the cog icon ![gear icon](./media/end-user-subscribe/power-bi-settings-icon.png) > **Settings > General > Language**. 

![Language dropdown](./media/end-user-subscribe/power-bi-language.png)

When you receive the email it includes a link to "go to report or dashboard". On mobile devices with Power BI apps installed, selecting this link launches the app (as opposed to the default action of opening the report or dashboard on the Power BI website).


## Requirements
**Creating** a subscription for yourself requires a certain type of [license](end-user-license.md). If you are unable to create a subscription, contact your Power BI administrator. **Subscribing others** is only available to the dashboard or report owner. Subscribing to paginated reports is a little different. See [Subscribe yourself and others to a paginated report in the Power BI service](paginated-reports-subscriptions.md) for details. 

## Subscribe to a dashboard or a report page
Whether you're subscribing to a dashboard or to a report, the process is similar. The same button allows you to subscribe to Power BI service dashboards and reports.
 
![select the Subscribe icon](./media/end-user-subscribe/power-bi-subscribe.png).

1. Open the dashboard or report.
2. From the top menu bar, select **Subscribe** or select the envelope icon ![Subscribe icon](./media/end-user-subscribe/power-bi-icon-envelope.png).
   


   ![Subscribe window](./media/end-user-subscribe/power-bi-emails-numbered.png)
    
    The screen on the left appears when you're on a dashboard and select **Subscribe**. The screen on the right appears when you're on a report page and select **Subscribe**. 
    
    a. To subscribe to more than one page in a report, select **Add another subscription** and select a different page from the dropdown near the top.

    b. Use the yellow slider to turn the subscription on and off.  Setting the slider to Off doesn't delete the subscription. To delete the subscription, select the trashcan icon.

    c. Optionally, add a subject and email message details. 

    d. Select a **Frequency** for your subscription.  You may choose Daily, Weekly, or After data refresh (Daily).  To receive the subscription email only on certain days, select **Weekly** and choose which days you'd like to receive it.  For example, if you'd like to receive the subscription email only on workdays, select **Weekly** for your frequency and un-check the boxes for Sat and Sun. If you select 
    **Monthly**, enter the day(s) of the month you wish to receive the subscription mail.   

    e. If you choose Daily, Hourly, Monthly, or Weekly, you can also choose a Scheduled Time for the subscription. You have it run on the hour, or at 15, 30, or 45 minutes past. Select morning (AM) or afternoon/evening (PM). You can also specify the time zone. If you choose Hourly, select the Scheduled Time you want the subscription to start, and it will run every hour after that.  

    f. Schedule the start and end date by entering dates in the date fields. By default, the start time for your subscription will be the date you create it and the end date will be one year later. You can change it to any date in the future (up to the year 9999) at any time before the subscription ends. When a subscription reaches an end date, it stops until you re-enable it.  You will receive notification(s) before the scheduled end date to ask if you'd like to extend it.     

    g. To review your subscription and test it out, select **Run now**.  This sends the email to you right away. 

3. If everything looks good, select **Save and close** to save the subscription. You will receive an email and snapshot of the dashboard or report on the schedule you set. All subscriptions that have the frequency set to **After data refresh** will only send an email after the first scheduled refresh on that day.
   
   ![email snapshot of dashboard](media/end-user-subscribe/power-bi-email-old.png)
   
    Refreshing the report page does not refresh the dataset. Only the dataset owner can manually refresh a dataset. To look up the owner name of the underlying dataset(s), select the dropdown from the menu bar or look up the original subscription email.
   
    ![find the owner](./media/end-user-subscribe/power-bi-owner.png)


## Manage your subscriptions
Only you can manage the subscriptions you create. Select **Subscribe** again and choose **Manage all subscriptions** from the bottom left corner (see screenshots  above). The particular subscriptions displayed depend on which workspace is currently active. To see all of your subscriptions at once for all workspaces, be sure that **My Workspace** is active. For help understanding workspaces, see [Workspaces in Power BI](end-user-workspaces.md). 

![see all subscriptions in My Workspace](./media/end-user-subscribe/power-bi-manage-subscriptions.png)

A subscription will end if the Pro license expires, the dashboard or report is deleted by the owner, or the user account used to create the subscription is deleted.

## Considerations and troubleshooting
* To avoid subscription emails going to your spam folder, add the Power BI email alias (no-reply-powerbi@microsoft.com) to your contacts. If you're using Microsoft Outlook, right-click the alias and select **Add to Outlook contacts**. 
* Dashboards with over 25 pinned tiles, or four pinned live report pages, may not render fully in subscription e-mails sent to users. We suggest that you contact the dashboard designer and ask them to reduce pinned tiles to less than 25 and pinned live reports to less than four to ensure that the email renders correctly.  
* For dashboard email subscriptions, if any tiles have row level security (RLS) applied, those tiles will not display.  
* If the links in your email (to the content) stop working, it may be that the content was deleted. In the email, beneath the screenshot, you can look to see if you subscribed yourself or if someone else subscribed you. If someone else, ask that co-worker to either cancel the emails or re-subscribe you.
* For dashboard subscriptions, certain types of tiles aren't yet supported. These include: streaming tiles, video tiles, custom web content tiles. 
* Report page subscriptions are tied to the name of the report page. If you subscribe to a report page, and it gets renamed, you will have to re-create your subscription.
* If you aren't able to use the subscription feature, contact your system administrator. Your organization may have disabled this feature.  
* Email subscriptions do not support most [custom visuals](../developer/visuals/power-bi-custom-visuals.md).  The exception is those Power BI custom visuals that have been [certified](../developer/visuals/power-bi-custom-visuals-certified.md).    
* Email subscriptions are sent with the report's default filter and slicer states. Any changes to the defaults that you make after subscribing don't show up in the email. Paginated Reports do support this capability and allow you to set the specific parameter values per subscription.  
* Email subscriptions do not support R-powered Power BI visuals at this time.  
* For dashboard subscriptions specifically, certain types of tiles are not yet supported.  These include: streaming tiles, video tiles, custom web content tiles.     
* Subscriptions may fail on dashboards or reports with extremely large images due to email size limits.    
* Power BI automatically pauses refresh on datasets associated with dashboards and reports that haven't been visited in more than two months.  However, if you add a subscription to a dashboard or report, it won't pause even if it goes unvisited.
* Keep in mind that like other BI products, the time you set your subscription for is when the subscription begins processing.  Once the report processing is complete, then the subscription is queued and sent to the e-mail recipients.  While we strive to process and deliver all subscriptions as quickly as possible, there are times at peak demand when you may see a longer delay due to the number of subscriptions that can be sent at once.  For the majority of customers, they shouldn’t see a delay of more than 15 minutes to process and send their reports, though it may take up to 30 minutes for certain times and tenants that have significant usage.  We never expect any delay in delivery to be more than 60 minutes from the time the subscription is scheduled.  If any customer experiences a delay of that length, they should first ensure that the address no-reply-powerbi@microsoft.com is on your safe sender list and isn't blocked by your e-mail provider.  If the email isn't being blocked, they should contact Power BI support for assistance.

## Next steps

[Search for and sort content](end-user-search-sort.md)
