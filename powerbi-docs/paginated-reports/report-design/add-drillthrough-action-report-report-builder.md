---
title: "Add a drillthrough action on a Power BI paginated report"
description: Improve query performance with the addition of a drillthrough action link in a text box, an image, or data points on a chart in a Power BI paginated report.
author: kfollis
ms.author: kfollis
ms.date: 04/10/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
---
# Add a drillthrough action on a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

The Power BI paginated report that opens when you select the link in the main paginated report is known as a *drillthrough report*. This drillthrough link enables a drillthrough action.  
  
When you're publishing to the Power BI service, you must publish drillthrough reports to the same workspace as the main report. You can add a drillthrough link to any item that has an **Action** property, such as a text box, an image, or data points on a chart.  
  
 To add a drillthrough link to a report, you must first create the drillthrough report that the main report will link to. A drillthrough report commonly contains details about an item that is contained in the original summary report, and often contains parameters that filter the drillthrough report based on parameters passed to it from the main report. For more information on creating the drillthrough report, see [Drillthrough Reports &#40;Report Builder&#41;](drillthrough-reports-report-builder.md).  

## Add a drillthrough action  
  
1. In Design view, right-click the text box, image, or chart to which you want to add a link and then select **Properties**.  
  
1. In the item's **Properties** dialog box, select **Action**.  
  
1. Select **Go to report**. Additional sections appear in the dialog box for this option.  
  
1. In **Specify a report**, type the name of the report. Alternatively, select the expression (**fx**) button to create an expression for the report name.  
  
1. In **Use these parameters to run the report**, select **Add**. A new row is added to the parameter grid.  
  
    - In the **Name** text box, type the name of the report parameter in the drillthrough report.  
  
        > [!NOTE]  
        >  The names in the parameter list must match the expected parameters in the target report exactly. For example, parameter names must match by case. If the names do not match, or if an expected parameter is not listed, the drillthrough report fails.  
  
    - In **Value**, type the value to pass to the parameter in the drillthrough report.  
  
        > [!NOTE]  
        >  Values can contain an expression that evaluates to a value to pass to the report parameter. The expressions in the value list include the field list for the current report.  
  
     For information on how to hide parameters in reports, see [Create parameters for paginated reports in the Power BI service](../parameters/paginated-reports-create-parameters.md).
  
1. (Optional) For text boxes, it is helpful to indicate to the user that the text is a link by changing the color and effect of the text on the **Home** tab of the Ribbon.  

## Related content

- [Action Properties Dialog Box &#40;Report Builder)](add-hyperlink-url-report-builder.md)   
- [Formatting Data Points on a Chart &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/formatting-data-points-on-a-chart-report-builder-and-ssrs)   
- [Show ToolTips on a Series &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/show-tooltips-on-a-series-report-builder-and-ssrs)  
  
