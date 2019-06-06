---
title: Report Data in Power BI Report Builder
author: maggiesMSFT
ms.author: maggies
manager: kfile
ms.reviewer: ""
ms.prod: reporting-services
ms.prod_service: reporting-services-native
ms.technology: report-data
ms.topic: conceptual
ms.custom: seodec18
ms.date: 12/14/2018
---

# Report Data in Power BI Report Builder

  Report data can come from multiple sources of data in your organization. Your first step in designing a report is to create data sources and datasets that represent the underlying report data. Each data source includes data connection information. Each dataset includes a query command that defines the set of fields to use as data from a data source. To visualize data from each dataset, add a data region, such as a table, matrix, chart, or map. When the report is processed, the queries run on the data source, and each data region expands as needed to display the query results for the dataset.  


##  <a name="BkMk_ReportDataTerms"></a> Terms  
  
- **Data connection.** Also known as a *data source*. A data connection includes a name and connection properties that are dependent on the connection type. By design, a data connection does not include credentials. A data connection does not specify which data to retrieve from the external data source. To do that, you specify a query when you create a dataset.  
  
- **Connection string.** A connection string is a string version of the connection properties that are needed to connect to a data source. Connection properties differ based on data connection type.  
  
- **Embedded data source.** Also known as a *report-specific data source*. A data source that is defined in a report and used only by that report.  
  
- **Credentials.** Credentials are the authentication information that must be provided to allow you access to external data.  
  
##  <a name="BkMk_ReportDataTips"></a> Tips for Specifying Report Data

 Use the following information to design your report data strategy.  
  
- **Filter data** Report data can be filtered in the query or in the report. You can use datasets and query variables to create cascading parameters, and provide a user the ability to narrow choices from thousands of selections to a more manageable number. You can filter data in a table or chart based on parameter values or other values that you specify.  
  
- **Parameters** Dataset query commands that include query variables automatically create matching report parameters. You can also manually create parameters. When you view a report, the report toolbar displays the parameters. Users can select values to control report data or report appearance. To customize report data for specific audiences, you can create sets of report parameters with different default values linked to the same report definition, or use the built-in **UserID** field. 
  
- **Group and aggregate data** Report data can be grouped and aggregated in the query or in the report. If you aggregate values in the query, you can continue to combine values in the report within the constraints of what is meaningful.  
  
- **Sort data** Report data can be sorted in the query or in the report. In tables, you can also add an interactive sort button to let the user control the sort order.  
  
- **Expression-based data** Because most report properties can be expression-based, and expressions can include references to dataset fields and report parameters, you can write powerful expressions to control report data and appearance. You can provide a user the ability to control the data they see by defining parameters.  
  
- **Display data from a dataset** Data from a dataset is typically displayed on one or more data regions, for example, a table and a chart.  
  
- **Display data from multiple datasets**  You can write expressions in a data region based on one dataset that look up values or aggregates in other datasets. You can include subreports in a table based on one dataset to display data from a different data source.  
  
 Use the following list to help define sources of data for a report.  
  
- Understand the software data layer architecture for your organization and the potential issues arising from data types. Understand how data extensions and data processing extensions can affect query results. Data types differ among the source of data, data providers, and the data types stored in the report definition (.rdl) file.  
  
- Data sources and datasets are authored in a report and published to the Power BI service. After they are published, you can configure credentials directly in the Power BI service or in your Enterprise Gateway. 

  
