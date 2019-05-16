---
title: Power BI and Azure egress
description: Understand Azure egress charges and Power BI based on tenant location and Power BI Premium
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/08/2019
ms.author: davidi

LocalizationGroup: Data from databases
---
# Power BI and Azure egress

When using Power BI with Azure data sources, you can avoid Azure egress charges by making sure your Power BI tenant is in the same region as your Azure data sources.

When your Power BI tenant is deployed in the same Azure region as you deploy your data sources, you do not incur egress charges for scheduled refresh and DirectQuery interactions. 

## Determining where your Power BI tenant is located

To find out where your Power BI tenant is located, see the [where is my Power BI tenant located](service-admin-where-is-my-tenant-located.md) article.

For Power BI Premium Multi-Geo customers, if your Power BI tenant is not in the optimal location for some of your Azure-based data sources, you can deploy Power BI Premium Multi-Geo in the desired Azure region and benefit from having your Power BI tenant and Azure data sources in the same Azure region.

## Next steps

For more information about Power BI Premium or Multi-Geo, take a look at the following resources:

* [What is Microsoft Power BI Premium?](service-premium-what-is.md)
* [How to purchase Power BI Premium](service-admin-premium-purchase.md)
* [Multi-Geo support for Power BI Premium (Preview)](service-admin-premium-multi-geo.md)
* [Where is my Power BI tenant located?](service-admin-where-is-my-tenant-located.md)
* [Power BI Premium FAQ](service-premium-faq.md)


