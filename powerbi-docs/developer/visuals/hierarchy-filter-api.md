---
title: The hierarchical identity Filters API for better embedded BI insights
description: This article discusses how Power BI visuals can filter visuals based on several attributes.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 06/19/2022
---

# The hierarchical identity filters API in Power BI visuals

The **Hierarchy Identity filter API** enables visuals that use [Matrix DataView Mapping](./dataview-mappings.md#matrix-data-mapping) to filter data on several attributes at a time based on data points that use a hierarchy structure.

This API is useful in the following scenarios:

* Filtering hierarchies based on data points
* Custom visuals that use semantic models with group on keys

Note:

· The Hierarchy Identity filter API is available from API version 5.9.0

· To use this filter, the visual should contain only one grouping data role.

To enable filtering for the visual, the *capabilities.json* file should contain a `filter` object in the `general` section.
