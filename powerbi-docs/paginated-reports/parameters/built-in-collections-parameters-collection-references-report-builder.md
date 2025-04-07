---
title: "Parameters collection references in a Power BI paginated report | Microsoft Docs"
description: Discover how to use parameters in an expression to customize paginated report data and appearance based on user choices in Power BI Report Builder. 
ms.date: 01/25/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
---
# Built-in parameters collection references in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Paginated report parameters are one of the built-in collections you can reference from an expression in Power BI Report Builder. By including parameters in an expression, you can customize report data and appearance based on choices a user makes. Expressions can be used for any report item property or text box property that provides the (*Fx*) or \<**Expression**> option. Expressions are also used to control report content and appearance in other ways. For more information, see [Expression Examples &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/expression-examples-report-builder-and-ssrs).  
  
 When you compare parameter values with dataset field values at run time, the data types for the two items you are comparing must be the same. Report parameters can be one of the following types: Boolean, DateTime, Integer, Float, or Text, which represents the underlying data type String. If necessary, you might have to convert the data type of the parameter value to match the dataset value. For more information, see [Data Types in Expressions &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/data-types-in-expressions-report-builder-and-ssrs).  
  
 In order to include a parameter reference in an expression, you must understand how to specify the correct syntax for the parameter reference, which varies depending on whether the parameter is a single-value or multivalue parameter.  
 
##  <a name="Single"></a> Use a single-valued parameter in an expression  
 The following table shows examples of the syntax to use when you include a reference to a single-value parameter of any data type in an expression.  
  
|Example|Description|  
|-------------|-----------------|  
|`=Parameters!` *\<ParameterName>* `.IsMultiValue`|Returns **False**.<br /><br /> Checks if a parameter is multivalue. If **True**, the parameter is multivalue and it is a collection of objects. If **False**, the parameter is single-value and is a single object.|  
|`=Parameters!` *\<ParameterName>* `.Count`|Returns the integer value 1. For a single-value parameter, the count is always 1.|  
|`=Parameters!` *\<ParameterName>* `.Label`|Returns the parameter label, frequently used as the display name in a drop-down list of available values.|  
|`=Parameters!` *\<ParameterName>* `.Value`|Returns the parameter value. If the Label property has not been set, this value appears in the drop-down list of available values.|  
|`=CStr(Parameters!`  *\<ParameterName>* `.Value)`|Returns the parameter value as a string.|  
|`=Fields(Parameters!` *\<ParameterName>* `.Value).Value`|Returns the value for the field that has the same name as the parameter.|  
  
 For more information about using parameters in a filter, see [Add Dataset Filters, Data Region Filters, and Group Filters &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-dataset-filters-data-region-filters-and-group-filters).  
  
##  <a name="Multi"></a> Use a multivalue parameter in an expression  
 The following table shows examples of the syntax to use when you include a reference to a multivalue parameter of any data type in an expression.  
  
|Example|Description|  
|-------------|-----------------|  
|`=Parameters!` *\<MultivalueParameterName>* `.IsMultiValue`|Returns **True** or **False**.<br /><br /> Checks if a parameter is multivalue. If **True**, the parameter is multivalue and is a collection of objects. If **False**, the parameter is single-valued and is a single object.|  
|`=Parameters!` *\<MultivalueParameterName>* `.Count`|Returns an integer value.<br /><br /> Refers to the number of values. For a single-value parameter, the count is always 1. For a multivalue parameter, the count is 0 or more.|  
|`=Parameters!` *\<MultivalueParameterName>* `.Value(0)`|Returns the first value in a multivalue parameter.|  
|`=Parameters!` *\<MultivalueParameterName>* `.Value(Parameters!` *\<MultivalueParameterName>* `.Count-1)`|Returns the last value in a multivalue parameter.|  
|`=Split("Value1,Value2,Value3",",")`|Returns an array of values.<br /><br /> Create an array of values for a multivalue **String** parameter. You can use any delimiter in the second parameter to Split. This expression can be used to set defaults for a multivalue parameter or to create a multivalue parameter to send to a subreport or drillthrough report.|  
|`=Join(Parameters!` *\<MultivalueParameterName>* `.Value,", ")`|Returns a **String** that consists of a comma-delimited list of values in a multivalue parameter. You can use any delimiter in the second parameter to Join.|  
  
 For more information about using parameters in a filter, see [Report Parameters &#40;Power BI Report Builder and Report Designer&#41;](report-builder-parameters.md).  
  
## Next steps
[Change the order of a paginated report parameter - Power BI Report Builder](change-order-report-parameter-report-builder.md)

[Add a multi-value parameter to a paginated report - Power BI Report Builder](customize-parameters-pane-report-builder.md)

[Customize the Parameters pane in a paginated report - Power BI Report Builder](customize-parameters-pane-report-builder.md)
