---
title: Using the Power BI/Power Apps solutions integration
description: Learn about using Power BI with Power Apps solutions.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 03/08/2023
---

# Using the Power BI/Power Apps solutions integration (preview)

This article describes behaviors of the special dedicated Power BI environment workspaces that are created when creating Power BI components for Power Apps solutions.

## Customization with Power BI components

When a managed solution has been imported into a Power Apps environment, you can customize the solution by making changes to the Power BI report or semantic model. To bring the changes into Power Apps as an unmanaged layer, you need to sync Power BI and Power Apps manually. First you make your changes in Power BI, then you detect and sync in Power Apps. After syncing changes, an unmanaged layer is created in the solution. Removing the unmanaged layer rolls back the changes to the active managed layer, **and the Power BI items (report and/or semantic model) in the Power BI environment workspace also revert to the original managed active layer**. 

## Related content

* [About Power BI in Power Apps Solutions](./service-power-bi-powerapps-integration-about.md)
* [Enable the Power BI/Power Apps Solutions integration](./service-power-bi-powerapps-integration-enable.md)
* [Considerations working with the Power BI/Power Apps solutions integration](./service-power-bi-powerapps-integration-considerations.md)
* [Power BI content management in Power Apps solutions](/power-apps/maker/model-driven-apps/power-bi-content-management-power-apps-solutions)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)