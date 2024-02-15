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

# Power BI visual privileges

Power BI visuals sometimes require access to data or other resources in your organization. Your admin can decide whether set tenant switches that control what permissions to grant visuals. This article describes what permissions a visual might need in order to work properly.

Visuals can require permission for any or the following privileges:

* [Allow visuals created using the Power BI SDK](#allow-visuals-created-using-the-power-bi-sdk)
* [Add and use certified visuals only (block uncertified)](#add-and-use-certified-visuals-only-block-uncertified)
* [Allow downloads from custom visuals](#allow-downloads-from-custom-visuals)
* [Allow custom visuals to get user Microsoft Entra ID access tokens](#allow-custom-visuals-to-get-user-microsoft-entra-id-access-tokens)
* [Allow custom visuals to use local storage](#allow-custom-visuals-to-use-local-storage)

## Allow visuals created using the Power BI SDK

Visuals created using the Power BI SDK require special permission. If permission is granted, users in the organization can add, view, share, and interact with visuals imported from AppSource or from a file. Your admin can choose to block these visuals.

To learn more, see [Visuals from AppSource or a file](/fabric/admin/organizational-visuals#visuals-from-appsource-or-a-file).

## Add and use certified visuals only (block uncertified)

Users in the organization with permissions to add and use visuals can add and use certified visuals only.

To learn more, see [Certified Power BI visuals](/fabric/admin/organizational-visuals#certified-power-bi-visuals).

## Allow downloads from custom visuals

A [custom visuals](./power-bi-custom-visuals.md) needs permission in order to to download information available to it, such as summarized data or visual configuration, upon user consent. The admin can choose to block this permission in which case the custom visual will not be able to download any information.

To learn more, see [Export data to file](/fabric/admin/organizational-visuals#export-data-to-file).

## Allow custom visuals to get user Microsoft Entra ID access tokens

A visual might need to obtain a Microsoft Entra ID (formerly known as Azure AD) access tokens for signed-in users, facilitating single sign-on authentication. The admin can choose to block this permission in which case the visual will not be able to obtain the access token.

To learn more, see [Obtain Microsoft Entra access token](/fbric/admin/organizational-visuals#obtain-microsoft-entra-access-token).

## Allow custom visuals to use local storage

The visual might need to store data locally on the user's device. The admin can choose to block this permission in which case the visual will not be able to store data locally.

## Related content

* [About tenant settings](fabric/admin/tenant-settings-index)
* [Manage Power BI visuals admin settings](/fabric/admin/organizational-visuals).
