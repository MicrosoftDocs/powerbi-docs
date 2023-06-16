---
title: "Add code to a paginated report"
description: Find out how to call your own custom code for any expression you have in your paginated report in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.date: 06/16/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
ms.reviewer: rpatkar
---
# Add code to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In any expression, you can call your own custom code in a paginated report.
  
Embed code written in Visual Basic directly in your report. If your code refers to a Microsoft .NET Framework that is not <xref:System.Math> or <xref:System.Convert>, you must add the reference to the report. For more information, see [Add an Assembly Reference to a Paginated Report](./add-assembly-reference.md). For more information about other references you can make from your code, see [Custom Code and Assembly References in Expressions &#40;Power BI Report Builder&#41;](./custom-code-and-assembly-references-in-expressions.md).  

  
## Add embedded code to a report  
  
1.  In **Design** view, right-click the design surface outside the border of the report and select **Report Properties**.  
  
2.  Select **Code**.  
  
3.  In **Custom code**, type the code. Errors in the code produce warnings when the report runs. The following example creates a custom function named `ChangeWord` that replaces the word "`Bike`" with "`Bicycle`".  
  
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
  
4.  The following example shows how to pass a dataset field named Category to this function in an expression:  
  
    ```  
    =Code.ChangeWord(Fields!Category.Value)  
    ```  
  
     If you add this expression to a table cell that displays category values, whenever the word "Bike" is in the dataset field for that row, the table cell value displays the word "Bicycle" instead.  
  
## Next steps
 [Expression Uses in Reports &#40;Power BI Report Builder&#41;](./expression-uses-reports-report-builder.md)   
 [Expression Examples &#40;Power BI Report Builder&#41;](./report-builder-expression-examples.md)   
 [Data Types in Expressions &#40;Power BI Report Builder&#41;](./data-types-expressions-report-builder.md)   
 [Expression Scope for Totals, Aggregates, and Built-in Collections &#40;Power BI Report Builder&#41;](./expression-scope-for-totals-aggregates-and-built-in-collections.md) 
  
