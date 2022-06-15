---
title: Troubleshoot the Power BI add-in for PowerPoint
description: Learn how to troubleshoot issues with the Power BI add-in for PowerPoint. 
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 06/13/2022
---

# Troubleshoot the Power BI add-in for PowerPoint

This article describes what to do if you get the following error when trying to use the Microsoft Power BI add-in.

![Screenshot of Cannot run Power B I add in error message.](./media/service-power-bi-powerpoint-add-in-troubleshoot/power-bi-add-in-error.png)

## Why am I getting this error?

The most likely reason for getting this error is that WebView2 isn't installed on your device. The Power BI storytelling add-in requires WebView2 to run Power BI in PowerPoint. If WebView2 isn't installed, you need to install it before you'll be able to use the add-in.

## What is WebView2?

Microsoft Edge WebView2 is a control used to provide web-based features in Microsoft 365 desktop applications such as PowerPoint. It uses Microsoft Edge as the rendering engine, and requires that Microsoft Edge WebView2 Runtime be installed on the device that is running the Office application. 

WebView2 comes standard on recent Windows versions, but may not be included in earlier versions. If your version of Windows doesn't include WebView2, you need to install it manually to be able to use the Power BI add-in.

See [Microsoft Edge WebView2](/deployoffice/webview2-install) and Microsoft 365 Apps to learn more about Office Add-ins runtime and WebView2.

## How to install WebView2?
It takes just a minute to install WebView2. You can get and install it from [Download Microsoft Edge WebView2](https://developer.microsoft.com/microsoft-edge/webview2/consumer/).

>[!NOTE]
> After installing WebView2, you might need to close and re-open all Office applications.

## I installed WebView2, but the Power BI storytelling add-in still doesn't run

If installing WebView2 didn't enable you to use the add-in, it may be because the Office build and/or Windows edition on your device don't meet minimum requirements. The following sections show you how to check your device's Office build and Windows edition. If you have sufficient privileges, and feel comfortable doing so, you can perform these updates yourself, if necessary. Otherwise contact your organization's system administrator.

First, check to make sure WebView2 is indeed installed. Open the add-in side menu, select **Security Info**. The Security Info window will appear.

![Screenshot of the add-in Security Info add-in side pane menu option.](./media/service-power-bi-powerpoint-add-in-troubleshoot/power-bi-add-in-security-info-menu-item.png)

![Screenshot of the add-in Security Info window that shows whether WebView2 is installed.](./media/service-power-bi-powerpoint-add-in-troubleshoot/power-bi-add-in-security-info-window.png)

If the Security Info window says **Runtime: Microsoft Edge**, WebView2 is installed. Proceed to check your Office build and Windows edition.

## Check your Office build and subscription type

In PowerPoint, choose **File > Account**, and then press **About PowerPoint**. The following info box will appear. Take note of the **build number** and the **subscription/non-subscription indication**.

![Screenshot of the about PowerPoint info pane.](./media/service-power-bi-powerpoint-add-in-troubleshoot/power-bi-add-in-about-powerpoint.png)

* If you have a Microsoft 365 Office subscription:
    * If the build number is 16.0.14326.xxxxx or later, your Office build meets minimum requirements. If your system meets minimum requirements and WebView2 is installed, but you still can't use the add-in, try [updating your Windows edition](#check-your-windows-version).
    * If the build number is 16.0.13530.20424 or later, but earlier than 16.0.14326.xxxxx, your Office build meets minimum requirements but someone with admin permissions on your device must [add a registry key](#adding-a-registry-key).
    * If the build number is earlier than 16.0.13530.20424, the Office build must be upgraded before you'll be able to use the add-in. See [Install Office updates](https://support.microsoft.com/office/install-office-updates-2ab296f3-7f03-43a2-8e50-46de917611c5).
* If you have a non-subscription version of Office, the Office version should be Office 2021 or later. If it's earlier, the Office build must be upgraded before you'll be able to use the add-in. See [Install Office updates](https://support.microsoft.com/office/install-office-updates-2ab296f3-7f03-43a2-8e50-46de917611c5).
## Check your Windows version

Open **File Explorer**, right-click **This PC**, and choose **Properties**. In the Windows specifications section, note the Windows edition.

![Screenshot of Windows specifications window.](./media/service-power-bi-powerpoint-add-in-troubleshoot/power-bi-add-in-windows-specification-window.png)
 
If you have a Microsoft 365 Office subscription, the Windows edition should be Windows 8.1, Windows 10, or Windows 11.

If you have a non-subscription version of Office, the Windows edition should be Windows 10 or Windows 11.

If the Windows edition on your device doesn't meet these requirements, you must [update Windows](https://support.microsoft.com/windows/get-the-latest-windows-update-7d20e88c-0568-483a-37bc-c3885390d212#:~:text=To%20check%20for%20updates%2C%20select,can%20choose%20to%20install%20them.) on your device to one of those editions.

## Adding a registry key

If you have a Microsoft 365 Office subscription, and the Office build on your device is 16.0.13530.20424 or later but earlier than 16.0.14326.xxxxx, someone with admin permissions on your device can create the following registry key to enable you to use the add-in.

```HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\WEF\Win32WebView2```

The key's value should be set to:

```dword:00000001```

### More resources

* [Browsers used by Office Add-ins](/office/dev/add-ins/concepts/browsers-used-by-office-web-add-ins)


## Next Steps

* [About Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI report pages to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI report pages in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)