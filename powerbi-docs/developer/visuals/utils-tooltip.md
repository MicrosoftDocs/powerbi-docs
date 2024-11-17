---
title:  Introduction to tooltip utils in Power BI visuals
description: Learn how to install, import, and use tooltip utils to simplify tooltip customization in your Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 01/10/2024
#customer intent: As a Power BI developer, I want to learn how to use tooltip utils to simplify tooltip customization in my Power BI visuals.
---
# Tooltip utils

This article will help you to install, import, and use tooltip utils. This util is useful for tooltip customizations in Power BI visuals.

## Prerequisites

To use the package, you need:

* [Node.js](https://nodejs.org) (we recommend the latest LTS version)
* [npm](https://www.npmjs.com/) (the minimal supported version is 3.0.0)
* The custom visual created by [`PowerBI-visuals-tools`](https://www.npmjs.com/package/powerbi-visuals-tools)

## Installation

To install the package, you should run the following command in the directory with your current visual:

```bash
npm install powerbi-visuals-utils-tooltiputils --save
```

This command installs the package and adds a package as a dependency to your `package.json` file.

## Usage

> The Usage Guide describes a public API of the package. You will find a description and some examples for each public interface of the package.

This package provides you with a way to create `TooltipServiceWrapper` and methods to help handle tooltip actions. It uses tooltip interfaces - `ITooltipServiceWrapper`, `TooltipEventArgs`, `TooltipEnabledDataPoint`. 

It has specific methods (touch events handlers) related to mobile development: `touchEndEventName`, `touchStartEventName`, `usePointerEvents`.

`TooltipServiceWrapper` provides the simplest way to manipulate tooltips.

This module provides the following interface and function:

* [ITooltipServiceWrapper](#itooltipservicewrapper)
  * [addTooltip](#itooltipservicewrapperaddtooltip)
  * [hide](#itooltipservicewrapperhide)

* [Interfaces](#interfaces)
  * [TooltipEventArgs](#tooltipeventargs)
  * [TooltipEnabledDataPoint](#tooltipenableddatapoint)
  * [TooltipServiceWrapperOptions](#tooltipservicewrapperoptions)
* [Touch events](#touch-events)

### `createTooltipServiceWrapper`

This function creates an instance of `ITooltipServiceWrapper`.

```typescript
function createTooltipServiceWrapper(tooltipService: ITooltipService, rootElement: Element, handleTouchDelay?: number,  getEventMethod?: () => MouseEvent): ITooltipServiceWrapper;
```

The ```ITooltipService``` is available in IVisualHost.

Example:

```typescript
import { createTooltipServiceWrapper } from "powerbi-visuals-utils-tooltiputils";

export class YourVisual implements IVisual {
    // implementation of IVisual.

    constructor(options: VisualConstructorOptions) {
        createTooltipServiceWrapper(
            options.host.tooltipService,
            options.element);

        // returns: an instance of ITooltipServiceWrapper.
    }
}
```

See an example of the custom visual [here](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/src/gantt.ts#L391).

### `ITooltipServiceWrapper`

This interface describes public methods of the TooltipService.

```typescript
interface ITooltipServiceWrapper {
    addTooltip<T>(selection: d3.Selection<any, any, any, any>, getTooltipInfoDelegate: (args: TooltipEventArgs<T>) => powerbi.extensibility.VisualTooltipDataItem[], getDataPointIdentity?: (args: TooltipEventArgs<T>) => powerbi.visuals.ISelectionId, reloadTooltipDataOnMouseMove?: boolean): void;
    hide(): void;
}
```

#### `ITooltipServiceWrapper.addTooltip`

This method adds tooltips to the current selection.

```typescript
addTooltip<T>(selection: d3.Selection<any>, getTooltipInfoDelegate: (args: TooltipEventArgs<T>) => VisualTooltipDataItem[], getDataPointIdentity?: (args: TooltipEventArgs<T>) => ISelectionId, reloadTooltipDataOnMouseMove?: boolean): void;
```

Example:

```typescript
import { createTooltipServiceWrapper, TooltipEventArgs, ITooltipServiceWrapper, TooltipEnabledDataPoint } from "powerbi-visuals-utils-tooltiputils";

let bodyElement = d3.select("body");

let element = bodyElement
    .append("div")
    .style({
        "background-color": "green",
        "width": "150px",
        "height": "150px"
    })
    .classed("visual", true)
    .data([{
        tooltipInfo: [{
            displayName: "Power BI",
            value: 2016
        }]
    }]);

let tooltipServiceWrapper: ITooltipServiceWrapper = createTooltipServiceWrapper(tooltipService, bodyElement.get(0)); // tooltipService is from the IVisualHost.

tooltipServiceWrapper.addTooltip<TooltipEnabledDataPoint>(element, (eventArgs: TooltipEventArgs<TooltipEnabledDataPoint>) => {
    return eventArgs.data.tooltipInfo;
});

// You will see a tooltip if you mouseover the element.
```

See an example of the custom visual [here](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/src/gantt.ts#L2931).

See an example of tooltip customization in a Gantt custom visual [here](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/src/gantt.ts#L573-L648).

### `ITooltipServiceWrapper.hide`

This method hides the tooltip.

```typescript
hide(): void;
```

Example:

```typescript
import {createTooltipServiceWrapper} from "powerbi-visuals-utils-tooltiputils";

let tooltipServiceWrapper = createTooltipServiceWrapper(options.host.tooltipService, options.element); // options are from the VisualConstructorOptions.

tooltipServiceWrapper.hide();
```

### `Interfaces`

Interfaces are used during TooltipServiceWrapper creation and when it's used. They were mentioned in examples from previous articles [here](#itooltipservicewrapperaddtooltip).

#### `TooltipEventArgs`
```typescript
interface TooltipEventArgs<TData> {
    data: TData;
    coordinates: number[];
    elementCoordinates: number[];
    context: HTMLElement;
    isTouchEvent: boolean;
}
```

#### `TooltipEnabledDataPoint`
```typescript
interface TooltipEnabledDataPoint {
    tooltipInfo?: powerbi.extensibility.VisualTooltipDataItem[];
}
```

#### `TooltipServiceWrapperOptions`
```typescript
interface TooltipServiceWrapperOptions {
    tooltipService: ITooltipService;
    rootElement: Element;
    handleTouchDelay: number;
```

### `Touch events`

Now tooltip utils can handle several touch events that are useful for mobile development.

#### `touchStartEventName`

```typescript
function touchStartEventName(): string
```

This method returns a touch start event name.

#### `touchEndEventName`

```typescript
function touchEndEventName(): string
```

This method returns a touch end event name.

#### `usePointerEvents`

```typescript
function usePointerEvents(): boolean
```

This method returns the current touchStart event related to a pointer or not.
