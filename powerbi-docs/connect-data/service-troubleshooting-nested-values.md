---
title: Troubleshoot nested values returned as text
description: Learn about how to fix nested values being converted to a string when using improper data source privacy settings.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: 
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 10/08/2024
LocalizationGroup: Reports
---
# Troubleshooting nested values returned as text in the Power BI service

This article describes an issue users may encounter where nested values are converted to a string due to improper data source privacy settings and explains how to address it.

In the past, there have been cases where a report refreshes in Power BI Desktop, but fails on the Power BI service with an error like this text:

```output
We cannot convert the value "[Table]" to type Table
```

## Cause

One of the causes of this error involves nested non-scalar values, such as tables, records, lists, and functions. When the Data Privacy Firewall buffers a data source, nested non-scalar values are converted to text values, such as `"[Table]"` or `"[Record]"`.

The Power BI service now supports setting privacy levels or turning off the Firewall entirely. The errors can be avoided by [configuring the data source privacy settings](https://powerbi.microsoft.com/blog/privacy-levels-for-cloud-data-sources/) in the Power BI service to be *non-Private*.

For more recent versions of Power BI, when the Firewall buffers a nested table, record, or list, it doesn't silently convert non-scalar values to text. Instead, it shows an error:

```output
We cannot return a value of type Table in this context
```

## Effect on Load/Refresh

This change motivated by Firewall buffering also extends to Load/Refresh. The behavior of loading nested tables, records, and lists to the Power BI Model and the Excel Data Model in Power Query for Excel has changed. Before, nested items were loaded as text values, such as `"[Table]"` or `"[Record]"`. Now, they're treated as errors. A `null` value is in the loaded table and error count increments in the load results.

Since these errors only occur during Load/Refresh, they don't appear in the Power Query Editor.

### Before

- Load/Refresh with no errors.
- Loaded table contains `"[Table]"`, `"[Record]"`, and so forth.

### After

- Load/Refresh with errors.
- Loaded table contains `null`, instead of `"[Table]"`, `"[Record]"`, and so forth.

## Resolution

Are you loading a column that contains non-scalar values, for example, tables, lists, or records? If so, you should be able to eliminate the errors by removing the column.

If you can't remove the column, try to replicate the old behavior by adding a custom column and using logic like the following sample:

```output
if [MyColumn] is table then "[Table]" else if [MyColumn] is record then "[Record]" 
else if [MyColumn] is list then "[List]" else if [MyColumn] is function 
then "[Function]" else [MyColumn]
```

Does the issue reproduce in Power BI Desktop if you set all your data source privacy settings to Private? If so, try to resolve the error by [configuring the data source privacy settings](https://powerbi.microsoft.com/blog/privacy-levels-for-cloud-data-sources/) in the Power BI service to be non-Private.
