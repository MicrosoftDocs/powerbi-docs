---
title: Scan a Power BI QR code from your mobile device
description: Learn how QR codes in Power BI can connect anything in the real world directly to related content in the Power BI mobile app for iPhones and Android devices.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 01/17/2023
---

# Scan a Power BI QR code from your mobile device

Applies to:

| :::image type="icon" source="./media/mobile-apps-qr-code/ios-logo-40-px.png"::: | :::image type="icon" source="./media/mobile-apps-qr-code/ios-logo-40-px.png"::: | :::image type="icon" source="././media/mobile-apps-qr-code/android-logo-40-px.png"::: | :::image type="icon" source="././media/mobile-apps-qr-code/android-logo-40-px.png"::: |
|:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets |

QR codes can be used to connect items in the real world directly to relevant Power BI content. When you scan a QR code that was created for a Power BI report or dashboard tile, that report or tile will open directly &mdash; you won't have to navigate to it or search for it.

Say someone in your organization has created a QR code for a report that contains information about the conference rooms in your workplace and has posted it outside the conference rooms. Using the camera in the Power BI app, you can scan the QR code to open the report. If you don't have permissions to view the report, you'll be able to request access directly from the app.

The Power BI mobile app supports QR codes with [URL query parameters](../../collaborate-share/service-url-filters.md). If the QR code for a report includes such parameters, the report will open filtered according to those parameters.

> [!NOTE]
> You can also [scan a report QR code with the Power BI for Mixed Reality app](./mobile-hololens2-app.md#open-reports-with-qr-codes).

## Scan a Power BI QR code on your mobile device with the Power BI scanner

1. On the app header, tap the camera icon.

    :::image type="content" source="media/mobile-apps-qr-code/power-bi-camera.png" border="false" alt-text="Screenshot of the Power BI camera icon in the app header.":::

2. If your camera is not enabled for the app, you'll need to allow the Power BI app to use the camera. This is a one-time operation.

3. When the scanner opens, point it at the Power BI QR code.

    :::image type="content" source="media/mobile-apps-qr-code/power-bi-align-qr-code.png" alt-text="Screenshot of a news print, showing the scanner pointing to a Power BI QR code.":::

4. The report or tile will open directly. If you have an iOS device and are scanning a QR code for a tile, the tile won't open directly, but rather will appear to float over the background in augmented reality. Tap the floating tile to open it in focus mode.

    :::image type="content" source="media/mobile-apps-qr-code/power-bi-ios-qr-ar-scanner.png" alt-text="Screenshot of a report, showing it hovering over the news print.":::

## Scan a QR code from an external scanner on your mobile device

1. From any scanner installed on your mobile device, point the scanner at the relevant Power BI QR code to immediately open the associated report or tile.

2. If the Power BI app isn't installed on your device, you'll be redirected to the [Apple App Store (iOS)](https://go.microsoft.com/fwlink/?LinkId=522062) or to [Google Play (Android)](https://go.microsoft.com/fwlink/?LinkID=544867) to download and install the app on your mobile device.

## Related content

* [Connect to Power BI data from the real world](mobile-apps-data-in-real-world-context.md) with the mobile apps
* [Create a QR code for a report in the Power BI service](../../create-reports/service-create-qr-code-for-report.md)
* [Create a QR code for a tile in the Power BI service](../../create-reports/service-create-qr-code-for-tile.md)
* You can also [scan a QR code with the Power BI for Mixed Reality app](./mobile-hololens2-app.md)
* Questions? [Ask the Power BI Community](https://community.powerbi.com/)
