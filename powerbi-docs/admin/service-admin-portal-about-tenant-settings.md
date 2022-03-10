---
title: Power BI admin portal
description: Learn how to enable and disable Power BI tenant settings.
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

# About tenant settings

**Tenant settings** enable fine-grained control over the features that are made available to your organization. If you have concerns around sensitive data, some of our features may not be right for your organization, or you may only want a particular feature to be available to a specific group.

> [!NOTE]
> Tenant settings that control the availability of features in the Power BI user interface can help to establish governance policies, but they're not a security measure. For example, the **Export data** setting doesn't restrict the permissions of a Power BI user on a dataset. Power BI users with read access to a dataset have the permission to query this dataset and might be able to persist the results without using the **Export data** feature in the Power BI user interface.

The following sections elaborate on the settings on the **Tenant settings** tab.

> [!NOTE]
> It can take up to 15 minutes for a setting change to take effect for everyone in your organization.

Many of the settings can have one of three states:

* **Disabled for the entire organization**: No one in your organization can use this feature.

    ![Disabled all setting](media/service-admin-portal-about-tenant-settings/powerbi-admin-tenant-settings-disabled.png)

* **Enabled for the entire organization**: Everyone in your organization can use this feature.

    ![Enabled all setting](media/service-admin-portal-about-tenant-settings/powerbi-admin-tenant-settings-enabled.png)

* **Enabled for a subset of the organization**: Specific security groups in your organization are allowed to use this feature.

    You can also enable a feature for your entire organization, **Except specific security groups**.

    ![Enabled subset setting](media/service-admin-portal-about-tenant-settings/powerbi-admin-tenant-settings-enabled-except.png)

    You can also combine settings to enable the feature only for a specific group of users and also disable it for a group of users. Using this approach ensures that certain users don't have access to the feature even if they're in the allowed group. The most restrictive setting for a user applies.

    ![Enable except setting](media/service-admin-portal-about-tenant-settings/powerbi-admin-tenant-settings-enabled-except2.png)

The next few sections provide an overview of the different types of tenant settings.

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)