---
title: Enable or disable self-service sign-up and purchasing
description: How to information for admins to turn off the ability for users to sign up for Power BI service and purchase or upgrade a license.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 10/18/2022
ms.custom: licensing support
LocalizationGroup: Administration
---
# Enable or disable self-service sign-up and purchasing

Administrators can determine whether to enable or disable self-service sign-up. As an administrator, you can determine whether users in your organization can make self-service purchases to get their own license.

Turning off self-service sign-up keeps users from exploring Power BI for data visualization and analysis. If you block individual sign-up, you may want to get Power BI (free) licenses for your organization and assign them to all users.

> [!NOTE]
>If you acquired Power BI through a Microsoft Cloud Solution Provider (CSP), the setting might be disabled to block users from signing up individually. Your CSP can act as the global admin for your organization, requiring that you contact them to help you change this setting.

## When to use self-service sign-up and purchase

### Use self-service sign-up when

- Your large and decentralized organization (work or school) gives individuals the flexibility to purchase SaaS (Software as a service) licenses for their own use.
- Your one-person or small organization purchases only one or a few Power BI Pro licenses.
- Individuals want to try Power BI and become proficient before purchasing a subscription for the entire organization.
- Current users with a Power BI free or Pro license want to create and share content and upgrade to a Power BI Premium Per User 60 day trial.

### Disable self-service when

- Your organization has procurement processes that meet compliance, regulatory, security, and governance needs. Ensure that all licenses are approved and managed according to defined processes.
- Your organization has requirements for new Power BI Pro or Premium Per User licensees, such as mandatory training or user acknowledgment of data protection policies.
- Your organization prohibits use of the Power BI service due to data privacy or other concerns and needs to closely control the assignment of Power BI free licenses.
- You want to ensure that all Power BI Pro or Premium Per User licenses fall under an enterprise agreement that takes advantage of a negotiated or discounted licensing rate.
- Current users with a Power BI free license are prompted to try or directly purchase a Power BI Pro license. Your organization might not want these users to upgrade because of security, privacy, or expense.


## Use PowerShell, Azure AD, and Microsoft 365 to enable and disable self-service

Use PowerShell commands to change the settings that control self-service sign-up and purchasing.

- If you want to disable all self-service sign-ups: In Azure Active Directory, change the **AllowAdHocSubscriptions** setting using the MSOL PowerShell module. For instructions, see [Set MsolCompanySettings](/powershell/module/msonline/set-msolcompanysettings). This option turns off self-service sign-up for *all* Microsoft cloud-based apps and services.

- If you want to prevent users from purchasing their own Pro license: Change the **AllowSelfServicePurchase** setting using MSCommerce PowerShell commands. This setting turns off self-service purchase for specific products. For instructions, see [Use AllowSelfServicePurchase for the MSCommerce PowerShell module](/microsoft-365/commerce/subscriptions/allowselfservicepurchase-powershell).
