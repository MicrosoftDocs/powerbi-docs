---
title: Show Items With No Data in Power BI
description: Find out how to use the Power BI Show items with no data feature to display items with no data in visualizations. Understand how the feature works.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/03/2025
ai-usage: ai-assisted
LocalizationGroup: Data from files
# customer intent: As a Power BI user, I want to find out how the Show items with no data feature works so that I can use it to display items with no data in visualizations.
---
# Show items with no data in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Use the Power BI **Show items with no data** feature to display data rows and columns that don't contain measure data.

When you create a visual, Power BI doesn't display all possible data by default. Instead, Power BI applies a measure to the data and then omits rows and columns that have blank measure values. In certain cases, you might want to display the omitted data. In those scenarios, the **Show items with no data** feature provides a way for you to include that data in your visual.

:::image type="content" source="media/desktop-show-items-no-data/select-show-items.png" alt-text="Screenshot of the Visualizations pane. In the X-axis field well, Year is highlighted. In its shortcut menu, Show items with no data is highlighted." lightbox="media/desktop-show-items-no-data/select-show-items.png":::

## Show items with no data

To turn on the **Show items with no data** feature, follow these steps:

1. Select a visual.
1. Go to the **Visualizations** pane and locate the **X-axis** or **Y-axis** field well.
1. Right-click the field in the well, and then select **Show items with no data**.

:::image type="content" source="media/desktop-show-items-no-data/select-show-items.png" alt-text="Screenshot of the Visualizations pane. In the X-axis field well, Year is highlighted. Show items with no data is highlighted in its shortcut menu." lightbox="media/desktop-show-items-no-data/select-show-items.png":::

The **Show items with no data** feature doesn't have any effect in the following circumstances:

- There's no measure added to the visual, and the grouping columns come from the same table.
- The groups in the visual are unrelated. Power BI doesn't run queries for visuals that have unrelated groups.
- The measure is unrelated to any of the groups. In this case, the measure returns either the same value or blank for all group combinations. It's never blank for only some combinations but not others. Because there's no variance in the measure value, turning on the feature has no effect.
- There's a user-defined measure filter that excludes blank measures, for example, `SalesAmount > 0`.

> [!CAUTION]
> Turning on the option to show items with no data can negatively affect performance and can cause slow rendering of visuals or timeouts of data exports.

### How the feature works

The most interesting uses of **Show items with no data** are when measures are present. Consider the situation when the groups are from the same table or can be related through a path in the model. For example, in the [sample data model at the end of this article](#example-data-model), the **ProductStyle** table is directly related to **Product** and indirectly related to **Sales**. **ProductStyle** and **ProductCategory** can be related through the **Product** table.

The following cases compare Power BI behavior when **Show items with no data** is off and on. These cases also use the sample data model from the end of this article.

#### Group columns from the same table

The following example groups two columns from the same table, **Product[Color]** and **Product[Size]**, and then applies the **Sum(Sales[Quantity])** measure. When the **Show items with no data** feature is off, Power BI displays the following data:

|Product[Color]  |Product[Size] |Sum(Sales[Quantity])  |
|---------|---------|---------|
|Blue     |Medium         |15         |
|Blue     |Small         |10         |

When the **Show items with no data** feature is on, Power BI displays the following data:

|Product[Color]  |Product[Size]  |Sum(Sales[Quantity])  |
|---------|---------|---------|
|Blue     |Large         |         |
|Blue     |Medium         |15         |
|Blue     |Small         |10         |
|Red     |Large         |         |

Two new combinations show up when the feature is turned on: *Blue - Large* and *Red - Large*. Both of those entries have no corresponding **Quantity** value in the **Sales** table. However, they're both present in the **Product** table.

#### Group columns from related tables

The following example groups two columns from related tables, **ProductStyle[Finish]** and **Product[Color]**, and then applies the **Sum(Sales[Quantity])** measure.

When the **Show items with no data** feature is off, Power BI displays the following data:

|ProductStyle[Finish]  |Product[Color]  |Sum(Sales[Quantity])  |
|---------|---------|---------|
|Gloss     |Blue         |10         |
|Matte     |Blue         |15         |

When the **Show items with no data** feature is on, Power BI displays the following data:

|ProductStyle[Finish]  |Product[Color]  |Sum(Sales[Quantity])  |
|---------|---------|---------|
|Gloss     |Blue         |10         |
|Gloss     |Red         |         |
|Matte     |Blue         |15         |
|None     |         |         |

Two new combinations show up when the feature is turned on, *Gloss - Red* and *None - blank*, for a few reasons:

- Power BI first considers **ProductStyle[Finish]** and selects all the values to display, which results in *Gloss*, *Matte*, and *None*.
- Power BI uses each of these values to select all the corresponding **Product[Color]** entries.
- The *None* value doesn't correspond to any **Product[Color]** values, so a blank appears for the **Product[Color]** value.

The mechanism of selecting values for the columns depends on the order of the columns. You can think of this mechanism as a `LEFT OUTER JOIN` operation between tables. If the order of the columns changes, the results also change.

Consider an example to understand how changing the order affects the results. This example is the same as the previous one, but with the ordering changed. This example groups the **Product[Color]** and **ProductStyle[Finish]** columns and then applies the **Sum(Sales[Quantity])** measure.

When the **Show items with no data** feature is on, Power BI displays the following data:

|Product[Color] |ProductStyle[Finish]  |Sum(Sales[Quantity])  |
|---------|---------|---------|
|Blue     |Gloss         |10         |
|Blue     |Matte         |15         |
|Red     |Gloss         |         |

No data appears in the table for a **ProductStyle[Finish]** value of *None*. In this case, Power BI first selects all the **Color** values in the **Product** table. For each color, Power BI then selects the corresponding **Finish** values that contain data. Since *None* doesn't show up in any combination of **Color**, Power BI doesn't select it.

## Power BI visual behavior

When you turn on **Show items with no data** for one field in a visual, the feature is automatically turned on for all other fields that are in that same *visual bucket* or hierarchy. A visual bucket is a field well in the **Visualizations** pane that determines the role of a field or hierarchy in the visual. Possible roles include **X-axis**, **Y-axis**, **Legend**, **Category**, **Rows**, and **Columns**.

:::image type="content" source="media/desktop-show-items-no-data/visual-buckets.png" alt-text="Screenshot of the Visualizations pane with the X-axis, Y-axis, and Legend visual buckets highlighted. Text in each bucket says Add date fields here." lightbox="media/desktop-show-items-no-data/visual-buckets.png":::

For example, consider a matrix visual with three fields in the **Rows** bucket. If **Show items with no data** is turned on for one field, it's turned on for all items in the bucket. In the following image, **Show items with no data** is turned on for the first field in the **Rows** bucket, the **SupplierID** field. The feature is also automatically turned on for the other fields in the **Rows** bucket.

:::image type="content" source="media/desktop-show-items-no-data/select-show-items-matrix.png" alt-text="Screenshot of the Visualizations pane. In the shortcut menu for the SupplierID field in the Rows field well, Show items with no data is highlighted." lightbox="media/desktop-show-items-no-data/select-show-items-matrix.png":::

In contrast, the **Continent** field shown in the **Columns** bucket doesn't have **Show items with no data** automatically turned on.

This visual behavior often occurs when you convert a visual to a different type, such as converting a matrix visual to a table visual. For instance, suppose the **Show items with no data** feature is turned on for a field in a bucket. If the conversion moves other fields to that bucket, the feature is automatically turned on for those fields.

Consider the data from the previous example. A table visual has only one bucket, the **Columns** bucket. When you convert a matrix into a table, all the fields from the **Rows** and **Columns** buckets in the matrix get moved to the **Columns** bucket in the table. In this case, the **SupplierID** field is one of the fields that gets moved to that bucket. If the **Show items with no data** feature is turned on for **SupplierID**, the conversion turns on the feature for all the fields that get moved to the table **Columns** bucket, including the **Continent** field.

### Export data

When you use the **Export summarized data** feature, the behavior of the **Show items with no data** feature is the same as if the export were converted to a table visual. As a result, when you export a visual such as a chart matrix visual, the exported data might differ from the visual that's displayed. The reason is that when you export a visual, it's first converted to a table visual. That process turns on the **Show items with no data** feature for all fields being exported.

## Example data model

This section shows the sample data model that the examples in this article use.

### Model

:::image type="content" source="media/desktop-show-items-no-data/data-model.png" alt-text="Screenshot of the Model view of the data. Five boxes are visible, one for each table. Lines that connect the boxes represent table relationships." lightbox="media/desktop-show-items-no-data/data-model.png":::

### Data

|Product[ProductId]|	Product[ProductName]|	Product[Color]|	Product[Size]|	Product[CategoryId]|	Product[StyleId]|
|---------|---------|---------|---------|---------|---------|
|1	|Prod1	|Blue	|Small	|1	|1 |
|2	|Prod2	|Blue	|Medium	|2	|2 |
|3	|Prod3	|Red	|Large	|1	|1 |
|4	|Prod4	|Blue	|Large	|2	|2 |


|ProductCategory[CategoryId]|	ProductCategory[CategoryName]|
|---------|---------|
|1	|Phone   |
|2	|Camera |
|3	|TV |


|ProductStyle[StyleId]|	ProductStyle[Finish]|	ProductStyle[Polished]|
|---------|---------|---------|
|1	|Gloss	|Yes |
|2	|Matte	|No |
|3	|None	|No |


|Sales[SaleId]|	Sales[ProductId]|	Sales[Date]|	Sales[Quantity]|
|---------|---------|---------|---------|
|1	|1	|1/1/2012 0:00|	10 |
|2	|2	|1/1/2013 0:00|	15 |

## Related content

[Work with multidimensional semantic models in Power BI](../connect-data/desktop-default-member-multidimensional-models.md)
