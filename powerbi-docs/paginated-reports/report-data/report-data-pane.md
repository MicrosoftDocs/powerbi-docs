---
title: Report Data pane (Power BI Report Builder)
description: Learn how to use the Report Data pane to view the currently defined parameters, data sources, datasets, field collections, and images in your report.
ms.date: 09/11/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: rpatkar
---

# Report Data pane (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  Use the **Report Data** pane to view the currently defined parameters, data sources, datasets, field collections, and images in your report. The Report Data pane displays a hierarchical view of the items that represent data in your report. The top level nodes represent built-in fields, parameters, images, and data source references. Expand each node to view the data items. For example, when you expand a data source node, the datasets defined for that data source appear. When you expand a dataset, its field collection appears. Drag items to the report design surface to link data with report items on the report page.  
  
## Built-in fields

 Represents fields provided by Reporting Services that are commonly used in a report, such as the report name or page number. For more information, see [Built-in Collections in Expressions (Power BI Report Builder)](../expressions/built-in-collections-in-expressions-report-builder.md).
  
## Parameters

 Represents the collection of report parameters, each of which can be single-valued or multivalued. For more information, see [Report Parameters (Power BI Report Builder)](../parameters/report-builder-parameters.md).
  
## Images

 Represents the set of images used in the report. For more information, see [Images (Power BI Report Builder)](../report-design/images-report-builder-service.md).
  
## Data source

 Represents a single data source reference to an embedded data source. A data source specifies one of the data source types supported by Power BI Report Builder. A data source is the parent node for the collection of datasets based on it. For more information, see [Create data connection strings (Power BI Report Builder)](./data-connections-data-sources-connection-strings-report-builder.md).
  
## Dataset

 Represents a single dataset. A dataset is the parent node for the collection of fields specified by the query and including any calculated fields. Reporting Services supports query designers to help you specify a query.
  
## Related content

- [Dataset Fields Collection (Power BI Report Builder)](./dataset-fields-collection-report-builder.md)