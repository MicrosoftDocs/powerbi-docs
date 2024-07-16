---
title: Multi-Geo support for Power BI embedded analytics
description: Learn how you can deploy content to data centers in regions other than the home region of your Power BI embedded analytics solution. Use Multi-Geo support. 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: nishalit
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/03/2024
---

# Multi-Geo support for Power BI Embedded

**Multi-Geo support for Power BI Embedded** means that independent software vendors (ISVs) and organizations that build applications using Power BI Embedded to embed analytics into their apps can now deploy their data in different regions around the world.

Now, customers using **Power BI Embedded** can set up an **A capacity** using **Multi-Geo** options, based on the same features and limitations that [Power BI Premium supports using Multi-Geo](../../admin/service-admin-premium-Multi-Geo.md).

## Creating new Power BI Embedded Capacity resource with Multi-Geo

In the **Create resource** screen, choose the location of your capacity. Previously, the location was limited to the location of your Power BI tenant, so only a single location was available. With Multi-Geo, you can choose between different regions to deploy your capacity.

:::image type="content" source="media/embedded-multi-geo/pbie-multi-geo-setup.png" alt-text="Screenshot of the Azure portal capacity creation screen, which shows the highlighted location drop-down menu.":::

Notice that when you open the *location* drop-down menu, your home tenant is the default selection.

:::image type="content" source="media/embedded-multi-geo/pbie-multi-geo-default-location.png" alt-text="Screenshot of the Azure portal capacity creation screen, which shows the home tenant default selection in the location drop-down menu.":::

When you choose a location other than the default tenant location, a message prompts you to make sure you're aware of the selection.

:::image type="content" source="media/embedded-multi-geo/pbie-multi-geo-location-change.png" alt-text="Screenshot of the Azure portal capacity creation screen, which shows the capacity's location is different than the default tenant location.":::

## View Capacity location

You can see your capacities' locations easily from the main Power BI Embedded management page in the Azure portal.

:::image type="content" source="media/embedded-multi-geo/pbie-multi-geo-location-different.png" alt-text="Screenshot of the Azure portal Power BI Embedded management page, which shows the highlighted capacity location sorter." lightbox="media/embedded-multi-geo/pbie-multi-geo-location-different.png":::

The locations are also available in the Admin portal at `PowerBI.com`. In the Admin portal, choose **Capacity settings**, and then switch to the **Power BI Embedded** tab.

:::image type="content" source="media/embedded-multi-geo/pbie-multi-geo-admin-portal.png" alt-text="Screenshot of the PowerBI.com Admin Portal, which shows the highlighted Power BI Embedded tab and the capacity region sorter." lightbox="media/embedded-multi-geo/pbie-multi-geo-admin-portal.png":::

[Learn more about creating capacities with Power BI Embedded.](azure-pbie-create-capacity.md)

## Manage existing capacities location

You can't change a Power BI Embedded resource location after you've created a new capacity.

To move your Power BI content to a different region, follow these steps:

1. [Create a new capacity](azure-pbie-create-capacity.md) in a different region.

2. Assign all workspaces from the existing capacity to the new capacity.

3. Delete or pause the old capacity.

It's important to note that if you decide to delete a capacity without reassigning its content, all the content in that capacity moves to a shared capacity in your home region.

## API support for Multi-Geo

To manage capacities with Multi-Geo through APIs, use the following APIs:

1. **[Get Capacities](/rest/api/power-bi/capacities/getcapacities)** - The API returns a list of capacities with access to the user. The response includes a property called `region` that specifies the capacity's location.

2. **[Assign To Capacity](/rest/api/power-bi/capacities)** - The API allows you to assign a workspace to a capacity outside of your home region, or to move workspaces between capacities in different regions. To perform this operation, the user or [service principal](embed-service-principal.md) needs admin permissions on the workspace, and admin or assign permissions on the target capacity.

3. **[Azure Resource Manager API](/rest/api/power-bi-embedded/capacities)** - all of the Azure Resource Manager API operations, including *Create* and *Delete*, supports Multi-Geo.

## Considerations and limitations

* The Power BI Embedded multi-geo limitations are similar to the Power BI Premium multi-geo [considerations and limitations](../../admin/service-admin-premium-multi-geo.md#considerations-and-limitations).

## Related content

* [What is Power BI Embedded?](embedded-analytics-power-bi.md)

* [Create a Power BI Embedded capacity](azure-pbie-create-capacity.md)

* [Multi-Geo in Power BI Premium capacities](../../admin/service-admin-premium-multi-geo.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
