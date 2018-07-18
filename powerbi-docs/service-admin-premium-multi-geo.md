---
title: Multi-geo support in Power BI Premium (Preview)
description: Learn how you can deploy content to datacenters in regions other than the home region of the Power BI tenant.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 07/17/2018
ms.author: maggies

LocalizationGroup: Premium
---
# Multi-geo support in Power BI Premium (Preview)
Learn how you can deploy content to datacenters in regions other than the home region of the Power BI tenant with Power BI Premium. You may choose to deploy content to any of the following regions:

- United States 
- Canada 
- United Kingdom 
- Brazil 
- Europe 
- Japan 
- India 
- Asia Pacific 
- Australia 

Multi-geo isn't available for Power BI Germany, Power BI China operated by 21Vianet, or Power BI for the US government.

## Using multi-geo

For new capacities, enable multi-geo by selecting a region other than the default region from the dropdown.  Each available capacity shows the region where it's currently located, such as **West Central US**.

![Capacity size: select a region. Power BI multi-geo](media/service-admin-premium-multi-geo/power-bi-multi-geo-capacity-size.png)
  
After you've created capacity, it remains in that region, and any workspaces created will have their content stored in that region. You can migrate workspaces from one region to another through the dropdown on the workspace settings screen.

![Edit workspace: Choose an available capacity. Power BI multi-geo](media/service-admin-premium-multi-geo/power-bi-multi-geo-edit-workspace.png)

You see this message to confirm the change. 

![Change assigned workspace confirmation](media/service-admin-premium-multi-geo/power-bi-multi-geo-change-assigned-workspace-capacity.png)

You don't need to reset the gateway credentials during a migration at this time.  After they're stored in the Premium capacity region, you will need to reset them upon migration.
   
During migration, certain operations may fail, such as publishing new datasets or scheduled data refresh.  

The following items are stored in the Premium region when multi-geo is enabled:
 
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
 
## View Capacity Regions

In the Admin Portal, you can view all the capacities for your Power BI tenant and the regions where they’re currently located.

![View premium capacities](media/service-admin-premium-multi-geo/power-bi-multi-geo-premium-capacities.png) 

## Moving content out of multi-geo  

You can take workspaces out of multi-geo capacity one of two ways:

- Delete the current capacity where the workspace is located.  This moves the workspace back to shared capacity in the home region.
- Migrate individual workspaces back to Premium capacity located in the home tenant.

## Limitations and considerations

Confirm that any movement you initiate between regions follows all corporate and government compliance requirements prior to initiating data transfer.

A cached query stored in a remote region stays in that region at rest. However, other data in transit may go back and forth between multiple geographies. 

When moving data from one region to another in a multi-geo environment, the source data may remain in the region from which the data was moved for up to 30 days. During that time end users don't have access to it. It's removed from this region and destroyed during the 30-day period.

## Next steps

[Power BI Premium: What is it?](service-premium.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
