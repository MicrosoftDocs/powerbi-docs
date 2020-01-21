---
title: 'Power BI app configuration settings'
description: How to customize the behavior of Power BI using MDM tool
author: paulinbar
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 01/15/2020
ms.author: painbar
---

# Remotely configure Power BI app using mobile device management (MDM) tool

The Power BI Mobile app for iOS and Android supports app settings that allow administrators of mobile device management (MDM) services, such as Intune, to customize the behavior of the app.

The Power BI Mobile app supports the following configuration scenarios:

* Report Server configuration (iOS and Android)
* Data protection settings (iOS and Android)
* Interaction settings (Android)

## Report server configuration (iOS and Android)

The Power BI app for iOS and Android allows administrators to remotely "push" the Report Server configuration to enrolled devices.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ServerURL | String | Report Server URL.<br><br>Should start with http/https.|
| com.microsoft.powerbi.mobile.ServerUsername | String | [optional]<br><br>The username to use for connecting the server.<br><br>If one does not exist, the app prompts the user to type the username for the connection.|
| com.microsoft.powerbi.mobile.ServerDisplayName | String | [optional]<br><br>Default value is “Report server”<br><br>A friendly name used in the app to represent the server. |
| com.microsoft.powerbi.mobile.OverrideServerDetails | Boolean | [optional]<br><br>Default value is True. When set to True, it overrides any Report Server definition already in the mobile device. Existing servers that are already configured are deleted. Override set to True also prevents the user from removing that configuration.<br><br>Set to False adds the pushed values, leaving any existing settings. If the same server URL is already configured in the mobile app, the app leaves that configuration as is. The app doesn't ask the user to reauthenticate for the same server. |

## Data protection settings (iOS and Android)

The Power BI app for iOS and Android offers administrators the ability to customize the default configuration for security and privacy settings. You can force users to provide their Face ID, Touch ID, or a passcode when accessing the Power BI app.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ForceDeviceAuthentication | Boolean | Default value is False. <br><br>Biometrics, such as TouchID or FaceID, can be required for users to access the app on their device. When required, biometrics are used in addition to authentication.<br><br>If using app protection policies, Microsoft recommends disabling this setting to prevent dual access prompts. |

## Interaction settings (Android)

The Power BI app for Android offers administrators the ability to configure interaction settings if it is decided that default interaction settings need to be changed across groups of users in an organization. 

| Key | Type | Values | Description |
|---|---|---|---|
| com.microsoft.powerbi.mobile.ReportTapInteraction | String |  <nobr>single-tap</nobr><br><nobr>double-tap</nobr> | Configure whether tap on visual will also make a data point selection. |
| ccom.microsoft.powerbi.mobile.RefreshAction | String |  <nobr>pull-to-refresh</nobr><br>button | Configure whether the user will have a button to refresh the report or should he use pull to refresh. |
| com.microsoft.powerbi.mobile.FooterAppearance | String |  docked<br>dynamic | Configure whether the report footer will be docked to the bottom of the report or auto hidden. |

## Deploying app configuration settings

The following are the steps you need to create an app configuration policy. Once you've created the configuration policy, you can assign its settings to groups of users.

1. Connect your MDM tool.
2. Create and name a new app configuration policy.
3. Choose which users to distribute this app configuration policy to.
4. Create key-value pairs for the setting you want to push to your users.

The Intune portal enables administrators to easily deploy these settings to the Power BI app via app configuration policies. However, any MDM provider is supported. If you are not using Intune, you'll need to consult with your MDM documentation about how to deploy these settings.

## Next steps

* Get the Power BI mobile app from the [App store](https://apps.apple.com/app/microsoft-power-bi/id929738808) and [Google play](https://play.google.com/store/apps/details?id=com.microsoft.powerbim&amp;amp;clcid=0x409)
* Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI)
* Join the conversation at the [Power BI Community](https://community.powerbi.com/)
