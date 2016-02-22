<properties
   pageTitle="Walkthrough - Push data into a Power BI dashboard"
   description="Walkthrough to push data into a Power BI dashboard"
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
   ms.date="02/21/2016"
   ms.author="derrickv"/>

# Walkthrough - Push data into a Power BI dashboard

With the Power BI REST API, you can push data into a Power BI dashboard. For example, you want to extend an existing business workflow to push key data into your dashboard. In this case, you want to push a Sales Marketing dataset which has a Product table.

Before you get started, make sure to [setup your app environment in Azure Active Directory (Azure AD)](powerbi-developer-what-you-need-to-create-an-app.md). Power BI apps are integrated with **Azure AD** to provide secure sign in and authorization for your app. After you register an app in **Azure AD**, the application outsources authentication to Azure AD, and grants your app access to the Power BI REST API.

Here's how to use the Power BI API to push data into a dashboard. In this example, you push a Sales Marketing dataset with a Product table into your dashboard.

The [first step](powerbi-developer-walkthrough-push-data-register-app-with-azure-ad.md) to push data into a dashboard is to **get an authentication access token**.

## See also
- [Overview of Power BI REST API](powerbi-developer-overview-of-power-bi-rest-api.md)
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
