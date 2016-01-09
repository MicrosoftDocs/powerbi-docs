<properties
   pageTitle="Get started creating a Power BI app"
   description="Get started creating a Power BI app"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="01/06/2016"
   ms.author="derrickv"/>

# Get started creating a Power BI app

Power BI displays dashboards that are interactive, and can be created and updated from many different data sources in real-time. With the Microsoft Power BI REST API, you can programmatically access certain Power BI resources. Using the API, you can create an app in any platform that supports calling REST operations.

Here's how to get started creating a Power BI app:

|Get started with the Power BI REST API to send data to a Power BI dashboard in real-time|
|---|
|1 - Get an [Overview of REST](powerbi-developer-overview-of-power-bi-rest-api.md) and the [Power BI REST API](powerbi-developer-rest-api-reference.md). <br/><br/>**For samples**: [Try the Power BI REST API in Apiary](http://docs.powerbi.apiary.io/#)  or download the [Power BI REST API samples](https://msdn.microsoft.com/en-us/library/mt203554.aspx).|
|2 - [Create an Azure Active Directory tenant](powerbi-developer-create-an-azure-active-directory-tenant.md). If you already have an Azure AD tenant and organizational user, you can skip this step. **Important** To create a Power BI app, you need an **Azure Active Directory** tenant and a Power BI service account.  |
|3 - [Sign up for the Power BI service to get started](powerbi-developer-sign-up-for-power-bi-service.md). To sign up for the Power BI service, you need an Azure AD organizational user. |
|4 - [Register your client app](powerbi-developer-register-a-client-app.md) or [Register your web app](powerbi-developer-register-a-web-app.md). You register your app in Azure Active Directory so that users can authenticate to the Power BI service. |
|5 - [Learn how to Authenticate with Azure AD](powerbi-developer-authenticate-to-power-bi-service.md). Write code to get an Azure access token so your app can access Power BI REST resources. |
|6 - [Create your Power BI app](powerbi-developer-introduction-to-creating-a-power-bi-app.md). Write a Power BI client app or web app. |
