---
title: Single Sign-On in the Power BI mobile Windows app
description: Read about Single Sign-On (SSO) in the Power BI mobile Windows app. SSO means you access all the applications and resources you need to do business by signing in only once, with a single user account.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 04/06/2021
---
# Single Sign-On in the Power BI mobile Windows app

Read about Single Sign-On (SSO) in the Power BI mobile Windows app. SSO means you access all the applications and resources you need to do business by signing in only once, with a single user account. Once you're signed in, you can access all those applications without having to authenticate again. 

Because the Power BI Windows app is integrated into Azure Active Directory, you can use your primary organizational account not only to sign in to your domain-joined devices, but also to sign in to the Power BI service. If you're viewing Power BI on a Windows phone, you make sure the account you use for Power BI is configured as a work or school account in the device settings.  

SSO is enabled only for Windows devices managed by Azure Active Directory.

>[!NOTE]
>Power BI mobile app support for **phones using Windows 10 Mobile** has been discontinued as of March 16, 2021. [Learn more](/legal/powerbi/powerbi-mobile/power-bi-mobile-app-end-of-support-for-windows-phones)

## Sign in with SSO

To simplify the sign-in process, when you install the app for the first time the app automatically tries to authenticate you to the Power BI service using SSO. Only if this process doesn't succeed does the app ask you to provide your credentials for Power BI.  

If you're already using the Power BI mobile app for Windows, when you upgrade to the new version of the app you can also use SSO. Sign out of the app, close it, and reopen it. When the app reopens, it automatically tries to use your current Windows credentials to authenticate against the Power BI service. 

If you don't want to use your current Windows active session credentials to sign in to Power BI, just go to **Settings**, sign out, and sign in with different credentials. 
 
## Next steps

- [Get started with the Power BI mobile app for Windows 10](mobile-windows-10-phone-app-get-started.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
