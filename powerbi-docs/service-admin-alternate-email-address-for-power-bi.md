---
title: Using an alternate Email Address
description: Using an alternate Email Address
services: powerbi
documentationcenter: ''
author: markingmyname
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 08/09/2017
ms.author: maghan

LocalizationGroup: Troubleshooting
---
# Using an alternate Email Address
By default, the email address you used to sign up to Power BI with is used to send you updates about activity in Power BI.  For example, when someone sends you a sharing invitation it will go to this address.

Sometimes you may want these emails delivered to an alternate email address rather than the one you originally used to sign up for Power BI with.

## Updating through Office 365 personal info page
1. Go to your [Office 365 personal info page](https://portal.office.com/account/#personalinfo).  If you are prompted to, sign in with the email address and password you use for Power BI.
2. Slick the edit link in the Contact details section.  
   
   > [!NOTE]
   > If you do not see an Edit link, this means your email address is managed by your Office 365 administrator and you will need to contact them to update your email address.
   > 
   > 
   
   ![](media/service-admin-alternate-email-address-for-power-bi/contact-details.png)
3. In the Alternate email field, enter the email address you would like Power BI updates to be sent to.

> [!NOTE]
> Changing this setting will not affect what email address is used to send service updates, newsletters, and other promotional communications.  Those will always be sent to the email address you originally used when registering for Power BI.
> 
> 

## Updating through Azure Active Directory
When capturing an Active Azure Directory (AAD) embed token for Power BI you can use 3 different types of emails to send notifications or invitations to. These are the main email address that is tied to the user’s AAD account, the UserPricnipleName (UPN) email address, or the “other” email address array attribute. Depending on a series of scenarios, Power BI will choose which one to use in certain situations.

Email order of operations:
* If the mail attribute in the AAD tenant’s user object is present, then that address will be used
* If the UPN email is not a *.onmicrosoft.com domain, then that address will be used
* If the “other” email array attribute in the AAD user object is present, then the first email in that list (since there can be a list of emails in this attribute) will be used
* If all of the above conditions are not met, then the UPN address will be used

## Updating with PowerShell
You can alternatively update the alternate email address via PowerShell for Azure Active Directory. This is done with the [Set-AzureADUser](https://docs.microsoft.com/powershell/module/azuread/set-azureaduser) command.

```
Set-AzureADUser -ObjectId john@contoso.com -OtherMails "otheremail@somedomain.com"
```

For more information, see [Azure Active Directory PowerShell Version 2](https://docs.microsoft.com/powershell/azure/active-directory/install-adv2).

More questions? [Try the Power BI Community](http://community.powerbi.com/)

