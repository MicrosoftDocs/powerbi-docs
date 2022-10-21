---
title:  Where data is located when Power BI data is shared with your Microsoft 365 services
description: Find the data region for Power BI content shared with Microsoft 365 and learn how that location is selected.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 10/21/2022
---

# Where data is located when Power BI data is shared with your Microsoft 365 services

The Power BI administrator can use the **Allow your Microsoft 365 services to process or store Power BI data which may be outside of your Power BI tenant's geographic area** switch to share Power BI content on the Office.com home page. Power BI and Microsoft 365 are distinct and separately operated Microsoft cloud services each deployed according to their own service specific data center alignment rules, even when purchased together. Accordingly, your Microsoft 365 Services and Power BI service may not be deployed in the same geographic region. When this Power BI tenant setting is enabled, Power BI data shared with Microsoft 365 may be processed or stored in the Microsoft 365 region even if it is a different region than where Power BI is deployed.

## What data is shared

To learn more about the data shared when you use this feature, see [Data that will be shared with Microsoft 365](./admin-share-power-bi-metadata-microsoft-365-services.md#data-that-will-be-shared-with-microsoft-365).

## Where Power BI data is stored

For more information about data storage locations, see [Find the default region for your organization](./service-admin-where-is-my-tenant-located.md) and [Product Availability by Geography](https://powerplatform.microsoft.com/availability-reports/)

## Where Microsoft 365 data is stored
For more information about data storage for Microsoft 365, see [Where your Microsoft 365 customer data is stored](/microsoft-365/enterprise/o365-data-locations) and [Multi-Geo Capabilities in Microsoft 365](https://www.microsoft.com/microsoft-365/business/multi-geo-capabilities).

## Learn more
- [Share data with your Microsoft 365 services admin settings](./admin-share-power-bi-metadata-microsoft-365-services.md)
- [Where your data is located](https://www.microsoft.com/trust-center/privacy/data-location?rtc=1)