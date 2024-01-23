---
title: Configure mobile apps with Microsoft Intune
description: Learn how to configure the Power BI mobile apps with Microsoft Intune. This includes how to add and deploy the application and how to create a mobile application policy to control security. 
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 12/30/2022
LocalizationGroup: Administration
---

# Configure mobile apps with Microsoft Intune

Microsoft Intune enables organizations to manage devices and applications. The Power BI mobile applications for iOS and Android integrate with Intune. This integration enables you to manage the application on your devices, and to control security. Through configuration policies, you can control items like requiring an access pin, how data is handled by the application, and even encrypting application data when the app isn't in use.

The Microsoft Power BI mobile app allows you to get access to your important business information. You can view and interact with your dashboards and reports for all your organization's managed devices and app business data. For more information about supported Intune apps, see [Microsoft Intune protected apps](/intune/apps/apps-supported-intune-apps).

## General mobile device management configuration

This article assumes that Intune is configured properly and you have devices enrolled with Intune. This article isn't meant as a full configuration guide for Intune. For more information about Intune, see [What is Intune?](/intune/fundamentals/what-is-intune).

Microsoft Intune can co-exist with Mobile Device Management (MDM) within Microsoft 365. If you're using MDM, the device will show as enrolled with MDM, but is available to manage in Intune.

Before end users use the Power BI app on their devices, an Intune admin must add the app to Intune and assign the app to end users.

> [!NOTE]
> After you configure Intune, background data refresh is turned off for the Power BI mobile app on your iOS or Android device. Power BI refreshes the data from the Power BI service on the web when you open the app.

## Step 1: Add the Power BI app to Intune

To add the Power BI app to Intune, follow the steps in the appropriate article:

- [Add iOS store apps to Microsoft Intune](/intune/apps/store-apps-ios)
- [Add Android store apps to Microsoft Intune](/intune/apps/store-apps-android)

## Step 2: Assign the app to your end users

After you've added the Power BI app to Microsoft Intune, assign the app to users and devices. It's important to note that you can assign an app to a device whether or not the device is managed by Intune.

To assign the Power BI app to users and devices, follow the steps in [Assign apps to groups with Microsoft Intune](/intune/apps/apps-deploy).

## Step 3: Create and assign app protection policies

App protection policies (APP) are rules that ensure an organization's data remains safe or contained in a managed app. A policy can be a rule that is enforced when the user attempts to access or move "corporate" data, or a set of actions that are prohibited or monitored when the user is in the app. A managed app is an app that has APP applied to it, and can be managed by Intune.

Mobile Application Management (MAM) app protection policies allow you to manage and protect your organization's data in an app. With MAM without enrollment (MAM-WE), a work or school-related app that contains sensitive data can be managed on almost any device, including personal devices in bring-your-own-device (BYOD) scenarios. For more information, see [App protection policies overview](/intune/apps/app-protection-policy).

To create and assign an app protection policy for the Power BI app, follow the steps in [How to create and assign app protection policies](/intune/apps/app-protection-policies).

## Step 4: Use the application on a device

Managed apps are apps that your company's support team can set up to help protect company data that you can access from the app. When you access company data in a managed app on your device, you might notice that the app works a little differently than what you expect. For example, you might not be able to copy and paste protected company data, or you might not be able to save that data to certain locations.

To understand how your end users can use the Power BI app on their device, review the steps in the following articles:

- [Work or school apps for iOS](/intune-user-help/use-managed-apps-on-your-device-ios#how-do-i-know-im-using-a-managed-apps)
- [Managed work and school apps for Android](/intune-user-help/use-managed-apps-on-your-device-android)

## Related content

- [How to create and assign app protection policies](/intune/app-protection-policies)
- [What are the Power BI mobile apps](../consumer/mobile/mobile-apps-for-mobile-devices.md)  

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
