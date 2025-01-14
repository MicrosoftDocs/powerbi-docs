---
title: Limitations of Power BI Q&A
description: Learn about the current limitations of Power BI Q&A, including the supported data sources, review question limitations, and teach Q&A limitations.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 12/04/2024
---
# Limitations of Power BI Q&A

The [Q&A feature](../consumer/end-user-q-and-a.md) allows users to explore data from their Power BI semantic model using natural language to receive answers in the form of charts and graphs. Q&A is not available for [Power BI Report Server](../report-server/install-powerbi-desktop.md).  

## Supported data sources

Power BI Q&A supports the following configurations of data sources in the Power BI service:

- Import mode
- DirectQuery
- Live connect to Azure Analysis Services
- Live connect to on-premises SQL Server Analysis Services tabular models

In each of these configurations, row-level security is also supported. Object-level security is supported for models hosted in the Power BI service but not for live connect to Azure Analysis Services or on-premises SQL Server Analysis Services models.

## DirectQuery support for Q&A

Q&A supports SQL DirectQuery sources with APPROXIMATEDISTINCOUNT, including SQL Server 2019, Azure SQL Database, and Azure Synapse Analytics. You can use [Q&A to ask natural-language questions](../connect-data/desktop-directquery-about.md) against these data sources. 

## Data sources not supported

### Composite model support

Q&A also supports composite models, if the model contains at least one of the following data sources:

- One import data source.
- One supported DirectQuery data source.

If the model contains a mix of data sources, we only index columns from import tables or columns from supported DirectQuery sources. Thus, you can only ask questions about the instance values for columns from these data sources. You still can ask questions about the columns themselves. 

- Object-level security with any type of data source
- Reporting Services

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

Currrently, redefining a recognized term or defining other types of conditions or phrases isn't supported.

### Statements not supported

- Multiple conditions aren't supported. As a workaround, create a Data Analysis Expressions (DAX) calculated column that evaluates a multi-condition statement Boolean and use this field instead.
- If you don't specify a filter condition when Q&A prompts for a subset of data, you can't save the definition, even if the entire statement has no red underlines.

## Related content

There are several best practices for improving the natural language engine. For more information, see [Best practices to optimize Q&A in Power BI](q-and-a-best-practices.md).
