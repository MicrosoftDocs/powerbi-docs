---
title: "Add or modify available values for a Power BI paginated report parameter | Microsoft Docs"
description: In this article you learn to add, change, or delete available values for a Power BI paginated report parameter. Customize the list of choices a user can make in a paginated report for a parameter in Report Builder by specifying a list of available values to display to the user.
ms.date: 01/23/2023
ms.service: powerbi
ms.subservice: report-builder


ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Add or modify available values for a Power BI paginated report parameter (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  After you create a Power BI paginated report parameter, you can specify a list of available values to display to the user. An available values list limits the choices a user can make to only valid values for the parameter. In this article you learn to add, change, or delete available values for a Power BI paginated report parameter. 
  
 Available values appear in a drop-down list next to the report parameter on the toolbar when the report runs. Report parameters can represent one value or multiple values. For multiple values, the top of list begins with a **Select All** feature so the user can select or clear all values with a single click.  
  
 You can provide a static list of values or a list from a report dataset. You can optionally provide a friendly name for values by specifying a label field. For example, for a parameter based on a `ProductID` field, you can display the `ProductName` field in the parameter label. When the report runs, the user can choose from the product names, but the actual chosen value is the corresponding `ProductID`.  
    
## Add or change the available values for a report parameter  
  
1.  In the Report Data pane, expand the Parameters node. Right-click the parameter and click **Parameter Properties**. The **Report Parameter Properties** dialog box opens.  
  
    > [!NOTE]  
    >  If the Report Data pane is not visible, click **View** and then click **Report Data**.  
  
2.  Click **Available Values**. Select an available values option:  
  
    -   Click **Specify values** to manually provide a list of values, and optionally, friendly names (the labels) for the values.  
  
         Click **Add** and then enter the value in the **Value** text box, and optionally, the label in the **Label** text box. If you do not provide a label, the value is used. You can write an expression for a value. The data type must match the data type of the parameter. Field names cannot be used in an expression for a parameter. For examples, see [Commonly Used Filters &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/commonly-used-filters-report-builder-and-ssrs).  
  
         Repeat this step for as many values as you want to provide. The order of items you see in this list determines the order that the user sees them in the drop-down list. To change the order of an item in the list, click a **Value** or **Label** text box to select the item, and then use the up and down arrow buttons to move the item higher or lower in the list.  
  
    -   Click **Get values from a query** to provide the name of an existing dataset that retrieves the values, and optionally, the friendly names for this parameter.  
  
        > [!IMPORTANT]  
        >  If the same dataset contains the corresponding query parameter for the report parameter, the report will display an error message when you try to run it. You resolve this error by using a different dataset to retrieve the values.  
  
         In **Dataset**, choose the name of the dataset.  
  
         In **Value field**, choose the name of the field that provides parameter values.  
  
         In **Label field**, choose the name of the field that provides the friendly names for the parameter. If there is no separate field for friendly names, choose the same field as you chose for the **Value** field.  
  
3.  Select **OK**.
  
     When you preview the report, you see a drop-down list of available values for the parameter.  
  
## Remove the available values for a report parameter  
  
1.  In the Report Data pane, expand the Parameters node. Right-click the parameter and click **Parameter Properties**. The **Report Parameters** dialog box opens.  
  
2.  Click **Available Values**.  
  
3.  In **Select from one of the following options**, click **None**.  
  
4.  Select **OK**.
  
     When you preview the report, the drop-down list of available values for the parameter no longer appears.  
  
## Related content

- [Change the Order of a Report Parameter &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/change-the-order-of-a-report-parameter-report-builder-and-ssrs)   
- [Add, Change, or Delete a Report Parameter &#40;Power BI Report Builder&#41;](add-change-delete-report-parameter-report-builder.md)  
- [Add Cascading Parameters to a Report &#40;Power BI Report Builder&#41;](add-cascading-parameters-report-builder.md)   
- [Add, Change, or Delete Default Values for a Report Parameter &#40;Power BI Report Builder&#41;](add-change-or-delete-default-values-for-a-report-parameter.md)   
- [Parameters Collection References &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/built-in-collections-parameters-collection-references-report-builder)   
- [Tutorial: Add a Parameter to Your Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/tutorial-add-a-parameter-to-your-report-report-builder)   
- [Expressions in Power BI Report Builder](../expressions/report-builder-expressions.md) 
  
  
