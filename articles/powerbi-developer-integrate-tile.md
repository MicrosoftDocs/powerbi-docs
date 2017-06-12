<properties
   pageTitle="Integrate a Power BI tile into an app"
   description="Walkthrough to integrate a tile into an app, sample code"
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/12/2017"
   ms.author="asaxton"/>

# Integrate a tile into an app

## Introduction

In this walkthrough, you integrate, or embed, a tile into a web app using C# and the **Power BI** API, some JavaScript code, and an IFrame.

To get started with this walkthrough, you need a **Power BI** account. If you don't have an account, you can [sign up for a free Power BI account](powerbi-service-self-service-signup-for-power-bi.md), or you can create your own [Azure Active Directory tenant ](powerbi-developer-create-an-azure-active-directory-tenant.md)for testing purposes.

To integrate a tile into a web app, you use the **Power BI** API, and an Azure Active Directory (AD) authorization **access token** to get a dashboard and tile. Then, you load the tile into an **IFrame** using the same access token. The **Power BI** API provides programmatic access to certain **Power BI** resources. See [Overview of Power BI REST API](https://msdn.microsoft.com/library/dn877544.aspx). The illustration below shows the general flow to integrate a tile.

![](media\powerbi-developer-integrate-tile\integrate-tile-flow.png)

Here are the steps to integrate, or embed, a tile into a web page.

## Download the sample

This article shows the code used in the [Integrate a tile sample](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/User%20Owns%20Data/integrate-tile-web-app) on GitHub. To follow along with this walkthrough, you should download the sample.

If you are looking for a sample that involves embedding items for non-Power BI users, you can see [Embedding for non-Power BI users](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data).

## Steps to integrate a tile into an app

- [Step 1: Register a web app with Azure AD](powerbi-developer-integrate-tile-register.md). You need to register your web app with **Azure Active Directory (AD)** so that Azure AD can identify your application when you need to access **Power BI** tiles.
- [Step 2: Get a Power BI dashboard](powerbi-developer-integrate-tile-get-dashboard.md)
- [Step 3: Get a Power BI tile](powerbi-developer-integrate-tile-get-tile.md)
- [Step 4: Load a Power BI tile into an IFrame](powerbi-developer-integrate-tile-load-tile-iframe.md)
- [Integrate a tile into an app code listing](powerbi-developer-integrate-tile-code.md)

## Next step

In the next step, you learn how to [Register a web app with Azure AD](powerbi-developer-integrate-tile-register.md) to get a **Client ID** and **Client Secret** to authenticate the web app with **Azure AD**. A Client ID and Client Secret is used to identify your app in Azure AD. After you get a **Client ID** and **Client Secret**, you can configure the [Integrate a tile sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-tile-web-app). See [Configure the integrate a tile sample](powerbi-developer-integrate-tile-register.md#configure-sample).

[Next Step >](powerbi-developer-integrate-tile-register.md)

## See also

[Power BI developer samples](https://github.com/Microsoft/PowerBI-Developer-Samples)  
[Embed sample for non-Power BI users](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data)  
[App permissions](powerbi-developer-power-bi-permissions.md)  
[Power BI JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript)  
[Power BI REST API on APIARY](http://docs.powerbi.apiary.io/)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)