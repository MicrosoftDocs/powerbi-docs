---
title: Subscribe yourself to reports and dashboards
description: Learn how to subscribe yourself to an emailed snapshot of a Power BI report or dashboard.
author: mihart
ms.author: mihart
ms.reviewer: cmfinlan
featuredvideoid: 
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 12/06/2021
LocalizationGroup: Common tasks
---

# Subscribe to a report or dashboard in the Power BI service 

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]


It's never been easier to stay up-to-date on your most important dashboards and reports. Subscribe to reports and dashboards that matter most to you, and Power BI will email a snapshot to your inbox. You tell Power BI how often you want to receive the emails: daily, weekly, or when the data refresh. You can even set a specific time for Power BI to send the emails or have it run now.   

:::image type="content" source="./media/end-user-subscribe/power-bi-email-sent.png" alt-text="Email for subscription to a report.":::

## Requirements
To create a subscription for yourself or others, you'll need either:

- A Power BI Pro or Premium Per User (PPU) [license](end-user-license.md) or
- Access to a workspace backed by a [Power BI Premium capacity](../admin/service-premium-what-is.md).

Your Power BI admin also needs to enable subscriptions in your tenant. If you’re an admin, see [Enable subscriptions in the Power BI admin portal](../admin/service-admin-portal.md#email-subscriptions).


## Subscribe to a report or dashboard
Whether you're subscribing to a dashboard or to a report page, the process is similar. The same button allows you to subscribe to the Power BI service dashboards and reports.

:::image type="content" source="./media/end-user-subscribe/power-bi-subscriber.png" alt-text="select the Subscribe icon":::

Subscribing to a paginated report is slightly different, as outlined in [Subscribe to paginated reports](paginated-reports-subscriptions.md).

1. Open the dashboard or report, and from the top menu bar, select **Subscribe** ![Select the Subscribe icon.](./media/end-user-subscribe/power-bi-icon-envelope.png). When subscribing to a report, first navigate to the report page that you'd like to display in your subscription email, and then select **Subscribe**. 

1. Select **Add new subscription** and give your subscription a name.  By default, your subscription will be given the same name as your report page or dashboard.

   :::image type="content" source="./media/end-user-subscribe/power-bi-subscribe-report.png" alt-text="Subscribe window.":::
    
1. To subscribe to more than one page in a report: Either select **Add new subscription** and choose a different page from the dropdown near the top, or select the **Full report attachment as** checkbox under **Also include**. 

1.  Use the yellow slider to turn the subscription on and off.  Setting the slider to **Off** doesn't delete the subscription. To delete the subscription, select the trashcan icon.

1. Edit or add recipients by email address, ensuring that you have at least one. Optionally, add a subject and email message details. 

1. For Power BI reports, select the **Report page** you want to appear in the preview image.

1. Select a **Frequency** for your subscription.  You may choose Daily, Weekly, or After data refresh (Daily).  
    
    > [!TIP]
    > To receive a subscription email only on certain days, select Weekly and then select the checkboxes. If you select Monthly, enter the day(s) of the month you wish to receive the subscription email.

    - If you choose Daily, Hourly, Monthly, or Weekly, you can also choose a Scheduled Time for the subscription. You can have it run on the hour, or at 15, 30, or 45 minutes past. Select morning (AM) or afternoon/evening (PM). 
    - You can also specify the time zone. If you choose Hourly, select the Scheduled Time you want the subscription to start, and it will run every hour after that.  

1. Select a Start date and optionally, an End date for your subscription. By default, the start date will be the date you created the subscription and the end date will be one year later. You can change it to any date in the future (up to the year 9999) at any time before the subscription ends. When a subscription reaches an end date, it stops until you re-enable it. You will receive notification(s) before the scheduled end date to ask if you'd like to extend it.
 

1. Include additional information in the email. Select one or more of these checkboxes.
    - **Access to this report/dashboard**: Give recipients permission to open and view the report or dashboard in the Power BI service (app.powerbi.com).
    - **Link to report/dashboard in Power BI**: Include a “Go to report” button in the body of the email that links to the report or dashboard in the Power BI service.
    - **Preview image (for Power BI reports only)**: Include a preview of the report page in the body of the email.
    - **Full report attachment as (for Power BI reports only)**: If the report is in a workspace backed by a Premium capacity or Premium Per User (PPU) license, add the full report as an attachment instead of only a single report page. Select PDF or PowerPoint for the attachment format. The attachment respects all privacy labels for the report. The size of the attachment is limited to no more than 20 pages and less than 25 MB. 

1. To review your subscription and test it out, select **Run now**.  This sends the email to you right away. 
    
1. If everything looks good, select **Save and close** to save the subscription. You will receive an email and snapshot of the dashboard or report on the schedule you set. Subscriptions that have the frequency set to **After data refresh** will only send an email after the first scheduled refresh on that day.
    
    > [!NOTE]
    > To avoid subscription emails going to your spam folder, add the Power BI email alias (no-reply-powerbi@microsoft.com) to your contacts. If you're using Microsoft Outlook, right-click the alias and select **Add to Outlook contacts**.

   
   ![email snapshot of dashboard](media/end-user-subscribe/power-bi-subscriptions-email.png)
   
    You will be able to refresh the report page but not the dataset. Only the dataset owner can manually refresh a dataset. To look up the owner name of the underlying dataset(s), open the report and select the dropdown from the menu bar.
   
    ![find the owner](./media/end-user-subscribe/power-bi-owner.png)


## Manage subscriptions
Only you can manage the subscriptions you create. 
Open the report and select **Subscribe** from the top menu again. In the lower-left corner of the subscriptions pane, select **Manage all subscriptions**. 

Alternatively, select the gear icon from the header bar, then choose **Settings** and then select the **Subscriptions** tab.  

All the subscriptions for the current workspace are displayed. For help understanding workspaces, see [Workspaces in Power BI](end-user-workspaces.md). 

:::image type="content" source="./media/end-user-subscribe/power-bi-manage-subscriptions.png" alt-text="see all subscriptions in My Workspace":::

To see all your subscriptions across all workspaces, navigate to **My workspace** and the select the gear icon, **Settings** and then the **Subscriptions** tab. 

## Subscribe others 

Subscribing others has two requirements.    

**Subscribing others** is only available to the dashboard or report owners who have a Power BI Pro or Premium Per User (PPU) license and also have the Contributor, Member or Admin role to the dashboard's or report's workspace.   

:::image type="content" source="media/end-user-subscribe/power-bi-diamonds.png" alt-text="Workspaces showing diamond icon for Premium and diamond with person icon for PPU.":::

If your report isn’t hosted in a Premium capacity or workspace backed by a PPU license, you can subscribe others if they have a Power BI Pro or PPU license.  

### Use group email aliases 
When creating a subscription, you can add other email addresses in the same domain to the subscription. If the report or dashboard is hosted in a [Premium capacity](../admin/service-premium-what-is.md), you can subscribe group aliases, whether they're in your domain or not. You don't have to subscribe individual email addresses. The aliases are based on the current active directory. 

> [!NOTE]
> Workspaces backed by a Premium Per User (PPU) license are different from those backed by a Premium capacity, and do not support subscribing group aliases.  

## Subscribe external users 

You can subscribe external users to a report or dashboard if your report or dashboard is hosted in a Premium capacity.  

- If you subscribe external users to a report or dashboard, they will receive a share notification immediately after you select **Save and close** in the subscription pane. This notification is sent only to external users, not internal users, because they require an invitation link to view the report or dashboard. 

- Premium Per User workspaces do not qualify as Premium capacity workspaces. 

- *Sharing* content with a colleague outside of your domain does not require a Premium capacity. For example, if you are aaron@contoso.com, you can share with anyone@fabrikam.com, but you can't **subscribe** anyone@fabrikam.com, and they can't subscribe to shared content unless that content is hosted in a Premium capacity. 

## Subscribe to paginated reports 

In general, the process for subscribing to paginated reports is the same as [subscribing to reports and dashboards](#subscribe-to-a-report-or-dashboard), but there are a few differences worth noting. This section spells out these differences and other considerations to keep in mind when subscribing to paginated reports.  

### Paginated reports parameters 

Paginated reports allow you to specify the view of the report people will receive in the subscription by setting the parameters in the subscription pane.  

- Subscriptions can be sent with either the currently selected or default parameters for your report. You may set different parameter values for each subscription you create for your report. 

- If your report author has set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. You can change other parameter values and choose to use current values, but unless you explicitly change that value as well, the subscription uses the expression-based parameter. 

### Create a paginated report subscription for yourself or others
 
You don't need edit permissions to the paginated report to create a subscription for yourself, but you must have edit permissions to create one for someone else in your organization. If you have at least a Contributor role in the workspace where the paginated report is hosted, then you can create subscriptions for others in your organization. Read more about [Roles in workspaces](../collaborate-share/service-roles-new-workspaces.md). 

-  You can subscribe other users in your organization to paginated reports that connect to any currently supported data sources, including Azure Analysis Services or Power BI datasets. Keep in mind the report attachment reflects the data based on your permissions. 

- Unlike subscriptions for dashboards or Power BI reports, your subscription contains an attachment of the entire report output. The following attachment types are supported: PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML. 

- You may include a preview image of the report in the email body. This is optional, and may differ slightly from the first page of your attached report document, depending on the attachment format you select. 

- There is no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source. 

For more information, visit [Subscribe to a paginated report in the Power BI service](paginated-reports-subscriptions.md) for details.


## Subscription controls for administrators 

Power BI administrators have levers of control over subscriptions. The following links point to the relevant sections of the admin portal: 

- [Enable email subscriptions](../admin/service-admin-portal.md#export-and-sharing-settings) for all members of the organization. 

- Enable specific users to send email subscriptions to external users. See [Invite external users to your organization](../admin/service-admin-portal.md#export-and-sharing-settings). 

### View subscription audit and activity logs 

Power BI administrators can use the Power BI audit and activity logs to view details around subscriptions. These details include: 

- Created by 
- Creation date 
- Content subscribed to 
- Workspace of content 
- Frequency 
- Modified by 
- Modified date 

See [Operations available in the audit and activity logs](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs) in "Track user activities in Power BI" for details. 

## Considerations and limitations 

For help with troubleshooting for the subscriptions feature, see "Troubleshoot subscriptions".  

**General**
- If you aren't able to use the subscription feature, contact your system administrator or IT help desk. Your organization may have disabled this feature or a maximum subscriber limit may have been reached.
- Power BI automatically pauses refresh on datasets associated with dashboards and reports that haven't been visited in more than two months. However, if you add a subscription to a dashboard or report, it won't pause even if it goes unvisited. 

**Power BI reports**  

- Report page subscriptions are tied to the name of the report page. If you subscribe to a report page, and it gets renamed, you will have to re-create your subscription.    

- Email subscriptions are sent with the report's default filter and slicer states. Any changes to the defaults that you make before or after subscribing will not show up in the email. However, when you select the link to open the report, you will see changes that you've made and saved.

**Apps** 

- For [Power BI apps](end-user-apps.md) you have installed, you can only create subscriptions for others if you are the owner of the app. 

**Unsupported features**
Email subscriptions do not support:
 
* R-powered Power BI visuals  
* bookmarks
* most [custom visuals](../developer/visuals/develop-power-bi-visuals.md). The exception is those Power BI custom visuals that have been [certified](../developer/visuals/power-bi-custom-visuals-certified.md). 



## Next steps

[Search for and sort content](end-user-search-sort.md)

