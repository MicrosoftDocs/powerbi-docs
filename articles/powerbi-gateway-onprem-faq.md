<properties
pageTitle="On-premises data gateway FAQ"
description="This is the on-premises data gateway FAQ. This collects frequently asked questions into one spot for the gateway."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
backup=""
editor=""
tags=""
qualityFocus="no"
qualityDate=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="06/22/2016"
ms.author="asaxton"/>
# On-Premises Data Gateway FAQ

<!-- Shared FAQ shared Include -->
[AZURE.INCLUDE [gateway-onprem-faq-shared-include](../includes/gateway-onprem-faq-shared-include.md)]

## Analysis Services

**Question:** Can I use msdmpump.dll to create custom effective username mappings for Analysis Services?  
**Answer:** No. This is not supported at this time.

**Question:** Can I use the gateway to connect to a multidimensional (OLAP) instance.  
**Answer:** Yes! The enterprise gateway supports live connections to both Analysis Services Tabular and Multidimensional models.

**Question:** What if I install the gateway on a computer in a different domain from my on-premises server that uses Windows authentication?  
**Answer:** No guarantees here. It all depends on the trust relationship between the two domains. If the two different domains are in a trusted domain model, then the gateway might be able to connect to the Analysis Services server and the effective user name can be resolved. If not, you may encounter a login failure. 

**Question:** How can I find out what effective username is being passed to my on-premises Analysis Services server?  
**Answer:** We answer this in the [troubleshooting article](powerbi-gateway-onprem-tshoot.md).

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

**Question:** How often are tiles in a dashboard, in Power BI, refreshed when connected through the enterprise gateway?  
**Answer:** About ten minutes. DirectQuery connections are just that. This doesn’t mean that a tile issues a query to your on-premises server, and shows new data, every ten minutes.

**Question:** Can I upload Excel workbooks with Power Pivot data models that connect to on-premises data sources? Do I need a gateway for this scenario?  
**Answer:** Yes, you can upload the workbook. And, no, you don’t need a gateway. But, because the data will reside in the Excel data model, reports in Power BI based on the Excel workbook will not be live. In order to refresh reports in Power BI, you’d have to re-upload an updated workbook each time. Or, use the gateway with scheduled refresh.

**Question:** If users share dashboards that has a DirectQuery connection, will those other users be able to see the data even though they might not have the same permissions.  
**Answer:** For a dashboard connected to Analysis Services, users will only see the data they have access to. If the users do not have the same permissions, they will not be able to see any data. For other data sources, all users will share the credentials entered by the admin for that data source.

**Question:** Is a Pro license required to use the gateway?  
**Answer:** Yes.

**Question:** Is a Pro license required for users when interacting with a dashboard or report that makes use of the gateway?  
**Answer:** Yes.

## See also
[On-premises data gateway](powerbi-gateway-onprem.md)

[On-premises data gateway in-depth](powerbi-gateway-onprem-indepth.md)

[Troubleshooting the On-premises Data Gateway](powerbi-gateway-onprem-tshoot.md)