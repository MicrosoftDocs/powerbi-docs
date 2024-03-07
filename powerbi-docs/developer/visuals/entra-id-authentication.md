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

1. Select **+ New Registration**

   :::image type="content" source="./media/entra-id-authentication/new-registration.png" alt-text="Screenshot of Microsoft Entra app new registration UI.":::

1. On the **Register an application** page, do the following:
   1. Enter your desired application name in the **Name** section.
   1. Select *Accounts in any organizational directory (Any Azure AD directory - Multitenant)* in the **Supported account types** section.
   1. Select **Register**.

   :::image type="content" source="./media/entra-id-authentication/register-app.png" alt-text="Screenshot of the Register an app page of the Microsoft Entra ID registration app.":::

1. Once your application is successfully registered, select **Expose an API** on the left side menu.

    :::image type="content" source="./media/entra-id-authentication/expose-api.png" alt-text="Screenshot of the Expose an API page of the Microsoft Entra ID registration app.":::

1. In the **Application ID URI** field, select *Add*.

    :::image type="content" source="./media/entra-id-authentication/add-app-id-uri.png" alt-text="Screenshot of the Expose an API page with the option to add an application ID URI.":::

1. In the **Edit Application ID URI** field, enter your [verified custom domain](https://portal.azure.com/#view/Microsoft_AAD_IAM/ActiveDirectoryMenuBlade/~/Domains), beginning with **https://**, and select **Save**.

   To add a custom domain:

   1. Navigate to [Microsoft Entra ID Custom domain names](https://entra.microsoft.com/#view/Microsoft_AAD_IAM/DomainsList.ReactView).
   1. Add your custom domain.
   1. Ensure your domain name doesn't contain *onmicrosoft.com*.  

    :::image type="content" source="./media/entra-id-authentication/edit-app-id-uri.png" alt-text="Screenshot of the Expose an API page with the Edit application ID URI page open." lightbox="./media/entra-id-authentication/edit-app-id-uri.png":::

1. Select **+ Add a scope**.

1. In the **Scope name** field, enter *<visual_guid>_CV_ForPBI* and add the required information. Fill in the *Admin consent* fields. Then select **Add scope** button. (There's a 40 characters scope length limitation, but you can  manually modify the scope name in the registered application manifest to manage this limitation).

    :::image type="content" source="./media/entra-id-authentication/edit-scope.png" alt-text="Screenshot of the edit a scope window with fields for scope name and other information." lightbox="./media/entra-id-authentication/edit-scope.png":::

1. To pre-authorize Power BI applications:

   1. Select **+ Add a client application**.

      :::image type="content" source="./media/entra-id-authentication/add-client.png" alt-text="Screenshot of the edit a scope window with fields for adding a client application." lightbox="./media/entra-id-authentication/add-client.png":::

   1. Enter the **Power BI WFE** application appId "871c010f-5e61-4fb1-83ac-98610a7e9110" in the **Client ID** field of the right-hand window.
   1. Select your desired scope.
   1. Select **Add application**.

      :::image type="content" source="./media/entra-id-authentication/preauthorization.png" alt-text="Screenshot showing the UI to add a client application." lightbox="./media/entra-id-authentication/preauthorization.png":::

   1. Repeat this process with:

      * **Power BI Desktop**: "7f67af8a-fedc-4b08-8b4e-37c4d127b6cf".
      * **Power BI Mobile**: "c0d2a505-13b8-4ae0-aa9e-cddd5eab0b12".

## Consenting the ISV app

The tenant administrator can determine whether or not users are allowed to consent for themselves. This consent process takes place outside of Power BI.

ISV backend application (for example, `https://contoso.com`) should be consented to Graph API and other dependencies (by users or tenant administrators) according to standard AAD rules:

If the ISV application is running on a different tenant than the visual consumer's tenant, grant consent for the ISV's application in one of the following ways:

* Administrator preconsent:

  Follow the instructions in [Grant tenant-wide admin consent to an application](/entra/identity/enterprise-apps/grant-admin-consent).

* Interactive consent:

  If the tenant administrator didn't preconsent, any user that uses a visual that triggers the API receives a one-time consent prompt when rendering the visual. See [Application consent experience](/entra/identity-platform/application-consent-experience) for more information.
