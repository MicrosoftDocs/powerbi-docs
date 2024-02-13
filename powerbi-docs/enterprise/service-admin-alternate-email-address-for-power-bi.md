---
title: Use an alternate email address
description: Learn how to set up an alternate email address from Microsoft 365 or PowerShell.
author: mihart
ms.author: mihart
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: has-azure-ad-ps-ref
ms.topic: conceptual
ms.date: 02/08/2024
LocalizationGroup: Troubleshooting
---

# Use an alternate email address

When you sign up for Power BI, you provide an email address. By default, Power BI uses this address to send you updates about activity in the service. For example, when someone sends you a sharing invitation, it goes to this address. This is also the email address used for data alerts and subscriptions.

In some cases, you might want these emails delivered to an alternate email address rather than the one you signed up with. This article explains how to specify an alternate address in Microsoft 365 and in PowerShell. The article also explains how Microsoft Entra ID resolves an email address.

> [!NOTE]
> Specifying an alternate address doesn't affect which email address Power BI uses for e-mail subscriptions, service updates, newsletters, and other promotional communications. Those communications are always sent to the email address you used when you signed up for Power BI.

## Use Microsoft 365

To specify an alternate address in Microsoft 365, follow these steps. 

1. Open your [Microsoft account dashboard](https://account.microsoft.com). If the app prompts you, sign in with the email address and password you use for Power BI.

1. To add or remove an email alias, select **Edit account info**.

1. To edit which aliases can be used to sign in, select **Sign-in preferences**.

    If you can't edit your details, an admin manages your email address. Contact your admin to update your alternate email address.

If you have admin privileges, you can add an alternative email address. 

1. Open your [account portal.](myaccount.microsoft.com)
1. Select **Settings & Privacy** > **Privacy** and scroll down to **Contact preferences**.
1. Select **Contact preferences for admins only**.
1. Select **I would like emails sent to an alternative address**.  

## Use a Power Automate flow

https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-flow-integration

Just sign in -> My Flows -> Create from Blank -> Search "Power" -> select power bi "on trigger event" - Choose the Alert -> New Step -> Outlook (or some mail provider -> Choose action -> set up the email -> Create Flow

Using Flow would be a work around if you just want to email yourself. But it extends the functionality of an alert by allowing you to email to other users, groups, etc. You are not able to do that in PowerBI, and in those cases I wouldn't consider it a work around.

Actually I did just discover, that if you go to Manage Gateways, then you can change the contact address there.  I have not yet tested it but hopefully that will do it.

You can also use Microsoft Flow for data alerts from Power BI to send it to a Email distribution group.

 https://learn.microsoft.com/en-us/fabric/admin/service-admin-premium-capacity-notifications

Turn insight into action using Microsoft Flow and Power BI

## Use PowerShell

To specify an alternate address in PowerShell, use the [Set-AzureADUser](/powershell/module/azuread/set-azureaduser/) command.

```powershell
Set-AzureADUser -ObjectId john@contoso.com -OtherMails "otheremail@somedomain.com"
```

<a name='email-address-resolution-in-azure-ad'></a>

## Email address resolution in Microsoft Entra ID

To capture a Microsoft Entra embed token for Power BI, use one of three different types of email addresses:

* The main email address associated with your Microsoft Entra account

* The UserPrincipalName (UPN) email address

* The *other email address* array attribute

Power BI selects which email to use based on the following sequence:

1. If the mail attribute in the Microsoft Entra user object is present, then Power BI uses that mail attribute for the email address.

1. If the UPN email isn't a **\*.onmicrosoft.com** domain email address (the information after the "\@" symbol), then Power BI uses that mail attribute for the email address.

1. If the *other email address* array attribute in the Microsoft Entra user object is present, then Power BI uses the first email in that list (since there can be a list of emails in this attribute).

1. If none of the above conditions are present, then Power BI uses the UPN address.

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
