---
title: "Custom code in expressions in a paginated report in Power BI Report Builder"
description: Find out how to add references to custom code embedded in a paginated report.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.date: 09/21/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Custom code in expressions in a paginated report in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can add custom code embedded in a report. Use embedded code for custom constants, complex functions or functions that are used multiple times in a single report. Custom code can include new custom constants, variables, functions, or subroutines. You can include read-only references to built-in collections such as the Parameters collection. However, you cannot pass sets of report data values to custom functions; specifically, custom aggregates are not supported.

> [!NOTE]  
> Custom assemblies are not supported in paginated reports on Power BI. Consider converting logic from custom assembly to embedded code. For examples of alternatives to consider, check [assembly alternatives](https://github.com/chmitch/ssrs-assembly-alternatives).

> [!IMPORTANT]  
> For time-sensitive calculations that are evaluated once at run-time and that you want to remain the same value throughout report processing, consider whether to use a report variable or group variable. For more information, see [Report and Group Variables Collections References (Power BI Report Builder)](/sql/reporting-services/report-design/built-in-collections-report-and-group-variables-references-report-builder).

## <a id="Common"></a> Include References to Commonly Used Functions

Use the **Expression** dialog box to view a categorized list of common functions built-in to Report Builder. When you expand **Common Functions** and select a category, the **Item** pane displays the list of functions that you include in an expression. The common functions include classes from the .NET Framework <xref:System.Math> and <xref:System.Convert> namespaces and Visual Basic run-time library functions. For convenience, you can view the most commonly used functions in the **Expression** dialog box, where they are listed by category: Text, Date and Time, Math, Inspection, Program Flow, Aggregate, Financial, Conversion, and Miscellaneous. Less commonly used functions do not appear in the list but can still be used in an expression.

To use a built-in function, double-click the function name in the Item pane. A description of the function appears in the Description pane and an example of the function call appears in the Example pane. In the code pane, when you type the function name followed by a left parenthesis **(**, the IntelliSense help displays each valid syntax for the function call. For example, to calculate the maximum value for a field named `Quantity` in a table, add the simple expression `=Max(` to the Code pane, and then use the smart tags to view all possible valid syntaxes for the function call. To complete this example, type `=Max(Fields!Quantity.Value)`.

For more information about each function, see <xref:System.Math>, <xref:System.Convert>, and [Visual Basic Runtime Library Members](/dotnet/visual-basic/language-reference/runtime-library-members) on MSDN.

## <a id="NotCommon"></a> Include References to Less Commonly Used Functions

To include a reference to other less commonly used CLR namespaces, you must use a fully qualified reference, for example, <xref:System.Text.StringBuilder>. IntelliSense is not supported in the code pane of the **Expression** dialog box for these less commonly used functions.

For more information, see [Visual Basic Runtime Library Members](/dotnet/visual-basic/language-reference/runtime-library-members) on MSDN.


## <a id="Embedded"></a> Include Embedded Code

To add embedded code to a report, use the Code tab of the **Report Properties** dialog box. The code block you create can contain multiple methods. Methods in embedded code must be written in Microsoft Visual Basic and must be instance-based. The report processor automatically adds references for the System.Convert and System.Math namespaces.

Methods in embedded code are available through a globally defined **Code** member. You access these by referring to the **Code** member and the method name. The following example calls the method **ToUSD**, which converts the value in the `StandardCost` field to a dollar value:

```
=Code.ToUSD(Fields!StandardCost.Value)
```

To reference built-in collections in your custom code, include a reference to the built-in **Report** object:

```
=Report.Parameters!Param1.Value
```

The following examples show how to define some custom constants and variables.

```
Public Const MyNote = "Authored by Bob"
Public Const NCopies As Int32 = 2
Public Dim  MyVersion As String = "123.456"
Public Dim MyDoubleVersion As Double = 123.456
```

Although custom constants do not appear in the **Constants** category in the **Expression** dialog box (which only displays built-in constants), you can add references to them from any expression, as shown in the following examples. In an expression, a custom constant is treated as a **Variant**.

```
=Code.MyNote
=Code.NCopies
=Code.MyVersion
=Code.MyDoubleVersion
```

The following example includes both the code reference and the code implementation of the function **FixSpelling**, which substitutes the text `"Bicycle"` for all occurrences of the text "Bike" in the `SubCategory` field.

`=Code.FixSpelling(Fields!SubCategory.Value)`

The following code, when embedded in a report definition code block, shows an implementation of the **FixSpelling** method. This example shows you how to use a fully qualified reference to the Microsoft .NET Framework **StringBuilder** class.

```vb
Public Function FixSpelling(ByVal s As String) As String
   Dim strBuilder As New System.Text.StringBuilder(s)
   If s.Contains("Bike") Then
      strBuilder.Replace("Bike", "Bicycle")
      Return strBuilder.ToString()
      Else : Return s
   End If
End Function
```

For more information about built-in object collections, see [Built-in Globals and Users References (Power BI Report Builder)](./built-in-collections-built-in-globals-and-users-references-report-builder.md).

## <a id="Parameters"></a> Include References to Parameters from Code

You can reference the global parameters collection via custom code in a Code block of the report definition. The parameters collection is read-only and has no public iterators. You cannot use a Visual Basic **For Each** construct to step through the collection. You need to know the name of the parameter defined in the report definition before you can reference it in your code. You can, however, iterate through all the values of a multi value parameter.

The following table includes examples of referencing the built-in collection `Parameters` from custom code:

**Passing an entire global parameter collection to custom code.**

This function returns the value of a specific report parameter *MyParameter*.

Reference in Expression `=Code.DisplayAParameterValue(Parameters)`

Custom Code definition

```
Public Function DisplayAParameterValue(ByVal parameters as Parameters) as Object
Return parameters("MyParameter").Value
End Function
```

**Passing an individual parameter to custom code.**

Reference in Expression `=Code.ShowParametersValues(Parameters!DayOfTheWeek)`

This example returns the value of the parameter passed in. If the parameter is a multivalue parameter, the return string is a concatenation of all the values.

Custom Code definition

```
Public Function ShowParameterValues(ByVal parameter as Parameter)
 as String
   Dim s as String
   If parameter.IsMultiValue then
      s = "Multivalue: "
      For i as integer = 0 to parameter.Count-1
         s = s + CStr(parameter.Value(i)) + " "
      Next
   Else
      s = "Single value: " + CStr(parameter.Value)
   End If
   Return s
End Function
```

## Next steps

- [Add Code to a Report (Power BI Report Builder)](./add-code-to-a-report.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
