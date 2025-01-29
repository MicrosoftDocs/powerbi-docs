---
title: "Add a filter to a dataset (Power BI Report Builder)"
description: Learn how to add a filter to a dataset to limit the data in a report after the data is retrieved from an external data source.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
---
# Add a filter to a dataset (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Add a filter to a dataset to limit the data in a report after the data is retrieved from an external data source. When you add a filter to a dataset, all data regions use only data that matches the filter conditions.
  
 To add a filter, you must specify one or more conditions that are filter equations. A filter equation consists of an expression that identifies the data that you want to filter, an operator, and the value to compare to. The data types of the filtered data and the value must match. Filtering on aggregate values for a dataset is not supported.  

## Add a filter to an embedded dataset instance  
  
1. Open a report in report design mode.
  
1. Right-click a dataset in the **Report Data** pane and then select **Dataset Properties**. The **Dataset Properties** dialog box opens.  
  
1. Select **Filters**. This displays the current list of filter equations. By default, the list is empty.  
  
1. Select **Add**. A new blank filter equation appears.  
  
1. In **Expression**, type or select the expression for the field to filter. To edit the expression, select the expression (*fx*) button.  
  
1. From the drop-down box, select the data type that matches the type of data in the expression you created in step 5.  
  
1. In the **Operator** box, select the operator that you want the filter to use to compare the values in the **Expression** box and the **Value** box. The operator you choose determines the number of values that are used from the next step.  
  
1. In the **Value** box, type the expression or value against which you want the filter to evaluate the value in **Expression**.  
  
     For examples of filter equations, see [Filter Equation Examples (Report Builder)](../expressions/filter-equation-examples-report-builder.md).
  
1. Select **OK**.
  
## Related content

- [Add Dataset Filters, Data Region Filters, and Group Filters (Report Builder)](../report-design/add-dataset-filters-data-region-filters-and-group-filters.md)   
- [Expression Examples (Report Builder)](../expressions/report-builder-expression-examples.md)   
- [Add a Filter (Report Builder)](../report-design/add-filter-report-builder.md)   
  
