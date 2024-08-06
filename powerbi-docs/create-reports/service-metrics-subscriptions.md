---
title: Create email subscriptions for your metrics in Power BI (preview)
description: Set up subscriptions to receive email notifications and stay up to date on the scorecards that matter most to you and your team.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'anphil'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/13/2023
---

# Create email subscriptions for your metrics in Power BI (preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Set up subscriptions to receive email notifications and stay up to date on the scorecards that matter most to you and your team.

## Create a subscription

1. To set up a subscription, open the scorecard you want to subscribe to, and select **Subscribe to scorecard** in the ribbon.

    :::image type="content" source="media/service-metrics-subscriptions/scorecard-subscribe.png" alt-text="Screenshot showing Subscribe to scorecard.":::

1. Select **Add new subscription** in the pane that opens on the right.

    :::image type="content" source="media/service-metrics-subscriptions/subscribe-emails-scorecard-pane.png" alt-text="Screenshot showing Add new subscription.":::

1. Enter the details about the subscription, such as the name for the subscription, subject, and email message details.

1. Set the frequency for how often you want to receive the emails: hourly, daily, weekly, or monthly.

1. Set a scheduled time for the subscription:

    - On the hour, or at 15, 30, or 45 minutes past.
    - AM or PM.
    - The time zone.

1. Select a **Start date** and optionally, an **End date** for the subscription. 
1. You can include a link to the scorecard in the email, and give recipients permission to view the scorecard.
1. Select **Save and close**.

After you save it, you can edit the subscription, turn it on or off, or delete the subscription.

Recipients receive an email from Power BI with a table containing the scorecard data such as metric name, status, values and due date. The table will show up to 50 metrics. 

## Manage subscriptions

You can see all the subscriptions for a scorecard.

1. In  a scorecard, select **Subscribe to scorecard** in the ribbon to open the Subscriptions pane, and select **Manage all subscriptions**.

    Or in the Power BI service, select **Settings** > **Settings**.

    :::image type="content" source="media/service-metrics-subscriptions/power-bi-service-settings.png" alt-text="Screenshot showing Settings.":::

1. In **Settings**, select **Subscriptions**.

    :::image type="content" source="media/service-metrics-subscriptions/manage-scorecard-subscriptions.png" alt-text="Screenshot showing Subscriptions":::

## Considerations and limitations

- You can add up to 24 subscriptions per scorecard, each with unique recipients, times, and frequencies.
- You can subscribe to scorecards if you have a Pro license or PPU license, or if the scorecard is in a workspace backed by Premium capacity.
- You can subscribe other team members if, in addition to the above, you have a Contributor, Member, or Admin role in that workspace. 
- If the scorecard is hosted in a Premium capacity:

  - You can subscribe group aliases, whether they're in your domain or not.
  - You can subscribe external users.

- If the scorecard isn't hosted in a Premium capacity, others must also have a Pro license. 
- You can add other email addresses in the same domain to the subscription. 
- You cannot subscribe to a scorecard from within a Power BI org app.
  
## Related content

- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
