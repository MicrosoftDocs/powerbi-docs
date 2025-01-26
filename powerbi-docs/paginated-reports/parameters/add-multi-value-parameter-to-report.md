---
title: "Add a multi-value parameter to a paginated report | Microsoft Docs"
description: Learn how to add a parameter to a paginated report that allows the user to select more than one value for the parameter in Power BI Report Builder.
ms.date: 06/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: kfollis
ms.author: kfollis
---
# Add a multi-value parameter to a Power BI paginated report

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  In a Power BI paginated report, you can add a parameter that allows the user to select more than one value for the parameter.  
  
 You can pass multiple parameter values to the report within the report URL. For a URL example that includes a multi-value parameter, see [Pass a Report Parameter Within a URL](pass-report-parameter-url.md).  
   
  
## Add a multi-value parameter  
  
1.  In Power BI Report Builder, open the report that you want to add the multi-value parameter to.  
  
2.  Right-click the report dataset, and then click **Dataset Properties**  
  
3.  Add a variable to the dataset query by either editing the query text in the **Query** box, or by adding a filter by using the query designer. For more information, see [Build a Query in the Relational Query Designer &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/build-a-query-in-the-relational-query-designer-report-builder-and-ssrs).  
  
    ```  
    WHERE  
      Production.ProductInventory.ProductID IN (@ProductID)  
    ```  
  
    > [!IMPORTANT]  
    > *  The query text must not include the DECLARE statement for the query variable.  
    > *  The text for the query variable must include the **IN** operator, as shown in the example above.  
    > *  Be sure to include the parentheses around the variable as shown above. Otherwise, the report fails to render and the "must declare the scalar variable" error is displayed.  
  
    A dataset parameter for an embedded dataset or a shared dataset is created automatically for the query variable. A report parameter is created automatically for the dataset parameter.  
  
4.  In the **Report Data** pane, expand the **Parameters** node, right-click the report parameter that was automatically created for the dataset parameter, and then click **Parameter Properties**.  
  
5.  In the **General** tab, select **Allow multiple values** to allow a user to select more than one value for the parameter.  
  
6.  (Optionally) In the **Available** values tab, specify a list of available values to display to the user.  
  
     An available values list limits the choices a user can make to only valid values for the parameter. For multiple values, the top of the list begins with a **Select All** feature so the user can select or clear all values with a single click. If you choose to get the available values for the report parameter from a dataset query, be sure to select a dataset that does not contain the query variable that is associated with the same report parameter.  
  
     For more information, see [Add, Change, or Delete Available Values for a Report Parameter &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-change-or-delete-available-values-for-a-report-parameter).  

## Considerations and limitations

- Dates in a multi-value parameter dropdown are displayed in US format (mm/dd/yyyy) even if the customer locale is non-US.

- Multi-value parameters aren't supported with the CONTAINS operator.  

## Related content

* [Add Cascading Parameters to a Report &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-cascading-parameters-to-a-report-report-builder-and-ssrs)   
* [Add, Change, or Delete a Report Parameter &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/add-change-or-delete-available-values-for-a-report-parameter)  
  
  
