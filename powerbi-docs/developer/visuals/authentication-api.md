---
title: The authentication API in Power BI custom visuals
description: This article describes the API used to obtain access tokens for single sign on (SSO) users.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/19/2022
---

# Authentication API

The SSO Authentication API enables visuals to obtain Microsoft Entra ID (formally known as AAD) access tokens for signed-in users, facilitating single sign-on authentication.

Power BI admins can enable or disable the API through a global switch. The default setting is Off.

:::image type="content" source="{source}" alt-text="{alt-text}":::

The API is applicable only for AppSource visuals, providing enhanced security and control. Visuals that are under development can be tested in debug mode before they are published. 

It's important to note that uncertified visuals are eligible to use the API, as certified visuals are restricted from making external calls.

## Considerations and limitations

Authentication is blocked if any of the following conditions apply:​

* The tenant switch is turned off.

* The user isn't signed in (in Desktop).

* The admin or user hasn't given consent.

* The ISV has not preauthorized the Power BI application.

* The format of the AADAuthentication Privilege parameter is invalid.

* The visual is not publicly approved and is not in Debug Visual mode.
