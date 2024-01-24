---
title: Single sign-on in the Power BI mobile Windows app
description: Set up single sign-on (SSO) in the Power BI mobile Windows app so that you can access all your applications and resources by signing in only once.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 12/31/2023
---

# Single sign-On in the Power BI mobile Windows app

>[!NOTE]
> The Power BI Windows app was retired on December 31st, 2023, and is no longer supported. It's been removed from the Microsoft apps store, and no further product updates for it will be released. Please use [the Power BI service](https://app.powerbi.com/) to view your Power BI content on Windows devices.
>
> This notice only applies to the Power BI Windows app. It does not affect the Power BI Desktop app.

Read about single sign-on (SSO) in the Power BI mobile Windows app. SSO means you access all the applications and resources you need to do business by signing in only once, with a single user account. Once you're signed in, you can access all those applications without having to authenticate again.

Because the Power BI Windows app is integrated into Microsoft Entra ID, you can use your primary organizational account not only to sign in to your domain-joined devices, but also to sign in to the Power BI service. If you're viewing Power BI on a Windows phone, make sure the account you use for Power BI is configured as a work or school account in the device settings.  

SSO is enabled only for Windows devices managed by Microsoft Entra ID.

## Sign in with SSO

To simplify the sign-in process, when you install the app for the first time the app automatically tries to authenticate you to the Power BI service using SSO. Only if this process doesn't succeed does the app ask you to provide your credentials for Power BI.  

If you're already using the Power BI mobile app for Windows, when you upgrade to the new version of the app you can also use SSO. Sign out of the app, close it, and reopen it. When the app reopens, it automatically tries to use your current Windows credentials to authenticate against the Power BI service.

If you don't want to use your current Windows active session credentials to sign in to Power BI, just go to **Settings**, sign out, and sign in with different credentials.

## Related content

- [Get started with the Power BI mobile app for Windows](mobile-windows-10-phone-app-get-started.md)
- Questions? [Ask the Power BI Community](https://community.powerbi.com/)
