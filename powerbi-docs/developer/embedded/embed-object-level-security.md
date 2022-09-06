---
title: Embed a report that uses object-level security
description: Embed a report that has object-level security (OLS).
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 09/06/2022
---

# Object level security

Object-level security (OLS) enables model authors to secure specific tables or columns from report viewers. For example, a column that includes personal data can be restricted so that only certain viewers can see and interact with it. In addition, you can also restrict object names and metadata. This added layer of security prevents users without the appropriate access levels from discovering business critical or sensitive personal information like employee or financial records. For viewers that don’t have the requisite permission, it's as if the secured tables or columns don't exist.  

## Prerequisites

This article assumes that you have a report that uses OLS that you want to embed into an app. To create a report that uses OLS, see [Object level security (OLS)](../../enterprise/service-admin-ols.md).

## Embed a report that use object level security

The process of [generating embed tokens](generate-embed-token.md#row-level-security) for items that use OLS is the same as for RLS.

If the report you want to embed is using one of the following scenarios, you might need to take some extra steps:

* [SQL Server Analysis Services (SSAS)](sql-server-analysis-services-embed.md)
* [Azure AD](./embed-azure-analysis-services.md)

## Considerations and limitations

[See restrictions for OLS models](/analysis-services/tabular-models/object-level-security#restrictions)

## Next steps

[Object-level security in Azure Analysis Services](/analysis-services/tabular-models/object-level-security)
