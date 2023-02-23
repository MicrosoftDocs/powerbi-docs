---
title: Power BI add-in for PowerPoint - Admin info
description: See information about the Power BI add-in for PowerPoint that Power BI administrators need to be aware of.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 02/23/2023
---

# Power BI add-in for PowerPoint - Admin info

The Power BI add-in for PowerPoint enables users to add live, interactive data from Power BI to PowerPoint presentations. Currently, users can add individual report pages and individual visuals. When a report page is added, the add-in doesn't bring in the left hand navigation pane, but any page navigation visuals on the report page itself will function normally as they do in the Power BI service.

## Requirements

To use the Power BI add-in for PowerPoint, users must either have access to the Office add-in store, or the add-in must be made available to them as an [admin managed add-in](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).

## Licensing

To be able to view live Power BI data in PowerPoint, users must have an active Power BI account and a Power BI Free license, and access to the data. If the Power BI report isn't located in a Premium capacity, a Power BI Pro license is needed.

If auto-licensing for Power BI is enabled, users without a Power BI account will be signed up automatically when they open a presentation containing a live Power BI report page or visual. **This may impact the assignment and availability of licenses in your organization**. For more information, see [Power BI license assignment](../enterprise/service-admin-disable-self-service.md).

If auto-licensing isn't enabled, users without Power BI accounts will be requested to sign up.

## Power BI entry points

By default, the Power BI service includes entry points that enable users to insert the add-in into new PowerPoint presentations directly from Power BI. Power BI admins can disable this functionality by turning off the **Enable Power BI add-in for PowerPoint** tenant setting. See [Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint) for detail.

>[!NOTE]
> Disabling this functionality in Power BI does not prevent people from adding Power BI report pages and visuals to PowerPoint slides starting from PowerPoint. To completely block adding live Power BI report pages and visuals to PowerPoint slides using the add-in, the functionality must be disabled in both Power BI and PowerPoint.

Power BI entry points for the add-in aren't available in national, government, and air-gapped clouds. See the Microsoft Office documentation for information about the availability of the add-in in PowerPoint in these clouds.

## Power BI add-in button in PowerPoint Insert ribbon

If your organization has a Microsoft 365 Office subscription, a button for the add-in will appear in the PowerPoint ribbon.

![Screenshot of Power BI add-in for PowerPoint button on Insert ribbon.](media/service-power-bi-powerpoint-add-in-admin/power-bi-addin-powerpoint-button.png)

The button is a shortcut to the add-in offering in the Office add-in store. The button itself doesn't provide access to the store. If the user doesn't have access to the store, the button won't work.

>[!NOTE]
> The rollout of the Power BI add-in for PowerPoint depends on the update cadence of your organization's Microsoft 365 subscription. Hence the add-in may not immediately be available in your organization. To ensure availability of the add-in, use the latest version of Microsoft 365.

## Next Steps

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI data to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)