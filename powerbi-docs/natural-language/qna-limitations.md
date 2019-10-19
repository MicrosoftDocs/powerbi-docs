---
title: Limitations of Power BI Q&A
description: Current limitations of Power BI Q&A
author: mohaali
manager: mohaali

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/18/2019
ms.author: mohaali

---
# Limitations of Power BI Q&A

Power BI Q&A currently has some limitations.

## Data sources

### Supported data sources

Power BI Q&A supports the following configurations of data sources in the Power BI service:

- Import mode
- Live connect to Azure Analysis Services
- Live connect to Sql Server Analysis Services (with a gateway)
- Power BI datasets. Power BI Desktop reports an error with Q&A when using a Power BI dataset. However, when you publish the report to the Power BI service, the error disappears.

In each of these configurations, row-level security is also supported.

### Data sources not supported

Power BI Q&A currently does not support the following configurations:

- Object level security with any type of data source
- DirectQuery against any source. A workaround to support this is to use Live connect with Azure Analysis Services, which uses DirectQuery.
- Composite models
- Reporting Services 

## Tooling limitations

The new tooling dialog allows users to customize and improve the natural language in Q&A. To learn more about tooling, read the [intro to Q&A tooling](qna-tooling-intro.md).

## Review question limitations

The review questions only store questions asked against your data model for up to 28 days. When using the new review questions capability, you may notice some questions aren't recorded. This is by design, as the natural language engine performs a series of data cleansing steps to ensure every key stroke from a user isn't recorded or shown.

Tenant administrators can use the tenant admin settings to manage the ability to store questions. Permissions are based on security groups. 

Users can also keep their questions from being recorded by selecting **Settings** > **General** and deselecting **Allow Q&A to record my utterance**. 

## Teach Q&A limitations

Teach Q&A allows you to fix two types of errors:

- Assign a word to a field.
- Assign a word a filter condition.

Currently we don't support redefining a recognized term or defining other types of conditions or phrases. Also, when defining filtering conditions, you can only use a limited subset of language, including:

- 'Country' which is 'USA'
- 'Country' which is not 'USA'
- 'Weight' > 2000
- 'Weight' = 2000
- 'Weight' < 2000

> [!NOTE]
> Q&A Tooling only supports import mode. It doesn't yet support connecting to an on-premises or Azure Analysis Services data source. This current limitation will be removed in subsequent releases of Power BI.

### Statements not supported

- Using measures in conditions is currently not supported. Instead, convert measures to calculated columns to make them work.
- Multiple conditions aren't supported. As a workaround, create a DAX calculated column that evaluates a multi-condition statement Boolean and use this field instead.
- If you don't specify a filter condition when Q&A prompts for a subset of data, you can't save the definition, even if the entire statement has no red underlines.
