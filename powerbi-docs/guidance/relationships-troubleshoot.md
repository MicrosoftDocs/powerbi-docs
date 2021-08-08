---
title: Relationship troubleshooting guidance
description: Guidance for troubleshooting model relationship issues.
author: peter-myers
ms.author: kfollis
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 03/02/2020
---

# Relationship troubleshooting guidance

This article targets you as a data modeler working with Power BI Desktop. It provides you with guidance on how to troubleshoot specific issues you may encounter when developing models and reports.

[!INCLUDE [relationships-prerequisite-reading](includes/relationships-prerequisite-reading.md)]

## Troubleshooting checklist

When a report visual is configured to use fields from two (or more) tables, and it doesn't present the correct result (or any result), it's possible that the issue is related to model relationships.

In this case, here's a general troubleshooting checklist to follow. You can progressively work through the checklist until you identify the issue(s).

1. Switch the visual to a table or matrix, or open the "See Data" pane—it's easier to troubleshoot issues when you can see the query result
1. If there's an empty query result, switch to Data view—verify that tables have been loaded with rows of data
1. Switch to Model view—it's easy to see the relationships and quickly determine their properties
1. Verify that relationships exist between the tables
1. Verify that cardinality properties are correctly configured—they could be incorrect if a "many"-side column presently contains unique values, and has been incorrectly configured as a "one"-side
1. Verify that the relationships are active (solid line)
1. Verify that the filter directions support propagation (interpret arrow heads)
1. Verify that the correct columns are related—either select the relationship, or hover the cursor over it, to reveal the related columns
1. Verify that the related column data types are the same, or at least compatible—it's possible to relate a text column to a whole number column, but filters won't find any matches to propagate
1. Switch to Data view, and verify that matching values can be found in related columns

## Troubleshooting guide

Here's a list of issues together with possible solutions.

|Issue|Possible reason(s)|
|---------|---------|
|The visual displays no result|- The model is yet to be loaded with data<br />- No data exists within the filter context<br />- Row-level security is enforced<br />- Relationships aren't propagating between tables—_follow checklist above_<br />- Row-level security is enforced, but a bi-directional relationship isn't enabled to propagate—see [Row-level security (RLS) with Power BI Desktop](../create-reports/desktop-rls.md)|
|The visual displays the same value for each grouping |- Relationships don't exist<br />- Relationships aren't propagating between tables—_follow checklist above_|
|The visual displays results, but they aren't correct|- Visual is incorrectly configured<br />- Measure logic is incorrect<br />- Model data needs to be refreshed<br />- Source data is incorrect<br />- Relationship columns are incorrectly related (for example, **ProductID** column maps to **CustomerID**)<br />- It's a relationship between two DirectQuery tables, and the "one"-side column of a relationship contains duplicate values|
|BLANK groupings or slicer/filter items appear, and the source columns don't contain BLANKs|- It's a regular relationship, and "many"-side column contain values not stored in the "one"-side column—see [Model relationships in Power BI Desktop (Regular relationships)](../transform-model/desktop-relationships-understand.md#regular-relationships)<br />- It's a regular one-to-one relationship, and related columns contain BLANKs—see [Model relationships in Power BI Desktop (Regular relationships)](../transform-model/desktop-relationships-understand.md#regular-relationships)<br />- An inactivate relationship "many"-side column stores BLANKs, or has values not stored on the "one"-side|
|The visual is missing data|- Incorrect/unexpected filters are applied<br />- Row-level security is enforced<br />- It's a limited relationship, and there are BLANKs in related columns, or data integrity issues—see [Model relationships in Power BI Desktop (limited relationships)](../transform-model/desktop-relationships-understand.md#limited-relationships)<br />- It's a relationship between two DirectQuery tables, the relationship is configured to [assume referential integrity](../transform-model/desktop-relationships-understand.md#assume-referential-integrity), but there are data integrity issues (mismatched values in related columns)|
|Row-level security is not correctly enforced|- Relationships aren't propagating between tables—_follow checklist above_<br />- Row-level security is enforced, but a bi-directional relationship isn't enabled to propagate—see [Row-level security (RLS) with Power BI Desktop](../create-reports/desktop-rls.md)|
|||

## Next steps

For more information related to this article, check out the following resources:

- [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
