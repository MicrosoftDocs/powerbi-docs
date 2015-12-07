<properties
pageTitle="Unable to add Power BI to syndicated partner"
description="Unable to add Power BI to an Office 365 syndication partner"
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
editor=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="12/07/2015"
ms.author="asaxton"/>
# Unable to add Power BI to Office 365 syndicated partner subscription

Office 365 allows for a syndication model which allows companies to resell Office 365 bundled and integrate the office suite with their own solutions, providing end-customers with a single bill for services.

When you purchase Office 365 through a syndicated partner, you will not be able to add subscriptions through the Office 365 Admin Portal. **Subscriptions** will not be available under **Billing**.

![](media/powerbi-admin-syndication-partner/billing.png)

Some syndication models do not allow a customer to buy from a different channel or partner. This means that you would need to purchase the Power BI Pro subscription directly from the syndication partner that you purchased Office 365 from. They may not have Power BI Pro as part of their offering though.

You have two options, to get Power BI, for a syndicated purchase.

[Power BI (free)](#free)

[Power BI Pro](#pro)

## Power BI (free)

If you are happy with the free offering for Power BI, you can sign up for the free service. By default, individual sign-ups, also known as ad-hoc subscriptions, are disabled for the syndication model. When you try to sign up for Power BI, you will see a message indicating that your IT department has turned off sign up for Microsoft Power BI.

    Your IT department has turned off signup for Microsoft Power BI.

![](media/powerbi-admin-syndication-partner/sorry.png)

As an Admin, you can enable individual sign ups using the Azure Active Directory PowerShell commands. [Learn more](https://technet.microsoft.com/library/jj151815.aspx)

    Set-MsolCompanySettings -AllowAdHocSubscriptions $true

## Power BI Pro

If you want to buy a subscription to Power BI Pro, and the syndicated partner does not offer Power BI Pro, you will need to move off of that syndicated partner and either go to a partner that is part of the Cloud Solution Provider (CSP) program, or buy Office 365 direct from office365.com.

## See Also

[Manage Azure AD using Windows PowerShell](https://technet.microsoft.com/library/jj151815.aspx)

[Ability to disable Sign ups for Power BI (Free)](http://blogs.technet.com/b/powerbisupport/archive/2015/02/18/ability-to-disable-free-sign-ups-for-the-free-power-bi.aspx)
