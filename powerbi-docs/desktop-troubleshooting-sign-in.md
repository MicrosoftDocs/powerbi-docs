---
title: Troubleshooting Sign-in issues in Power BI Desktop
description: Solutions to common issues for signing in to Power BI Desktop
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: ''
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 04/24/2018
ms.author: davidi

LocalizationGroup: Troubleshooting
---
# Troubleshooting sign-in for Power BI Desktop
There may be times when you attemp to sign in to **Power BI Desktop** but run into errors. There are two primary reasons for sign-in trouble: **Proxy Authentication errors** and **Non-HTTPS URL redirect errors**. 

To determine which problem is causing your sign-in issue, the first step is to contact your administrator and provide diagnostic information so that they can determine the cause of the issue. By tracing issues associated with your sign-in problem, administrators can determine which of the following errors apply to you. 

Let's take a look at each of those issues in turn.


## Proxy Authentication Required error

The following screen shows an example of the *Proxy Authentication Required* error.

![Sign-in error for Proxy Authentication error](media/desktop-troubleshooting-sign-in/desktop-tshoot-sign-in_01.png)

The following exceptions in *Power BI Desktop* trace files are associated with this error:

* *Microsoft.PowerBI.Client.Windows.Services.PowerBIWebException*
* *HttpStatusCode: ProxyAuthenticationRequired*

When this error occurs, the most likely reason is that a proxy authentication server on your network is blocking the web requests issued by **Power BI Desktop**. 

If your network uses a proxy authentication error, your administrator can fix this issue by whitelisting the following domains on the proxy authentication server:

* app.powerbi.com
* api.powerbi.com
* domains in the *.analysis.windows.net namespace

For customers who are part of a government cloud, fixing this issue can be done by whitelisting the following domains on the proxy authentication server:

* app.powerbigov.us
* api.powerbigov.us
* domains in the *.analysis.usgovcloudapi.net namespace

## Non-HTTPS URL redirect not supported error

Current versions of **Power BI Desktop** use the current version of the Active Directory Authentication Library (ADAL), which does not allow a redirect to non-secured (non-HTTPS) URLs. 

The following exceptions in *Power BI Desktop* trace files are associated with this error:

* *Microsoft.IdentityModel.Clients.ActiveDirectory.AdalServiceException: Non-HTTPS url redirect is not supported in webview*
* *ErrorCode: non_https_redirect_failed*

If the *ErrorCode: non_https_redirect_failed* occurs, it means that one or more redirect pages or providers in the redirect chain is not an HTTPS protected endpoint, or that a certificate issuer of one or more redirects is not among the device's trusted roots. All providers in any sign-in redirect chain must use an HTTPS URL. To resolve this issue, contact your administrator and request that secured URLs be used for their authentication sites. 




