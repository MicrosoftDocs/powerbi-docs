<properties 
   pageTitle="Getting a "Could not authenticate because your corporate SSL certificate is untrusted" message"
   description="When signing in to the Android app for Power BI, you may see the message, “Could not authenticate because your corporate SSL certificate is untrusted"."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="erikre" 
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/16/2016"
   ms.author="maggies"/>

# "Could not authenticate because your corporate SSL certificate is untrusted"

When signing in to the Android mobile app for Microsoft Power BI, you may see the message, “Could not authenticate because your corporate SSL certificate is untrusted by this device. Please contact your company IT admin.” 

What you need to do usually depends on the operating system on your Android device, but there are a couple of other issues that may cause this error.

## On Android 7 or later

Look for an update for an app named **Chrome**, and install the update.

## On Android 6 and earlier

Your device may need a updated version of System Webview. It may be installed on your device, and you may just need to click **Update**.

If System Webview isn't installed on your device:

1. On your Android device, close Power BI.

3. Open the Google Play Store and search for **System Webview** by Google Inc.

3. Install it.

4. Restart the Power BI app and sign in.

## Time-zone settings

Time-zone settings on your device may be wrong. 

Go to **Settings** > **System** > **Date and time** to check them.

## Custom authentication server

If you're using a custom authentication server, the SSL certificate in the corporate authentication server may not be valid. Please contact your organization's IT admin to help you.

## See also

-  [Download the Android app](http://go.microsoft.com/fwlink/?LinkID=544867) from the Android app store.
-  [Get started with Power BI](powerbi-service-get-started.md)
- Questions? [Try asking the Power BI Community](http://community.powerbi.com/)
