---
title: Developer admin settings
description: Learn how to configure Power BI developer admin settings.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: tenant-setting
ms.topic: how-to
ms.date: 08/31/2022
LocalizationGroup: Administration
---

# Developer tenant settings

These settings are configured in the tenant settings section of the Admin portal. For information about how to get to and use tenant settings, see [About tenant settings](service-admin-portal-about-tenant-settings.md).

You can:

* [Embed content in apps](#embed-content-in-apps)
* [Allow service principals to use Power BI APIs](#allow-service-principals-to-use-power-bi-apis)
* [Allow service principals to create and use profiles](#allow-service-principals-to-create-and-use-profiles)
* [Block ResourceKey Authentication](#block-resourcekey-authentication)

:::image type="content" source="./media/service-admin-portal-developer/developer-settings.png" alt-text="Screenshot of Developer settings options.":::

To manage Power BI developer settings, you must be a Global Admin in Office 365, or have been assigned the Power BI service administrator role. For more information about the Power BI service administrator role, see [Understanding the Power BI admin role](service-admin-role.md).

>[!NOTE]
>The developer settings in the Admin portal are different from and not related to the [developer mode](../developer/visuals/environment-setup.md#set-up-power-bi-service-for-developing-a-visual) setting for debugging visuals.

## Embed content in apps

Users in the organization can embed Power BI dashboards and reports in Software as a Service (SaaS) applications. Disabling this setting prevents users from being able to use the REST APIs to embed Power BI content within their application. [Learn more](../developer/embedded/embedded-analytics-power-bi.md).

## Allow service principals to use Power BI APIs

Web apps registered in Azure Active Directory (Azure AD) will use an assigned [service principal](../developer/embedded/pbi-glossary.md#service-principal) to access Power BI APIs without a signed in user. To allow an app to use service principal authentication its service principal must be included in an allowed security group.

You can control who can access service principals by creating dedicated security groups and using these groups in any Power BI tenant level-settings. [Learn more](../developer/embedded/embed-service-principal.md).

## Allow service principals to create and use profiles

An app owner with many customers can use service principal profiles as part of a multi-tenancy solution to enable better customer data isolation and establish tighter security boundaries between customers. [Learn more](../developer/embedded/embed-multi-tenancy.md).

## Block ResourceKey Authentication

For extra security, you can block the use of resource key based authentication. The Block ResourceKey Authentication setting applies to streaming and PUSH datasets. If disabled, users will not be allowed send data to streaming and PUSH datasets using the API with a resource key.  

This setting applies to the entire organization. You can't apply it only to a select security group.

## Next steps

[About tenant settings](service-admin-portal-about-tenant-settings.md)
