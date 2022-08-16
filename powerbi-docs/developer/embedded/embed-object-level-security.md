---
title: Embed a report that uses object-level security
description: Embed a report that has object-level security (OLS).
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 08/16/2022
---

# Object level security

Object-level security (OLS) enables model authors to secure specific tables or columns from report viewers. For example, a column that includes personal data can be restricted so that only certain viewers can see and interact with it. In addition, you can also restrict object names and metadata. This added layer of security prevents users without the appropriate access levels from discovering business critical or sensitive personal information like employee or financial records. For viewers that don’t have the requisite permission, it's as if the secured tables or columns don't exist.  

## Create a report that uses OLS

Like RLS, OLS is also defined within model roles. Currently, you can't create OLS definitions natively in Power BI Desktop.

* To create rules on **Power BI Desktop** datasets, use external tools such as [Tabular Editor](https://tabulareditor.github.io/).  
* To create rules in **Power BI Service**, set the [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools) using [TMSL](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference) or [TOM](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo).

## Embed a report that use object level security

The process of [generating embed tokens](generate-embed-token.md#row-level-security) for items that use OLS is the same as for RLS.

If the report you want to embed is using one of the following scenarios, you might need to take some extra steps:

* [Paginated reports](embed-paginated-reports.md)
* [SQL Server Analysis Services (SSAS)](sql-server-analysis-services-embed.md)
* Azure AD
* Single sign-on

## Considerations and limitations

* Datasets with OLS configured for one or more table or column objects aren't supported with these Power BI features:

  * Q&A visualizations
  * Quick insights visualizations
  * Smart narrative visualizations
  * Excel Data Types gallery

* Row-level security and object-level security can't be combined from different roles. An error is generated at query time for users who are members of such a combination of roles.

* Dynamic calculations (measures, KPIs, DetailRows) are automatically restricted if they reference a secured table or column. While you can't explicitly secure a measure, you can implicitly secure a measure by updating the expression to refer to a secured table or column.

* Relationships that reference a secured column work, as long as the table the column is in isn't secured.

## Next steps

[Object-level security in Azure Analysis Services](/analysis-services/tabular-models/object-level-security)
