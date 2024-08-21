---
title: Connect data to physical locations with NFC tags
description: Learn how to set up NFC tags to connect real world locations with filtered BI information in the Power BI mobile app.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 08/21/2024
---

# Connect data to physical locations with NFC tags (preview)

Scan barcodes in the real world to go directly to filtered BI information in the Power BI mobile app.

Applies to:

| :::image type="icon" source="./media/mobile-apps-qr-code/ios-logo-40-px.png"::: | :::image type="icon" source="./media/mobile-apps-qr-code/ios-logo-40-px.png"::: | :::image type="icon" source="././media/mobile-apps-qr-code/android-logo-40-px.png"::: | :::image type="icon" source="././media/mobile-apps-qr-code/android-logo-40-px.png"::: |
|:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets |




Connect between data and the physical world.
About
What is NFC

For frontline workers - could be used for inventory management, manufacturing, healthcare...
Different scenarios - an item per NFC tag, set of items (app, workspace, folder) in the entrance of a floor.

Personas:
Someone sets up the tag
Readers

What can you register
Power BI reports, dashboards, apps, scorcards, workspaces, and folders.

## Requirements

* NFC tags: High quality NFC tags that are compatible with the NFC Data Exchange Format (NDEF). Minimum memory required: 504 bytes.
* Mobile device:
    * Mobile devices must be compatible to work with NFC and be able to read tags of types 1 through 5 that contain data in NDEF. Only compatible devices can see the Power BI mobile app NFC feature.
    The * Power BI mobile app must be installed on the device.
    * On Android devices, the NFC setting must be enabled.

## Register 

1. Launch the Power BI mobile app and open the view you want to register on the NFC tag.

1. Hold the device close to the tag, select the options menu, and tap **Register on an NFC tag (preview)**.

    :::image type="content" source="./media/mobile-apps-nfc-tags/register-nfc-option.png" alt-text="Screenshot showing the Register on an NFC tag option on the Power BI mobile app options menu." border="false":::






> [!NOTE]
> When registering an item on an NFC tag, anything that was previously on the tag will be overwritten.
>
> Current state for reports is saved for 180 days if the tag is not read - exact details TBD

## Read an NFC tag Access data via an NFC tag

iOS read flow - possibly Android as well
* Device setting to use NFC needs to be open in Android

## Related content

- [Tag barcode fields in Power BI Desktop to enable barcode-scan filtering in the mobile apps](../../transform-model/desktop-mobile-barcodes.md)
- [Get data from the real world with the Power BI mobile apps](mobile-apps-data-in-real-world-context.md)
