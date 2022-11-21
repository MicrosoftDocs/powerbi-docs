---
title: Configure Power BI Premium capacity notifications
description: Learn how you can configure email notifications for your Power BI Premium capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 03/10/2022
LocalizationGroup: Premium 
---

# Configure Power BI Premium Gen2 capacity notifications

Power BI Premium Gen2 allows you to configure email notifications for your capacity. The emails will be sent to the people you specify in the notifications settings.

To calculate when to send emails, Power BI checks the capacity every 15 minutes. During the check, the last 15 to 30 minutes of capacity activity are examined.

>[!NOTE]
>To configure email notifications, you must be a capacity admin.

## Configure capacity notifications

To configure the capacity notification emails, follow these steps:

1. In the Power BI service, go to **Settings** > **Settings** > **Admin portal**.

    :::image type="content" source="media/service-admin-premium-capacity-notifications/admin-portal.png" alt-text="A screenshot showing the Power B I settings menu, with the settings option expanded and the admin portal selection highlighted.":::

2. In the *Admin portal*, select the capacity you want to configure notifications for.

3. Expand the **Notifications** section.

    :::image type="content" source="media/service-admin-premium-capacity-notifications/admin-portal-notifications.png" alt-text="A screenshot showing the notifications section in the Power B I service admin portal.":::

4. In the section **Send notifications when**, configure your required notifications as follows:

    * **You're using ___% of your available capacity** - A notification is sent once the capacity reaches the threshold you enter.

    * **You've exceeded your available capacity and might experience slowdowns** - A notification is sent once you reach your capacity limit. Once the limit is reached, if you have [autoscale](../enterprise/service-premium-auto-scale.md) enabled, autoscale will start. If you don't have autoscale enabled, throttling will be applied to your capacity.

    * **An Autoscale v-core has been added** - A notification will be sent once autoscale starts and every time a v-core is added.

    * **You've reached your Autoscale maximum** - A notification will be sent when all the autoscale v-cores are fully utilized. Throttling will be applied to your capacity if it continues to be overloaded.

5. In the section **Send notifications to**, select who you want the notifications to be emailed to:

    * **Capacity admins** - Email notifications are sent to all the admins of this capacity.

    * **These contacts** - Enter the emails of the contacts you want to receive notifications.

6. Select **Apply**.

## Considerations and limitations

* Timestamps are not included in notification emails.

* Notification emails don't list by how much a threshold was crossed.

* After a notification is sent, there's a three hour cooling period for that type of notification. During this time, you'll not get any notifications from this type, even if your capacity will cross thresholds that are set to trigger these notifications. For example, if you configure your capacity to send a notification once you cross the 75% usage threshold, once that threshold is met you'll receive a notification. If the capacity goes below this threshold to 60%, and then right back over it in the next hour, you'll not get another notification for crossing the 75% mark. If you have the autoscale notification turned on, and your capacity crosses the 100% threshold during these three hours, you'll get a notification that autoscale started.

* A 30 seconds window is applied to calculate your capacity usage. Due to a less granular calculation, capacity usage may appear differently in the [Power BI Premium utilization and metrics](../enterprise/service-premium-gen2-metrics-app.md) app. As a result, you may not see the event your notification points to, in the app. For example, a very short spike in capacity activity that triggers a notification, may not be seen at all in the Power BI Premium utilization and metrics app.

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](../enterprise/service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [Administering Power BI in the admin portal](service-admin-portal.md)
