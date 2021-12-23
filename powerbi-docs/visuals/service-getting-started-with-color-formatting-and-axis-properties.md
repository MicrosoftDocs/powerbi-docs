---
title: Getting started with formatting report visualizations
description: Getting started using the formatting options with report visualizations
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.custom: pbibetadocbug, intro-get-started
ms.date: 10/15/2021
LocalizationGroup: Visualizations
---
# Getting started with the formatting pane

[!INCLUDE[consumer-appliesto-nyyn](../includes/consumer-appliesto-nyyn.md)]    

If you have edit permissions for a report, there are numerous formatting options available. In Power BI reports, you can change the color of data series, data points, and even the background of visualizations. You can change how the x-axis and y-axis are presented. You can even format the font properties of visualizations, shapes, and titles. Power BI provides you with full control over how your reports appear.

To get started, open a report in Power BI Desktop or the Power BI service. Both provide almost identical formatting options. When you open a report in the Power BI service, be sure to select **Edit** from the menu bar. 

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-edit.png" alt-text="Menu bar showing Edit option.":::

When you’re editing a report and you have a visualization selected, the **Visualizations** pane appears. Use this pane to change visualizations. Directly below the **Visualizations** pane are three icons: the **Fields** icon (a stack of bars), the **Format** icon (a paint roller), and the **Analytics** icon (a magnifying glass). In the image below, the **Fields** icon is selected, indicated by a yellow bar below the icon.

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-format.png" alt-text="Visualization pane with Fields icon selected.":::

When you select **Format**, the area below the icon displays the customizations available for the currently selected visualization.  

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-format-selected.png" alt-text="Visualization pane with the Format icon selected.":::

You can customize many elements of each visualization. The options available depend on the visual selected. Some of those options are:

* Legend
* X-axis
* Y-axis
* Data colors
* Data labels
* Total labels
* Shapes
* Plot area
* Title
* Background
* Lock aspect
* Border
* Shadow
* Tooltip
* Visual header
* Shapes
* Position
* Zoom

and more.

> [!NOTE]
>  
> You won’t see all these elements with each visualization type. The visualization you select will affect which customizations are available; for example, you won’t see an X-Axis if you have a pie chart selected because pie charts don’t have an X-axis.

Also note that if you don’t have any visualization selected, **Filters** appears in place of the icons, which lets you apply filters  to all visualizations on the page.

The best way to learn how to use the Formatting options is to try them out. You can always undo your changes or revert to default. There are an incredible amount of options available, and new ones being added all the time. It's just not possible to describe all formatting options in one article. But to get you started, let's review a few together. 

1. Change colors used in the visual
1. Apply a style
1. Change axis properties
1. Add data labels
1. Add total labels

## Working with colors

Let’s walk through the steps necessary to customize colors on a visualization.

1. Select a visualization to make it active.

1. Select the paint roller icon to open the Formatting tab. The Formatting tab displays all the formatting elements available for the selected visual.

    :::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-formatting.png" alt-text="Chart with Formatting pane tab selected.":::

1. Select **Data Colors** to expand its available customizations.  

    :::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-data-colors.png" alt-text="Chart with Formatting pane open and Data colors expanded.":::

1. Change **Show all** to On, and select different colors for columns, rows, lines -- depending on the visual type.

    :::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-change-colors.png" alt-text="Chart with new colors applied to some columns.":::

Here are a few useful tips for working with colors. The numbers in the following list are also shown on the following image, indicating where these useful elements can be accessed or changed.

1. Don’t like the color? No problem, just select the down-arrow to open the color palette and select a new one.

1. Don't like any of the color changes? Select **Revert to default** from the bottom of the **Data color** section, and your colors revert to the default settings.

1. Want a color you don’t see in the palette? Just select **More colors...**, and choose from the spectrum.  

   :::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-color-extras.png" alt-text="Data color section with color palette open.":::

Not crazy about the change you just made? Use **CTRL+Z** to undo , just like you’re used to doing.

## Applying a style to a table

Some Power BI visualizations have a **Style** option. With one click, a full set of formatting options are applied to your visualization, all at once. 

1. Select a table or matrix to make it active.   
1. Open the Formatting tab and select **Style**.

   :::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-style.png" alt-text="Select Style from Formatting tab.":::

1. Select a style from the dropdown.

   :::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-style-flashy.png" alt-text="Same table with Bold header flashy rows applied.":::

Even after you apply a Style, you can continue formatting properties, including color, for that visualization.

## Changing axis properties

It’s often useful to modify the X-axis or the Y-axis. Similar to working with colors, you can modify an axis by selecting the down-arrow icon to the left of the axis you want to change, as shown in the following image.

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-y-axis.png" alt-text="Format pane with arrow to Y axis card.":::

In the example below, we've formatted the Y axis by:

* moving the labels to the right side of the visualization

* changing the starting value to zero.

* changing the label font color to black

* increasing label font size to 12

* adding a Y-axis title

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-axis-changes.png" alt-text="Same column chart but with lots of formatting of Y-axis.":::

You can remove the axis labels entirely, by toggling the radio button beside **X-Axis** or **Y-Axis**. You can also choose whether to turn axis titles on or off by selecting the radio button next to **Title**.  

## Adding data labels

Let's add data labels to an area chart.

Here is the *before* picture.

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-area-chart.png" alt-text="Area chart unformatted.":::

And, here is the *after* picture.

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-data-labels.png" alt-text="Area chart formatted.":::

We selected the visualization to make it active and opened the Formatting tab.  We selected **Data labels** and turned them On. Then we increased font to 12, changed font family to Arial Black, turned **Show background** to On and **Background color** to white with a **Transparency** of 5%.

Depending on the visual and its size, data labels may not display.  If your data labels don't display, try making the visual larger or viewing it in full screen mode. 

These are just a few of the formatting tasks that are possible. Open a report in Editing mode and have fun exploring the Formatting pane to create beautiful and informative visualizations.

## Adding total labels

One last formatting example before you start exploring on your own.  Let's add total labels to a stacked column chart. Total labels are available for stacked charts, combo charts, and area charts.

When you turn on total labels, Power BI displays the aggregate, or total, of the data. Let's look at an example. 

Here, we have a stacked column chart with data labels showing the value of each portion of each full stack.  This is the default view.

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-column-charts.png" alt-text="Column chart with data labels.":::

By opening the visual in Editing view, you can change the display for data labels and total labels. Select the visual to make it active and open the Formatting pane. Scroll down to **Data labels** and **Total labels**. **Data labels** is On and **Total labels** is Off. 

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-total-label.png" alt-text="Column chart unformatted.":::

Turn **Data labels** Off, and turn **Total labels** On. Power BI now displays the aggregate for each column.

:::image type="content" source="media/service-getting-started-with-color-formatting-and-axis-properties/power-bi-totals.png" alt-text="Column chart formatted.":::

These are just a few of the formatting tasks that are possible. Open a report in Editing mode and have fun exploring the Formatting pane to create beautiful and informative visualizations.

## Next steps

For more information, see the following article:

* [Sharing reports](../collaborate-share/service-share-reports.md)

* [Tips and tricks for color formatting in Power BI](service-tips-and-tricks-for-color-formatting.md)  
* [Conditional formatting in tables](../create-reports/desktop-conditional-table-formatting.md)