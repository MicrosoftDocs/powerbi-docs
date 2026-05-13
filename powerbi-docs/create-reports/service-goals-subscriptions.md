---
title: Create email subscriptions for your scorecards in Power BI (preview)
description: Set up subscriptions to receive email notifications and stay up to date on the scorecards that matter most to you and your team.
author: kgremban
ms.author: kgremban
ms.reviewer: 'anphil'
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/02/2026
#customer intent: As a Power BI user I want to learn about and how to create email subscriptions for my scorecards and in the Power BI service.
---

# Create email subscriptions for your scorecards in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Set up subscriptions to receive email notifications and stay up to date on the scorecards that matter most to you and your team.

## Create a subscription

1. To set up a subscription, open the scorecard you want to subscribe to, and select **Subscribe to scorecard**.

    :::image type="content" source="media/service-goals-subscriptions/scorecard-subscribe.png" alt-text="Screenshot showing Subscribe to scorecard.":::

1. Select **Create a subscription**.

1. Enter the details about the subscription, such as the name for the subscription, subject, and email message details.

    :::image type="content" source="media/service-goals-subscriptions/subscribe-emails-scorecard-pane.png" alt-text="Screenshot showing Add new subscription.":::

1. You can include a link to the scorecard in the email, and give recipients permission to view the scorecard.

1. Select **Save**.

After you save it, you can edit the subscription, turn it on or off, or delete the subscription.

Recipients receive an email from Power BI with a table containing the scorecard data such as goal name, status, values, and due date. The table shows up to 50 goals.

## Manage subscriptions

You can see all the subscriptions for a scorecard.

1. In  a scorecard, select **Subscribe to scorecard** in the ribbon to open the Subscriptions pane, and select **Manage all**.

   :::image type="content" source="media/service-goals-subscriptions/manage-all.png" alt-text="Screenshot showing manage all subscriptions.":::

   Or, in the Power BI service, select **Settings** > **Notifications**.

   :::image type="content" source="media/service-goals-subscriptions/power-bi-service-settings.png" alt-text="Screenshot showing Settings.":::

1. In **Settings**, select **Power BI subscriptions**.

   :::image type="content" source="media/service-goals-subscriptions/manage-scorecard-subscriptions.png" alt-text="Screenshot showing Subscriptions.":::

## Considerations and limitations

- You can add up to 24 subscriptions per scorecard, each with unique recipients, times, and frequencies.
- You can subscribe to scorecards if you have a Pro license or PPU license, or if the scorecard is in a workspace backed by Premium capacity.
- You can subscribe other team members if, in addition to the previous requirements, you have a Contributor, Member, or Admin role in that workspace.
- If the scorecard is hosted in a Premium capacity:

  - You can subscribe group aliases, whether they're in your domain or not.
  - You can subscribe external users.

- If the scorecard isn't hosted in a Premium capacity, others must also have a Pro license. 
- You can add other email addresses in the same domain to the subscription. 
- You can't subscribe to a scorecard from within a Power BI org app.
  
## Related content

- [Get started with goals in Power BI](service-goals-introduction.md)
- [Create scorecards and manual goals in Power BI](service-goals-create.md)
- [Stay on top of your goals in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
