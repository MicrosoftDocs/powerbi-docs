---
title: Where is data for the Power BI service stored?
description: Learn how to find the home data region for Power BI for your organization and how that location is selected. Knowing your default region is important because it can affect interactions with the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 07/29/2021
ms.custom: video-0fOxaHJPvdM
LocalizationGroup: Administration
---

# Find the default region for your organization

Knowing the location of the region where your data is stored is important because it can affect the interactions you have with the Power BI service. Power BI stores some information in the service itself, such as reports, data models, the data inside those models, and connection information.

<iframe width="560" height="315" src="https://www.youtube.com/embed/0fOxaHJPvdM?showinfo=0" frameborder="0" allowfullscreen></iframe>

When the first user in your organization signs up for Power BI or Microsoft 365, they choose a country or region for the business identity. Azure Active Directory (AAD), the shared identity and access management service for the cloud, creates a tenant in the datacenter region closest to the selected country or region. AAD is a multi-tenant service, and each enrolled organization is represented as an individual tenant in the datacenter. 

The region selected during sign-up determines where data is stored and will be same location for all users in your organization, no matter where they are. Ideally, the selected region will be in the same geographical area where most users are located.For more information about signing up for Power BI and choosing the data region, see [Get a Power BI service subscription for your organization](service-admin-org-subscription.md).

> [!IMPORTANT]
> After sign-up you can't change the default data region yourself. For information about how to request a support-driven data region migration, see [Move between regions](service-admin-region-move.md).

> [!NOTE]
> Customers that have purchased Power BI Premium capacity can specify a data region for each capacity. The region for the capacity can be different than the default region. Learn more about how to configure this scenario in [Multi-Geo support for Power BI Premium](service-admin-premium-multi-geo.md).

## How to find the default region for your organization

To find the default data region for your organization, follow these steps:

1. Sign in to [Power BI](https://app.powerbi.com).
1. Select Help & Support (**?**) > **About Power BI**.

  :::image type="content" source="/media/service-admin-where-is-my-tenant-located/help-about-power-bi.png" alt-text="Screen capture showing help and support menu with about Power B I highlighted..":::

1. Look for the value next to **Your data is stored in**. The location shown is the default region for your organization and is the region where your data is stored, unless you're using capacities in different regions for your workspaces.

    :::image type="content" source="/media/service-admin-where-is-my-tenant-located/power-bi-data-region.png) alt-text="Screen capture showing help and support menu with about Power B I highlighted..":::

## Next steps

More questions? [Try the Power BI Community](https://community.powerbi.com/)
