---
title: Tips and tricks for color formatting in Power BI
description: Tips and tricks for color formatting in Power BI
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 12/19/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Tips and tricks for color formatting in Power BI
Power BI provides many different ways to customize your dashboards and reports. This article details a collection of tips that can make your Power BI visualizations more compelling, interesting, and customized to your needs.

The following tips are provided. Have another great tip? Great! Send it our way and we’ll see about adding it to this list.

* Change the color of a single data point
* Base the colors of a chart on a numeric value
* Base the color of data points on a field value
* Customize colors used in the color scale
* Use diverging color scales
* How to undo in Power BI

To make any changes, you must be editing a report: select your **Report** from the **My Workspace** pane, then select **Edit Report** from the top menu area, as shown in the following image.

![](media/service-tips-and-tricks-for-color-formatting/power-bi-edit.png)

When the **Visualizations** pane appears along the right side of the **Report** canvas, you’re ready to start customizing.

![](media/service-tips-and-tricks-for-color-formatting/power-bi-formatting-pane.png)

## Change the color of a single data point
Sometimes you want to highlight one particular data point. Perhaps it’s sales figures for the launch of a new product, or increased quality scores after launching a new program. With Power BI, you can highlight a particular data point by changing its color.

The following visualization ranks units sold by product segment. 

![](media/service-tips-and-tricks-for-color-formatting/power-bi-grey.png)

Now imagine you want to call out the **Convenience** segment to show how well this brand new segment is performing, by using color. Here are the steps:

Expand the **Data Colors** section and turn the slider On for **Show all**. This displays the colors for each data element in the visualization. When you hover over the data points, scrolling is enabled so you can modify any of the data points.

![](media/service-tips-and-tricks-for-color-formatting/power-bi-show-all.png)

Set **Convenience** to orange. 

![](media/service-tips-and-tricks-for-color-formatting/power-bi-orange.png)

Once selected, the **Convenience** data point is a nice shade of orange, and certainly stands out.

Even if you change visualization types, then return, Power BI remembers your selection and keeps **Convenience** orange.

You can change the color of a data point for one, several, or all data elements in the visualization. Perhaps you want your visual to mimic your corporate colors. 

![](media/service-tips-and-tricks-for-color-formatting/power-bi-corporate.png)

There are all sorts of things you can do with colors. In the next section, we take a look at gradients.

## Base the colors of a chart on a numeric value
Charts often benefit from dynamically setting color based on the numeric value of a field. By doing this, you could show a different value than what’s used to for the size of a bar, and show two values on a single graph. Or you can use this to highlight data points over (or under) a certain value – perhaps highlighting areas of low profitability.

The following sections demonstrate different ways to base color on a numeric value.

## Base the color of data points on a value
To change color based on a value, drag the field you want to base color on into the **Color Saturation** area in the **Fields** pane. In the following image, **%Market Share SPLY YTD** has been dragged into **Color Saturation**. 

![](media/service-tips-and-tricks-for-color-formatting/power-bi-color-saturation.png)

As can see that, although **Velo** has higher **Gross Sales** (its column is higher), **Amarilla** has a larger **Profit before tax** (its column has more color saturation).

![](media/service-tips-and-tricks-for-color-formatting/power-bi-default-pallete.png)

## Customize the colors used in the color scale
You can customize colors used in the color scale, too. Expand **Data Colors** and you see a gradient of colors used for visualizing your data. By default, the lowest value in your data is mapped to the least saturated color, and the highest value to the most saturated color.

The color range is shown in a gradient bar that displays the spectrum between **Minimum** and **Maximum** color values, with the **Minimum** value color on the left, and **Maximum** value color to the right.

![](media/service-tips-and-tricks-for-color-formatting/tipstrickscolor_10.png)

To change the scale to use a different range of colors, select the color drop-down beside **Minimum** or **Maximum**, and select a color. The following image shows the **Maximum** color changed to black, and the gradient bar shows the new color spectrum between **Minimum** and **Max﻿imum**.

![](media/service-tips-and-tricks-for-color-formatting/tipstrickscolor_11.png)

You can also change the way the values map to these colors. In the following image, the colors for **Minimum** and **Maximum** are set to orange and green, respectively.

In this first image, notice how the bars in the chart reflect the gradient shown in the bar; the highest value is green, the lowest is orange, and each bar between is colored with a shade of the spectrum between green and orange.

![](media/service-tips-and-tricks-for-color-formatting/tipstrickscolor_12.png)

Now, let’s see what happens if we provide numeric values in the **Minimum** and **Maximum** value boxes, which are below the **Minimum** and **Maximum** color selectors (shown in the following image). Let’s set **Minimum** to 20,000,000, and set **Maximum** to 20,000,001.

By setting those values, gradient is no longer applied to values on the chart that are below **Minimum** or above **Maximum**; any bar with a value over **Maximum** value is colored green, and any bar with a value under **Minimum** value is colored red.

![](media/service-tips-and-tricks-for-color-formatting/tipstrickscolor_13.png)

## Use diverging color scales
Sometimes your data may have a naturally diverging scale. For example, a temperate range has a natural center at freezing point, and a profitability score has a natural mid-point (zero).

To use diverging color scales, slide the **Diverging** slider to **On**. When **Diverging** is turned on, an additional color selector and value box, both called **Center**, appear, as shown in the following image.

![](media/service-tips-and-tricks-for-color-formatting/tipstrickscolor_14.png)

When the **Diverging** slider is on, you can set the colors for **Minimum**, **Maximum** and **Center** separately. In the following image, **Center** is set to one, so bars with values above one are a gradient shade of green, and bars below one are shades of red.

## How to undo in Power BI
Like many other Microsoft services and software, Power BI provides an easy way to undo your last command. For example, let’s say you change the color of a data point, or a series of data points, and you don’t like the color when it appears in the visualization. You don’t recall exactly which color it was before, but you know you want that color back!

To **undo** your last action, or the last few actions, all you have to do is:

- Type CTRL+Z

## Feedback
Do you have a tip you’d like to share? Please send it our way, and we’ll see about including it here.

>[!NOTE]
>These color, axis, and related customizations, available when the **F﻿ormat** icon is selected, are also available in Power BI Desktop.

## Next steps
[Getting started with color formatting and axis properties](service-getting-started-with-color-formatting-and-axis-properties.md)

