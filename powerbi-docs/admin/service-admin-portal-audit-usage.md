---
title: Audit and usage admin settings
description: Learn how to configure Power BI audit and usage admin settings.
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

# Audit and usage admin settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

## Create audit logs for internal activity auditing and compliance

Users in the organization can use auditing to monitor actions taken in Power BI by other users in the organization. [Learn more](service-admin-auditing.md)

This setting must be enabled for audit log entries to be recorded. There can be up to a 48-hour delay between enabling auditing and being able to view audit data. If you don't see data immediately, check the audit logs later. There can be a similar delay between getting permission to view audit logs and being able to access the logs.

> [!NOTE]
> This setting applies to the entire organization and cannot be limited to specific groups.

## Usage metrics for content creators

When enabled, users in the organization can see usage metrics for dashboards, reports, and datasets that they have appropriate permissions for. Learn more about [usage metrics](../collaborate-share/service-modern-usage-metrics.md).

1. In the Admin portal, select **Tenant settings** > **Audit and usage settings** > **Usage metrics for content creators**.
1. Enable (or disable) usage metrics > **Apply**.

    :::image type="content" source="media/service-admin-portal-audit-usage/admin-portal-usage-metrics.png" alt-text="Screenshot that shows the Admin portal tenant settings usage metrics.":::

## Per-user data in usage metrics for content creators

Usage metrics for content creators will expose display names and email addresses of users who are accessing content. Learn more about [usage metrics](../collaborate-share/service-modern-usage-metrics.md).

Per-user data is enabled for usage metrics by default, and content creator account information is included in the metrics report. If you do not wish to gather this information for all users, you can disable the feature for specified security groups or for an entire organization. Account information for the excluded users will then show in the report as *Unnamed*.

## Next steps

* [About tenant settings](service-admin-portal-about-tenant-settings.md)