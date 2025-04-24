---
title: "Data regions and maps in a Power BI paginated report | Microsoft Docs"
description: Explore the types and characteristics of data regions and maps to design the display from your paginated report datasets in Power BI Report Builder.  
ms.date: 02/13/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
helpviewer_keywords: 
  - "data regions"
author: kfollis
ms.author: kfollis
ms.reviewer: monaraya
---
# Data regions and maps in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  A data region is an object in a Power BI paginated report that displays data from a report dataset. Report data can be displayed as numbers and text in a table, matrix, or list; graphically in a chart or gauge; and against a geographic background in a map. Tables, matrices, and lists are all based on the *tablix* data region, which expands as needed to display all the data from the dataset. A tablix data region supports multiple row and column groups and both static and dynamic rows and columns. A chart displays multiple series and category groups in a variety of chart formats. A gauge displays a single value or an aggregated value for a dataset. A map displays spatial data as map elements that can vary in appearance based on aggregated data from a dataset.  
  
## Table  
 A table is a data region that presents data row by row. Table columns are static: you determine the number of columns when you design your report. Table rows are dynamic: they expand downwards to accommodate the data. You can add groups to tables, which organize data by selected fields or expressions. For information about adding a table to a report, see [Tables &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/tables-report-builder-and-ssrs).  
  
## Matrix  
 A matrix is also known as a crosstab. A matrix data region contains both dynamic columns and rows: they expand to accommodate the data. A matrix can have dynamic columns and rows and static columns and rows. Columns or rows can contain other columns or rows, and can be used to group data. Read more about [adding a matrix to a report](/sql/reporting-services/report-design/create-a-matrix-report-builder-and-ssrs).  
  
## List  
 A list is a data region that presents data arranged in a freeform fashion. You can arrange report items to create a form with text boxes, images, and other data regions placed anywhere within the list. Read more about [adding a list to a report](/sql/reporting-services/report-design/create-invoices-and-forms-with-lists-report-builder-and-ssrs).  
  
## Chart  
 A chart presents data graphically. Examples of charts include bar, pie, and line charts, but many more styles are supported. Read more about [Charts in Power BI paginated reports (Power BI Report Builder)](../report-design/visualizations/charts-report-builder.md).  
  
## Gauge  
 A gauge presents data as a range with an indicator pointing to a specific value within the range. Gauges are used to display key performance indicators (KPIs) and other metrics. Examples of gauges include linear and circular. Read more about [adding a gauge to a report](../report-design/visualizations/gauges-report-builder.md).  
  
## Map  
 A map enables you to present data against a geographical background. Map data can be spatial data from a query, an ESRI shapefile, or Bing map tiles. Spatial data consists of sets of coordinates that define polygons that represent shapes or areas, lines that represent routes or paths, and points represented by markers. You can associate aggregate data with map elements to automatically vary their color and size. For example, you can vary the marker type for a store based on sales amount or the color for a road based on speed limit. For more information, see [Maps &#40;Power BI Report Builder&#41;](maps-report-builder.md).  
  
## Data regions in the report layout  
 You can add multiple data regions to a report. Data regions grow to accommodate the data from the report dataset that they are linked to. For example, a matrix that displays sales for each product by year has a row group based on product names and a column group based on years. When you run the report, the matrix expands down the page for each product and across the page for each year. A chart that is placed next to the matrix on the report design surface displays next to the expanded matrix in the rendered report. The way data regions render on a page follows a set of rules based on the output format of a report. For example, to help control how a chart and matrix render on a page, you might use a rectangle as a container or nest both data regions in a list. For more information, see [Page Layout and Rendering &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/page-layout-and-rendering-report-builder-and-ssrs)
  
## Nested data regions  
 You can nest data regions within other data regions. For example, if you want to create a sales record for each sales person in a database, you can create a list with text boxes and an image to display information about the employee, and then add table and chart data regions to the list to show the employee's sales record.
  
## Multiple data regions linked to the same dataset  
 You can link more than one data region to the same dataset to provide different views of the same data. For example, you can show the same data in a table and in a chart. You can author the report to provide interactive sort buttons on the table, so that when you sort the table, the chart is also automatically sorted. For more information, see [Linking Multiple Data Regions to the Same Dataset &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/linking-multiple-data-regions-to-the-same-dataset-report-builder-and-ssrs).  
  
## Data for a data region  
 Each tablix, chart, and gauge is designed to display data from a single dataset. A map displays spatial data and analytical data from the same or different datasets. You can also include values from datasets that are not linked to the data region in the following ways:  
  
- Aggregate values that don't depend on sort order or grouping that's scoped to a different dataset.  
  
- Lookup values from name/value pairs in a different dataset.  
  
 For more information, see [Expressions in Power BI Report Builder](../expressions/report-builder-expressions.md).  
  
## Related content

- [What are paginated reports in Power BI?](../paginated-reports-report-builder-power-bi.md)
- [Power BI Report Builder](../report-builder-power-bi.md)   
- [Page Layout and Rendering &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/page-layout-and-rendering-report-builder-and-ssrs)    
