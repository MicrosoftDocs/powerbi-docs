---
title: Subscribe to reports and dashboards in Power BI service
description: Learn how to subscribe yourself and others to a snapshot of a Power BI report and dashboard.
author: mihart
manager: kvivek
ms.reviewer: ''
featuredvideoid: 

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: mihart

LocalizationGroup: Common tasks
---
# Subscribe to a report or dashboard in Power BI service 
It's never been easier to stay up-to-date on your most important dashboards and reports. Subscribe to report pages and dashboards that matter most to you, and Power BI will email a snapshot to your inbox. You tell Power BI how often you want to receive the emails: from once a day to once a week. 

The email and snapshot will use the language set in Power BI settings (see [Supported languages and countries/regions for Power BI](../supported-languages-countries-regions.md)). If no language is defined, Power BI uses the language according to the locale setting in your current browser. To see or set your language preference, select the cog icon ![gear icon](./media/end-user-subscribe/power-bi-settings-icon.png) > **Settings > General > Language**. 

![Language dropdown](./media/end-user-subscribe/power-bi-language.png)

When you receive the email it will include a link to "go to report or dashboard". On mobile devices with Power BI apps installed, selecting this link launches the app (as opposed to the default action of opening the report or dashboard on the Power BI website).


## Requirements
- **Creating** a subscription is a Power BI Pro feature. 
- Since subscription emails are only sent when an underlying  dataset is updated or refreshes, subscriptions don't work on datasets that don't update or refresh.

## Subscribe to a dashboard or a report page
Whether you're subscribing to a dashboard or report, the process is very similar. The same button allows you to subscribe to Power BI service dashboards and reports.
 
![select the Subscribe icon](./media/end-user-subscribe/power-bi-subscribe-orientation.png).

1. Open the dashboard or report.
2. From the top menubar, select **Subscribe** or select the envelope icon ![Subscribe icon](./media/end-user-subscribe/power-bi-icon-envelope.png).
   
   ![Subscribe icon](./media/end-user-subscribe/power-bi-subscribe-icon.png)

3. Use the yellow slider to turn the subscription on and off.  Setting the slider to Off will not delete the subscription. To delete the subscription, select the trashcan icon.

4. Optionally, add email message details. 

    In the screenshots below, notice that when you subscribe to a report, you're actually subscribing to a report *page*.  To subscribe to more than one page in a report, select **Add another subscription** and select a different page. 
      
   ![Subscribe window](./media/end-user-subscribe/power-bi-emails.png)

5. Select **Save and close** to save the subscription. You'll receive an email and snapshot of the dashboard or report page each time any of the underlying datasets change. If the dashboard or report refreshes more than once a day, the email is only sent after the first refresh.  
   
   ![email snapshot of dashboard](./media/end-user-subscribe/power-bi-dashboard-email-new.jpg)
   
Refreshing the report page does not refresh the dataset. Only the dataset owner can manually refresh a dataset. To look up the name of the underlying dataset(s), select **View related** from the top menubar.
   
![Related datasets](./media/end-user-subscribe/power-bi-view-related-screen.png)

## How the email schedule is determined
The following table describes how frequently you will receive an email. It all depends on the connection method of the dataset upon which the dashboard or report is based (DirectQuery, Live connection, imported to Power BI, or Excel file in OneDrive or SharePoint Online) and on the subscription options available and selected (daily, weekly, or none).

|  | **DirectQuery** | **Live Connect** | **Scheduled refresh (import)** | **Excel file in OneDrive/SharePoint Online** |
| --- | --- | --- | --- | --- |
| **How often does the report/dashboard get refreshed?** |Every 15m |Power BI checks every 15 minutes, and if the dataset has changed, the report is refreshed. |User selects none, daily, or weekly. Daily can be up to 8 times a day. Weekly is actually a weekly schedule that the user creates and sets refresh for as few as once a week and as often as daily. |Once every hour |
| **How much control does the user have over the subscription email schedule?** |Options are: daily or weekly |No options: user is sent an email if the report refreshes, but no more than once per day. |If the refresh schedule is daily, options are daily and weekly.  If the refresh schedule is weekly, only option is weekly. |No options: user is sent an email whenever the dataset is updated, but no more than once per day. |

## Manage your subscriptions
Only you can manage your subscriptions. Select **Subscribe** again and choose **Manage all subscriptions** (see screenshots below step 4 above). 

![see all subscriptions in My Workspace](./media/end-user-subscribe/power-bi-subscriptions.png)

A subscription will end if the Pro license expires, the dashboard or report is deleted by the owner, or the user account used to create the subscription is deleted.

## Considerations and troubleshooting
* For dashboard email subscriptions, if any tiles have row level security (RLS) applied, those tiles will not display.  For report email subscriptions, if the dataset uses RLS, you will not be able to create a subscription.
* Report page subscriptions are tied to the name of the report page. If you subscribe to a report page, and it gets renamed, you will have to re-create your subscription
* Certain settings your organization may be configured in Azure Active Directory which may limit the ability to use e-mail subscriptions in Power BI.  This includes, but isn't limited to, having multi-factor authentication or IP range restrictions when accessing resources.
* For email subscriptions on live connection datasets, you will only get emails when the data changes. So, if a refresh occurs but no data changes, Power BI will not send you an email.
* Email subscriptions do not support most [custom visuals](../power-bi-custom-visuals.md).  The one exception is those custom visuals that have been [certified](../power-bi-custom-visuals-certified.md).  
* Email subscriptions do not support R-powered custom visuals at this time.  
* If any dashboard tiles have row level security (RLS) applied, those tiles will not display.
* Email subscriptions are sent with the report's default filter and slicer states. Any changes to the defaults that you make after subscribing will not show up in the email.    
* For dashboard subscriptions specifically, certain types of tiles are not yet supported.  These include: streaming tiles, video tiles, custom web content tiles.     
* Subscriptions may fail on dashboards or reports with extremely large images due to email size limits.    
* Power BI automatically pauses refresh on datasets associated with dashboards and reports that have not been visited in more than 2 months.  However, if you add a subscription to a dashboard or report, it will not be paused even if it goes unvisited.    

## Next steps
* More questions? [Try asking the Power BI Community](http://community.powerbi.com/)    
* [Read the blog post](https://powerbi.microsoft.com/blog/introducing-dashboard-email-subscriptions-a-360-degree-view-of-your-business-in-your-inbox-every-day/)

