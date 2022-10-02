---
title: Share data with your Microsoft 365 services admin settings
description: Learn how to configure Power BI share data with your Microsoft 365 services admin settings.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 03/10/2022
LocalizationGroup: Administration
---

# Share data with your Microsoft 365 services admin settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

## Allow Microsoft 365 services to access Power BI metadata

This setting controls whether Power BI metadata is shared with your Microsoft 365 services. For more information about this feature, see [Share data with your Microsoft 365 services](./admin-share-power-bi-metadata-microsoft-365-services.md). In particular, review the [list of what metadata is shared](./admin-share-power-bi-metadata-microsoft-365-services.md).

If Power BI and your Microsoft 365 services are in different geographic regions, information may flow outside the region it is stored in. By enabling this setting, you are explicitly opting in to this feature, and acknowledging that enabling these cross-service capabilities may result in Power BI metadata flowing outside the geographic region it is stored in. See [XXX](./admin-share-power-bi-metadata-microsoft-365-services.md) for more detail.

To turn on the feature, go to **Admin portal > Tenant settings > Share data with your Microsoft 365 services.** Expand the switch and set the toggle switch to **Enabled**. Because of data residency considerations (see XXX) for details), it is disabled by default.

:::image type="content" source="media/service-admin-portal-share-data-microsoft-365-services/allow-m365-process-store-data-remotely-admin-portal-switch-new.png" alt-text="Screenshot of admin switch allowing Microsoft 365 services to process and store Power BI content remotely.":::

## Next steps

* [Share data with your Microsoft 365 services](./admin-share-power-bi-metadata-microsoft-365-services.md)
* [About tenant settings](service-admin-portal-about-tenant-settings.md)