---
title: "Constants in expressions in paginated reports"
description: Learn about the literal text or predefined text of constants in expressions for your paginated reports in Power BI Report Builder.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.date: 06/21/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Constants in expressions in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  A constant in a paginated report consists of literal text or predefined text. The report processor has access to predefined constants so that when you include them in an expression, the values they represent are substituted in the expression before it is evaluated.  
  
  
## Literal Text  
 In an expression, literal text is text that is in double quotation marks. You can also type text directly into a text box without double quotation marks if it is not part of an expression. If the text box value does not begin with an equal sign (=), the text is treated as literal text. The following table shows several examples of literal text in an expression.  
  
|Constant|Display text|Expression text|  
|--------------|------------------|---------------------|  
|Report run at:|<\<Expr>>|`="Report run at: " & Globals!ExecutionTime`|  
|Adventure Works Cycles|Adventure Works Cycles|Adventure Works Cycles|  
|[Bracketed display text]|\\[Bracketed display text\\]|[Bracketed display text]|  
  
## RDL Constants  
 You can use constants defined in Report Definition Language (RDL) in an expression. In the **Expression** dialog box, constants appear when you create an expression for a report property that only accepts certain valid values, also known as enumerated types. The following table shows two examples.  
  
|Property|Description|Values|  
|--------------|-----------------|------------|  
|TextAlign|Valid values for aligning text in a text box.|General, Left, Center, Right|  
|BorderStyle|Valid values for a line added to a report.|Default, None, Dotted, Dashed, Solid, Double, DashDot, DashDotdot|  
  
## Visual Basic Constants  
 You can use constants defined in the Visual Basic run-time library in an expression. For example, you can use the constant **DateInterval.Day**. The following expression for the date January 10, 2023 returns the number 10:  
  
 `=DatePart("d",Globals!ExecutionTime)`  
  
## CLR Constants  
 You can use constants defined in .NET Framework common language run-time (CLR) classes in an expression. The following table shows an example of a system-defined color.  
  
|Constant|Description|  
|--------------|-----------------|  
|MistyRose|When you create an expression for a report property that is based on background color, you can specify a color by name. Valid names are listed in the **Expression** dialog box.|  
  
## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
