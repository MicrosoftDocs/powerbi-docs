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
ms.date: 05/26/2021


LocalizationGroup: Common tasks
---
# Subscribe others to your reports and dashboards in the Power BI service

The basic process for subscribing your colleagues and others to report pages, dashboards, and paginated reports is the same as subscribing yourself. The article [Subscribe to a report or dashboard in the Power BI service](../consumer/end-user-subscribe.md) lays out how to do it. *This* article spells out what you need to know when you subscribe others.

![Screenshot of email snapshot of dashboard.](media/service-report-subscribe/power-bi-subscriptions-email.png)

Power BI email subscriptions allow you to:

- Send email with an image of the report and link to the report in the service.
- Send email to users outside your tenant, if your Power BI content is hosted in a Premium capacity.  Administrators control who can send email subscriptions to external users. See [Invite external users to your organization](../admin/service-admin-portal.md#invite-external-users-to-your-organization) in the "Administering Power BI in the admin portal" article.

Subscribing to *paginated reports* is also a little different. See [Subscribe yourself and others to a paginated report in the Power BI service](../consumer/paginated-reports-subscriptions.md) for details.

## Requirements

To create subscriptions for others, you must have:

- Edit permissions for the dashboard or report.
- A Power BI Pro or Premium Per User (PPU) license.

If the report or dashboard isn't hosted in a Premium capacity, you can subscribe other people, but they must have Power BI Pro or Premium Per User (PPU) licenses.

## Power BI admins and subscriptions

### Admins control subscription activity

Power BI administrators have levers of control over subscriptions. The following links point to the relevant sections of the admin portal:

- [Enable email subscriptions](../admin/service-admin-portal.md#email-subscriptions) for all members of the organization.
- Enable specific users to send email subscriptions to external users. See [Invite external users to your organization](../admin/service-admin-portal.md#invite-external-users-to-your-organization).

### Admins audit subscription activity

Power BI administrators can use the Power BI audit logs to view details around subscriptions. These details include:

- Created By
- Creation Date
- Content Subscribed to
- Recipients
- Frequency
- Modified By
- Modified Date

See [Operations available in the audit and activity logs](../admin/service-admin-auditing.md#operations-available-in-the-audit-and-activity-logs) in "Track user activities in Power BI" for details.

## Considerations for subscribing others

See [Considerations and troubleshooting](../consumer/end-user-subscribe.md#considerations-and-troubleshooting) in "Subscribe to a report or dashboard in the Power BI service" for general considerations.

### General

- When creating a subscription, you can add other email addresses in the same domain to the subscription. If the report or dashboard is hosted in a [Premium or Premium-Per-User capacity](../admin/service-premium-what-is.md), you can subscribe group aliases, whether they're in your domain or not. You don't have to subscribe individual email addresses. The aliases are based on the current active directory.
- There's a limit to the number of subscribers for one report or dashboard. After you pass 200 subscribers, you may encounter issues with delivery. To reduce the number, use group email aliases instead. Each email alias counts as one subscriber.
- You can choose whether to include a link back to the content in Power BI and give users access to the content you're subscribing them to. If you choose to include a link, ensure that all users have access to the content. Subscribed users receive report attachments, with data based on your permissions.
- The option to provide access to the report/dashboard always shows as enabled when you edit an existing subscription.  If you clear this option and save the subscription, it saves that state. However, if you edit the report again, the option will be checked again by default.
- For paginated and Power BI report email subscriptions, if the dataset uses row-level security (RLS), you can create subscriptions for yourself and others. Those subscriptions will run using your security context.
- You can set up to 24 subscriptions per report or dashboard, and can provide unique recipients, times, and frequencies for each subscription. Subscriptions set to  **After Data Refresh**  for your dashboard or report only send an email after the first scheduled refresh.
- You can set up an unlimited number of subscriptions per paginated report.
- To test a subscription, or run it on demand at any time, select  **Run Now** for the subscription. Everyone for that subscription receives the email. This action doesn't count against your limit of 24 scheduled subscription runs per day per report or dashboard. It does NOT trigger a data refresh of the underlying dataset.
- Currently, email subscriptions for reports and dashboards using live connection datasets aren't supported when subscribing users other than yourself, except for paginated reports. Read more about [subscribing to paginated reports](../consumer/paginated-reports-subscriptions.md).
- On rare occasions, email subscriptions may take longer than fifteen minutes to be delivered to their recipients. If this happens, we recommend running your data refresh and email subscription at different times to ensure timely delivery. If the issue persists, contact Power BI support.
- Your organization may configure certain settings in Azure Active Directory that limit the ability to use email subscriptions in Power BI. These limitations include, but aren't limited to, having multi-factor authentication or IP range restrictions when accessing resources.
- Say you have a report with a live connection to Analysis Services, and you have the subscription set to run after data refresh. It will run the first time the Power BI service detects a change in your on-premises model when it polls the Analysis Services instance.  Power BI checks every hour for a change in the Analysis Services data model, to determine when to send the subscription.
- For Power BI apps, you can only create subscriptions for others if you are the owner of the app.

### External users

- If you subscribe external users to a report or dashboard, they will receive a share notification immediately after you select **Save and close** in the subscription pane. This notification is sent only to external users, not internal users, because they require an invitation link to view the report or dashboard. 
- To subscribe external users, your report or dashboard must be hosted in a Premium capacity workspace or app. Premium Per User workspaces do not qualify as Premium capacity workspaces. 
- Sharing content with a colleague outside of your tenant does not require a Premium capacity. So if you are `aaron@contoso.com`, you can *share* with `anyone@fabrikam.com`, but you can't *subscribe* `anyone@fabrikam.com`, and they can't subscribe to shared content *unless* that content is hosted in a Premium capacity.

### Troubleshooting

If you aren't receiving subscription emails, check these factors:

- Make sure that your User Principal Name (UPN) can receive emails.
- Though you have a Power BI Pro or Premium Per User (PPU) license, you may not have a Microsoft Exchange license. If not, your Azure Active Directory account may not have an email or alternate email address specified. In this case, though the subscription appears to go out, you never receive a copy.  If your Power BI admin assigns an email address, Power BI will synchronize the update the next time you sign in, and use that email address for the subscription.
- If you have an alternate email address but no primary, Power BI uses that to deliver the subscription.
- Email subscriptions are not supported when Block Public Internet Access is enabled in the Power BI admin portal. 

## Next steps

- [Subscribe to a report or dashboard in the Power BI service](../consumer/end-user-subscribe.md)
- [Paginated reports in the Power BI service: Subscribe yourself and others](../consumer/paginated-reports-subscriptions.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
