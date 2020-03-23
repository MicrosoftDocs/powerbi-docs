---
title: "Subreports in Power BI paginated reports"
description: In this article, you learn about supported data sources for paginated reports in the Power BI service, and how to connect to Azure SQL Database data sources.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 03/18/2020
---

# Subreports in Power BI paginated reports

A *subreport* is a report item that displays another report inside the body of a main paginated report. Conceptually, a subreport in a report is similar to a frame in a Web page. You use it to embed a report within a report. Any report can be used as a subreport. The report that is displayed as the subreport is stored in the same Premium workspace as the parent report. You can design the parent report to pass parameters to the subreport. A subreport can be repeated within data regions, using a parameter to filter data in each instance of the subreport.  
  
 ![Subreport in a paginated report](media/paginated-reports-subreports/paginated-report-subreport.png "Paginated report subreport")  
  
 In this illustration, the contact information displayed in the main Sales Order report actually comes from a Contacts subreport.  
  
> [!NOTE]  
>  You can create and modify paginated report definition (.rdl) files in Power BI Report Builder. Subreports stored in SQL Server Reporting Services can be uploaded to a Premium workspace in the Power BI service, but the main reports and the subreports need to be published to the same workspace.  
  
## Comparing subreports and nested data regions  
 If you're thinking of using subreports to display separate groups of data, consider using data regions, such as tables, matrices, and charts, instead. Reports with data regions only may perform better than reports that include subreports.  
  
 Use data regions to nest groups of data from the same data source within a single data region. Use subreports to nest groups of data from different data sources within a single data region, reuse a subreport in multiple parent reports, or display a standalone report inside of another report. For example, you can create a "briefing book" by placing multiple subreports inside the body of another report.  
  
 Data regions provide much of the same functionality and flexibility as subreports, but with better performance. Because the report server processes each instance of a subreport as a separate report, performance can be impacted. See [Nested data regions](https://docs.microsoft.com/sql/reporting-services/report-design/nested-data-regions-report-builder-and-ssrs) in the SQL Server Reporting Services documentation.
  
## Using parameters in subreports  
 To pass parameters from the parent report to the subreport, define a report parameter in the report that you use as the subreport. When you place the subreport in the parent report, you can select the report parameter and a value to pass from the parent report to the report parameter in the subreport.  
  
> [!NOTE]  
> The parameter that you select from the subreport is a *report* parameter, not a *query* parameter.  
  
 You can place a subreport in the main body of the report or in a data region. If you place a subreport in a data region, the subreport repeats with each instance of the group or row in the data region. To pass a value from the group or row to the subreport, in the subreport value property, use a field expression for the field containing the value you want to pass to the subreport parameter.  
  
 For more information about working with subreports, see [Add a subreport and parameters](https://docs.microsoft.com/sql/reporting-services/report-design/add-a-subreport-and-parameters-report-builder-and-ssrs.md) in the SQL Server Reporting Services documentation.  
  
## Specifying subreport names

Subreports have to be in the same workspace or app as the main report. To add the subreport to the main report, you specify the name of the subreport in the **Name** text box in the **Subreport Properties** dialog box.

> [!NOTE]
> Renaming subreports in the workspace without fixing the name reference in the main report prevents the subreport from rendering. The main report still renders with an error message inside the subreport item.

## Sharing reports that have subreports

As we've stated, the main report and subreports must be in the same workspace. Otherwise, the subreport doesn't render. When sharing the main report, you also need to share the subreports. If you share the main report in an app, make sure you also include the subreports in that app. If you share the main report with users or user groups directly, make sure you also share each subreport with the same set of users or user groups.
  
## Next steps

[View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
