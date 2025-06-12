---
title: Expression uses in Power BI paginated reports | Microsoft Docs
description: Specify or calculate values with paginated report expressions for parameters, queries, filters, and text box properties in Power BI Report Builder.
ms.date: 09/21/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: 76b9ed31-5aec-40fc-bb88-a1c1b0ab3fc3
author: JulCsc
ms.author: juliacawthra
ms.reviewer: rodolfoc
---
# Expression uses in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In Power BI paginated reports, expressions are used throughout the report definition to specify or calculate values for parameters, queries, filters, report item properties, group and sort definitions, text box properties, bookmarks, document maps, dynamic page header and footer content and images. This topic provides examples of the many places you can use expressions to vary the content or appearance of a report. This list isn't comprehensive. You can set an expression for any property in a dialog box that displays the expression (**fx**) button or in a drop-down list that displays **\<Expression...>**.  
  
 Expressions can be simple or complex. *Simple expressions* contain a reference to a single dataset field, parameter, or built-in field. Complex expressions can contain multiple built-in references, operators, and function calls. For example, a complex expression might include the Sum function applied to the Sales field.  
  
 Expressions are written in Microsoft Visual Basic. An expression begins with an equal sign (=) followed by a combination of references to built-in collections such as dataset fields and parameters, constants, functions, and operators.  
  
##  <a name="Simple"></a> Use simple expressions  
 Simple expressions appear on the design surface and in dialog boxes in brackets, for example, a dataset field appears as `[ProductID]`. Simple expressions are created for you automatically when you drag a field from a dataset onto a text box. A placeholder is created and the expression defines the underlying value. You can also type expressions directly into a data region cell or text box, both on the design surface or in a dialog box (for example, `[ProductID]`).  
  
 The following table lists examples of the ways you can use simple expressions. The table describes the functionality, the property to set, the dialog box you typically use to set it, and the value for the property. You can type the simple expression directly on the design surface, in a dialog box, or in the Properties pane, or you can edit it in the Expression dialog box, just as you would with any expression.  
  
|Functionality|Property, Context, and Dialog Box|Property Value|  
|-------------------|---------------------------------------|--------------------|  
|Specify a dataset field to display in a text box.|Value property for a placeholder inside a text box. Use **Placeholder Properties Dialog Box, General**.|`[Sales]`|  
|Aggregate values for a group.|Value property for a placeholder inside a row associated with a tablix group. Use **Textbox Properties Dialog Box**.|`[Sum(Sales)]`|  
|Include a page number.|Value property for a placeholder inside a text box that is placed in a page header. Use **Textbox Properties Dialog Box, General**.|`[&PageNumber]`|  
|Display a selected parameter value.|Value property for a placeholder inside a text box on the design surface. Use **Textbox Properties Dialog Box, General**.|`[@SalesThreshold]`|  
|Specify a group definition for a data region.|Group expression on the tablix group. Use **Tablix Group Properties Dialog Box, General**.|`[Category]`|  
|Exclude a specific field value from a table.|Filter equation on the tablix. Use **Tablix Properties Dialog Box, Filters**.|For data type, select **Integer**.<br /><br /> `[Quantity]`<br /><br /> `>`<br /><br /> `100`|  
|Include only a specific value for a group filter.|Filter equation on the tablix group. Use **Tablix Group Properties Dialog Box, Filters**.|`[Category]`<br /><br /> `=`<br /><br /> `Clothing`|  
|Exclude specific values for more than one field from a dataset.|Filter equation for a group in a tablix. Use **Tablix Properties Dialog Box, Filters**.|`=[Color]`<br /><br /> `<>`<br /><br /> `Red`<br /><br /> `=[Color]`<br /><br /> `<>`<br /><br /> `Blue`|  
|Specify sort order based on an existing field in a table.|Sort expression on the tablix. Use **Tablix Properties Dialog Box, Sorting**.|`[SizeSortOrder]`|  
|Link a query parameter to a report parameter.|Parameters collection on the dataset. Use **Dataset Properties Dialog Box, Parameters**.|`[@Category]`<br /><br /> `[@Category]`|  
|Pass a parameter from a main report to a subreport.|Parameters collection on the subreport. Use **Subreport Properties Dialog Box, Parameters**.|`[@Category]`<br /><br /> `[@Category]`|  
  
##  <a name="Complex"></a> Use complex expressions  
 Complex expressions can contain multiple built-in references, operators, and function calls, and appear on the design surface as `<<Expr>>`. To see or change the expression text, you must open the **Expression** dialog box or type directly in the Properties pane. The following table lists typical ways you can use a complex expression to display or organize data or change report appearance, including the property to set, the dialog box you typically use to set it, and the value for the property. You can type an expression directly into a dialog box, on the design surface, or in the Properties pane.  
  
|Functionality|Property, Context, and Dialog Box|Property Value|  
|-------------------|---------------------------------------|--------------------|  
|Calculate aggregate values for a dataset.|Value property for a placeholder inside of a text box. Use **Placeholder Properties Dialog Box, General**.|`=First(Fields!Sales.Value,"DataSet1")`|  
|Concatenate text and expressions in the same text box.|Value for a placeholder inside of a text box that is placed in a page header or page footer. Use **Placeholder Properties Dialog Box, General**.|`="This report began processing at " & Globals!ExecutionTime`|  
|Calculate an aggregate value for a dataset in a different scope.|Value for a placeholder inside of a text box that is placed in a tablix group. Use **Placeholder Properties Dialog Box, General**.|`=Max(Fields!Total.Value,"DataSet2")`|  
|Format data in a text box depending on value.|Color for a placeholder inside of a text box in the details row for a tablix. Use **Text Box Properties Dialog Box, Font**.|`=IIF(Fields!TotalDue.Value < 10000,"Red","Black")`|  
|Calculate a value once to refer to throughout the report.|Value for a report variable. Use **Report Properties Dialog Box, Variables**.|`=Variables!MyCalculation.Value`|  
|Include specific values for more than one field from a dataset.|Filter equation for a group in a tablix. Use **Tablix Properties Dialog Box, Filters**.|For data type, select **Boolean**.<br /><br /> `=IIF(InStr(Fields!Subcat.Value,"Shorts")=0 AND (Fields!Size.Value="M" OR Fields!Size.Value="S"),TRUE, FALSE)`<br /><br /> `=`<br /><br /> `TRUE`|  
|Hide a text box on the design surface that can be toggled by the user using a Boolean parameter named *Show*.|Hidden property on a text box. Use **Text Box Properties Dialog Box, Visibility**.|`=Not Parameters!` *Show\<boolean parameter>* `.Value`|  
|Specify dynamic page header or footer content.|Value for a placeholder inside of a text box that is placed in the page header or footer.|`="Page " & Globals!PageNumber & " of "  & Globals!TotalPages`|  
|Identify all the values for a multivalue parameter chosen by the user.|Value for a placeholder inside of a text box. Use **Tablix Properties Dialog Box, Filters**.|`=Join(Parameters!MyMultivalueParameter.Value,", ")`|  
|Specify page breaks for every 20 rows in a tablix with no other groups.|Group expression for a group in a tablix. Use **Group Properties Dialog Box, Page Breaks**. Select the option **Between each instance of a group**.|`=Ceiling(RowNumber(Nothing)/20)`|  
|Specify conditional visibility based on a parameter.|Hidden property for a tablix. Use **Tablix Properties Dialog Box, Visibility**.|`=Not Parameters!<` *boolean parameter* `>.Value`|  
|Specify a date formatted for a specific culture.|Value for a placeholder inside of a text box in a data region. Use **Textbox Properties Dialog Box, General**.|`=Fields!OrderDate.Value.ToString(System.Globalization.CultureInfo.CreateSpecificCulture("de-DE"))`|  
|Concatenate a string and a number formatted as a percentage to two decimal places.|Value for a placeholder inside of a text box in a data region. Use **Textbox Properties Dialog Box, General**.|`="Growth Percent: " & Format(Fields!Growth.Value,"p2")`|  
  
## Related content

- [Expressions (Power BI Report Builder)](report-builder-expressions.md)
- [Expression Examples (Power BI Report Builder)](report-builder-expression-examples.md)
- [Report Parameters (Power BI Report Builder)](../parameters/report-builder-parameters.md)   
- [Filter Equation Examples (Report Builder and SSRS)](/sql/reporting-services/report-design/filter-equation-examples-report-builder-and-ssrs)   
- [Filter, Group, and Sort Data (Report Builder and SSRS)](../report-design/filter-group-sort-data-report-builder.md)
- [Page Headers and Footers (Report Builder)](../report-design/page-headers-footers-report-builder-service.md)
- [Formatting Text and Placeholders (Report Builder and SSRS)](/sql/reporting-services/report-design/formatting-text-and-placeholders-report-builder-and-ssrs)   
- [Hide an Item (Report Builder and SSRS)](/sql/reporting-services/report-builder/hide-an-item-report-builder-and-ssrs)  
  
  
