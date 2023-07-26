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
ms.date: 03/05/2023
---

# The Power BI add-in for PowerPoint in national/regional clouds

Users of the Power BI add-in for PowerPoint in national/regional clouds enjoy the same interactive, data-visualization storytelling capabilities as users in public clouds. However, because in national/regional clouds there is no connection to the Microsoft Office add-in store, there are some differences in how the add-in is deployed, and in how you can embed live Power BI data in a PowerPoint presentation. This article summarizes and describes these differences. The differences are also called out where relevant in the rest of the storytelling documentation.

Here are the differences. Click the links to see more detail.

* In national/regional clouds, the add-in is supported as an admin managed add-in only. If you're an admin of a tenant located in a national/regional cloud, you must download the add-in from Power BI in your national/regional cloud and deploy it using Centralized Deployment. The add-in that is available from the public cloud will not work. Users in national/regional clouds must use the add-in you've deployed. For more information, see [Deploying the add-in in national/regional clouds](./service-power-bi-powerpoint-add-in-admin.md#deploying-the-add-in-in-nationalregional-clouds).

* In national/regional clouds, the tenant setting **[Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint)** is irrelevant and can be ignored.

* In national/regional clouds, the **Open in PowerPoint** option in the Power BI service, which opens a new PowerPoint presentation with your desired report or visual already embedded in the add-in, is not available. To embed a report or visual in the add-in you must copy the link to the item than and paste it into the add-in in PowerPoint manually.

* In PowerPoint, the add-in button doesn't appear on the Insert ribbon. Instead, to insert the add-in, you must find it among your "manageed add-ins".

* In public clouds, the add-in is available from the Microsoft Office add-in store. In national/regional clouds, the add-in is supported as an admin managed add-in only. Admins must download it from Power BI in their national/regional cloud and deploy it using Centralized Deployment. See [Deploying the add-in in national/regional clouds](./service-power-bi-powerpoint-add-in-admin.md#deploying-the-add-in-in-nationalregional-clouds) for detail.

* In public clouds, PowerPoint usually has a button for the Power BI add-in on the **Insert** ribbon. In national/regional clouds, users must find it under **Managed add-ins**.

* In public clouds, the tenant admins can enable entry points from Power BI, which enable users to open a new PowerPoint with the add-in already embedded, directly from Power BI. In national/regional clouds, Power BI entry points are not supported. This means that:

    * Users must copy the link for the reports or visual that they want to embed, and then paste that link manually into the add-in in PowerPoint.  

**For admins**
* You must download the add-in from Power BI and deploy it via centralized deployment.
* You don't have to enable the **[Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint)** tenant setting. In national/region clouds, the setting is irrelevant and can be ignored. 

* In national/regional clouds, the add-in must be deployed by an administrator as an admin managed add-in, since the Office add-in store isn't accessible. It isn't available as part of a subscription, nor can users install it themselves from the Office add-in store. For more information about deploying the add-in as an admin managed add-in, see [Deploying the add-in in national/regional clouds](./service-power-bi-powerpoint-add-in-admin.md#deploying-the-add-in-in-nationalregional-clouds).
* In PowerPoint, the add-in button won't appear on the Insert ribbon. Instead, to insert the add-in, users need to go to **Managed add-ins**.




**For users**
* In the Power BI service, the **Open in PowerPoint** option is not available.

**For admins**
* You must download the add-in from Power BI and deploy it via centralized deployment.
* You don't have to enable the **[Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint)** tenant setting. In national/region clouds, the setting is irrelevant and can be ignored. 

* In national/regional clouds, the add-in must be deployed as an admin managed add-in, since the Office add-in store isn't accessible from national/regional clouds. For more information, see [Deploying the add-in in national/regional clouds](./service-power-bi-powerpoint-add-in-admin.md#deploying-the-add-in-in-nationalregional-clouds).

## Requirements

In national/regional clouds, the add-in must be deployed as an admin managed add-in, since the Office add-in store isn't accessible from national/regional clouds. For more information, see [Deploying the add-in in national/regional clouds](#deploying-the-add-in-in-nationalregional-clouds).

## Power BI entry points

Power BI entry points for the add-in aren't available in national/regional, government, and air-gapped clouds. See the Microsoft Office documentation for information about the availability of the add-in in PowerPoint in these clouds.

By default, the Power BI service includes entry points that enable users to insert the add-in into new PowerPoint presentations directly from Power BI. Power BI admins can disable this functionality by turning off the **Enable Power BI add-in for PowerPoint** tenant setting. See [Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint) for detail.

## Power BI add-in button in PowerPoint Insert ribbon

If your organization has a Microsoft 365 Office subscription, a button for the add-in will appear in the PowerPoint ribbon.

![Screenshot of Power BI add-in for PowerPoint button on Insert ribbon.](media/service-power-bi-powerpoint-add-in-admin/power-bi-addin-powerpoint-button.png)

The button is a shortcut to the add-in offering in the Office add-in store. The button itself doesn't provide access to the store. If the user doesn't have access to the store, the button won't work.


## Deploying the add-in in national/regional clouds

In national/regional clouds, the add-in is supported as an admin managed add-in only. If you're a Power BI admin in a tenant located in a national/regional cloud, you must download the add-in from Power BI in your national/regional cloud and deploy it using Centralized Deployment. The add-in that is available from the public cloud will not work in national/regional clouds. Users in national/regional clouds must use the add-in you've deployed.

To download and deploy the add-in:

1. Sign into the Power BI service with an admin account.
1. Select the **Download** icon and choose **Power BI for PowerPoint** to download the add-in. You'll have this option only if your tenant is in a national/regional cloud.

    :::image type="content" source="media/service-power-bi-powerpoint-add-in-admin/power-bi-powerpoint-addin-download-option.png" alt-text="Screenshot of the Power BI for PowerPoint add-in download option.":::

1. Deploy the add-in according to the instructions at [Deploy add-ins in the Microsoft 365 admin center](/microsoft-365/admin/manage/manage-deployment-of-add-ins).
1. 
Export menu - no Embed live data option
Share menu - no PowerPoint option.
Visual - no Open in PowerPoint option.

## Next Steps

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI data to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)