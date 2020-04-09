---
title: Add colors to Power BI custom visuals
description: This article describes how to add colors to your Power BI custom visuals and how to handle data points for a visual with color.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/27/2020
---

# Add colors to Power BI custom visuals

This article describes how to add colors to your visuals and how to handle data points for a color visual.

[IVisualHost](https://microsoft.github.io/PowerBI-visuals/api/references/ivisualhost/) exposes color as one of its services.
The example code in this article modifies the [SampleBarChart visual](https://github.com/microsoft/PowerBI-visuals-sampleBarChart).
For source code, see [barChart.ts](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts).

To get started creating visuals, see [Develop a Power BI visual](custom-visual-develop-tutorial.md).

## Add color to data points

A different color represents each data point.
Add the color to the `BarChartDataPoint` interface, as in the following example:

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

## Use the color palette service

The `colorPalette` service manages the colors used in your visual.
An instance of the service is available on `IVisualHost`.

Define it in the `update` method.

```typescript
constructor(options: VisualConstructorOptions) {
        this.host = options.host; // host: IVisualHost
        ...
    }

public update(options: VisualUpdateOptions) {

    let colorPalette: IColorPalette = host.colorPalette;
    ...
}
```

## Assigning color to data points

Next, specify `dataPoints`.
In this example, `dataPoints` includes value, category, and color.
`dataPoints` can also include other properties.

In `SampleBarChart`, the `visualTransform` method encapsulates the `dataPoints` calculation.
That method is a part of the Bar Chart viewmodel.
Because the method iterates through the `dataPoints` calculation in `visualTransform`, it's the ideal place to assign colors, as in the following code:

```typescript

public update(options: VisualUpdateOptions) {
    ....
    let viewModel: BarChartViewModel = visualTransform(options, this.host);
    ....
}

function visualTransform(options: VisualUpdateOptions, host: IVisualHost): BarChartViewModel {
    let colorPalette: IColorPalette = host.colorPalette; // host: IVisualHost
    for (let i = 0, len = Math.max(category.values.length, dataValue.values.length); i < len; i++) {
        barChartDataPoints.push({
            category: category.values[i],
            value: dataValue.values[i],
            color: colorPalette.getColor(category.values[i]).value,
        });
    }
}
```

Then apply data from `dataPoints` on the [d3](https://d3js.org/)-selection `barSelection` inside the `update` method:

```typescript
// This code is actual for d3 v5
// in d3 v5 for this case we should use merge() after enter() and apply changes on barSelectionMerged
this.barSelection = this.barContainer
    .selectAll('.bar')
    .data(this.barDataPoints);

const barSelectionMerged = this.barSelection
    .enter()
    .append('rect')
    .merge(<any>this.barSelection);

barSelectionMerged.classed('bar', true);

barSelectionMerged
.attr("width", xScale.bandwidth())
.attr("height", d => height - yScale(<number>d.value))
.attr("y", d => yScale(<number>d.value))
.attr("x", d => xScale(d.category))
.style("fill", (dataPoint: BarChartDataPoint) => dataPoint.color)
.style("stroke", (dataPoint: BarChartDataPoint) => dataPoint.strokeColor)
.style("stroke-width", (dataPoint: BarChartDataPoint) => `${dataPoint.strokeWidth}px`);

this.barSelection
    .exit()
    .remove();
```

## Next steps

[Read about capabilities of visuals](capabilities.md).
