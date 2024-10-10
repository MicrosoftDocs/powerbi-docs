---
title: Work with value filter behavior in Power BI
description: Learn how to use value filter behavior in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 10/10/2024
LocalizationGroup: Model your data
---
# Work with value filter behavior (preview)

The value filter behavior options in Power BI allow you to influence the automatic filtering mechanism present in DAX that occurs when multiple columns from the same table are filtered. This behavior is informally called 'auto-exist'.

## What is value filter behavior
When multiple columns from the same table are filtered, DAX understands that likely not all combinations of values across these columns are valid and as a result it automatically excludes invalid combinations. The DAX Engine generated a coalesced value filter that not only returns valid combinations but also affects measured calculations. The **value filter behavior** setting enables to you change this behavior in your semantic model. You can decide whether you want to turn off coalesced values filters and turn on independent value filters instead. Turning on independent value filters by setting the **value filter behavior** setting to Independent (see later in this article) results in multiple filters on the same table being kept separate instead of the DAX engine combining these filters into one.

## Understanding value filter behavior
When you're filtering multiple columns on the same table, the current default value filter behavior takes these filters and combines them into one, considering only the combinations that exist. Consider the following two columns on the same table:

-	Year, which contains values like ‘2023’.
-	Month, which contains values like ‘January 2024’.

If you filter on both Year and Month, since these columns are on the same table, the value filter behavior combines the filters into one, but only the combinations that exist are considered. The combination of the month January 2024 with year 2023 doesn't exist and wouldn't be included in the filter. There are, however, situations in which the results are surprising.

Let’s look at an example, where we have a catalog showing availability of colors for products by year. The manufacturer of these products experimented with making products in various colors throughout the years:

:::image type="content" source="media/value-filter-behavior/value-filter-behavior-example-01.png" alt-text="Screenshot of table showing product colors across 2022 to 2024.":::

We have three products that were available in various colors over the years. Notice how there are no red products offered in 2024. This is going to be important a little later.
Now, let’s count the number of products by adding the following measure:

```dax
Number of Products = COUNTROWS( 'Catalog' )`
```

The following matrix shows the number of products that are available in various colors per year:
:::image type="content" source="media/value-filter-behavior/value-filter-behavior-example-02.png" alt-text="Screenshot of a matrix showing number of products by year and color.":::
  
Now, let’s add another measure to calculate the total number of products for all years:
```dax
Number of Products All Years = CALCULATE ( [Number of Products], ALL ( 'Catalog'[Year] ) )
```

Let’s put these measures side-by-side and filter to year 2023 and just the blue and red colors (so no black). You can see the number of products is 4 and the number of products across all years for these two colors is 6:

:::image type="content" source="media/value-filter-behavior/value-filter-behavior-example-03.png" alt-text="Screenshot of a table showing year, product, and color. There are two slicers, one set to Year equals 2023 and one set to Color equals Blue and Red. The Number of Products measure returns 4 and the Number of Products All Years measure returns 6.":::

If we switch the Year to 2024, we expect the ‘Number of Products’ measure to return 2, as there are just two products that are blue in 2024 and there are no red products in that year. 
On top of that, we would expect that the number of products for all years won't change, because, after all, it's supposed to be calculated across all years. However, the ‘Number of Products for All Years’ changes from 6 to 5:

:::image type="content" source="media/value-filter-behavior/value-filter-behavior-example-04.png" alt-text="Screenshot of a table showing year, product, and color. There are two slicers, one set to Year equals 2024 and one set to Color equals Blue and Red. The Number of Products measure returns 2 and the Number of Products All Years measure returns 5.":::

The number of products across all years should still be 6, not 5. What we are seeing here's the value filter behavior in action: it's combining filters on the same table, removing combinations that didn't exist. The filters are Year = 2024 and Color = Blue or Red. Since these two filters are on the same table, these filters are combined into one filter that only filters for the combinations that exist. Since there are no red products in 2024, the applied filter is Year = 2024 and Color = Blue.
Therefore, the number of products for all years now counts just the number of blue products, not the blue, or red products. This returns 5, as you can confirm in the table.

## Influencing the value filter behavior 
You can control whether you want this behavior in your semantic model, by using the **Value filter behavior** setting on your semantic model in the properties pane in the model view:

:::image type="content" source="media/value-filter-behavior/value-filter-behavior-options.png" alt-text="Screenshot of a matrix showing number of products by year and color.":::

Three options are available:
- **Automatic** - This is the default setting and currently turns on the Coalesced behavior. When we wrap up this preview, new models set to **Automatic** will use Independent, there will be announced at that time.
- **Independent** - This forces filters on the same table to be kept separate. After setting the ‘Value filter behavior’ setting to **Independent**, the total number of products for all years returns 6 as expected (see below).
- **Coalesced** - This forces the value filter behavior to be enabled for the semantic model and results in combining the filters on the same table into one. The number of products for all years in our example continues to return to 5.

The following table shows the effect of this setting to our example:
| Value filter behavior setting | Filters applied in the example | Result of example measure |
| --- | --- | --- |
|Automatic|Year = 2024,<br/>Color = Blue|5|
|Independent|Year = 2024,<br/>Color = Blue or Red|6|
|Coalesced|Year = 2024,<br/>Color = Blue|5|

Setting the **Value filter behavior** to Automatic, means it's equal to Coalesced for now, but will be switched to Independent for new semantic models in the future.
If you set the **Value filter behavior** to Independent, the number of products for all returns 6, as expected, since the filters are Year = 2024 and Color = Blue or Red and are no longer combined:

:::image type="content" source="media/value-filter-behavior/value-filter-behavior-example-05.png" alt-text="Screenshot of a table showing year, product, and color. There are two slicers, one set to Year equals 2024 and one set to Color equals Blue and Red. The Number of Products measure returns 2 and the Number of Products All Years measure returns 6.":::
 
## Next steps

The following articles may be useful: 

* [Work with the modeling view](desktop-modeling-view.md)
* [Work with the model explorer](model-explorer.md)
