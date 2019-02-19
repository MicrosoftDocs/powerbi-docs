---
title: 'Fixing "Corporate SSL certificate is untrusted"'
description: When signing in to the Android app for Power BI, you may see the message, “Could not authenticate because your corporate SSL certificate is untrusted
.": ''
author: mshenhav
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 05/18/2018
ms.author: mshenhav

---
# Fixing "Corporate SSL certificate is untrusted" - Power BI
When signing in to the Android mobile app for Microsoft Power BI, you may see the message, “Could not authenticate because your corporate SSL certificate is untrusted by this device. Please contact your company IT admin.” 

What you need to do usually depends on the operating system on your Android device, but there are a couple of other issues that may cause this error.

## On Android 7 or later
Look for an update for an app named **Chrome**, and install the update.

## On Android 6 and earlier
Your device may need a updated version of System Webview. It may be installed on your device, and you may just need to click **Update**.

If System Webview isn't installed on your device:

1. On your Android device, close Power BI.
2. Open the Google Play Store and search for **System Webview** by Google Inc.
3. Install it.
4. Restart the Power BI app and sign in.

## Time-zone settings
Time-zone settings on your device may be wrong. 

Go to **Settings** > **System** > **Date and time** to check them.

## Custom authentication server
If you're using a custom authentication server, the SSL certificate in the corporate authentication server may not be valid. 
Please work with your organization's IT to test the corporate authentication server configuration, by following the guidance in [this article](https://support.microsoft.com/en-us/help/3203929/using-adal-to-authenticate-from-android-devices-fails-if-additional-ce).

## Next steps
* [Download the Android app](http://go.microsoft.com/fwlink/?LinkID=544867) from the Android app store.
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)

