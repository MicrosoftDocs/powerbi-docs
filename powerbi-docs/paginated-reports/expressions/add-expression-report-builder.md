---
title: "Add an expression to a paginated report"
description: Find out about how to use expressions to define report item properties, filters, and parameter values in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/21/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Add an expression to a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Expressions are used throughout paginated reports for defining report item properties, filters, groups, sort order, connection strings, and parameter values. Expressions begin with an equal sign (=) and are written in Microsoft Visual Basic. They are evaluated at run time by the report processor, which combines the evaluation result with report layout elements.  
  
 Expressions can be simple or complex. Simple expressions refer to a single item in a built-in collection. Complex expressions can contain constants, operators, global collection items, and function calls. For more information, see [Expressions &#40;Power BI Report Builder&#41;](./report-builder-expressions.md).
  
## Add an expression to a text box  
  
- In **Design** view, select the text box on the design surface to which you want to add an expression.  
  
    - For a simple expression, type the display text for the expression in the text box. For example, for the dataset field Sales, type `[Sales]`.  
  
    - For a complex expression, right-click the text box, and select **Expression**. The **Expression** dialog box opens. Type or interactively create your expression after the '=' in the expression pane, and then select **OK**.  
  
         The expression appears on the design surface as `<<Expr>>`.  
  
## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
  
