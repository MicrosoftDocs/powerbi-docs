---
title: "Create recursive hierarchy groups in a paginated report"
description: Discover uses for recursive hierarchy groups in a paginated report in Report Builder. Display hierarchical data such as employees in an organizational chart.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Create recursive hierarchy groups in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

To display recursive data in paginated reports (where the relationship between parent and child is represented by fields in the dataset), set the data region group expression based on the child field and set the Parent property based on the parent field.

Displaying hierarchical data is a common use for recursive hierarchy groups, for example, employees in an organizational chart. The dataset includes a list of employees and the managers, where the manager names also appear in the list of employees.

## Create Recursive Hierarchies

To build a recursive hierarchy in a tablix data region, you must set the group expression to the field that specifies the child data and the Parent property of the group to the field that specifies the parent data. For example, for a dataset that includes fields for employee ID and manager ID where employees report to managers, set the group expression to employee ID and the Parent property to manager ID.

A group that is defined as a recursive hierarchy (that is, a group that uses the Parent property) can have only one group expression. You can use the **Level** function in text box padding to indent employee names based on their level in the hierarchy.

For more information, see [Add or Delete a Group in a Data Region (Power BI Report Builder)](../report-design/add-delete-group-data-region-report-builder.md) and  [Create a Recursive Hierarchy Group (Power BI Report Builder)](/sql/reporting-services/report-design/create-a-recursive-hierarchy-group-report-builder-and-ssrs).

### Aggregate Functions that support Recursion

You can use Reporting Services aggregate functions that accept the parameter *Recursive* to calculate summary data for a recursive hierarchy. The following functions accept **Recursive** as a parameter:

- [Sum](/sql/reporting-services/report-design/report-builder-functions-sum-function)
- [Avg](/sql/reporting-services/report-design/report-builder-functions-avg-function)
- [Count](/sql/reporting-services/report-design/report-builder-functions-count-function)
- [CountDistinct](/sql/reporting-services/report-design/report-builder-functions-countdistinct-function)
- [CountRows](/sql/reporting-services/report-design/report-builder-functions-countrows-function)
- [Max](/sql/reporting-services/report-design/report-builder-functions-max-function)
- [Min](/sql/reporting-services/report-design/report-builder-functions-min-function)
- [StDev](/sql/reporting-services/report-design/report-builder-functions-stdev-function)
- [StDevP](/sql/reporting-services/report-design/report-builder-functions-stdevp-function)
- [Sum](/sql/reporting-services/report-design/report-builder-functions-sum-function)
- [Var](/sql/reporting-services/report-design/report-builder-functions-var-function)
- [VarP](/sql/reporting-services/report-design/report-builder-functions-varp-function).

For more information, see [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference).

## Related content

- [Tables, Matrices, and Lists (Power BI Report Builder)](/sql/reporting-services/report-design/tables-matrices-and-lists-report-builder-and-ssrs)
- [Tablix Data Region (Power BI Report Builder)](../../paginated-reports/report-builder-tables-matrices-lists.md)
- [Aggregate Functions Reference (Power BI Report Builder)](/sql/reporting-services/report-design/report-builder-functions-aggregate-functions-reference)
- [Tables (Power BI Report Builder)](/sql/reporting-services/report-design/tables-report-builder-and-ssrs)
- [Matrices (Power BI Report Builder)](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs)
- [Lists (Power BI Report Builder)](/sql/reporting-services/report-design/create-invoices-and-forms-with-lists-report-builder-and-ssrs)
