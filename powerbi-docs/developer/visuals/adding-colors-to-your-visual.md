---
title:  Adding colors to your visual
description: This article describes how to add colors to Power BI Custom Visuals
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/12/2019
---
# Adding colors to your visual
This article describes how to add colors to your visuals and how to handle colored visual's data points.
Color is exposed as one of the services available on `IVisualHost`.

See [commit](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/a521bc6b9930f630861dc08e27330030766ae057) for what was added at this step.

## Add Color to Data Points
Each data point will be represented by a different color. Add color to the BarChartDataPoint interface.

```typescript
/**
 * Interface for BarChart data points.
 *
 * @interface
 * @property {number} value    - Data value for point.
 * @property {string} category - Corresponding category of data value.
 * @property {string} color    - Color corresponding to data point.
 */
interface BarChartDataPoint {
    value: number;
    category: string;
    color: string;
};
```

## Color Palette
`colorPalette` is a service that manages the colors used on your visual. An instance of it is available on `IVisualHost`.

## Assigning Color to Data Points
We defined `visualTransform` as a construct to convert `dataView` to a view model Bar Chart can use.
Since we iterate through the data points in, visualTransform` it is also the ideal place to assign colors.

```typescript
let colorPalette: IColorPalette = host.colorPalette; // host: IVisualHost
for (let i = 0, len = Math.max(category.values.length, dataValue.values.length); i < len; i++) {
    barChartDataPoints.push({
        category: category.values[i],
        value: dataValue.values[i],
        color: colorPalette.getColor(category.values[i]).value,
    });
}
```