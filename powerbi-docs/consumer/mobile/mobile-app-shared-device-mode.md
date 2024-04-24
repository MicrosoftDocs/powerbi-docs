---
title: 'Shared device mode for the Power BI mobile app'
description: Learn about running the Power BI mobile app in shared device mode to support your organization's frontline workers who use shared devices.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 01/09/2024
---

# Shared device mode for the Power BI mobile app

Many organizations maintain a pool of mobile devices that are shared between employees, often frontline workers, across tasks, shifts, or locations. Most mobile apps, however, are designed for single users, and optimize their experience for use by a single user, with single sign-on (SSO) across applications and keeping users signed in on their device.

This behavior isn't suitable for devices that are shared by multiple users. In the case of shared devices, employees expect to be able to pick out a device from the pool, "make it theirs" for the duration of their shift, and then, at the end of their shift, to be able to sign out from the device globally and have all their personal and company information removed so they can safely return the device to the pool.

**Shared device mode**, a feature of Microsoft Entra ID, enables this functionality. It enables single sign-on and device-wide sign-out and clears the user's data to prevent unauthorized or unintended access by the next user.

The Power BI mobile apps for iOS and Android devices support shared device mode. This means organizations can safely deploy the Power BI mobile app across their pool of shared devices without risk of exposing confidential data and personal information to unauthorized access after users sign out and return their device to the pool.

Here's how shared device mode works, using the Power BI mobile app as an example. When an employee signs on to the app at the start of their shift, they're automatically signed on to all other apps that support shared device mode on the device. At the end of their shift, when they sign out of the app, they're signed out globally from all other apps that support shared device mode. After sign-out, the employee's data and company data in the app and in all other apps that support shared device mode can no longer be accessed. The device is ready for the next employee and can be safely handed off.

## App behavior in shared device mode

Using the Power BI mobile app in shared device mode is just like using the app in standard, single user mode, with a few minor differences to better suit the frontline worker scenario:

* The welcome experience and intro tips are suppressed to enable an uninterrupted workflow for frontline workers.
* Notifications are generalized to exclude confidential and sensitive information such as specific data and personal information.

> [!NOTE]
> * **Shortcuts**: Shortcuts created by a user remain after they sign out, and can be used by all users. Users can access the items the shortcuts point to if they have the required permissions.
> * **Apple watch**: Apple watch integration isn't possible for devices running in shared device mode.

## Set up shared device mode

If your organization is already using shared device mode, no special configuration is required for the Power BI mobile apps. If shared device mode hasn't been set up, contact your organization's mobile device management team about getting it set up. Refer them to the following articles if they're unfamiliar with the feature:

* [Overview of shared device mode](/azure/active-directory/develop/msal-shared-devices)
* [Manage devices for frontline workers](/microsoft-365/frontline/flw-devices)

## Related content

* [Overview of shared device mode](/azure/active-directory/develop/msal-shared-devices)
* [Shared device mode for iOS devices](/azure/active-directory/develop/msal-ios-shared-devices)
* [Shared device mode for Android devices](/azure/active-directory/develop/msal-android-shared-devices)
* [Manage devices for frontline workers](/microsoft-365/frontline/flw-devices)
* Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI)
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)
