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

All the examples below are related to SampleBarChart visual and its source code can be found [here](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/master/src/barChart.ts).

## Add Color to Data Points
Each data point will be represented by a different color. Add the color to the BarChartDataPoint interface.

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

## Assigning Color to Data Points
Let's specify dataPoints. In our case it should include category, value, and color (in other cases we can add some extra properties).

In SampleBarChart dataPoints calculation is encapsulated in `visualTransform` method because it is a part of viewModel Bar Chart can use.

Since we iterate through the data points in, `visualTransform` it is also the ideal place to assign colors.

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

Then you need to apply data from our dataPoints on [d3](https://d3js.org/) selection `barSelection` inside visual's update() method:
```typescript
// This code is actual for d3 v5
// in d3 v5 for this case we should use merge() after enter() and apply our changes on barSelectionMerged 
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

The full source code of SampleBar Chart can be found [here](https://github.com/microsoft/PowerBI-visuals-sampleBarChart.git).