---
title: Multi-Geo support for Power BI Premium
description: Learn how you can deploy content to datacenters in regions other than the home region of the Power BI tenant.  
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 10/18/2021
LocalizationGroup: Premium 
---

# Configure Multi-Geo support for Power BI Premium

Multi-Geo is a Power BI Premium feature that helps multinational customers address regional, industry-specific, or organizational data residency requirements. As a Power BI Premium customer, you can deploy content to datacenters in regions other than the home region of the Power BI tenant. A geo (geography) can contain more than one region. For example, the United States is a geo, and West Central US and South Central US are regions in the United States. You may choose to deploy content to any of the following geographies (geos) defined in the [Azure geography map](https://azure.microsoft.com/global-infrastructure/geographies/).

Sovereign clouds support Multi-Geo across regions within that cloud.

> [!NOTE]
> China North currently does not support Multi-Geo for Premium Gen2 capacities.

Multi-Geo is now also available in Power BI Embedded. Read more at [Multi-Geo support in Power BI Embedded](../developer/embedded/embedded-multi-geo.md).

> [!NOTE]
> Power BI Premium recently released a new version of Premium, called **Premium Gen2**. Premium Gen2 simplifes the management of Premium capacities, and reduces management overhead. For more information, see [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).


> [!NOTE]
> Power BI Premium Per User (PPU) is not supported for Multi-Geo.

## Enable and configure

For new capacities, enable Multi-Geo by selecting a region other than the default region from the dropdown.  Each available capacity shows the region where it's currently located, such as **West Central US**.

![Capacity size: select a region. Power BI Multi-Geo](media/service-admin-premium-multi-geo/power-bi-multi-geo-capacity-size.png)

After you've created capacity, it remains in that region, and any workspaces created will have their content stored in that region. You can migrate workspaces from one region to another through the dropdown on the workspace settings screen.

![Edit workspace: Choose an available capacity. Power BI Multi-Geo](media/service-admin-premium-multi-geo/power-bi-multi-geo-edit-workspace.png)

You see this message to confirm the change.

![Change assigned workspace confirmation](media/service-admin-premium-multi-geo/power-bi-multi-geo-change-assigned-workspace-capacity.png)

You don't need to reset the gateway credentials during a migration at this time.  After they're stored in the Premium capacity region, you will need to reset them upon migration.

During migration, certain operations may fail, such as publishing new datasets or scheduled data refresh.  

The following items are stored in the Premium region when Multi-Geo is enabled:

- Models (.ABF files) for import and Direct Query datasets
- Query cache
- R images

These items remain in the home region for the tenant:

- Push datasets
- Excel workbooks
- Dashboard/report metadata: e.g., tile names, tile queries
- Service buses for gateway queries or scheduled refresh jobs
- Permissions
- Dataset credentials
- Power BI Embedded Analytics Playground saved state



## View capacity regions

In the Admin Portal, you can view all the capacities for your Power BI tenant and the regions where they're currently located.

![View premium capacities](media/service-admin-premium-multi-geo/power-bi-multi-geo-premium-capacities.png) 

## Change the region for existing content

If you need to change the region for existing content, you have two options.

- Create a second capacity and move workspaces. Free users won't experience any downtime as long as the tenant has spare v-cores.
- If creating a second capacity isn't an option, you can temporarily move the content back to shared capacity from Premium. You don't need extra v-cores, but free users will experience some downtime.

## Move content out of Multi-Geo  

You can take workspaces out of Multi-Geo capacity in one of two ways:

- Delete the current capacity where the workspace is located.  This moves the workspace back to shared capacity in the home region.
- Migrate individual workspaces back to Premium capacity located in the home tenant.

Large-storage format datasets should not be moved from the region where they were created. Reports based on a large-format dataset will not be able to load the dataset, and return a *Cannot load model* error. Move the large-storage format dataset back to its original region to make it available again.

## Considerations and limitations

- Confirm that any movement you initiate between regions follows all corporate and government compliance requirements prior to initiating data transfer.
- Cached data and queries stored in a remote region stays in that region at rest. Additionally the data at rest will be replicated to another region in the same Azure geography for disaster recovery if the Azure geography contains more than one region. Data in transit may go back and forth between multiple geographies.
- When moving data from one region to another in a Multi-Geo environment, the source data may remain in the region from which the data was moved for up to 30 days. During that time end users don't have access to it. It's removed from this region and destroyed during the 30-day period.
- Query text and query result traffic for imported and DirectQuery data models does not transit through the home region. The report metadata does still come from the home region, and certain DNS routing states may take such traffic out of the region. 
- Certain features such as screenshots, data alerts and others will still process data in the home region.
- The detailed dataset metadata that is cached as part of [enhanced metadata scanning](./service-admin-metadata-scanning.md) is always stored in the home region, even if the scanned dataset is located in a remote region.
- The [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md) feature is not supported on Multi-GEO at this time.
- It is possible to create and maintain large-storage format datasets in remote regions to meet data residency requirements. However, note that you cannot move storage format datasets to another region. Moving large-storage format datasets from the region where they were created will result in reports failing to load the dataset. Move the large-storage dataset back to its original region to make it available. If you must move such a model, you must deploy it as if it was a new model, and then delete the old model from the undesired region.

## Next steps

- [What is Power BI Premium?](service-premium-what-is.md)
- [Multi-Geo for Power BI Embedded capacities](../developer/embedded/embedded-multi-geo.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

Power BI has released Power BI Premium Gen2, which improves the Power BI Premium experience with improvements in the following:
* Performance
* Per-user licensing
* Greater scale
* Improved metrics
* Autoscaling
* Reduced management overhead

For more information about Power BI Premium Gen2, see [Power BI Premium Generation 2](service-premium-what-is.md#power-bi-premium-generation-2).