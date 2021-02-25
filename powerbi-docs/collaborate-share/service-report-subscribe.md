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
ms.date: 02/24/2021

LocalizationGroup: Common tasks
---
# Subscribe others to your reports and dashboards in the Power BI service

The basic process for subscribing your colleagues to report pages, dashboards, and paginated reports is the same as subscribing yourself. The article [Subscribe to a report or dashboard in the Power BI service](../consumer/end-user-subscribe.md) lays out how to do it. This article spells out what's different when you subscribe others. 

Subscribing to paginated reports is also a little different. See [Subscribe yourself and others to a paginated report in the Power BI service](../consumer/paginated-reports-subscriptions.md) for details.

 Power BI e-mail subscriptions allow you to:

- Have a mail sent with an image of the report and link to the report in the service. 
- Send email to users outside your tenant, if your Power BI content is hosted in a Premium capacity.  Administrators control who can send email subscriptions to external users by leveraging the existing external sharing control settings in the Power BI admin portal.

![Screenshot of email snapshot of dashboard.](media/service-report-subscribe/power-bi-subscriptions-email.png)

## Requirements

To create subscriptions for others, you must have:

- Edit permissions for the dashboard or report.
- A Power BI Pro license.

## Power BI audit logs and subscriptions

Power BI administrators can use the Power BI audit logs to view details around subscriptions. These details include:

- Created By
- Creation Date
- Content Subscribed to
- Recipients
- Frequency
- Modified By
- Modified Date

## Considerations for subscribing others

See [Considerations and troubleshooting](../consumer/end-user-subscribe.md#considerations-and-troubleshooting) in "Subscribe to a report or dashboard in the Power BI service" for other considerations.

### General

- When creating a subscription, you can add other email addresses in the same domain to the subscription. If the report or dashboard is hosted in a [Premium or Premium-Per-User capacity](../admin/service-premium-what-is.md), you can subscribe group aliases, whether they're in your domain or not. You don't have to subscribe individual email addresses. The aliases are based on the current active directory.
- There is a limit to the number of subscribers for one report or dashboard. After you pass 200 subscribers, you may encounter issues with delivery. To reduce the number of subscribers, use group email aliases instead. Each email alias counts as one subscriber.
- If the report or dashboard isn't hosted in a Premium capacity, you can subscribe other individuals, but they must have Power BI Pro licenses.
- You can choose whether to include a link back to the content in Power BI and give users access to the content you're subscribing them to.  If you choose to include a link, ensure that all users have access to the content.
- Subscribed users receive report attachments with data based on your permissions.
- In all, you may create up to 24 subscriptions per report or dashboard, and can provide unique recipients, times, and frequencies for each subscription. Subscriptions set to  **After Data Refresh**  for your dashboard or report only send an email after the first scheduled refresh.
- To test a subscription, or run it on demand at any time, select  **Run Now** for the subscription. You see a notification that an e-mail is on its way to everyone for that particular subscription. This action doesn't count against your limit of 24 scheduled subscription runs per day per report or dashboard. It does NOT trigger a data refresh of the underlying dataset.
- Currently, email subscriptions for reports and dashboards using live connection datasets aren't supported when subscribing users other than yourself, except for paginated reports. Read more about [subscribing to paginated reports](../consumer/paginated-reports-subscriptions.md).
- If you aren't receiving subscription emails:

    - Make sure that your User Principal Name (UPN) can receive emails.
    - Though you have a Power BI Pro license, you may not have a Microsoft Exchange license. If not, your Azure Active Directory account may not have an email or alternate email address specified. In this case, though the subscription appears to go out, you never receive a copy.  If your Power BI admin assigns an email address, Power BI will synchronize the update the next time you sign in, and use that e-mail address for the subscription.
    - If you have an alternate email address but no primary, Power BI uses that to deliver the subscription.

- The option to provide access to the report/dashboard always shows as enabled when you edit an existing subscription.  If you clear this option and save the subscription, it saves that state. However, if you edit the report again, the option will be checked again by default.
- If you subscribe external users to a report or dashboard, they will receive a share notification immediately after you select **Save and close** in the subscription pane. This notification is sent only to external users, not internal users, because they require an invitation link to view the report or dashboard. 
- On rare occasions, e-mail subscriptions may take longer than fifteen minutes to be delivered to their recipients. If this happens, we recommend running your data refresh and e-mail subscription at different times to ensure timely delivery. If the issue persists, contact Power BI support.

### Dashboards

- If you share a dashboard with a colleague outside of your tenant, you can't also create a subscription for that colleague *unless* the dashboard sits in a Premium workspace or app. So if you are `aaron@contoso.com`, you can *share* with `anyone@fabrikam.com`, but you can't yet *subscribe* `anyone@fabrikam.com`, and they can't subscribe to shared content.

### Reports

- For paginated and Power BI report email subscriptions, if the dataset uses row-level security (RLS), you can create subscriptions for yourself. You may also subscribe others to a report with RLS. Those subscriptions will run using your security context.
- Your organization may configure certain settings in Azure Active Directory that limit the ability to use email subscriptions in Power BI. These limitations include, but aren't limited to, having multi-factor authentication or IP range restrictions when accessing resources.
- Say you have a report with a live connection to Analysis Services, and you have the subscription set to run after data refresh. It will run the first time the Power BI service detects a change in your on-premises model when it polls the Analysis Services instance.  Power BI checks every hour for a change in the Analysis Services data model, to determine when to send the subscription.

## Next steps

- [Subscribe to a report or dashboard in the Power BI service](../consumer/end-user-subscribe.md)
- [Paginated reports in the Power BI service: Subscribe yourself and others](../consumer/paginated-reports-subscriptions.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
