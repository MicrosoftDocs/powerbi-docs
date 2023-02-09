---
title: Use the Field list in Power BI Desktop
description: Learn how to use the Field list to model data and create reports in Power BI Desktop, and how the user interface (UI) has changed.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 02/09/2023
LocalizationGroup: Transform and shape data
---

# Use the Field list in Power BI Desktop

The **Field** lists are being unified across Model view, Data view and Report view in Power BI Desktop. Unifying these views creates consistency for functionality and the user interface (UI) across views, and addresses customer feedback.

The following changes across the views are:

* Iconography
* Search functionality
* Context menu items
* Similar drag-drop behavior
* Tooltips
* Accessibility improvements

The intent is to improve Power BI Desktop usability. The changes should be minimal on your typical data workflow.

## Field list changes

The following tables show the field list updates.

|**Original field list (Model view)**  | **New field list (Model view)**  |
|:---------:|:---------:|
|**Original** |**New** |
|**Icons and UI**       ||
|:::image type="content" source="media/desktop-field-list/field-list-01a.png" alt-text="Screenshot of the original Model view Fields list in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-01b.png" alt-text="Screenshot of the new Model view Fields list in Power BI Desktop.":::    |
|**Context menu - Field**       ||
|:::image type="content" source="media/desktop-field-list/field-list-02a.png" alt-text="Screenshot of the original context menu for a field in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-02b.png" alt-text="Screenshot of the new context menu for a field in Power BI Desktop.":::    |
|**Context menu - Table**       ||
|:::image type="content" source="media/desktop-field-list/field-list-03a.png" alt-text="Screenshot of the original context menu for a table in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-03b.png" alt-text="Screenshot of the new context menu for a table in Power BI Desktop.":::     |
|**Tooltips**       ||
|:::image type="content" source="media/desktop-field-list/field-list-04a.png" alt-text="Screenshot of the original tooltip for a table in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-04b.png" alt-text="Screenshot of the new tooltip for a table in Power BI Desktop.":::    |

## Field list icons

There are new Field list icons as well. The following table shows the original icons and their new equivalent, and provides a brief description of each.

|Original icon  |New icon  |Description  |
|:---------:|:---------:|:---------|
|:::image type="content" source="media/desktop-field-list/field-list-05a.png" alt-text="Screenshot of the original folder icon in Power BI Desktop.":::      |:::image type="content" source="media/desktop-field-list/field-list-05b.png" alt-text="Screenshot of the new Folder icon in Power BI Desktop.":::           |Folder in the Fields list         |
|:::image type="content" source="media/desktop-field-list/field-list-06a.png" alt-text="Screenshot of the original numeric field icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-06b.png" alt-text="Screenshot of the new numeric field icon in Power BI Desktop.":::         |Numeric field: Numeric fields are aggregates that can be summed or averaged, for example. Aggregates are imported with the data and defined in the data model your report is based on. For more information, see [Work with aggregates (sum, average, and so on) in Power BI](../create-reports/service-aggregates.md).         |
|:::image type="content" source="media/desktop-field-list/field-list-07a.png" alt-text="Screenshot of the original calculated column icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-07b.png" alt-text="Screenshot of the new calculated column icon in Power BI Desktop.":::         |Calculated column with a non-numeric data type: A new non-numeric column you create with a Data Analysis Expressions (DAX) formula that defines the column’s values. For more information, see [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md).        |
|:::image type="content" source="media/desktop-field-list/field-list-08a.png" alt-text="Screenshot of the original numeric calculated column icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-08b.png" alt-text="Screenshot of the new numeric calculated column icon in Power BI Desktop.":::          |Numeric calculated column: A new column you create with a Data Analysis Expressions (DAX) formula that defines the column’s values. For more information, see [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md).         |
|:::image type="content" source="media/desktop-field-list/field-list-09a.png" alt-text="Screenshot of the original measure icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-09b.png" alt-text="Screenshot of the new measure icon in Power BI Desktop.":::          |Measure: A measure has its own hard-coded formula. Report viewers can’t change the calculation, for example, if it’s a sum, it can only be a sum. The values aren't stored in a column. They're calculated on the fly, depending solely on their location in a visual. For more information, see [Create measures for data analysis in Power BI Desktop](desktop-measures.md).         |
|:::image type="content" source="media/desktop-field-list/field-list-10a.png" alt-text="Screenshot of the original measure group icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-10b.png" alt-text="Screenshot of the new measure group icon in Power BI Desktop.":::         |Measure group.         |
|:::image type="content" source="media/desktop-field-list/field-list-11a.png" alt-text="Screenshot of the original KPI icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-11b.png" alt-text="Screenshot of the new KPI icon in Power BI Desktop.":::         |KPI: A visual cue that communicates the amount of progress made toward a measurable goal. For more information, see [Create key performance indicator (KPI) visualizations](../visuals/power-bi-visualization-kpi.md).         |
|:::image type="content" source="media/desktop-field-list/field-list-12a.png" alt-text="Screenshot of the original hierarchy of fields icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-12b.png" alt-text="Screenshot of the new hierarchy of fields icon in Power BI Desktop.":::           |Hierarchy of fields: Select the arrow to see the fields that make up the hierarchy. For more information, see [Creating and working with hierarchies in Power BI (3-11g)](https://www.youtube.com/watch?v=q8WDUAiTGeU) on YouTube.         |
|:::image type="content" source="media/desktop-field-list/field-list-13a.png" alt-text="Screenshot of the original geo data icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-13b.png" alt-text="Screenshot of the new geo data icon in Power BI Desktop.":::         |Geo data: These location fields can be used to create map visualizations.         |
|:::image type="content" source="media/desktop-field-list/field-list-14a.png" alt-text="Screenshot of the original identity field icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-14b.png" alt-text="Screenshot of the new identity field icon in Power BI Desktop.":::          |Identity field: Fields with this icon are unique fields, set to show all values, even if they have duplicates. For example, your data might have records for two different people named 'Robin Smith', and each is treated as unique. They aren't summed.         |
|:::image type="content" source="media/desktop-field-list/field-list-15a.png" alt-text="Screenshot of the original parameter icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-15b.png" alt-text="Screenshot of the new parameter icon in Power BI Desktop.":::          |Parameter: Set parameters to make parts of your reports and data models (such as a query filter, a data source reference, a measure definition, etc.) depend on one or more parameter values. For more information, see [Deep Dive into Query Parameters and Power BI Templates](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/).         |
|:::image type="content" source="media/desktop-field-list/field-list-16a.png" alt-text="Screenshot of the original calendar date field icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-16b.png" alt-text="Screenshot of the new calendar date field icon in Power BI Desktop.":::         |Calendar date field with a built-in date table.         |
|:::image type="content" source="media/desktop-field-list/field-list-17a.png" alt-text="Screenshot of the original calculated table icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-17b.png" alt-text="Screenshot of the new calculated table icon in Power BI Desktop.":::          |Calculated table: A table created with a Data Analysis Expressions (DAX) formula based on data already loaded into the model. Calculated tables are best used for intermediate calculations and you want to store as part of the model.         |
|:::image type="content" source="media/desktop-field-list/field-list-18a.png" alt-text="Screenshot of the original warning icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-18b.png" alt-text="Screenshot of the new warning icon in Power BI Desktop.":::         |Warning: A calculated field with an error. For example, the syntax of the DAX expression might be incorrect.         |
|:::image type="content" source="media/desktop-field-list/field-list-19a.png" alt-text="Screenshot of the original group icon in Power BI Desktop.":::     |:::image type="content" source="media/desktop-field-list/field-list-19b.png" alt-text="Screenshot of the new group icon in Power BI Desktop.":::         |Group: Values in this column are based on grouping values from another column, by using the groups and bins feature. For more information, see [Use grouping and binning in Power BI Desktop](../create-reports/desktop-grouping-and-binning.md).         |
| no original icon    |:::image type="content" source="media/desktop-field-list/field-list-20b.png" alt-text="Screenshot of the new change detection measure icon in Power BI Desktop.":::          |Change detection measure: When you configure a page for automatic page refresh, you can configure a [change detection measure](../create-reports/desktop-grouping-and-binning.md) that is queried to determine if the rest of a page’s visuals should be updated.         |

## Next steps

You might also be interested in the following articles:

* [Create calculated columns in Power BI Desktop](desktop-calculated-columns.md)
* [Use grouping and binning in Power BI Desktop](../create-reports/desktop-grouping-and-binning.md)
* [Use gridlines and snap-to-grid in Power BI Desktop reports](../create-reports/desktop-gridlines-snap-to-grid.md)
