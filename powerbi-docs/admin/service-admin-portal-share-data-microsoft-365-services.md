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

## Allow your Microsoft 365 services to process or store Power BI data which may be outside of your Power BI tenant's geographic area

:::image type="content" source="media/service-admin-portal-share-data-microsoft-365-services/allow-m365-process-store-data-remotely-admin-portal-switch-new.png" alt-text="Screenshot of admin switch allowing Microsoft 365 services to process and store Power BI content remotely.":::

This switch controls whether Power BI content gets listed in the Most Recently Viewed list on the home page of Office.com. Because of the data residency considerations described below, it is disabled by default. When enabled, it allows Power BI content to be listed.

Office.com and Power BI may have different data residency requirements. To ensure that features such as the Most Recently Viewed list work, Office.com and Microsoft 365 services may need to process and/or store Power BI data outside the geographic location of the Power BI tenant the data is located in.

By enabling the switch, you, as a Power BI administrator, are explicitly opting in to this feature, and acknowledging that to enable these cross-service capabilities, certain information about your Power BI content may potentially flow outside the geographic region where it is located.

The Power BI content affected includes reports, dashboards, apps, workbooks, paginated reports, and workspaces. The information required by the Most Recently Viewed functionality includes:

* The display name of the content.
* When the content was last accessed.
* The type of content that was accessed (report, dashboard etc.).

To enable the switch, go to **Admin portal > Tenant settings > Share data with your Microsoft 365 services.** Expand the switch and set the toggle switch to **Enabled**.

References:
* [Where is my Power BI tenant located?](service-admin-where-is-my-tenant-located.md)
* [Microsoft Privacy - Where is Your Data Located](https://www.microsoft.com/trust-center/privacy/data-location)

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)