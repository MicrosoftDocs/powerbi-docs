---
title: The Power BI add-in for PowerPoint in national/regional clouds
description: See a summary of how and why the add-in when it's deployed in a national/regional cloud differs slightly from when it's deployed in a public cloud.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.custom: references_regions
LocalizationGroup: Share your work
ms.date: 02/25/2024
---

# The Power BI add-in for PowerPoint in national/regional clouds

Users of the Power BI add-in for PowerPoint in national/regional clouds enjoy the same interactive, data-visualization storytelling capabilities as users in public clouds. However, in national/regional clouds there's no connection to the Microsoft Office add-in store, and as a result there are a few differences in how the add-in is deployed, and in how you can embed live Power BI data in a PowerPoint presentation. This article summarizes these differences and describes them briefly. The differences are also called out in the rest of the storytelling documentation where relevant.

## Add-in deployment

In national/regional clouds, the add-in is supported as an admin managed add-in only. If you're an admin of a tenant located in a national/regional cloud, you must download the add-in from Power BI in your national/regional cloud and deploy it using Centralized Deployment. The add-in that is available from the public cloud won't work. Users in national/regional clouds must use the add-in you've deployed. For more information, see [Deploying the add-in in national/regional clouds](./service-power-bi-powerpoint-add-in-admin.md#deploying-the-add-in-in-nationalregional-clouds).

## Power BI entry points

National/regional clouds don't support entry points to the add-in from Power BI. This means that:

* In the Power BI service, the tenant setting **[Enable Power BI add-in for PowerPoint](/fabric/admin/service-admin-portal-export-sharing#enable-power-bi-add-in-for-powerpoint)** is irrelevant. If you're a tenant admin, you can ignore it.

* In the Power BI service, the **Open in PowerPoint** option isn't available. To embed a report or visual in the add-in users must copy the link to the item in the Power BI service, then paste it into the add-in in PowerPoint manually.

## Power BI add-in button

In national/regional clouds, the add-in button doesn't appear on PowerPoint's **Insert** ribbon. Instead, to insert the add-in, users must find it under **Insert** > **My Add-ins** > **ADMIN MANAGED**.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-national-clouds/microsoft-power-bi-add-in-powerpoint-admin-managed.png" alt-text="Screenshot showing Microsoft Power BI add-in for PowerPoint as Admin Managed add-in.":::

## Related content

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md)
* [Add live Power BI data to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
