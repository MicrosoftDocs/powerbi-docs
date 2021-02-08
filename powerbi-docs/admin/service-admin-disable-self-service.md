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

Self-service refers to the ability for individuals in an organization (work or school) to sign up to use services paid for by their organization's subscription, or use free services, without asking their organization to take action on their behalf. The individual goes to a Microsoft website, finds a cloud service that their organization offers, and uses their organizational email address to sign up for that service. 

In many cases, the organization has paid a fee for a subscription to that service. In other cases, the individual is the first user and becomes the admin for the service. For a trial or free license, no purchase is required. But for Power BI Pro, the organization is responsible for paying the monthly fee. 

As a Microsoft 365 admin, you can see who signs up for trials, licenses, and subscriptions.

> [!NOTE]
> Self-service sign-up is only applicable to commercial cloud customers, and not to national clouds or government customers.

## When to use self-service sign-up and purchase

### Self-service is a good idea: 

- In larger and decentralized organizations (work or school), where individuals are often given the flexibility to purchase SaaS (Software as a service) licenses for their own use. 
- For one-person or small organizations that need to purchase only one Power BI Pro license, or only a few licenses.
- For individuals interested in trying Power BI, getting proficient, before purchasing a subscription for the entire organization.
- For current users with a Power BI free license, who now want to create and share content and upgrade themselves to a Power BI Pro trial. 

### You may want to disable self-service when:

- Your organization has procurement processes in place to meet compliance, regulatory, security, and governance needs. You need to ensure that all Power BI Pro licenses are approved and managed according to defined processes. 
- Your organization has requirements for new Power BI Pro users, such as mandatory training or user acknowledgment of data protection policies.
- Your organization prohibits use of the Power BI service due to data privacy or other concerns and needs to control the assignment of Power BI free licenses very closely.
- to ensure that all Power BI Pro licenses fall under the enterprise agreement in order to take advantage of negotiated/discounted licensing rates.
- For current users with a Power BI free license, who are being prompted to try or directly purchase a Power BI Pro license. Your organization may not want these users to upgrade because of security, privacy, or expense.


## Enable and disable self-service

As an administrator, you determine whether to enable or disable self-service sign-up. You also determine whether users in your organization can make self-service purchases to get their own license. 

Turning off self-service sign-up keeps users from exploring Power BI for data visualization and analysis. If you block individual sign-up, you may want to get Power BI (free) licenses for your organization and assign them to all users. 

> [!NOTE]
>If you acquired Power BI through a Microsoft Cloud Solution Provider (CSP), the setting may be disabled to block users from signing up individually. Your CSP may also be acting as the global admin for your organization, requiring that you contact them to help you change this setting.
>


 You'll use PowerShell commands to change the settings that control self-service sign-up and purchasing. 

- If you want to disable all self-service sign-ups, change a setting in Azure Active Directory named **AllowAdHocSubscriptions** by using Azure AD PowerShell commands. Follow the steps in this article to [enable or disable self-service signup](#enable-or-disable-self-service-sign-up-for-your-organization). This option turns off self-service sign-up for *all* Microsoft cloud-based apps and services.

- If you want to prevent users from purchasing their own Pro license, change the **AllowSelfServicePurchase** setting using MSCommerce PowerShell commands. This setting lets you turn off self-service purchase for specific products. Follow the steps in this article to [enable or disable self-service purchase of Power BI Pro licenses](#enable-or-disable-self-service-purchase-in-your-organization).

## Enable or disable self-service sign-up for your organization

If self-service sign-up is enabled, the value of **AllowAdHocSubscriptions** is *true*. Let's take a look at what happens when you change this setting to *false*:

- New users in your organization are blocked from signing up individually. Any users who signed up for Power BI before you changed the setting keep their licenses.

- Users who already have a Power BI (free) license can still sign up for an individual Power BI Pro trial.

- An admin will have to assign all Power BI licenses to new users who need one.

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

## Enable or disable self-service purchase in your organization

If self-service purchasing is enabled, the value of **AllowSelfServicePurchase** is *true*. Let's take a look at what happens when you change this setting to *false*:

- Users in your organization are blocked from buying their own Power BI Pro license. Any users who bought a license before you changed the setting keep their licenses.

- Users who have a Power BI (free) license can't get an individual Power BI Pro license. 

- An admin needs to assign a Pro license to all users who need one.

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

## What to do if individuals have already used self-service

Self-service sign-up and purchase are both enabled by default. This makes it possible for individuals in your organization to already have Power BI licenses and subscriptions. Whether you take any action or not, you need a clear picture of what already exists.

Users who have joined your tenant via self-service sign-up get assigned a unique license that you can filter on within your active user pane in the admin dashboard. To create this new view, follow these steps.

1. Navigate to the Microsoft 365 admin center.

1. In the nav pane, select **Users** > **Active Users**.

1. On the Views menu, select **Add custom view**.

1. Name your new view, and under Assigned product license, select Power BI (free) or Power BI Pro.

    You can only have one license selected per view. If you have both Power BI (free) and Power BI Pro licenses in your organization, you can create two views.

1. Enter any other conditions you want, then select **Add**.

    After you create the new view, it's available from the Views menu.


    > [!NOTE]
    > If your organization doesn't have a Microsoft 365 environment connected to your email domain, self-service users were added to a new, cloud-only user directory. You may need to find, claim, and [take over tenants that were already created](https://docs.microsoft.com/azure/active-directory/users-groups-roles/domains-admin-takeover). 

## Next steps

For more information about the self-service purchase in Power BI and the rest of the Power Platform, see these articles:

- [Self-service purchase FAQ](/microsoft-365/commerce/subscriptions/self-service-purchase-faq#admin-capabilities)
- [Use AllowSelfServicePurchase for the MSCommerce PowerShell module](/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell)