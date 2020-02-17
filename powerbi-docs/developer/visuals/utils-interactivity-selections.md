---
title: Power BI visuals interactivity utils
description: The article describes how to add selections into Power BI visuals by using interactivity utils
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
manager: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Microsoft Power BI visuals interactivity utils

InteractivityUtils is a set of functions and classes in order to simplify the implementation of cross-selection and cross-filtering for Power BI custom visuals.

## Installation

> [!NOTE]
> If you continue to use the old version of powerbi-visuals-tools (version number less that 3.x.x) install the new version of the tools (3.x.x).

> [!IMPORTANT]
> The new updates of interactivity utils will support only the latest version of tools. [Read more, how to update your visual's code to use with the latest tools](migrate-to-new-tools.md)

To install the package, you should run the following command in the directory with your current custom visual:

```bash
npm install powerbi-visuals-utils-interactivityutils --save
```

From version 3.0 or later, you also need to install ```powerbi-models``` to resolve dependencies.

```bash
npm install powerbi-models --save
```

To use interactivity utils, you have to import the required component in the source code of the visual.

```typescript
import { interactivitySelectionService } from "powerbi-visuals-utils-interactivityutils";
```

### Including CSS artifacts to the custom visual

To use the package with your custom visuals, you should import the following CSS file to `your.less` file:

`node_modules/powerbi-visuals-utils-interactivityutils/lib/index.css`

As a result, you'll have the following file structure:

```less
@import (less) "node_modules/powerbi-visuals-utils-interactivityutils/lib/index.css";
```

> [!NOTE]
> You should import .css file as .less file because Power BI Visuals Tools wraps the external CSS rules.

## Usage

### Define interface for data points

Usually, data points contain selections and values. The interface extends `SelectableDataPoint` interface. `SelectableDataPoint` already contains properties:

```typescript
  /** Flag for identifying that data point was selected */
  selected: boolean;
  /** Identity for identifying the selectable data point for selection purposes */
  identity: powerbi.extensibility.ISelectionId;
  /**
   * A specific identity for when data points exist at a finer granularity than
   * selection is performed.  For example, if your data points should select based
   * only on series even if they exist as category/series intersections.
   */
  specificIdentity?: powerbi.extensibility.ISelectionId;
```

The first step of using interactivity utils is creating an instance of interactivity utils and save the object as a property of the visual

```typescript
export class Visual implements IVisual {
  // ...
  private interactivity: interactivityBaseService.IInteractivityService<VisualDataPoint>;
  // ...
  constructor(options: VisualConstructorOptions) {
      // ...
      this.interactivity = interactivitySelectionService.createInteractivitySelectionService(this.host);
      // ...
  }
}
```

```typescript
import { interactivitySelectionService } from "powerbi-visuals-utils-interactivityutils";

export interface VisualDataPoint extends interactivitySelectionService.SelectableDataPoint {
    value: powerbi.PrimitiveValue;
}
```

The second step is to extend base behavior class:

> [!NOTE]
> BaseBehavior introduced in [5.6.x version of interactivity utils](https://www.npmjs.com/package/powerbi-visuals-utils-interactivityutils/v/5.6.0). If you use the old version, create behavior class from the sample below (`BaseBehavior` class is same):

Define the interface for options of behavior class:

```typescript
import { SelectableDataPoint } from "./interactivitySelectionService";

import {
    IBehaviorOptions,
    BaseDataPoint
} from "./interactivityBaseService";

export interface BaseBehaviorOptions<SelectableDataPointType extends BaseDataPoint> extends IBehaviorOptions<SelectableDataPointType> {
    /** D3 selection object of main elements on the chart */
    elementsSelection: Selection<any, SelectableDataPoint, any, any>;
    /** D3 selection object of some element on backgroup to hadle click of reset selection */
    clearCatcherSelection: d3.Selection<any, any, any, any>;
}
```

Define a class for `visual behavior`. The class is responsible to handle `click`, `contextmenu` mouse events.
When a user clicks to data elements the visual calls then selection handler to select data points. if the user clicks to the background element of the visual, it calls the clear selection handler. And the class has correspond methods: `bindClick`, `bindClearCatcher`, `bindContextMenu`.

```typescript
export class Behavior<SelectableDataPointType extends BaseDataPoint> implements IInteractiveBehavior {
    /** D3 selection object of main elements on the chart */
    protected options: BaseBehaviorOptions<SelectableDataPointType>;
    protected selectionHandler: ISelectionHandler;

    protected bindClick() {
      // ...
    }

    protected bindClearCatcher() {
      // ...
    }

    protected bindContextMenu() {
      // ...
    }

    public bindEvents(
        options: BaseBehaviorOptions<SelectableDataPointType>,
        selectionHandler: ISelectionHandler): void {
      // ...
    }

    public renderSelection(hasSelection: boolean): void {
      // ...
    }
}
```

or you can extend `BaseBehavior` class:

```typescript
import powerbi from "powerbi-visuals-api";
import { interactivitySelectionService, baseBehavior } from "powerbi-visuals-utils-interactivityutils";

export interface VisualDataPoint extends interactivitySelectionService.SelectableDataPoint {
    value: powerbi.PrimitiveValue;
}

export class Behavior extends baseBehavior.BaseBehavior<VisualDataPoint> {
  // ...
}
```

To handle click on elements, call `on` method of D3 selection object (for elementsSelection and clearCatcherSelection too):

```typescript
protected bindClick() {
  const {
      elementsSelection
  } = this.options;

  elementsSelection.on("click", (datum) => {
      const mouseEvent: MouseEvent = getEvent() as MouseEvent || window.event as MouseEvent;
      mouseEvent && this.selectionHandler.handleSelection(
          datum,
          mouseEvent.ctrlKey);
  });
}
```

Add similar handler for `contextmenu` event to call `showContextMenu` method of the selection manager:

```typescript
protected bindContextMenu() {
    const {
        elementsSelection
    } = this.options;

    elementsSelection.on("contextmenu", (datum) => {
        const event: MouseEvent = (getEvent() as MouseEvent) || window.event as MouseEvent;
        if (event) {
            this.selectionHandler.handleContextMenu(
                datum,
                {
                    x: event.clientX,
                    y: event.clientY
                });
            event.preventDefault();
        }
    });
}
```

The interactivity utils calls `bindEvents` methods to assign functions to handlers, add calls of `bindClick`, `bindClearCatcher`, and `bindContextMenu` into  the `bindEvents` method:

```typescript
  public bindEvents(
      options: BaseBehaviorOptions<SelectableDataPointType>,
      selectionHandler: ISelectionHandler): void {

      this.options = options;
      this.selectionHandler = selectionHandler;

      this.bindClick();
      this.bindClearCatcher();
      this.bindContextMenu();
  }
```

The `renderSelection` method is responsible for updating the visual state of elements in the chart.

Sample implementation `renderSelection` method:

```typescript
public renderSelection(hasSelection: boolean): void {
    this.options.elementsSelection.style("opacity", (category: any) => {
        if (category.selected) {
            return 0.5;
        } else {
            return 1;
        }
    });
}
```

The last step is creating an instance of `visual behavior` and call of `bind` method of interactivity utils instance:

```typescript
this.interactivity.bind(<BaseBehaviorOptions<VisualDataPoint>>{
    behavior: this.behavior,
    dataPoints: this.categories,
    clearCatcherSelection: select(this.target),
    elementsSelection: selectionMerge
});
```

* `selectionMerge` is D3 the selection object, which represents all selectable elements on the visual.

* `select(this.target)` is D3 the selection object, which represents the main DOM elements of the visual.

* `this.categories` are data points with elements, where the interface is `VisualDataPoint` (or `categories: VisualDataPoint[];`)

* `this.behavior` is a new instance of `visual behavior`

  created in the constructor of the visual:

  ```typescript
  export class Visual implements IVisual {
    // ...
    constructor(options: VisualConstructorOptions) {
        // ...
        this.behavior = new Behavior();
    }
    // ...
  }
  ```

Now, your visual is ready to handle selection.

## Next steps

* [Read how to handle selections on bookmarks switching](bookmarks-support.md#visuals-with-selection)

* [Read how to add context menu for visuals data points](context-menu.md)

* [Read how to use selection manager to add selections into Power BI Visuals](selection-api.md)
