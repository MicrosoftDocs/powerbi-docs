---
title: "Aggregate functions reference for paginated reports"
description: Use built-in aggregate functions in expressions in Report Builder to include aggregated values in your paginated report.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Report Builder functions - aggregate functions reference in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  To include aggregated values in your paginated report, you can use built-in aggregate functions in expressions. The default aggregate function for numeric fields is SUM. You can edit the expression and use a different built-in aggregate function or specify a different scope. Scope identifies which set of data to use for the calculation.

As the report processor combines report data and the report layout, the expressions for each report item are evaluated. As you view each page of the report, you see the results for each expression in the rendered report items.

The following table lists categories of built-in functions that you can include in an expression:

- [Built-in Aggregate Functions](#CalculatingAggregates)

- [Restrictions on Built-in Fields, Collections, and Aggregate Functions](#Restrictions)

- [Restrictions on Nested Aggregates](#NestedRestrictions)

- [Calculating Running Values](#CalculatingRunningValues)

- [Retrieving Row Counts](#RetrievingRowCounts)

- [Looking Up Values from Another Dataset](#LookupFunctions)

- [Retrieving Sort-Dependent Values](#RetrievingPostsortValues)

- [Retrieving Server Aggregates](#RetrievingServerAggregates)

- [Retrieving Recursive Level](#RetrievingRecursiveLevel)

- [Testing for Scope](#TestingforScope)

To determine the valid scopes for a function, see the individual function reference topic. For more information and for examples, see [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md).

## <a id="CalculatingAggregates"></a> Built-in Aggregate Functions

The following built-in functions calculate summary values for a set of non-null numeric data in the default scope or the named scope.

| **Function** | **Description** |
| --- | --- |
| [Avg](/sql/reporting-services/report-design/report-builder-functions-avg-function) | Returns the average of all non-null numeric values specified by the expression, evaluated in the given scope. |
| [Count](/sql/reporting-services/report-design/report-builder-functions-count-function) | Returns a count of non-null values specified by the expression, evaluated in the context of the given scope. |
| [CountDistinct](/sql/reporting-services/report-design/report-builder-functions-countdistinct-function) | Returns a count of all distinct non-null values specified by the expression, evaluated in the context of the given scope. |
| [Max](/sql/reporting-services/report-design/report-builder-functions-max-function) | Returns the maximum value of all non-null numeric values specified by the expression, in the context of the given scope. You can use this for specifying a chart axis maximum value to control the scale. |
| [Min](/sql/reporting-services/report-design/report-builder-functions-min-function) | Returns the minimum value of all non-null numeric values specified by the expression, in the context of the given scope. You can use this for specifying a chart axis minimum value to control the scale. |
| [StDev](/sql/reporting-services/report-design/report-builder-functions-stdev-function) | Returns the standard deviation of all non-null numeric values specified by the expression, evaluated in the given scope. |
| [StDevP](/sql/reporting-services/report-design/report-builder-functions-stdevp-function) | Returns the population standard deviation of all non-null numeric values specified by the expression, evaluated in the context of the given scope. |
| [Sum](/sql/reporting-services/report-design/report-builder-functions-sum-function) | Returns the sum of all the non-null numeric values specified by the expression, evaluated in the given scope. |
| [Union](/sql/reporting-services/report-design/report-builder-functions-union-function) | Returns the union of all the non-null spatial data values of type **SqlGeometry** or **SqlGeography** that are specified by the expression, evaluated in the given scope. |
| [Var](/sql/reporting-services/report-design/report-builder-functions-var-function) | Returns the variance of all non-null numeric values specified by the expression, evaluated in the given scope. |
| [VarP](/sql/reporting-services/report-design/report-builder-functions-varp-function) | Returns the population variance of all non-null numeric values specified by the expression, evaluated in the context of the given scope. |



## <a id="Restrictions"></a> Restrictions on Built-in Fields, Collections, and Aggregate Functions

The following table summarizes restrictions in report locations on where you can add expressions that contain references to global built-in collections.

| Location in Report | Fields | Parameters | ReportItems | PageNumber<br /><br />TotalPages | DataSource<br /><br />DataSet | Variables | RenderFormat |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Page Header<br /><br />Page Footer | Yes | Yes | At most one <sup>1</sup> | Yes | Yes | Yes | Yes |
| Body | Yes <sup>2</sup> | Yes | Only items in the current scope or a containing scope <sup>3</sup> | No | Yes | Yes | Yes |
| Report Parameter | No | Only parameters earlier in the list <sup>4</sup> | No | No | No | No | No |
| Field | Yes | Yes | No | No | No | No | No |
| Query Parameter | No | Yes | No | No | No | No | No |
| Group Expression | Yes | Yes | No | No | Yes | No | No |
| Sort Expression | Yes | Yes | No | No | Yes | Yes <sup>5</sup> | No |
| Filter Expression | Yes | Yes | No | No | Yes | Yes <sup>6</sup> | No |
| Code | No | Yes <sup>7</sup> | No | No | No | No | No |
| Report.Language | No | Yes | No | No | No | No | No |
| Variables | Yes | Yes | No | No | Yes | Current or containing scope | No |
| Aggregates<sup>8</sup> | Yes | Yes | Only in page header/page footer | Only in report item aggregates | Yes | No | No |
| Lookup functions | Yes | Yes | Yes | No | Yes | No | No |

<sup>1</sup> ReportItems must exist in the rendered report page, or their value is Null. If the visibility of a report item depends on an expression that evaluates to False, the report item does not exist on the page.

<sup>2</sup> If a field reference is used in a group scope, and the field reference is not included in the group expression, then the value for the field is undefined, unless there is only one value in the scope. To specify a value, use First or Last and the group scope.

<sup>3</sup> Expressions that include a reference to ReportItems can specify values for other ReportItems in the same group scope or in a containing group scope.

<sup>4</sup> Property values for earlier parameters might be null.

<sup>5</sup> In Member sorts only. Cannot use in data region sort expressions.

<sup>6</sup> In Member filters only. Cannot use in data region or dataset filter expressions.

<sup>7</sup> The Parameters collection is not initialized until after the Code block is processed, so methods cannot be used to control parameters on initialization.

<sup>8</sup> Data type for all aggregates except Count and CountDistinct must be the same data type, or null, for all values.



## <a id="NestedRestrictions"></a> Restrictions on Nested Aggregates

The following table summarizes restrictions on which aggregates functions can specify other aggregate functions as nested aggregates.

| Context | RunningValue | RowNumber | First<br /><br />Last | Previous | Sum and Other Presort functions | ReportItem aggregates | Lookup functions | Aggregate Function |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Running Value | No | No | No | No | Yes | No | Yes | No |
| First<br /><br />Last | No | No | No | No | Yes | No | No | No |
| Previous | Yes | Yes | Yes | No | Yes | No | Yes | No |
| Sum and other Presort functions | No | No | No | No | Yes | No | Yes | No |
| ReportItem aggregates | No | No | No | No | No | No | No | No |
| Lookup functions | Yes | Yes<sup>1</sup> | Yes<sup>1</sup> | Yes<sup>1</sup> | Yes<sup>1</sup> | Yes<sup>1</sup> | No | No |
| Aggregate Function | No | No | No | No | No | No | No | No |

<sup>1</sup> Aggregate functions are only allowed inside the *Source* expression of a Lookup function if the Lookup function is not contained in an aggregate. Aggregate functions are not allowed inside the *Destination* or *Result* expressions of a Lookup function.



## <a id="CalculatingRunningValues"></a> Calculate Running Values

The following built-in functions calculate running values for a set of data. **RowNumber** is like **RunningValue** in that it returns the running value of a count that increments for each row within the containing scope. The scope parameter for these functions must specify a containing scope, which controls when the count restarts.

| **Function** | **Description** |
| --- | --- |
| [RowNumber](/sql/reporting-services/report-design/report-builder-functions-rownumber-function) | Returns a running count of the number of rows for the specified scope. The **RowNumber** function restarts counting at 1, not 0. |
| [RunningValue](/sql/reporting-services/report-design/report-builder-functions-runningvalue-function) | Returns a running aggregate of all non-null numeric values specified by the expression, evaluated for the given scope. |



## <a id="RetrievingRowCounts"></a> Retrieve Row Counts

The following built-in function calculates the number of rows in the given scope. Use this function to count all rows, including rows with null values.

| **Function** | **Description** |
| --- | --- |
| [CountRows](/sql/reporting-services/report-design/report-builder-functions-countrows-function) | Returns the number of rows in the specified scope, including rows with null values. |



## <a id="LookupFunctions"></a> Look Up Values from Another Dataset

The following lookup functions retrieve values from a specified dataset.

| **Function** | **Description** |
| --- | --- |
| [Lookup Function](/sql/reporting-services/report-design/report-builder-functions-lookup-function) | Returns a value from a dataset for a specified expression. |
| [LookupSet Function](/sql/reporting-services/report-design/report-builder-functions-lookupset-function) | Returns a set of values from a dataset for a specified expression. |
| [Multilookup Function](/sql/reporting-services/report-design/report-builder-functions-multilookup-function) | Returns the set of first-match values for a set of names from a dataset that contains name/value pairs. |



## <a id="RetrievingPostsortValues"></a> Retrieve Sort-Dependent Values

The following built-in functions return the first, last, or previous value within a given scope. These functions depend on the sort order of the data values. Use these functions, for example, to find the first and last values on a page to create a dictionary-style page header. Use **Previous** to compare a value in one row to the previous row's value within a specific scope, for example, to find percentage year over year values in a table.

| **Function** | **Description** |
| --- | --- |
| [First](/sql/reporting-services/report-design/report-builder-functions-first-function) | Returns the first value in the given scope of the specified expression. |
| [Last](/sql/reporting-services/report-design/report-builder-functions-last-function) | Returns the last value in the given scope of the specified expression. |
| [Previous](/sql/reporting-services/report-design//report-builder-functions-previous-function) | Returns the value or the specified aggregate value for the previous instance of an item within the specified scope. |



## <a id="RetrievingServerAggregates"></a> Retrieve Server Aggregates

The following built-in function retrieves custom aggregates from the data provider. For example, using an Analysis Services data source type, you can retrieve aggregates calculated on the data source server for use in a group header.

| **Function** | **Description** |
| --- | --- |
| [Aggregate](/sql/reporting-services/report-design/report-builder-functions-aggregate-function) | Returns a custom aggregate of the specified expression, as defined by the data provider. |



## <a id="TestingforScope"></a> Test for Scope

The following built-in function tests the current context of a report item to see if it is a member of a specific scope.

| Function | Description |
| --- | --- |
| [InScope](/sql/reporting-services/report-design/report-builder-functions-inscope-function) | Indicates whether the current instance of an item is within the specified scope. |



## <a id="RetrievingRecursiveLevel"></a> Retrieve Recursive Level

The following built-in function retrieves the current level when a recursive hierarchy is processed. Use the result of this function with the **Padding** property in a text box to control the indent level of a visual hierarchy for a recursive group. For more information, see [Creating Recursive Hierarchy Groups (Power BI Report Builder)](./creating-recursive-hierarchy-groups-report-builder.md).

| Function | Description |
| --- | --- |
| [Level](/sql/reporting-services/report-design/report-builder-functions-level-function) | Returns the current level of depth in a recursive hierarchy. |



## Related content

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
