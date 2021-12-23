
---
title: Enable or disable self-service sign-up and purchasing
description: How to information for admins to turn off the ability for users to sign up for Power BI service and purchase or upgrade a license.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 12/23/2021
ms.custom: licensing support
LocalizationGroup: Administration
---
# Enable or disable self-service sign-up and purchasing

As an administrator, you determine whether to enable or disable self-service sign-up. You also determine whether users in your organization can make self-service purchases to get their own license. 

Turning off self-service sign-up keeps users from exploring Power BI for data visualization and analysis. If you block individual sign-up, you may want to get Power BI (free) licenses for your organization and assign them to all users. 

> [!NOTE]
>If you acquired Power BI through a Microsoft Cloud Solution Provider (CSP), the setting may be disabled to block users from signing up individually. Your CSP may also be acting as the global admin for your organization, requiring that you contact them to help you change this setting.

## When to use self-service sign-up and purchase

### Self-service is a good idea: 

- In larger and decentralized organizations (work or school), where individuals are often given the flexibility to purchase SaaS (Software as a service) licenses for their own use. 
- For one-person or small organizations that need to purchase only one Power BI Pro license, or only a few licenses.
- For individuals interested in trying Power BI, getting proficient, before purchasing a subscription for the entire organization.
- For current users with a Power BI free or Pro license, who now want to create and share content and upgrade themselves to a Power BI Premium Per User 60 day trial. 

### You may want to disable self-service when:

- Your organization has procurement processes in place to meet compliance, regulatory, security, and governance needs. You need to ensure that all licenses are approved and managed according to defined processes. 
- Your organization has requirements for new Power BI Pro or Premium Per User licensees, such as mandatory training or user acknowledgment of data protection policies.
- Your organization prohibits use of the Power BI service due to data privacy or other concerns and needs to control the assignment of Power BI free licenses very closely.
- to ensure that all Power BI Pro or Premium Per User licenses fall under the enterprise agreement in order to take advantage of negotiated/discounted licensing rates.
- For current users with a Power BI free license, who are being prompted to try or directly purchase a Power BI Pro license. Your organization may not want these users to upgrade because of security, privacy, or expense.


## Use PowerShell, Azure AD, and Microsoft 365 to enable and disable self-service

You'll use PowerShell commands to change the settings that control self-service sign-up and purchasing. 

- If you want to disable all self-service sign-ups, change a setting in Azure Active Directory named **AllowAdHocSubscriptions** by using MSOL PowerShell module. Follow the steps in this article to [Set MsolCompanySettings](/powershell/module/msonline/set-msolcompanysettings). This option turns off self-service sign-up for *all* Microsoft cloud-based apps and services.

- If you want to prevent users from purchasing their own Pro license, change the **AllowSelfServicePurchase** setting using MSCommerce PowerShell commands. This setting lets you turn off self-service purchase for specific products. Follow the steps in this article to [Use AllowSelfServicePurchase for the MSCommerce PowerShell module](/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell).
