<properties
   pageTitle="Register an app with Azure AD"
   description="Walkthrough - Push data into a dashboard - Register an app with Azure AD"
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
   ms.date="02/26/2016"
   ms.author="derrickv"/>

# Step 1: Register an app with Azure AD

The first step to push data into a Power BI dashboard is to register your app in Azure AD. You need to do this first so that you have a **Client ID** that identifies your app in Azure AD. Without a **Client ID**, Azure AD cannot authenticate your app.

>**NOTE**: Before you register an app, you need to setup your app environment in Azure Active Directory (Azure AD). See [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md).

Here are the steps to register an app in Azure AD.

## Register an app in Azure AD

1. Go to dev.powerbi.com/apps.
2. Click **Sign in with your existing account**, and sign into your Power BI account.
3. Enter an **App Name** such as "Sample push data app".
4. For **App Type**, choose **Native app**.
5. Enter a **Redirect URL**, such as **https://login.live.com/oauth20_desktop.srf**. For a **Native client app**, a redirect uri gives **Azure AD** more details on the specific application that it will authenticate. The standard Uri for a client app is https://login.live.com/oauth20_desktop.srf.
6. For **Choose APIs to access**, choose **Read and Write All Datasets**. For all Power BI app permissions, see [Power BI Permissions](powerbi-developer-power-bi-permissions.md).
7. Click **Register app**, and save the **Client ID** that was generated. A **Client ID** identifies the app in Azure AD.

Here's how your **Register an Application for Power BI** page should look:

![](media\powerbi-developer-walkthrough-push-data\powerbi-developer-sample-register-app.png)

The **next step** shows you how to [get an authentication access token](powerbi-developer-walkthrough-push-data-get-token.md).

## See also
- [Get an authentication access token](powerbi-developer-walkthrough-push-data-get-token.md)
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Walkthrough: Push data into a dashboard](powerbi-developer-walkthrough-push-data.md)
- [Register a client app](powerbi-developer-register-a-client-app.md)
- [Overview of Power BI REST API](powerbi-developer-overview-of-power-bi-rest-api.md)
