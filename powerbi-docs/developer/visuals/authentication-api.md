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

Power BI admins can enable or disable the API through a [global switch](/fabric/admin/organizational-settings). The default setting is Off.

The API is applicable only for AppSource visuals, providing enhanced security and control. Visuals that are under development can be tested in debug mode before they are published.

It's important to note that uncertified visuals are eligible to use the API, as certified visuals are restricted from making external calls.

## Supported environments

The following environments are supported:

* Web
* Desktop
* RS Desktop
* Mobile

## Unsupported environments

The following environments are not yet supported:

* Sovereign clouds
* RS Service
* Embed
* Teams (Microsoft Entra ID dialogs aren't supported in Teams)

## How to use the Authentication API

In the *capabilities.json* file, add the "AADAuthentication" privilege with your Microsoft Entra ID registered application URI:

```json
"privileges": [
    {
        "name": "AADAuthentication",
        "parameters": [
            "https://contoso.com/visuals/visual_guid"
        ]
    }
]
```

In the *pbiviz.json* file, set the API version to 5.7.0 or higher:

```json
{
  "visual": {
    "name": "AuthAppTestVisual",
    "displayName": "AuthAppTestVisual",
    "guid": "AuthAppTestVisual",
    "visualClassName": "Visual",
    "version": "1.0.0",
    "description": "AuthAppTestVisual",
    "supportUrl": "AuthAppTestVisual",
    "gitHubUrl": "AuthAppTestVisual"
  },
  "apiVersion": "5.7.0",
  "author": { "name": "", "email": "" },
}
```

The newly exposed **AcquireAADTokenService** contains two methods:

* *acquireAADToken*: Returns the token for the visual or null if it can't be fetched.
* *acquireAADTokenStatus*: Returns one of the following privilege statuses associated with acquiring the token.

  * *Allowed*: The privilege is allowed in the current environment.
  * *NotDeclared*: The privilege declaration is missing in visual capabilities section.
  * *NotSupported*: The privilege is not supported in the current environment.
  * *DisabledByAdmin*: The privilege usage is denied by tenant administrator.

The following sample code demonstrates how to acquire a Microsoft Entra ID token using the API:

```typescript
```

## Considerations and limitations

Authentication is blocked if any of the following conditions apply:​

* The tenant switch is turned off.

* The user isn't signed in (in Desktop).

* The admin or user hasn't given consent.

* The ISV has not preauthorized the Power BI application.

* The format of the AADAuthentication Privilege parameter is invalid.

* The visual is not publicly approved and is not in Debug Visual mode.
