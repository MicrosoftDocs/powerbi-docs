---
title: 'Fixing "Corporate SSL certificate is untrusted"'
description: When signing in to the Android app for Power BI, you may see the message, "Could not authenticate because your corporate SSL certificate is untrusted
author: paulinbar
ms.author: painbar
.": ''
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 12/14/20202
---
# Fixing "Corporate SSL certificate is untrusted" - Power BI
When signing in to the Android mobile app for Microsoft Power BI, you may see the message, "Could not authenticate because your corporate SSL certificate is untrusted by this device. Contact your company IT admin." 

What you need to do usually depends on the operating system on your Android device, but there are a couple of other issues that may cause this error.

## Google Chrome version 
The the Google Chrome app on your device may need updating. Install the the latest version of the Google Chrome app.

## Time-zone settings
Time-zone settings on your device may be wrong.

Go to **Settings** > **System** > **Date and time** to check them.

## Custom authentication server
If you're using a custom authentication server, the SSL certificate in the corporate authentication server may not be valid. 
Work with your organization's IT to test the corporate authentication server configuration, by following the guidance in [this article](https://support.microsoft.com/help/3203929/using-adal-to-authenticate-from-android-devices-fails-if-additional-ce).

## Next steps
* [Download the Android app](https://go.microsoft.com/fwlink/?LinkID=544867) from the Android app store.
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/) 

