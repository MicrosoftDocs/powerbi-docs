---
title: 'Power BI iOS app configuration settings'
description: How to customize the behavior of Power BI for iOS using MDM tool
author: mshenhav
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: conceptual
ms.date: 06/07/2019
ms.author: mshenhav
---

# Remotely configure Power BI iOS app using mobile device management (MDM) tool

Power BI Mobile app for iOS supports app settings that allow administrators for Office 365 and mobile device management (MDM), such as Intune, to customize the behavior of the app.

Power BI Mobile app for iOS supports the following configuration scenarios:

- Report Server configuration
- Data protection settings

## Report server configuration

Power BI iOS app allows administrators to remotely "push" Report Server configuration with enrolled devices.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ServerURL | String | Report Server URL.<br><br>Should start with http/https.|
| com.microsoft.powerbi.mobile.ServerUsername | String | [optional]<br><br>The username to use for connecting the server.<br><br>If one does not exist, the app prompts the user to type the username for the connection.|
| com.microsoft.powerbi.mobile.ServerDisplayName | String | [optional]<br><br>Default value is “Report server”<br><br>A friendly name used in the app to represent the server. |
| com.microsoft.powerbi.mobile.OverrideServerDetails | Boolean | [optional]<br><br>Default value is True. When set to True, it overrides any Report Server definition already in the mobile device. Existing servers that are already configured are deleted. Override set to True also prevents the user from removing that configuration.<br><br>Set to False adds the pushed values, leaving any existing settings.If the same server URL is already configured in the mobile app, the app leaves that configuration as is. The app doesn't ask the user to reauthenticate for the same server. |

## Data protection setting

Power BI iOS app offers administrators the ability to customize the default configuration for security and privacy settings. You can force users to provide their Face ID, Touch ID, or a passcode when accessing Power BI app.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ForceDeviceAuthentication | Boolean | Default value is False. <br><br>Biometrics, such as TouchID or FaceID, can be required for users to access the app on their device. When required, biometrics are used in addition to authentication.<br><br>If using app protection policies, Microsoft recommends disabling this setting to prevent dual access prompts. |

## Deploying app configuration settings

The following steps will allow you to create an app configuration policy. After the configuration policy is created, you can assign its settings to groups of users.

1. Connect your MDM tool.

2. Create and name a new app configuration policy.

3. Choose which users to distribute this app configuration policy to.

4. Create key-value pairs for the setting you want to push to your users.

The Intune portal enables administrators to easily deploy these settings to Power BI iOS app via app configuration policies.
However, any MDM provider is supported. If you are not using Intune, you'll need to consult with your MDM documentation on how to deploy these settings.

### Next steps
Your feedback will help us decide what to implement in the future, so don’t forget to vote for other features that you would like to see in Power BI mobile apps. 

* Download the [Power BI iPhone mobile app](http://go.microsoft.com/fwlink/?LinkId=522062)
* Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI)
* Join the conversation at the [Power BI Community](http://community.powerbi.com/)
