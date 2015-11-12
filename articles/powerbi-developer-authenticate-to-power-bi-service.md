<properties
   pageTitle="Authenticate to Power BI service"
   description="Authenticate to Power BI service"
   services="powerbi"
   documentationCenter=""
   authors="derrickv"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/1/2015"
   ms.author="derrickv"/>

# Authenticate to Power BI service

This article is an introduction to authentication in Power BI, and how to get an access token using a client id. To get started creating a Power BI app, see [Get started creating a Power BI app](powerbi-developer-steps-to-create-a-power-bi-app.md).

The Power BI REST API is a REST-based API that provides programmatic access to dashboard resources such as datasets, tables, and rows. For an introduction to the Power BI REST API, see [Introduction to Power BI REST API](powerbi-developer-introduction-to-creating-a-power-bi-app.md). To provide secure sign in and authorization for your app, you authenticate your app with ** Azure Active Directory** (Azure AD).

### In this article
- [Introduction to authentication in Power BI](#intro)
- [Azure app client ID](#clientID)
- [Azure web app client secret key](#clientSecret)

<a name="intro"/>
## Introduction to authentication in Power BI
Power BI apps are integrated with ** Azure Active Directory** (Azure AD) to provide secure sign in and authorization for your app. To integrate a Power BI app with Azure AD, you register the details about your application with Azure AD by using the Azure Management Portal. When you register an app in Azure Active Directory, the application outsources authentication to Azure AD. App registration involves telling Azure AD about your application including the URL where it is located, the URL to send replies after authentication, and the URI to identify your application. When you register a client app or web app in Azure AD, you give your app access to the Power BI REST API.

A Power BI app uses a **Client ID** to identify itself to Azure AD. See [Azure app client ID](#clientID). For a Web app, you also need a client secret key. See [Azure web app client secret key](#clientSecret).

To learn how to register and authenticate a Power BI app:

- **Power BI client app**: See [Register a client app](powerbi-developer-register-a-client-app.md) and [Authenticate a Power BI client app](Authenticate+a+client+app.md).

- **Power BI web app**: See [Register a web app](powerbi-developer-register-a-web-app.md) and [Authenticate a Power BI web app](powerbi-developer-authenticate-a-web-app.md).

- To learn how to use Azure authentication on different platforms: The [Azure Authentication Libraries](https://msdn.microsoft.com/library/azure/dn151135.aspx) are available on different platforms to help developers easily authenticate users to cloud or on premise Active Directory (AD) to obtain access tokens for securing API calls. This topic contains a roadmap to the authentication libraries available on different platforms and to helpful resources for each, including source code and samples.

<a name="clientID"/>
## Azure app client ID
An Azure app has a **Client ID** that is used by the application to identify themselves to the users that they are requesting permissions from. You use a **Client ID** to get an authentication token. To get an Azure **Client ID**, see [How to get a client app id](powerbi-developer-register-a-client-app.md#clientID).

For a complete sample of how to use an Azure** Client ID** to authenticate a client app, see [Authenticate a client app](powerbi-developer-authenticate-a-client-app.md).

For example, the following C# code uses an Azure app client id to get an access token.

      static string AccessToken()
      {
            //Get access token:
            // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
            // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
            // To install the Active Directory Authentication Library NuGet package in Visual Studio,
            //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

            //Resource Uri for Power BI API
            string resourceUri = "https://analysis.windows.net/powerbi/api";

            string clientId = {clientIDFromAzureAppRegistration};

            //A redirect uri gives AAD more details about the specific application that it will authenticate.
            //Since a client app does not have an external service to redirect to, this Uri is the standard placeholder for a client app.
            string redirectUri = "https://login.live.com/oauth20_desktop.srf";

            // Create an instance of AuthenticationContext to acquire an Azure access token
            // OAuth2 authority Uri
            string authorityUri = "https://login.windows.net/common/oauth2/authorize";
            AuthenticationContext authContext = new AuthenticationContext(authorityUri);

            // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
            //  AcquireToken takes a Client Id that Azure AD creates when you register your client app.
            //  To learn how to register a client app and get a Client ID, see https://msdn.microsoft.com/en-US/library/dn877542(Azure.100).aspx   
            string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

            return token;
      }

<a name="clientSecret"/>
## Azure web app client secret key
When you register a web app, you receive a client secret **Key**. The client secret **Key** is used by the web app to securely identify themselves to the **Power BI service**. To get an Azure client secret **Key**, see [How to get a client secret key](powerbi-developer-register-a-web-app.md#clientSecret).

For a complete sample of how to use an Azure **Client ID** and client secret **Key** to authenticate a web app, see [Authenticate a web app](powerbi-developer-authenticate-a-web-app.md).

## Related topics
- [Get started creating a Power BI app](Get+started+creating+a+Power+BI+app.md)
- [How to get an Azure Active Directory tenant](https://azure.microsoft.com/en-us/documentation/articles/active-directory-howto-tenant/)
- [Create an Azure Active Directory tenant](Create+an+Azure+Active+Directory+tenant.md)
- [Register a client app](Register+a+client+app.md)
- [Register a web app](Register+a+web+app.md)
