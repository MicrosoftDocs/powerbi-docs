---
title: 'Power BI app configuration settings'
description: Learn how to customize the behavior of Power BI mobile app using a supported mobile device management (MDM) tool.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 01/20/2023
---

# Remotely configure Power BI app using mobile device management (MDM) tool

The Power BI mobile app for iOS and Android supports app settings that allow administrators of mobile device management (MDM) services, such as Intune, to customize the behavior of the app.

The Power BI mobile app supports the following configuration scenarios:

- Report Server configuration (iOS and Android)
- Data protection settings (iOS and Android)
- Disable single sign-on (iOS and Android)
- Interaction settings (iOS and Android)

## Report server configuration (iOS and Android)

The Power BI app for iOS and Android allows administrators to remotely "push" the Report Server configuration to enrolled devices.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ServerURL | String | Report Server URL.<br><br>Should start with http/https.|
| com.microsoft.powerbi.mobile.ServerUsername | String | [optional]<br><br>The username to use for connecting the server.<br><br>If one does not exist, the app prompts the user to type the username for the connection.|
| com.microsoft.powerbi.mobile.ServerDisplayName | String | [optional]<br><br>Default value is "Report server".<br><br>A friendly name used in the app to represent the server. |
| com.microsoft.powerbi.mobile.OverrideServerDetails | Boolean | [optional]<br><br>Default value is True. When set to True, it overrides any Report Server definition already in the mobile device. Existing servers that are already configured are deleted. Override set to True also prevents the user from removing that configuration.<br><br>Set to False adds the pushed values, leaving any existing settings. If the same server URL is already configured in the mobile app, the app leaves that configuration as is. The app doesn't ask the user to reauthenticate for the same server. |

## Data protection settings (iOS and Android)

The Power BI mobile app for iOS and Android offers administrators the ability to customize the default configuration for security and privacy settings. For iOS, you can force users to provide their Face ID, Touch ID, or a passcode when accessing the Power BI mobile app. For Android, you can force users to use biometric authentication (Fingerprint ID).

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ForceDeviceAuthentication | Boolean | Default value is False. <br><br>Biometrics, such as TouchID, FaceID (iOS), or Fingerprint ID (Android), can be required for users to access the app on their device. When required, biometrics are used in addition to authentication.<br><br>If using app protection policies, Microsoft recommends disabling this setting to prevent dual access prompts. |

>[!NOTE]
>Data protection settings are applied only on Android devices that support biometric authentication.

## Disable single sign-on (iOS and Android)

By default the Power BI mobile app provides a convenient single sign-on experience for a user by minimizing the number of times the user has to provide a username and password. This single sign-on behavior is based on the assumption that the device is the user's personal device, and that there is only one user who uses the device and the apps on it.

Admins can turn on the **DisableSingleSignOn** setting in the app config file to remotely configure the app to disable single sign-on and explicitly ask for the user's password when they sign in.

This is an admin-only setting that is configured via remote configuration. The end user cannot change this setting.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.DisableSingleSignOn | Boolean | Default value is False.<br><br>After a user signs out, the app will not reuse existing credentials, but will ask the next user to provide a password in order to authenticate and connect to the Power BI service.
 |

## Interaction settings (iOS and Android)

The Power BI app for iOS and Android offers administrators the ability to configure interaction settings if it is decided that default interaction settings need to be changed across groups of users in an organization.

>[!NOTE]
>Not all the interactions are currently supported on all devices. See [Configure report interaction settings](mobile-app-interaction-settings.md) for a chart that shows the current availability across devices.

| Key | Type | Values | Description |
|---|---|---|---|
| com.microsoft.powerbi.mobile.ReportTapInteraction | String |  <nobr>single-tap</nobr><br><nobr>double-tap</nobr> | Configure whether a tap on a visual will also make a data point selection. |
| com.microsoft.powerbi.mobile.EnableMultiSelect | Boolean |  <nobr>True</nobr><br><nobr>False</nobr> | Configure whether a tap on a data point will replace the current selection or be added to the current selection. |
| com.microsoft.powerbi.mobile.RefreshAction | String |  <nobr>pull-to-refresh</nobr><br>button | Configure whether the user will have a button to refresh the report or should use pull to refresh. |
| com.microsoft.powerbi.mobile.FooterAppearance | String |  docked<br>dynamic | Configure whether the report footer will be docked to the bottom of the report or auto-hidden. |

## Deploy app configuration settings

The following are the steps you need to create an app configuration policy. Once you've created the configuration policy, you can assign its settings to groups of users.

1. Connect your MDM tool.
2. Create and name a new app configuration policy.
3. Choose which users to distribute this app configuration policy to.
4. Create key-value pairs for the setting you want to push to your users.

The Intune portal enables administrators to easily deploy these settings to the Power BI app via app configuration policies. However, any MDM provider is supported. If you are not using Intune, you'll need to consult with your MDM documentation about how to deploy these settings.

## Next steps

- Get the Power BI mobile app from the [App store](https://apps.apple.com/app/microsoft-power-bi/id929738808) and [Google play](https://play.google.com/store/apps/details?id=com.microsoft.powerbim&amp;amp;clcid=0x409)
- Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI)
- Join the conversation at the [Power BI Community](https://community.powerbi.com/)