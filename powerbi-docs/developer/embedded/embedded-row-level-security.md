---
title: Security in Power BI embedded analytics
description: Learn what steps to take to embed Power BI content securely within your application using RLS, OLS or other security measures.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 09/14/2022
---

# Security features in Power BI Embedded

Power BI Embedded has several ways to filter data and restrict data access to specific users. Among

* **Row-Level Security (RLS)**
  RLS enables you to control access to rows in a database table through group memberships. When you embed items, you can use RLS to restrict user access to data. With RLS, different users can work with the same items but see different data. To learn more about RLS, see [Row-Level security (RLS) with Power BI](../../enterprise/service-admin-rls.md).

* **Object level security (OLS)**
  OLS enables you to hide specific tables or columns from report viewers. You can also secure sensitive object names and metadata to prevent them from being discovered. To learn more about OLS, see [Object-level security](/analysis-services/tabular-models/object-level-security).

## Who should use security features

Depends on situation. Some common cases where RLS can be applied include:

* Small to medium sized [ISVs](pbi-glossary.md#independent-software-vendor-isv) who serve multiple customers and want each customer to see their own data only. If the customer base isn't too large, the ISV can use a single dataset and report for all their customers, and use [dynamic RLS](cloud-rls.md#dynamic-security) to filter the data for each customer.

* ISVs who serve one or more large customers or organizations with multiple departments. The ISV can  separate their customers with a combination of [static and dynamic RLS](./embed-multi-tenancy.md#row-level-security). *Maybe also OLS??*

* Large scale ISVs with thousands of customers where each customer needs to see only their own data. The ISV can use [workspace based isolation with service principal profiles](./embed-multi-tenancy.md). Each customer can get their own report and dataset. In this case each customer only has access to their *own workspace without any further filtering needed.*

## How to embed a report that uses 

If you're embedding for non-Power BI users (***app owns data***)Since your customers aren't Power BI users and don't have permission to access the data, you need to generate an [embed token](./generate-embed-token.md) with an effective identity that can be used to access data. Depending how your data is set up, you might need to take some other steps as well.

Depending on your setup,  steps before you can generate your token.

For information on how to embed reports or other items that use RLS, go to the link that best describes your specific scenario:

* [Cloud based RLS](cloud-rls.md)
* [Embedding paginated reports](paginated-reports-row-level-security.md)
* [SQL Server Analysis Services](sql-server-analysis-services-embed.md)
* Single sign-on

## Considerations and limitations

* Assigning users to roles within the Power BI service doesn't affect RLS or OLS when using an embed token (App owns data scenario only).
* Although RLS setting don't apply to admins, members, or contributors, when you supply an identity with an embed token, the RLS permissions of that identity will be applied to the data.

## Next steps

* [Generate an embed token](./generate-embed-token.md)
* [Row-Level security (RLS) with Power BI](../../enterprise/service-admin-rls.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
