---
title: Matrix visual format settings
description: This document explains all available Format settings for Card visuals in Power BI Desktop and Power BI Service.
author: JaedenArmstrong
ms.author: miguelmyers
ms.reviewer:
ms.custom:
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/01/2024
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to understand and learn about all the available Format settings for card visuals so that I can effectively and more easily format card visuals in Power BI Desktop and Power BI Service.
---

# Card visual format settings

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

The document you are about to delve into will provide a comprehensive and detailed exposition of the various format settings available for card visuals in both Power BI Desktop and Power BI Service.

Serving as a reference guide, we've listed the multitude of customization options at your disposal, enabling you to tailor your data visualization to your specific needs. From layout enhancements, callout values, and reference labels, to advanced card settings, and image controls, this document will cover every setting for card visual formatting, ensuring that you can present your data in the most effective and visually appealing way possible.

Whether you’re a seasoned Power BI user or new to data visualization, this document will be an invaluable resource for mastering card visual formatting in Power BI Desktop and Power BI Service, providing you with a detailed explanation for each setting and control.

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

## X-axis settings

### Type

The **Type** setting within x-axis options is only available when you choose a single data field that is either numerical or date/time.

[!INCLUDE [xaxis-type-type](../includes/core-visuals/xaxis-type-type.md)]

### Range

The availability of **Range** settings depends on configuring the x-axis **Type** as **Continuous**. Once the X-axis Type is specified as Continuous, you can access and adjust all the Range settings shown below.

[!INCLUDE [axis-range-maximum](../includes/core-visuals/axis-range-maximum.md)]
[!INCLUDE [axis-range-minimum](../includes/core-visuals/axis-range-minimum.md)]
[!INCLUDE [axis-range-logarithmic-scale](../includes/core-visuals/axis-range-logarithmic-scale.md)]
[!INCLUDE [xaxis-range-invert-range](../includes/core-visuals/xaxis-range-invert-range.md)]




## Considerations and technical aspects

### Considerations
- Display units suffix changes according to location/system settings. 
- Axis colors defined by conditional formatting are based to a general value rather that by individual category.

### Technical aspects

## Related content

* [Column charts in Power BI](power-bi-visualization-column-charts.md)
* [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
* [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
