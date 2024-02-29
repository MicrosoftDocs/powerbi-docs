---
title: Microsoft Entra ID application setup
description: This article describes how to set up authentication for third party ISVs in Microsoft Entra.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 11/22/2023
---

# Microsoft Entra ID application setup

To use the Authentication API, the ISV must first register an application in Microsoft Entra ID and preauthorize the Power BI applications with a dedicated scope for each visual. The tenant administrator then needs to grant consent. This article outlines all of these essential steps.

## Register the app in Microsoft Entra ID

Navigate to [Azure services](https://portal.azure.com) and select **App registrations**.

[!INCLUDE[registration steps](../../includes/entra-app-registration.md)]

## Consenting the ISV app

The tenant administrator can determine whether or not users are allowed to consent for themselves. This consent process takes place outside of Power BI.

ISV backend application (for example, `https://contoso.com`) should be consented to Graph API and other dependencies (by users or tenant administrators) according to standard AAD rules:

If the ISV application is running on a different tenant than the visual consumer's tenant, grant consent for the ISV's application in one of the following ways:

* Administrator preconsent:

  Follow the instructions in [Grant tenant-wide admin consent to an application](/entra/identity/enterprise-apps/grant-admin-consent).

* Interactive consent:

  If the tenant administrator didn't preconsent, any user that uses a visual that triggers the API receives a one-time consent prompt when rendering the visual. See [Application consent experience](/entra/identity-platform/application-consent-experience) for more information.
