---
title: Power BI visuals interactivity utils
description: Learn how the interactivity utils can help simplify the implementation of cross-selection and cross-filtering in your Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: rkarlin
manager: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/10/2024
#customer intent: As a Power BI visual developer, I want to learn how to use the interactivity utils to simplify the implementation of cross-selection and cross-filtering in my Power BI visuals.
---

# Power BI visuals interactivity utils

> [!NOTE]
> InteractivityService has been deprecated.

Interactivity utils (`InteractivityUtils`) is a set of functions and classes that can be used to simplify the implementation of cross-selection and cross-filtering.

> [!NOTE]
> The latest updates of interactivity utils support only the latest version of tools (3.x.x and above).

## Installation

1. To install the package, run the following command in the directory with your current Power BI visual project.

    ```bash
    npm install powerbi-visuals-utils-interactivityutils --save
    ```

2. If you're using version 3.0 or later of the tool, install `powerbi-models` to resolve dependencies.

    ```bash
    npm install powerbi-models --save
    ```

3. To use interactivity utils, import the required component in the source code of the Power BI visual.

    ```typescript
    import { interactivitySelectionService } from "powerbi-visuals-utils-interactivityutils";
    ```

### Include CSS files

To use the package with your Power BI visual, import the following CSS file to your `.less` file.

`node_modules/powerbi-visuals-utils-interactivityutils/lib/index.css`

Import the CSS file as a `.less` file because the Power BI visuals tool wraps external CSS rules.

```less
@import (less) "node_modules/powerbi-visuals-utils-interactivityutils/lib/index.css";
```

## SelectableDataPoint properties

Usually, data points contain selections and values. The interface extends the `SelectableDataPoint` interface.

`SelectableDataPoint` already contains properties as follows:

```typescript
  /** Flag for identifying that a data point was selected */
  selected: boolean;

  /** Identity for identifying the selectable data point for selection purposes */
  identity: powerbi.extensibility.ISelectionId;

  /*
   * A specific identity for when data points exist at a finer granularity than
   * selection is performed.  For example, if your data points select based
   * only on series, even if they exist as category/series intersections.
   */

  specificIdentity?: powerbi.extensibility.ISelectionId;
```

## Defining an interface for data points

1. Create an instance of interactivity utils and save the object as a property of the visual.

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

2. Extend the base behavior class.

    > [!NOTE]
    > `BaseBehavior` was introduced in the [5.6.x version of interactivity utils](https://www.npmjs.com/package/powerbi-visuals-utils-interactivityutils/v/5.6.0). If you use an older version, create a behavior class from the following sample.

3. Define the interface for the behavior class options.

    ```typescript
    import { SelectableDataPoint } from "./interactivitySelectionService";

    import {
        IBehaviorOptions,
        BaseDataPoint
    } from "./interactivityBaseService";

    export interface BaseBehaviorOptions<SelectableDataPointType extends BaseDataPoint> extends IBehaviorOptions<SelectableDataPointType> {

    /** d3 selection object of the main elements on the chart */
    elementsSelection: Selection<any, SelectableDataPoint, any, any>;

    /** d3 selection object of some elements on backgroup, to hadle click of reset selection */
    clearCatcherSelection: d3.Selection<any, any, any, any>;
    }
    ```

4. Define a class for `visual behavior`. Or, extend the `BaseBehavior` class.

    **Define a class for `visual behavior`**

    The class is responsible for `click` and `contextmenu` mouse events.

    When a user clicks data elements, the visual calls the selection handler to select data points. If the user clicks the background element of the visual, it calls the clear selection handler.

    The class has the following correspond methods:
    * `bindClick`
    * `bindClearCatcher`
    * `bindContextMenu`.

    ```typescript
    export class Behavior<SelectableDataPointType extends BaseDataPoint> implements IInteractiveBehavior {

        /** d3 selection object of main elements in the chart */
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

    **Extend the `BaseBehavior` class**

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

5. To handle a click on elements, call the *d3* selection object `on` method. This also applies for `elementsSelection` and `clearCatcherSelection`.

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

6. Add a similar handler for the `contextmenu` event, to call the selection manager's `showContextMenu` method.

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

7. To assign functions to handlers, the interactivity utils calls the `bindEvents` method. Add the following calls to the `bindEvents` method:
    * `bindClick`
    * `bindClearCatcher`
    * `bindContextMenu`

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

8. The `renderSelection` method is responsible for updating the visual state of elements in the chart. A sample implementation of `renderSelection` follows.

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

9. The last step is creating an instance of `visual behavior`, and calling the `bind` method of the interactivity utils instance.

    ```typescript
    this.interactivity.bind(<BaseBehaviorOptions<VisualDataPoint>>{
        behavior: this.behavior,
        dataPoints: this.categories,
        clearCatcherSelection: select(this.target),
        elementsSelection: selectionMerge
    });
    ```

    * `selectionMerge` is the *d3* selection object, which represents all the visual's selectable elements.
    * `select(this.target)` is the *d3* selection object, which represents the visual's main DOM elements.
    * `this.categories` are data points with elements, where the interface is `VisualDataPoint` or `categories: VisualDataPoint[];`.
    * `this.behavior` is a new instance of `visual behavior` created in the constructor of the visual, as shown:

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

## Related content

* [Visuals with selection](bookmarks-support.md#visuals-with-selection)

* [Add a context menu to your Power BI visual](context-menu.md)

* [Add interactivity into visual by Power BI visuals selection](selection-api.md)
