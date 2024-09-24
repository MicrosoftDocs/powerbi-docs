---
title: Connect data to physical locations with NFC tags
description: Learn how to set up NFC tags to connect real world locations with filtered BI information in the Power BI mobile app.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 09/24/2024
---

# Connect data to physical locations with NFC tags (preview)

Applies to:

| :::image type="icon" source="./media/mobile-apps-qr-code/ios-logo-40-px.png"::: | :::image type="icon" source="././media/mobile-apps-qr-code/android-logo-40-px.png"::: | :::image type="icon" source="././media/mobile-apps-qr-code/android-logo-40-px.png"::: |
|:--- |:--- |:--- |
|iPhones |Android phones |Android tablets |

The Power BI mobile apps support NFC tags. NFC tags are small, inexpensive, reusable devices about the size of a credit card that can store and communicate data securely over very short distances to other devices that support such communication, such as many mobile devices. With NFC support, you can register links your Power BI data on NFC tags and place the tags in locations where the data is needed, so that later, in those locations, others can access the data they need merely by holding their mobile device close to the tag.

This feature is useful in scenarios where frontline workers need quick access to data while out on location. For example, a retail outlet could place NFC tags on storage shelves. An inventory managers could then quickly access the inventory data relevent to a particular shelf merely by tapping their phone on the NFC tag placed on the shelf.

This article describes

* The requirements for using NFC tags with your Power BI mobile app.
* How to register Power BI content on a tag.
* How to read the tag in order to access the Power BI data that's been registered on it.

## Requirements

* NFC tags: High quality NFC tags that are compatible with the NFC Data Exchange Format (NDEF). Minimum memory required: 504 bytes.
* Mobile device:
    * Must be compatible to work with NFC and be able to read tags of types 1 through 5 that contain data in NDEF. Only compatible devices can see the Power BI mobile app NFC feature.
    * The Power BI mobile app must be installed on the device.
    * On Android devices, the NFC setting must be enabled.

## Register an item on an NFC tag

To enable users to be able to open an item by tapping their devices on an NFC tag, you first have to register it on the tag.

> [!NOTE]
> When you register an item on an NFC tag, anything previously registered on the tag will be overwritten.

1. Launch the Power BI mobile app, open the item you want to register on the NFC tag. You can register a Power BI report, dashboard, scrorecard, app, or workspace. If the item is a report, filter the report to display what you want the users to see when they open the report via the NFC tag.

1. Hold the device close to the tag, select the options menu, and tap **NFC (preview)**.

    :::image type="content" source="./media/mobile-apps-nfc-tags/register-nfc-option.png" alt-text="Screenshot showing the Register on an NFC tag option on the Power BI mobile app options menu." border="false":::

1. On the **Register on NFC tag** screen that appears, choose how you want to register the item and then select **Start scanning**.

    * **Register this report in its current state** (this option only appears for reports): When users tap their devices on the tag, the report will open as filtered when registered on the tag. The current state is preserved for 180 days. If the tag isn't read during this time, the "current state" is forgotten and the report will open in the state it opens in in the Power BI service. Every time the tag is read, the current state (if any) is renewed for another 180 days.

    * **Register in full screen**: When users tap their devices on the tag, the registered item will open in full-screen mode.

    :::image type="content" source="./media/mobile-apps-nfc-tags/register-nfc-start-scanning.png" alt-text="Screenshot showing the Register on an NFC tag option on the Power BI mobile app options menu." border="false":::

## Read an NFC tag to access an item

To read the NFC tag, tap the tag with your device.

Tap the tag with your device.



iOS read flow - possibly Android as well
* Device setting to use NFC needs to be open in Android

## Related content

- [Tag barcode fields in Power BI Desktop to enable barcode-scan filtering in the mobile apps](../../transform-model/desktop-mobile-barcodes.md)
- [Get data from the real world with the Power BI mobile apps](mobile-apps-data-in-real-world-context.md)
