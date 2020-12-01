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

## Azure AD token

Before your application can access Power BI service, it must authenticate against Azure AD. This authentication process is done using an **Azure AD token** and is required for all [REST API](/rest/api/power-bi/) operations.

During the authentication process, your app will get [permissions](/azure/active-directory/develop/v2-permissions-and-consent) (also known as scopes) from your Azure AD application. Each REST API lists which permissions it requires. Your app will only be able to use APIs that require permissions granted in your Azure AD application.

By default, the Azure AD access token expires after an hour.

:::row:::
    :::column span="":::

        ### Embed for your customers
        
        In an *embed for your customers* solution, your app authenticates using one of these methods:

        * [Service principal](embed-service-principal.md)

            Your app uses the Azure AD [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) to authenticate against Azure AD and get the Azure AD access token. Your app is authorized to access the Power BI REST APIs according to your Azure AD permissions.

        * Master user

            Your app uses a Power BI Pro account to authenticate against Azure AD and get the Azure AD access token. Your app is authorized to access the Power BI REST APIs according to your master user's account permissions. 

        >[!NOTE]
        >Requires specific licensing: A, EM, or P SKUs.       

    :::column-end:::
    :::column span="":::

        ### Embed for your organization

        In an *embed for your customers* solution, your app users have Power BI accounts and use them to access your app. Your app then uses your customer's Power BI credentials to generate an Azure AD access token. The token allows your app to use access content and query data in accordance with the logged in user's permissions. Any Power BI content the user has access to, can be embedded.

        >[!NOTE]
        >A SKUs are not supported.

    :::column-end:::
:::row-end:::

## Embed token

When accessing Power BI, the embed token specifies which content your application can access, and how long it can access it for. It also specifies your app's  access level (view, create, or edit).

* Power BI content that can be accessed
Access level 
Duration that the content can be accessed
Optionally, effective identities used to access content, and in turn, query data


## Next steps

>[!div class="nextstepaction"]
>[Get an Azure AD access token for your Power BI application](get-azuread-access-token.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)