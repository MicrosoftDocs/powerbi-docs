---
title: "Localize date parameters in the Power BI service and Power BI Report Builder"
description: You can localize date parameters in paginated reports in Power BI Report Builder and the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: 'bradsy'
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 07/21/2023
---

# Localize date parameters in the Power BI service and Power BI Report Builder

[!INCLUDE [applies-yes-paginated-yes-service-no-desktop](../includes/applies-yes-paginated-yes-service-no-desktop.md)]

There are differences between the way date type parameters behave for reports in Power BI Report Builder and published reports in the Power BI service. In this article, you learn how to localize the displayed value of date parameters in the multi-value dropdown control to the languages of your choice.

In Power BI Report Builder, date parameters are seen in the format of the clients' operating system. For instance, if your operating system is set to a German locale, the format of the parameter is dd/mm/yyyy. But when you publish the report to the Power BI service, the drop-down values for the multi-value parameter are in US format, mm/dd/yyyy. This change is because the host server that generates the parameter value is always in US format, for consistent report processing across regions of the world.

When you have available values, the multi value checkbox control will display.

:::image type="content" source="media/paginated-localize-date-parameters/multi-value-select-all.png" alt-text="Screenshot showing multi-select dropdown calendar.":::

There are three variants of how date parameters are displayed in a paginated report. The first variant is the control mentioned previously, when the parameter has available values set. The second variant is for when you don't have available values, may have some default values, and allow multiple values. The parameters are displayed in a multiline editable text box.

:::image type="content" source="media/paginated-localize-date-parameters/multi-value-default-values.png" alt-text="Screenshot showing multi-value default values.":::

The third variant is when you have a single value parameter. The date value is displayed in a date picker control. The date picker control is a localized control. We've added logic to display the parameter value in the browser's client locale.

:::image type="content" source="media/paginated-localize-date-parameters/date-picker-control.png" alt-text="Screenshot showing calendar control.":::

The first control mentioned, multi-value select all control is the target of this article. When the date parameter is bound to a multi-value dataset, there's no way for you as the report author to write an expression to modify the parameter label. Only a dataset value is used. But that doesn't mean the parameter label and the parameter values need to be the same value. The label can be any string you'd like. One example is "EndOfMonth". But the most common case is the date value that's going to be processed to run the report.

Here's an example of the parameter label with a dataset field different from the parameter value.

:::image type="content" source="media/paginated-localize-date-parameters/parameter-properties-available-values-pane.png" alt-text="Screenshot showing dataset parameter properties dialog." lightbox="media/paginated-localize-date-parameters/parameter-properties-available-values-pane.png":::

Often, you have no control over the data and must get creative with the report data to make it useful to all consumers. You can change or add data when the report is executed. Most data sources allow adding new fields to the dataset when executing a query. This article uses an example with DAX to add a new column to a Power BI semantic model so that we can properly localize the label of a multi-value date parameter. 

## Localize the displayed value of date parameters

You already have your report with data, but the Power BI service isn't showing the date parameter in the locale format of the user viewing the report. To show the date in the correct format, adjust the report and dataset to include a client-localized parameter date value.

1. [Add a new internal report parameter](#add-a-new-internal-report-parameter) to pass to the dataset query parameters. 
1. [Add a new query parameter](#add-a-new-query-parameter) to use in the dataset query. 
1. [Use the dataset parameter](#use-the-dataset-parameter-in-the-query) in the query to create a new localized date field. 
1. [Update the date parameter label field](#update-the-date-parameter-label-field). 
1. [Move the internal report parameter](#move-the-internal-parameter-ahead-of-the-date-parameter) before the date parameter. 
1. [Publish the updated report](#publish-the-updated-report). 

## Add a new internal report parameter 

In Report Builder, create an internal text report parameter. In this case, the parameter is called "InternalUserDateFormat".  

:::image type="content" source="media/paginated-localize-date-parameters/parameter-internal-properties.png" alt-text="Screenshot showing internal report parameter dialog box." lightbox="media/paginated-localize-date-parameters/parameter-internal-properties.png":::

Then add an expression to the default value to determine the format of the date based on the `Users!Language`.

:::image type="content" source="media/paginated-localize-date-parameters/parameter-internal-expression.png" alt-text="Screenshot showing Expression code set for default values." lightbox="media/paginated-localize-date-parameters/parameter-internal-expression.png":::

### Expression code set on default values

```dax
=SWITCH 
( 
User!Language = "en-US", "mm/dd/yyyy", 
User!Language = "en-NZ", "dd/mm/yyyy", 
User!Language = "de", "yyy-mm-dd", 
User!Language = "fi", "dd.mm.yyyy", 
User!Language = "jp", "yyyy.dd.mm", 
1=1, "mm/dd/yyyy" 
) 
```

## Add a new query parameter

Datasets don't inherently know how to use report level parameters. On the dataset used in the report for the date parameter, add a dataset parameter bound to the new "InternalUserDateFormat" report parameter.

:::image type="content" source="media/paginated-localize-date-parameters/dataset-parameter-properties.png" alt-text="Screenshot showing Dataset properties dialog box."  lightbox="media/paginated-localize-date-parameters/dataset-parameter-properties.png":::

## Use the dataset parameter in the query 

Then use the dataset parameter to drive the format of a new date column to be used as the label. The following example is from a Power BI semantic model with three date values. Use the ADDCOLUMNS function from DAX to add a new field that's localized based on the information provided from the client's value for the new report parameter. The example query output is for the Finnish locale "fi-FI". Save your dataset. 

:::image type="content" source="media/paginated-localize-date-parameters/query-designer-dialog.png" alt-text="Screenshot showing Query Designer dialog." lightbox="media/paginated-localize-date-parameters/query-designer-dialog.png":::

### DAX query snippet

```dax
DEFINE 

TABLE FormattedTable = ADDCOLUMNS('Table2', "FormattedDate", FORMAT([Date], @DateFormat)) 

EVALUATE SUMMARIZECOLUMNS('FormattedTable'[Date], 'FormattedTable'[FormattedDate])  
```

> [!NOTE]
> In the query designer, make sure to set a value for the parameter, or the query won't run successfully. It's the first @ icon in the toolbar.
>
> :::image type="content" source="media/paginated-localize-date-parameters/query-designer-parameters.png" alt-text="Screenshot showing Query Designer parameters." lightbox="media/paginated-localize-date-parameters/query-designer-parameters.png":::

## Update the date parameter label field 

Edit your report parameter. Change the label to use the new "FormattedDate" field the dataset is now generating.

:::image type="content" source="media/paginated-localize-date-parameters/parameter-properties-change-label.png" alt-text="Screenshot showing Parameter properties change the label." lightbox="media/paginated-localize-date-parameters/parameter-properties-change-label.png":::

## Move the internal parameter ahead of the date parameter 

The internal parameter must be ahead of the date parameter. If it isn't, you hit a forward dependency error and the report doesn't render.

:::image type="content" source="media/paginated-localize-date-parameters/report-data-move-parameter.png" alt-text="Screenshot showing in the Report Data pane, move the parameter.":::

## Publish the updated report 

After you publish the report to the Power BI service, the date parameter that your report user sees is now in the user's client format. In this example, the body has the language expression set to `User!Language` with a client locale set to "en-NZ":

:::image type="content" source="media/paginated-localize-date-parameters/published-report.png" alt-text="Screenshot showing drop-down menu in the published report." lightbox="media/paginated-localize-date-parameters/published-report.png":::

> [!TIP]
> To test different locales easily in the Power BI service, add `&language="xx-XX"` to the URL. The Power BI service takes almost any two-part locale. This example uses New Zealand, "en-NZ". 

## Next steps

- [View a paginated report in the Power BI service](../consumer/paginated-reports-view-power-bi-service.md)
- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
