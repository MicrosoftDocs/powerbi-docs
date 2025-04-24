---
title: Using Autoscale with Power BI Premium
description: Learn how to configure an Azure subscription to use with Autoscale and then enable Autoscale in the Power BI Admin portal.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 05/15/2024
ms.custom: licensing support
LocalizationGroup: Premium
---

# Using Autoscale with Power BI Premium

Power BI Premium offers scale and performance for Power BI content in your organization. Power BI Premium offers improvements such as enhanced performance, greater scale, improved metrics. In addition, Premium enables customers to automatically add compute capacity to avoid slowdowns under heavy use, using **Autoscale**.

Autoscale uses an Azure subscription to automatically use more v-cores (virtual CPU cores) when the computing load on your Power BI Premium subscription would otherwise be slowed by its capacity. This article describes the steps necessary to get Autoscale working for your Power BI Premium subscription and the conditions under which Autoscale is enabled. Autoscale only works with Power BI Premium.

To enable Autoscale, the following steps need to be completed:

1. [Configure an Azure subscription to use with Autoscale](#configure-an-azure-subscription-to-use-with-autoscale).

1. [Enable Autoscale in the Power BI Admin portal](#enable-autoscale-in-the-power-bi-admin-portal)

The following sections describe the steps in detail.

>[!NOTE]
>
>* Autoscale isn’t available for Microsoft 365 Government Community Cloud (GCC), due to the use of the commercial Azure cloud. For more information about which features are available and which are not, see [Power BI feature availability for U.S. Government customers](service-govus-overview.md#power-bi-feature-availability).
>* [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md) doesn't provide an out-of-the-box vertical Autoscale feature. To learn about alternative Autoscale options for Power BI Embedded, see [Autoscaling in Power BI Embedded](../developer/embedded/azure-pbie-scale-capacity.md#autoscale-your-capacity).

## Configure an Azure subscription to use with Autoscale

To select and configure an Azure subscription to work with Autoscale, you need to have *contributor* rights for the selected Azure subscription. Any user with *Account admin* rights for the Azure subscription can add a user as a *contributor*. In addition, you must be an admin for the Power BI tenant to enable Autoscale.

To select an Azure subscription to work with Autoscale, take the following steps:

1. Sign on to the Azure portal and in the search box type and select **Subscriptions**.

1. From the **Subscriptions** page, select the subscription you want to work with Autoscale.

1. From the *Settings* selections for your selected subscription, select **Resource groups**.

1. Select **Create** to create a resource group to use with Autoscale.

    :::image type="content" source="media/service-premium-auto-scale/azure-auto-scale-create-resource-group.png" alt-text="Screenshot of the Azure portal showing the resource group pane. Create is highlighted." lightbox="media/service-premium-auto-scale/azure-auto-scale-create-resource-group.png":::

1. Name your resource group and select **Review + create**. The following image shows an example resource group named *powerBIPremiumAutoscaleCores*. You can name your resource group whatever you want. Make a note of the name of the subscription, and the name of your resource group. You'll need to select it from a list when you configure Autoscale in the Power BI Admin portal.

    :::image type="content" source="media/service-premium-auto-scale/azure-auto-scale-name-resource-group.png" alt-text="Screenshot of the create a resource group page. The resource group text field and the review plus create button are highlighted." lightbox="media/service-premium-auto-scale/azure-auto-scale-name-resource-group.png":::

1. Azure validates the information. After the validation process completes successfully, select **Create**. You receive a notification in the upper-right corner of the Azure portal when the action completes.

    :::image type="content" source="media/service-premium-auto-scale/azure-auto-scale-validation-resource-group.png" alt-text="Screenshot of the create a resource group page after it passes the Azure validation test. The create button is highlighted." lightbox="media/service-premium-auto-scale/azure-auto-scale-validation-resource-group.png":::

## Enable Autoscale in the Power BI Admin portal

After you've selected the Azure subscription to use with Autoscale, and created a resource group as described in the previous section, you're ready to enable Autoscale and associate it with the resource group you created. The person configuring **Autoscale** must be at least a *contributor* for the Azure subscription to successfully complete these steps. You can learn more about [assigning a user to a contributor role for an Azure subscription](/azure/cost-management-billing/manage/add-change-subscription-administrator).

>[!NOTE]
>After creating the subscription and enabling Autoscale in the admin portal, a `Microsoft.PowerBIDedicated/autoScaleVCores` resource is created. Make sure that you don't have any Azure policies that prevent Power BI Premium from provisioning, updating or deleting the `Microsoft.PowerBIDedicated/autoScaleVCores` resource.

The following steps show you how to enable and associate Autoscale with the resource group.

1. Open the **Power BI Admin portal** and select **Capacity settings** from the left pane. Information about your Power BI Premium capacity appears.

1. Select **Manage Autoscale**  to enable and configure **Autoscale**. The **Autoscale settings** pane appears. Select  **Enable Autoscale**.

    :::image type="content" source="media/service-premium-auto-scale/service-premium-auto-scale-settings-p2.png" alt-text="Screenshot of selecting the Autoscale settings page. The enable Autoscale check box is highlighted.":::

1. Select the Azure subscription to use with Autoscale. Only subscriptions available to the current user are displayed, which is why you must be at least a *contributor* for the subscription. Once your subscription is selected, choose the **Resource group** you created in the previous section, from the list of resource groups available to the subscription. Assign the maximum number of v-cores to use for Autoscale, and then select **Save**.

    :::image type="content" source="media/service-premium-auto-scale/service-premium-auto-scale-settings-p2-02.png" alt-text="Screenshot of the Autoscale settings page showing subscription, resource group and Autoscale max settings..":::

1. Power BI applies your changes, then closes the pane and returns the view to **Capacity settings** with the settings you applied.

## When is Autoscale triggered?

You only pay for autoscale when it's triggered. Autoscale is triggered when [interactive throttling](/fabric/enterprise/throttling) is implemented on your capacity. When interactive operations on your capacity are delayed, autoscale v-cores are added to cover the overage. As long as the overage is not covered, v-cores are added to the capacity every 30 seconds, until the number of v-cores you allocated for autoscale is reached. Once an autoscale core is added, it remains active for a minimum of 24 hours. After 24 hours, your capacity's throttling state is evaluated and if the capacity isn't throttled, autoscale usage returns to zero.

## Disable Autoscale

To disable Autoscale, follow these steps:

1. Open the **Power BI Admin portal** and select **Capacity settings**.

2. Select the capacity you want to disable Autoscale for.

3. Select **Manage Autoscale**

4. Clear the **Enable Autoscale** checkbox.

## Related content

* [What is Power BI Premium?](service-premium-what-is.md)

* [Power BI Premium FAQ](service-premium-faq.yml)

* [Power BI Premium Per User FAQ](service-premium-per-user-faq.yml)

* [Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)
