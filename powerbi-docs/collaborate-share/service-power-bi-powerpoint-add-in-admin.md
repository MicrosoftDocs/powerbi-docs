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
ms.date: 02/01/2023
---

# Power BI add-in for PowerPoint - Admin info

The Power BI add-in for PowerPoint enables users to add live, interactive data from Power BI to PowerPoint presentations. Currently, users can add individual report pages and individual visuals. When a report page is added, the add-in does not bring in the left hand navigation pane, but any page navigation visuals on the report page itself will function normally as they do in the Power BI service.

## Requirements

To use the Power BI add-in for PowerPoint, users must either have access to the Office add-in store, or the add-in must be made available to them as an [admin managed add-in](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).

In sovereign clouds, the add-in must be deployed as an admin managed add-in, since the Office add-in store isn't accessible from sovereign clouds. For further information, see [Deploying the add-in in sovereign clouds](#deploying-the-add-in-in-sovereign-clouds).

## Licensing

To be able to view live Power BI data in PowerPoint, users must have an active Power BI account and a Power BI Free license, as well as access to the data. If the Power BI report is not located in a Premium capacity, a Power BI Pro license is needed.

If auto-licensing for Power BI is enabled, users without a Power BI account will be signed up automatically when they open a presentation containing a live Power BI report page. **This may impact the assignment and availability of licenses in your organization**. See [Power BI license assignment](../enterprise/service-admin-disable-self-service.md) for more information.

If auto-licensing is not enabled, users without Power BI accounts will be requested to sign up.

## Power BI entry points

By default, the Power BI service includes entry points that enable users to insert the add-in into new PowerPoint presentations directly from Power BI. Power BI admins can disable this functionality by turning off the **Enable Power BI add-in for PowerPoint** tenant setting. See [Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint) for detail.

>[!NOTE]
> Disabling this functionality in Power BI does not prevent people from adding Power BI report pages to PowerPoint slides starting from PowerPoint. To completely block adding live Power BI report pages to PowerPoint slides using the add-in, the functionality must be disabled in both Power BI and PowerPoint.

Power BI entry points for the add-in are not available in sovereign, government, and air-gapped clouds. See the Microsoft Office documentation for information about the availability of the add-in in PowerPoint in these clouds.

## Power BI add-in button in PowerPoint Insert ribbon

If your organization has a Microsoft 365 Office subscription, a button for the add-in will appear in the PowerPoint ribbon.

![Screenshot of Power BI add-in for PowerPoint button on Insert ribbon.](media/service-power-bi-powerpoint-add-in-admin/power-bi-addin-powerpoint-button.png)

The button is a shortcut to the add-in offering in the Office add-in store. The button itself doesn't provide access to the store. If the user does not have access to the store, the button won't work.

>[!NOTE]
> The rollout of the Power BI add-in for PowerPoint depends on the update cadence of your organization's Microsoft 365 subscription. Hence the add-in may not immediately be available in your organization. To ensure availability of the add-in, use the latest version of Microsoft 365.

## Deploying the add-in in sovereign clouds

The Power BI add-in for PowerPoint is available in sovereign clouds as an admin managed add-in. If you are a Power BI admin in a tenant located in a sovereign cloud, you can make the add-in available to your users as follows:

1. Sign into the Power BI service with an admin account.
1. Select the **Download** icon and choose **Power BI for PowerPoint** to download the add-in. You will have this option only if your tenant is in a sovereign cloud.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-admin/power-bi-powerpoint-addin-download-option.png" alt-text="Screenshot of the Power BI for PowerPoint add-in download option.":::

1. See [Determine if Centralized Deployment of add-ins works for your organization](/microsoft-365/admin/manage/centralized-deployment-of-add-ins) to learn how to deploy the add-in for your users.


## Next Steps

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI report pages to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI report pages in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)