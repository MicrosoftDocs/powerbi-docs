---
title: Where is data for the Power BI service stored?
description: Find the home data region for Power BI for your organization and learn how that location is selected. The default data region is important because it can affect interactions with the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 12/05/2022
ms.custom: video-0fOxaHJPvdM
LocalizationGroup: Administration
---

# Find the default region for your organization

The region where your data is stored is important because it can affect the interactions you have with the Power BI service. For example, Power BI stores reports, connection information, data models, and the data inside those models in the service.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

<iframe width="560" height="315" src="https://www.youtube.com/embed/0fOxaHJPvdM?showinfo=0" frameborder="0" allowfullscreen></iframe>

The first user in your organization to sign up for Power BI or Microsoft 365 chooses the country or region for the business identity. Azure Active Directory, the shared identity and access management service for the cloud, creates a tenant in the data center region closest to the selected country or region. Azure Active Directory is a multi-tenant service, and each organization is represented as an individual tenant in the data center.

The region you select during sign-up determines where data is stored. This region will be the same location for all users in your organization, no matter where they are. Ideally, the selected region will be in the same geographical area as most of your users. For more information about signing up for Power BI and choosing the data region, see [Get a Power BI service subscription for your organization](../enterprise/service-admin-org-subscription.md).

> [!IMPORTANT]
> After sign-up you can't change the default data region yourself. For information about how to request a support-driven data region migration, see [Move between regions](/power-bi/support/service-admin-region-move).

> [!NOTE]
> Customers that have purchased Power BI Premium capacity can specify a data region for each capacity. The region for the capacity can be different than the default region. Learn more about how to configure this scenario in [Multi-Geo support for Power BI Premium](service-admin-premium-multi-geo.md).

> [!NOTE]
> There are some regions in which Power BI tenants are not initially established by default. If you prefer your Power BI tenant to be located in such a region, you can [move](../support/service-admin-region-move.md) your tenant to that region. 

## How to find the default region for your organization

To find the default data region for your organization, follow these steps:

1. Sign in to [Power BI](https://app.powerbi.com).
1. Select Settings in the upper right corner > **Help & Support** > **About Power BI**.

     :::image type="content" source="media/service-admin-where-is-my-tenant-located/help-about-power-bi.png" alt-text="Screen capture showing help and support menu with about Power BI highlighted.":::

1. Look for the value next to **Your data is stored in**. The location shown is the default region where your data is stored. You may also be using capacities in different regions for your workspaces.

     :::image type="content" source="media\service-admin-where-is-my-tenant-located\power-bi-data-region.png" alt-text="Screen capture showing about Power BI with data storage location highlighted.":::

## Learn more

- [International availability of Microsoft Power Platform](/power-platform/availability)
- [Configure and manage capacities in Power BI Premium](../enterprise/service-admin-premium-manage.md)
- [Move Power BI between regions](/power-bi/support/service-admin-region-move)
- [Administrators learning catalog](../learning-catalog/learning-catalog-administrator.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
