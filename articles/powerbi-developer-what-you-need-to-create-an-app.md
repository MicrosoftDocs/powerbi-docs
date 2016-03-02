<properties
   pageTitle="What you need to create an app"
   description="What you need to create an app"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/25/2016"
   ms.author="derrickv"/>

# What you need to create a Power BI app

Before you start creating a Power BI app, you need to setup your environment for the app. First, you need a Power BI service account. Also, since Power BI uses **Azure Active Directory (Azure AD)** to authenticate users and protect applications, you need to register, or configure, your app in **Azure AD** so that the active directory can find your app.

Here are the steps to configure your environment:

-	Step 1: [Sign up for Power BI](#signup).
-	Step 2: [Register your app in Azure AD](#register).
-	Step 3: [Get an authentication security token](#token).

<a name="signup"/>
## Sign up for Power BI
To create a Power BI app, you need to sign up for the Power BI service. See [Sign up for Power BI](powerbi-service-self-service-signup-for-power-bi.md). Once you have a Power BI account, you need to register, or configure, your app in **Azure AD**.

<a name="register"/>
## Register your app in Azure AD
You register your app in **Azure AD** so that users can authenticate to the Power BI service. There are two types of apps in Azure AD: **Native client app** and **Web app**. The primary difference between a **Native client app** and **Web app** is how the app is identified. For a **Native client app**, a client id identifies the app. For a **Web app**, a client id and client secret identifies the app. Both have slightly different configuration settings that are described in [Register a client app](powerbi-developer-register-a-client-app.md) and [Register a web app](powerbi-developer-register-a-web-app.md).

You can learn more about how to register your app in the following articles:

-	[Register a client app](powerbi-developer-register-a-client-app.md) or [Push data into Power BI dashboard](powerbi-developer-walkthrough-push-data.md).
-	[Register a web app](powerbi-developer-register-a-web-app.md) or one of the following walkthroughs:
  -	[Authenticate a web app](powerbi-developer-authenticate-a-web-app.md)
  -	[Integrate a Power BI tile or report into an app](powerbi-developer-integrate-a-power-bi-tile-or-report.md)

Once you register your app in **Azure AD**, you can authenticate to the Power BI service. See [Get an authentication security token](#token).  The next section shows the steps to register a client app, and get a security token.

<a name="token"/>
## Get an authentication security token
The following is a simple C# app that authenticates to Power BI. The sample only shows you how to get an authentication security token. You use the authentication security token to make calls to Power BI operations. Please follow one of the following walkthroughs to learn how to use a token to call Power BI operations:

-	[Push data into Power BI dashboard](powerbi-developer-walkthrough-push-data.md)
-	[Authenticate a web app](powerbi-developer-authenticate-a-web-app.md)
-	[Integrate a Power BI tile or report into an app](powerbi-developer-integrate-a-power-bi-tile-or-report.md)

For this sample, you learn how to authenticate a **Native client app**. To authenticate a web app, see [Authenticate a web app](powerbi-developer-authenticate-a-web-app.md).

Power BI apps are integrated with **Azure AD** to provide secure sign in and authorization for your app. After you register an app in **Azure AD**, the application outsources authentication to Azure AD, and grants your app access to the Power BI REST API.

Here are the steps to get an authentication security token:

<a name="register_1"/>
**Step 1**: Register a **Native client app**.

1. Go to dev.powerbi.com/apps.
2. Click **Sign in with your existing account**, and sign into your Power BI account.
3. Enter an **App Name** such as "Sample Native client app".
4. For **App Type**, choose **Native app**.
5. Enter a **Redirect URL**. For a **Native client app**, a redirect uri gives **Azure AD** more details on the specific application that it will authenticate. The standard Uri for a client app is https://login.live.com/oauth20_desktop.srf.
6. For **Choose APIs to access**, choose **Read All Datasets**. For all Power BI app permissions, see [App permissions](powerbi-developer-power-bi-permissions.md).
7. Click **Register app**, and save the **Client ID** that was generated. A **Client ID** identifies the app in Azure AD.

**Step 2**: In Visual Studio, create a **Console Application** project, and follow these steps:

1.	Paste the code below into Main(string[] args).
2.	Replace "{ClientID}", with the **Client ID** you got when you registered the app. See [Step 1 – Register a Native client app](#register_1).
3.	Install the [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/). To get an authentication security token in a .NET app, you use this package. Here's how to install the package:

    a. In Visual Studio 2015, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.

    b. In **Package Manager Console**, enter Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612.

4.	After the package is installed, add **using Microsoft.IdentityModel.Clients.ActiveDirectory;** to Program.cs.
5.	Run the Console App, and login to your Power BI account. You should see a long token string that you use to call Power BI operations.

**Sample get authentication security token**

Paste this code into Main(string[] args).

    //Add using Microsoft.IdentityModel.Clients.ActiveDirectory;

    //The client id that Azure AD created when you registered your client app.
    string clientID = "{ClientID}";

    //RedirectUri you used when you registered your app.
    //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
    // You can use this redirect uri for your client app
    string redirectUri = "https://login.live.com/oauth20_desktop.srf";

    //Resource Uri for Power BI API
    string resourceUri = "https://analysis.windows.net/powerbi/api";

    //OAuth2 authority Uri
    string authorityUri = "https://login.windows.net/common/oauth2/authorize";

    string powerBIApiUrl = "https://api.powerbi.com/v1.0/myorg";

    //Get access token:
    // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
    // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
    // To install the Active Directory Authentication Library NuGet package in Visual Studio,
    //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612" from the NuGet Package Manager Console.

    // AcquireToken will acquire an Azure access token
    // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
    AuthenticationContext authContext = new AuthenticationContext(authorityUri);
    string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

    Console.WriteLine(token);

    Console.ReadLine();

Once you have an authentication security token, you can call any Power BI REST operation. To learn how to use a token, see any of these walkthroughs:

-	[Push data into Power BI dashboard](powerbi-developer-walkthrough-push-data.md)
-	[Authenticate a Power BI web app](powerbi-developer-authenticate-a-web-app.md)
-	[Integrate a Power BI tile or report into an app](powerbi-developer-integrate-a-power-bi-tile-or-report.md)
