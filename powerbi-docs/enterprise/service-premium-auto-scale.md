---
title: Using Autoscale with Power BI Premium
description: Autoscale for Power BI Premium Gen2 allows you to automatically scale processing power to meet your Power BI user requirements
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 02/06/2022
ms.custom: licensing support
LocalizationGroup: Premium
---

# Using Autoscale with Power BI Premium

Power BI Premium offers scale and performance for Power BI content in your organization. With Power BI Premium Gen2, many improvements are introduced including enhanced performance, greater scale, improved metrics. In addition, Premium Gen2 enables customers to automatically add compute capacity to avoid slowdowns under heavy use, using **Autoscale**.

:::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-10.png" alt-text="Screenshot of using auto-scale in Power BI Premium.":::

Autoscale uses an Azure subscription to automatically use more v-cores (virtual CPU cores) when the computing load on your Power BI Premium subscription would otherwise be slowed by its capacity. This article describes the steps necessary to get Autoscale working for your Power BI Premium subscription. Autoscale only works with Power BI Premium Gen2.

To enable Autoscale, the following steps need to be completed:

1. [Configure an Azure subscription to use with Autoscale](#configure-an-azure-subscription-to-use-with-autoscale).

2. [Enable Autoscale in the Power BI Admin portal](#enable-autoscale-in-the-power-bi-admin-portal)

The following sections describe the steps in detail.

>[!NOTE]
>
>* Autoscale isn’t available for Microsoft 365 Government Community Cloud (GCC), due to the use of the commercial Azure cloud.
>* [Embedded Gen 2](../developer/embedded/embedded-analytics-power-bi.md) does not provide an out-of-the-box vertical autoscale feature. To learn about alternative autoscale options for Embedded Gen2, see [Autoscaling in Embedded Gen2](../developer/embedded/azure-pbie-scale-capacity.md#autoscale-your-capacity)

## Configure an Azure subscription to use with Autoscale

To select and configure an Azure subscription to work with Autoscale, you need to have *contributor* rights for the selected Azure subscription. Any user with *Account admin* rights for the Azure subscription can add a user as a *contributor*. In addition, you must be an admin for the Power BI tenant to enable Autoscale.

To select an Azure subscription to work with Autoscale, take the following steps:

1. Log into the Azure portal and in the search box type and select **Subscriptions**.

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-02.png" alt-text="Screenshot of the Azure portal. The word subscriptions is typed in the search box.":::

2. From the *Subscriptions* page, select the subscription you want to work with autoscale.

    :::image type="content" source="media/service-premium-auto-scale/select-subscription.png" alt-text="Screenshot of the subscriptions page in the Azure portal. A subscription is highlighted.":::

3. From the *Settings* selections for your selected subscription, select **Resource groups**.

    :::image type="content" source="media/service-premium-auto-scale/resource-groups.png" alt-text="Screenshot of the selecting a subscription page in the Azure portal. The resource group option in the settings section is highlighted.":::

4. Select **Create** to create a resource group to use with Autoscale.

    :::image type="content" source="media/service-premium-auto-scale/create-resource-group.png" alt-text="Screenshot of a resource group page in the Azure portal. The create button is highlighted.":::

5. Name your resource group and select **Review + create**. In the following image, the resource group is called *powerBIPremiumAutoscaleCores*. You can name your resource group whatever you prefer. Just remember the name of the subscription, and the name of your resource group, since you'll need to select it again when you configure Autoscale in the Power BI Admin Portal.

    :::image type="content" source="media/service-premium-auto-scale/create-resource-group-page.png" alt-text="Screenshot of the create a resource group page. The resource group text field is highlighted with the resource group's name, powerBIPremiumAutoscaleCores, is highlighted. The review plus create button is also highlighted.":::

6. Azure validates the information. After the validation process completes successfully, select **Create**. Once created, you receive a notification in the upper-right corner of the Azure portal.

    :::image type="content" source="media/service-premium-auto-scale/create-resource-group-validation.png" alt-text="Screenshot of the create a resource group page after it passes the Azure validation test. The create button is highlighted.":::

## Enable Autoscale in the Power BI Admin portal

Once you've selected the Azure subscription to use with Autoscale, and created a resource group as described in the previous section, you're ready to enable Autoscale and associate it with the resource group you created. The person configuring **Autoscale** must be at least a *contributor* for the Azure subscription to successfully complete these steps. You can learn more about [assigning a user to a contributor role for an Azure subscription](/azure/cost-management-billing/manage/add-change-subscription-administrator).

>[!NOTE]
>After creating the subscription and enabling Autoscale in the admin portal, a `Microsoft.PowerBIDedicated/autoScaleVCores` resource is created. Make sure that you don't have any Azure policies that prevent Power BI Premium from provisioning, updating or deleting the `Microsoft.PowerBIDedicated/autoScaleVCores` resource.

The following steps show you how to enable and associated Autoscale with the resource group.

1. Open the **Power BI Admin portal** and select **Capacity settings** from the left pane. Information about your Power BI Premium capacity is displayed.

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-06.png" alt-text="Screenshot of Power B I Admin portal.":::

2. Autoscale only works with Power BI Premium Gen2. Enabling Gen2 is easy: just move the slider to **Enabled** in the **Premium Generation 2** box. 

    :::image type="content" source="media/service-premium-auto-scale/enable-gen2.gif" alt-text="Video of enabling Premium Generation Two.":::

3. Select the **Manage auto-scale** button to enable and configure **Autoscale**, and the **Auto-scale settings** pane appears. Select the **Enable auto scale**.

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-07.png" alt-text="Screenshot of enabling Autoscale.":::

4. You can then select the Azure subscription to use with Autoscale. Only subscriptions available to the current user are displayed, which is why you must be at least a *contributor* for the subscription. Once your subscription is selected, select the **Resource group** you created in the previous section, from the list of resource groups available to the subscription.

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-08.png" alt-text="Screenshot of selecting the resource group to use with Autoscale.":::

5. Next, assign the maximum number of v-cores to use for Autoscale, and then select **Save** to save your settings. Power BI applies your changes, then closes the pane and returns the view to **Capacity settings**, where you can see your settings have been applied. In the following image, there were a maximum of two v-cores configured for Autoscale.

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-10.png" alt-text="Screenshot of Autoscale being configured.":::

Here's a short video that shows how quickly you can configure Autoscale for Power BI Premium Gen2:

:::image type="content" source="media/service-premium-auto-scale/configure-autoscale.gif" alt-text="Video of configuring Autoscale for Premium Generation 2.":::

## Next steps

> [!div class="nextstepaction"]
> [What is Power BI Premium?](service-premium-gen2-what-is.md)

> [!div class="nextstepaction"]
> [Power BI Premium FAQ](service-premium-gen2-faq.yml)

> [!div class="nextstepaction"]
> [Power BI Premium Per User FAQ](service-premium-per-user-faq.yml)

> [!div class="nextstepaction"]
> [Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)
