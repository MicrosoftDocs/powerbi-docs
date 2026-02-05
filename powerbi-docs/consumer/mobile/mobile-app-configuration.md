---
title: Configure Power BI Mobile App Settings With MDM
description: Configure Power BI mobile app settings remotely with an MDM tool to enforce security, interaction, and launch options. Learn keys and deploy today.
author: dknappettmsft 
ms.author: daknappe
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
---

# Configure Power BI Mobile App Settings With MDM

The Power BI mobile app for iOS and Android lets MDM admins remotely configure report server, security, interaction, and launch item settings. This article lists the supported configuration keys and deployment steps.

The Power BI mobile app supports these configuration scenarios:

- Power BI Report Server configuration (iOS and Android)
- Data protection settings (iOS and Android)
- Disable single sign-on (iOS and Android)
- Interaction settings (iOS and Android)
- Launch item configuration (iOS and Android)

## Report server configuration (iOS and Android)

The Power BI app for iOS and Android allows administrators to remotely "push" the Report Server configuration to enrolled devices.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ServerURL | String | Report server URL. Start with http or https.|
| com.microsoft.powerbi.mobile.ServerUsername | String | Optional. Username for connecting to the server. If none exists, the app prompts the user to enter one.|
| com.microsoft.powerbi.mobile.ServerDisplayName | String | Optional. Default value: Report server. Friendly name shown in the app for the server.|
| com.microsoft.powerbi.mobile.OverrideServerDetails | Boolean | Optional. Default value: True. When True, it overrides any report server definition on the device, deletes existing configured servers, and prevents the user from removing the configuration. When False, it adds the pushed values and keeps existing settings. If the same server URL is already configured, the app keeps that configuration and doesn't prompt the user to authenticate again.|

## Data protection settings (iOS and Android)

The Power BI mobile app for iOS and Android lets admins set default security and privacy settings. On iOS, require Face ID, Touch ID, or a passcode to access the Power BI mobile app. On Android, require biometric authentication (fingerprint).

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ForceDeviceAuthentication | Boolean | Default value: false. <br><br>Require biometrics—Touch ID or Face ID on iOS, or fingerprint on Android—to access the app. When enabled, the app prompts for biometric verification after sign-in.<br><br>If you use app protection policies, disable this setting to avoid duplicate prompts. |

>[!NOTE]
>Data protection settings apply only to Android devices that support biometric authentication.

## Disable single sign-on (iOS and Android)

By default, the Power BI mobile app gives a single sign-on experience by minimizing how often a user enters a username and password. This behavior assumes the device is the user's personal device and only one user uses the device and its apps.

Admins turn on the **DisableSingleSignOn** setting in the app configuration file to disable single sign-on and prompt for the user's password at sign-in.

This admin-only setting is managed through remote configuration. The end user can't change it.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.DisableSingleSignOn | Boolean | Default value is false.<br><br>After a user signs out, the app doesn't reuse credentials and asks the next user to enter a password to authenticate and connect to the Power BI service.|

## Interaction settings (iOS and Android)

The Power BI app for iOS and Android lets admins change default interaction settings for groups of users across the organization.

>[!NOTE]
>Not all interactions are supported on every device. See [Configure report interaction settings](mobile-app-interaction-settings.md) for a chart of current availability.

| Key | Type | Values | Description |
|---|---|---|---|
| com.microsoft.powerbi.mobile.ReportTapInteraction | String |  <nobr>single-tap</nobr><br><nobr>double-tap</nobr> | Set whether a tap on a visual also selects a data point. |
| com.microsoft.powerbi.mobile.EnableMultiSelect | Boolean |  <nobr>True</nobr><br><nobr>False</nobr> | Set whether tapping a data point replaces the current selection or adds to it. |
| com.microsoft.powerbi.mobile.RefreshAction | String |  <nobr>pull-to-refresh</nobr><br>button | Set how users refresh the report: button or pull to refresh. |
| com.microsoft.powerbi.mobile.FooterAppearance | String |  docked<br>dynamic | Set whether the report footer is docked at the bottom or hidden automatically. |

## Launch item configuration (iOS and Android)

If users in a group need quick access to a specific report, dashboard, scorecard, or app, admins configure that item as a [launch item](./mobile-apps-launch-item.md) for them. A launch item opens at app startup instead of the usual home page. Launch items save time by taking users directly to the content they need. Users don't need to navigate to it each time they open the app.

When an admin configures a launch item for a group, those users can accept or reject it. If they reject it, they can set their own launch item or use none.

A launch item can be a report, a specific report page, a dashboard, a scorecard, an app, or a specific report within an app. To open the launch item for users in full-screen mode, include the query parameter *?fullScreen=1* in the URI that specifies the launch item.

| Key | Type | Description |
|---|---|---|---|
| com.microsoft.powerbi.mobile.LaunchItemURI | URI/String | Any valid URI to a report, report page, dashboard, scorecard, app, or report within an app. |

Get a valid URL by using one of these methods:

- Open the launch item in the Power BI service, then copy the URL from the browser address bar.
- Copy the link from the item's **Share** option.
- For apps, get it [from within the app](./mobile-apps-deep-link-specific-location.md#links-to-apps-and-items-in-apps).

For more information about launch items, see [Choose a launch item for your Power BI mobile app](./mobile-apps-launch-item.md).

## Report server configuration user flow

Preconfigure on-premises Power BI Report Server connections through MDM so users don't enter server details manually.

| Key | Type | Description |
|---|---|---|
| com.microsoft.powerbi.mobile.ServerURL | String | Report Server URL (http or https). |
| com.microsoft.powerbi.mobile.ServerUsername | String | Optional username if you don't use integrated authentication. |
| com.microsoft.powerbi.mobile.ServerDisplayName | String | Optional friendly name. Default is "Report server". |
| com.microsoft.powerbi.mobile.OverrideServerDetails | Boolean | True (default) replaces existing definitions and prevents removal. False appends without deleting existing ones. |

User flow

1. Launch the app and sign in or connect with the pushed server when prompted.
1. Enter credentials if prompted.
1. The server appears in the list. If `OverrideServerDetails=true`, you can't delete it.

To change or remove the server, push an updated policy or remove the configuration profile.

## Deploy app configuration settings

Create an app configuration policy with these steps. After you create the policy, assign its settings to user groups.

1. Connect to your MDM tool.
1. Create and name a new app configuration policy.
1. Select the user groups to assign the app configuration policy.
1. Add the key-value pairs for the settings you want to push to users.

In the Intune portal, deploy these settings to the Power BI app by selecting **Apps** > **App configuration policies** > **Add** > **Managed devices**. For more information, see [Add app configuration policies for managed iOS/iPadOS devices](/mem/intune/apps/app-configuration-policies-use-ios). Any MDM provider is supported. If you don't use Intune, see your MDM provider's documentation for deployment steps.

## Related content

- Get the Power BI mobile app from the [App Store](https://apps.apple.com/app/microsoft-power-bi/id929738808) and [Google Play](https://play.google.com/store/apps/details?id=com.microsoft.powerbim&amp;amp;clcid=0x409).
- Follow [@MSPowerBI on Twitter](https://twitter.com/MSPowerBI).
- Join the conversation at the [Power BI Community](https://community.powerbi.com/).
