---
title: Limitations of Power BI Q&A
description: Current limitations of Power BI Q&A
author: mohaali
manager: mohaali

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/14/2019
ms.author: mohaali

---
# Datasource Limitations
## Datasources supported

Power BI Q&A today supports the following configurations in the service;

- Import mode
- Live connect to Azure Analysis Services
- Live connect to Sql Server Analysis Services (With a gateway)
- Power BI Datasets (Power BI Desktop will report an error with Q&A when using a Power BI dataset, however, when you publish the report the error will disappear)

In each of these configurations, row Level security is also supported.

## Datasources not supported

Power BI Q&A currently does not support the following configurations;

- Object level security with any type of datasource
- Direct Query against any source (a workaround to support this is to use Live connect with AAS which uses Direct Query)
- Composite Models
- Reporting Services

# Tooling limitations

The new tooling dialog allows users to customize and improve the natural language in Q&A. To learn more about tooling [click here](qna-tooling-intro.md).

## Review questions limitations

The review questions will only store questions asked against your data model for up to 28 days. When using the new review questions capability, you may notice some questions are not recorded. This is by design as the natural language engine will perform a series of data cleansing steps to ensure every key stroke from a user is not recorded or shown.

Tenant administrators can also turn off this capability by going to the tenant admin settings and switch off or allow certain Security Groups access to this capability.

Users can also disable their questions from being recorded by going to the settings screen and deselecting 'Allow Q&A to record my utterance'. 

## Teach Q&A limitations

Teach Q&A allows you to fix two types of errors;

- Assign a word to a field
- Assign a word a filter condition

Currently we do not support redefining a recognized term or define other types of conditions/phrases. Also when defining filtering conditions, you can only use a limited subset of language including:

- 'Country' which is 'USA'
- 'Country' which is not 'USA'
- 'Weight' > 2000
- 'Weight' = 2000
- 'Weight' < 2000

> [!NOTE]
> Q&A Tooling only supports import mode and does not yet support connecting to an on-prem/Azure analysis services, this is a current limitation which will be removed in subsequent releases of Power BI'

### Statements not supported

- Using measures in conditions is currently not supported, convert measures to calculated columns in order for them to work
- Multiple conditions are not supported, as a workaround, create a DAX calculated column which evaluates a multi condition statement boolean and use this field instead
- If you do not specify a filter condition when Q&A prompts for a subset of data, you will be unable to save the definition even if the entire statement has no red underlines.
