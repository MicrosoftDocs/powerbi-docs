---
title: "Add or modify Power BI paginated report parameters | Microsoft Docs"
description: In this article, you learn how to add, change, or delete Power BI paginated report parameters. Choose report data, connect related reports, and vary the report presentation with the addition of report parameters in a paginated report in Power BI Report Builder.
ms.date: 01/23/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---
# Add or modify Power BI paginated report parameters (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  A Power BI paginated report parameter provides a way to choose report data, connect related reports together, and vary the report presentation. You can provide a default value and a list of available values, and the user can change the selection. In this article, you learn how to add, change, or delete Power BI paginated report parameters.
    
## Add or edit a report parameter  
  
1.  In Power BI Report Builder, in the **Report Data** pane, right-click the **Parameters** node and click **Add Parameter**. The **Report Parameter Properties** dialog box opens.  
  
2.  In **Name**, type the name of the parameter or accept the default name.  
  
3.  In **Prompt**, type the text that appears next to the parameter text box when the user runs the report.  
  
4.  In **Data type**, select the data type for the parameter value.  
  
5.  If the parameter can contain a blank value, select **Allow blank value**.  
  
6.  If the parameter can contain a null value, select **Allow null value**.  
  
7.  To allow a user to select more than one value for the parameter, select **Allow multiple values**.  
  
8.  Set the visibility option.  
  
    -   To show the parameter on the toolbar at the top of the report, select **Visible**.  
  
    -   To hide the parameter so that it does not display on the toolbar, select **Hidden**.  
  
    -   To hide the parameter and protect it from being modified on the report server after the report is published, select **Internal**. The report parameter can then only be viewed in the report definition. For this option, you must set a default value or allow the parameter to accept a null value.  
  
9. Select **OK**.
  
## Delete a report parameter  
  
1.  In the **Report Data** pane, expand the **Parameters** node.  
  
2.  Right-click the report parameter and click **Delete**.  
  
## Related content  

- See how your customers [view parameters for paginated reports in the Power BI service](../../consumer/paginated-reports-view-parameters.md)
- [Add, Change, or Delete Available Values for a Report Parameter &#40;Power BI Report Builder&#41;](add-change-or-delete-available-values-for-a-report-parameter.md)   
- [Add, Change, or Delete Default Values for a Report Parameter &#40;Power BI Report Builder&#41;](add-change-or-delete-default-values-for-a-report-parameter.md)   
- [Change the Order of a Report Parameter &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/change-the-order-of-a-report-parameter-report-builder-and-ssrs)   
- [Report Parameters &#40;Power BI Report Builder and Report Designer&#41;](report-builder-parameters.md)
- [Add Cascading Parameters to a Report &#40;Power BI Report Builder&#41;](add-cascading-parameters-report-builder.md)   
- [Tutorial: Add a Parameter to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-parameter-to-your-report-report-builder)   
- [Parameters Collection References &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/built-in-collections-parameters-collection-references-report-builder)   
- [Add a multi-value parameter to a Report](/sql/reporting-services/report-design/add-a-multi-value-parameter-to-a-report)  
  
  
