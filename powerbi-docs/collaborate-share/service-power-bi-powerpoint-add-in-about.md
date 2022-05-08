---
title: About the Power BI add-in for PowerPoint
description: Learn about the Power BI add-in for PowerPoint that enables you to add live Power BI data to your PowerPoint presentations.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 05/07/2022
---

# About the Power BI add-in for PowerPoint

The Power BI add-in for PowerPoint enables you to add live, interactive data from Power BI to your PowerPoint presentations. This means not only that the data shown in your PowerPoint presentation will always be up to date, but also that while you're presenting, you'll be able to filter and drill down on data in response to questions and feedback from your audience without having to switch contexts. You'll also be able to easily share your presentation with other team members in the meeting, enabling you to drive true data-driven conversations.

![Screenshot of the Power BI add-in in PowerPoint](media/service-power-bi-powerpoint-add-in-about/storytelling.gif)

You can add report pages to PowerPoint presentations starting from either PowerPower or Power BI.  For Power BI to be used as the starting point, the Power BI add-in for PowerPoint functionality must be [enabled in your organization](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint).

## Requirements

* To use the Power BI add-in for PowerPoint, you must have access to the Office add-in store, or the add-in must be available to you as an [admin managed add-in](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).
* To be able to view Power BI reports in PowerPoint, PowerPoint users must have a Power BI account and at least Viewer access to the report.

## Security

The Power BI data that you see in PowerPoint using the Power BI add-in remains in Power BI. No data is actually exported from Power BI. As such, the data respects all Power BI permissions and data security, including [row-level security (RLS)](../enterprise/service-admin-rls.md), so your data remains secure.

## Power BI administrator considerations

* By default, Power BI users can insert the add-in into a new PowerPoint presentation directly from Power BI. Power BI admins can disable this functionality by turning off the **Enable Power BI add-in for PowerPoint** tenant setting. See [Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint) for detail.

    >[!NOTE]
    > Disabling this functionality in Power BI does not prevent people from adding Power BI report pages to PowerPoint slides starting from PowerPoint. To completely block adding live Power BI report pages to PowerPoint slides using the add-in, the functionality must be disabled in both Power BI and PowerPoint.

* The Power BI entry points for the add-in are not available in sovereign, government, and air-gapped clouds. See the Microsoft Office documentation for information about the availability of the add-in in PowerPoint in these clouds.

* If auto-licensing for Power BI is enabled, users who don't have a Power BI account will be automatically signed up when they open a presentation that has a live Power BI report page added to it. This may impact the assignment and availability of licenses in your organization. See [Power BI license assignment](../enterprise/service-admin-disable-self-service.md) for more information.

    If auto-licensing is not enabled, users who do not have Power BI accounts will be requested to sign up.

* If your organization has a **SubscriptionCommercial** or **SubscriptionCommericalPro** Office subscription, a button for the add-in will appear in the PowerPoint ribbon.

[Image]

The button is a shortcut to the add-in offering in the Office add-in store. The button itself doesn't provide access to the store. If the user does not have access to the store, the button won't work.

## Next Steps

* Add a Power BI report page to a PowerPoint slide
* Use the Power BI add-in for PowerPoint

## Next steps

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
