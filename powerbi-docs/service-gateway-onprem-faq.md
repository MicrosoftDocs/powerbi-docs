---
title: On-premises data gateway FAQ
description: This is the On-premises data gateway FAQ. This collects frequently asked questions into one spot for the gateway.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-gateways
ms.topic: conceptual
ms.date: 01/24/2018
ms.author: mblythe

LocalizationGroup: Gateways
---
# On-premises data gateway FAQ
<!-- Shared FAQ shared Include -->
[!INCLUDE [gateway-onprem-faq-shared-include](./includes/gateway-onprem-faq-shared-include.md)]

## Analysis Services
**Question:** Can I use msdmpump.dll to create custom effective username mappings for Analysis Services?  
**Answer:** No. This is not supported at this time.

**Question:** Can I use the gateway to connect to a multidimensional (OLAP) instance.  
**Answer:** Yes! The On-premises data gateway supports live connections to both Analysis Services Tabular and Multidimensional models.

**Question:** What if I install the gateway on a computer in a different domain from my on-premises server that uses Windows authentication?  
**Answer:** No guarantees here. It all depends on the trust relationship between the two domains. If the two different domains are in a trusted domain model, then the gateway might be able to connect to the Analysis Services server and the effective user name can be resolved. If not, you may encounter a login failure.

**Question:** How can I find out what effective username is being passed to my on-premises Analysis Services server?  
**Answer:** We answer this in the [troubleshooting article](service-gateway-onprem-tshoot.md).

**Question:** I have 25 databases in Analysis Services, is there a way to have them all enabled for the gateway at once?  
**Answer:** No. This is on the roadmap, but we don’t have a timeframe.

## Administration
**Question:** Can I have more than one admin for a gateway?  
**Answer:** Yes! When you manage a gateway, you can go to the administrator’s tab to add additional admins.

**Question:** Does the gateway admin need to be an admin on the machine where the gateway is installed?  
**Answer:** No. The gateway admin is used to manage the gateway from within the service.

**Question:** Can I prevent users in my organization from creating a gateway?  
**Answer:** No. This is on the roadmap, but we don’t have a timeframe.

**Question:** Can I get usage and statistics information of the gateways in my organization?  
**Answer:** No. This is on the roadmap, but we don’t have a timeframe.

## Power BI
**Question:** Do I need to upgrade the personal gateway?
**Answer:** No, you can keep using the personal gateway for Power BI.

**Question:** How often are tiles in a dashboard, in Power BI, refreshed when connected through the On-premises data gateway?  
**Answer:** About ten minutes. DirectQuery connections are just that. This doesn’t mean that a tile issues a query to your on-premises server, and shows new data, every ten minutes.

**Question:** Can I upload Excel workbooks with Power Pivot data models that connect to on-premises data sources? Do I need a gateway for this scenario?  
**Answer:** Yes, you can upload the workbook. And, no, you don’t need a gateway. But, because the data will reside in the Excel data model, reports in Power BI based on the Excel workbook will not be live. In order to refresh reports in Power BI, you’d have to re-upload an updated workbook each time. Or, use the gateway with scheduled refresh.

**Question:** If users share dashboards that has a DirectQuery connection, will those other users be able to see the data even though they might not have the same permissions.  
**Answer:** For a dashboard connected to Analysis Services, users will only see the data they have access to. If the users do not have the same permissions, they will not be able to see any data. For other data sources, all users will share the credentials entered by the admin for that data source.

**Question:** Why can't I connect to my Oracle server?  
**Answer:** You may need to install the Oracle client and configure the tnsnames.ora file with the proper server information in order to connect to your Oracle server. This is a separate install outside of the gateway. For more information, see [Installing the Oracle Client](service-gateway-onprem-manage-oracle.md#installing-the-oracle-client).

**Question:** Will the gateway work with ExpressRoute?  
**Answer:** Yes. For more information about ExpressRoute and Power BI, see [Power BI and ExpressRoute](service-admin-power-bi-expressroute.md).

**Question:** I'm using R scripts. Is that supported?
**Answer**: R scripts are supported only for personal mode.​

## Next steps
[On-premises data gateway](service-gateway-onprem.md)  
[On-premises data gateway in-depth](service-gateway-onprem-indepth.md)  
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

