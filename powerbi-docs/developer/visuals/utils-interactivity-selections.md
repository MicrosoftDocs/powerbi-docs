---
title: Power BI visuals interactivity utils
description: The article describes how to add selections into Power BI visuals by using interactivity utils
author: zBritva
ms.author: v-ilgali
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Microsoft Power BI visuals interactivity utils

InteractivityUtils is a set of functions and classes in order to simplify implementation of cross-selection and cross-filtering for Power BI custom visuals.

## Installation

> [!NOTE]
> If you continue use old version of powerbi-visuals-tools (version number less that 3.x.x) install the new version of the tools (3.x.x).

> [!IMPORTANT]
> The new updates of interactivity utilss will support only the latest version of tools. [Read more, how to update your visuals code to use with the latest tools](migrate-to-new-tools.md)

To install the package, you should run the following command in the directory with your current custom visual:

```bash
npm install powerbi-visuals-utils-interactivityutils --save
```

From version 3.0 or later, you also need to install ```powerbi-models``` to resolve dependencies.

```bash
npm install powerbi-models --save
```

To user interactivity utils you have to import required component in the source code of the visual.

```typescript
import { interactivitySelectionService } from "powerbi-visuals-utils-interactivityutils";
```

### Including CSS artifacts to the custom visual

To use the package with your custom visuals, you should import the following CSS file to `your.less` file:

`node_modules/powerbi-visuals-utils-interactivityutils/lib/index.css`

As a result you'll have the following file structure:

```less
@import (less) "node_modules/powerbi-visuals-utils-interactivityutils/lib/index.css";
```

> [!NOTE]
> You should import .css file as .less file, because Power BI Visuals Tools wraps the external CSS rules.

## Usage

### Define interface for data points

Usually data points contain selections and values. The interface extends `SelectableDataPoint` interface. `SelectableDataPoint` already contains properties:

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

The first step of using interactivity utils is creating instance of interactivity utils and save object as property of the visual

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

The second step is creating class of  or uses base behavior class:

> [!NOTE]
> BaseBehavior introduced in [5.6.x version of interactivity utils](https://www.npmjs.com/package/powerbi-visuals-utils-interactivityutils/v/5.6.0). If you use old version, create behaviour class from sample below (`BaseBehavior` class is same):

Define interface for options of behavior class:

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

Define class for `visual behaviour`. The class responsible to handle `click`, `contextmenu` mouse events.
When use clicks to data elements the visual calls selection handler to select data points. Or clear selection, if user clicks to background element of the visual. And the class has correspond methods: `bindClick`, `bindClearCatcher`, `bindContextMenu`.

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

The interactivity utils call `bindEvents` methods to assign functions to handlers, add calls of `bindClick`, `bindClearCatcher`, and `bindContextMenu` into  the `bindEvents` method:

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

The `renderSelection` method responsible for updating visuals state of elements in the chart.

The sample of implementation `renderSelection` method:

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

The last step is creating instance of `visual behavior` and call of `bind` method of interactivity utils instance:

```typescript
this.interactivity.bind(<BaseBehaviorOptions<VisualDataPoint>>{
    behavior: this.behavior,
    dataPoints: this.categories,
    clearCatcherSelection: select(this.target),
    elementsSelection: selectionMerge
});
```

* `selectionMerge` is D3 selection object, witch represents all selectable elements on the visual.

* `select(this.target)` is D3 selection object, witch represents main DOm elemtns of the visual.

* `this.categories` data points with elements, where interface is `VisualDataPoint` (or `categories: VisualDataPoint[];`)

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

Now, your visual is ready to handler selection.

## Next steps

* [Read how to handle selections on bookmarks switching](bookmarks-support.md#visuals-with-selection)

* [Read how to add context menu for visuals data points](context-menu.md)

* [Read how to use selection manager to add selections into Power BI Visuals](selection-api.md)
