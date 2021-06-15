---
title: Using the Field list in Power BI Desktop
description: Use the Field list to model data and create reports in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 05/12/2021
LocalizationGroup: Transform and shape data
---

# Using the Field list in Power BI Desktop 

The **Field** lists are being unified across Model view, Data view and Report view in Power BI Desktop. Unifying these views will create consistency for functionality and the user interface (UI) across views, and addresses customer feedback.

Changes you’ll notice across views include the following:

* Iconography
* Search functionality
* Context menu items
* Similar drag-drop behavior
* Tooltips
* Accessibility improvements

The intent is to improve Power BI Desktop usability. The changes should have minimal impact on your typical data workflow.

## Field list changes

The following tables show the field list updates. 


|**Original field list (Model view)**  | **New field list (Model view)**  |
|:---------:|:---------:|
|**Original** |**New** |
|**Icons and UI**       ||
|![original field list](media/desktop-field-list/field-list-01a.png)     |![new field list](media/desktop-field-list/field-list-01b.png)    |
|**Context menu - Field**       ||
|![original context menu for Field](media/desktop-field-list/field-list-02a.png)     |![new context menu for Field](media/desktop-field-list/field-list-02b.png)    |
|**Context menu - Table**       ||
|![original context menu for table](media/desktop-field-list/field-list-03a.png)     |![new context menu for table](media/desktop-field-list/field-list-03b.png)    |
|**Tooltips**       ||
|![original tooltip](media/desktop-field-list/field-list-04a.png)     |![new tooltip](media/desktop-field-list/field-list-04b.png)    |

## Field list icons

There are new Field list icons as well. The following table shows the original icons and their new equivalent, and provides a brief description of each. 


|Original icon  |New icon  |Description  |
|:---------:|:---------:|:---------|
|![original folder icon](media/desktop-field-list/field-list-05a.png)     |![new folder icon](media/desktop-field-list/field-list-05b.png)           |Folder in the Fields list         |
|![original numeric field icon](media/desktop-field-list/field-list-06a.png)     |![new numeric field icon](media/desktop-field-list/field-list-06b.png)         |Numeric field: Numeric fields are aggregates that can be summed or averaged, for example. Aggregates are imported with the data and defined in the data model your report is based on. For more information, see [Aggregates in Power BI reports](../create-reports/service-aggregates.md).         |
|![original calculated column icon](media/desktop-field-list/field-list-07a.png)     |![new calculated column icon](media/desktop-field-list/field-list-07b.png)         |Calculated column with a non-numeric data type: A new non-numeric column you create with a Data Analysis Expressions (DAX) formula that defines the column’s values. Read more about [calculated columns](desktop-calculated-columns.md).        |
|![original numeric calculated column icon](media/desktop-field-list/field-list-08a.png)     |![new numeric calculated column icon](media/desktop-field-list/field-list-08b.png)          |Numeric calculated column: A new column you create with a Data Analysis Expressions (DAX) formula that defines the column’s values. Read more about [calculated columns](desktop-calculated-columns.md).         |
|![original measure icon](media/desktop-field-list/field-list-09a.png)     |![new measure icon](media/desktop-field-list/field-list-09b.png)          |Measure: A measure has its own hard-coded formula. Report viewers can’t change the calculation, for example, if it’s a sum, it can only be a sum. The values aren't stored in a column. They're calculated on the fly, depending solely on their location in a visual. For more information, read [Understanding measures](desktop-measures.md).         |
|![original measure group icon](media/desktop-field-list/field-list-10a.png)     |![new measure group icon](media/desktop-field-list/field-list-10b.png)         |Measure group.         |
|![original kpi icon](media/desktop-field-list/field-list-11a.png)     |![new kpi icon](media/desktop-field-list/field-list-11b.png)         |KPI: A visual cue that communicates the amount of progress made toward a measurable goal. Read more about [Key Performance Indicator (KPI)](../visuals/power-bi-visualization-kpi.md) visuals.         |
|![original hierarcy of fields icon](media/desktop-field-list/field-list-12a.png)     |![new hierarcy of fields icon](media/desktop-field-list/field-list-12b.png)           |Hierarchy of fields: Select the arrow to see the fields that make up the hierarchy. Watch this Power BI video on YouTube about [Creating and working with hierarchies](https://www.youtube.com/watch?v=q8WDUAiTGeU) for more information.         |
|![original geo data icon](media/desktop-field-list/field-list-13a.png)     |![new geo data icon](media/desktop-field-list/field-list-13b.png)         |Geo data: These location fields can be used to create map visualizations.         |
|![original identity field icon](media/desktop-field-list/field-list-14a.png)     |![new identity field icon](media/desktop-field-list/field-list-14b.png)          |Identity field: Fields with this icon are unique fields, set to show all values, even if they have duplicates. For example, your data might have records for two different people named 'Robin Smith', and each will be treated as unique. They won't be summed.         |
|![original parameter icon](media/desktop-field-list/field-list-15a.png)     |![new parameter icon](media/desktop-field-list/field-list-15b.png)          |Parameter: Set parameters to make parts of your reports and data models (such as a query filter, a data source reference, a measure definition, etc.) depend on one or more parameter values. See this Power BI blog post about [query parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/) for more information.         |
|![original calendar date field icon](media/desktop-field-list/field-list-16a.png)     |![new calendar date field icon](media/desktop-field-list/field-list-16b.png)         |Calendar date field with a built-in date table.         |
|![original calculated table icon](media/desktop-field-list/field-list-17a.png)     |![new calculated table icon](media/desktop-field-list/field-list-17b.png)          |Calculated table: A table created with a Data Analysis Expressions (DAX) formula based on data already loaded into the model. These are best used for intermediate calculations and you want to store as part of the model.         |
|![original warning icon](media/desktop-field-list/field-list-18a.png)     |![new warning icon](media/desktop-field-list/field-list-18b.png)         |Warning: A calculated field with an error. For example, the syntax of the DAX expression might be incorrect.         |
|![original group icon](media/desktop-field-list/field-list-19a.png)     |![new group icon](media/desktop-field-list/field-list-19b.png)         |Group: Values in this column are based on grouping values from another column, by using the groups and bins feature. You can read how to [Use grouping and binning](../create-reports/desktop-grouping-and-binning.md).         |
| no original icon    |![new change detection measure icon](media/desktop-field-list/field-list-20b.png)          |Change detection measure: When you configure a page for automatic page refresh, you can configure a [change detection measure](../create-reports/desktop-grouping-and-binning.md) that is queried to determine if the rest of a page’s visuals should be updated.         |


## Next steps

You might also be interested in the following articles:

* [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md)
* [Use grouping and binning in Power BI Desktop](../create-reports/desktop-grouping-and-binning.md)
* [Use gridlines and snap-to-grid in Power BI Desktop reports](../create-reports/desktop-gridlines-snap-to-grid.md)

