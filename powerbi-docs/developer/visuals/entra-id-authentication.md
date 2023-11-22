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

In order for an ISV to use the Microsoft Entra ID authentication API, the ISV must register the app in Microsoft Entra, and the tenant admin has to consent. This article describes both these steps.

## Register the app in Microsoft Entra

1. Navigate to [Microsoft Entra ID App registrations](https://ms.portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/RegisteredApps)

1. Select **+ New Registration**:

   :::image type="content" source="./media/entra-id-authentication/new-registration.png" alt-text="Screenshot of Microsoft Entra app new registration UI.":::

1. On the **Register an application** page, do the following:
   1. Enter your desired application name in the **Name** section.
   1. Select *Accounts in any organizational directory (Any Azure AD directory - Multitenant)* in the **Supported account types section**.
   1. Select **Register**.

   :::image type="content" source="./media/entra-id-authentication/register-app.png" alt-text="Screenshot of the Register an app page of the Entra ID registration app.":::

1. Once your application is successfully registered, select **Expose an API** on the left side menu.

    :::image type="content" source="./media/entra-id-authentication/expose-api.png" alt-text="Screenshot of the Expose an API page of the Entra ID registration app.":::

1. Select the **+ Add a scope** button and enter your application URI in the right hand **Add a scope** window. Configure the registered Microsoft Entra ID application URI with your private domain. The URI must meet the following requirements:

   * It should start with *https://*.
   * It should not contain *onmicrosoft.com*.  
   * It should exclude spaces and URL-encoded spaces.

1. Select **Save and continue**.

   :::image type="content" source="./media/entra-id-authentication/add-scope.png" alt-text="Screenshot of Add a scope window with the configured Entra ID app URI entered.":::

1. In the **Scope name** field, enter *<visual_guid>_CV_ForPBI* and fill the **Admin consent** fields. Then select **Add scope** button. (There's a 40 characters scope length limitation, but you can  manually modify the scope name in the registered application manifest to mange this limitation).

    :::image type="content" source="./media/entra-id-authentication/add-scope-continued.png" alt-text="Screenshot of the second part of the Add a scope window with the scope name and permissions filled in.":::

1. To *preauthorize* Power BI applications:

   1. Select **+ Add a client application**.
   1. Enter the **Power BI WFE** application appId "871c010f-5e61-4fb1-83ac-98610a7e9110" in the **Client ID** field of the right-hand window.
   1. Select your desired scope.
   1. Select **Add application**.
   1. Repeat this process with:

      * Power BI Desktop: "7f67af8a-fedc-4b08-8b4e-37c4d127b6cf".
      * Power BI Mobile: "c0d2a505-13b8-4ae0-aa9e-cddd5eab0b12".

     :::image type="content" source="./media/entra-id-authentication/preauthorization.png" alt-text="Screenshot showing the UI to add a client application.":::

## Tenant admin consent ISV app

The tenant admin can determine whether or not users are allowed to consent for themselves. This consent process takes place outside of Power BI. It is important to note that only the tenant admin can grant consent on behalf of the entire organization. The decision to revoke or delete the consent lies solely with the Microsoft Entra ID admin.

> [!NOTE]
> If the ISV didn't preauthorize the Power BI application, the consent prompt is displayed every time a user logs in.

If the ISV application is running on a different tenant than the visual consumer's tenant, grant consent for the ISV's application in one of the following ways:

* Pre-Consent:

  1. Navigate to `https://login.microsoftonline.com/{tenantId}/adminconsent?client_id={clientId}`

     * tenantId: The id of the visual consumer's tenant
     * clientId: The appId of ISV’s application

     :::image type="content" source="./media/entra-id-authentication/pre-consent.png" alt-text="Screenshot of app registration pre-consent window.":::

  1. Sign in with tenant admin credentials:

    :::image type="content" source="./media/entra-id-authentication/pre-consent-sign-in.png" alt-text="Screenshot of Microsoft sign in page.":::

  1. Accept the permissions request:

    :::image type="content" source="./media/entra-id-authentication/pre-consent-permissions.png" alt-text="Screenshot of permissions request.":::

    Note: If you receive the following error, it means there is no reply address, but the consent was granted successfully.

    :::image type="content" source="./media/entra-id-authentication/no-reply-error.png" alt-text="Screenshot of error message saying there is no reply address registered for the app.":::

* Interactive Consent:

  * If the tenant admin has not pre-consented, any user that uses a visual that triggers the API will receive a one-time consent prompt when rendering the visual.

    :::image type="content" source="./media/entra-id-authentication/interactive-consent.png" alt-text="Screenshot of interactive consent prompt.":::

  * If the tenant admin signs in as the Power BI user, they receive a consent prompt with an option to provide consent on behalf of the entire organization.

    :::image type="content" source="./media/entra-id-authentication/interactive-consent-admin.png" alt-text="Screenshot of interactive consent prompt for tenant admin.":::
