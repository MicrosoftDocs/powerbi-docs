---
title: The authentication API in Power BI custom visuals
description: This article describes the API used to obtain access tokens for single sign-on (SSO) users.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/12/2023
---

# Authentication API

The Authentication API enables visuals to obtain Microsoft Entra ID (formerly known as Azure AD) access tokens for signed-in users, facilitating single sign-on authentication.

Power BI administrators can enable or disable the API through a [global switch](/fabric/admin/organizational-visuals). The default setting blocks (disables) the API.

The API is applicable only for AppSource visuals (and not for private visuals), providing enhanced security and control. Visuals that are under development can be tested in debug mode before they're published.

Only uncertified visuals are eligible to use the API, as certified visuals are restricted from making external calls.

## Authentication API limitations

### Availability

This feature is blocked in the following scenarios:

* The tenant switch is turned off.
* The user isn't signed in (in desktop).
* The admin or user didn't give consent.
* The ISV didn't preauthorize the Power BI application.
* The format of the AADAuthentication Privilege parameter is invalid.
* The visual isn't publicly approved and isn't in Debug Visual mode.

### Supported environments

The following environments are supported:

* Web
* Desktop
* RS Desktop
* Mobile

### Unsupported environments

The following environments aren't yet supported:

* Sovereign clouds
* RS Service
* Embedded analytics
* Teams (partially supported if consents are granted in advance)

## Prerequisites

### Set up Microsoft Entra ID application

The Authentication API is supported in the following clouds:

   1. COM - Commercial Cloud (Required)
   1. CN - China Cloud
   1. GCC - US Government Community Cloud
   1. GCCHIGH - US Government Community Cloud High
   1. DOD - US Department of Defense Cloud

For each cloud intended to be supported by the visual, navigate to the relevant Azure Portal and select **App registrations**:

   1. [COM](https://portal.azure.com)
   1. [CN](https://portal.azure.cn)
   1. [GCC, GCCHIGH, and DOD](https://portal.azure.us)

[!INCLUDE[registration steps](../../includes/entra-app-registration.md)]

### Tenant admin consent

This consent process takes place outside of Power BI. The tenant admin has the authority to determine whether or not users are allowed to consent for themselves. It is important to note that only the tenant admin can grant consent on behalf of the entire organization. Furthermore, the decision to revoke or delete the consent lies solely with the Microsoft Entra ID admin.

If the ISV application is running on a different tenant than the visual consumer's tenant, the consent should be granted for the ISV's application either in [advance](#preconsent), or [interactively](#interactive-consent):

#### Preconsent

1. Navigate to:

   * COM: https://login.microsoftonline.com/{tenantId}/adminconsent?client_id={clientId}
   * CN: https://login.chinacloudapi.cn/{tenantId}/adminconsent?client_id={clientId}
   * GCC, GCCHIGH and DOD: https://login.microsoftonline.us/{tenantId}/adminconsent?client_id={clientId}

      * tenantId - the id of the visual consumer's tenant
      * clientId - the appId of ISV’s application

      :::image type="content" source="{source}" alt-text="{alt-text}":::

1. Sign in with tenant admin credentials.
1. Accept the permissions request.

If you get the following error, it means that there's no reply address, but the consent has been granted successfully.

:::image type="content" source="./media/authentication-api/error-message.png" alt-text="Screenshot of error message saying that they are having trouble signing you in.":::

#### Interactive consent

* If the tenant admin didn't preconsent, any user utilizing a visual that triggers the API will receive a one-time consent prompt when rendering the visual.

   :::image type="content" source="./media/authentication-api/single-user-permission.png" alt-text="Screenshot requesting API permissions for a single user.":::

* If the tenant admin signs in as the Power BI user, they will receive a consent prompt with an option to provide consent on behalf of the entire organization.

   :::image type="content" source="./media/authentication-api/tenant-permission.png" alt-text="Screenshot requesting tenant to grant permission to all users.":::

### Authentication API admin setting

The Power BI admin can enable the Authentication API feature with this global switch:

:::image type="content" source="./media/authentication-api/global-switch.png" alt-text="Screenshot of global tenant admin switch.":::

For more information about admin switches, see [Power BI visuals tenant settings](/fabric/admin/service-admin-portal-power-bi-visuals).

## How to use the Authentication API

### Set the API version

In the *pbiviz.json* file, set the API version to 5.9.0 or higher:

:::image type="content" source="./media/authentication-api/api-version.png" alt-text="Screenshot of the pbiviz.json file with the API version set to 5.9.0":::

### Include the authentication privilege

In the *capabilities.json* file, include the "AADAuthentication" privilege.

In the *parameters* object, define key-value pairs, where the key represents the cloud name, and the value represents your Microsoft Enterprise ID registered application URI in that cloud.

Available cloud names:

* **COM**: Commercial Cloud. (Required)
* **CN**: China Cloud.
* **GCC**: US Government Community Cloud.
* **GCCHIGH**: US Government Community Cloud High.
* **DOD**: US Department of Defense Cloud.

For example:

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

### Acquire a token

The newly exposed **AcquireAADTokenService** contains two methods:

* **acquireAADToken**: Returns the token for the visual or null if it can't be fetched.
* **acquireAADTokenstatus**: Returns one of the following privilege statuses associated with acquiring the token.

  * **Allowed**: The privilege is allowed in the current environment.
  * **NotDeclared**: The privilege declaration is missing in visual capabilities section.
  * **NotSupported**: The privilege isn't supported in the current environment.
  * **DisabledByAdmin**: The Fabric administrator denied privilege usage.

The following sample code demonstrates how to acquire a Microsoft Entra ID token using the API:

```typescript
    // Step 1: Check the status of AAD token acquisition
    const acquireTokenStatus = await this.acquireAADTokenService.acquireAADTokenStatus();

    // Step 2: Verify if acquiring the token is allowed
    if (acquireTokenStatus === PrivilegeStatus.Allowed) {

        // Step 3: Acquire the AAD token
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

* The visual’s backend service, configured as the audience by the visual, doesn't have appropriate consents for the Graph API in the consumer tenant using the visual. For more about consents, see [tenant administrator consent](entra-id-authentication.md#consenting-the-isv-app).

## Related content

[Microsoft Entra ID application setup](./entra-id-authentication.md)
