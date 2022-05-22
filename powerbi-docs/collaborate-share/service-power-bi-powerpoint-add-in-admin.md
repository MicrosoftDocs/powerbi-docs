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

# Power BI add-in for PowerPoint

The Power BI add-in for PowerPoint enables users to add live, interactive data from Power BI to PowerPoint presentations.

This page 

## Requirements

To use the Power BI add-in for PowerPoint, users must either have access to the Office add-in store, or the add-in must be made available to them as an [admin managed add-in](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).

## Licensing

To be able to view Power BI reports in PowerPoint, PowerPoint users must have a Power BI account.

If auto-licensing for Power BI is enabled, users without a Power BI account will be signed up automatically when they open a presentation containing a live Power BI report page. **This may impact the assignment and availability of licenses in your organization**. See [Power BI license assignment](../enterprise/service-admin-disable-self-service.md) for more information.

If auto-licensing is not enabled, users without Power BI accounts will be requested to sign up.

## Power BI entry points

By default, the Power BI service includes entry points that enable users to insert the add-in into new PowerPoint presentations directly from Power BI. Power BI admins can disable this functionality by turning off the **Enable Power BI add-in for PowerPoint** tenant setting. See [Enable Power BI add-in for PowerPoint](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint) for detail.

>[!NOTE]
> Disabling this functionality in Power BI does not prevent people from adding Power BI report pages to PowerPoint slides starting from PowerPoint. To completely block adding live Power BI report pages to PowerPoint slides using the add-in, the functionality must be disabled in both Power BI and PowerPoint.

Power BI entry points for the add-in are not available in sovereign, government, and air-gapped clouds. See the Microsoft Office documentation for information about the availability of the add-in in PowerPoint in these clouds.

## Power BI add-in button in PowerPoint

If your organization has a **SubscriptionCommercial** or **SubscriptionCommericalPro** Office subscription, a button for the add-in will appear in the PowerPoint ribbon.

![Screenshot of Power BI add-in for PowerPoint button on Insert ribbon.](media/service-power-bi-powerpoint-add-in-about/power-bi-addin-powerpoint-button.png)

The button is a shortcut to the add-in offering in the Office add-in store. The button itself doesn't provide access to the store. If the user does not have access to the store, the button won't work.

## Next Steps

* [Add a live Power BI report page in PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [Using the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-add-report.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
