---
title: Use row-level security with embedded content in Power BI embedded analytics
description: Learn how to embed Power BI RLS content within your application securely.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 04/07/2022
---

# What is row level security (RLS)

**Row-Level Security (RLS)** enables you to control access to rows in a database table through group memberships. You can restrict user access to data within dashboards, tiles, reports, and datasets. With RLS, different users can work with the same items all while seeing different data.

If you're embedding for other Power BI users (*user owns data*), within your organization (for example, to restrict access to data based on an employee's business division or role in the company), RLS works the same as it does within the Power BI service directly. There's nothing more you need to do in your application. For information on setting up a data model that supports RLS see [RLS guidance in Power BI Desktop](/guidance/rls-guidance). For more information, see [Row-Level security (RLS) with Power BI](../../enterprise/service-admin-rls.md).

If you're embedding for non-Power BI users (*app owns data*), which is typically an [ISV](pbi-glossary.md#independent-software-vendor-isv) scenario, then this article is for you!

## Who should use RLS

RLS can be used as a security tool in many situations. Some common cases where RLS can be applied include:

* Small to medium sized ISVs who serve multiple customers and wants each customer to see their own data only. If the ISV doesn't expect the customer base to grow too large, they can use one dataset and one report for all their customers and use dynamic RLS to filter the data for each customer.

* ISVs who serve one or more big customers or organizations with multiple departments. The ISV can use [workspace based isolation ith service principal profiles](./embed-multi-tenancy.md) to separate their customers and a combination of [static and dynamic RLS](./embed-multi-tenancy.md#row-level-security) to further filter data within each workspace.

* Large scale ISVs with thousands of customers and each customer needs to see only their own data. The ISV can use [workspace based isolation ith service principal profiles](./embed-multi-tenancy.md). Each customer can get their own report and dataset.

## How to use RLS with Power BI embedded analytics

To use RLS with Power BI embedded analytics, you'll need to configure the embed token to account for the user and role. Depending on your setup, you may also need to take some other steps when setting up your model.

For information on how to embed reports or other items that use RLS, go to the link that best describes your specific scenario:

* [Cloud based RLS](cloud-rls.md)
* [Embedding paginated reports](paginated-reports-row-level-security.md)
* [SQL Server Analysis Services](sql-server-analysis-services-embed.md)
* Azure Active directory
* Single sign-on

### Configure the embed token

To configure the embed token, you'll need to know the following information:

* username
* role

## Object level security

Object-level security (OLS) enables model authors to secure specific tables or columns from report viewers. From a viewer standpoint, the table or column simply does not exist. Like RLS, OLS is also defined within model roles.  With object-level security, you can not only restrict access to data, but also sensitive object names. This prevents users from discovering sensitive information like employee or financial records.
To learn more about OLS see [Object-level security](/analysis-services/tabular-models/object-level-security).
The process of generating embed tokens for items that use OLS is the [same as for RLS](./generate-embed-token.md).

## Considerations and limitations

* Assignment of users to roles within the Power BI service doesn't affect RLS when using an embed token.
* While the Power BI service doesn't apply RLS setting to admins or members with edit permissions, when you supply an identity with an embed token, it applies to the data.
* Analysis Services live connections are supported for on-premises servers.
* Azure Analysis Services live connections support filtering by roles. Dynamic filtering can be done using CustomData.
* If the underlying dataset doesn't require RLS, the GenerateToken request must **not** contain an effective identity.
* If the underlying dataset is a cloud model (cached model or DirectQuery), the effective identity must include at least one role, otherwise role assignment doesn't occur.
* A list of identities enables multiple identity tokens for dashboard embedding. For all others items, the list contains a single identity.

### Token-based Identity limitations

* You can use RLS only if you have a capacity.
* RLS doesn't work with SQL Server on-premises.

## Next steps

* [RLS guidance in Power BI Desktop](/guidance/rls-guidance)
* [Row-Level security (RLS) with Power BI](../../enterprise/service-admin-rls.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
