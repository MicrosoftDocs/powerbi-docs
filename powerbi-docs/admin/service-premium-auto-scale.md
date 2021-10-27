---
title: Using Autoscale with Power BI Premium
description: Autoscale for Power BI Premium Gen2 allows you to automatically scale processing power to meet your Power BI user requirements
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 10/18/2021
ms.custom: licensing support
LocalizationGroup: Premium
---

# Using Autoscale with Power BI Premium

Power BI Premium offers scale and performance for Power BI content in your organization. With Power BI Premium Gen2, many improvements are introduced including enhanced performance, greater scale, improved metrics. In addition, Premium Gen2 enables customers to automatically add compute capacity to avoid slowdowns under heavy use, using **Autoscale**.

:::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-10.png" alt-text="Screenshot of using auto-scale in Power BI Premium.":::

Autoscale uses an Azure subscription to automatically use more v-cores (virtual CPU cores) when the computing load on your Power BI Premium subscription would otherwise be slowed by its capacity. This article describes the steps necessary to get Autoscale working for your Power BI Premium subscription. Autoscale only works with Power BI Premium Gen2. 

To enable Autoscale, the following steps need to be completed:

* Select and configure an Azure subscription to use with Autoscale
* Configure Power BI Premium to use the selected Azure subscription for Autoscale

The following sections describe the steps in detail.

>[!NOTE]
>* Autoscale isn’t available for Microsoft 365 Government Community Cloud (GCC), due to the use of the commercial Azure cloud.
>* [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md) does not provide an out-of-the-box vertical autoscale feature. To learn about alternative autoscale options for Embedded Gen2, see [Autoscaling in Embedded Gen2](../developer/embedded/power-bi-embedded-generation-2.md#autoscaling-in-embedded-gen2)

## Configure an Azure subscription to use with Autoscale

To select and configure an Azure subscription to work with Autoscale, you need to have *contributor* rights for the selected Azure subscription. Any user with *Account admin* rights for the Azure subscription can add a user as a *contributor*. In addition, you must be an admin for the Power BI tenant to enable Autoscale.

To select an Azure subscription to work with Autoscale, take the following steps:

1. Log into the Azure portal and select **Subscriptions** from the left pane. In the following image, the highlighted subscription is called *Pay-As-You-Go*. 

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-02.png" alt-text="Screenshot of select a subscription from Azure portal.":::

2. Select a subscription. Once selected, you need to create a *Resource group* to use with Autoscale. Select *Resource group* from the **Settings** selections for your selected subscription. Then select the **Add** button to create a new *Resource group*. 

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-03.png" alt-text="Screenshot of creating a resource group.":::

3. The **Create a resource group** window appears, where you can name the resource group. In the following image, the resource group is called *powerBIPremiumAutoscaleCores*. You can name your resource group whatever you prefer. Just remember the name of the subscription, and the name of your resource group, since you'll need to select it again when you configure Autoscale in the Power BI Admin Portal. 

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-04.png" alt-text="Screenshot of naming your resource group.":::

4. When you're satisfied with the name of the resource group, select the **Review + create** button in the bottom left corner of the portal pane. Azure validates the information, after which you select the **Create** button to create the resource group. Once created, you receive a notification in the upper-right corner of the Azure portal, similar to the following:

    :::image type="content" source="media/service-premium-auto-scale/premium-auto-scale-05.png" alt-text="Screenshot of resource group creation succeeded.":::
 
Okay, you've selected the **Subscription** in the Azure portal that you'll use for Autoscale, and created a **Resource group** for that subscription. The next step is to enable Autoscale in the Power BI Admin portal, and link it to the resource group you just created.

### Considerations for preview release

When Autoscale is launched in preview, a window to enable customers to become accustomed to the usage levels and CPU core utilization is being provided. During the initial window, charges to the configured Azure subscription used for Autoscale will not be applied. That window is anticipated to be 30 days. The best way to become accustomed to the level of usage your organization is to sign up for utilization alert notifications in the Power BI Admin portal, and to monitor alerts for utilization levels.

Paginated Reports are not included in the process of determining the level of utilization, and whether to Autoscale, during initial window.

## Enable Autoscale in the Power BI Admin portal

Once you've selected the Azure subscription to use with Autoscale, and created a resource group as described in the previous section, you're ready to enable Autoscale and associate it with the resource group you created. The person configuring **Autoscale** must be at least a *contributor* for the Azure subscription to successfully complete these steps. You can learn more about [assigning a user to a contributor role for an Azure subscription](/azure/cost-management-billing/manage/add-change-subscription-administrator). 

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

And that's it - your Power BI Premium Gen2 subscription is now configured to use Autoscale, so users in your organization automatically get the responsiveness they need from their Power BI content and insights, even under periods of heavy use. 


## Next steps

* [What is Power BI Premium?](service-premium-what-is.md)
* [Power BI Premium FAQ](service-premium-faq.yml)
* [Power BI Premium Per User FAQ](service-premium-per-user-faq.yml)
* [Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)
