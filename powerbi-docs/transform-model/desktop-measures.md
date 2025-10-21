---
title: Measures in Power BI Desktop
description: Learn how you can create and use measures, including quick measures and DAX syntax in Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: concept-article
ms.date: 09/18/2024
ms.custom: FY25Q1-Linter
LocalizationGroup: Model your data
#customer intent: As a Power BI user I want to learn how to create and use measures.
---
# Create measures for data analysis in Power BI Desktop

Power BI Desktop helps you create insights into your data with just a few actions. But sometimes that data doesn't include everything you need to answer some of your most important questions. Measures can help you get there.

Measures are used in some of the most common data analyses. You can set basic summarizations such as sums, averages, minimums, maximums, and counts through the **Data** pane. The calculated results of measures change as you interact with your reports, making it possible to do fast and dynamic ad-hoc data exploration.

This article introduces you to measures and shows you how to use and organize them. For more information, see [Create measures](/training/modules/model-data-power-bi/4b-create-calculated-measures).

## Understand measures

In Power BI Desktop, you create and display measures in *Report View*, *Table View*, or *Model View*. Measures you create yourself appear in the **Data** list with a calculator icon. You can name measures whatever you want, and add them to a new or existing visualization just like any other field.

:::image type="content" source="media/desktop-measures/data-pane-measures.png" alt-text="Screenshot of the Data pane in Power BI Desktop. Among the list of data fields are three measures that are related to sales, which are highlighted.":::

## Report-level measures

Report-level measures, or report measures, are custom calculations or metrics that you create directly within a report, based on an existing dataset or a live connection. These measures provide a way for users to add specific business logic, create visual calculations, or perform calculations that are relevant to the report's context without altering the original dataset. You use Data Analysis Expressions (DAX) to write report-level measures. You can use these measures in visualizations within a report to provide extra insights and tailor the data presentation to meet specific analytical needs. These measures enhance flexibility, helping users to derive new insights from existing data models dynamically.

> [!NOTE]
> You might also be interested in *quick measures*, which are ready-made measures you can select from dialogs. They're a good way to quickly create measures, and also a good way to learn DAX syntax, because their automatically created DAX formulas are available to review. For more information, see [quick measures](desktop-quick-measures.md).
>
>

## Data Analysis Expressions

Measures calculate a result from an expression formula. When you create your own measures, you use the [DAX](/dax/) (DAX) formula language. DAX includes a library of over 200 functions, operators, and constructs. Its library provides immense flexibility in creating measures to calculate results for just about any data analysis need.

DAX formulas are a lot like Excel formulas. DAX even has many of the same functions as Excel, such as `DATE`, `SUM`, and `LEFT`. But the DAX functions are meant to work with relational data like you find in Power BI Desktop.

## Sales projection example

Janice is a sales manager at Contoso. Janice has been asked to provide reseller sales projections over the next fiscal year. Janice decides to base the estimates on last year's sales amounts, with a six percent annual increase resulting from various promotions that are scheduled over the next six months.

To report the estimates, Janice imports last year's sales data into Power BI Desktop. Janice finds the **SalesAmount** field in the **Reseller Sales** table. Because the imported data only contains sales amounts for last year, Janice renames the **SalesAmount** field to *Last Years Sales*. Janice then drags **Last Years Sales** onto the report canvas. It appears in a chart visualization as a single value that's the sum of all reseller sales from last year.

Janice notices that even without specifying a calculation, one is provided automatically. Power BI Desktop creates its own measure by summing up all of the values in **Last Years Sales**.

But Janice needs a measure to calculate sales projections for the coming year. The measure should be last year's sales multiplied by 1.06 to account for the expected 6% increase in business. For this calculation, Janice creates a measure by using the *New Measure* feature and then entering the following DAX formula:

```dax
    Projected Sales = SUM('Reseller Sales'[Last Years Sales])*1.06
```

Janice then drags the new Projected Sales measure into the chart.

:::image type="content" source="media/desktop-measures/last-year-sales-projected-sales-chart.png" alt-text="Screenshot of a Power BI Desktop clustered column chart, with columns for sales and projected sales. In the Data pane, those measures are highlighted.":::

Quickly and with minimal effort, Janice now has a measure to calculate projected sales. Janice can further analyze the projections by filtering on specific resellers or by adding other fields to the report.

## Data categories for measures

You can also select data categories for measures.

Among other things, data categories provide a way for you to use measures to dynamically create URLs, and to mark each data category as a Web URL.

You can create tables that display the measures as Web URLs. Then you can select the URL that's created based on your selection. This approach is especially useful when you want to link to other Power BI reports with [URL filter parameters](../collaborate-share/service-url-filters.md).

## Organize your measures

Measures have a *home table* that defines where they're found in the data list. You can change their location by choosing a location from the tables in your model.

:::image type="content" source="media/desktop-measures/net-sales-home-table.png" alt-text="Screenshot of Power BI Desktop that shows the formula and settings for the Net Sales measure. The expanded Home table list contains three tables.":::

You can also organize fields in a table into *display folders*:

1. On the left edge of Power BI Desktop, select **Model view**.
1. On the **Data** pane, select the field you want to move from the list of available fields.
1. On the **Properties** pane, under **Display folder**, enter a name for a new folder.

The new folder is created, and the selected field is moved into that folder.

:::image type="content" source="media/desktop-measures/measures-04.gif" alt-text="Animation that shows a name being entered into the Display folder field, a folder being created, and a selected field being added to the new folder.":::

You can create subfolders by using a backslash character. For example, if you enter **Finance\Currencies**, Power BI creates a *Finance* folder and within it, a *Currencies* folder.

You can make a field appear in multiple folders by using a semicolon to separate the folder names. For example, if you enter **Products\Names;Departments**, the field appears in a *Departments* folder and a *Names* folder inside a *Products* folder.

You can create a special table that contains only measures. That table always appears at the top of the **Data** pane. To do so, take the following steps:

1. Use **Enter data** to create a table with just one column.
1. Move your measures to that table.
1. Hide the column of that table, but not the table itself.
1. Select the arrow at the top of the **Data** pane to close and reopen the field list and see your changes.

:::image type="content" source="media/desktop-measures/measures-table.png" alt-text="Screenshot of the Data pane in Power BI Desktop. The field at the top of the list is a table that contains three measures and no columns.":::

> [!TIP]
> Hidden measures are displayed and accessible in Power BI Desktop. However, you don't see hidden measures in Excel or the Power BI service, because Excel and the Power BI service are considered client tools.

## Dynamic format strings

When you use *dynamic format strings*, you can customize how measures appear in visuals by conditionally applying a format string with a separate DAX expression. For more information, see [Dynamic format strings](../create-reports/desktop-dynamic-format-strings.md).

## Related content

This article provides you with a quick introduction to measures. Many other resources are available to show you how to create your own measures. For more information, see [Tutorial: Create your own measures in Power BI Desktop](desktop-tutorial-create-measures.md). When you follow that tutorial, you can download a sample file and get step-by-step instructions on how to create more measures.

DAX has been around for several years in Power Pivot in Excel and SQL Server Analysis Services. For more information about DAX, see the following resources:

- For description, see [Learn DAX basics in Power BI Desktop](desktop-quickstart-learn-dax-basics.md).
- For detailed articles on each of the DAX functions, syntax, operators, and naming conventions, see [Data Analysis Expressions Reference](/dax/).
- For a site where influential members of the business intelligence (BI) community share their knowledge of DAX, see [DAX Resource Center Wiki](https://social.technet.microsoft.com/wiki/contents/articles/1088.dax-resource-center.aspx).
