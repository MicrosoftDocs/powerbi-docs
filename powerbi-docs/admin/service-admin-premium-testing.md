---
title: Purchase Power BI Premium for testing
description: Learn how you can purchase Power BI Premium for testing and other purposes
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 01/28/2021
LocalizationGroup: Premium
---

# Purchase Power BI Premium for testing

This article describes how to purchase Power BI Premium A SKUs for testing scenarios, and for cases where you don't have the permissions necessary to purchase P SKUs (Microsoft 365 Global Administrator role or Billing Administrator role). A SKUs require no time commitment, and are billed hourly. You purchase A SKUs in the [Azure portal](https://portal.azure.com).

For more information about Power BI Premium, see [What is Power BI Premium?](service-premium-what-is.md). For current pricing and planning information, see the [Power BI pricing page](https://powerbi.microsoft.com/pricing/). Content creators still need a [Power BI Pro license](service-admin-purchasing-power-bi-pro.md), even if your organization uses Power BI Premium. Ensure you purchase at least one Power BI Pro license for your organization. With A SKUs, _all users_ who consume content also require Pro licenses.

> [!NOTE]
> If a Premium subscription expires, you have 30 days of full access to your capacity. After that, your content reverts to a shared capacity. Models that are greater than 1 GB are not supported in shared capacity.

## Purchase A SKUs for testing and other scenarios

A SKUs are made available through the Azure Power BI Embedded service. You can use A SKUs in the following ways:

- Enable embedding of Power BI in third party applications. For more information, see [Power BI Embedded](../developer/embedded/embedded-analytics-power-bi.md#embedding-with-power-bi).

- Test Premium functionality before you buy a P SKU.

- Create development and test environments alongside a production environment that uses P SKUs.

- Purchase Power BI Premium even though you're not a Microsoft 365 Global Administrator role or Billing Administrator role.

> [!NOTE]
> If you purchase an A4 or higher SKU, you can take advantage of all Premium features except for unlimited sharing of content. With A SKUs, _all users_ who consume content require Pro licenses.

Follow these steps to purchase A SKUs in the Azure portal:

1. Sign in to the [Azure portal](https://portal.azure.com) with an account that has at least capacity admin permissions in Power BI.

1. Search for _Power BI Embedded_ and select the service in the search results.

    ![Azure portal search](media/service-admin-premium-purchase/azure-portal-search.png)

1. Select **Create Power BI Embedded**.

    ![Create Power BI Embedded](media/service-admin-premium-purchase/create-power-bi-embedded.png)

1. On the **Power BI Embedded** create screen, specify the following information:

    - The **Subscription** in which to create the Power BI Embedded service.

    - The physical **Location** in which to create the resource group that contains the service. For better performance, this location should be close to the location of your Azure Active Directory tenant for Power BI.

    - The existing **Resource group** to use, or create a new one as shown in the example.

    - The **Power BI capacity administrator**. The capacity admin must be a member user or a service principal in your Azure AD tenant.

    ![Subscription and resource group](media/service-admin-premium-purchase/subscription-resource-group.png)

1. If you want to use all features of Power BI Premium (except unlimited sharing), you need at at least an A4 SKU. Select **Change size**.

    ![Change capacity size](media/service-admin-premium-purchase/change-capacity-size.png)

1. Select a capacity size of A4, A5, or A6, which correspond to P1, P2, and P3. Prices in the following image are examples only.

    ![Select A3 capacity](media/service-admin-premium-purchase/select-a3-capacity.png)

1. Select **Review + Create**, review the options you chose, then select **Create**.

    ![Create resource](media/service-admin-premium-purchase/create-resource.png)

1. It can take a few minutes to complete the deployment. When it's ready, select **Go to resource**.

    ![Deployment complete](media/service-admin-premium-purchase/deployment-complete.png)

1. On the management screen, review the options you have for managing the service, including pausing the service when you're not using it.

    ![Manage capacity](media/service-admin-premium-purchase/manage-capacity.png)

After you purchase capacity, learn how to [manage capacities](service-admin-premium-manage.md#manage-capacity) and [assign workspaces](service-admin-premium-manage.md#assign-a-workspace-to-a-capacity) to a capacity.

## Next steps

[What is Power BI Premium?](service-premium-what-is.md)
[How to purchase Power BI Premium](service-admin-premium-purchase.md)
[Configure and manage capacities in Power BI Premium](service-admin-premium-manage.md)\
[Power BI pricing page](https://powerbi.microsoft.com/pricing/)\
[Power BI Premium FAQ](service-premium-faq.yml)\
[Planning a Power BI Enterprise Deployment whitepaper](https://aka.ms/pbienterprisedeploy)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
