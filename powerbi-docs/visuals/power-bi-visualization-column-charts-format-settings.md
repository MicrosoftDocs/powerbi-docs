---
title: Column chart formatting
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

# Column charts format settings

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

The visibility of y-axis **Values** can be toggled on or off to make them visible or to hide them. When toggled on, you can access and adjust all the Values settings shown below.


[!INCLUDE [yaxis-values-switch-axis-position](../includes/core-visuals/yaxis-values-switch-axis-position.md)]

#### Title

The visibility of y-axis **Title** can be toggled on or off to make it visible or to hide it. When toggled on, you can access and adjust all the Title settings shown below.

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

### Small multiples

The settings for **Small multiples** become accessible when a data field is active in the small multiple field well within the **Build** pane. However, it’s important to note that small multiples do not function properly when the x-axis and legend share the same data field.

#### Layout

[!INCLUDE [small-multiples-layout-rows](../includes/core-visuals/small-multiples-layout-rows.md)]
[!INCLUDE [small-multiples-layout-columns](../includes/core-visuals/small-multiples-layout-columns.md)]
[!INCLUDE [small-multiples-layout-all-padding](../includes/core-visuals/small-multiples-layout-all-padding.md)]
[!INCLUDE [small-multiples-layout-customize-padding](../includes/core-visuals/small-multiples-layout-customize-padding.md)]

#### Border

[!INCLUDE [small-multiples-border-gridlines](../includes/core-visuals/small-multiples-border-gridlines.md)]
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [border-and-divider-line-style](../includes/core-visuals/border-&-divider-line-style.md)]
[!INCLUDE [border-and-divider-width](../includes/core-visuals/border-&-divider-width.md)]

#### Background

[!INCLUDE [small-multiples-background-color-palette-fx](../includes/core-visuals/small-multiples-background-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

### Gridlines

#### Horizontal

The visibility of **Horizontal gridlines** can can be toggled on or off to make it visible or to hide it. When toggled on, you can access and adjust the setting as shown below.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-line-style](../includes/core-visuals/global-line-style.md)]
[!INCLUDE [global-dash-array](../includes/core-visuals/global-dash-array.md)]
[!INCLUDE [global-dash-cap](../includes/core-visuals/global-dash-cap.md)]
[!INCLUDE [global-scale-by-width](../includes/core-visuals/global-scale-by-width.md)]
[!INCLUDE [gridlines-horizontal-&-vertical-width](../includes/core-visuals/gridlines-horizontal-&-vertical-width.md)]

#### Vertical

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-line-style](../includes/core-visuals/global-line-style.md)]
[!INCLUDE [global-dash-array](../includes/core-visuals/global-dash-array.md)]
[!INCLUDE [global-dash-cap](../includes/core-visuals/global-dash-cap.md)]
[!INCLUDE [global-scale-by-width](../includes/core-visuals/global-scale-by-width.md)]
[!INCLUDE [gridlines-horizontal-&-vertical-width](../includes/core-visuals/gridlines-horizontal-&-vertical-width.md)]

### Columns

#### Apply settings to
[!INCLUDE [columns-apply-settings-to](../includes/core-visuals/columns-apply-settings-to.md)]

[!INCLUDE [columns-apply-settings-to-categories](../includes/core-visuals/columns-apply-settings-to-categories.md)]
[!INCLUDE [global-apply-settings-to-series-menu](../includes/core-visuals/global-apply-settings-to-series-menu.md)]

#### Color
The **Color** setting feature enables you to select a hue from the color palette aligned with the current theme, or define custom colors for a unique aesthetic.

[!INCLUDE [columns-color-apply-settings-to-color](../includes/core-visuals/columns-color-apply-settings-to-color.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Border

The **Border** controls allow you to customize the appearance of the borders around each column in a column chart.

[!INCLUDE [columns-border-match-column-color](../includes/core-visuals/columns-border-match-column-color.md)]
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [border-&-accent-bar-width](../includes/core-visuals/border-&-accent-bar-width.md)]
[!INCLUDE [columns-border-hide-inner-borders](../includes/core-visuals/columns-border-hide-inner-borders.md)]

#### Layout

The layout settings are available only when **Apply settings to** is set to either all series or categories.

[!INCLUDE [columns-layout-reverse-order](../includes/core-visuals/columns-layout-reverse-order.md)]
[!INCLUDE [columns-layout-sort-by-value](../includes/core-visuals/columns-layout-sort-by-value.md)]
[!INCLUDE [columns-layout-space-between-categories](../includes/core-visuals/columns-layout-space-between-categories.md)]
[!INCLUDE [columns-layout-space-between-series](../includes/core-visuals/columns-layout-space-between-series.md)]
[!INCLUDE [columns-layout-series-explosion](../includes/core-visuals/columns-layout-series-explosion.md)]
[!INCLUDE [columns-layout-overlap](../includes/core-visuals/columns-layout-overlap.md)]
[!INCLUDE [columns-layout-flip-overlap](../includes/core-visuals/columns-layout-flip-overlap.md)]


### Ribbon settings

#### Apply settings to
The ribbon's visibility can can be toggled on or off to make it visible or to hide it. When toggled on, you can access and adjust all the ribbon settings shown below.
[!INCLUDE [global-apply-settings-to-series](../includes/core-visuals/global-apply-settings-to-series.md)]

[!INCLUDE [global-apply-settings-to-series-menu](../includes/core-visuals/global-apply-settings-to-series-menu.md)]

#### Color

The **Color** setting feature enables you to select a hue from the color palette aligned with the current theme, or define custom colors for a unique aesthetic.

[!INCLUDE [global-match-series-color](../includes/core-visuals/global-match-series-color.md)]
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Border

[!INCLUDE [ribbons-border-match-ribbon-color](../includes/core-visuals/ribbons-border-match-ribbon-color.md)]
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [border-&-accent-bar-width](../includes/core-visuals/border-&-accent-bar-width.md)]

#### Layout

The **Layout** settings are available only when **Apply settings to** is set to either all series.

[!INCLUDE [ribbons-layout-space-between-ribbons-and-columns](../includes/core-visuals/ribbons-layout-space-between-ribbons-and-columns.md)]

### Data labels

The visibility of **Data labels** can can be toggled on or off to make them visible or to hide them. When toggled on, you can access and adjust all the data labels settings shown below.

#### Apply settings to

[!INCLUDE [global-apply-settings-to-series](../includes/core-visuals/global-apply-settings-to-series.md)]
[!INCLUDE [global-apply-settings-to-series-menu](../includes/core-visuals/global-apply-settings-to-series-menu.md)]

#### Options

The **Options** dropdown provides a collection of settings that modify the appearance of the data labels.

[!INCLUDE [data-labels-options-orientation](../includes/core-visuals/data-labels-options-orientation.md)]
[!INCLUDE [data-labels-options-position](../includes/core-visuals/data-labels-options-position.md)]
[!INCLUDE [data-labels-options-overflow-text](../includes/core-visuals/data-labels-options-overflow-text.md)]
[!INCLUDE [data-labels-options-optimize-label-display](../includes/core-visuals/data-labels-options-optimize-label-display.md)]

#### Title

[!INCLUDE [data-labels-title-content](../includes/core-visuals/data-labels-title-content.md)]
[!INCLUDE [data-labels-title-data](../includes/core-visuals/data-labels-title-data.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [global-format-code-fx](../includes/core-visuals/global-format-code-fx.md)]
[!INCLUDE [global-show-blank-as](../includes/core-visuals/global-show-blank-as.md)]

#### Value

[!INCLUDE [data-labels-value-field](../includes/core-visuals/data-labels-value-field.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [global-format-code-fx](../includes/core-visuals/global-format-code-fx.md)]
[!INCLUDE [global-show-blank-as](../includes/core-visuals/global-show-blank-as.md)]

#### Detail

[!INCLUDE [data-labels-detail-field](../includes/core-visuals/data-labels-detail-field.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [global-format-code-fx](../includes/core-visuals/global-format-code-fx.md)]
[!INCLUDE [global-show-blank-as](../includes/core-visuals/global-show-blank-as.md)]

#### Background

The **Background** toggle allows users to display a background color behind the data label in visualizations. When disabled, data labels will appear directly overlaid on the chart without the addition of a background color. Enabling the Background toggle adds a colored background behind each data label, allowing users to adjust all the background settings shown below.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

### Total labels

The **Total labels** toggle enables users to display the total values for a set of data points in the visualization. When enabled, the settings shown below become available allowing users to fully adjust the appearance of the data values.

#### Values

The **Values** settings enables users to configure formatting options for font, color, display units, and more, as shown below.

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [total-labels-values-display-units](../includes/core-visuals/total-labels-values-display-units.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [total-labels-values-split](../includes/core-visuals/total-labels-values-split.md)]

#### Background

The **Background** toggle allows users to display a background color behind the total label in visualizations. When disabled, data labels will appear directly overlaid on the chart without the addition of a background color.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

### Plot area background

The **Plot are background** enables users to display a background image behind the columns in visualizations. When an image is added, additional settings become available allowing users to format the image.

[!INCLUDE [plot-area-background-browse](../includes/core-visuals/plot-area-background-browse.md)]
[!INCLUDE [plot-area-background-image-fit](../includes/core-visuals/plot-area-background-image-fit.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

### Reference line

A **Reference line** allows you to add context and benchmarks in your visual, displaying key values such as averages, medians or specific targets withing your chart. Keep in mind that your data model must have the necessary fields or measures to work, and must be a single value, not a range. Reference lines are available with Column charts that are Clustered, Stacked, or 100% Stacked.

#### Apply settings to
[!INCLUDE [reference-line-apply-settings-to](../includes/core-visuals/reference-line-apply-settings-to.md)]
[!INCLUDE [reference-line-add-line](../includes/core-visuals/reference-line-add-line.md)]
[!INCLUDE [reference-line-apply-settings-to-type](../includes/core-visuals/reference-line-apply-settings-to-type.md)]

#### Series

This **Series** setting only appears and is available when you have selected any line type other than Constant.

[!INCLUDE [reference-line-series-series](../includes/core-visuals/reference-line-series-series.md)]

#### Line

[!INCLUDE [reference-line-line-value](../includes/core-visuals/reference-line-line-value.md)]
[!INCLUDE [reference-line-line-percentile](../includes/core-visuals/reference-line-line-percentile.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-line-style](../includes/core-visuals/global-line-style.md)]
[!INCLUDE [global-dash-array](../includes/core-visuals/global-dash-array.md)]
[!INCLUDE [global-dash-cap](../includes/core-visuals/global-dash-cap.md)]
[!INCLUDE [global-scale-by-width](../includes/core-visuals/global-scale-by-width.md)]
[!INCLUDE [gridlines-horizontal-&-vertical-width](../includes/core-visuals/gridlines-horizontal-&-vertical-width.md)]
[!INCLUDE [reference-line-line-position](../includes/core-visuals/reference-line-line-position.md)]

#### Shade area

[!INCLUDE [reference-line-shade-area-position](../includes/core-visuals/reference-line-shade-area-position.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Background

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Data label

[!INCLUDE [reference-line-data-label-horizontal-position](../includes/core-visuals/reference-line-data-label-horizontal-position.md)]
[!INCLUDE [reference-line-data-label-vertical-position](../includes/core-visuals/reference-line-data-label-vertical-position.md)]
[!INCLUDE [reference-line-data-label-style](../includes/core-visuals/reference-line-data-label-style.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-continuous-axis-display-units](../includes/core-visuals/global-continuous-axis-display-units.md)]
[!INCLUDE [global-format-code-fx](../includes/core-visuals/global-format-code-fx.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]

### Error bars

**Error bars** in column charts are graphical representations that visually express the degree of uncertainty in the data points. This is crucial when the exact value isn’t as important as the trend or pattern. Smaller error bars suggest more precise measurements, while larger ones suggest higher variability and less reliability. They are a best practice in data visualization and they add a level of professionalism to reports, showing that you’ve considered and are presenting the variability in your data.

#### Apply settings to

[!INCLUDE [error-bars-apply-settings-to](../includes/core-visuals/error-bars-apply-settings-to.md)]

#### Options

The **Options** settings help tailor the **Error bars** to fit the context of your data and the message you want to convey with your visualization.

[!INCLUDE [error-bars-options-enabled-toggle](../includes/core-visuals/error-bars-options-enabled-toggle.md)]
[!INCLUDE [error-bars-options-type](../includes/core-visuals/error-bars-options-type.md)]
[!INCLUDE [error-bars-options-upper-bound](../includes/core-visuals/error-bars-options-upper-bound.md)]
[!INCLUDE [error-bars-options-lower-bound](../includes/core-visuals/error-bars-options-lower-bound.md)]
[!INCLUDE [error-bars-options-relationship-to-measure](../includes/core-visuals/error-bars-options-relationship-to-measure.md)]
[!INCLUDE [error-bars-options-make-symmetrical](../includes/core-visuals/error-bars-options-make-symmetrical.md)]

#### Bar

The **Bar** toggle enables **Error bars** in your visual after configuring the options as outlined above. When enabled, error bars can be formatted according to your needs, to best fit the visual using the settings as shown below.

[!INCLUDE [global-match-series-color](../includes/core-visuals/global-match-series-color.md)]
[!INCLUDE [error-bars-bar-bar-color](../includes/core-visuals/error-bars-bar-bar-color.md)]
[!INCLUDE [error-bars-bar-width](../includes/core-visuals/error-bars-bar-width.md)]
[!INCLUDE [error-bars-bar-marker-shape](../includes/core-visuals/error-bars-bar-marker-shape.md)]
[!INCLUDE [error-bars-bar-marker-size](../includes/core-visuals/error-bars-bar-marker-size.md)]
[!INCLUDE [error-bars-bar-border-color](../includes/core-visuals/error-bars-bar-border-color.md)]
[!INCLUDE [error-bars-bar-border-size](../includes/core-visuals/error-bars-bar-border-size.md)]

#### Error labels

**Error labels** enhance the understanding of your data by providing additional context and insights into the precision and variability of measurements.

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-match-series-color](../includes/core-visuals/global-match-series-color.md)]
[!INCLUDE [global-color-palette](../includes/core-visuals/global-color-palette.md)]
[!INCLUDE [error-bars-error-labels-label-format](../includes/core-visuals/error-bars-error-labels-label-format.md)]
[!INCLUDE [error-bars-error-labels-show-background](../includes/core-visuals/error-bars-error-labels-show-background.md)]
[!INCLUDE [global-background-color](../includes/core-visuals/global-background-color.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Tooltip

The **Tooltip** toggle only appears when the Options toggle, as outline above, has been activated. Subsequently, you can enable the Tooltip toggle, and you’re granted access to the settings depicted below. This sequential toggle design ensures that you can customize your visual elements in a structured and organized manner.

[!INCLUDE [error-bars-error-labels-label-format](../includes/core-visuals/error-bars-error-labels-label-format.md)]

## Considerations and technical aspects

### Considerations
- Display units suffix changes according to location/system settings. 
- Axis colors defined by conditional formatting are based to a general value rather that by individual category.

### Technical aspects

## Related content

* [Column charts in Power BI](power-bi-visualization-column-charts.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
