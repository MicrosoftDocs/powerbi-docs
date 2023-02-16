---
title: Multi-Geo support for Power BI Premium
description: Learn how you can deploy content to data centers in regions other than the home region of the Power BI tenant.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 02/16/2023
LocalizationGroup: Premium 
---

# Configure Multi-Geo support for Power BI Premium

Multi-Geo is a Power BI Premium feature that helps multinational customers address regional, industry-specific, or organizational data residency requirements. As a Power BI Premium customer, you can deploy content to data centers in regions other than the home region of the Power BI tenant. A geo (geography) can contain more than one region. For example, the United States is a geo, and West Central US and South Central US are regions in the United States. You might choose to deploy content to any of the following geographies (geos) defined in the [Azure geography map](https://azure.microsoft.com/global-infrastructure/geographies/).

Sovereign clouds support Multi-Geo across regions within that cloud.

> [!NOTE]
> China North currently does not support Multi-Geo as it resides on the old version of Premium.

Multi-Geo is now also available in Power BI Embedded. Read more at [Multi-Geo support for Power BI Embedded](../developer/embedded/embedded-multi-geo.md).

> [!NOTE]
> Power BI Premium Per User (PPU) is not supported for Multi-Geo.

## Enable and configure

For new capacities, enable Multi-Geo by selecting a region other than the default region from the dropdown. Each available capacity shows the region where it's currently located, such as **West Central US**.

1. In Power BI service, select **settings** and from the menu select **Admin portal**.

2. In the *Admin portal*, select **Capacity settings**.

3. Select **Set up new capcity**.

4. From the **Region** dropdown menu, select the region you want to use for this capacity.

After you've created a capacity, it remains in that region, and any workspaces created under it, will have their content stored in that region. You can migrate workspaces from one region to another through the dropdown on the workspace settings screen.

![Screenshot showing the edit workspace settings screen to change the currently selected region.](media/service-admin-premium-multi-geo/power-bi-multi-geo-edit-workspace.png)

You see this message to confirm the change.

![Screenshot of a prompt confirming a change to the workspace region.](media/service-admin-premium-multi-geo/power-bi-multi-geo-change-assigned-workspace-capacity.png)

During migration, certain operations might fail, such as publishing new datasets or scheduled data refresh.  

The following items are stored in the Premium region when Multi-Geo is enabled:

- Models (.ABF files) for import and Direct Query datasets
- Query cache
- R images

These items remain in the home region for the tenant:

- Push datasets
- Excel workbooks
- Dashboard/report metadata: tile names, tile queries, and any other data
- Service buses for gateway queries or scheduled refresh jobs
- Permissions
- Dataset credentials
- Power BI Embedded Analytics Playground saved state

## View capacity regions

In the Admin Portal, you can view all the capacities for your Power BI tenant and the regions where they're currently located.

![Screenshot of a table showing premium capacities and information relating to capacity name, capacity admins, actions, SKU, v-cores, region, and status.](media/service-admin-premium-multi-geo/power-bi-multi-geo-premium-capacities.png)

## Change the region for existing content

If you need to change the region for existing content, you have two options:

- Create a second capacity and move workspaces. Free users won't experience any downtime as long as the tenant has spare v-cores.
- If creating a second capacity isn't an option, you can temporarily move the content back to shared capacity from Premium. You don't need extra v-cores, but free users will experience some downtime.

## Move content out of Multi-Geo  

You can take workspaces out of Multi-Geo capacity in one of two ways:

- Delete the current capacity where the workspace is located. This action moves the workspace back to shared capacity in the home region.
- Migrate individual workspaces back to Premium capacity located in the home tenant.

Large-storage format datasets shouldn't be moved from the region where they were created. Reports based on a large-format dataset won't be able to load the dataset and return a *Cannot load model* error. Move the large-storage format dataset back to its original region to make it available again.

## Considerations and limitations

- Confirm that any movement you initiate between regions follows all corporate and government compliance requirements prior to initiating data transfer.
- Cached data and queries stored in a remote region stays in that region at rest. Additionally, the data at rest is replicated to another region in the same Azure geography for disaster recovery if the Azure geography contains more than one region. Data in transit might go back and forth between multiple geographies.
- The source data might remain in the region from which the data was moved for up to 30 days when moving data from one region to another in a Multi-Geo environment. During that time end users don't have access to it. It's removed from this region and destroyed during the 30-day period.
- Query text and query result traffic for imported and DirectQuery data models doesn't transit through the home region. The report metadata does still come from the home region, and certain DNS routing states might take such traffic out of the region.
- Certain features such as screenshots, data alerts and others will still process data in the home region.
- The detailed dataset metadata that is cached as part of [enhanced metadata scanning](../enterprise/service-admin-metadata-scanning.md) is always stored in the home region, even if the scanned dataset is located in a remote region.
- The [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md) feature isn't supported on Multi-GEO at this time.
- It's possible to create and maintain large-storage format datasets in remote regions to meet data residency requirements. However, you can't move storage format datasets to another region. Moving large-storage format datasets from the region where they were created results in reports failing to load the dataset. Move the large-storage dataset back to its original region to make it available. If you must move such a model, deploy it as if it was a new model, and then delete the old model from the undesired region.
- Multi-Geo doesn't support Metrics.

## Next steps

- [What is Power BI Premium?](../enterprise/service-premium-what-is.md)
- [Multi-Geo support for Power BI Embedded](../developer/embedded/embedded-multi-geo.md)
