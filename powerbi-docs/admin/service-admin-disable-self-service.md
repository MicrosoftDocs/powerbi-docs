---
title: Enable or disable self-service sign-up and purchasing
description: How to information for admins to turn off the ability for users to sign up for Power BI service and purchase or upgrade a license.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 01/31/2021
ms.custom: licensing support
LocalizationGroup: Administration
---
# Enable or disable self-service sign-up and purchasing

## What is self-service?

Self-service refers to the ability for individuals in an organization (work or school) to sign up to use services paid for by their organization's subscription, or use free services, without asking their organization to take action on their behalf. The individual goes to a Microsoft website, finds a cloud service that their organization offers, and uses their organizational email address to sign up for that service. In most cases, the organization has paid a fee for a subscription to that service. 

When individuals use this method to sign up for cloud services like Power BI, an identity is automatically created for them in Azure Active Directory, based on their email domain. Microsoft validates their passwords and they can use Power BI immediately. Their organization pays a monthly fee for Power BI Pro, and there is no charge for a Power BI standard (free) license. 

As a Microsoft 365 admin, you can see who signed up for subscriptions. 

> [!NOTE]
> Self-service sign-up is only applicable to commercial cloud customers, and not to national clouds or government customers.

## When to use self-service sign-up and purchase

### Self-service is a good idea: 

- In larger and decentralized organizations (work or school), where individuals are often given the flexibility to purchase SaaS (Software as a service) licenses for their own use. 
- For one-person or small organizations that need to purchase only one Power BI Pro license, or only a few licenses.
- For individuals interested in trying Power BI, getting proficient, before purchasing a subscription for the entire organization.
- For current users with a Power BI free license, who now need to create and share content and need to upgrade to Power BI Pro. 

### You may want to disable self-service when:

- Your organization has procurement processes in place to meet compliance, regulatory, security, and governance needs. You need to ensure that all Power BI Pro licenses are approved and managed according to defined processes. 
- Your organization has requirements for new Power BI Pro users, such as mandatory training or user acknowledgement of data protection policies.
- Your organization prohibits use of the Power BI service due to data privacy or other concerns and needs to control the assignment of Power BI free licenses very closely.
- to ensure that all Power BI Pro licenses fall under the enterprise agreement in order to take advantage of negotiated/discounted licensing rates.
- For current users with a Power BI free license, who are being prompted to try or directly purchase a Power BI Pro license. Your organization may not want these users to upgrade because of security, privacy, or expense.



> [!NOTE]
>If you acquired Power BI through a Microsoft Cloud Solution Provider (CSP), the setting may be disabled to block users from signing up individually. Your CSP may also be acting as the global admin for your organization, requiring that you contact them to help you change this setting.
>

## Enable and disable self-service

As an administrator, you determine whether to enable or disable self-service sign-up. You also determine whether users in your organization can make self-service purchases to get their own license.

 You'll use PowerShell commands to change the settings that control self-service sign-up and purchasing. 

- If you want to disable all self-service sign-ups, change a setting in Azure Active Directory named **AllowAdHocSubscriptions** by using Azure AD PowerShell commands. Follow the steps in this article to [enable or disable self-service signup](#enable-or-disable-self-service-sign-up-for-your-organization). This option turns off self-service sign-up for *all* Microsoft cloud-based apps and services.

- If you want to prevent users from purchasing their own Pro license, change the **AllowSelfServicePurchase** setting using MSCommerce PowerShell commands. This setting lets you turn off self-service purchase for specific products. Follow the steps in this article to [enable or disable self-service purchase of Power BI Pro licenses](#enable-or-disable-self-service-purchase-in-your-organization).

## Enable or disable self-service sign-up for your organization

If self-service sign-up is enabled, the value of **AllowAdHocSubscriptions** is *true*. Let's take a look at what happens when you change this setting to *false*:

- New users in your organization are blocked from signing up individually. Any users who signed up for Power BI before you changed the setting keep their licenses.

- Users who already have a Power BI (free) license can still sign up for an individual Power BI Pro trial.

- An admin will have to assign all Power BI licenses to new users who need one.

### Before you begin

These steps use Azure Active Directory PowerShell commands to change the value of the **AllowAdHocSubscriptions** setting. You must have the Azure AD PowerShell module installed for these commands to be available. For more information about using PowerShell, see [Getting started with Windows PowerShell](/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-7).

To install the Azure AD module, start Windows PowerShell as an administrator. Make sure your local execution policy allows you to run scripts. If you run into problems, see [PowerShell execution policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7#powershell-execution-policies) to learn how to change your local policy.

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

## Enable or disable self-service purchase in your organization

If self-service purchasing is enabled, the value of **AllowSelfServicePurchase** is *true*. Let's take a look at what happens when you change this setting to *false*:

- Users in your organization are blocked from buying their own Power BI Pro license. Any users who bought a license before you changed the setting keep their licenses.

- Users who have a Power BI (free) license can't get an individual Power BI Pro license. 

- An admin needs to assign a Pro license to all users who need one.

### Before you begin

These steps use MSCommerce PowerShell commands to change the value of the **AllowSelfServicePurchase** setting. You must have the MSCommerce PowerShell module installed for these commands to be available. For more information about using PowerShell, see [Getting started with Windows PowerShell](/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-7).

To install the MSCommerce module, start Windows PowerShell as an administrator. Make sure your local execution policy allows you to run scripts. If you run into problems, see [PowerShell execution policies](/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7#powershell-execution-policies) to learn how to change your local policy.

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

- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide#admin-capabilities)
- [Use AllowSelfServicePurchase for the MSCommerce PowerShell module](/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell?view=o365-worldwide)