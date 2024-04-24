---
title: 'Fixing "Corporate SSL certificate is untrusted"'
description: Learn how to resolve the message, "Could not authenticate because your corporate SSL certificate is untrusted."
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 01/17/2023
---

# Fixing "Corporate SSL certificate is untrusted" - Power BI

When signing in to the Android mobile app for Microsoft Power BI, you might see the message, "Could not authenticate because your corporate SSL certificate is untrusted by this device. Contact your company IT admin."

What you need to do usually depends on the operating system on your Android device, but there are a couple of other issues that can cause this error.

## Google Chrome version

The Google Chrome app on your device might need updating. Install the latest version of the Google Chrome app.

## Time-zone settings

Time-zone settings on your device might be wrong.

Go to **Settings** > **System** > **Date and time** to check them.

## Custom authentication server

If you're using a custom authentication server, the SSL certificate in the corporate authentication server might not be valid.
Work with your organization's IT to test the corporate authentication server configuration, by following the guidance in [this article](https://support.microsoft.com/help/3203929/using-adal-to-authenticate-from-android-devices-fails-if-additional-ce).

## Related content

- [Download the Android app](https://go.microsoft.com/fwlink/?LinkID=544867) from the Android app store.
- Questions? [Ask the Power BI Community](https://community.powerbi.com/)
