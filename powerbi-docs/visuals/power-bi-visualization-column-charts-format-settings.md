---
title: Format settings for column charts
description: This document explains all available Format settings for Column charts in Power BI Desktop and Power BI Service.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer:
ms.custom:
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/01/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand and learn about all the available Format settings for column charts so that I can effectively and more easily format column chart visuals in Power BI Desktop and Power BI Service.
---

# Format settings for column charts

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

The document you are about to delve into will provide a comprehensive and detailed exposition of the various format settings available for column charts in both Power BI Desktop and Power BI Service.

Serving as a reference guide, we've listed the multitude of customization options at your disposal, enabling you to tailor your data visualization to your specific needs. From layout enhancements to advanced ribbon settings, this document will cover every setting for column chart formatting, ensuring that you can present your data in the most effective and visually appealing way possible.

Whether you’re a seasoned Power BI user or new to data visualization, this document will be an invaluable resource for mastering column chart formatting in Power BI Desktop and Power BI Service, providing you with a detailed explanation for each setting and control.

## Prerequisites

# [Power BI Desktop](#tab/powerbi-desktop)

To format and customize your column chart in **Power BI Desktop**, simply click the **Format visual** icon in the **Visualizations Pane** This grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both appearance and functionality of your column charts to meet your specific needs.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/column-chart-format-settings-desktop.png" alt-text="Power BI Desktop screenshot of the Visualizations pane highlighted, along with Format visual icon, and both the Visual tab and General tab, also highlighted.":::

# [Power BI Service](#tab/powerbi-service)

To format and customize your column chart in **Power BI Service**, simply click the **Format visual** icon in the **Visualizations Pane** This grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both appearance and functionality of your column charts to meet your specific needs.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/column-chart-format-settings-service.png" alt-text="Power BI Service screenshot of the Visualizations pane highlighted, along with Format visual icon, and both the Visual tab and General tab, also highlighted.":::

---

> [!NOTE]
> [!INCLUDE [prerequisites-share-your-report](../includes/core-visuals/prerequisites-share-your-report.md)]

## Settings

### X-axis

#### Type

The **Type** setting within x-axis options is only available when you choose a single data field that is either numerical or date/time.

[!INCLUDE [xaxis-type-type](../includes/core-visuals/xaxis-type-type.md)]

#### Range

The availability of **Range** settings depends on configuring the x-axis **Type** as **Continuous**. Once the X-axis Type is specified as Continuous, you can access and adjust all the Range settings shown below.

[!INCLUDE [axis-range-maximum](../includes/core-visuals/axis-range-maximum.md)]
[!INCLUDE [axis-range-minimum](../includes/core-visuals/axis-range-minimum.md)]
[!INCLUDE [axis-range-logarithmic-scale](../includes/core-visuals/axis-range-logarithmic-scale.md)]
[!INCLUDE [xaxis-range-invert-range](../includes/core-visuals/xaxis-range-invert-range.md)]

#### Values

The visibility of x-axis **Values** can be toggled on or off to make them apparent or to hide them. When toggled on, you can access and adjust all the Values settings shown below.

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-continuous-axis-display-units](../includes/core-visuals/global-continuous-axis-display-units.md)]
[!INCLUDE [xaxis-values-value-decimal-places.md](../includes/core-visuals/xaxis-values-value-decimal-places.md)]
[!INCLUDE [xaxis-values-maximum-height](../includes/core-visuals/xaxis-values-maximum-height.md)]
[!INCLUDE [xaxis-values-concatenate-labels](../includes/core-visuals/xaxis-values-concatenate-labels.md)]

#### Title

The visibility of x-axis **Title** can be toggled on or off to make it apparent or to hide it. When toggled on, you can access and adjust all the Title settings shown below.

[!INCLUDE [axis-title-title-text](../includes/core-visuals/axis-title-title-text.md)]
[!INCLUDE [axis-title-style](../includes/core-visuals/axis-title-style.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]

#### Layout

The **Layout** setting within x-axis options is only available when you’re working with certain types of data which allow for a categorical axis.

[!INCLUDE [xaxis-layout-minimum-category-width](../includes/core-visuals/xaxis-layout-minimum-category-width.md)]

### Y-axis

#### Range

[!INCLUDE [axis-range-maximum](../includes/core-visuals/axis-range-maximum.md)]
[!INCLUDE [axis-range-minimum](../includes/core-visuals/axis-range-minimum.md)]
[!INCLUDE [axis-range-logarithmic-scale](../includes/core-visuals/axis-range-logarithmic-scale.md)]
[!INCLUDE [xaxis-range-invert-range](../includes/core-visuals/xaxis-range-invert-range.md)]

#### Values

The visibility of y-axis **Values** can be toggled on or off to make them apparent or to hide them. When toggled on, you can access and adjust all the Values settings shown below.

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [specific-column-yaxis-values-display-units](../includes/core-visuals/specific-column-yaxis-values-display-units.md)]
[!INCLUDE [global-value-decimal-places.md](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [yaxis-values-switch-axis-position](../includes/core-visuals/yaxis-values-switch-axis-position.md)]

#### Title

The visibility of y-axis **Title** can be toggled on or off to make it apparent or to hide it. When toggled on, you can access and adjust all the Title settings shown below.

[!INCLUDE [axis-title-title-text](../includes/core-visuals/axis-title-title-text.md)]
[!INCLUDE [axis-title-style](../includes/core-visuals/axis-title-style.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]

### Legend

This setting is accessible when a data field is active in the **Legend** field well within the **Build** pane. The legend's visibility can can be toggled on or off to make it visible or to hide it. When toggled on, you can access and adjust all the Legend settings shown below.

#### Options

[!INCLUDE [legend-options-position](../includes/core-visuals/legend-options-position.md)]

#### Text

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]

#### Title

[!INCLUDE [legend-title-title-text](../includes/core-visuals/legend-title-title-text.md)]

### Small Multiples

The settings for **Small multiples** become accessible when a data field is active in the small multiple field well within the **Build** pane. However, it’s important to note that **Small multiples** do not function properly when the x-axis and legend share the same data field.

#### Layout

[!INCLUDE [small-multiples-layout-rows](../includes/core-visuals/small-multiples-layout-rows.md)]
[!INCLUDE [small-multiples-layout-columns](../includes/core-visuals/small-multiples-layout-columns.md)]
[!INCLUDE [small-multiples-layout-all-padding](../includes/core-visuals/small-multiples-layout-all-padding.md)]
[!INCLUDE [small-multiples-layout-customize-padding](../includes/core-visuals/small-multiples-layout-customize-padding.md)]


## Related content

* [Create a column chart](power-bi-visualization-column-charts.md)
* [Considerations and limitations for column charts](power-bi-visualization-column-charts-considerations.md)
* [Format column and bar charts](power-bi-visualization-column-bar-format.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
