---
title: "Associate a query parameter with a report parameter for a paginated report (Power BI Report Builder) | Microsoft Docs"
description: Learn uses for Power BI paginated report parameters, the properties you can set, and how to associate a dataset query parameter with a report parameter.
ms.date: 01/25/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
---
# Associate a query parameter with a report parameter for a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  In a Power BI paginated report, when you define a dataset query that contains a query variable, the query command is parsed. For each query variable, a corresponding dataset parameter and report parameter are created. The dataset parameter points to the report parameter. This enables a user to enter a value that passes directly to the query. Each time you edit the query command, the same process takes place.  
  
 If you rename a report parameter that is bound to a query parameter, you need to manually link the query parameters to the renamed report parameter by using the procedure in this topic.  
  
## Associate a query parameter with a report parameter  
  
1.  In the Report Data pane, right-click the dataset, click **Dataset Properties**, and then click **Parameters**.  
  
    > [!NOTE]  
    > If the Report Data pane is not visible, click **Report Data** on the **View** menu.  
  
2.  In the column **Parameter Name**, find the name of the query parameter. Parameter names are automatically populated based on the query. Every time you change the query, the query is checked for new query parameters. Query parameters that you create manually are not changed when the query changes.  
  
    -   In **Parameter Name**, find the query parameter name as it exists in the query. You can also manually add a new query parameter and enter a name.  
  
    -   In **Parameter Value**, type or select an expression that evaluates to the value to pass to the query parameter. This is typically the name of the report parameter.  
  
        > [!NOTE]  
        > You are not limited to report parameters as values for a query parameter. You can use any expression that evaluates to a value for the parameter value.  
  
3.  Repeat step 2 for additional query parameters.  
  
## Next steps
 [Report Embedded Datasets and Shared Datasets &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/report-embedded-datasets-and-shared-datasets-report-builder-and-ssrs)   

  
  
