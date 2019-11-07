---
title: 'Protect Power BI data with device native identification'
description: Learn how to configure your iOS app to require additional identification before you can access your Power BI data
author: mshenhav
manager: kfollis
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 06/07/2019
ms.author: mshenhav

---
# Protect Power BI app with Face ID, Touch ID, or passcode 

In many cases, the data managed in Power BI is confidential and needs to be protected and accessed by authorized users only. 

Power BI iOS app lets you protect your data by configuring additional identification. You'll need to provide Face ID, Touch ID, or a passcode every time you launch the app, or when you bring the app from the background to the foreground.

| ![iPhone](./media/tutorial-mobile-apps-ios-qna/iphone-logo-50-px.png) | ![iPad](./media/tutorial-mobile-apps-ios-qna/ipad-logo-50-px.png) |
|:--- |:--- |
| iPhones |iPads |

## Turn on Face ID, Touch ID, or passcode in app setting

To use additional identification in Power BI, go to the app setting under **Privacy and Security**. You'll see the option to turn on Face ID, Touch ID, or passcode, based on your device capabilities.

![Power BI iOS app setting page](./media/mobile-ios-native-secure-access/mobile-ios-native-secured-setting.png)

Once this setting is turned on, every time you launch Power BI or bring it from the background, it will ask you to provide your ID before you can access the app. 

The decision to ask for Face ID, Touch ID, or passcode is done by iOS, based on device capability. If your device supports Face ID, you'll need to use Face ID. If it supports Touch ID, you'll need to use Touch ID. If neither are supported, then you'll need to provide a passcode.

![Power BI iOS Face ID](./media/mobile-ios-native-secure-access/mobile-ios-native-secured-faceid.png)

## Use MDM to enforce Face ID, Touch ID, or passcode

Some organizations have security policies and compliance requirements that enforce additional identification before you can access business sensitive data. 

Power BI mobile iOS app allows admins to control that setting by pushing the app configuration settings from Microsoft Intune and other mobile device management (MDM) solutions. Admins can use the app protection policy to turn on this setting for all users or for a group of users.

|Key  |Type  |Description  |
|---------|---------|---------|
| com.microsoft.powerbi.mobile.ForceDeviceAuthentication | Boolean | Default value is False. <br>When set to True, the app will force the users to identify themselves with Face ID, Touch ID, or passcode before they're able to view any Power BI data in the app. Users who don't have Face ID, Touch ID, or a passcode configured on their device, will be required to configure it before being able to access Power BI.  |

## Next steps

[Use MDM to remotely configure Power BI iOS app](mobile-app-configuration.md)
