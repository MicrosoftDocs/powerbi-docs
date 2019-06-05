---
title: Troubleshooting Nested Values returned as Text in Power BI Service
description: Learn about how to fix nested values being converted to a string when using improper data source privacy settings
author: gepopell
manager: kfile
ms.reviewer: ''

ms.custom: 
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 6/4/2019
ms.author: gepopell

LocalizationGroup: Reports
---
# Troubleshooting Nested Values returned as Text in Power BI Service

## Cause

In the past, there have been cases where a Power BI report refreshed fine in the Desktop, but failed on the Power BI service with an error like “We cannot convert the value "[Table]" to type Table”. One of the causes of this error is that when the Data Privacy Firewall (link here?) buffers a data source, nested non-scalar values (such as tables, records, lists, and functions) are automatically converted to text values (such as “[Table]” or “[Record]”).

Now that the Power BI service supports the setting of privacy levels (or turning off the Firewall entirely), such errors can be avoided by [configuring the data source privacy settings](https://powerbi.microsoft.com/en-us/blog/privacy-levels-for-cloud-data-sources/) in the Power BI service to be non-Private.

Starting with June Power BI, when the Firewall buffers a nested table/record/list/etc., instead of silently converting such values to text, the following error will be produced: 

`We cannot return a value of type Table in this context`

## Effect on Load/Refresh

While the change is motivated by Firewall buffering, its impact extends to Load/Refresh as well. In order to address the Firewall buffering behavior, we also had to change the behavior of loading nested tables/records/etc. to the Power BI Model and the Excel Data Model in PQ for Excel. Before, nested tables/records/etc. would be loaded as text values (such as “[Table]” or “[Record]”). They'll now be treated as errors, which will result in a null value in the loaded table and an error count increment in the load results.

Since these errors only occur during Load/Refresh, they will not appear in the Power Query Editor.

### Before

- Load/Refresh with no errors
- Loaded table contains “[Table]”, “[Record]”, etc.
 

### After

- Load/Refresh with errors
- Loaded table contains NULLs (instead of “[Table]”, “[Record]”, etc.)
 

## Resolution

Are you loading a column that contains non-scalar values (for example tables, lists, records, etc.)?
If so, you should be able to eliminate the errors by removing the column.
If you cannot remove the column, you should be able to replicate the old behavior by adding a custom column and using logic like the following sample:

`if [MyColumn] is table then "[Table]" else if [MyColumn] is record then "[Record]" else if [MyColumn] is list then "[List]" else if [MyColumn] is function then "[Function]" else [MyColumn]`

Does the issue repro in Power BI Desktop if you set all your data source privacy settings to Private?
If so, you should be able to resolve the error by [configuring their data source privacy settings](https://powerbi.microsoft.com/en-us/blog/privacy-levels-for-cloud-data-sources/) in the Power BI service to be non-Private.
