<properties
   pageTitle="Integrate a report into an app"
   description="Walkthrough to integrate a report into an app, sample code"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
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
   ms.date="05/24/2016"
   ms.author="derrickv"/>

# Integrate a report into an app walkthrough

## Introduction

In this walkthrough, you integrate, or embed, a report into a web app using C# and the **Power BI** API, some JavaScript code, and an IFrame.

>**NOTE**: To get started with this walkthrough, you need a **Power BI** account. If you don't have an account, see [Sign up for Power BI]( powerbi-admin-free-with-custom-azure-directory.md).

To integrate a report into a web app, you use the **Power BI** API, and an Azure Active Directory (AD) authorization **access token** to get a report. Then, you load the report into an **IFrame** using the same access token. The **Power BI** API provides programmatic access to certain **Power BI** resources. See [Overview of Power BI REST API](https://msdn.microsoft.com/library/dn877544.aspx). The illustration below shows the general flow to integrate a report.

![](media\powerbi-developer-integrate-report\integrate-report-flow.png)

Here are the steps to integrate, or embed, a report into a web page.

>**NOTE**: This article shows the code used in the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app) on GitHub. To follow along with this walkthrough, you should download the sample. To run the sample, see [Configure the integrate a report sample](powerbi-developer-integrate-report-register.md#configure-sample) in the Register a web app with Azure AD step .

## Steps to integrate a report into an app

- [Step 1: Register a web app with Azure AD](powerbi-developer-integrate-report-register.md). You need to register your web app with **Azure Active Directory (AD)** so that Azure AD can identify your application when you need to access **Power BI** reports.
- [Step 2: Get a Power BI report](powerbi-developer-integrate-report-get-report.md)
- [Step 3: Load a Power BI report into an IFrame](powerbi-developer-integrate-report-load-report-iframe.md)
- [Integrate a report into an app code listing](powerbi-developer-integrate-report-code.md)

## Next step

In the next step, you learn how to [Register a web app with Azure AD](powerbi-developer-integrate-report-register.md) to get a **Client ID** and **Client Secret** to authenticate the web app with **Azure AD**. A Client ID and Client Secret is used to identify your app in Azure AD. After you get a **Client ID** and **Client Secret**, you can configure the [Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app). See [Configure the integrate a report sample](powerbi-developer-integrate-report-register.md#configure-sample).

[Next Step >](powerbi-developer-integrate-report-register.md)

## See also

-	[Sign up for Power BI]( powerbi-admin-free-with-custom-azure-directory.md)
-	[Integrate a report sample](https://github.com/Microsoft/PowerBI-CSharp/tree/master/samples/webforms/integrate-report-web-app)
-	[Configure the integrate a report sample](powerbi-developer-integrate-report-register.md#configure-sample)
-	[Step 1: Register a web app with Azure AD](powerbi-developer-integrate-report-register.md)
