---
title: "Relationship troubleshooting guidance"
description: "Guidance for troubleshooting Power BI data model relationship issues."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: troubleshooting
ms.custom: fabric-cat
ms.date: 12/27/2024
---

# Relationship troubleshooting guidance

This article targets you as a data modeler who works with Power BI Desktop. It provides guidance on how to troubleshoot specific issues that you might encounter when developing models and reports.

[!INCLUDE [relationships-prerequisite-reading](includes/relationships-prerequisite-reading.md)]

## Troubleshooting

When a report visual is set up to use fields from two (or more) tables, and it doesn't present the correct result (or any result), it's possible that the issue is related to the model relationships.

In this case, here's a general troubleshooting checklist to follow. You can progressively work through the checklist until you identify the issue(s).

1. Switch the visual to a table or matrix, or open the _See Data_ pane—it's easier to troubleshoot issues when you can see the query result.
1. If there's an empty query result, switch to Table view—verify that tables have been loaded with rows of data.
1. Switch to Model view—it's easy to see the relationships and quickly determine their properties.
1. Verify that relationships exist between the tables.
1. Verify that cardinality properties are correctly set—they could be incorrect if a "many"-side column presently contains unique values, and it has been incorrectly set as a "one" side.
1. Verify that the relationships are active (solid line).
1. Verify that the filter directions support propagation (interpret arrow heads).
1. Verify that the correct columns are related—either select the relationship, or hover the cursor over it to reveal the related columns.
1. Verify that the related column data types are the same, or at least compatible—it's possible to relate a text column to a whole number column, but filters won't find any matches to propagate filters.
1. Switch to Table view, and verify that matching values can be found in related columns.

## Troubleshooting guide

Here's a list of issues and their possible reasons.

| Issue | Possible reason(s) |
|---|---|
| The visual displays no result | &bull;&nbsp;The model is yet to be loaded with data. <br/>&bull;&nbsp;No data exists within the filter context. <br/>&bull;&nbsp;Row-level security (RLS) is enforced. <br/>&bull;&nbsp;Relationships aren't propagating between tables—_follow checklist above_. <br/>&bull;&nbsp;RLS is enforced, but a bi-directional relationship isn't enabled to propagate—see [Row-level security (RLS) with Power BI Desktop](/fabric/security/service-admin-row-level-security). |
| The visual displays the same value for each grouping | &bull;&nbsp;Relationships don't exist. <br/>&bull;&nbsp;Relationships aren't propagating between tables—_follow checklist above_. |
| The visual displays results, but they aren't correct | &bull;&nbsp;Visual is incorrectly set up. <br/>&bull;&nbsp;Measure calculation logic is incorrect. <br/>&bull;&nbsp;Model data needs to be refreshed. <br/>&bull;&nbsp;Source data is incorrect. <br/>&bull;&nbsp;Relationship columns are incorrectly related (for example, the `ProductID` column maps to the `CustomerID` column). <br/>&bull;&nbsp;It's a relationship between two DirectQuery tables, and the "one"-side column of a relationship contains duplicate values. |
| BLANK groupings or slicer/filter items appear, and the source columns don't contain BLANKs | &bull;&nbsp;It's a regular relationship, and "many"-side column contain values not stored in the "one"-side column—see [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md#regular-relationships). <br/>&bull;&nbsp;It's a regular one-to-one relationship, and related columns contain BLANKs—see [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md#regular-relationships). <br/>&bull;&nbsp;An inactive relationship "many"-side column stores BLANKs, or has values not stored on the "one" side. |
| The visual is missing data | &bull;&nbsp;Incorrect/unexpected filters are applied. <br/>&bull;&nbsp;RLS is enforced. <br/>&bull;&nbsp;It's a limited relationship, and there are BLANKs in related columns, or data integrity issues—see [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md#limited-relationships). <br/>&bull;&nbsp;It's a relationship between two DirectQuery tables, the relationship is set to [assume referential integrity](../transform-model/desktop-relationships-understand.md#assume-referential-integrity), but there are data integrity issues (mismatched values in related columns). |
| RLS isn't correctly enforced | &bull;&nbsp;Relationships aren't propagating between tables—_follow checklist above_. <br/>&bull;&nbsp;RLS is enforced, but a bi-directional relationship isn't enabled to propagate—see [Row-level security (RLS) with Power BI Desktop](/fabric/security/service-admin-row-level-security). |

## Related content

For more information related to this article, check out the following resources:

- [Model relationships in Power BI Desktop](../transform-model/desktop-relationships-understand.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)
