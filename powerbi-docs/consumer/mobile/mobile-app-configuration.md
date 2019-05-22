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

These configuration scenarios only work with enrolled devices; however, any MDM provider is supported. If you are not using Intune, you'll need to consult with your MDM documentation on how to deploy these settings. For more information on the configuration keys, see [Configuration keys](#configuration-keys).

## Report server configuration

Power BI iOS app allows administrators to remotely "push" Report Server configuration with enrolled devices:

### General app configuration settings

Power BI iOS app offers administrators the ability to customize the default configuration for security and privacy setting.

<table>
<thead>
<tr class="header">
<th><strong>Setting</strong></th>
<th><strong>Default app behavior</strong></th>
<th><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="even">
<td>Require Biometrics to access the app</td>
<td>Off</td>
<td><p>Biometrics, such as TouchID or FaceID, can be required for users to access the app on their device. When required, biometrics are used in addition to the authentication method selected in this profile.</p>
<p>This setting is only available for Outlook for iOS.</p>
<p>If using App Protection Policies, Microsoft recommends disabling this setting to prevent dual access prompts.</p></td>
</tr>
</tbody>
</table>

### Deploying app configuration settings with Intune

The Intune portal enables administrators to easily deploy these settings to Power BI iOS app via App Configuration Policies.

The following steps will allow you to create an app configuration policy. After the configuration policy is created, you can assign its settings to groups of users.

![configuration policy settings](../../media/outlook_mobile_intune_6.PNG)

> [!IMPORTANT]
>When deploying app configuration policies to managed devices, issues can occur when multiple policies have different values for the same configuration key and are targeted for the same app and user. This is due to the lack of a conflict resolution mechanism for resolving the differing values. You can prevent this by ensuring that only a single app configuration policy for managed devices is defined and targeted for the same app and user.

#### Create an app configuration policy for Power BI app

1. Sign into the Azure portal.

2. Select **More Services** \> **Monitoring + Management** \> **Intune**.

3. On the **Client apps** blade of the Manage list, select **App configuration policies**.

4. On the **App Configuration policies** blade, choose **Add**.

5. On the **Add app configuration** blade, enter a **Name**, and optional **Description** for the app configuration settings.

6. For **Device enrollment** type, choose **Managed devices**.

7. For **Platform**, choose **iOS**.

8. For **Associated app**, choose **Select the required app**, and then, on the **Targeted apps** blade, choose **Power BI**.

9. Click **OK** to return to the **Add app configuration** blade.

10. Choose **Configuration Settings**. On the **Configuration** blade, select **Use configuration designer** for the **Configuration settings format**.

11. Configure the desired settings:

    - For **Focused Inbox**, choose from the available options: **Not configured** (default), **On** (app default), **Off**.
    - For **Require Biometrics to access the app**, choose from the available options: **Not configured** (default), **On**, **Off** (app default). Select **Yes** (app default) to allow the user to change the setting or choose **No** if you want to prevent the user from changing the setting's value. This setting is only available in Outlook for iOS. 
    > [!IMPORTANT]
    > If the account will be protected by an Intune App Protection Policy that requires a PIN to access the protected account, then the **Require Biometrics to access the app** setting should be disabled, otherwise the user will be prompted with multiple authentication prompts when accessing the app.

    - For **Save Contacts**, choose from the available options: **Not configured** (default), **On**, **Off** (app default). When selecting **On** or **Off**, administrators can choose to allow the user to change the app setting's value. Select **Yes** (app default) to allow the user to change the setting or choose **No** if you want to prevent the user from changing the setting's value.
    - For **External recipients MailTip**, choose from the available options: **Not configured** (default), **On** (app default), **Off**.
    - For **Default app signature**, choose from the available options: **Not configured** (default), **On** (app default), **Off**. 
    - For **Block external images**, choose from the available options: **Not configured** (default), **On**, **Off** (app default). When selecting **On** or **Off**, administrators can choose to allow the user to change the app setting's value. Select **Yes** (app default) to allow the user to change the setting or choose **No** if you want to prevent the user from changing the setting's value.

13. When you are done, choose **OK**.

14. On the **Add app configuration** blade, choose **Add**.

The newly created configuration policy will be displayed on the **App configuration** blade.

> [!NOTE]
> For **Managed devices** you will need to create a separate app configuration policy for each platform. Also, Outlook will need to be installed from the Company Portal for the configuration settings to take effect.

#### Assign the configuration policy settings that you created

You assign the settings to groups of users in Azure Active Directory. When a user has the Microsoft Outlook app installed, the app will be managed by the settings you have specified. To do this:

1. From the **Intune** blade, on the **Mobile apps** blade of the Manage list, select **App configuration policies**.

2. From the list of app configuration policies, select the one you want to assign.

3. On the next blade, choose **Assignments**.

4. On the **Assignments** blade, select the Azure AD group to which you want to assign the app configuration, and then choose **OK**.


## Data protection scenarios
Outlook for iOS and Android supports app configuration policies for the following data protection settings when the app is managed by Intune:
- Managing the use of wearable technology
- Managing mail and calendar reminder notifications on iOS
- Managing the contact fields synchronized to the native contacts app

These settings can be deployed to the app regardless of device enrollment status.

### Configure Wearables for Outlook for iOS and Android

By default, Outlook for iOS and Android supports wearable technology, allowing the user to receive message notifications and event reminders, and the ability to interact with messages and view daily calendars. Organizations that want to disable the ability to access corporate data on wearables can deploy the following key via App configuration policies.

|**Key**|**Value**|**Device Enrollment Type**|
|:-----|:-----|:-----|
|com.microsoft.intune.mam.areWearablesAllowed|This key specifies if Outlook data can be synchronized to a wearable device. Setting the value to false disables wearable synchronization. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: false|Managed apps|

### Configure Notifications for Outlook for iOS

The Apple notification architecture ensures notifications are mirrored on iOS devices and WatchOS. Which device shows the notification depends on the device state: if the Apple Watch is unlocked and on a wrist, while the iOS device is locked, then WatchOS will alert the user with the notification. Apple does not provide a mechanism where you can administratively control and prevent notifications on WatchOS while still allowing them to be delivered on iOS devices.

The following configuration settings will disable notifications completely on iOS and WatchOS. The disadvantage is that the end user will never see new mail notifications or calendar reminders on iOS devices. The user will have to launch the Outlook for iOS in order to discover new mail or see calendar appointments.

|**Key**|**Value**|**Device Enrollment Type**|
|:-----|:-----|:-----|
|com.microsoft.outlook.Mail.NotificationsEnabled|This key specifies if Outlook will allow mail notifications. Setting the value to false disables mail notifications. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: false|Managed apps|
|com.microsoft.outlook.Mail.NotificationsEnabled.UserChangeAllowed|This key specifies if the user can adjust the mail notification setting within the app. Setting the value to false prevents the user from adjusting the mail notification setting. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: false|Managed apps|
|com.microsoft.outlook.Calendar.NotificationsEnabled|This key specifies if Outlook will allow calendar reminder notifications. Setting the value to false disables calendar reminder notifications. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: false|Managed apps|
|com.microsoft.outlook.Calendar.NotificationsEnabled.UserChangeAllowed|This key specifies if the user can adjust the calendar reminder notification setting within the app. Setting the value to false prevents the user from adjusting the calendar reminder notification setting. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: false|Managed apps|

### Configure Contact Field Sync to native Contacts for Outlook for iOS and Android
<a name="contacts"> </a>

The settings in the following table allow you to control the contact fields that will synchronize between Outlook on iOS and Android and the native Contacts applications.

> [!NOTE]
> Outlook for Android supports bi-directional contact synchronization. However, if a user edits a field in the native contacts app that is restricted (such as the **Notes** field), then that data will not synchronize back into Outlook for Android.

|**Key**|**Value**|**Device Enrollment Type**|
|:-----|:-----|:-----|
|com.microsoft.outlook.ContactSync.AddressAllowed|This key specifies if the contact's address should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.BirthdayAllowed|This value specifies if the contact's birthday should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.CompanyAllowed|This key specifies if the contact's company name should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.DepartmentAllowed|This key specifies if the contact's department should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.EmailAllowed|This key specifies if the contact's email address should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.InstantMessageAllowed|This key specifies if the contact's instant messaging address should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.JobTitleAllowed|This key specifies if the contact's job title should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.NicknameAllowed|This key specifies if the contact's nickname should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.NotesAllowed|This key specifies if the contact's notes should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhoneHomeAllowed|This key specifies if the contact's home phone number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhoneHomeFaxAllowed|This key specifies if the contact's home fax number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhoneMobileAllowed|This key specifies if the contact's mobile phone number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhoneOtherAllowed|This key specifies if the contact's other phone number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhonePagerAllowed|This key specifies if the contact's pager phone number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhoneWorkAllowed|This value specifies if the work phone number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PhoneWorkFaxAllowed|This key specifies if the contact's work fax number should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.PrefixAllowed|This key specifies if the contact's name prefix should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|
|com.microsoft.outlook.ContactSync.SuffixAllowed|This key specifies if the contact's name suffix should be synchronized to native contacts. <br/> **Accepted values**: true, false  <br/> **Default if not specified**: true  <br/> **Example**: true|Managed apps|

### Deploying the configuration scenarios with Microsoft Intune

If you are using Microsoft Intune as your mobile device management provider, the following steps will allow you to create an app configuration policy. After the configuration is created, you can assign its settings to groups of users.

> [!NOTE]
> Intune managed apps will check-in with an interval of 30 minutes for Intune App Configuration Policy status, when deployed in conjunction with an Intune App Protection Policy. If an Intune App Protection Policy isn't assigned to the user, then the Intune App Configuration Policy check-in interval is set to 720 minutes.

#### Create an app configuration policy for Outlook for iOS and Android

1. Sign in to the Azure portal.

2. Select **More Services** \> **Monitoring + Management** \> **Intune**.

3. On the **Client apps** blade of the Manage list, select **App configuration policies**.

4. On the **App Configuration policies** blade, choose **Add**.

5. On the **Add app configuration** blade, enter a **Name**, and optional **Description** for the app configuration settings.

6. For **Device enrollment** type, choose **Managed apps**.

7. For **Associated app**, choose **Select the required app**, and then, on the **Targeted apps** blade, choose **Outlook** by selecting both the iOS and Android platform Outlook apps.

8. Click **OK** to return to the **Add app configuration** blade.

9. Choose **Configuration Settings**. On the **Configuration** blade, define the key and value pairs that will supply configurations for Outlook for iOS and Android. The key and value pairs you can define are covered in [Data protection scenarios](#data-protection-scenarios).

10. When you are done, choose **OK**.

11. On the **Add app configuration** blade, choose **Add**.

The newly created configuration policy will be displayed on the **App configuration** blade.

#### Assign the configuration settings that you created

You assign the settings to groups of users in Azure Active Directory. When a user has the Microsoft Outlook app installed, the app will be managed by the settings you have specified. To do this:

1. From the **Intune** blade, on the **Mobile apps** blade of the Manage list, select **App configuration policies**.

2. From the list of app configuration policies, select the one you want to assign.

3. On the next blade, choose **Assignments**.

4. On the **Assignments** blade, select the Azure AD group to which you want to assign the app configuration, and then choose **OK**.

## Configuration keys

### Account setup configuration

Outlook for iOS and Android offers administrators the ability to "push" account configurations to their Office 365 users. For more information on account setup configuration, see [Account setup with modern authentication in Exchange Online](https://docs.microsoft.com/exchange/clients-and-mobile-in-exchange-online/outlook-for-ios-and-android/setup-with-modern-authentication#account-setup-configuration-via-enterprise-mobility-management).

|**Key**|**Value**|**Device Enrollment Type**|
|:-----|:-----|:-----|
|com.microsoft.outlook.EmailProfile.EmailAddress|This key specifies the email address to be used for sending and receiving mail. <br/><br/> **Value type**: String <br/><br/> **Accepted values**: Email address <br/><br/> **Default if not specified**: \<blank\> <br/><br/> **Required**: Yes <br/><br/> **Example**: user@companyname.com|Managed devices|
|com.microsoft.outlook.EmailProfile.EmailUPN|This key specifies the User Principal Name or username for the email profile that will be used to authenticate the account. <br/><br/> **Value type**: String <br/><br/> **Accepted values**: UPN Address or username <br/><br/> **Default if not specified**: \<blank\> <br/><br/> **Required**: Yes <br/><br/> **Example**: userupn@companyname.com|Managed devices|
|com.microsoft.outlook.EmailProfile.AccountType|This key specifies the account type being configured based on the authentication model. <br/><br/> **Value type**: String <br/><br/> **Accepted values**: ModernAuth <br/><br/> **Required**: Yes <br/><br/> **Example**: ModernAuth| Managed devices|

### Organization allowed accounts mode settings

Outlook for iOS and Android offers administrators the ability to restrict email and storage provider accounts to only corporate accounts. For more information on organization allowed accounts mode, please see [Account setup with modern authentication in Exchange Online](https://docs.microsoft.com/exchange/clients-and-mobile-in-exchange-online/outlook-for-ios-and-android/setup-with-modern-authentication#organization-allowed-accounts-mode).

|**Key**|**Value**|**Platform**|**Device Enrollment Type**|
|:-----|:-----|:-----|:-----|
|IntuneMAMAllowedAccountsOnly|This key specifies the whether organization allowed account mode is active. <br/><br/> **Value type**: String <br/><br/> **Accepted values**: Enabled, Disabled <br/><br/> **Required**: Yes <br/><br/> **Value**: Enabled|iOS|Managed devices|
|IntuneMAMUPN|This key specifies the User Principal Name for the account. <br/><br/> **Value type**: String <br/><br/> **Accepted values**: UPN Address <br/><br/> **Required**: Yes <br/><br/> **Example**: userupn@companyname.com|iOS|Managed devices|
|com.microsoft.intune.mam.AllowedAccountUPNs|This key specifies the UPNs allowed for organization allowed account mode. <br/><br/> **Accepted values**: UPN Address <br/><br/> **Required**: Yes <br/><br/> **Example**: userupn@companyname.com|Android|Managed devices|

### General app configuration settings

Outlook for iOS and Android offers administrators the ability to customize the default configuration for several in-app settings.

|**Key**|**Value**|**Platform**|**Device Enrollment Type**|
|:-----|:-----|:-----|:-----|
|com.microsoft.outlook.Mail.FocusedInbox|This key specifies whether Focused Inbox is enabled. Setting the value to false will disable Focused Inbox. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: true <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android|Managed Devices|
|com.microsoft.outlook.Auth.Biometric|This key specifies whether FaceID or TouchID is required to access the app. Setting the value to true will enable biometric access. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: false <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS|Managed Devices|
|com.microsoft.outlook.Auth.Biometric.UserChangeAllowed|This key specifies whether the biometric setting can be changed by the end user. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: <br/><br/> true, false <br/><br/> **Default if not specified**: true <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS|Managed devices|
|com.microsoft.outlook.Contacts.LocalSyncEnabled|This key specifies whether the app should sync Outlook contacts to the native Contacts app. Setting the value to true will enable contact sync. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: false <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android|Managed devices|
|com.microsoft.outlook.Contacts.LocalSyncEnabled.UserChangeAllowed|This key specifies whether the contact sync setting can be changed by the end user. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: true <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android|Managed devices|
|com.microsoft.outlook.Mail.ExternalRecipientsToolTipEnabled|This key specifies whether the External Recipients MailTip is enabled. Setting the value to false will disable the MailTip. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: true <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android|Managed devices|
|com.microsoft.outlook.Mail.BlockExternalImagesEnabled|This key specifies whether external images are blocked by default. Setting the value to true will enable blocking external images. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: false <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android |Managed devices|
|com.microsoft.outlook.Mail.BlockExternalImagesEnabled.UserChangeAllowed|This key specifies whether the Block External Images setting can be changed by the end user. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: true <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android|Managed devices|
|com.microsoft.outlook.Mail.DefaultSignatureEnabled|This key specifies whether the app uses its default signature. Setting the value to false will disable the app's default signature. <br/><br/> **Value type**: Boolean <br/><br/> **Accepted values**: true, false <br/><br/> **Default if not specified**: true <br/><br/> **Required**: No <br/><br/> **Example**: false|iOS, Android|Managed devices|
