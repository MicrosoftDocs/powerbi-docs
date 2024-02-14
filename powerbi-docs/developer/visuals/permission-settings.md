---
title: Power BI visuals permission settings
description: Learn what each of the permission settings for Power BI visuals does.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom:
ms.topic: conceptual
ms.date: 02/14/2024
---

# Power BI visuals tenant settings

Power BI visuals sometimes require access to data or other resources in your organization. Your admin can decide whether set tenant switches that control what permissions to grant visuals. This article describes what permissions a visual might need in order to work properly.

Visuals can require permission for any or the following privileges:

* [Allow visuals created using the Power BI SDK](#allow-visuals-created-using-the-power-bi-sdk)
* [Add and use certified visuals only (block uncertified)](#add-and-use-certified-visuals-only-block-uncertified)
* [Allow downloads from custom visuals](#allow-downloads-from-custom-visuals)
* [Allow custom visuals to get user Microsoft Entra ID access tokens](#allow-custom-visuals-to-get-user-microsoft-entra-id-access-tokens)

## Allow visuals created using the Power BI SDK

Visuals created using the Power BI SDK require special permission. If permission is granted, users in the organization can add, view, share, and interact with visuals imported from AppSource or from a file. Your admin can choose to block these visuals.

To learn more, see [Visuals from AppSource or a file](organizational-visuals.md#visuals-from-appsource-or-a-file).

## Add and use certified visuals only (block uncertified)

Users in the organization with permissions to add and use visuals can add and use certified visuals only.

To learn more, see [Certified Power BI visuals](organizational-visuals.md#certified-power-bi-visuals).

## Allow downloads from custom visuals

Enabling this setting lets [custom visuals](/power-bi/developer/visuals/power-bi-custom-visuals) download any information available to the visual (such as summarized data and visual configuration) upon user consent. It's not affected by download restrictions applied in your organization's Export and sharing settings.

To learn more, see [Export data to file](organizational-visuals.md#export-data-to-file).

## Allow custom visuals to get user Microsoft Entra ID access tokens

Enabling this setting lets [custom visuals](/power-bi/developer/visuals/power-bi-custom-visuals) obtain Microsoft Entra ID (formerly known as Azure AD) access tokens for signed-in users, facilitating single sign-on authentication.

To learn more, see [Obtain Microsoft Entra access token](organizational-visuals.md#obtain-microsoft-entra-access-token).

## Related content

* [About tenant settings](tenant-settings-index.md)
* [Manage Power BI visuals admin settings](organizational-visuals.md).
