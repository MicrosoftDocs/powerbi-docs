---
title: The authentication API in Power BI custom visuals
description: This article describes the API used to obtain access tokens for single sign-on (SSO) users.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 11/30/2023
---

# Authentication API

The Authentication API enables visuals to obtain Microsoft Entra ID (formally known as Azure AD) access tokens for signed-in users, facilitating single sign-on authentication.

Power BI admins can enable or disable the API through a [global switch](/fabric/admin/organizational-visuals). The default setting blocks (disables) the API.

The API is applicable only for AppSource visuals, and not for private visuals. Visuals that are under development can be tested in debug mode before they're published.

## Supported environments

The following environments are supported:

* Web
* Desktop
* RS Desktop
* Mobile

## Unsupported environments

The following environments aren't yet supported:

* Sovereign clouds
* RS Service
* Embedded analytics
* Teams (partially supported if consents are granted in advance)

## How to use the Authentication API

In the *capabilities.json* file, add the "AADAuthentication" privilege with your Microsoft Entra ID registered application URI. Fabric will generate a token with this audience, and deliver it to the visual.  
For example, the following token can be used by the backend service of your visual implemented by the app with audience `https://contoso.com`:

```json
"privileges": [
    {
        "name": "AADAuthentication",
        "parameters": [
            "https://contoso.com"
        ]
    }
]
```

In the *pbiviz.json* file, set the API version to 5.7.0 or higher:

The newly exposed **AcquireAADTokenService** contains two methods:

* **acquireAADToken**: Returns the token for the visual or null if it can't be fetched.
* **acquireAADTokenstatus**: Returns one of the following privilege statuses associated with acquiring the token.

  * *Allowed*: The privilege is allowed in the current environment.
  * *NotDeclared*: The privilege declaration is missing in visual capabilities section.
  * *NotSupported*: The privilege isn't supported in the current environment.
  * *DisabledByAdmin*: The Fabric administrator denied privilege usage.

The following sample code demonstrates how to acquire a Microsoft Entra ID token using the API:

```typescript
// Step 1: Check the status of AAD token acquisition
const acquireTokenStatus = await this.acquireAADTokenService.acquireAADTokenstatus();
 
// Step 2: Verify if acquiring the token is allowed
if (acquireTokenStatus === PrivilegeStatus.Allowed) {
 
    // Step 3: Acquire the AAD token
    const { accessToken }: AcquireAADTokenResult = await this.acquireAADTokenService.acquireAADToken();
 
    // Step 4: Confirm successful acquisition of the access token
    if (accessToken) {
 
        // Step 5: Call your backend API with the obtained token
    }
}
 
// Step 6: Handle unsuccessful AAD token acquisition
```

## Considerations and limitations

Authentication is blocked if any of the following conditions apply:​

* The tenant switch is turned off.

* The user isn't signed in (in Desktop).

* The ISV didn't preauthorize the Power BI application.

* The format of the AADAuthentication privilege parameter is invalid.

* The visual isn't publicly approved and isn't in *debug visual* mode.

* The visual’s backend service (authenticated by the Entra ID app with the audience specified by the visual) doesn't have appropriate consents about the Graph API in the consumer tenant using the visual. For more about consents, see under [tenant admin consent](entra-id-authentication.md#consenting-the-isv-app).

## Related content

[Microsoft Entra ID application setup](./entra-id-authentication.md)
