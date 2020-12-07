---
title: Understand the permission tokens needed for embedding a Power BI application
description: Learn which tokens your Power BI application needs to authenticate against Azure and Power BI service.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: amshuste
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/07/2020
---

# Embedded application tokens

An application embedding Power BI content such as reports and dashboards, needs to authenticate against Azure Active Directory (Azure AD), before it can access Power BI.

To authenticate against Azure AD, your app will need to use an [Azure AD token](#azure-ad-token).

Access to Power BI content varies depending on your app's type:

* An *embed for your customers* app, will need an [embed token](#embed-token) to gain access to Power BI content.

* An *embed for your organization app* can access the Power BI content that its signed in user has access to.

## Azure AD token

Before your application can access Power BI service, it must authenticate against Azure AD. After successfully authenticating against Azure AD, your app receives an Azure AD token (also known as an *access token*) allowing it to access Power BI. This token is required for all [REST API](/rest/api/power-bi/) operations, and it expires after an hour.

## Embed token

When you're using the *embed for your customers* solution, your application needs to know which Power BI content it can access. Use the [embed token](/rest/api/power-bi/embedtoken) REST API, to generate an embed token, which specifies the following:

* Which content your app can access

* How long your app can access the content for

* Your app's access level (view, create, or edit)

For more information, see [Considerations when generating an embed token](generate-embed-token.md).

## Authentication flows

This section describes the authentication flows for the *embed for your customers* and *embed for your organization* embedding solutions.

### Embed for your customers
        
*Embed for your customers* is a non-interactive solution. App users do not need to sign in for your app to access Power BI. Instead, your app authenticates using one of these methods:

* **[Service principal](embed-service-principal.md)**

    Your app uses the Azure AD [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) to authenticate against Azure AD and get the Azure AD access token.

* **Master user**

    Your app uses a [Power BI Pro](/power-bi/admin/service-admin-purchasing-power-bi-pro) or a [Premium Per User (PPU)](/power-bi/admin/service-premium-per-user-faq) account to authenticate against Azure AD and get the Azure AD access token. During the authentication process, the *master user* (or an administrator) will have to grant your app Azure AD [permissions](/azure/active-directory/develop/v2-permissions-and-consent) (also known as scopes) for using the Power BI REST APIs. Each REST API lists the permissions it needs. Your app will only be able to use APIs that require permissions granted in your Azure AD application.

After successful authentication against Azure AD, your app will use an [embed token](/rest/api/power-bi/embedtoken) for accessing specific Power BI content.

To embed using the *embed for your customers* solution, you'll need an A, EM, or P SKU.

This diagram shows the authentication flow for the *embed for your customers* solution.

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/embed-tokens/paas-authentiction.png" alt-text="A diagram of the authentication flow in an embed for your customers Power B I embedded analytics solution.":::

1. Your Power BI embedded app uses a *service principal* or a *master user* to authenticate against Azure AD.

2. Your Power BI embedded app gets an access token from Azure AD. Power BI REST API access is given according to:
    1. If you're using a *service principal*, your Azure AD app has access to all the APIs.
    2. If you're using a *master user*, the *master user* (or an administrator) has to provide consent for the APIs your app can use.

3. Your Power BI embedded app caches the *Azure AD token*, and uses it to access Power BI.

4. Your Power BI embedded app generates an *embed token*, which specifies which Power BI content it can embed.  

### Embed for your organization

*Embed for your organization* is an interactive solution. Your app users have Power BI accounts and use them to access your app. Users need to grant consent in the Microsoft *Permissions requested* dialog pop-up window.

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/embed-tokens/permissions-requested.png" alt-text="Screenshot showing the Microsoft permissions requested pop-up window which asks customers to grant permissions for accessing Power B I.":::

Your app then uses your customer's Power BI credentials to generate an Azure AD access token. The token allows your app to access content and query data in accordance with the permissions granted by the logged in user. Any Power BI content the user has access to, can be embedded.

The *embed for your organization* solution doesn't support A SKUs.

This diagram shows the authentication flow for the *embed for your organization* solution.

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/embed-tokens/saas-authentiction.png" alt-text="A diagram of the authentication flow in an embed for your organization Power B I embedded analytics solution.":::

1. A user signs in to your Power BI embedded app.

2. Your Power BI embedded app uses the user's credentials to authenticate against Azure AD.

3. The user grants the app consent to access Power BI.

4. Your Power BI embedded app gets an access token from Azure AD.

5. Your Power BI embedded app App caches the access token, and uses it to embed any Power BI content the user has rights to view.

## Next steps

>[!div class="nextstepaction"]
>[Get an Azure AD access token for your Power BI application](get-azuread-access-token.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)