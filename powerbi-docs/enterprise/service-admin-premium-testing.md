---
title: Purchase Power BI Premium for testing
description: Learn how you can purchase Power BI Premium A SKUs for testing and when you don't have permission to purchase P SKUs.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 12/28/2022
LocalizationGroup: Premium
---

# Purchase Power BI Premium for testing

This article describes how to purchase Power BI Premium A SKUs for testing scenarios, and for cases where you don't have the permissions necessary to purchase P SKUs (Microsoft 365 Global Administrator role or Billing Administrator role). A SKUs require no time commitment, and are billed hourly. You purchase A SKUs in the [Azure portal](https://portal.azure.com).

For more information about Power BI Premium, see [What is Power BI Premium](service-premium-what-is.md). For current pricing and planning information, see the [Power BI pricing page](https://powerbi.microsoft.com/pricing/). Content creators still need a [Power BI Pro license](service-admin-purchasing-power-bi-pro.md), even if your organization uses Power BI Premium. Make sure to purchase at least one Power BI Pro license for your organization. With A SKUs, _all users_ who consume content also require Pro licenses.

> [!NOTE]
> If a Premium subscription expires, you have 30 days of full access to your capacity. After that, your content reverts to a shared capacity. Models that are greater than 1 GB aren't supported in shared capacity.

## Purchase A SKUs for testing and other scenarios

A SKUs are available through the Azure Power BI Embedded service. You can use A SKUs in the following ways:

- Enable embedding of Power BI in third party applications. For more information, see [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md).

- Test Premium functionality before you buy a P SKU.

- Create development and test environments with a production environment that uses P SKUs.

- Purchase Power BI Premium even though you don't have a Microsoft 365 Global Administrator role or Billing Administrator role.

> [!NOTE]
> If you purchase an A4 or higher SKU, you can take advantage of all Premium features except for unlimited sharing of content. With A SKUs, _all users_ who consume content require Pro licenses.

Follow these steps to purchase A SKUs in the Azure portal:

1. Sign in to the [Azure portal](https://portal.azure.com) with an account that has at least capacity admin permissions in Power BI.

1. Search for _Power BI Embedded_ and select the service in the search results.

    :::image type="content" source="media/service-admin-premium-purchase/azure-portal-search-update.png" alt-text="Screenshot of the Azure portal search with Power BI Embedded highlighted.":::

1. Select **Create Power BI Embedded**.

    :::image type="content" source="media/service-admin-premium-purchase/create-power-bi-embedded-update.png" alt-text="Screenshot with the create Power BI Embedded button highlighted.":::

1. On the **Power BI Embedded** create screen, specify the following:

    - The **Subscription** in which to create the Power BI Embedded service.

    - The physical **Location** in which to create the resource group that contains the service. For better performance, this location should be close to the location of your Microsoft Entra tenant for Power BI.

    - An existing **Resource group** to use, or create a new one as shown in the example.

    - The **Power BI capacity administrator**. The capacity admin must be a member user or a service principal in your Microsoft Entra tenant.

    :::image type="content" source="media/service-admin-premium-purchase/subscription-resource-group-update.png" alt-text="Screenshot of the Power BI Embedded Basics window with subscription, create new resource group, and the capacity administrator fields highlighted.":::

1. If you want to use all features of Power BI Premium (except unlimited sharing), you need at least an A4 SKU. Select **Change size**.

    :::image type="content" source="media/service-admin-premium-purchase/change-capacity-size-update.png" alt-text="Screenshot of the Power BI Embedded Basics window with size details highlighted.":::

1. Select a capacity size of A4, A5, or A6, which correspond to P1, P2, and P3. Prices in the following image are examples only.

    :::image type="content" source="media/service-admin-premium-purchase/select-a3-capacity-update.png" alt-text="Screenshot of the resource size selection window showing the A4 SKU detail row and select highlighted.":::

1. Select **Review + Create**, review the options you chose, then select **Create**.

    :::image type="content" source="media/service-admin-premium-purchase/create-resource-update.png" alt-text="Screenshot of the Basics details review page with create highlighted.":::

1. It can take a few minutes to complete the deployment. When it's ready, select **Go to resource**.

    :::image type="content" source="media/service-admin-premium-purchase/deployment-complete-update.png" alt-text="Screenshot of the deployment complete dialog showing deployment details and go to resource highlighted.":::

1. On the management screen, review the options you have for managing the service, including pausing the service when you're not using it.

    :::image type="content" source="media/service-admin-premium-purchase/manage-capacity.png" alt-text="Screenshot of the capacity resource details page.":::

After you purchase a capacity, see [Manage a capacity](service-admin-premium-manage.md#manage-capacity) and [Assign a workspace to a capacity](service-admin-premium-manage.md#assign-a-workspace-to-a-capacity).

## Related content

- [What is Power BI Premium?](service-premium-what-is.md)
- [How to purchase Power BI Premium](service-admin-premium-purchase.md)
- [Configure and manage capacities in Power BI Premium](service-admin-premium-manage.md)
- [Power BI pricing](https://powerbi.microsoft.com/pricing/)
- [Power BI Premium FAQ](service-premium-faq.yml)
- Download the [Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
