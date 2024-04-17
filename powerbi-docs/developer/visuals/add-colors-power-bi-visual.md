---
title: Add colors to your Power BI custom visuals
description: This article describes how to add colors to your Power BI custom visuals and how to handle data points for a visual with color.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 1/10/2024
---

# Add colors to your Power BI visuals

This article describes how to add colors to your custom visuals and how to handle data points for a visual that has defined colors.

[`IVisualHost`](visual-api.md#visualconstructoroptions), the collection of properties and services that interact with the visual host, can define colors in custom visuals with the `colorPalette` service. The example code in this article modifies the [SampleBarChart visual](https://github.com/microsoft/PowerBI-visuals-sampleBarChart). For the SampleBarChart visual source code, see [barChart.ts](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts).

To get started creating visuals, see [Developing a a Power BI circle card visual](develop-circle-card.md).

## Add color to data points

To represent each data point in a different color, add the `color` variable to the `BarChartDataPoint` interface, as shown in the following example:

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

The `colorPalette` service manages the colors used in your visual. An instance of the `colorPalette` service is available on `IVisualHost`.

Define the color palette in the `update` method with the following code:

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

Next, specify `dataPoints`. In this example, each of the `dataPoints` has a defined value, category, and color property. `dataPoints` can also include other properties.

In `SampleBarChart`, the `visualTransform` method is a part of the Bar Chart viewmodel. Because the `visualTransform` method iterates through all the `dataPoints` calculations, it's the ideal place to assign colors, as in the following code:

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

Then, apply the data from `dataPoints` to the [d3](https://d3js.org/)-selection `barSelection` inside the `update` method:

```typescript
// This code is for d3 v5
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

## Related content

* [Capabilities and properties of Power BI visuals](capabilities.md).
* [How to debug Power BI visuals](visuals-how-to-debug.md)
