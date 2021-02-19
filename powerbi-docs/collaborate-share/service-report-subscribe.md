---
title: Subscribe others to your reports and dashboards
description: Learn how to subscribe others to a snapshot of a Power BI report page or dashboard.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: 
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 01/13/2021

LocalizationGroup: Common tasks
---
# Subscribe others to your reports and dashboards in the Power BI service

The process for subscribing yourself or your colleagues to report pages, dashboards, and paginated reports is the same. The article [Subscribe to a report or dashboard in the Power BI service](../consumer/end-user-subscribe.md) lays out the basic process. This article spells out what's different when you subscribe others. 

Subscribing to paginated reports is a little different. See [Subscribe yourself and others to a paginated report in the Power BI service](../consumer/paginated-reports-subscriptions.md) for details.

 Power BI e-mail subscriptions allow you to:

- Have a mail sent with an image of the report and link to the report in the service. 
- Send email to users outside your tenant, if your Power BI content is hosted in a Premium capacity.  Administrators can control access to who can send email subscriptions to external users by leveraging the existing external sharing control settings in the Power BI admin center.

![email snapshot of dashboard](media/service-report-subscribe/power-bi-subscriptions-email.png)

## Requirements

To create subscriptions for others, you must have:

- Edit permissions for the dashboard or report.
- A Power BI Pro license.

**Creating** a subscription can be done by:

- Users with a Power BI Pro license
- Users viewing content in a Premium workspace or app may also subscribe to content located there, even without a Power BI Pro license.


## Subscribe to a dashboard, report page, or paginated report

2. Your email address is already in the  **Subscribe**  box. You can add other email addresses in the same domain to the subscription as well. If the report or dashboard is hosted in a [Premium capacity](../admin/service-premium-what-is.md), you can subscribe other individual email addresses and group aliases, whether they're in your domain or not. If the report or dashboard isn't hosted in a Premium capacity, you can subscribe other individuals, but they too must have Power BI Pro licenses. See [Considerations and troubleshooting](#considerations-and-troubleshooting) below for details.


1. (Optional) Select whether to include a link back to the content in Power BI and whether to give users access to the content you're subscribing them to.  If you choose to include a link, for the best experience, ensure that all users have access to the report.

1. Select  **Save and close**. Those subscribed receive an email and snapshot of the dashboard or report page for the frequency and time you selected. In all, you may create up to 24 subscriptions per report or dashboard, and can provide unique recipients, times, and frequencies for each subscription. Subscriptions set to  **After Data Refresh**  for your dashboard or report only send an email after the first scheduled refresh.

    > [!NOTE]
    > If you edit the subscription after saving and closing, the selection for giving users access to the content you're subscribing is enabled, regardless of your previous selections.
    >

    > [!TIP]
    > Want to send the email from a subscription right away or on-demand at any time? Select  **Run Now**  for the subscriptions for the dashboard or report you want to send. You'll see a notification that an e-mail is on its way to everyone for that particular subscription. Taking this action doesn't count against your limit of 24 scheduled subscription runs per day per report or dashboard. It does NOT trigger a data refresh of the underlying dataset.
    >

## Manage your subscriptions

Only the person who created the subscription can manage it. To view your subscriptions, select the **...** (**Settings**) from the top menu bar.

![select Settings](media/service-report-subscribe/power-bi-subscribe-settings.png)

The subscriptions displayed depend on which workspace is currently active. To see all your subscriptions for all workspaces, select  **My Workspace**. For help understanding workspaces, see  [Workspaces in Power BI](service-create-workspaces.md).

![see all subscriptions in My Workspace](media/service-report-subscribe/power-bi-subscriptions.png)

A subscription ends in any of these cases:

- The Pro license expires.
- The owner deletes the dashboard or report.
- The user account used to create the subscription is deleted.

Power BI administrators can use the Power BI audit logs to view details around subscriptions. These details include:

- Created By
- Creation Date
- Content Subscribed to
- Recipients
- Frequency
- Modified By
- Modified Date

## Considerations and troubleshooting

### General

- Subscribed users receive report attachments with data based on your permissions.
- Currently, email subscriptions for reports and dashboards using live connection datasets aren't supported when subscribing users other than yourself, except for paginated reports. You can subscribe others to a paginated report, using your security context. Read more about [subscribing to paginated reports](../consumer/paginated-reports-subscriptions.md).
- If you aren't receiving the subscription emails:

    - Make sure that your User Principal Name (UPN) can receive emails.
    - Though you have a Power BI Pro license, you may not have a Microsoft Exchange license. If not, your Azure Active Directory account may not have an email or alternate email address specified. In this case, though the subscription appears to go out, you never receive a copy.  If your Power BI admin assigns an email address, Power BI will synchronize the update the next time you sign in, and use that e-mail address for the subscription.

- If your dashboard or report is in Premium capacity, you can use group email aliases for subscriptions, instead of subscribing colleagues one email address at a time. The aliases are based on the current active directory.
- If your content isn't in a Premium capacity, only Power BI Pro users can receive email subscriptions.
- Add to end-user-subscribe: Subscriptions don't currently support bookmarks.
- The option to provide access to the report/dashboard always shows as enabled when you edit an existing subscription.  If you clear this option and save the subscription, it saves that state. However, if you edit the report again, the option will be checked by default.
- If you have an alternate email address but no primary, Power BI uses that to deliver the subscription.
- If you subscribe external users to a report or dashboard, they will receive a share notification immediately after you select **Save and close** in the subscription pane. This notification is sent only to external users, not internal users, because they require an invitation link to view the report or dashboard. 
- There is a limit to the number of subscribers for one report or dashboard. After you pass 200 subscribers, you may encounter issues with delivery. To reduce the number of subscribers, use group email aliases instead. Each email alias counts as one subscriber.

### Dashboards

- On rare occasions, e-mail subscriptions may take longer than fifteen minutes to be delivered to their recipients. If this happens, we recommend running your data refresh and e-mail subscription at different times to ensure timely delivery. If the issue persists, contact Power BI support.
- If you share a dashboard with a colleague outside of your tenant, you can't also create a subscription for that colleague *unless* the dashboard sits in a Premium workspace or app. So if you are `aaron@contoso.com`, you can *share* with `anyone@fabrikam.com`, but you can't yet *subscribe* `anyone@fabrikam.com`, and they can't subscribe to shared content.

### Reports

- For paginated and Power BI report email subscriptions, if the dataset uses row-level security (RLS), you can create subscriptions for yourself. You may also subscribe others to a report with RLS. Those subscriptions will be generated using your security context.
- Report page subscriptions are tied to the name of the report page. If you subscribe to a report page and then rename it, you have to re-create your subscription.
- Your organization may configure certain settings in Azure Active Directory that limit the ability to use email subscriptions in Power BI. These limitations include, but aren't limited to, having multi-factor authentication or IP range restrictions when accessing resources.
- Email subscriptions don't support most [custom visuals](../developer/visuals/power-bi-custom-visuals.md). The one exception is those custom visuals that have been [certified](../developer/visuals/power-bi-custom-visuals-certified.md).
- Email subscriptions don't support R-powered custom visuals at this time.
- Email subscriptions are sent with the report's default filter and slicer states. Any changes to the defaults that you make after subscribing don't show up in the email. Paginated reports do support this capability and allow you to set the specific parameter values per subscription.
- Say you have a report with a live connection to Analysis Services, and you have the subscription set to run after data refresh. It will run the first time the Power BI service detects a change in your on-premises model when it polls the Analysis Services instance.  Power BI checks every hour for a change in the Analysis Services data model, to determine when to send the subscription.
- The full report attachment feature is available for reports that meet these three conditions:

    - They're in an upgraded workspace with [Power BI Premium or Premium Per User](../admin/service-premium-what-is.md). 
    - The attachment file is under 25 MB in size.
    - The report has fewer than 20 pages. 
    
    If the report doesn't meet these three conditions, then you can't create subscriptions with full reports as attachments. Any existing subscriptions with full reports as attachments are disabled, and you receive an email explaining the error.
    
## Next steps

- [Paginated reports in the Power BI service: Subscribe yourself and others](../consumer/paginated-reports-subscriptions.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Read the [Power BI blog post about email subscriptions for dashboards](https://powerbi.microsoft.com/blog/introducing-dashboard-email-subscriptions-a-360-degree-view-of-your-business-in-your-inbox-every-day/)
