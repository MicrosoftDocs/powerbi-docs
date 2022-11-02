---  
title: Frequently asked questions about Custom visual license management
description: Browse a list of frequently asked questions and answers about transactability and license management for custom Power BI visuals
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: faq
ms.date: 09/29/2022
---

# Transactability and License management FAQ

This article answers some of the questions users often have about how to set up, pay for, and manage licenses for custom Power BI visuals that they purchase from [AppSource](https://appsource.microsoft.com/).

## Purchasing

### Who can purchase a visual license?

*Anyone* can purchase a license, and assign the license to themselves or others.

### How can I pay for the visuals?

Anyone can complete the checkout path in [AppSource](https://appsource.microsoft.com/), and pay for the licenses with a credit card.  

If you're a billing or global admin of the tenant, you also have the option of paying through Invoicing.

:::image type="content" source="./media/licensing-faq/payment.png" alt-text="Screenshot of billing profile with Invoice selected.":::

### Do we need to have Power BI Premium to purchase Licenses?

No. any user can purchase visual licenses in AppSource.

### We have a Power BI Enterprise agreement with Microsoft. Is this included under that agreement?  

Not yet.  

### How do we negotiate site licensing or private custom offers?

Private offers and site licensing aren't supported yet. You can, however create Private Plans. [Learn more about private plans](/azure/marketplace/private-plans).

### Can we buy in local currency?

Yes.

### Can we do multi-year license purchase instead of one year at a time?

Not yet.  

### How do I know if someone in my company has already purchased this same visual?

If you're a company administrator, sign in to the [Microsoft 365 admin center](https://admin.microsoft.com/Adminportal/Home#/homepage) to see all subscriptions and to whom they're assigned.  
If you aren't an administrator, speak to the administrator in your company.

### How can I add a purchase order number to the transaction?

You can add a purchase number to the billing profile of your order. At the final stage of your checkout, select **Add new** under the billing profile.

:::image type="content" source="./media/licensing-faq/billing-profile.png" alt-text="Screenshot of the final stage of checkout with the Add new link highlighted.":::

Add the purchase order number in the appropriate space.

:::image type="content" source="./media/licensing-faq/add-purchase-order-number.png" alt-text="Screenshot of billing profile with box for adding purchase order number.":::

### Can we use a visual without having to upload it to organization visual?

Yes. You can download a visual directly to your reports.  

### How do we get upgrades of the visuals?  

The AppSource visuals are updated automatically when a new version is available.

### What is the refund policy?

You're eligible for a full refund if you cancel your subscription within seven days of purchase. Refunds aren’t available for subscriptions canceled after that time period.

## License assignment

### What happens if the subscription owner leaves the company?

Even if the owner of the subscription leaves the company, tenant admin purchases (typically known as Org purchases) will continue to work as-is. Any license admin (Global Admin, License Admin, User Admin) can manage the licenses. The subscriptions can be managed by any Billing Admin or Global Admin with access to the billing account used for purchase.

### Who can assign licenses after the purchase is complete?

If the tenant admin owns the licenses (Org licenses), then any of the license admins (Global Admin, License Admin or User Admin) can manage the licenses.  
However, if the subscription owner isn't an admin, then only the purchaser can manage the subscription and licenses.

### Can I sign in to Microsoft 365 admin center even if I'm not an admin?

When you purchase a Power BI Visual subscription, you also get access to the Microsoft 365 admin center, and can manage subscription from there.

### Do I have to assign a license to myself even if I'm the owner?

Yes. Any user who wants to use the offer should be assigned a license, even if they own the subscription.

### How do we assign the licenses?

Go to [admin.microsoft.com](https://admin.microsoft.com/) and select the **License** link under the **Billing** node from the menu. A list of visuals will appear.

:::image type="content" source="./media/licensing-faq/assign-licenses.png" alt-text="Screenshot of Admin homepage with billing licenses selected.":::

Select the Visual you want to assign licenses for. In the next page, select the user(s) you want to assign the licenses to.

### Once I assign a license, how long does it take until I can use it?

After you are assigned a license in the Microsoft 365 Admin Center, it should be available within an hour.

* If you're using the licensed visual in the Power BI Service, refresh the report by hitting F5.
* If you're using the licensed visual in the Power BI Desktop, close and reopen it.

If, after you refresh, the license is still not available, wait a while and try again. It could take up to an hour.

### As an admin can I see the subscriptions that were purchased in my organization?

A tenant admin can see all subscriptions purchased under the tenant account, including the subscriptions purchased by non-admins.

### We're a global team. Can we assign licenses to someone working in another country?

You can assign licenses to users in the same tenant that you purchased subscription under regardless of the country.

### As an admin, can I cancel offer purchase from AppSource?

As a billing or global admin, you can see all subscriptions in the Microsoft 365 admin center, and you can cancel them.

## Next steps

[Licensing models](custom-visual-licenses.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com)
