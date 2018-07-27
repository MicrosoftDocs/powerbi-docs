---
title: "What are paginated reports in Power BI Premium? (Preview)"
description: Paginated reports are reports that can be printed or shared. You can control the report layout exactly. They display all the data in a table, for example, even if the table spans multiple pages.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: overview
ms.date: 07/26/2018
ms.author: maggies

---
# What are paginated reports in Power BI Premium? (Preview)
Paginated reports are designed to be printed or shared. They're called "paginated" because they're formatted to fit well on a page, and display all the data in a table, for example, even if the table spans multiple pages. They're sometimes called "pixel perfect" because you can control their report page layout exactly. Report Builder is the standalone tool for authoring paginated reports. You can preview your report in Report Builder and publish your report to the Power BI service, http://app.powerbi.com. You need a Power BI Pro license to publish a report to the service, and you can only publish paginated reports to a Power BI Premium capacity. 

## Create reports in Report Builder

Paginated reports have their own design tool, Report Builder. It's the same version of Report Builder you would use to create paginated reports for Power BI Report Server or SQL Server Reporting Services (SSRS). In fact, many paginated reports on report servers will also work in the Power BI service, though not all report features are available at launch. See the Limitations and considerations section for details.

You can upload to the Power BI service as-is paginated reports that you created for SSRS 2016 and 2017 or Power BI Report Server, and you can upgrade any previous version of paginated reports.
     
## Report from a variety of data sources

For the initial release of paginated reports in the Power BI service, you create embedded data sources and datasets in the report itself, rather than shared data sources or datasets on a server. You create reports in Report Builder on your local machine. When you upload the report to the Power BI service, you need to create a gateway and redirect the data connection. Here are the data sources you can connect to for the initial release:

- Azure SQL Database and Data Warehouse
- SQL Server via a gateway
- SQL Server Analysis Services via a gateway
- Oracle via a gateway
 
Paginated reports can have a number of different data sources. They don't have the concept of a data model, unlike Power BI reports.

## Design your report  

### Create paginated reports with matrix, chart, and free-form layouts

Create table reports for column-based data, matrix reports (like cross-tab or PivotTable reports) for summarized data, chart reports for graphical data, and free-form *list* reports for anything else, such as invoices. 
  
You can start with one of the Report Builder wizards. The Table, Matrix, and Chart wizards walk you through creating the embedded data source connection and embedded dataset. Then you drag and drop fields to create a dataset query, select a layout and style, and customize your report.  
  
With the Map wizard, you create reports that display aggregated data against a geographic or geometric background. Map data can be spatial data from a Transact-SQL query or an Environmental Systems Research Institute, Inc. (ESRI) shapefile. You can also add a Microsoft Bing map tile background.  

### Add more to your report

Modify your data by filtering, grouping, and sorting data, or by adding formulas or expressions. Add charts, gauges, sparklines, and indicators to summarize data in a visual format.  Use parameters and filters to filter data for customized views. Embed or reference images and other resources, including external content.  

Everything in a paginated report, from the report itself to every text box, image, table, and chart, has an array of properties you can set to make the report look exactly as you want it.

## Manage your paginated report

When you design a paginated report, what you're really creating is a *report definition* that specifies where to get the data, which data to get, and how to display the data. When you run the report, the report processor takes the report definition you've specified, retrieves the data, and combines it with the report layout to generate the report. You upload the report definition to the Power BI service, http://app.powerbi.com, either to your My Workspace or to a workspace shared with your colleagues. If the report data source is on premises, after you upload the report, you redirect the data source connection to go through a gateway. 

When you view your paginated report in the Power BI service, you can export it to a number of Web-oriented, page-oriented, and desktop application formats such as HTML, MHTML, PDF, XML, CSV, TIFF, Word, and Excel.  
  
## Limitations and considerations

Here's a list of features that won't be in the initial release:

- Interactive features such as document maps, show/hide buttons, and drillthrough links
- Subreports and drillthrough reports.
- Subscriptions
- Shared data sources and shared datasets
- Power BI datasets
- Visuals from Power BI reports 

Also, you can only publish paginated reports to a Power BI Premium capacity.
  
## See also  

**Install Report Builder**

**Tutorial: Creating a Quick Chart Report Offline**
 Introduces Report Builder and the wizards available to help you create reports. The tutorial provides a set of sample data so you don't need to connect to a data source to get started.  
  

