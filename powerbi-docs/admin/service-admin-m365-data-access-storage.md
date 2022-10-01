---
title:  Where data is located when Power BI data is shared with your Microsoft 365 services
description: Find the data region for Power BI content shared with Microsoft 365 and learn how that location is selected.
author: ajburnle
ms.author: ajburnle
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 10/10/2022
---

# Where data is located when Power BI data is shared with your Microsoft 365 services

The Power BI adminstrator can use the **Allow your Microsoft 365 services to process or store Power BI data which may be outside of your Power BI tenant's geographic area** switch to share Power BI content on the Office.com home page. Power BI and Microsoft 365 are two separate services, so this switch is a cross-service capability. Use of this cross-service capability may cause Power BI data may flow outside of the geographic region the tenant is located in. This is because your Power BI service and Microsoft 365 service may have different data requirements and locations. So data shared with Microsoft 365 may be processed or stored in a different region if your Power BI tenant is located in a different region from your Microsoft 365 service. It is important to know where the data is stored because it 

## What is data

Microsoft categorizes data as three different types customer data, personal data, and professional services data. The data used for the Power BI service would be categorized as customer data. For definitions and more information about the data types, see [How Microsoft categorizes data for online services](https://www.microsoft.com/trust-center/privacy/customer-data-definitions).

## Where Power BI data is stored

The geographical location of Power BI data is determined by the user who signs up for the Power BI service and selects the region for the Power BI tenant. Power BI uses the same data storage locations as Azure Active Directory (Azure AD), so Azure AD assigns the Power BI service a data center location closest to the selected region. Ideally you select the region where most of your users are located. For more information about data storage locations for Azure AD, see [Azure AD - where is your data located](https://msit.powerbi.com/view?r=eyJrIjoiZmMyODcxZWMtMWY4ZS00N2Q1LTgzNGQtYzQzODZhMDlmM2NmIiwidCI6IjcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0NyIsImMiOjV9).

## Where Microsoft 365 data is stored
The geographical location of Microsoft 365 data is determined by first transaction on the subscription. The country or region where the transaction associated with the Microsoft 365 tenant's first subscription occurred is where the data will be stored. For more information about data storage for Microsoft 365, see [Where your Microsoft 365 customer data is stored](https://learn.microsoft.com/microsoft-365/enterprise/o365-data-locations?view=o365-worldwide)

## Learn more
- [Find the default region for your organization](service-admin-where-is-my-tenant-located.md)
- [Share data with your Microsoft 365 services admin settings](service-admin-portal-share-data-microsoft-365-services.md)
- [Where your data is located](https://www.microsoft.com/trust-center/privacy/data-location?rtc=1)