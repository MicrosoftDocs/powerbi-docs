---
title: Information protection admin settings
description: Learn how to configure Power BI information protection admin settings.
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

# Information protection tenant settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

## Apply sensitivity labels from data sources to their data in Power BI (preview)

When this setting is enabled, Power BI datasets that connect to sensitivity-labeled data in supported data sources can inherit those labels, so that the data remains classified and secure when brought into Power BI.  For detail about sensitivity label inheritance from data sources, see [Sensitivity label inheritance from data sources (preview)](../enterprise/service-security-sensitivity-label-inheritance-from-data-sources.md).

To enable sensitivity label inheritance from data sources go to the [Power BI tenant settings](service-admin-portal-about-tenant-settings.md), and enable the toggle under **Information protection > Apply sensitivity labels from data sources to their data in Power BI (preview)**:

:::image type="content" source="media/service-admin-portal-information-protection/inherit-from-data-sources-tenant-setting.png" alt-text="Screenshot of Apply sensitivity labels from data sources to their data in Power BI tenant setting.":::

## Restrict content with protected labels from being shared via link with everyone in your organization
When this setting is enabled, users can't generate a sharing link for **People in your organization** for content with protection settings in the sensitivity label.

![Restrict content with protected labels from being shared via link with everyone in your organization.](media/service-admin-portal-information-protection/admin-restrict-content-protected-labels-enabled.png)

> [!NOTE]
> This setting is disabled if you haven't enabled both the **Allow users to apply sensitivity labels for Power BI content** setting and the **Allow shareable links to grant access to everyone in your organization** setting.

Sensitivity labels with protection settings include encryption or content markings. For example, your organization may have a "Highly Confidential" label that includes encryption and applies a "Highly Confidential" watermark to content with this label. Therefore, when this tenant setting is enabled and a report has a sensitivity label with protection settings, then users can't create sharing links for **People in your organization**: 

![Example of disabled sharing link to People in your organization.](media/service-admin-portal-information-protection/admin-organization-doesnt-allow-option.png)

To learn more about protection settings for sensitivity labels, check out the Microsoft 365 article [Restrict access to content by using sensitivity labels to apply encryption](/microsoft-365/compliance/encryption-sensitivity-labels).

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)