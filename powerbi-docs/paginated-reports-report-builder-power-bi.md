---
title: "What are paginated reports in Power BI?"
description: Paginated reports are reports that can be printed or shared. You can control the report layout exactly. They display all the data in a table, for example, even if the table spans multiple pages.  
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: report-builder
ms.topic: overview
ms.date: 06/11/2018
ms.author: maggies

---
# What are paginated reports in Power BI?
Paginated reports are designed to be printed or shared. You can control their report layout exactly. They're called "paginated" because they're formatted to fit well on a page, and display all the data in a table, for example, even if the table spans multiple pages. Report Builder is the standalone tool for authoring paginated reports.  When you design a paginated report, you're creating a *report definition* that specifies where to get the data, which data to get, and how to display the data. When you run the report, the report processor takes the report definition you have specified, retrieves the data, and combines it with the report layout to generate the report. You can preview your report in Report Builder and publish your report to the Power BI service, http://app.powerbi.com.  

This paginated report features a matrix with row and column groups, sparklines, indicators, and a summary pie chart in the corner cell, accompanied by a map with two sets of geographic data represented by color and by circle size.  
  
## Start with a wizard 
  
### Start with the Table, Matrix, or Chart wizard

Choose a data source connection, drag and drop fields to create a dataset query, select a layout and style, and customize your report.  
  
### Start with the Map wizard

Create reports that display aggregated data against a geographic or geometric background. Map data can be spatial data from a Transact-SQL query or an Environmental Systems Research Institute, Inc. (ESRI) shapefile. You can also add a Microsoft Bing map tile background.  
  
## Design your report  
  
### Report from a variety of data sources

Build reports using data from any data source type that has a Microsoft .NET Framework-managed data provider, OLE DB provider, or ODBC data source. You can create reports that use relational and multidimensional data from SQL Server and Azure SQL Database, Analysis Services and Azure Analysis Services, Oracle, Hyperion, and other databases. You can use an XML data processing extension to retrieve data from any XML data source. You can use table-valued functions to design custom data sources.  

### Create paginated reports with matrix, chart, and free-form layouts

Create table reports for column-based data, matrix reports (like cross-tab or PivotTable reports) for summarized data, chart reports for graphical data, and free-form reports for anything else. Reports can embed other reports and charts, together with lists, graphics, and controls for dynamic Web-based applications.  

### Add more to your report

Modify your data by filtering, grouping, and sorting data, or by adding formulas or expressions. Add charts, gauges, sparklines, and indicators to summarize data in a visual format, and present large volumes of aggregated information at a glance. Add interactive features such as document maps, show/hide buttons, and drillthrough links to subreports and drillthrough reports. Use parameters and filters to filter data for customized views. Embed or reference images and other resources, including external content.  

## Manage your paginated report

When you finish designing the report, what you've really created is a report definition. You upload the report definition to the Power BI service, http://app.powerbi.com, either to your My Workspace or to a workspace with your colleagues. From there, you can share it with others. 

**Choose a presentation format** when you open the report, or after you open the report. You can select Web-oriented, page-oriented, and desktop application formats such as HTML, MHTML, PDF, XML, CSV, TIFF, Word, and Excel.  
  
**Set up subscriptions.** After you publish the report to the Power BI service, you can configure your report to run at a specific time, create a report history, and set up e-mail subscriptions.  
  
**Generate data feeds** from your report by using the Reporting Services Atom rendering extension.  

  
## See Also  

[Install Report Builder](../../reporting-services/install-windows/install-report-builder.md)

[Tutorial: Creating a Quick Chart Report Offline](../../reporting-services/report-builder/tutorial-create-a-quick-chart-report-offline-report-builder.md)  
 Introduces Report Builder and the wizards available to help you create reports. The tutorial provides a set of sample data so you don't need to connect to a data source to get started.  
  

