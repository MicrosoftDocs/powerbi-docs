---
title: "Group expression examples in paginated reports"
description: Find out how to group paginated report data by a single field or create more complex expressions that identify the data on which to group in Report Builder.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Group expression examples in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  In a data region in a paginated report, you can group data by a single field, or create more complex expressions that identify the data on which to group. Complex expressions include references to multiple fields or parameters, conditional statements, or custom code. When you define a group for a data region, you add these expressions to the **Group** properties. For more information, see [Add or Delete a Group in a Data Region (Report Builder and SSRS)](../report-design/add-delete-group-data-region-report-builder.md).

To merge two or more groups that are based on simple field expressions, add each field to the group expressions list in the group definition.

## Examples of Group Expressions

The following table provides examples of group expressions that you can use to define a group.

| Description | Expression |
| --- | --- |
| Group by the `Region` field. | `=Fields!Region.Value` |
| Group by last name and first name. | `=Fields!LastName.Value`<br /><br />`=Fields!FirstName.Value` |
| Group by the first letter of the last name. | `=Fields!LastName.Value.Substring(0,1)` |
| Group by parameter, based on user selection.<br /><br />In this example, the parameter `GroupBy` must be based on an available values list that provides a valid choice to group on. | `=Fields(Parameters!GroupBy.Value).Value` |
| Group by three separate age ranges:<br /><br />"Under 21", "Between 21 and 50", and "Over 50". | `=IIF(First(Fields!Age.Value)<21,"Under 21",(IIF(First(Fields!Age.Value)>=21 AND First(Fields!Age.Value)<=50,"Between 21 and 50","Over 50")))` |
| Group by many age ranges. This example shows custom code written in Visual Basic .NET that returns a string for the following ranges:<br /><br />25 or Under<br /><br />26 to 50<br /><br />51 to 75<br /><br />Over 75 | `=Code.GetRangeValueByAge(Fields!Age.Value)`<br /><br />Custom code:<br /><br />`Function GetRangeValueByAge(ByVal age As Integer) As String`<br /><br />`Select Case age`<br /><br />`Case 0 To 25`<br /><br />`GetRangeValueByByAge = "25 or Under"`<br /><br />`Case 26 To 50`<br /><br />`GetRangeValueByByAge = "26 to 50"`<br /><br />`Case 51 to 75`<br /><br />`GetRangeValueByByAge = "51 to 75"`<br /><br />`Case Else`<br /><br />`GetRangeValueByByAge = "Over 75"`<br /><br />`End Select`<br /><br />`Return GetRangeValueByByAge`<br /><br />`End Function` |

## Related content

- [Filter, Group, and Sort Data (Power BI Report Builder)](../report-design/filter-group-sort-data-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
