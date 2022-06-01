---
title: About Power BI in PowerPoint
description: Learn about the Power BI add-in for PowerPoint that enables you to add live Power BI data to your PowerPoint presentations.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 06/01/2022
---

# About Power BI in PowerPoint

The Power BI add-in for PowerPoint enables you to add live, interactive data from Power BI to your PowerPoint presentations. This means not only that the data shown in your PowerPoint presentation will always be up to date, but also that while you're presenting, you'll be able to filter and drill down on data in response to questions and feedback from your audience without having to switch contexts.

![Screenshot of the Power BI add-in in PowerPoint](media/service-power-bi-powerpoint-add-in-about/storytelling.gif)

Currently, the add-in supports adding individual report pages to PowerPoint slides. When you add a report page to a PowerPoint slide, other pages in the report (if any) will not be accessible from the add-in.

You can add report pages to PowerPoint presentations starting from either PowerPoint or Power BI.  For Power BI to be used as the starting point, the Power BI add-in for PowerPoint functionality must be [enabled in your organization](../admin/service-admin-portal-export-sharing.md#enable-power-bi-add-in-for-powerpoint).

## Requirements

To use the Power BI add-in for PowerPoint, you must have access to the Office add-in store, or the add-in must be available to you as an [admin managed add-in](/microsoft-365/admin/manage/centralized-deployment-of-add-ins).

To be able to view live Power BI data in PowerPoint, you must be signed into a Power BI account and have a Power BI Pro license as well as access to the data. If the data is located in a Premium capacity, a Free license is sufficient.

## Security

Power BI data added to PowerPoint using the Power BI add-in remains in Power BI. No data is actually exported from Power BI. As such, the data respects all Power BI permissions and data security, including [row-level security (RLS)](../enterprise/service-admin-rls.md), so your data remains secure.

## Information for the Power BI administrator

If you are a Power BI administrator, see [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md) for further details about the add-in.

## Next Steps

* [Add a live Power BI report page to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [Using the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-add-report.md)
* [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
