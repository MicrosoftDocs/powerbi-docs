---
title: "What are paginated reports in Power BI Premium? (Preview)"
description: Paginated reports are reports that can be printed or shared. You can control the report layout exactly. They display all the data in a table, for example, even if the table spans multiple pages.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: overview
ms.date: 08/01/2018
ms.author: maggies

---
# What are paginated reports in Power BI Premium? (Preview)
Paginated reports are designed to be printed or shared. They're called "paginated" because they're formatted to fit well on a page, and display all the data in a table, for example, even if the table spans multiple pages. They're sometimes called "pixel perfect" because you can control their report page layout exactly. Paginated reports are based on the RDL report technology in SQL Server Reporting Services. 

Report Builder is the standalone tool for authoring paginated reports. You can preview your report in Report Builder and publish your report to the Power BI service, http://app.powerbi.com. You need a Power BI Pro license to publish a report to the service. You can publish and share paginated reports in your My Workspace or in app workspaces, as long as the workspace is in a Power BI Premium capacity. 

## Create reports in Report Builder

Paginated reports have their own design tool, Report Builder. If you've created paginated reports for Power BI Report Server or SQL Server Reporting Services (SSRS), you can use the same tool and the same version. In fact, paginated reports that you create for SSRS 2016 and 2017 or for Power BI Report Server on-premises, are compatible with the Power BI service. The Power BI service maintains backwards compatibility so you can move your reports forward, and you can upgrade any previous-version paginated reports. Not all report features are available at launch; see [Limitations and considerations](#limitations-and-considerations) in this article for details.
     
## Report from a variety of data sources

A single paginated report can have a number of different data sources. It doesn't have an underlying data model, unlike Power BI reports. For the initial release of paginated reports in the Power BI service, you create embedded data sources and datasets in the report itself, rather than connecting to shared data sources or datasets on a server. You create reports in Report Builder on your local machine. If a report connects to on-premises data, after you upload the report to the Power BI service, you need to create a gateway and redirect the data connection. Here are the data sources you can connect to for the initial release:

- Azure SQL Database and Data Warehouse
- SQL Server via a gateway
- SQL Server Analysis Services via a gateway
 
More data sources will be coming during the preview period.

## Design your report  

### Create paginated reports with matrix, chart, and free-form layouts

Create table reports for column-based data, matrix reports (like cross-tab or PivotTable reports) for summarized data, chart reports for graphical data, and free-form *list* reports for anything else, such as invoices. 
  
You can start with one of the Report Builder wizards. The Table, Matrix, and Chart wizards walk you through creating the embedded data source connection and embedded dataset. Then you drag and drop fields to create a dataset query, select a layout and style, and customize your report.  
  
With the Map wizard, you create reports that display aggregated data against a geographic or geometric background. Map data can be spatial data from a Transact-SQL query or an Environmental Systems Research Institute, Inc. (ESRI) shapefile. You can also add a Microsoft Bing map tile background.  

### Add more to your report

Modify your data by filtering, grouping, and sorting data, or by adding formulas or expressions. Add charts, gauges, sparklines, and indicators to summarize data in a visual format.  Use parameters and filters to filter data for customized views. Embed or reference images and other resources, including external content.  

Everything in a paginated report, from the report itself to every text box, image, table, and chart, has an array of properties you can set to make the report look exactly as you want it.

## Creating a report definition

When you design a paginated report, you're really creating a *report definition*. It doesn't contain the data. It specifies where to get the data, which data to get, and how to display the data. When you run the report, the report processor takes the report definition you've specified, retrieves the data, and combines it with the report layout to generate the report. You upload the report definition to the Power BI service, http://app.powerbi.com, either to your My Workspace or to a workspace shared with your colleagues. If the report data source is on premises, after you upload the report, you redirect the data source connection to go through a gateway. 

## View your paginated report
When you view your paginated report in the Power BI service, you can export it to a number of Web-oriented, page-oriented, and desktop application formats, such as HTML, MHTML, PDF, XML, CSV, TIFF, Word, and Excel.  
  
## Limitations and considerations

You can only publish paginated reports to your My Workspace, and your My Workspace needs to be in a Power BI Premium capacity.

Here are some other features that won't be supported in the initial release:

- Interactive features such as document maps and show/hide buttons.
- Subreports and drillthrough reports.
- Subscriptions.
- Shared data sources and shared datasets.
- Power BI datasets.
- Visuals from Power BI reports.
 
## See also  

[Install Report Builder from the Microsoft Download Center](http://go.microsoft.com/fwlink/?LinkID=734968)
[Quickstart: Create a paginated report](paginated-reports-quickstart-chart.md) and upload it to the Power BI service. Introduces Report Builder and the wizards available to help you create reports. The tutorial provides a set of sample data so you don't need to connect to a data source to get started.  
  

