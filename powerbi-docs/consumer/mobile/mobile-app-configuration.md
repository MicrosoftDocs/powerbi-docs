---
title: 'Power BI iOS app configuration settings'
description: How to customize the behavior of Power BI for iOS using MDM tool
author: mshenhav
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: Howto
ms.date: 22/05/2019
ms.author: mshenhav
---

# Remotely configure Power BI iOS app using mobile device management (MDM) tool

 **Summary**: How to customize the behavior of Power BI for iOS using MDM tool.

Power BI Mobile app for iOS supports app settings that allow Office 365 and mobile device management (MDM), like Intune, administrators to customize the behavior of the app.

Power BI Mobile app for iOS supports the following configuration scenarios:

- Report Server configuration
- Data protection settings

## Report server configuration

Power BI iOS app allows administrators to remotely "push" Report Server configuration with enrolled devices.

<table>
<thead>
<tr class="header">
<th><strong>Key</strong></th>
<th><strong>Type</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr class="even">
<td>com.microsoft.powerbi.mobile.ServerURL</td>
<td>String</td>
    <td><p>Report Server URL.</p>
        <p>Should start with http/https.</p>
</td>
</tr>
<tr class="odd">
<td>com.microsoft.powerbi.mobile.ServerUsername</td>
<td>String</td>
    <td><p>[optiona]</p>
        <p>The username to use for connecting the server.</p> 
        <p>If one does not exist, the app prompts the user to type the username for the connection.</p>
</td>
</tr>
<tr class="even">
<td>com.microsoft.powerbi.mobile.ServerDisplayName</td>
<td>String</td>
    <td><p>[optional]</p>
        <p>Default value is “Report server” </p> 
        <p>A friendly name used in the app to represent the server.</p>
</td>
</tr>
    <tr class="odd">
<td>com.microsoft.powerbi.mobile.OverrideServerDetails</td>
<td>Boolean</td>
    <td><p>[optional]</p>
        <p>Default value is True</p> 
        <p>When set to “True”, it overrides any Report Server definition already in the mobile device. Existing servers that are already configured are deleted. 
Override set to True also prevents the user from removing that configuration.</p>
        <p>Set to “False” adds the pushed values, leaving any existing settings. 
If the same server URL is already configured in the mobile app, the app leaves that configuration as is. The app doesn't ask the user to reauthenticate for the same server.</p>
</td>
</tr>
</tbody>
</table>

## Data protection setting

Power BI iOS app offers administrators the ability to customize the default configuration for security and privacy setting. Forcing users to provide their Face ID, Touch ID, or a passcode when accessing Power BI app.

<table>
<thead>
<tr class="header">
<th><strong>Key</strong></th>
<th><strong>Type</strong></th>
<th><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr class="even">
<td>com.microsoft.powerbi.mobile.ForceDeviceAuthentication</td>
<td>Boolean</td>
<td>
     <p>Default value is False</p> 
    <p>Biometrics, such as TouchID or FaceID, can be required for users to access the app on their device. When required, biometrics are used in addition to the authentication.</p>
<p>If using App Protection Policies, Microsoft recommends disabling this setting to prevent dual access prompts.</p></td>
</tr>
</tbody>
</table>

## Deploying app configuration settings

The following steps will allow you to create an app configuration policy. After the configuration policy is created, you can assign its settings to groups of users.

1. Connect your MDM tool.

2. Create and name a new app configuration policy.

3. Choose which users to distribute this app configuration policy to.

4. Create key-value pairs for the setting you want to push to your users.

The Intune portal enables administrators to easily deploy these settings to Power BI iOS app via App Configuration Policies.
However, any MDM provider is supported. If you are not using Intune, you'll need to consult with your MDM documentation on how to deploy these settings.

