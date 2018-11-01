---
title: Unable to add Power BI to O365 partner
description: Unable to add Power BI to an Office 365 syndication partner. The syndicated model is a purchasing model used by Office 365.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 11/01/2018
ms.author: mblythe

LocalizationGroup: Administration
---

# Unable to add Power BI to Office 365 partner subscription

Office 365 enables companies to resell Office 365 bundled and integrated with their own solutions, providing end-customers with a single point of contact for purchasing, billing, and support.

If you are interested in acquiring Power BI alongside your Office 365 subscription, we recommend you contact your partner to do so. If your partner does not currently offer Power BI, you have different options to pursue.

# Work with your partner to purchase Power BI

If you want to buy a subscription to Power BI Pro or Power BI Premium, work with your partner to consider what options you have:

* Your partner agrees to add Power BI to their portfolio so that you can purchase from them.

* Your partner is able to transition you to a model where you can buy Power BI directly from Microsoft or another partner who offers Power BI.

# Purchase from Microsoft or another channel

Depending on the relationship with your partner, you might be able to purchase Power BI directly from Microsoft or another partner. You can verify whether you can add Power BI subscriptions in the Office 365 admin portal (requires membership in the Global Administrator or Billing Administrator role).

1. Go to the [Office 365 admin portal](https://admin.microsoft.com/AdminPortal/Home#/homepage).

1. In the left menu, open **Billing**:

    * If you see **Subscriptions**, you can acquire the service from Microsoft directly, or you can contact another partner that offers Power BI.

        ![Billing - with subscriptions](media/service-admin-syndication-partner/billingsub.png)

    * If you don't see **Subscriptions**, you can't buy from Microsoft directly or from another partner.

If your partner does not offer Power BI and you can't buy directly from Microsoft or another partner, consider signing up for a free trial.

## Sign up for a free trial

You can sign up for a free trial of Power BI Pro. If you don't purchase Power BI Pro at the end of the trial period, you still have a free license that offers many of the features of Power BI. For more information, see [Power features by license type](service-features-license-type.md).

### Enable ad-hoc subscriptions

By default, individual sign-ups (also known as ad-hoc subscriptions) are disabled. In this case, you see the following message when you try to sign up: *Your IT department has turned off signup for Microsoft Power BI*.

![Sorry image](media/service-admin-syndication-partner/sorry.png)

To enable ad-hoc subscriptions, you can contact your partner and request that they turn it on. If you are an administrator of your tenant, and know how to use Azure Active Directory PowerShell commands, you can enable ad-hoc subscriptions yourself. [Azure Active Directory PowerShell for Graph](/powershell/azure/active-directory/install-adv2/)

1. Sign in to Azure Active Directory using your Office 365 credentials. The first line of the script below prompts you for your credentials. The second line connects to Azure Active Directory.

    ```powershell
    $msolcred = get-credential
    connect-msolservice -credential $msolcred
    ```

    ![Enter your credentials](media/service-admin-syndication-partner/aad-signin.png)

1. Once you're signed in, run the following command to check the current setting for `AllowAdHocSubscriptions`.

    ```powershell
    Get-MsolCompanyInformation
    ```

1. Run the following command to enable free sign ups.

    ```powershell
    Set-MsolCompanySettings -AllowAdHocSubscriptions $true
    ```

## Next steps

[Power BI licensing in your organization](service-admin-licensing-organization.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)