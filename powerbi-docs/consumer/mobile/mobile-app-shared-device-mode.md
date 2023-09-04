---
title: 'Power BI app configuration settings'
description: Learn about running the Power BI mobile app in shared device mode to support your organization's frontline workers who use shared devices.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 09/04/2023
---

# Set up shared device mode for the Power BI mobile app

The Power BI mobile apps for iOS and Android devices support shared device mode. With shared device mode, organizations can deploy the Power BI mobile app safely across a pool of shared devices without risk of exposing confidential data and personal information to unauthorized access after users sign out and return their device to the pool.

## What is Shared Device mode

Shared device mode is a feature of Azure Active Directory (Azure AD) that allows organizations to build and deploy applications that support frontline workers and educational scenarios that require shared Android and iOS devices.
With shared device mode, frontline workers can pick a device from their organization's pool of devices and sign in to "make it theirs" for the duration of their shift. This sign in is global - they are signed in to all supported apps. At the end of their shift, they sign out of the device (again, the sign out is global), and all their personal and company information is removed, so that the device can safely be returned to the device pool, clean and ready for the next user.

## App behavior in shared device mode

When the Power BI app is running in shared device mode, its behavior is slightly modified to better suit the frontline worker scenario.

* The welcome experience and intro tips are suppressed. 
* Notifications are generalized to exclude confidential and sensitive information such as specific data and personal information.

## Set up shared device mode

An organization's device administrators deploy their devices with the supported applications to their stores and workplaces through a mobile device management (MDM) solution such as Microsoft Intune. Part of the provisioning process is marking the device as a *Shared Device*. Administrators configure shared device mode by deploying the Microsoft Authenticator app and setting shared device mode through configuration parameters. After performing these steps, all applications that support shared device mode will use the Microsoft Authenticator application to manage its user state and provide security features for the device and organization.

Once your applications support shared device mode and include the required data and security changes, you can advertise them as being usable by frontline workers.

For more information about shared device mode and about setting it up for your organizations iOS and Android devices, see

* [Overview of shared device mode](/azure/active-directory/develop/msal-shared-devices)
* [Shared device mode for iOS devices](/azure/active-directory/develop/msal-ios-shared-devices)
* [Shared device mode for Android devices](/azure/active-directory/develop/msal-android-shared-devices)

## Considerations and limitations

* **Shortcuts**: Shortcuts remain and can be used by all users. Users can access the items the shortcuts point to if they have the required permissions for them.
* **Apple watch**: Apple watch integration is not possible for devices running in shared device mode.

## Next steps

* [Overview of shared device mode](/azure/active-directory/develop/msal-shared-devices)
* [Shared device mode for iOS devices](/azure/active-directory/develop/msal-ios-shared-devices)
* [Shared device mode for Android devices](/azure/active-directory/develop/msal-android-shared-devices)
* Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI)
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)