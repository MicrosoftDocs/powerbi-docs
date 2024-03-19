---
title: "Drillthrough reports in a Power BI paginated report"
description: Discover drillthrough reports, which open when you select a link in a Power BI paginated report to get details about an item in an original summary report in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.date: 02/08/2024
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
---

# Drillthrough reports in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

A drillthrough report is a report that a user opens by clicking a link within another Power BI paginated report. Drillthrough reports commonly contain details about an item that is contained in an original summary report. For example, in this illustration, the sales summary report lists sales orders and totals. When a user clicks an order number in the summary list, another report opens that contains details about the order.  

:::image type="content" source="media/paginated-drill-through/paginated-drillthrough.gif" alt-text="Screenshot showing drillthrough report.":::
  
 The data in the drillthrough report is not retrieved until the user clicks the link in the main report that opens the drillthrough report. If the data for the main report and the drillthrough report must be retrieved at the same time, consider using a subreport. For more information, see [Subreports in Power BI paginated reports](../subreports.md).
  
> [!NOTE]  
> When you are working in Report Builder, you must be connected to the same workspace as the target report.  

 To get started quickly with drillthrough reports, see [Tutorial: Creating Drillthrough and Main Reports &#40;Report Builder and SSRS&#41;](/sql/reporting-services/tutorial-creating-drillthrough-and-main-reports-report-builder). 

## Parameters in drillthrough reports

 A drillthrough report typically contains parameters that are passed to it by the summary report. In the sales summary report example, the summary report includes the field [OrderNumber] in a text box in a table cell. The drillthrough report contains a parameter that takes the order number as a value. When you set the drillthrough report link on the text box for [OrderNumber], you also set the parameter for the target report to [OrderNumber]. When the user clicks the order number in the summary report, the target detail report opens and displays the information for that order number. To view instructions about customizing drillthrough reports based on parameter values, see:

- [Report parameters in Power BI Report Builder](../parameters/report-builder-parameters.md)
- [InScope Function &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/report-builder-functions-inscope-function).  
  
## Designing the drillthrough report

 To create a drillthrough report, you must design the drillthrough report first, before you create the drillthrough action in the main report.  
  
 A drillthrough report can be any report. Typically, the drillthrough report accepts one or more parameters to specify the data to show, based on the link from the main report. For example, if the link from the main report was defined for a sales order, then the sales order number is passed to the drillthrough report.  
  
## Creating a drillthrough action in the main report

 You can add drillthrough links to text boxes (including text in the cells of a table or matrix), images, charts, gauges, and any other report item that has an Action property page. For more information, see [Add a drillthrough action on a paginated report (Power BI Report Builder)](add-drillthrough-action-report-report-builder.md).
  
 You can create the drillthrough action in the main report as a report action or a URL action. For a report action, the drillthrough report must exist on the same report server as the main report. For a URL action, the report must exist at the fully qualified URL location.
  
 For more information, see [Add a drillthrough action on a paginated report (Power BI Report Builder)](add-drillthrough-action-report-report-builder.md).

## Viewing a drillthrough report

 To view a summary report with drillthrough links after it is published, you must ensure that the drillthrough reports reside in the workspace as the summary report. The user must have permissions on the drillthrough report to view it.  

## Considerations and limitations

- Drillthrough to a report isn't supported in Report Preview.
- Drillthrough links in a report don't work when you export the report to any format, for example, Word, Excel, or PDF, in Power BI Report Builder as well as the Power BI service.

## Related content

- [Drillthrough, drilldown, subreports, and nested data regions in a paginated report (Power BI Report Builder)](drillthrough-drilldown-subreports-nested-data-regions.md)  
  
  

