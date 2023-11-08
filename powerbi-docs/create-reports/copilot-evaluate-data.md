---
title: Evaluate your data for use with Copilot for Power BI service
description: Before you start using Copilot with a semantic model, evaluate your data.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: guptamaya
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 10/19/2023
LocalizationGroup: Create reports
---

# Evaluate your data for use with Copilot for Power BI service

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before you start using Copilot with a semantic model, evaluate your data. You may need to do some clean-up work on your semantic model so that Copilot can derive insights from it.

## Considerations

Review these elements.

| Data quality dimension | Check | Threshold/Criteria  |
|-----|------|------|
| [Completeness](#completeness) | Missing or null values  | <5% of the total values |
| Validity (requires a predefined set of valid values)   | Data values that are out of expected range  | <1% of the total values |
| [Consistency](#consistency) | Check for inconsistent values (like differing formats for date)  | 80% consistency  |
| Uniqueness | Duplicate rows or values where they shouldn't be  | 0 duplicate rows/values |
| [Size of the semantic model ](#size-of-the-semantic-model)| Enough rows and columns for diverse report generation | >1000 rows and >10 columns (TBD)  |
| Visualization variety  | Presence of numerical, categorical, and temporal data | At least 1 of each type |
| [Data relationships](#data-relationships) | Presence of keys to connect different tables (if applicable) | At least one key for joining tables |
| [Calculated fields/measures](#calculated-columns-and-measures)  | Presence of columns that are derived from other columns | Dependent on the report requirements  |

## Size of the semantic model 

You can determine the size of a semantic model simply by counting the number of records (rows) and features (columns) it has. This metric is important because semantic models that are too small can lead to underfitting, and semantic models that are too big can lead to too many computational resources being used.

Because of size constraints that exist in large language models (LLMs) like GPT, Copilot can't process semantic model schemas that are very large. In simplest terms, this limitation means that if your semantic model has too many tables, columns, and relationships, it may be too complex for Copilot to handle.

## Data quality

Evaluating data quality can be more complex and involves looking at several aspects:

- [Completeness](#completeness)
- [Consistency](#consistency)
- [Timeliness](#timeliness)
- [Data relationships](#data-relationships)
- [Calculated columns and measures](#calculated-columns-and-measures) 

### Completeness 

Are there missing values in the semantic model? Missing data can reduce the effectiveness of a model or introduce bias. 

### Consistency 

Are data formats and categories consistently used across the semantic model? Inconsistent data can lead to problems in inference. 

### Timeliness 

Is the data current and up to date? Old data might not represent the current situation, especially for rapidly changing environments. 

## Data relationships

- Does the semantic model contain multiple tables that are related by certain keys? 

- Are there fields in the semantic model that are derived from other fields? 

- Does the semantic model contain nested or hierarchical data? 

## Calculated columns and measures  

- Does the semantic model contain columns that are calculated from other fields in the same table or across tables? 

- Does the semantic model contain measures which are calculations aggregated from the data model? 

- How relevant are these calculated columns and measures to the summaries or visuals you expect the model to generate? 

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a report with Copilot for Power BI](copilot-create-report.md)