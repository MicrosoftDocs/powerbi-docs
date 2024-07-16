---
title: "Report parameter concepts in Power BI paginated reports | Microsoft Docs"
description: Find out how to add parameters to link related Power BI paginated reports, to control a report appearance, to filter report data, or to narrow the scope in Power BI Report Builder. 
ms.date: 01/25/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
---
# Report parameter concepts in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can add parameters to a paginated report to link related reports, to control the report appearance, to filter report data, or to narrow the scope of a report to specific users or locations.
  
## How you create report parameters
  
You create report parameters in the following ways:  
  
-   Automatically, when you define dataset query that contains query variables. For each query variable, a corresponding dataset query parameter and report parameter with the same names are created. A query parameter can be a reference to a query variable or to an input parameter for a stored procedure.  
  
-   Automatically, when you add a reference to a shared dataset that contains query parameters.  
  
-   Manually, when you create report parameters in the Report Data pane. Parameters are one of the built-in collections that you can include in an expression in a report. Because expressions are used to define values throughout a report definition, you can use parameters to control report appearance or to pass values to related subreports or reports that also use parameters.  
  
 For more information, see [Report Parameters &#40;Report Builder and Report Designer&#41;](report-builder-parameters.md).  
  
 Parameters are frequently used to filter report data both before and after the data is returned to the report. For more information, see [Filter, Group, and Sort Data &#40;Report Builder)](../report-design/filter-group-sort-data-report-builder.md).  
  
 When you design a report, report parameters are saved in the report definition. When you publish a report, report parameters are saved and managed separately from the report definition. After you save the report to the report server, you can do the following:  

 If you plan to create report subscriptions to a published report, you need to understand how the parameters are used during the runtime of the subscriptions. 
  
## Related content

- [What are paginated reports in Power BI?](../paginated-reports-report-builder-power-bi.md)
- [Report Embedded Datasets and Shared Datasets &#40;Power BI Report Builder&#41;](../paginated-reports-quickstart-aw.md)
- [Tutorial: Add a Parameter to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-parameter-to-your-report-report-builder)  
  
  
