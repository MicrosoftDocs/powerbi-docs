---
title: Create a numeric or date range slicer in Power BI
description: Learn how to use a slicer for constraining to numeric or date ranges in Power BI Desktop and the Power BI service.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/13/2023
LocalizationGroup: Create reports
---
# Create a numeric or date range slicer in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

With the numeric range slicer and the date range slicer, you can create filters for any numeric or date column in your data model. There are three options for filtering your data:

- Between numbers or dates.
- Less than or equal to a number or date.
- Greater than or equal to a number or date.

This simple technique is a powerful, visual way to filter your data.

:::image type="content" source="media/desktop-slicer-numeric-range/desktop-slicer-numeric-range.png" alt-text="Screenshot of a visual, highlighting a numeric range slicer.":::

## Add a numeric range slicer

You can use a numeric range slicer like you would use any other slicer. Create a **Slicer** visual for your report, and then select a numeric value for the **Field** value.

Power BI automatically creates a numeric range slicer. By default, it's set to **Between**.

:::image type="content" source="media/desktop-slicer-numeric-range/desktop-slicer-numeric-range-between.png" alt-text="Screenshot of the Numeric range slicer menu.":::

## Add a date range slicer

Create a **Slicer** visual for your report, and then select a date field for the **Field** value.

Power BI automatically creates a date range slicer. By default, it's set to **Between**.

:::image type="content" source="media/desktop-slicer-numeric-range/slicer-date-range-between.png" alt-text="Screenshot of the Date range slicer and the Format pane.":::

Besides the basic date range slicer, there are two other options, explained in these articles:

- The [relative date range slicer](../visuals/desktop-slicer-filter-date-range.md).
- The [relative time range slicer](slicer-filter-relative-time.md).

## Format the range slicer

In the **Format** pane, under **Visual** > **Slicer settings** > **Options**, select one of these options:

* **Between**
* **Less than or equal to**
* **Greater than or equal to**

You can use the slider to select numeric values that fall between the numbers. Sometimes the granularity of moving the slicer bar makes landing exactly on that number difficult. You can use the slider, or select either box to type in the values you want. This option is convenient when you want to slice on specific numbers.

In the following image, the report page filters for **Sales Amount** values that range between 2,100.00 and 25,000.00.

:::image type="content" source="media/desktop-slicer-numeric-range/desktop-slicer-numeric-range-between-specific-numbers.png" alt-text="Screenshot of a visual, highlighting the Numeric range slicer set to Between.":::

When you select **Less than or equal to**, the left (lower value) handle of the slider bar disappears, and you can adjust only the upper-bound limit of the slider bar. In the following image, the lower limit is gone.

:::image type="content" source="media/desktop-slicer-numeric-range/desktop-slicer-numeric-range-less-than.png" alt-text="Screenshot of a visual, highlighting the Numeric range slicer set to Less than or equal to.":::

If you select **Greater than or equal to**, then the right (higher value) slider bar handle disappears. You can then adjust the lower value, but not the upper value.

## Snap to whole numbers with the numeric range slicer

A numeric range slicer snaps to whole numbers if the data type of the underlying field is *Whole Number*. This feature lets your slicer cleanly align to whole numbers. *Decimal Number* fields let you enter or select fractions of a number. The formatting set in the text box matches the formatting set on the field even though you can type in or select more precise numbers.

## Display formatting with the date range slicer

When you use a slicer to display or set a range of dates, the dates display in the *Short Date* format. The user's browser or operating system locale determines the date format. As such, it will be the display format no matter what the data type settings are for the underlying data or model.

You could, for example, have a long date format for the underlying data type. In this case, a date format such as *dddd, MMMM d, yyyy* would format a date in other visuals or circumstances as *Wednesday, March 14, 2001*. But in the date range slicer, that date displays in the slicer as *03/14/2001*.

:::image type="content" source="media/desktop-slicer-numeric-range/desktop-slicer-numeric-range-date.png" alt-text="Screenshot showing a slicer with a date range.":::

Displaying the Short Date format in the slicer ensures the length of the string stays consistent and compact within the slicer.

## Considerations and limitations

The following considerations and limitations apply to the numeric range slicer:

* The numeric range slicer filters every underlying row in the data, not any aggregated value. For example, let's say that you use a *Sales Amount* field. The slicer then filters each transaction based on the sales amount, not the sum of the sales amount for each data point of a visual.
* The numeric range slicer doesn't currently work with measures.
* You can type any number into a numeric slicer even if it is outside the range of values in the underlying column. This option lets you set up filters if you know the data may change in future.
* The date range slicer allows for any date values even if they don't exist in the underlying date column.

## Related content

- [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)