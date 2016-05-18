<properties
   pageTitle="Register a web app with Azure AD"
   description="Register a web app with Azure AD"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   backup=""
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/18/2016"
   ms.author="derrickv"/>

# Step 1: Register a web app with Azure AD

## Introduction

In this step of the [Integrate a report into an app walkthrough](powerbi-developer-integrate-report.md), you register your app in **Azure Active Directory (AD)**. You need to do this first so that you have a **Client ID** and **Client Secret** that identifies your web app in Azure AD. Without a **Client ID** and **Client Secret**, Azure AD cannot authenticate your web app. If you downloaded the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app), you use the **Client ID** and **Client Secret** you get after registration to configure the sample so that the sample can authenticate to Azure AD.

![](media\powerbi-developer-integrate-report\integrate-report-step1a.png)

>**NOTE**: Before you register a web app for **Power BI**, you need to [Sign up for Power BI](powerbi-admin-free-with-custom-azure-directory.md).

Here are the steps to register a web app in Azure AD.

## Register a web app in Azure AD

1. Go to dev.powerbi.com/apps.
2. Click **Sign in with your existing account**, and sign into your Power BI account.
3. Enter an **App Name**. For this walkthrough, enter **Integrate a report sample**.
4. For **App Type**, choose **Server-side Web app**.
5. Enter a **Redirect URL**. For this walkthrough, Azure AD redirects back to the default page, so enter http://localhost:13526. Azure Active Directory (AD) will redirect to this page with an **Authorization Code**. To learn how to acquire an **Access Token** to access **Power BI** reports using an **Authorization Code **, see [Get an authentication access token](powerbi-developer-get-dashboard.md#get-token).
6. Enter a **Home Page**. For this walkthrough, enter http://localhost:13526 which is the home page for the sample.
7. For **Choose APIs to access**, choose **Read All Reports (preview)**. For all Power BI app permissions, see [App permissions](powerbi-developer-power-bi-permissions.md).
7. Click **Register app**, and save the **Client ID** and **Client Secret** that was generated. A **Client ID** and **Client Secret** identifies the app in Azure AD. To configure the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app) to use the **Client ID** and **Client Secret** to authenticate, see [Configure the integrate a report sample](powerbi-developer-integrate-report-register.md#configure-sample).

Here's how your **Register an Application for Power BI** page should look:

![](media\powerbi-developer-integrate-report\register-app.png)

After you have a **Client ID** and **Client Secret**, you can configure your web app, such as the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app), to be able to access **Power BI** reports. The next section shows you how to configure the sample.

<a name="configure-sample"/>
## Configure the Integrate a report sample
If you downloaded the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app), you use the **Client ID** and **Client Secret** you get after registration so that the sample can authenticate to Azure AD. To configure the sample, change the **Client ID** and **Client Secret** in web.config. To learn more about how to authenticate to Azure AD, see [Step 2: Get a Power BI report](powerbi-developer-integrate-report-get-report.md).

Now that you have registered your web app with **Azure AD**, you can get an authorization access token from **Azure AD** to access **Power BI** reports.

![](media\powerbi-developer-integrate-report\integrate-report-step1b.png)

To integrate a report into an app, you need to get a report. In the next step, you learn how to [Get a Power BI report](powerbi-developer-get-dashboard.md).

[Next Step >](powerbi-developer-get-report.md)

## See also
-	[Sign up for Power BI]( powerbi-admin-free-with-custom-azure-directory.md)
-	[Integrate a report into an app walkthrough](powerbi-developer-integrate-report.md)
-	[Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app)
-	[Configure the integrate a report sample](powerbi-developer-register.md#configure-sample)
-	[Get an authentication access token](powerbi-developer-get-dashboard.md#get-token)
-	[App permissions](powerbi-developer-power-bi-permissions.md)
-	[Step 2: Get a Power BI report]( powerbi-developer-get-report.md)
