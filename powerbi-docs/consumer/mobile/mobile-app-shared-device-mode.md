---
title: 'Shared device mode for the Power BI mobile app'
description: Learn about running the Power BI mobile app in shared device mode to support your organization's frontline workers who use shared devices.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 09/05/2023
---

# Shared device mode for the Power BI mobile app (preview)

The Power BI mobile apps for iOS and Android devices support shared device mode. With shared device mode, organizations can deploy the Power BI mobile app safely across a pool of devices shared by multiple users without risk of exposing confidential data and personal information to unauthorized access after users sign out and return their device to the pool.

## What is shared device mode

Shared device mode is a feature of Azure AD that enables you to configure devices to be shared by employees. This feature enables single sign-on (SSO) and device-wide sign out for the Power BI mobile app and all other apps that support shared device mode. When a device is in shared device mode, applications that leverage Microsoft Authentication Library (MSAL) can detect that they're running on a shared device and determine who the current active user is. With this information, applications can accomplish these authentication controls:

* **Automatic single sign-on**: If a user has already signed into another MSAL application, the user will be logged into any application compatible with shared device mode.
* **Single sign-out**: When a user signs out of an app using MSAL, all other applications integrated with shared device mode can stop background processes and commence sign-out data clearing processes to prevent unauthorized or unintended access by the next user.

Here's how shared device mode works, using the Power BI mobile app as an example. When an employee signs in to the app at the start of their shift, they're automatically signed in to all other apps that support shared device mode on the device. At the end of their shift, when they sign out of the app, they're signed out globally from all other apps that support shared device mode. After sign out, the employee's data and company data in the app and in all other apps that support shared device mode can no longer be accessed. The device is ready for the next employee and can be safely handed off.

## App behavior in shared device mode

Using the Power BI mobile app in shared device mode is just like using the app in standard, single user mode, with a few minor differences to better suit the frontline worker scenario:

* The welcome experience and intro tips are suppressed. The assumption here is that those features are more of a hindrance than a help for frontline workers who use the app for their work on a daily basis. 
* Notifications are generalized to exclude confidential and sensitive information such as specific data and personal information. This is done because notifications are asynchronous and can conceivably arrive at the device after the user has signed out. Generalizing the notifications reduces the chance of sensitive or confidential data or information being exposed to unauthorized users.

> [!NOTE]
> * **Shortcuts**: Shortcuts created by a user remain after they sign out, and can be used by all users. Users can access the items the shortcuts point to if they have the required permissions.
> * **Apple watch**: Apple watch integration isn't possible for devices running in shared device mode.

## Set up shared device mode

If your organization is already using shared device mode, no special configuration is required for the Power BI mobile apps. If shared device mode hasn't been set up, contact your organization's mobile device management team about getting it set up. Refer them to [Overview of shared device mode](/azure/active-directory/develop/msal-shared-devices) if they are unfamiliar with the feature.

## Related content

* [Overview of shared device mode](/azure/active-directory/develop/msal-shared-devices)
* [Shared device mode for iOS devices](/azure/active-directory/develop/msal-ios-shared-devices)
* [Shared device mode for Android devices](/azure/active-directory/develop/msal-android-shared-devices)
* Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI)
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)