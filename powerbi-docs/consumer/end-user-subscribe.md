---
title: Email subscriptions for reports and dashboards in the Power BI service
description: Learn how to subscribe yourself and others to an emailed snapshot of a Power BI report or dashboard.
author: mihart
ms.author: mihart
ms.reviewer: mibruhje
featuredvideoid: 
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 07/29/2022
LocalizationGroup: Common tasks
---

# Email subscriptions for reports and dashboards in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Subscribe yourself and others to Power BI reports, dashboards, and paginated reports. You'll receive an email on a schedule you set. The email will contain a snapshot and link to the report or dashboard. If you're a workspace administrator, learn how to manage subscriptions in your workspace, including how to take over subscriptions that are owned by others.

## Subscribe to a report or dashboard in the Power BI service 

It's never been easier to stay up-to-date on your most important dashboards and reports. Subscribe to reports and dashboards that matter most to you, and Power BI will email a snapshot to your inbox. You tell Power BI how often you want to receive the emails: daily, weekly, or when the data refresh. You can even set a specific time for Power BI to send the emails or have it run now. Set up to 24 subscriptions per report or dashboard, and provide unique recipients, times, and frequencies for each subscription.  

:::image type="content" source="./media/end-user-subscribe/power-bi-email-sent.png" alt-text="Email for subscription to a report.":::


## Requirements
To create a subscription for yourself, you'll need either:

- A Power BI Pro or [Premium Per User (PPU) license](end-user-license.md) or
- Access to a workspace backed by a [Power BI Premium capacity](../enterprise/service-premium-what-is.md).

Your Power BI admin also needs to enable subscriptions in your tenant. If you’re an admin, see [Enable subscriptions in the Power BI admin portal](../admin/service-admin-portal-export-sharing.md#email-subscriptions).


## Subscribe to a report or dashboard
Whether you're subscribing to a dashboard or to a report page, the process is similar. The same button allows you to subscribe to the Power BI service dashboards and reports.

:::image type="content" source="./media/end-user-subscribe/power-bi-subscriber.png" alt-text="select the Subscribe icon":::

Subscribing to a paginated report is slightly different, as outlined in [Subscribe to paginated reports](#subscribe-to-paginated-reports) in this article.

1. Open the dashboard or report, and from the top menu bar, select **Subscribe** ![Select the Subscribe icon.](./media/end-user-subscribe/power-bi-icon-envelope.png).  

1. Select **Add new subscription** and give your subscription a name.  By default, your subscription will be given the same name as your report page or dashboard.

   :::image type="content" source="./media/end-user-subscribe/power-bi-subscribe-reports.png" alt-text="Subscribe window.":::
    

1.  Use the yellow slider to turn the subscription on and off.  Setting the slider to **Off** doesn't delete the subscription. To delete the subscription, select the trashcan icon.

1. Edit or add recipients by email address, ensuring that you have at least one. Optionally, add a subject and email message details. 

1. For Power BI reports, select the **Report page** you want to appear in the preview image. To subscribe to more than one page in a report, either select **Add new subscription** and choose a different page from the dropdown, or select the **Full report attachment as** checkbox under **Also include**. 

1. Select a **Frequency** for your subscription.  You may choose Daily, Weekly, or After data refresh (Daily).  
    
    > [!TIP]
    > To receive a subscription email only on certain days, select Weekly and then select the checkboxes. If you select Monthly, enter the day(s) of the month you wish to receive the subscription email.

    - If you choose Daily, Hourly, Monthly, or Weekly, you can also choose a Scheduled Time for the subscription. You can have it run on the hour, or at 15, 30, or 45 minutes past. Select morning (AM) or afternoon/evening (PM). 
    - You can also specify the time zone. If you choose Hourly, select the Scheduled Time you want the subscription to start, and it will run every hour after the Scheduled Time.  

1. Select a **Start date** and optionally, an **End date** for your subscription. By default, the start date will be the date you created the subscription and the end date will be one year later. You can change it to any date in the future at any time before the subscription ends. When a subscription reaches an end date, it stops until you re-enable it. You will receive notification(s) before the scheduled end date to ask if you'd like to extend it.
 

1. Include additional information in the email. Select one or more of these checkboxes.
    - **Access to this report/dashboard**: Give recipients permission to open and view the report or dashboard in the Power BI service (app.powerbi.com).
    - **Link to report/dashboard in Power BI**: Include a “Go to report” button in the body of the email that links to the report or dashboard in the Power BI service.
    - **Preview image (for Power BI reports only)**: Include a preview of the report page in the body of the email.
    - **Full report attachment as (for Power BI reports only)**: If the report is in a workspace backed by a [Premium Gen2 capacity](../enterprise/service-premium-gen2-what-is.md) or Premium Per User (PPU) license, add the full report as an attachment instead of only a single report page. Select PDF or PowerPoint for the attachment format. The attachment respects all privacy labels for the report. The size of the attachment is limited to no more than 50 pages and less than 25 MB. 

1. If everything looks good, select **Save and close**. To test out your subscription, select **Run now** to send the email to you right away. It does not trigger a data refresh of the underlying dataset. 

1. You will now receive an email and snapshot of the report or dashboard on the schedule you set. Subscriptions that have the frequency set to **After data refresh** will only send an email after the first scheduled refresh on that day.  

    
    > [!NOTE]
    > To avoid subscription emails going to your spam folder, add the Power BI email alias (no-reply-powerbi@microsoft.com) to your contacts. If you're using Microsoft Outlook, right-click the alias and select **Add to Outlook contacts**.

   
   ![email snapshot of dashboard](media/end-user-subscribe/power-bi-subscriptions-email.png)
   
## Subscribe others 

To create a subscription that includes others, in addition to the [requirements necessary to create your own subscriptions](#requirements), you'll also need:

- A Contributor, Member, or Admin role in that workspace.  You’ll know you have the Contributor, Member or Admin role in a workspace if you have the option to edit reports or dashboards in that workspace. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).  


- If the report or dashboard isn't hosted in a Premium capacity, as indicated by the diamond icon, you can still subscribe others. However, they must also have a Power BI Pro or Premium Per User (PPU) license. 

    :::image type="content" source="media/end-user-subscribe/power-bi-premium.png" alt-text="Workspaces showing diamond icon for Premium and diamond with person icon for PPU.":::

### Use group email aliases 
When creating a subscription, you can add other email addresses in the same domain to the subscription. If the report or dashboard is hosted in a [Premium capacity](../enterprise/service-premium-what-is.md), you can subscribe group aliases, whether they're in your domain or not. You don't have to subscribe individual email addresses. The aliases are based on the current active directory. 

> [!NOTE]
> Workspaces backed by a Premium Per User (PPU) license are different from those backed by a Premium capacity, and do not support subscribing group aliases.  

### Subscribe external users 

You can subscribe external users to a report or dashboard if your report or dashboard is hosted in a Premium capacity.  

- If you subscribe external users to a report or dashboard, they will receive a share notification immediately after you select **Save and close** in the subscription pane. This notification is sent only to external users, not internal users, because external users require an invitation link to view the report or dashboard. 

- Premium Per User workspaces do not qualify as Premium capacity workspaces. 

- *Sharing* content with a colleague outside of your domain does not require a Premium capacity. For example, if you are aaron@contoso.com, you can share with anyone@fabrikam.com, but you can't **subscribe** anyone@fabrikam.com, unless that content is hosted in a Premium capacity. 

- External users can't subscribe themselves to reports or dashboards, even if they have been added as guest users.

## Subscribe to paginated reports 

In general, the process for subscribing to paginated reports is the same as [subscribing to reports and dashboards](#subscribe-to-a-report-or-dashboard), but there are a few differences worth noting. This section spells out these differences and other considerations to keep in mind when subscribing to paginated reports.  

### Paginated reports parameters 

Paginated reports allow you to specify the view of the report people will receive in the subscription by setting the parameters in the subscription pane.  

- Subscriptions can be sent with either the currently selected or default parameters for your report. You may set different parameter values for each subscription you create for your report. 

- If your report author has set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. You can change other parameter values and choose to use current values, but unless you explicitly change that value as well, the subscription uses the expression-based parameter. 

### Considerations unique to paginated report subscriptions

-  You can subscribe other users in your organization to paginated reports that connect to any currently supported data sources, including Azure Analysis Services or Power BI datasets. Keep in mind the report attachment reflects the data based on your permissions.
- You can set up an unlimited number of subscriptions per paginated report. 
- The maximum attachment size is 25 MB.
- Unlike subscriptions for dashboards or Power BI reports, your subscription contains an attachment of the entire report output. The following attachment types are supported: PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML. 
- Optionally, include a preview image of the report in the email body. The image may differ slightly from the first page of your attached report document, depending on the attachment format you select. 
- There is no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source.
- Paginated report subscriptions in the Power BI service are similar to email standard subscriptions in Power BI Report Server and SQL Server Reporting Services.


## Manage subscriptions
Subscriptions are managed on a workspace level. Subscriptions can be viewed and managed by their creator and by the workspace administrator. Power BI administrators can view logs and turn certain subscription features on and off.

# [Creator](#tab/creator)

### Subscriptions in a workspace

To see all subscriptions that you own in a given workspace, start by selecting that workspace to make it active. Then, from the upper right corner of the Power BI service, select the gear icon ![cog icon](media/end-user-subscribe/power-bi-settings-icon.png) > **Settings** > **Subscriptions**. This example shows all of your subscriptions for the workspace named **AdventureWorks Demo**.

For help understanding workspaces, see [Workspaces in Power BI](end-user-workspaces.md). 

:::image type="content" source="media/end-user-subscribe/power-bi-non-admin-user.png" alt-text="Screenshot showing workspace with Subscriptions selected from the top.":::

From here, you will see all subscriptions you have created in the currently selected workspace. For each subscription, Power BI displays the name you gave to the subscription, the name of the content you are subscribing to, and the content type. Search for subscriptions by keyword or filter by any of these fields. Select **Edit** to make changes to a subscription’s settings.   

### Subscriptions across all workspaces

To see all of your subscriptions, start by selecting **My workspace** to make it active. Then, from the upper right corner of the Power BI service, select the gear icon ![cog icon](media/end-user-subscribe/power-bi-settings-icon.png) > **Settings** > **Subscriptions**.

:::image type="content" source="media/end-user-subscribe/power-bi-settings.png" alt-text="Screenshot showing cog icon selected.":::


:::image type="content" source="media/end-user-subscribe/power-bi-my-workspace.png" alt-text="Screenshot showing all subscriptions for a user.":::

From here, you will see a list of all your subscriptions across all workspaces. Power BI displays the name of the subscription, the name of the associated workspace, the name of the content you are subscribing to, and the content type. Select **Edit** to make changes to a subscription’s settings. 

Alternately, another way to see all of your subscriptions across all workspaces is to open the **Subscriptions** pane from a dashboard or report in **My workspace**, and select **Manage all subscriptions**.   

:::image type="content" source="media/end-user-subscribe/power-bi-manage.png" alt-text="Screenshot showing Subscription pane with Manage all subscriptions outlined in red.":::


# [Administrator](#tab/admin)

## Workspace administrators
Users who have been assigned the [Admin role](../collaborate-share/service-roles-new-workspaces.md) in a workspace can view all subscriptions that have been created for Power BI reports, dashboards or paginated reports in that workspace, regardless of owner. Information on the subscription name, owner, report or dashboard name, and content type is provided. 

> [!NOTE]
> Subscriptions created for reports and dashboards in an app or those hosted in your **My workspace** can only be managed by the user who created the subscriptions. 

To navigate to this view from within a workspace, select the gear icon ![Settings icon](media/end-user-subscribe/power-bi-settings-icon.png) > **Settings** > **Subscriptions**. 

:::image type="content" source="media/end-user-subscribe/power-bi-admin-view.png" alt-text="Screenshot showing all subscriptions for a workspace.":::

Users with the Admin role can also make edits or take over ownership of subscriptions that are not their own.  

If, for example, the owner of a subscription is on vacation and a new recipient needs to be added to their subscription, an admin can do this by selecting **Edit** and making the necessary updates to the subscription. The owner of this subscription will receive an email notification that their workspace admin has made an edit.  

:::image type="content" source="media/end-user-subscribe/power-bi-admin-edit.png" alt-text="Screenshot showing a list of subscriptions with the pencil icon selected.":::

Admins can also take over ownership of subscriptions in workspaces they manage. This is essential when the original owner leaves a team or an organization. When the admin completes the take over, the original owner receives an email and will no longer see this subscription in their list of subscriptions.

:::image type="content" source="media/end-user-subscribe/power-bi-admin-take-over.png" alt-text="Screenshot showing a list of subscriptions with the take over icon selected.":::

## Power BI administrators

### Subscription controls and tracking for administrators 

Power BI administrators have levers of control over subscriptions. 

- [Enable email subscriptions](../admin/service-admin-portal-export-sharing.md) for all members of the organization. 

- Enable all members of the organization, or just specific users, to send email subscriptions to external users. See [Invite external users to your organization](../admin/service-admin-portal-export-sharing.md). 

- [Enable specific attachment formats](../admin/service-admin-portal-export-sharing.md) for paginated report subscriptions (PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML). 

### View subscription audit and activity logs 

Power BI administrators can use the Power BI audit and activity logs to view details about subscriptions. These details include: 

- Created by 
- Creation date 
- Content subscribed to 
- Workspace of content 
- Frequency 
- Modified by 
- Modified date 

See [Operations available in the audit and activity logs](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs) in "Track user activities in Power BI" for details. 


---
## Considerations and limitations 

For help with troubleshooting for the subscriptions feature, see [Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml).  

**General**
  
- If you aren't able to use the subscription feature, contact your system administrator or IT help desk. Your organization may have disabled this feature or a maximum subscriber limit may have been reached.
- Power BI automatically pauses refresh on datasets associated with dashboards and reports that haven't been visited in more than two months. However, if you add a subscription to a dashboard or report, it won't pause even if it goes unvisited. 
- For Power BI reports, dashboards, or paginated reports that use a dataset with row-level security (RLS), you can create subscriptions for yourself and others. Those subscriptions will run using your security context.

**Power BI reports**  

- Report page subscriptions are tied to the name of the report page. If you subscribe to a report page, and it gets renamed, you will have to re-create your subscription.    

- Email subscriptions are sent with the report's default filter and slicer states. Any changes to the defaults that you make before or after subscribing will not show up in the email. However, when you select the link to open the report, you will see changes that you've made and saved.

**Apps** 

- For [Power BI apps](end-user-apps.md) you have installed, you can only create subscriptions for others if you are the owner of the app. 
- Workspace admins cannot manage subscriptions created by another user in an app (as opposed to a workspace). 

**Unsupported features**    
Email subscriptions do not support:
 
* R-powered Power BI visuals  
* Bookmarks
* Most [custom visuals](../developer/visuals/develop-power-bi-visuals.md). The exception is those Power BI custom visuals that have been [certified](../developer/visuals/power-bi-custom-visuals-certified.md).
* Dataset refresh operations using an XMLA endpoint


## Next steps

[Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml)   
[Search for and sort content](end-user-search-sort.md)
