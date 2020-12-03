---
title: Understand the permission tokens needed for embedding a Power BI application
description: Learn which tokens your Power BI application needs to authenticate against Azure and Power BI service.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: amshuste
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 12/02/2020
---

# Embedded application tokens

An application embedding Power BI content such as reports and dashboards, needs to authenticate against both Azure Active Directory (Azure AD) and Power BI service.

First your app will authenticating against Azure AD. After successfully authenticating against Azure AD, your app receives an access token allowing it to access Power BI.

Your app will require different tokens, depending on the type of Power BI embedded analytics solution its using. The table below shows the type of access tokens needed for each solution.

|  |Embed for your customers  |Embed for your organization  |
|---------|---------|---------|
|**Authentication method**      |*Service principal* or *master user*         |Interactive (user's credentials)         |
|**Required token**      |*Azure AD token*           |*Azure AD token* and an *embed token*         |

## Token types

This section lists the token types required for an app embedding Power BI content. 

* **Azure AD token** - Before your application can access Power BI service, it must authenticate against Azure AD. This authentication process is done using an **Azure AD token** and is required for all [REST API](/rest/api/power-bi/) operations. By default, the Azure AD access token expires after an hour.

* **Embed token** - Embed token's are needed when you're using the *embed for your customers* solution. When accessing Power BI, the embed token specifies which content your application can access, and for how long. It also specifies your app's access level (view, create, or edit). For more information see [Considerations when generating an embed token](generate-embed-token.md).

## Authentication flows

This section describes the authentication flows for the *embed for your customers* and *embed for your organization* embedding solutions.

### Embed for your customers
        
In an *embed for your customers* solution, your app authenticates using one of these methods:

* **[Service principal](embed-service-principal.md)**

    Your app uses the Azure AD [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) to authenticate against Azure AD and get the Azure AD access token. During the authentication process, your app will get [permissions](/azure/active-directory/develop/v2-permissions-and-consent) (also known as scopes) from your Azure AD application. Each REST API lists which permissions it requires. Your app will only be able to use APIs that require permissions granted in your Azure AD application.

* **Master user**

    Your app uses a Power BI Pro account to authenticate against Azure AD and get the Azure AD access token. Your app is authorized to access the Power BI REST APIs according to your master user's account permissions. 

To embed using the *embed for your customers* solution, you'll need an A, EM, or P SKU.

This diagram shows the authentication flow for the *embed for your customers* solution.

1. Your Power BI embedded app uses a *service principal* or a *master user* to authenticate against Azure AD.

2. Your Power BI embedded app gets an access token from Azure AD. Power BI REST API access is given according to: 
    * If you're using a *service principal*, your Azure AD app's permissions.
    * If you're using a *master user*, the concent your provide to your *master user*. 

3. Your Power BI embedded app App caches the access token, and uses it to embed any Power BI content that the *service principal* or *master user* has rights to view.

### Embed for your organization

In an *embed for your organization* solution, your app users have Power BI accounts and use them to access your app. Users need to grant concent in the Microsoft *Permissions requested* dialog pop-up window.

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/embedded-tokens/permissions-requested.png" alt-text="Screenshot showing the Microsoft permissions requested pop-up window which asks customers to grant permissions for accessing Power B I.":::

Your app then uses your customer's Power BI credentials to generate an Azure AD access token. The token allows your app to access content and query data in accordance with the permissions granted by the logged in user. Any Power BI content the user has access to, can be embedded.

The *embed for your organization* solution doesn't support A SKUs.

This diagram shows the authentication flow for the *embed for your organization* solution.

1. A user signs in to your Power BI embedded app.
        
2. Your Power BI embedded app uses the user's credentials to authenticate against Azure AD.
        
3. Your Power BI embedded app gets an access token from Azure AD.
         
4. Your Power BI embedded app App caches the access token, and uses it to embed any Power BI content the user has rights to view.

## Next steps

>[!div class="nextstepaction"]
>[Get an Azure AD access token for your Power BI application](get-azuread-access-token.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)