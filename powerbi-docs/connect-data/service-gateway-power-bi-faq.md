---
title: On-premises data gateway FAQ - Power BI
description: This article is the on-premises data gateway FAQ for Power BI. This article collects frequently asked questions into one spot for the gateway used in Power BI.
author: arthiriyer
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 07/15/2019
ms.author: arthii

LocalizationGroup: Gateways
---

# On-premises data gateway FAQ - Power BI

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

## Power BI

**Question:** Do I need to upgrade the on-premises data gateway (personal mode)?

**Answer:** No, you can keep using the gateway (personal mode) for Power BI.

**Question:** Are any special permissions required to install the gateway and manage it in the Power BI service?

**Answer:** No special permissions are required.

**Question:** Can I upload Excel workbooks with Power Pivot data models that connect to on-premises data sources? Do I need a gateway for this scenario? 

**Answer:** Yes, you can upload the workbook. And, no, you don’t need a gateway. But, because the data will reside in the Excel data model, reports in Power BI based on the Excel workbook won't be live. To refresh reports in Power BI, you have to re-upload an updated workbook each time. Or, use the gateway with scheduled refresh.

**Question:** If users share dashboards that have a DirectQuery connection, will those other users be able to see the data even though they might not have the same permissions? 

**Answer:** For a dashboard connected to Azure Analysis Services, users will see only the data they have access to. If the users don't have the same permissions, they won't be able to see any data. For other data sources, all users will share the credentials entered by the admin for that data source.

**Question:** Why can't I connect to my Oracle server? 

**Answer:** You might need to install the Oracle client and configure the tnsnames.ora file with the proper server information in order to connect to your Oracle server. This is a separate installation outside of the gateway. For more information, see [Install the Oracle client](service-gateway-onprem-manage-oracle.md#install-the-oracle-client).

**Question:** I'm using R scripts. Is that supported?

**Answer**: R scripts are supported only for personal mode.​

## Analysis Services in Power BI

**Question:** Can I use msmdpump.dll to create custom effective username mappings for Analysis Services? 

**Answer:** No. This use isn't supported at this time.

**Question:** Can I use the gateway to connect to a multidimensional (OLAP) instance? 

**Answer:** Yes. The on-premises data gateway supports live connections to both Analysis Services Tabular and Multidimensional models.

**Question:** What if I install the gateway on a computer in a different domain from my on-premises server that uses Windows authentication? 

**Answer:** No guarantees here. It all depends on the trust relationship between the two domains. If the two different domains are in a trusted domain model, the gateway might be able to connect to the Analysis Services server and the effective username can be resolved. If not, you might encounter a login failure.

**Question:** How can I find out what effective username is being passed to my on-premises Analysis Services server? 

**Answer:** We answer this question in the [troubleshooting article](service-gateway-onprem-tshoot.md).

## Next steps

* [Troubleshooting the on-premises data gateway](/data-integration/gateway/service-gateway-tshoot)

More questions? Try the [Power BI Community](https://community.powerbi.com/).
