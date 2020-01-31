---
title: Sort by column in Power BI Desktop
description: In Power BI, you can change how a visual looks by sorting it by different data fields.
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 01/30/2020
ms.author: davidi

LocalizationGroup: Create reports
---
# Sort by column in Power BI Desktop
In Power BI Desktop and the Power BI service, you can change how a visual looks by sorting it by different data fields. By changing how you sort a visual, you can highlight the information you want to convey, and ensure the visual reflects that trend (or emphasis).

Whether you're using numeric data (such as sales figures) or text data (such as state names), you can sort your visualizations, and make them look like you want them to. Power BI provides much flexibility for sorting, and quick menus for you to use. On any visual, select the **More options** (...) menu, select **Sort by**, and then select the field by which you want to sort.

![More options menu](media/desktop-sort-by-column/sortbycolumn_2.png)

## Sorting example
Let's take an example that has more depth, and see how it works in Power BI Desktop.

The following visualization shows costs, quantities, and amounts by manufacturer name. Here's the visualization as it looks before we do any further sorting.

![Initial visualization](media/desktop-sort-by-column/sortbycolumn_1.png)

The visual is currently sorted by the **SalesQuantity** column. We can determine the sort column by matching the color of the ascending bars to the legend, but there's a better way: the **More options** menu, which you access by selecting the ellipses (...).

![More options menu](media/desktop-sort-by-column/sortbycolumn_2.png)

* The current sorting field is **SalesQuantity**, indicated by **SalesQuantity** in bold preceded by a yellow bar. 

* The current sorting direction is ascending, as shown by **Sort ascending** in bold preceded by a yellow bar.

We'll look at the sorting field and direction independently in the next two sections.

## Select which column to use for sorting
You noticed the yellow bar preceding **SalesQuantity** in the **More options** menu, which indicates that the visual is sorted by the **SalesQuantity** column. Sorting by another column is easy; select the ellipses (...) to show the **More options** menu, then select another column.

In the following image, we selected **DiscountAmount** as the column by which we want to sort. That column appears as one of the lines on the visual, rather than one of the bars. Here's what it looks like after we select **DiscountAmount**.

![Sort by DiscountAmount](media/desktop-sort-by-column/sortbycolumn_3.png)

Notice how the visual has changed. The values now are ordered from the highest **DiscountAmount** value, in this visual Fabrikam Inc., down to Northwind Traders, which has the lowest value. 

But what if we want to sort ascending, instead of descending? The next section shows just how easy that is.

## Select the sort order
When we take a closer look at the **More options** menu from the previous image, we see that **Sort descending** is in bold preceded by a yellow bar.

![Sort by largest to smallest](media/desktop-sort-by-column/sortbycolumn_4.png)

When **Sort descending** is displayed, it means the visual is being sorted by the selected column in order of greatest value to smallest value. Want to change that? No problem, just select **Sort ascending** and the sort order of the selected column changes from smallest to greatest value.

Here's our same visual, after changing the ordering of **DiscountAmount**. Notice that Northwind Traders is now the first manufacturer listed, and Fabrikam Inc. is the last; the opposite sorting from before.

![Sort by smallest to largest](media/desktop-sort-by-column/sortbycolumn_5.png)

You can sort by any column included in the visual; we could easily select **SalesQuantity** as the column by which we want to sort, to show the manufacturers with the most sales first, and still retain the other columns in the visual as they apply to that manufacturer. Here's a look at the visual with those settings:

![Sort by SalesQuantity](media/desktop-sort-by-column/sortbycolumn_6.png)

## Sort using the Sort by Column button
There's another way to sort your data, and that's by using the **Sort by Column** button in the **Modeling** ribbon.

![Sort by Column button](media/desktop-sort-by-column/sortbycolumn_8.png)

This approach to sorting requires that you select a column from the **Fields** pane, and then select **Modeling** > **Sort by Column** to choose which column you want to use to sort your visual. You select the column (field) you want to sort from the **Fields** pane to enable the **Sort by Column** button. Otherwise, the button is inactive.

Let's look at a common example: you have data from each month of the year, and you want to sort it based on chronological order. The following steps show you how.

1. First, notice that when the visual is selected but no column is selected in the **Fields** pane, the **Sort by Column** button is inactive (grayed out).
   
   ![Inactive Sort by Column button](media/desktop-sort-by-column/sortbycolumn_9.png)

2. When we select the column by which we want to sort, in the **Fields** pane, the **Sort by Column** button becomes active.
   
   ![Active Sort by Column button](media/desktop-sort-by-column/sortbycolumn_10.png)
3. Now, with the visual selected, we can select **MonthOfYear**, instead of the default **MonthName**, and the visual sorts in the order we want: by the month of the year.
   
   ![Sort by Column menu](media/desktop-sort-by-column/sortbycolumn_11.png)

And that's it. Remember that you must select a column in the **Fields** pane for the **Sort by Column** button to become active.

<!---
This functionality is no longer active. Jan 2020

## Getting back to default column for sorting
You can sort by any column you'd like, but there may be times when you want the visual to return to its default sorting column. No problem. For a visual that has a sort column selected, open the **More options** menu and select that column again, and the visualization returns to its default sort column.

For example, here's our previous chart:

![Initial visualization](media/desktop-sort-by-column/sortbycolumn_6.png)

When we go back to the menu and select **SalesQuantity** again, the visual defaults to being ordered alphabetically by **Manufacturer**, as shown in the following image.

![Default sort order](media/desktop-sort-by-column/sortbycolumn_7.png)

With so many options for sorting your visuals, creating just the chart or image you want is easy.
--->

## Next steps

You might also be interested in the following articles:

* [Use cross-report drillthrough in Power BI Desktop](desktop-cross-report-drill-through.md)
* [Using slicers Power BI Desktop](visuals/power-bi-visualization-slicers.md)

