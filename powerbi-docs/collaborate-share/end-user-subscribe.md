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
ms.date: 07/11/2024
ms.custom: retail analysis sample
LocalizationGroup: Common tasks
---

# Email subscriptions for reports and dashboards in the Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Subscribe yourself and others to Power BI reports, dashboards, and paginated reports. You receive an email on a schedule you set. The email contains a snapshot and link to the report or dashboard or a full attachment of the report or dashboard. If you're a workspace administrator, learn how to manage subscriptions in your workspace, including how to take over subscriptions owned by others.

> [!IMPORTANT]
> Subscribing others requires a paid license (Pro or PPU). For information about licenses, see [Fabric and Power BI licenses and subscriptions](../consumer/end-user-license.md).

## Subscribe to a report or dashboard in the Power BI service 

It's never been easier to stay up-to-date on your most important dashboards and reports. Subscribe to reports and dashboards that matter most to you, and Power BI emails a snapshot to your inbox. You tell Power BI how often you want to receive the emails and at what time. Set up to 24 subscriptions per report or dashboard, and provide unique recipients, times, and frequencies for each subscription.  

:::image type="content" source="./media/end-user-subscribe/power-bi-emails.png" alt-text="Screenshot showing email for subscription to a report.":::


## Requirements
The requirements apply to users in the organization and to [Microsoft Entra Business-to-Business (B2B) guest users](../enterprise/service-admin-azure-ad-b2b.md). To create a subscription for yourself, you need permissions to access the particular report or dashboard and **either**:

- A Power BI Pro or [Premium Per User (PPU) license](../consumer/end-user-license.md), or
- Access to a workspace backed by a [Power BI Premium capacity](../enterprise/service-premium-what-is.md) 

Your Fabric admin (previously Power BI admin) needs to enable subscriptions in your tenant. If you’re an admin, see [Enable subscriptions in the Power BI admin portal](/fabric/admin/service-admin-portal-export-sharing#users-can-set-up-email-subscriptions) and see [B2B guest users can set up and be subscribed to email subscriptions](/fabric/admin/service-admin-portal-export-sharing#b2b-guest-users-can-set-up-and-be-subscribed-to-email-subscriptions).

## Subscribe to a report or dashboard
Whether you're subscribing to a dashboard, report page, or to a full report, the process is similar. A single button allows you to subscribe to the Power BI service dashboards and reports. Subscribing to a report offers you a few more field options, so we're using a report for our example. 

:::image type="content" source="./media/end-user-subscribe/power-bi-subscribe.png" alt-text="Screenshot showing the Subscribe to report icon on the top menu bar.":::

Subscribing to a *paginated* report is slightly different, as outlined in [Subscribe to paginated reports](#subscribe-to-paginated-reports) in this article.

1. Open the report, and from the top menu bar, select **Subscribe to report** ![Screenshot showing the Subscribe icon.](./media/end-user-subscribe/power-bi-icon.png).  

1. Select **Create a subscription** and give your subscription a name. By default, your subscription is given the same name as your report page or dashboard. Optionally, change the name of the subscription to something more meaningful.

   :::image type="content" source="./media/end-user-subscribe/power-bi-report-subscribe.png" alt-text="Screenshot of the Subscribe to emails screen.":::

1. Use the green slider to turn the subscription on and off. Setting the slider to **Off** doesn't delete the subscription. To delete the subscription, select the trashcan icon.

1. Edit or add recipients by email address, ensuring that you have at least one. 

1. If the report is in a workspace backed by a Premium capacity or Premium Per User (PPU) license, add the full report as an attachment instead of only a single report page. Sensitivity labels are applied to the email attachment. Select PDF or PowerPoint for the attachment format. The attachment respects all privacy labels for the report. The size of the attachment is limited to no more than 20 pages and less than 25 MB.

   :::image type="content" source="./media/end-user-subscribe/power-bi-attach.png" alt-text="Screenshot showing the Attach full report dropdown.":::

1. Select a **Start date** and optionally, an **End date** for your subscription. By default, the start date is the date you created the subscription and the end date is one year later. You can change it to any date in the future at any time before the subscription ends. When a subscription reaches an end date, it stops until you re-enable it. You receive notifications before the scheduled end date to ask if you'd like to extend it.

1. Use the **Repeat** dropdown to select a frequency for your subscription. You may choose hourly, daily, weekly, monthly, or after data refresh (once daily). Most of the options require that you set a time zone as well.  
    
    > [!TIP]
    > To receive a subscription email only on certain days, select 
    > Hourly or Weekly and then select the week day checkboxes. 
    > If you select Monthly, enter the day(s) of the month you 
    > wish to receive the subscription email.

    - If you choose Hourly, Daily, Weekly, or Monthly, choose a **Scheduled Time** for the subscription. You can have it run on the hour, or at 15, 30, or 45 minutes past for a specified time zone. If you choose Hourly, select the **Scheduled Time** you want the subscription to start, and it runs every hour after the **Scheduled Time**.
    - If you choose a **Monthly** cadance for report subscriptions, you can either specify specific day(s) of the month or select the **Last day of month** option. If you choose **Last day of month**, the report will be delivered on that day.
      
:::image type="content" source="./media/end-user-subscribe/power-bi-schedule-last-day-of-month.png" alt-text="Screenshot showing the last day of month option.":::  

If your subscription is ready, select **Save**. To make your subscription more precise, select **More options**. 

1. Optionally, add a subject and message for recipients. 

1. Select the **Report page** you want to appear in the preview image. If you toggled' **Attach full report** to **On**, you see all the report pages listed in the dropdown. Otherwise, you only have the active report page listed in the dropdown. To subscribe to more than one page in a report, either select the **Attach full report** slider, or select **New subscription** and choose a different page from the dropdown.  

    > [!TIP]
    > By default, a report subscription inherits the name of 
    > the active report page. Consider changing the subscription 
    > name if you select a different report page. 

1. Include additional information in the email. Select one or more of these checkboxes.
    - **Permission to view the report/dashboard in Power BI**: Give recipients permission to open and view the report or dashboard in the Power BI service (app.powerbi.com). This option isn't available in all situations. 
    - **Link to report/dashboard in Power BI**: Include a "Go to report" button in the body of the email that links to the report or dashboard in the Power BI service.
    - **Preview image (for Power BI reports only)**: Include a preview of the report page in the body of the email. 

    > [!CAUTION]
    > Sensitivity labels are not applied to a subscription's 
    > email or preview image. To protect against this, 
    > turn off **Preview image**.  
    
You receive an email and snapshot of the report or dashboard on the schedule you set. Subscriptions that have the frequency set to **After data refresh** only send an email after the first scheduled refresh on that day. All dates/times are normalized to UTC when checking for the first dataset refresh of the day. 

> [!NOTE]
>
> - To avoid subscription emails going to your spam folder, add the Power BI email alias (no-reply-powerbi@microsoft.com) to your contacts. If you're using Microsoft Outlook, right-click the alias and select **Add to Outlook contacts**.
> - You can have Power BI send subscription emails to a [mail-enabled security group](/power-bi/collaborate-share/end-user-subscribe#use-group-email-aliases). Be sure to add the Power BI alias (no-reply-powerbi@microsoft.com) to the approved sender list.

## Sensitivity labels

Sensitivity labels are applied to subscription email attachments but not to the subscription's email text or preview images.

- Creating a subscription that attaches a copy of a report (including paginated report) to the subscription email is a Power BI Pro feature.  

- For users with free subscriptions, the subscription email for a report (including paginated report) doesn't contain a sensitivity label in the email text or the subscription preview image. 
- To ensure that your subscription has a sensitivity label, turn off **Preview image** in the **Subscriptions** screen. 
- For subscriptions to dashboards, there's no option to attach a copy of the dashboard to the email. So, the subscription email doesn't have a sensitivity label in the text or preview image. 


## Subscribe others

To create a subscription that includes others, in addition to the [requirements necessary to create your own subscriptions](#requirements), you also need:

- A Pro or PPU license with Contributor, Member, or Admin role in that workspace. You know that you have the Contributor, Member, or Admin role in a workspace if you're able to edit reports or dashboards in that workspace. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).  

- To be part of the organization. [B2B guest users](../enterprise/service-admin-azure-ad-b2b.md) can't subscribe others only themselves. For more information, read [B2B guest users can set up and be subscribed to email subscriptions](#b2b-guest-users-can-set-up-and-be-subscribed-to-email-subscriptions).

- If the report or dashboard isn't hosted in a Premium capacity, as indicated by the diamond icon, you can still subscribe others. However, they must also have a Power BI Pro or Premium Per User (PPU) license. 

    :::image type="content" source="media/end-user-subscribe/power-bi-premium.png" alt-text="Workspaces showing diamond icon for Premium and diamond with person icon for PPU.":::

### Use group email aliases 
When creating a subscription, you can add other email addresses in the same domain to the subscription. If the report or dashboard is hosted in a [Premium capacity](../enterprise/service-premium-what-is.md), you can subscribe group aliases, whether they're in your domain or not. You don't have to subscribe individual email addresses. The aliases are based on the current active directory. 

|Group type      |Supported in email subscriptions  |
|---------|---------|
|[Microsoft 365 groups](/microsoft-365/admin/create-groups/office-365-groups)     |      Yes   |
|[Distribution groups](/exchange/recipients-in-exchange-online/manage-distribution-groups/manage-distribution-groups)    |    Yes     |
|[Dynamic distribution groups](/exchange/recipients-in-exchange-online/manage-dynamic-distribution-groups/manage-dynamic-distribution-groups)     |      Yes   |
|[Security groups](/microsoft-365/admin/email/create-edit-or-delete-a-security-group)     |    No     |
|[Mail-enabled security groups](/microsoft-365/admin/create-groups/compare-groups?view=o365-worldwide#microsoft-365-groups&preserve-view=true)    |     Yes    |

There are different ways of creating a Microsoft 365 group. For example, you can create a group in Outlook, a distribution group in Teams, or a mail-enabled security group. The Microsoft 365 distribution group for Teams doesn't work for mail enablement, so can't be used for direct sharing and email subscriptions.

> [!NOTE]
> Workspaces backed by a Premium Per User (PPU) license are different from those backed by a Premium capacity, and don't support subscribing group aliases.  

## Save changes to a subscribed report

### Include my changes

When you subscribe to a report created by someone else, you can make changes to that report. At that point, you can create a new subscription that captures those changes or you can save your changes with the existing subscription. 

:::image type="content" source="./media/end-user-subscribe/power-bi-my-changes.png" alt-text="Screenshot showing the My changes section of the Subscriptions pane.":::

You don't see the option to **Include my changes** until you actually make changes to a report that was shared with you. After you make the changes that you need, open an existing subscription or create a new subscription for that report page. Because you made changes to the original report, you now have the header for **My changes** and the option to **Include my changes**. 

When **Include my changes** is unchecked, Power BI ignores all changes you made to the report, and keeps you subscribed to the report as published by the author. When **Include my changes** is checked, Power BI updates the subscription including all changes you made to the report. Changes include:  

- filters (filter pane)
- slicers
- personalized visuals
- cross-filtering or cross-highlighting
- drill down or drill up
- bookmarks
- spotlights
- focus mode

Before Power BI updates the subscription, you're given the opportunity to preview the old subscription and compare it to the new state of the report. Comparing the two versions helps you decide whether to update the subscription or not. 

### Preview and update your subscription

1. First, customize your report based on conditions such as country/region, team/department, and category. 
 
1. Apply any changes to the report so that it's in the state you want to subscribe or share. Changes might include applying filters, spotlights, drilling, slicers, or cross-highlighting.

1. Select **Subscribe to report** from the top menubar of the report canvas to reopen the **Subscriptions** pane.

1. Select the pencil icon to edit the details of your existing subscription. For example,  change the delivery frequency, add an email message, change permissions, and more.
1. Select **More options** > **Include my changes** > **Preview** to display a view-only version of the original subscription that is being sent out to subscribers. Use this comparison to decide if you want to overwrite the original state of the subscribed report.
1. Select **Back to subscription** and select the pencil icon. 
1. To update the existing subscription to include your report changes, select **More options** > **Include my changes** > **Update**. **Update** changes the subscription to include the new changes. 
1. Save your subscription. 

> [!NOTE]
> The update is applied to the current page only. Changes you made to other pages in the report are not included. To include changes made to a different page in the report, navigate to that page and apply an update. 

### Customize subscriptions

If you're the author of the report, **Include my changes** is a great way to create individualized subscriptions for recipients. 

> [!NOTE]
> The **Include my changes** field isn't available for dashboards or paginated reports. 

## Review and test the subscription
Your **Subscriptions** page keeps track of all of your subscriptions for the current report. 

:::image type="content" source="./media/end-user-subscribe/power-bi-subscription-manage.png" alt-text="Screenshot showing the Subscriptions page with two subscriptions listed.":::

To review a subscription, select the arrow to the left of the subscription. 

:::image type="content" source="./media/end-user-subscribe/power-bi-subscription-reviews.png" alt-text="Screenshot showing all the details for one subscription.":::

To test out your subscription, select the  **Run now** to send the email to you right away. It doesn't trigger a data refresh of the underlying semantic model. 

## Manage subscriptions

Subscriptions are managed on a workspace level. Subscription creators and users assigned the Admin role can view and manage the subscription. Admins in the workspace can edit and take over all subscriptions inside the workspace. The Fabric admin can view logs, and turn certain subscription features on and off.

# [Creator](#tab/creator)

### Subscriptions in a workspace

To see all of the subscriptions that you own in a given workspace, select **Manage all**

:::image type="content" source="media/end-user-subscribe/power-bi-manage-all.png" alt-text="Screenshot showing the Subscriptions pane with Manage all outlined in red.":::

From here, you see all the subscriptions you created in the currently selected workspace. For each subscription, Power BI displays the name you gave to the subscription, the name of the content you're subscribing to, and the content type. If you selected **Include my changes**, the **State** column includes the date. Search for subscriptions by keyword or filter by any of these fields. 

:::image type="content" source="media/end-user-subscribe/power-bi-notifications.png" alt-text="Screenshot showing the Notifications pane with Power BI subscription outlined in red.":::

Select the **Edit** icon to return to the Subscriptions screen where you can:
- see your list of subscriptions for that report or dashboard.
- preview the settings for a subscription by selecting the arrow to the left of the subscription name.
- make changes to a subscription’s settings by selecting the pencil icon.
- open the report or dashboard by selecting **Edit in report** or **Edit in dashboard**.

    :::image type="content" source="media/end-user-subscribe/power-bi-edit-in-report.png" alt-text="Screenshot showing the Subscriptions with Edit in report outlined in red.":::


### Subscriptions across all workspaces

To see all of your subscriptions, start by selecting **My workspace** to make it active. Then, from the upper right corner of the Power BI service, select the gear icon ![cog icon](media/end-user-subscribe/power-bi-settings-icon.png) > **Settings** > **Notifications**.

:::image type="content" source="media/end-user-subscribe/power-bi-settings-menu.png" alt-text="Screenshot showing cog icon selected.":::


From here, you see a list of all your subscriptions across all workspaces. Power BI displays the name of the subscription, the name of the content you're subscribing to, the name of the owner, the name of the associated workspace, and the content type. If you selected **Include my changes**, the **State** column includes the date when changes were included. Search for subscriptions by keyword or filter by any of these fields. Select the **Edit** icon to make changes to a subscription’s settings. 

:::image type="content" source="media/end-user-subscribe/power-bi-all-subscriptions.png" alt-text="Screenshot showing all subscriptions for a user.":::

# [Administrator](#tab/admin)

### Workspace administrators
Users who are assigned the [Admin role](../collaborate-share/service-roles-new-workspaces.md) in a workspace can view all subscriptions created for Power BI reports, dashboards, or paginated reports in that workspace, regardless of owner. Information on the subscription name, owner, report or dashboard name, and content type is provided. Workspace admins can also edit and take over subscriptions owned by others.

> [!NOTE]
> Subscriptions created for reports and dashboards in an app or those hosted in your **My workspace** can only be managed by the user who created the subscriptions. 

To navigate to this view from within a workspace, select the gear icon ![Settings icon](media/end-user-subscribe/power-bi-settings-icon.png) > **Settings** > **Notifications**. 

Users with the Admin role can also make edits or take over ownership of subscriptions that aren't their own.  

If for example, the owner of a subscription is on vacation and a new recipient needs to be added to their subscription, an admin can modify the subscription by selecting the **Edit** icon and making the necessary updates to the subscription. The owner of this subscription receives an email notification that their workspace admin made an edit.  

:::image type="content" source="media/end-user-subscribe/power-bi-edit-admin.png" alt-text="Screenshot showing a list of subscriptions with the pencil icon selected.":::

Admins can also take over ownership of subscriptions in the workspaces they manage. Being able to take over a subscription is essential when the original owner leaves a team or an organization. When the admin completes the take over, the original owner receives an email, and no longer sees this subscription in their list of subscriptions.

:::image type="content" source="media/end-user-subscribe/power-bi-take-over.png" alt-text="Screenshot showing a list of subscriptions with the take over icon selected.":::

### Fabric (previously Power BI) administrators

#### Subscription controls and tracking for Fabric administrators 

Fabric administrators have levers of control over subscriptions. 

- [Users can set up email subscriptions](/fabric/admin/service-admin-portal-export-sharing) for all members of the organization. 

- Enable all members of the organization, or specific users, to send email subscriptions to external users. See [Users can send email subscriptions to external users](/fabric/admin/service-admin-portal-export-sharing). 

- [Enable specific attachment formats](/fabric/admin/service-admin-portal-export-sharing) for paginated report subscriptions (PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML).
- [B2B guest users can set up and be subscribed to email subscriptions](/fabric/admin/service-admin-portal-export-sharing#b2b-guest-users-can-set-up-and-be-subscribed-to-email-subscriptions) to allow B2B guest users to create and subscribe to their own email subscriptions. 

### View subscription audit and activity logs 

Fabric administrators can use the Power BI audit and activity logs to view details about subscriptions. These details include: 

- Created by 
- Creation date 
- Content subscribed to 
- Workspace of content 
- Frequency 
- Modified by 
- Modified date 

See [Operations available in the audit and activity logs](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs) in "Track user activities in Power BI" for details. 

---

## Subscriptions for users outside your organization

### Subscribe external users 

You can subscribe external users to a report or dashboard if your report or dashboard is hosted in a Premium capacity. B2B guest users can't add subscriptions for external users. 

- If you subscribe external users to a report or dashboard, they'll receive a share notification immediately after you select  **Save** in the subscription pane. This notification is sent only to external users, not internal users, because external users require an invitation link to view the report or dashboard. 

- Premium Per User workspaces don't qualify as Premium capacity workspaces. 

- *Sharing* content with a colleague outside of your domain doesn't require a Premium capacity. For example, if you're aaron@contoso.com, you can share with anyone@fabrikam.com, but you can't **subscribe** anyone@fabrikam.com, unless that content is hosted in a Premium capacity. 

### B2B guest users can set up and be subscribed to email subscriptions

B2B guest users can create their own content subscription to which they have access and users in the organization can subscribe them to emails. First, a member of the organization adds and subscribes the B2B guest user to the email content. For more information about B2B guest users and how to add them to your organization, read [Distribute content to external guest users with Microsoft Entra B2B](../enterprise/service-admin-azure-ad-b2b.md).

In addition to B2B guest users meeting the requirements to subscribe themselves, the Power BI tenant admin must turn on a setting to allow B2B guest users to create email subscriptions. For more information on how to turn on this setting, read [Export and sharing tenant settings](/fabric/admin/service-admin-portal-export-sharing#b2b-guest-users-can-set-up-and-be-subscribed-to-email-subscriptions).

## Subscribe to paginated reports 

### Subscribe yourself or others to paginated reports
Your Power BI admin must [enable subscriptions in your tenant](/fabric/admin/service-admin-portal-export-sharing). In addition, the relevant tenant switches have to be enabled:
- Export to Excel
- Export to .csv
- Export reports as PowerPoint presentations or PDF documents
- Export reports as MHTML documents
- Export reports as Word documents
- Export reports as XML documents
- Create email subscriptions (**Tenant settings** > **Export and sharing settings** > **Create email subscriptions**)
:::image type="content" source="./media/end-user-subscribe/power-bi-paginate.png" alt-text="Screenshot of tenant settings with relevant export settings outlined.":::

In general, the process for subscribing to paginated reports is the same as [subscribing to reports and dashboards](#subscribe-to-a-report-or-dashboard), but there are a few differences worth noting. This section spells out these differences and other considerations to keep in mind when subscribing to paginated reports.  

### Paginated reports parameters 

Paginated reports allow you to specify the view of the report people receive in the subscription by setting the parameters in the subscription pane.  

- Subscriptions can be sent with either the currently selected or default parameters for your report. You may set different parameter values for each subscription you create for your report. 

- If your report author set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. You can change other parameter values and choose to use current values. But unless you explicitly change that value as well, the subscription uses the expression-based parameter. 

### Update parameters for an existing paginated report subscription

If you have an existing subscription to a paginated report, and you want to update the parameters applied to the report, follow these steps. 

1. Re-render the paginated report with the new  parameters.
1. Open the **Subscriptions** page.
1. Select **Use current (rendered report) values**.
    :::image type="content" source="./media/end-user-subscribe/power-bi-paginated-new.png" alt-text="Screenshot of Report parameters with Use current selected.":::

1. Select **Save**.

### Considerations unique to paginated report subscriptions

- You can subscribe other users in your organization to paginated reports that connect to any currently supported data sources, including Azure Analysis Services or Power BI semantic models. Keep in mind the report attachment reflects the data based on your permissions.
- You can set up an unlimited number of subscriptions per paginated report. 
- B2B guest users can only create subscriptions for themselves.
- The maximum attachment size is 25 MB.
- Unlike subscriptions for dashboards or Power BI reports, your subscription contains an attachment of the entire report output. The following attachment types are supported: PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML. 
- Optionally, include a preview image of the report in the email body. The image may differ slightly from the first page of your attached report document, depending on the attachment format you select. 
- There's no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source.
- Paginated report subscriptions in the Power BI service are similar to email standard subscriptions in Power BI Report Server and SQL Server Reporting Services. Data-driven subscriptions in the Power BI service are called Dynamic subscriptions. Learn more about [Creating a dynamic subscription for a Power BI report (Preview) - Power BI](power-bi-dynamic-report-subscriptions.md).
- Reports for subscriptions have a 60-minute execution time limit. If the report takes longer than 60 minutes to execute, a timeout error occurs.

## Considerations and limitations 

For help with troubleshooting for the subscriptions feature, see [Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml).  

**General**
  
- If you can't use the subscription feature, contact your system administrator or IT help desk. Your organization may disable this feature or the maximum subscriber limit was reached.
- Power BI automatically pauses refresh on semantic models associated with dashboards and reports that aren't visited in more than two months. However, if you add a subscription to a dashboard or report, it doesn't pause even if it goes unvisited.
- On Daylight savings day, you receive your subscription emails and the day after you receive two emails per subscription. 

**Row-level security (RLS)**

- For Power BI reports, dashboards, or paginated reports that use a semantic model with row-level security (RLS), use caution when creating subscriptions for yourself and others. Power BI warns you that the data contains RLS. A bubble info icon shows up next to the recipients header. If you hover over that icon, you can see the warning message. However, users often scroll past the warning message. 

  The static image sent in the subscription email displays data ***based on the owner of the subscription***. For this reason, when creating subscriptions, be careful to ensure that confidential information isn't included in the static image. Other than that static image, the report or dashboard itself opens (or not) and displays data based on the user's permissions.  

**Power BI reports**  

- Report page subscriptions are tied to the name of the report page. If you subscribe to a report page, and it gets renamed, you have to re-create your subscription.    

**Apps** 


- For [Power BI apps](../consumer/end-user-apps.md) you install, you can only create subscriptions for others if you're the owner of the app.

- Subscriptions created within apps can be viewed and managed from the associated workspace by users with the admin role in that workspace.  

**Unsupported features**    

* Semantic model refresh operations using an XMLA endpoint.

* Email subscriptions aren't supported when the admin setting **Azure private link** > **Block public internet access** is enabled in Power BI. In this case, all subscriptions fail.

* The following Power BI visuals aren't supported. When you subscribe to a report containing these visuals, they display an error symbol. 
    - Power BI [custom visuals](../developer/visuals/develop-power-bi-visuals.md). The exception is those Power BI custom visuals that are [certified](../developer/visuals/power-bi-custom-visuals-certified.md).
    - [ESRI ArcGIS](../visuals/power-bi-visualizations-arcgis.md) visuals
    - [R visuals](../visuals/service-r-visuals.md)
    - [Power Apps visuals](../visuals/power-bi-visualization-powerapp.md)
    - [Python visuals](../connect-data/desktop-python-visuals.md)
    - [Power Automate visuals](../create-reports/power-bi-automate-visual.md) 
    - [The Paginated report visual](../visuals/paginated-report-visual.md)
    - [Visio visuals](https://appsource.microsoft.com//product/office/WA104381132?corrid=090b6a91-07e7-aa81-d025-7cb56f4f6293&src=office&exp=ubp8)

## Related content

[Troubleshoot Power BI subscriptions](service-troubleshoot-subscribe.yml)   
[Search for and sort content](../consumer/end-user-search-sort.md)
