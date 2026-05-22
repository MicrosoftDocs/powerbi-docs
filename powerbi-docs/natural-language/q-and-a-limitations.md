---
title: Limitations of Power BI Q&A
description: Learn about the current limitations of Power BI Q&A, including the supported data sources, review question limitations, and teach Q&A limitations.
author: kgremban
ms.author: kgremban
ms.service: powerbi
ms.topic: concept-article
ms.date: 05/22/2026
ai-usage: ai-assisted

#customer intent: As a Power BI user, I want to understand the limitations of Q&A so that I know which data sources and configurations are supported.
---
# Limitations of Power BI Q&A

> [!IMPORTANT]
> Q&A experiences are going away in December 2026. Use [Copilot for Power BI](../create-reports/copilot-introduction.md) instead, which offers a more advanced and integrated way to query your data using natural language. For more details and recommended alternatives, see [Deprecating Power BI Q&A](https://powerbi.microsoft.com/blog/deprecating-power-bi-qa).

The [Q&A feature](../explore-reports/end-user-q-and-a.md) allows users to explore data from their Power BI semantic model using natural language to receive answers in the form of charts and graphs. Q&A is not available for [Power BI Report Server](../report-server/install-powerbi-desktop.md).  

## Supported data sources in the Power BI service

Power BI Q&A supports the following configurations of data sources in the Power BI service. For supported data sources in Power BI Desktop, see [Data sources for natural language Q&A](q-and-a-data-sources.md#supported-data-sources-in-power-bi-desktop).

- Import mode
- DirectQuery
- Live connect to Azure Analysis Services
- Live connect to on-premises SQL Server Analysis Services tabular models

In each of these configurations, row-level security is also supported. Object-level security is supported for models hosted in the Power BI service but not for live connect to Azure Analysis Services or on-premises SQL Server Analysis Services models.

### DirectQuery support for Q&A

Q&A supports SQL DirectQuery sources with APPROXIMATEDISTINCOUNT, including SQL Server 2019, Azure SQL Database, and Azure Synapse Analytics. You can use Q&A to ask natural-language questions against these data sources. For more information, see [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md).

### Composite model support

Q&A supports composite models if the model contains at least one of the following data sources:

- One import data source.
- One supported DirectQuery data source.

If the model contains a mix of data sources, Q&A only indexes columns from import tables or columns from supported DirectQuery sources. You can only ask questions about the instance values for columns from these data sources, but you can still ask questions about the columns themselves.

## Unsupported configurations

Q&A doesn't support the following configurations:

- Object-level security with any type of data source.
- Reporting Services.

## Q&A setup limitations 

The [Q&A setup feature](q-and-a-tooling-teach-q-and-a.md) is only available from Power BI Desktop. Q&A setup supports the following data sources: 

- Import mode  
- DirectQuery   

## Review question limitations

The review questions only store questions asked about your data model for up to 28 days. Power BI administrators can use the tenant settings to manage the ability to store questions. Permissions are based on security groups. 

Users can also keep their questions from being recorded by selecting **Settings** > **General** and setting the **Q&A option** to Off.

:::image type="content" source="media/q-and-a-limitations/privacy-q-and-a-questions.png" alt-text="Screenshot showing Privacy Help your dataset owners by sharing the questions you asked about their data.":::

## Teach Q&A limitations

Teach Q&A allows you to define unrecognized terms by assigning a word to a field or filter condition. When defining filtering conditions, you can only use a limited subset of language, including: 

- Product category which is accessories
- Product category which is not accessories 
- Products > 100
- Products greater than 100
- Products = 100
- Products equal 100
- Products < 100

Currently, redefining a recognized term or defining other types of conditions or phrases isn't supported.

### Statements not supported

- Multiple conditions aren't supported. As a workaround, create a Data Analysis Expressions (DAX) calculated column that evaluates a multi-condition statement Boolean and use this field instead.
- If you don't specify a filter condition when Q&A prompts for a subset of data, you can't save the definition, even if the entire statement has no red underlines.

## Related content

- [Best practices to optimize Q&A in Power BI](q-and-a-best-practices.md)
- [Q&A for Power BI business users](../explore-reports/end-user-q-and-a.md)
- [Copilot for Power BI](../create-reports/copilot-introduction.md)
