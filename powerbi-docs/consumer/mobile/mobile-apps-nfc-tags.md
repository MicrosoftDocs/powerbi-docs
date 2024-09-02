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

Let's say you want to use NFC tags to help manage the inventory of a chain of bicycle stores, and you want to use NFC tags to help manage the inventory.You've got all the data you need in a Power BI report that you can filter in order to see the inventory of each store, and of each department in each store. NFC tags can make it easy for inventory takers to quickly get information about each section. To set this up, you could put an NFC tag next to each section that would open the Power BI report to the relevant data when the inventory taker taps their phone on the tag. , and you want to  want to register a report on an nfc tag to manage the inventory of a bicyle retail chain named Advaneture works. I plan to place the nfc tag next to the mountain bike section, so I begin by filtering the report to focus on this specifc product group. Register three dots, current state to get filter. Can choose full screen or regular.

You want to use NFC tags to help manage the inventory. Start by filtering the report to focus on the mountain bikes department, [register the report](#register-an-item-on-an-nfc-tag) on the NFC tag, and then place the tag next to the department. Repeat this process for all the departments in the store. Later, store employees can [tap the tag with their phone to open the report to the relevant data](#read-an-nfc-tag-to-access-an-item).

Now let's say that later you rearrange the store, moving the sports bikes to where the mountain bikes were and moving the mountain bikes to where the childrens bikes were. You don't have to move the NFC tags - you can just overwrite the previous report registration with a new one so that it now points to the relevant data.

Scan tap, done. Tag now configured this report filtered to mountain bikes. Now put the tag near the mountain bike section.

Once configured in desired location. Can use it to get quick access to the data. Can now do the same thing for the other product categories using other tags, and placing them in the right place.

Can overwrite if you want to configure a new report.

Let’s say you use a set of reports to manage an inventoary. You can create an app that contains several items, and then register the app on the tag. By tapping the tag, the app will open and then the user can choose the desired report. Another possibility for providing quick access to multiple items is to register the workspace or folder they’re. In this case tapping the tag will open the folder or workspace, afterwhich the user can choose their desired item. If they don’t have access to an item, they get the request access flow. 

Anyone with the Power BI app can read the tag. The app doesn’t need to be open while reading. When you get the push notification, if you tap it, the item will open immediately. In iOS, you can also open the scanner to read a tag by opening the more options menu and tapping Read NFC .



For frontline workers - could be used for inventory management, manufacturing, healthcare...
Different scenarios - an item per NFC tag, set of items (app, workspace, folder) in the entrance of a floor.
Use apps to share multiple items
Workspace example

Personas:
Someone sets up the tag
Readers

What can you register
Power BI reports, dashboards, apps, scorcards, workspaces, and folders.

## Requirements

* NFC tags: High quality NFC tags that are compatible with the NFC Data Exchange Format (NDEF). Minimum memory required: 504 bytes.
* Mobile device:
    * Mobile devices must be compatible to work with NFC and be able to read tags of types 1 through 5 that contain data in NDEF. Only compatible devices can see the Power BI mobile app NFC feature.
    * The Power BI mobile app must be installed on the device.
    * On Android devices, the NFC setting must be enabled.

## Register an item on an NFC tag

To enable users to be able to open an item by tapping their devices on an NFC tag, you first have to register the report on the tag.

> [!NOTE]
> When you register an item on an NFC tag, anything previously registered on the tag will be overwritten.

1. Launch the Power BI mobile app, open the item you want to register on the NFC tag. If the item is a report, filter the report as you want the users to see it when they open the report via the NFC tag.

1. Hold the device close to the tag, select the options menu, and tap **Register on an NFC tag (preview)**.

    :::image type="content" source="./media/mobile-apps-nfc-tags/register-nfc-option.png" alt-text="Screenshot showing the Register on an NFC tag option on the Power BI mobile app options menu." border="false":::

1. On the **Register on NFC tag** screen that appears, select your desired options and then tap **Start scanning NFC tag**.

    :::image type="content" source="./media/mobile-apps-nfc-tags/register-nfc-start-scanning.png" alt-text="Screenshot showing the Register on an NFC tag option on the Power BI mobile app options menu." border="false":::

    * **Register in full screen**: When users tap their devices on the tag, the registered item will open in full-screen mode. 
    * **Register this report in its current state** (this option is only available for reports): When users tap their devices on the tag, the report will open in the state you set up when you registered the report.

        > [!NOTE]
        > The current state is preserved for 180 days. If the tag isn't read during this time, the "current state" is forgotten and the report will open in the state it opens in in the Power BI service. Every time the tag is read, the current state (if any) is renewed for another 180 days.

## Read an NFC tag to access an item

To read the NFC tag, tap the tag with your device.

Tap the tag with your device.



iOS read flow - possibly Android as well
* Device setting to use NFC needs to be open in Android

## Related content

- [Tag barcode fields in Power BI Desktop to enable barcode-scan filtering in the mobile apps](../../transform-model/desktop-mobile-barcodes.md)
- [Get data from the real world with the Power BI mobile apps](mobile-apps-data-in-real-world-context.md)
