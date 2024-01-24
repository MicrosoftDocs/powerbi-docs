---
title: "Drillthrough, drilldown, subreports, and nested data regions in a Power BI paginated report"
description: Organize data in a Power BI paginated report to show the relationship of the general to the detailed and then display the data in a subreport or a separate drillthrough report.
author: maggiesMSFT
ms.author: maggies
ms.date: 04/10/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
---
# Drillthrough, drilldown, subreports, and nested data regions in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can organize data in a Power BI paginated report in a variety of ways to show the relationship of the general to the detailed.  You can put all the data in the report, but set it to be hidden until a user clicks to reveal details; this is a *drilldown* action. You can display the data in a data region, such as a table or chart, which is *nested* inside another data region, such as a table or matrix. You can display the data in a *subreport* that is completely contained within a main report. Or, you can put the detail data in *drillthrough* reports, separate reports that are displayed when a user clicks a link.  
  
:::image type="content" source="media/paginated-drill-through/paginated-drillthrough-drill-down-subreports.png" alt-text="Screenshot showing drillthrough, drilldown, subreports, and nested data regions in a paginated report."::: 
  
 A. Drillthrough report  
  
 B. Subreport  
  
 C. Nested data 
  
 D. Drilldown action  
  
 All of these have commonalities, but they serve different purposes and have different features. Two of them, drillthrough reports and subreports, are actually separate reports. *Nested* is a way to describe adding a hierarchical structure to a report. In paginated reports, you can drill through reports down to four (4) levels of child reports. For example, you can drill through from Report A -> Report B -> Report C.   *Drilldown* is an action you can apply to any report item to hide and show other report items. They all are ways that you can organize and display data to help your users understand your report better.
    
##  <a name="SummaryCharacteristics"></a> Summary of characteristics  
 This table summarizes these different traits. Details are in separate sections later in this topic. Drilldown isn't included in these comparisons because you can apply its showing and hiding action to any report item.  
  
|Trait|Subreport|Drillthrough|  
|-----------|---------------|------------------|  
|Uses dataset of main report|Same or different|Same or different| 
|Retrieves data|Data retrieved at the same time as main report|Data retrieved one drillthrough report at a time|
|Is processed and rendered|With the main report|When link is clicked|  
|Performs|Slower (but retrieves all data with main report)|Faster (but does not retrieve all data with main report) 
|Uses parameters|Yes|Yes| 
|Can be reused|As report, or subreport or drillthrough report in other reports|As report, or subreport or drillthrough report in other reports|  
|Is located|External to main report, same or different report in the workspace |External to main report, same report or different report in the workspace|  
|Is displayed|In the main report|In a different report| 
  
  
##  <a name="Details"></a> Details of characteristics  
  
###  <a name="Queries"></a> Queries they use  
 Subreports and drillthrough reports can use the same query data as the main report, or they can use a different one. Nested data use the same query.  
  
###  <a name="RetrieveData"></a> Retrieving data  
 Subreports retrieve data at the same time as the main report. Drillthrough reports do not. Each drillthrough report retrieves data when a user clicks each link. This is significant if the data for the main report and the subordinate report must be retrieved at the same time.  
  
###  <a name="ProcessRender"></a> Processing and rendering  
 A subreport is processed as part of the main report. For example, if a subreport that displays order detail information is added to a table cell in the detail row, the subreport is processed once per row of the table and rendered as part of the main report. A drillthrough report is only processed and rendered when the user clicks the drillthrough link in the summary main report.  
  
###  <a name="Parameters"></a> Use of parameters  
 Drillthrough reports and subreports typically have report parameters that specify which report data to display. For example, when you click a sales order number in a main report, a drillthrough report opens, which accepts the sales order number as a parameter, and then displays all the data for that sales order. When you create the link in the main report, you specify values to pass as parameters to the drillthrough report.  
  
 To create a drillthrough report or subreport, you must design the target drillthrough report or subreport first and then create a drillthrough action or add the reference to the main report.  
  
###  <a name="Reusability"></a> Reusability  
 Subreports and drillthrough reports are separate reports. Thus, they can be used in a number of reports, or displayed as standalone reports. 
  
###  <a name="Location"></a> Location  
 Subreports and drillthrough reports are both separate reports, so they're stored external to the main report. Subreports and drillthrough reports must be in the same workspace. 
  
###  <a name="Display"></a> Display  
 Subreports are displayed in the main report. Drillthrough reports are displayed on their own.  

##  <a name="InThisSection"></a> In this section  

[Drillthrough reports in a paginated report (Power BI Report Builder)](drillthrough-reports-report-builder.md) Explains reports that open when a user clicks a link in a main report.  
 
[Nested Data Regions &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/nested-data-regions-report-builder-and-ssrs) Explains nesting one data region inside another, such as a chart nested inside a matrix.  

[Drilldown action in a paginated report (Power BI Report Builder)](drilldown-action-report-builder.md) Explains using the drilldown action to hide and show report items.  

[Subreports in Power BI paginated reports](../subreports.md) Explains these reports that are displayed inside the body of a main report.  

## Related content

- [Report parameters in Power BI Report Builder](../parameters/report-builder-parameters.md)
