---
title: Install Webview2
description: Learn how to install WebView2 to view Power BI content on your Power BI app for Windows.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 08/08/2022
---
# Install WebView2

>[!NOTE]
>Power BI mobile app support for **phones using Windows 10 Mobile** has been discontinued as of March 16, 2021. [Learn more](/legal/powerbi/powerbi-mobile/power-bi-mobile-app-end-of-support-for-windows-phones)

This article describes what to do if you get the following message when you try to view Power BI content in the Power BI app for Windows.

![Screenshot of install WebView2 message in the Power BI app for Windows.](./media/mobile-windows-10-phone-app-webview2-installation/power-bi-windows-10-webview2-message.png)

## Why am I getting this message?

If you got one of the messages shown above, it means that you need to install WebView2 on your computer.

## How do I install WebView2?

It takes just a minute to install WebView2. You can get and install it from [Download Microsoft Edge WebView2](https://developer.microsoft.com/microsoft-edge/webview2/consumer/).

After installing WebView2, close the Power BI Windows app and then open it again.

## I installed WebView2, but the Power BI Windows app still doesn't show content

WebView2 must be installed at the machine level rather than per user. To install WebView2 at the machine level, install WebView2 as an administrator, as described in the steps below.

1. Uninstall WebView2 if you just installed it. Don't delete the download file. If you deleted the download file, download WebView2 again.

1. Right click the WebView2 download and select **Run as administrator**.

After installing WebView2 as an adminstrator, close the Power BI Windows app and then open it again.

## Next steps
* [Download the Power BI app](https://go.microsoft.com/fwlink/?LinkID=526478) from the Windows Store  
* [What is Power BI?](../../fundamentals/power-bi-overview.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
