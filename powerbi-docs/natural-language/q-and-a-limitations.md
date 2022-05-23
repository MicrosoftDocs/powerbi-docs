---
title: Limitations of Power BI Q&A
description: Current limitations of Power BI Q&A
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 09/09/2020
---
# Limitations of Power BI Q&A

Power BI Q&A currently has some limitations.

## Data sources

### Supported data sources

Power BI Q&A supports the following configurations of data sources in the Power BI service:

- Import mode
- Live connect to Azure Analysis Services
- Live connect to SQL Server Analysis Services (with a gateway)
- Power BI datasets.

In each of these configurations, row-level security is also supported.

**DirectQuery support for Q&A** (preview)

Q&A now supports SQL DirectQuery sources, including SQL Server 2019, Azure SQL Database, and Azure Synapse Analytics. You can use Q&A to ask natural-language questions against these data sources. There's one small change to the behavior of Q&A when it's in DirectQuery mode: After you type your question, you select the **Submit** button. This change prevents overloading the DirectQuery source with unnecessary queries as you type.

### Data sources not supported

Power BI Q&A currently does not support the following configurations:

- Object level security with any type of data source
- Composite models
- Reporting Services 

## Tooling limitations

The new tooling dialog allows users to customize and improve the natural language in Q&A. To learn more about tooling, read the [intro to Q&A tooling](q-and-a-tooling-intro.md).

## Review question limitations

The review questions only store questions asked against your data model for up to 28 days. When using the new review questions capability, you may notice some questions aren't recorded. They aren't recorded by design, as the natural language engine performs a series of data cleansing steps to ensure every key stroke from a user isn't recorded or shown.

Power BI administrators can use the tenant settings to manage the ability to store questions. Permissions are based on security groups. 

Users can also keep their questions from being recorded by selecting **Settings** > **General** and deselecting **Allow Q&A to record my utterance**. 

## Teach Q&A limitations

Teach Q&A allows you to fix two types of errors:

- Assign a word to a field.
- Assign a word a filter condition.

Currently we don't support redefining a recognized term or defining other types of conditions or phrases. Also, when defining filtering conditions, you can only use a limited subset of language, including:

- Country which is USA
- Country which is not USA
- Products > 100
- Products greater than 100
- Products = 100
- Products is 100
- Products < 100
- Products smaller than 100

> [!NOTE]
> Q&A Tooling only supports import mode. It doesn't yet support connecting to an on-premises or Azure Analysis Services data source. This current limitation will be removed in subsequent releases of Power BI.

### Statements not supported

- Multiple conditions aren't supported. As a workaround, create a DAX calculated column that evaluates a multi-condition statement Boolean and use this field instead.
- If you don't specify a filter condition when Q&A prompts for a subset of data, you can't save the definition, even if the entire statement has no red underlines.

## Next steps

There are a number of best practices for improving the natural language engine. For more information, [Q&A best practices](q-and-a-best-practices.md).
