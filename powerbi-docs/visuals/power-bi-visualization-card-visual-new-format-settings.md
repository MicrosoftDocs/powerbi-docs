---
title: (new) Card visual format settings
description: This article provides a clear overview of all available Format settings for the (new) Card visual in Power BI Desktop.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer: davidiseminger
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 09/27/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand and learn about all the available Format settings for the (new) Card visual so that I can effectively and more easily format (new) Card visuals in Power BI Desktop.
---

# (new) Card visual format settings

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

This article provides a comprehensive and detailed exposition of all format settings available for the (new) Card visual in Power BI Desktop.

Serving as a reference guide, we've listed the multitude of customization options at your disposal, enabling you to tailor your data visualization to your specific needs. From layout enhancements, callout values, and reference labels, to advanced card settings, and image controls, we’ll cover every setting for (new) Card visual formatting.

Whether you’re a seasoned Power BI user or new to data visualization, if you're looking to understand all the format options available for the (new) Card visual, this guide has got you covered as you explore how to tailor the (new) Card visual to perfectly fit your needs.

> [!IMPORTANT]
> The (new) Card visual is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

To format and customize your column chart in **Power BI Desktop**, select the **Format visual** icon in the **Visualizations Pane** This grants access to the vast array of formatting options under the **Visual** and **General** tabs, enabling you to refine both appearance and functionality of your column charts to meet your specific needs.

   :::image type="content" source="../includes/media/power-bi-visualization-column-charts/(new)-card-format-settings-desktop.png" alt-text="Power BI Desktop screenshot showing the Visualizations pane, Format visual icon, and both the Visual and General tabs highlighted.":::

## Format settings

### Layout

#### Layout

With the ability to configure and display multiple cards in a single container, these settings provide comprehensive control over the layout and appearance of each card.

[!INCLUDE [layout-layout-arrangement](../includes/core-visuals/layout-layout-arrangement.md)]
[!INCLUDE [layout-layout-style](../includes/core-visuals/layout-layout-style.md)]
[!INCLUDE [layout-layout-max-rows-shown](../includes/core-visuals/layout-layout-max-rows-shown.md)]
[!INCLUDE [layout-layout-columns-shown](../includes/core-visuals/layout-layout-columns-shown.md)]
[!INCLUDE [layout-layout-max-cards-shown](../includes/core-visuals/layout-layout-max-cards-shown.md)]
[!INCLUDE [layout-layout-customize-spacing](../includes/core-visuals/layout-layout-customize-spacing.md)]
[!INCLUDE [layout-layout-space-between-rows](../includes/core-visuals/layout-layout-space-between-rows.md)]
[!INCLUDE [layout-layout-space-between-columns](../includes/core-visuals/layout-layout-space-between-columns.md)]
[!INCLUDE [layout-layout-space-between-cards](../includes/core-visuals/layout-layout-space-between-cards.md)]

#### Overflow

The **Overflow** settings provide flexibility in displaying more cards that don't fit within the initial view. You can define settings to allow users to scroll continuously or flip through paginated cards, either vertically or horizontally, to view all the data within the visual.

[!INCLUDE [layout-overflow-overflow-style](../includes/core-visuals/layout-overflow-overflow-style.md)]
[!INCLUDE [layout-overflow-overflow-direction](../includes/core-visuals/layout-overflow-overflow-direction.md)]

### Callout values

#### Apply settings to

[!INCLUDE [global-apply-settings-to-series](../includes/core-visuals/global-apply-settings-to-series.md)]
[!INCLUDE [global-apply-settings-to-series-menu](../includes/core-visuals/global-apply-settings-to-series-menu.md)]

#### Values

The visibility of **Values** can be toggled on or off to make them apparent or to hide them. When toggled on, you can access and adjust all the Values settings shown here.

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [callout-values-horixontal-alignment](../includes/core-visuals/callout-values-values-horizontal-alignment.md)]
[!INCLUDE [callout-values-values-text-wrap](../includes/core-visuals/callout-values-values-text-wrap.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [callout-values-values-format-code](../includes/core-visuals/callout-values-values-format-code.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [global-show-blank-as](../includes/core-visuals/global-show-blank-as.md)]

#### Label

The **Label** toggle, when enabled, allows you to display labels for your callout values. You can customize the appearance of these labels in your visualizations, including options for changing the displayed text, label hierarchy, font, text size, color, and alignment of the labels, ensuring they precisely match the report.

[!INCLUDE [callout-values-label-text](../includes/core-visuals/callout-values-label-text.md)]
[!INCLUDE [callout-values-label-heading](../includes/core-visuals/callout-values-label-heading.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [callout-values-label-position](../includes/core-visuals/callout-values-label-position.md)]
[!INCLUDE [callout-values-label-space-between-label-and-value](../includes/core-visuals/callout-values-label-space-between-label-and-value.md)]
[!INCLUDE [callout-values-label-match-value-alignment](../includes/core-visuals/callout-values-label-match-value-alignment.md)]
[!INCLUDE [callout-values-label-align-baselines](../includes/core-visuals/callout-values-label-align-baselines.md)]

#### Layout

The **Layout** section is designed to enhance the presentation of your data visualizations by offering settings for vertical alignment and callout size as shown here.

[!INCLUDE [global-vertical-alignment](../includes/core-visuals/global-vertical-alignment.md)]
[!INCLUDE [callout-values-layout-callout-size](../includes/core-visuals/callout-values-layout-callout-size.md)]

### Reference labels

#### Apply settings to

[!INCLUDE [global-apply-settings-to-series](../includes/core-visuals/global-apply-settings-to-series.md)]
[!INCLUDE [reference-labels-apply-settings-to-select-series](../includes/core-visuals/reference-labels-apply-settings-to-select-series.md)]
[!INCLUDE [reference-labels-add-label](../includes/core-visuals/reference-labels-add-label.md)]
[!INCLUDE [reference-labels-apply-settings-to-select-label](../includes/core-visuals/reference-labels-apply-settings-to-select-label.md)]

#### Options

The **Options** menu is available when **Apply settings to** is set for **All series**.

[!INCLUDE [reference-labels-options-position](../includes/core-visuals/reference-labels-options-position.md)]

#### Title

The **Title** toggle, when enabled, controls the visibility of the Series title. When enabled, an array of settings becomes available, as shown, allowing users to fully adjust the appearance of the Series title.

[!INCLUDE [data-labels-title-content](../includes/core-visuals/data-labels-title-content.md)]
[!INCLUDE [reference-labels-title-text](../includes/core-visuals/reference-labels-title-text.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Value

[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [reference-labels-value-format-code-fx](../includes/core-visuals/reference-labels-value-format-code-fx.md)]
[!INCLUDE [reference-labels-value-value-decimal-places](../includes/core-visuals/reference-labels-value-value-decimal-places.md)]
[!INCLUDE [global-show-blank-as](../includes/core-visuals/global-show-blank-as.md)]

#### Detail

The **Detail** toggle, when enabled, provides users the option to add and format more data to include detailed information in the Reference label when desired. The individual availability of each setting is dependent on which options have been selected for both series and labels.

[!INCLUDE [reference-labels-detail-data](../includes/core-visuals/reference-labels-detail-data.md)]
[!INCLUDE [global-font-controls](../includes/core-visuals/global-font-controls.md)]
[!INCLUDE [reference-labels-detail-font-color](../includes/core-visuals/reference-labels-detail-font-color.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [global-display-units](../includes/core-visuals/global-display-units.md)]
[!INCLUDE [global-format-code-fx](../includes/core-visuals/global-format-code-fx.md)]
[!INCLUDE [global-value-decimal-places](../includes/core-visuals/global-value-decimal-places.md)]
[!INCLUDE [global-show-blank-as](../includes/core-visuals/global-show-blank-as.md)]

#### Divider

The **Divider** toggle, when enabled, displays a customizable visual division between the Callout values and the Reference label, and also makes the Background toggle available for more customization options.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [border-&-divider-line-style](../includes/core-visuals/border-&-divider-line-style.md)]
[!INCLUDE [border-&-divider-line-width](../includes/core-visuals/border-&-divider-width.md)]
[!INCLUDE [reference-labels-divider-ignore-padding](../includes/core-visuals/reference-labels-divider-ignore-padding.md)]

#### Background

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Layout

[!INCLUDE [reference-labels-layout-arrangement](../includes/core-visuals/reference-labels-layout-arrangement.md)]
[!INCLUDE [reference-labels-layout-style](../includes/core-visuals/reference-labels-layout-style.md)]
[!INCLUDE [reference-labels-layout-value-area](../includes/core-visuals/reference-labels-layout-value-area.md)]
[!INCLUDE [reference-labels-layout-horizontal-alignment](../includes/core-visuals/reference-labels-layout-horizontal-alignment.md)]
[!INCLUDE [reference-labels-layout-vertical-alignment](../includes/core-visuals/reference-labels-layout-vertical-alignment.md)]

#### Spacing

The **Spacing** menu provides options to adjust the layout and appearance of reference labels in a card visual. It allows you to customize the space between labels, divider line padding, and outer padding. 

[!INCLUDE [reference-labels-spacing-space-between-labels](../includes/core-visuals/reference-labels-spacing-space-between-labels.md)]
[!INCLUDE [reference-labels-spacing-customize-outer-padding](../includes/core-visuals/reference-labels-spacing-customize-outer-padding.md)]
[!INCLUDE [reference-labels-spacing-padding-before](../includes/core-visuals/reference-labels-spacing-padding-before.md)]
[!INCLUDE [reference-labels-spacing-padding-after](../includes/core-visuals/reference-labels-spacing-padding-after.md)]
[!INCLUDE [reference-labels-spacing-outer-padding](../includes/core-visuals/reference-labels-spacing-outer-padding.md)]

### Images

#### Apply settings to

[!INCLUDE [global-apply-settings-to-series](../includes/core-visuals/global-apply-settings-to-series.md)]
[!INCLUDE [global-apply-settings-to-series-menu](../includes/core-visuals/global-apply-settings-to-series-menu.md)]

#### Image

[!INCLUDE [images-image-image-type](../includes/core-visuals/images-image-image-type.md)]
[!INCLUDE [images-image-browse](../includes/core-visuals/images-image-browse.md)]
[!INCLUDE [images-image-image-url](../includes/core-visuals/images-image-image-url.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [images-image-position](../includes/core-visuals/images-image-position.md)]
[!INCLUDE [global-vertical-alignment](../includes/core-visuals/global-vertical-alignment.md)]
[!INCLUDE [images-image-space-between-image-and-callout](../includes/core-visuals/images-image-space-between-image-and-callout.md)]
[!INCLUDE [images-image-fix-size](../includes/core-visuals/images-image-fix-size.md)]
[!INCLUDE [images-image-iamge-area-size](../includes/core-visuals/images-image-image-area-size.md)]
[!INCLUDE [images-image-size](../includes/core-visuals/images-image-size.md)]
[!INCLUDE [images-image-alt-text](../includes/core-visuals/images-image-alt-text.md)]

### Card settings

#### Apply settings to

[!INCLUDE [global-apply-settings-to-series](../includes/core-visuals/global-apply-settings-to-series.md)]
[!INCLUDE [global-apply-settings-to-series-menu](../includes/core-visuals/global-apply-settings-to-series-menu.md)]

#### Shape

[!INCLUDE [cards-shape-shape](../includes/core-visuals/cards-shape-shape.md)]
[!INCLUDE [cards-shape-rounded-corners](../includes/core-visuals/cards-shape-rounded-corners.md)]
[!INCLUDE [cards-shape-size-of-top-snips](../includes/core-visuals/cards-shape-size-of-top-snips.md)]
[!INCLUDE [cards-shape-size-of-bottom-snips](../includes/core-visuals/cards-shape-size-of-bottom-snips.md)]
[!INCLUDE [cards-shape-customize-style](../includes/core-visuals/cards-shape-customize-style.md)]
[!INCLUDE [cards-shape-top-left-corner](../includes/core-visuals/cards-shape-top-left-corner.md)]
[!INCLUDE [cards-shape-top-right-corner](../includes/core-visuals/cards-shape-top-right-corner.md)]
[!INCLUDE [cards-shape-bottom-left-corner](../includes/core-visuals/cards-shape-bottom-left-corner.md)]
[!INCLUDE [cards-shape-bottom-right-corner](../includes/core-visuals/cards-shape-bottom-right-corner.md)]

#### Padding

[!INCLUDE [cards-padding-size](../includes/core-visuals/cards-padding-size.md)]
[!INCLUDE [cards-padding-padding](../includes/core-visuals/cards-padding-padding.md)]

#### Alignment

[!INCLUDE [cards-alignment-certical-alignment](../includes/core-visuals/cards-alignment-vertical-alignment.md)]

#### Background

The **Background** toggle, when enabled, provides more options to customize the background of your cards.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [cards-background-background-image-browse](../includes/core-visuals/cards-background-background-image-browse.md)]
[!INCLUDE [cards-background-image-fit](../includes/core-visuals/cards-background-image-fit.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Border

The **Border** toggle, when enabled, provides customization options to customize the borders and enhance the visual appeal of your cards.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [border-&-accent-bar-width](../includes/core-visuals/border-&-accent-bar-width.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Shadow

The **Shadow** toggle, when enabled, enhances the visual appeal of your cards by giving them a three-dimensional look and can help certain elements stand out in your report.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [cards-shadow-offset](../includes/core-visuals/cards-shadow-offset.md)]
[!INCLUDE [cards-shadow-and-glow-position](../includes/core-visuals/cards-shadow-and-glow-position.md)]
[!INCLUDE [cards-shadow-size](../includes/core-visuals/cards-shadow-size.md)]
[!INCLUDE [cards-shadow-glow-blur](../includes/core-visuals/cards-shadow-glow-blur.md)]
[!INCLUDE [cards-shadow-glow-angle](../includes/core-visuals/cards-shadow-glow-angle.md)]
[!INCLUDE [cards-shadow-glow-distance](../includes/core-visuals/cards-shadow-glow-distance.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Glow

The **Glow** toggle, when enabled, enhances the visual appeal of your cards by giving them a luminous soft light effect around the cards and can help certain elements stand out in your report.

[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [cards-glow-offset](../includes/core-visuals/cards-glow-offset.md)]
[!INCLUDE [cards-shadow-and-glow-position](../includes/core-visuals/cards-shadow-and-glow-position.md)]
[!INCLUDE [cards-glow-size](../includes/core-visuals/cards-glow-size.md)]
[!INCLUDE [cards-shadow-glow-blur](../includes/core-visuals/cards-shadow-glow-blur.md)]
[!INCLUDE [cards-shadow-glow-angle](../includes/core-visuals/cards-shadow-glow-angle.md)]
[!INCLUDE [cards-shadow-glow-distance](../includes/core-visuals/cards-shadow-glow-distance.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]

#### Accent bar

The **Accent bar** toggle, when enabled, is a simple yet effective way to draw attention to key metrics on your cards and providing more visual cues to highlight important information, using these settings.

[!INCLUDE [cards-accent-bar-position](../includes/core-visuals/cards-accent-bar-position.md)]
[!INCLUDE [global-color-palette-fx](../includes/core-visuals/global-color-palette-fx.md)]
[!INCLUDE [global-transparency](../includes/core-visuals/global-transparency.md)]
[!INCLUDE [border-&-accent-bar-width](../includes/core-visuals/border-&-accent-bar-width.md)]

## Related content

* [Create a (new) Card visual](power-bi-visualization-new-card.md)
* [Considerations and limitations for (new) card visuals)](power-bi-visualization-card-visual-considerations.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
* [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
