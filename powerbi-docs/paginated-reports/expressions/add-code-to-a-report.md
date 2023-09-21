---
title: "Add code to a paginated report"
description: Find out how to call your own custom code for any expression you have in your paginated report in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 09/21/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Add code to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In any expression, you can call your own custom code in a paginated report.

Embed code written in Visual Basic directly in your report. For more information about other references you can make from your code, see [Custom Code in Expressions (Power BI Report Builder)](./custom-code-and-assembly-references-in-expressions.md).

## Add embedded code to a report

1. In **Design** view, right-click the design surface outside the border of the report and select **Report Properties**.

1. Select **Code**.

1. In **Custom code**, type the code. Errors in the code produce warnings when the report runs. The following example creates a custom function named `ChangeWord` that replaces the word "`Bike`" with "`Bicycle`".

    ```
    Public Function ChangeWord(ByVal s As String) As String
       Dim strBuilder As New System.Text.StringBuilder(s)
       If s.Contains("Bike") Then
          strBuilder.Replace("Bike", "Bicycle")
          Return strBuilder.ToString()
          Else : Return s
       End If
    End Function
    ```

1. The following example shows how to pass a dataset field named Category to this function in an expression:

    ```
    =Code.ChangeWord(Fields!Category.Value)
    ```

     If you add this expression to a table cell that displays category values, whenever the word "Bike" is in the dataset field for that row, the table cell value displays the word "Bicycle" instead.

## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
