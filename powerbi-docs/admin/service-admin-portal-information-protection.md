---
title: Information protection tenant settings
description: Learn how to configure Power BI information protection tenant settings as the Power BI tenant admin.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 02/20/2023
LocalizationGroup: Administration
---

# Information protection tenant settings

Information protection tenant settings help you to protect sensitive information in your Power BI tenant. Allowing and applying sensitivity labels to content ensures that information is only seen and accessed by the appropriate users. These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

## Allow users to apply sensitivity labels for content

This setting must be enabled so that you can add sensitivity labels from Microsoft Purview Information Protection in Power BI.

To enable this setting:

1. Go to the Power BI Admin portal and select **Tenant settings**.
1. In the tenant settings, scroll down to the **Information protection** section.
1. Find the setting called **Allow users to apply sensitivity labels for content**. By default, this setting is off, which means sensitivity labels can't be used in Power BI. To allow users to apply sensitivity labels, turn the setting on.


## Apply sensitivity labels from data sources to their data in Power BI (preview)

When this setting is enabled, Power BI datasets that connect to sensitivity-labeled data in supported data sources can inherit those labels, so that the data remains classified and secure when brought into Power BI.  For detail about sensitivity label inheritance from data sources, see [Sensitivity label inheritance from data sources (preview)](../enterprise/service-security-sensitivity-label-inheritance-from-data-sources.md).

To enable sensitivity label inheritance from data sources go to the [Power BI tenant settings](service-admin-portal-about-tenant-settings.md), and enable the toggle under **Information protection > Apply sensitivity labels from data sources to their data in Power BI (preview)**:

## Automatically apply sensitivity labels to downstream content

To enable this setting:

1. If you've followed the steps in the previous sections you should already be in the Power BI tenant settings. Scroll down to the **Information protection** section.
1. Find the setting called **Automatically apply sensitivity labels to downstream content**. By default, this setting is off, which means sensitivity labels won't be automatically applied to downstream content in Power BI. To allow automatic application of sensitivity labels to downstream content, turn the setting on.

## Allow workspace admins to override automatically applied sensitivity labels

To enable this setting:

1. If you've followed the steps in the previous sections you should already be in the Power BI tenant settings. Scroll down to the **Information protection** section.
1. Find the setting called **Allow workspace admins to override automatically applied sensitivity labels**. By default, this setting is off, which means workspace admins won't be able to override sensitivity labels set by users. To allow workspace admins to override sensitivity labels assigned to content in Power BI, turn the setting on.

## Restrict content with protected labels from being shared via link with everyone in your organization
When this setting is enabled, users can't generate a sharing link for **People in your organization** for content with protection settings in the sensitivity label.

> [!NOTE]
> This setting is disabled if you haven't enabled both the **Allow users to apply sensitivity labels for Power BI content** setting and the **Allow shareable links to grant access to everyone in your organization** setting.

Sensitivity labels with protection settings include encryption or content markings. For example, your organization may have a "Highly Confidential" label that includes encryption and applies a "Highly Confidential" watermark to content with this label. Therefore, when this tenant setting is enabled and a report has a sensitivity label with protection settings, then users can't create sharing links for **People in your organization**: 

![Example of disabled sharing link to People in your organization.](media/service-admin-portal-information-protection/admin-organization-doesnt-allow-option.png)

To learn more about protection settings for sensitivity labels, check out the Microsoft 365 article [Restrict access to content by using sensitivity labels to apply encryption](/microsoft-365/compliance/encryption-sensitivity-labels).

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)