---
title: "DataSources and DataSets collection references in a paginated report"
description: Learn about the collections of datasources and datasets. Find out how to make them available after the paginated report is published to a report server in Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
ms.date: 06/21/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.custom: updatefrequency5
---
# Built-in collections - DataSources and DataSets references in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  The **DataSources** collection represents all the data sources used in a paginated report. Similarly, the **DataSets** collection represents all the datasets for all the data sources in a report. Use the **Report Data** pane for a hierarchical view of report datasets organized under the data source they reference.  
  
## DataSources  
 The **DataSources** collection represents the data sources referenced in a published report definition. You may choose to include this information in your report to document the source of the report data. The following table describes the variables within the **DataSources** collection.  
  
|**Variable**|**Type**|**Description**|  
|------------------|--------------|---------------------|  
|**Type**|**String**|The type of data provider for the data source. For example, `SQLAZURE`.|  

The following expression returns the data source type for data source named "DataSource1" in the report:
```
=DataSources("DataSource1").Type
```

## DataSets  
 The **DataSets** collection represents the datasets referenced in a report definition. You may choose to include the query in the report in a text box, so a user interested in exactly which data is in the report can see the original command text. The following table describes the members of the **DataSets** collection.  
  
|**Member**|**Type**|**Description**|  
|----------------|--------------|---------------------|  
|**CommandText**|**String**|For database data sources, this is the query used to retrieve data from the data source. If the query is an expression, this is the evaluated expression.|  
|**RewrittenCommandText**|**String**|The data provider's expanded CommandText value. This is typically used for reports with query parameters that are mapped to report parameters. The data provider sets this property when expanding the command text parameter references into the constant values selected for the mapped report parameters.|  

The following expression returns the query used in dataset named "DataSet1" in the report:
```
=DataSets("DataSet1").CommandText
```

### Using Query Expressions  
 You can use expressions to define the query that is contained in a dataset. You can use this feature to design reports in which the query changes based on input from the user, data in other datasets, or other variables. For more information about queries, see [Report Embedded Datasets &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-data/report-embedded-datasets-and-shared-datasets-report-builder-and-ssrs).
  
## Next steps

- [Expression Uses in Reports (Power BI Report Builder)](./expression-uses-reports-report-builder.md)
- [Expression Examples (Power BI Report Builder)](./report-builder-expression-examples.md)
- [Data Types in Expressions (Power BI Report Builder)](./data-types-expressions-report-builder.md)
- [Expression Scope for Totals, Aggregates, and Built-in Collections (Power BI Report Builder)](./expression-scope-for-totals-aggregates-and-built-in-collections.md)
  
  
