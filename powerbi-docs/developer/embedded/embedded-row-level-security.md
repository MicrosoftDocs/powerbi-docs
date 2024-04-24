---
title: Security in Power BI embedded analytics
description: Learn what steps to take to embed Power BI content securely within your application using RLS, OLS or other security measures.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 05/14/2023
---

# Security features in Power BI Embedded

Power BI Embedded has several ways to filter data and restrict data access to specific users. Some of these security methods are:

* [**Row-Level Security (RLS)**](/fabric/security/service-admin-rls)
  RLS enables you to control access to rows in a database table through group memberships. When you embed items, you can use RLS to restrict user access to specific rows of data. With RLS, different users can work with the same items but see different data.

* [**Object level security (OLS)**](/analysis-services/tabular-models/object-level-security)
  OLS enables you to hide specific tables or columns from report viewers. You can also secure sensitive object names and metadata to prevent them from being discovered.

* [**Workspace based isolation**](./embed-multi-tenancy.md) and multitenancy  
 In this scenario, each customer has their own separate semantic model. Since each customer only has access to their own workspace, no further filtering needed, though this method can be combined with RLS to further filter data within each organization.

## Security solutions for different ISV scenarios

Depending on the situation, some common cases where security measures can be applied include:

* Small to medium sized [ISVs](pbi-glossary.md#independent-software-vendor-isv) who serve multiple customers and want each customer to see their own data only. If the customer base isn't too large, the ISV can use a single semantic model and report for all their customers, and use [dynamic RLS](cloud-rls.md#dynamic-security) to filter the data for each customer.

* ISVs who serve one or more large customers or organizations with multiple departments. The ISV can  separate their customers with a combination of [static and dynamic RLS](./embed-multi-tenancy.md#row-level-security), and possibly OLS.

* Large scale ISVs with thousands of customers where each customer needs to see only their own data. The ISV can use [workspace based isolation with service principal profiles](./embed-multi-tenancy.md). Each customer can get their own report and semantic model and the ISV can further [filter within each organization using RLS](./embed-multi-tenancy.md#row-level-security).

## Embed a report that uses security features

Depending on your setup, you may have to take several steps before you can generate an embed token.
For instructions on how to embed reports or other items, go to the link that best describes your specific scenario:

* [Standard RLS](cloud-rls.md)
* [Embedding paginated reports](paginated-reports-row-level-security.md)
* [SQL Server Analysis Services](sql-server-analysis-services-embed.md)
* [Azure Analysis Services](./embed-azure-analysis-services.md)
* [Object level security](./embed-object-level-security.md)

## Considerations and limitations

* Assigning users to roles within the Power BI service doesn't affect RLS or OLS when using an embed token (*App owns data* scenario only).
* Although RLS settings don't apply to admins, members, or contributors, when you supply an identity with an embed token, the RLS permissions of that identity will be applied to the data.

## Related content

* [Generate an embed token](./generate-embed-token.md)
* [Row-Level security (RLS) with Power BI](/fabric/security/service-admin-rls)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
