---
title: "Add or modify default values for a Power BI paginated report parameter | Microsoft Docs"
description: Use these steps to customize your reports with added, changed, or deleted default values for Power BI paginated report parameters.
ms.date: 01/23/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: saurkumar
---

# Add or modify default values for a Power BI paginated report parameter (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  After you create a Power BI paginated report parameter, you can provide a list of default values. If all parameters have a valid default value, the report runs automatically when you first view or preview it. In this article you learn to add, change, or delete default parameter values.
  
 Report parameters can represent one value or multiple values. For single values, you can provide a literal or expression. For multiple values, you can provide a static list or a list from a report dataset.  
  
 
## Add or change the default values for a report parameter  
  
1.  In the Report Data pane, expand the **Parameters** node. Right-click the parameter and click **Edit**. The **Report Parameter Properties** dialog box opens.  
  
    > [!NOTE]  
    >  If the Report Data pane is not visible, click **View** and then click **Report Data**.  
  
2.  Click **Default Values**.  
  
3.  Select a default option:  
  
    -   To manually provide a value or list of values, click **Specify values**. Click **Add** and then enter the value in the **Value** text box. You can write an expression for a value. The data type must match the data type of the parameter. Field names cannot be used in an expression for a parameter.  
  
         For multivalue parameters, repeat this step for as many values as you want to provide. The order of items you see in this list determines the order that the user sees them in the drop-down list. To change the order of an item in the list, click the **Value** text box to select the item, and then use the up and down arrow buttons to move the item higher or lower in the list.  
  
    -   To provide the name of an existing dataset that retrieves the values, click **Get values from a query**. In **Dataset**, choose the name of the dataset.  
  
         In **Value field**, choose the name of the field that provides parameter values.  
  
4.  Select **OK**.
  
## Remove the default values for a report parameter  
  
1.  In the Report Data pane, expand the **Parameters** node. Right-click the parameter and click **Edit**. The **Report Parameter Properties** dialog box opens.  
  
2.  Click **Default Values**.  
  
3.  In **Select from one of the following options**, click **No default value**.  
  
4.  Select **OK**.
  
## Related content

- [Add Cascading Parameters to a Report &#40;Power BI Report Builder&#41;](add-cascading-parameters-report-builder.md)   
- [Tutorial: Add a Parameter to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-parameter-to-your-report-report-builder)   
- [Parameters Collection References &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/built-in-collections-parameters-collection-references-report-builder)   
- [Change the Order of a Report Parameter &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/change-the-order-of-a-report-parameter-report-builder-and-ssrs)   
- [Add, Change, or Delete a Report Parameter &#40;Power BI Report Builder&#41;](add-change-delete-report-parameter-report-builder.md)  
- [Expressions in Power BI Report Builder](../expressions/report-builder-expressions.md)  
  
  
