---
title: The authentication API in Power BI custom visuals
description: This article describes the Authentication API needed to obtain Microsoft Entra ID access tokens for single sign-on (SSO) users.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins, david
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 05/21/2024
#customer intent: To understand how to use the Authentication API in Power BI custom visuals.
---

# Authentication API

The Authentication API enables visuals to obtain Microsoft Entra ID (formerly known as Azure AD) access tokens for signed-in users, facilitating single sign-on authentication.

Power BI administrators can enable or disable the API through a [global switch](/fabric/admin/organizational-visuals). The default setting blocks (disables) the API.

The API is applicable only for AppSource visuals, and not for private visuals. Visuals that are under development can be tested in debug mode before they're published.

## Supported environments

The following environments are supported:

* Web
* Desktop
* RS Desktop
* Mobile

## Unsupported environments

The following environments aren't yet supported:

* RS Service
* Embedded analytics
* Teams

## How to use the Authentication API

In the *capabilities.json* file, add the "AADAuthentication" privilege with a Microsoft Entra ID registered application URI for each supported cloud. Fabric generates a token according to the audience configured for the current cloud, and delivers it to the visual.  
The visual can then utilize the token to authenticate against the respective audience, representing its backend service:

```json
"privileges": [
    {
        "name": "AADAuthentication",
        "parameters": {
            "COM": "https://contoso.com",
            "CN": "https://contoso.cn"
        }
    }
]
```

In the *pbiviz.json* file, set the API version to **5.9.1** or higher:

The newly exposed **AcquireAADTokenService** contains two methods:

* **acquireAADToken**: Returns an authentication token payload of type `AcquireAADTokenResult` for the visual or null if it can't be fetched.

    ```typescript
     /**
     * Enum representing the various clouds supported by the Authentication API.
     */
    export const enum CloudName {
        COM = "COM",         // Commercial Cloud
        CN = "CN",           // China Cloud
        GCC = "GCC",         // US Government Community Cloud
        GCCHIGH = "GCCHIGH", // US Government Community Cloud High
        DOD = "DOD",         // US Department of Defense Cloud
    }
 
    /**
     * Interface representing information about the user associated with the token.
     */
    export interface AcquireAADTokenUserInfo {
        userId?: string;   // Unique identifier for the user
        tenantId?: string; // Unique identifier for the tenant
    }
 
    /**
     * Interface representing information about the fabric environment.
     */
    export interface AcquireAADTokenFabricInfo {
        cloudName?: CloudName; // Name of the cloud environment
    }
 
    /**
     * Interface representing the result of acquiring a Microsoft Entra ID token.
     */
    export interface AcquireAADTokenResult {
        accessToken?: string;       // Access token issued by Microsoft Entra ID
        expiresOn?: number;         // Expiration time of the access token
        userInfo?: AcquireAADTokenUserInfo;     // Information about the user associated with the token
        fabricInfo?: AcquireAADTokenFabricInfo; // Information about the fabric environment
    }
    ```

* **acquireAADTokenstatus**: Returns one of the following privilege statuses associated with acquiring the token.

  * **Allowed**: The privilege is allowed in the current environment.
  * **NotDeclared**: The privilege declaration is missing in visual capabilities section.
  * **NotSupported**: The privilege isn't supported in the current environment.
  * **DisabledByAdmin**: The Fabric administrator denied privilege usage.

The following sample code demonstrates how to acquire a Microsoft Entra ID token using the API:

 ```typescript
    // Step 1: Check the status of AAD token acquisition 
    const acquireTokenStatus = await this.acquireAADTokenService.acquireAADTokenstatus(); 
 
    // Step 2: Verify if acquiring the token is allowed 
    if (acquireTokenStatus === PrivilegeStatus.Allowed) { 
 
    // Step 3: Acquire the Microsoft Entra ID token
    const acquireAADTokenResult: AcquireAADTokenResult = await this.acquireAADTokenService.acquireAADToken(); 
 
    // Step 4: Confirm successful acquisition of the access token
    if (acquireAADTokenResult.accessToken) { 
 
            // Step 5: Call your backend API with the obtained token 
        } 
    } 
 
    // Step 6: Handle unsuccessful AAD token acquisition 
```

## Considerations and limitations

Token acquisition is blocked if any of the following conditions apply:​

* The tenant switch is turned off.

* The user isn't signed in (in Desktop).

* The ISV didn't preauthorize the Power BI application.

* The format of the AADAuthentication privilege parameter is invalid.

* The visual isn't publicly approved or isn't a debug visual.

* The visual’s backend service, configured as the audience by the visual, doesn't have appropriate consents for the Graph API in the consumer tenant using the visual. For more about consent, see [tenant administrator consent](entra-id-authentication.md#isv-consent).

## Related content

[Microsoft Entra ID application setup](./entra-id-authentication.md)
