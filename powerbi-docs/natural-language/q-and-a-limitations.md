---
title: Limitations of Power BI Q&A
description: Learn about the current limitations of Power BI Q&A, including the supported data sources, review question limitations, and Teach Q&A limitations.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 11/06/2024
---
# Limitations of Power BI Q&A

Power BI Q&A currently has some limitations.

## Data sources

### Supported data sources

Power BI Q&A supports the following configurations of data sources in the Power BI service:

- Import mode
- Live connect to Azure Analysis Services
- Live connect to SQL Server Analysis Services (with a gateway)
- Power BI semantic models

In each of these configurations, row-level security is also supported.

#### DirectQuery support for Q&A (preview)

Q&A now supports SQL DirectQuery sources, including SQL Server 2019, Azure SQL Database, and Azure Synapse Analytics. You can use Q&A to ask natural-language questions against these data sources. There's one change to the behavior of Q&A when it's in DirectQuery mode: After you enter your question, select **Submit**. This change prevents overloading the DirectQuery source with unnecessary queries as you type.

#### Composite model support

Q&A also supports composite models, if the model contains at least one of the following data sources:

- One import data source
- One DirectQuery data source that supports APPROXIMATEDISTINCOUNT. Refer to the [DirectQuery support](#directquery-support-for-qa-preview) section in this article for specific sources.

If the model contains a mix of data sources, we only index import columns or columns for data sources that suport APPROXIMATEDISTINCTCOUNT. Thus, you can only ask questions about the instance values for these types of columns. You still can ask questions about the columns themselves. 

### Data sources not supported

Power BI Q&A doesn't support the following configurations:

- Object level security with any type of data source
- Reporting Services 

## Tooling limitations

The new tooling dialog allows users to customize and improve the natural language in Q&A. To learn more about tooling, see [Intro to Q&A tooling](q-and-a-tooling-intro.md).

## Review question limitations

The review questions only store questions asked about your data model for up to 28 days. When using the new review questions capability, you might notice that some questions aren't recorded. They're intentionally not recorded. The natural language engine performs a series of data cleansing steps to ensure that every key stroke from a user isn't recorded or shown.

Power BI administrators can use the tenant settings to manage the ability to store questions. Permissions are based on security groups. 

Users can also keep their questions from being recorded by selecting **Settings** > **General** and clearing the **Allow Q&A to record my utterance** checkbox. 

## Teach Q&A limitations

Teach Q&A allows you to fix two types of errors:

- Assign a word to a field.
- Assign a word a filter condition.

Currently, redefining a recognized term or defining other types of conditions or phrases isn't supported. Also, when defining filtering conditions, you can only use a limited subset of language, including:

- Country/region which is USA
- Country/region which is not USA
- Products > 100
- Products greater than 100
- Products = 100
- Products is 100
- Products < 100
- Products smaller than 100

> [!NOTE]
> Q&A Tooling only supports import mode. It doesn't yet support connecting to an on-premises or Azure Analysis Services data source. This current limitation will be removed in subsequent releases of Power BI.

### Statements not supported

- Multiple conditions aren't supported. As a workaround, create a Data Analysis Expressions (DAX) calculated column that evaluates a multi-condition statement Boolean and use this field instead.
- If you don't specify a filter condition when Q&A prompts for a subset of data, you can't save the definition, even if the entire statement has no red underlines.

## Related content

There are several best practices for improving the natural language engine. For more information, see [Best practices to optimize Q&A in Power BI](q-and-a-best-practices.md).
