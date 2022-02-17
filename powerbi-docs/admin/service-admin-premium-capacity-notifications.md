---
title: Configure Power BI Premium capacity notifications
description: Learn how you can configure email notifications for your Power BI Premium capacities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 02/17/2022
LocalizationGroup: Premium 
---

# Configure Power BI Premium capacity notifications

Power BI Premium allows you to configure email notifications for your capacity. The emails will be sent to the people you specify in the notifications settings.

To calculate when to send emails, Power BI checks the capacity every 15 minutes. During the check, the last 15 to 30 minutes of capacity activity are examined.

>[!NOTE]
>To configure email notifications, you must be a capacity admin.

## Configure capacity notifications

Follow these settings to configure 

1. In the Power BI service, go to **Settings** > **Settings** > **Admin portal**.

    :::image type="content" source="media/service-admin-premium-capacity-notifications/admin-portal.png" alt-text="A screenshot showing the Power B I settings menu, with the settings option expanded and the admin portal selection highlighted.":::

2. In the *Admin portal*, select the capacity you want to configure notifications for.

    :::image type="content" source="media/service-admin-premium-capacity-notifications/admin-portal-notifications.png" alt-text="A screenshot showing the notifications section in the Power B I service admin portal.":::

3. Expand the **Notifications** section.

4. In the **Send notifications when** section, configure your required notifications as follows:

    * **You're using ___% of your available capacity** - A notification is sent once the capacity reaches the threshold you enter.

    * **You've exceeded your available capacity and might experience slowdowns** - A notification is sent once you reach your capacity limit. Once the limit is reached, if you have [autoscale](service-premium-auto-scale.md) enabled, autoscale will start. If you don't have autoscale enabled, throttling will be applied to your capacity.

    * **An Autoscale v-core has been added** - A notification will be sent once autoscale starts (if enabled).

    * **You've reached your Autoscale maximum** - A notification will be sent when all the autoscale v-cores are fully utilized. When this happens, throttling will be applied to your capacity.

5. In the **Send notifications to** section, select who you want to the notifications to be emailed to:

    * **Capacity admins** - Email notifications are sent to all the capacity admins.

    * **These contacts** - Enter the emails of the contacts you want to receive notifications.

6. Select **Apply**.

## Considerations and limitations

* Notifications don't include a timestamp.

* Notifications don't list by how much a threshold was crossed.

* After a notification is sent, there's a three hour cooling period. During this time, you'll not get any notifications even if your capacity crosses thresholds that are set to configure notifications.

* Capacity usage is calculated using a 30 seconds windows. In the metrics app the graphs might smooth the peak off. 

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium Gen2?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [Administering Power BI in the admin portal](service-admin-portal.md)
