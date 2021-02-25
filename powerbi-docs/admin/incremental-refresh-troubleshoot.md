---
title: Troubleshooting incremental refresh in Power BI
description: Describes common troubleshooting scenarios for incremental refresh.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: 
ms.topic: how-to
ms.date: 01/27/2021
LocalizationGroup: 
---
# Troubleshooting incremental refresh

XMLA endpoints in Power BI Premium rely on the native Analysis Services communication protocol for access to Power BI datasets. Because of this, XMLA endpoint troubleshooting is much the same as troubleshooting a typical Analysis Services connection. However, some differences around Power BI-specific dependencies apply.

## Before you begin

Before troubleshooting incremental refresh, be sure to review the basics covered in [Incremental refresh for datasets](incremental-refresh-overview.md) and step-by-step information in [Configure incremental refresh](incremental-refresh-configure.md).

## Query folding

**Problem:** In Power Query Editor, after filtering data and then clicking **Close & Apply**, importing data from the data source takes an excessive amount of time and computer resources.

**Solution:** A common issue is a data type mis-match, where Date/Time is the specified data type in the RangeStart and RangeEnd parameters, but the table date column on which the filters are applied are not Date/Time data type, or vice-versa. Both the parameters data type and the filtered data column must be Date/Time data type and format must be the same. If necessary, use Power Query Diagnostics or SQL Profiler to trace queries passed to the data source.

**Solution:** Data source does not support the Query Folding feature.

## Native queries

**Problem:** Native queries \<need content>

**Solution:** \<need content>

## Query timeouts

**Problem:** Scheduled refresh operations timeout

**Solution:** Scheduled refresh for imported datasets timeout after two hours. This timeout is increased to five hours for datasets in Premium workspaces. If you encounter this limit, consider reducing the size or complexity of your dataset, or consider breaking the dataset into smaller pieces.

## Slow incremental refresh

**Problem:** Large dataset mode is slower to refresh incrementally than the default mode.


**Problem:** Refresh failed because of duplicate values in a table.

**Problem:** The data source does not permit to get more than 64MB of data per query.