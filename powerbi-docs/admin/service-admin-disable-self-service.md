---
title: Enable or disable self-service sign-up and purchasing
description: How to information for admins to turn off the ability for users to sign up for Power BI service and purchase or upgrade a license.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 04/08/2020
ms.custom: licensing support
LocalizationGroup: Administration
---
# Enable or disable self-service sign-up and purchasing

In most organizations, self-service sign-up is enabled by default. Individual users in your organization can sign up for Power BI using their work or school account. Users may also be offered the option to directly purchase a Power BI Pro license if they try to use a feature that requires Pro. As an administrator, you determine whether to enable or disable self-service sign-up. You can also control whether users in your organization can make self-service purchases to get their own license.

> [!NOTE]
>If you acquired Power BI through a Microsoft Cloud Solution Provider (CSP), the setting might be disabled to block users from signing up individually. Your CSP may also be acting as the global admin for your organization, requiring that you contact them to help you change this setting.
>
>

You use PowerShell commands to change the settings that control self-service sign-up and purchasing. There are two settings that control whether users in your organization can do self-service sign-up or make self-service purchases.

- If you want to disable all self-service sign-ups, change a setting in Azure Active Directory named **AllowAdHocSubscriptions** by using Azure AD PowerShell commands. Follow the steps in this article to [enable or disable self-service signup](#enable-or-disable-self-service-signup). This option turns off self-service sign-up for *all* Microsoft cloud-based apps and services.

- If you want to prevent users from purchasing their own Pro license, change the **AllowSelfServicePurchase** setting using MSCommerce PowerShell commands. This setting lets you turn off self-service purchase for specific products. Follow the steps in this article to [enable or disable self-service purchase of Power BI Pro licenses](#enable-or-disable-self-service-purchase).

## Enable or disable self-service signup

If self-service sign-up is enabled, the value of **AllowAdHocSubscriptions** is *true*. Let's take a look at what happens when you change this setting to *false*:

- If you change the setting from true to false, new users in your organization are blocked from signing up individually. Any users that signed up for Power BI before you change the setting keep their licenses.

- If you change the setting to false, users that already have a Power BI (free) license can still sign up for an individual Power BI Pro trial.

- An admin needs to assign all Power BI licenses to new users who need one.

### Before you begin

These steps use Azure Active Directory PowerShell commands to change the value of the **AllowAdHocSubscriptions** setting. You must have the Azure AD PowerShell module installed for these commands to be available. For more information about using PowerShell, see [Getting started with Windows PowerShell](/powershell/scripting/getting-started/getting-started-with-windows-powershell).

To install the Azure AD module, start Windows PowerShell as an administrator. Make sure your local execution policy allows you to run scripts. If you run into problems, see [PowerShell execution policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies#powershell-execution-policies) to learn how to change your local policy.

Run the following command to install the Azure AD module:

```powershell
Install-Module MSOnline
```

### Change the self-service signup policy

In PowerShell, run the following command to connect to Azure AD:

```powershell
Connect-MsolService
```

Enter your admin credentials in the sign-in dialog, completing any two-factor authentication that may be needed. After verification, you're returned to the PowerShell window.

To view the current setting, run the following command. The output is piped to a formatted list by using the "fl" switch.

```powershell
Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
```

To change the current setting, run this command:

```powershell
Set-MsolCompanySettings -AllowAdHocSubscriptions $false
```

After running this command, self-service signup is disabled for all users. To turn it back on, run this command again and set the value to $true.

## Enable or disable self-service purchase

If self-service purchasing is enabled, the value of **AllowSelfServicePurchase** is *true*. Let's take a look at what happens when you change this setting to *false*:

- If you change the setting from true to false,  users in your organization are blocked from buying their own Power BI Pro license. Any users that bought a license before you change the setting keep their licenses.

- If you change the setting to false, users that have a Power BI (free) license can't get an individual Power BI Pro license. 

- An admin needs to assign a Pro license to all users that need one.

### Before you begin

These steps use MSCommerce PowerShell commands to change the value of the **AllowSelfServicePurchase** setting. You must have the MSCommerce PowerShell module installed for these commands to be available. For more information about using PowerShell, see [Getting started with Windows PowerShell](/powershell/scripting/getting-started/getting-started-with-windows-powershell).

To install the MSCommerce module, start Windows PowerShell as an administrator. Make sure your local execution policy allows you to run scripts. If you run into problems, see [PowerShell execution policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies#powershell-execution-policies) to learn how to change your local policy.

Run the following command to install the MSCommerce module:

```powershell
Install-Module -name MSCommerce
```

### Change the self-service signup policy

In PowerShell, run the following command to connect:

```powershell
Connect-MSCommerce
```

Enter your admin credentials in the sign-in dialog, completing any two-factor authentication that may be needed. After verification, the PowerShell window shows a successful connection.

To view the current setting, run the following command. To prevent text from truncating, the output is piped to a formatted list by using the "fl" switch.

```powershell
Get-MSCommercePolicy -PolicyId AllowSelfServicePurchase | fl
```

You can disable the setting that allows self-service purchase for an individual product by providing its **ProductId**. To change the current setting for the Power BI service, run this command:

```powershell
Update-MSCommerceProductPolicy -PolicyId AllowSelfServicePurchase -ProductId CFQ7TTC0L3PB -Enabled $False
```

After running this command, self-service purchase for Power BI is disabled for all users. To turn it back on, run this command again and set the value to $true.

## Next steps

For more information about the self-service purchase in Power BI and the rest of the Power Platform, see these articles:

- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq#admin-capabilities)
- [Use AllowSelfServicePurchase for the MSCommerce PowerShell module](/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell)