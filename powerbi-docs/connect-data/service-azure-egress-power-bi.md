---
title: Power BI and Azure egress
description: Understand Azure egress charges when using Power BI based on tenant location and Power BI Premium.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/02/2023
LocalizationGroup: Data from databases
---
# Power BI and Azure egress

Data moving out, or *egress*, of Azure data centers can incur bandwidth charges. When using Power BI with Azure data sources, you can avoid Azure egress charges by making sure your Power BI service tenant is in the same region as your Azure data sources.

When your Power BI service tenant is deployed in the same Azure region as you deploy your data sources, you don't incur egress charges for scheduled refresh and DirectQuery interactions.

## Determining where your Power BI tenant is located

To find out where your Power BI tenant is located, see [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md).

For Power BI Premium Multi-Geo customers, if your Power BI tenant isn't in the optimal location for some of your Azure-based data sources, you can deploy Power BI Premium Multi-Geo in the desired Azure region and benefit from having your Power BI tenant and Azure data sources in the same Azure region.

> [!NOTE]
> Power BI Premium Per User (PPU) is not supported for Multi-Geo.

## Related content

For more information about Power BI Premium or Multi-Geo, take a look at the following resources:

* [Azure bandwidth pricing details](https://azure.microsoft.com/pricing/details/bandwidth/)
* [What is Microsoft Power BI Premium?](../enterprise/service-premium-what-is.md)
* [How to purchase Power BI Premium](../enterprise/service-admin-premium-purchase.md)
* [Multi-Geo support for Power BI Premium](../admin/service-admin-premium-multi-geo.md)
* [Where is my Power BI tenant located?](../admin/service-admin-where-is-my-tenant-located.md)
* [Power BI Premium FAQ](../enterprise/service-premium-faq.yml)
