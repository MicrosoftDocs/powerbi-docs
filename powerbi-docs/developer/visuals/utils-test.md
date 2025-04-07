---
title:  Introduction to usage of test utils in Power BI visual
description: Learn how to install, import, and use the Power BI visuals test utils for unit testing, including mocks and methods for elements.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 01/12/2024
#customer intent: As a Power BI visual developer, I want to learn how to use the Power BI visuals test utils so I can create more efficient visuals.
---

# Power BI visuals test utils

This article helps you install, import, and use the Power BI visuals test utils. These test utilities can be used for unit testing and include mocks and methods for elements, such as data views, selections, and color schemas.

## Prerequisites

To use this package, install:

* [node.js](https://nodejs.org), it's recommended to use the LTS version
* [npm](https://www.npmjs.com/), version 3.0.0 or higher
* The [`PowerBI-visuals-tools`](https://github.com/Microsoft/PowerBI-visuals-tools) package

## Installation

To install test utils and add its dependency to your *package.json*, run the following command from your Power BI visuals directory:

```bash
npm install powerbi-visuals-utils-testutils --save
```

The following provide descriptions and examples on the test utils public API.

## VisualBuilderBase

Used by **VisualBuilder** in unit tests with the most frequently used methods, `build`, `update`, and `updateRenderTimeout`. 

The `build` method returns a created instance of the visual.

The `enumerateObjectInstances` and `updateEnumerateObjectInstancesRenderTimeout` methods are required to check changes on the bucket and formatting options.

```typescript
abstract class VisualBuilderBase<T extends IVisual> {
    element: JQuery;
    viewport: IViewport;
    visualHost: IVisualHost;
    protected visual: T;
    constructor(width?: number, height?: number, guid?: string, element?: JQuery);
    protected abstract build(options: VisualConstructorOptions): T;
     nit(): void;
    destroy(): void;
    update(dataView: DataView[] | DataView): void;
    updateRenderTimeout(dataViews: DataView[] | DataView, fn: Function, timeout?: number): number;
    updateEnumerateObjectInstancesRenderTimeout(dataViews: DataView[] | DataView, options: EnumerateVisualObjectInstancesOptions, fn: (enumeration: VisualObjectInstance[]) => void, timeout?: number): number;
    updateFlushAllD3Transitions(dataViews: DataView[] | DataView): void;
    updateflushAllD3TransitionsRenderTimeout(dataViews: DataView[] | DataView, fn: Function, timeout?: number): number;
    enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstance[];
}
```

> [!NOTE]
> For more examples, see [Writing VisualBuilderBase unit tests](./unit-tests-introduction.md#create-a-visual-instance-builder) and a [Real usage VisualBuilderBase scenario](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/test/visualBuilder.ts).

## DataViewBuilder

Used by **TestDataViewBuilder**, this module provides a **CategoricalDataViewBuilder** class used in the `createCategoricalDataViewBuilder` method. It also specifies interfaces and methods required for working with mocked **DataView** in unit tests.

* `withValues` adds static series columns, and `withGroupedValues` adds dynamic series columns.

  Don't apply both dynamic series and static series in a visual **DataViewCategorical**. You can only use them both in the  **DataViewCategorical** query, where **DataViewTransform** is expected to split them into separate visual **DataViewCategorical** objects.

* `build` returns the **DataView** with metadata and **DataViewCategorical**.

  `build` returns **Undefined** if the combination of parameters is illegal, such as including both dynamic and static series when building the visual **DataView**.

```typescript
class CategoricalDataViewBuilder implements IDataViewBuilderCategorical {
    withCategory(options: DataViewBuilderCategoryColumnOptions): IDataViewBuilderCategorical;
    withCategories(categories: DataViewCategoryColumn[]): IDataViewBuilderCategorical;
    withValues(options: DataViewBuilderValuesOptions): IDataViewBuilderCategorical;
    withGroupedValues(options: DataViewBuilderGroupedValuesOptions): IDataViewBuilderCategorical;
    build(): DataView;
}

function createCategoricalDataViewBuilder(): IDataViewBuilderCategorical;
```

## TestDataViewBuilder

Used for **VisualData** creation in unit tests. When data is placed in data-field buckets, Power BI produces a categorical **DataView** object based on the data. The **TestDataViewBuilder** helps simulate categorical **DataView** creation.

```typescript
abstract class TestDataViewBuilder {
    static DataViewName: string;
    private aggregateFunction;
    static setDefaultQueryName(source: DataViewMetadataColumn): DataViewMetadataColumn;
    static getDataViewBuilderColumnIdentitySources(options: TestDataViewBuilderColumnOptions[] | TestDataViewBuilderColumnOptions): DataViewBuilderColumnIdentitySource[];
    static getValuesTable(categories?: DataViewCategoryColumn[], values?: DataViewValueColumn[]): any[][];
    static createDataViewBuilderColumnOptions(categoriesColumns: (TestDataViewBuilderCategoryColumnOptions | TestDataViewBuilderCategoryColumnOptions[])[], valuesColumns: (DataViewBuilderValuesColumnOptions | DataViewBuilderValuesColumnOptions[])[], filter?: (options: TestDataViewBuilderColumnOptions) => boolean, customizeColumns?: CustomizeColumnFn): DataViewBuilderAllColumnOptions;
    static setUpDataViewBuilderColumnOptions(options: DataViewBuilderAllColumnOptions, aggregateFunction: (array: number[]) => number): DataViewBuilderAllColumnOptions;
    static setUpDataView(dataView: DataView, options: DataViewBuilderAllColumnOptions): DataView;
    protected createCategoricalDataViewBuilder(categoriesColumns: (TestDataViewBuilderCategoryColumnOptions | TestDataViewBuilderCategoryColumnOptions[])[], valuesColumns: (DataViewBuilderValuesColumnOptions | DataViewBuilderValuesColumnOptions[])[], columnNames: string[], customizeColumns?: CustomizeColumnFn): IDataViewBuilderCategorical;
    abstract getDataView(columnNames?: string[]): DataView;
}
```

  The following lists the most frequently used interfaces when creating a `testDataView`:

  ```typescript
  interface TestDataViewBuilderColumnOptions extends DataViewBuilderColumnOptions {
      values: any[];
  }

  interface TestDataViewBuilderCategoryColumnOptions extends TestDataViewBuilderColumnOptions {
      objects?: DataViewObjects[];
      isGroup?: boolean;
  }

  interface DataViewBuilderColumnOptions {
      source: DataViewMetadataColumn;
  }

  interface DataViewBuilderSeriesData {
      values: PrimitiveValue[];
      highlights?: PrimitiveValue[];
      /** Client-computed maximum value for a column. */
      maxLocal?: any;
      /** Client-computed maximum value for a column. */
      minLocal?: any;
  }

  interface DataViewBuilderColumnIdentitySource {
      fields: any[];
      identities?: CustomVisualOpaqueIdentity[];
  }
  ```
   
> [!NOTE]
> For more examples, see [Writing TestDataViewBuilder unit tests](./unit-tests-introduction.md#how-to-add-static-data-for-unit-tests) and a [Real usage TestDataViewBuilder scenario](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/test/visualData.ts).

## Mocks

### MockIVisualHost

Implements **IVisualHost** to test Power BI visuals without external dependencies, such as the Power BI framework.

Useful methods include `createSelectionIdBuilder`, `createSelectionManager`, `createLocalizationManager`, and getter properties.

```typescript
import powerbi from "powerbi-visuals-api";

import VisualObjectInstancesToPersist = powerbi.VisualObjectInstancesToPersist;
import ISelectionIdBuilder = powerbi.visuals.ISelectionIdBuilder;
import ISelectionManager = powerbi.extensibility.ISelectionManager;
import IColorPalette = powerbi.extensibility.IColorPalette;
import IVisualEventService = powerbi.extensibility.IVisualEventService;
import ITooltipService = powerbi.extensibility.ITooltipService;
import IVisualHost = powerbi.extensibility.visual.IVisualHost;

class MockIVisualHost implements IVisualHost {
      constructor(
          colorPalette?: IColorPalette,
          selectionManager?: ISelectionManager,
          tooltipServiceInstance?: ITooltipService,
          localeInstance?: MockILocale,
          allowInteractionsInstance?: MockIAllowInteractions,
          localizationManager?: powerbi.extensibility.ILocalizationManager,
          telemetryService?: powerbi.extensibility.ITelemetryService,
          authService?: powerbi.extensibility.IAuthenticationService,
          storageService?: ILocalVisualStorageService,
          eventService?: IVisualEventService);
      createSelectionIdBuilder(): ISelectionIdBuilder;
      createSelectionManager(): ISelectionManager;
      createLocalizationManager(): ILocalizationManager;
      colorPalette: IColorPalette;
      locale: string;
      telemetry: ITelemetryService;
      tooltipService: ITooltipService;
      allowInteractios: boolean;
      storageService: ILocalVisualStorageService;
      eventService: IVisualEventService;
      persistProperties(changes: VisualObjectInstancesToPersist): void;
}
```
   
- `createVisualHost` creates and returns an instance of **IVisualHost**, actually **MockIVisualHost**.
  ```typescript
  function createVisualHost(locale?: Object, allowInteractions?: boolean, colors?: IColorInfo[], isEnabled?: boolean, displayNames?: any, token?: string): IVisualHost;
  ```

    Example:
    ```typescript
    import { createVisualHost } from "powerbi-visuals-utils-testutils"

    let host: IVisualHost = createVisualHost();
    ```

> [!IMPORTANT]
> **MockIVisualHost** is a fake implementation of **IVisualHost** and should only be used with unit tests.

### MockIColorPalette

Implements **IColorPalette** to test Power BI visuals without external dependencies, such as the Power BI framework.

**MockIColorPalette** provides useful properties for checking color schema or high-contrast mode in unit tests.

  ```typescript
  import powerbi from "powerbi-visuals-api";
  import IColorPalette = powerbi.extensibility.ISandboxExtendedColorPalette;
  import IColorInfo = powerbi.IColorInfo;

  class MockIColorPalette implements IColorPalette {
      constructor(colors?: IColorInfo[]);
      getColor(key: string): IColorInfo;
      reset(): IColorPalette;
      isHighContrastMode: boolean;
      foreground: {value: string};
      foregroundLight: {value: string};
      ...
      background: {value: string};
      backgroundLight: {value: string};
      ...
      shapeStroke: {value: string};
  }
  ```
  - `createColorPalette` creates and returns an instance of **IColorPalette**, actually **MockIColorPalette**.
    ```typescript
    function createColorPalette(colors?: IColorInfo[]): IColorPalette;
    ```

    Example:
    ```typescript
    import { createColorPalette } from "powerbi-visuals-utils-testutils"

    let colorPalette: IColorPalette = createColorPalette();
    ```
    
> [!IMPORTANT]
> **MockIColorPalette** is a fake implementation of **IColorPalette** and should only be used with unit tests.

### MockISelectionId

Implements **ISelectionId** to test Power BI visuals without external dependencies, such as the Power BI framework.

  ```typescript
  import powerbi from "powerbi-visuals-api";
  import Selector = powerbi.data.Selector;
  import ISelectionId = powerbi.visuals.ISelectionId;

  class MockISelectionId implements ISelectionId {
      constructor(key: string);
      equals(other: ISelectionId): boolean;
      includes(other: ISelectionId, ignoreHighlight?: boolean): boolean;
      getKey(): string;
      getSelector(): Selector;
      getSelectorsByColumn(): Selector;
      hasIdentity(): boolean;
  }
  ```

  - `createSelectionId` creates and returns an instance of **ISelectionId**, actually **MockISelectionId**.
    ```typescript
    function createSelectionId(key?: string): ISelectionId;
    ```

    Example:
    ```typescript
    import { createColorPalette } from "powerbi-visuals-utils-testutils"

    let selectionId: ISelectionId = createSelectionId();
    ```
    
> [!NOTE]
> **MockISelectionId** is a fake implementation of **ISelectionId** and should only be used with unit tests.

### MockISelectionIdBuilder

Implements **ISelectionIdBuilder** to test Power BI visuals without external dependencies, such as the Power BI framework. 

  ```typescript
  import DataViewCategoryColumn = powerbi.DataViewCategoryColumn;
  import DataViewValueColumn = powerbi.DataViewValueColumn;
  import DataViewValueColumnGroup = powerbi.DataViewValueColumnGroup;
  import DataViewValueColumns = powerbi.DataViewValueColumns;
  import ISelectionIdBuilder = powerbi.visuals.ISelectionIdBuilder;
  import ISelectionId = powerbi.visuals.ISelectionId;

  class MockISelectionIdBuilder implements ISelectionIdBuilder {
      withCategory(categoryColumn: DataViewCategoryColumn, index: number): this;
      withSeries(seriesColumn: DataViewValueColumns, valueColumn: DataViewValueColumn | DataViewValueColumnGroup): this;
      withMeasure(measureId: string): this;
      createSelectionId(): ISelectionId;
      withMatrixNode(matrixNode: DataViewMatrixNode, levels: DataViewHierarchyLevel[]): this;
      withTable(table: DataViewTable, rowIndex: number): this;
  }
  ```

  - `createSelectionIdBuilder` creates and returns an instance of **ISelectionIdBuilder**, actually **MockISelectionIdBuilder**.
    ```typescript
    function createSelectionIdBuilder(): ISelectionIdBuilder;
    ```

    Example:
    ```typescript
    import { selectionIdBuilder } from "powerbi-visuals-utils-testutils";

    let selectionIdBuilder = createSelectionIdBuilder();
    ```

> [!NOTE]
> **MockISelectionIdBuilder** is a fake implementation of **ISelectionIdBuilder** and should only be used with unit tests.

### MockISelectionManager

Implements **ISelectionManager** to test Power BI visuals without external dependencies, such as the Power BI framework. 

  ```typescript
  import powerbi from "powerbi-visuals-api";
  import IPromise = powerbi.IPromise;
  import ISelectionId = powerbi.visuals.ISelectionId;
  import ISelectionManager = powerbi.extensibility.ISelectionManager;

  class MockISelectionManager implements ISelectionManager {
      select(selectionId: ISelectionId | ISelectionId[], multiSelect?: boolean): IPromise<ISelectionId[]>;
      hasSelection(): boolean;
      clear(): IPromise<{}>;
      getSelectionIds(): ISelectionId[];
      containsSelection(id: ISelectionId): boolean;
      showContextMenu(selectionId: ISelectionId, position: IPoint): IPromise<{}>;
      registerOnSelectCallback(callback: (ids: ISelectionId[]) => void): void;
      simutateSelection(selections: ISelectionId[]): void;
  }
  ```

  - `createSelectionManager` creates and returns an instance of **ISelectionManager**, actually **MockISelectionManager**.
    ```typescript
    function createSelectionManager(): ISelectionManager
    ```

    Example:
    ```typescript
    import { createSelectionManager } from "powerbi-visuals-utils-testutils";

    let selectionManager: ISelectionManager = createSelectionManager();
    ```

> [!NOTE]
> **MockISelectionManager** is a fake implementation of **ISelectionManager** and should only be used with unit tests.

### MockILocale

  Sets the locale and changes it for your needs during a unit testing process.
  ```typescript
  class MockILocale {
      constructor(locales?: Object): void; // Default locales are en-US and ru-RU 
      locale(key: string): void;// setter property
      locale(): string; // getter property
  }
  ```
  - `createLocale` creates and returns an instance of **MockILocale**.
    ```typescript
    funciton createLocale(locales?: Object): MockILocale;
    ```

### <a id="mockitooltipservice"></a> MockITooltipService
Simulates `TooltipService` and calls it for your needs during a unit testing process.
  ```typescript
  class MockITooltipService implements ITooltipService {
      constructor(isEnabled: boolean = true);
      enabled(): boolean;
      show(options: TooltipShowOptions): void;
      move(options: TooltipMoveOptions): void;
      hide(options: TooltipHideOptions): void;
  }
  ```
  - `createTooltipService` creates and returns an instance of **MockITooltipService**.
    ```typescript
    function createTooltipService(isEnabled?: boolean): ITooltipService;
    ```

### MockIAllowInteractions

```typescript
export class MockIAllowInteractions {
    constructor(public isEnabled?: boolean); // false by default
}
```
  - `createAllowInteractions` creates and returns an instance of **MockIAllowInteractions**.
    ```typescript
    function createAllowInteractions(isEnabled?: boolean): MockIAllowInteractions;
    ```

### <a id="mockilocalizationmanager"></a> MockILocalizationManager
Provides basic abilities of **LocalizationManager**, which are needed for unit testing.
```typescript
class MockILocalizationManager implements ILocalizationManager {
    constructor(displayNames: {[key: string]: string});
    getDisplayName(key: string): string; // returns default or setted displayNames for localized elements
}
```
  - `createLocalizationManager` creates and returns an instance of **ILocalizationManager**, actually **MockILocalizationManager**.
    ```typescript
    function createLocalizationManager(displayNames?: any): ILocalizationManager;
    ```

    Example:
    ```typescript
    import { createLocalizationManager } from "powerbi-visuals-utils-testutils";
    let localizationManagerMock: ILocalizationManager = createLocalizationManager();
    ```

### MockITelemetryService
Simulates **TelemetryService** usage.
```typescript
class MockITelemetryService implements ITelemetryService {
    instanceId: string;
    trace(veType: powerbi.VisualEventType, payload?: string) {
    }
}
```
  Creation of `MockITelemetryService`
    ```typescript
    function createTelemetryService(): ITelemetryService;
    ```
### MockIAuthenticationService
Simulates the work of **AuthenticationService** by providing a mocked Microsoft Entra token.
```typescript
class MockIAuthenticationService implements IAuthenticationService  {
    constructor(token: string);
    getAADToken(visualId?: string): powerbi.IPromise<string>
}
```
  - `createAuthenticationService` creates and returns an instance of **IAuthenticationService**, actually **MockIAuthenticationService**.
    ```typescript
    function createAuthenticationService(token?: string): IAuthenticationService;
    ```

### MockIStorageService
Allows you to use **ILocalVisualStorageService** with the same behavior as **LocalStorage**.
```typescript
class MockIStorageService implements ILocalVisualStorageService {
  get(key: string): IPromise<string>;
  set(key: string, data: string): IPromise<number>;
  remove(key: string): void;
}
```
  - `createStorageService` creates and returns an instance of **ILocalVisualStorageService**, actually **MockIStorageService**.
    ```typescript
    function createStorageService(): ILocalVisualStorageService;
    ```

### MockIEventService
```typescript
import powerbi from "powerbi-visuals-api";
import IVisualEventService = powerbi.extensibility.IVisualEventService;
import VisualUpdateOptions = powerbi.extensibility.VisualUpdateOptions;

class MockIEventService implements IVisualEventService {
      renderingStarted(options: VisualUpdateOptions): void;
      renderingFinished(options: VisualUpdateOptions): void;
      renderingFailed(options: VisualUpdateOptions, reason?: string): void;
}
```
  - `createEventService` creates and returns an instance of **IVisualEventService**, actually **MockIEventService**.
    ```typescript
    function createEventService(): IVisualEventService;
    ```

## Utils

Utils include helper methods for Power BI visuals' unit testing, including helpers related to colors, numbers, and events.

- `renderTimeout` returns a timeout.
  ```typescript
  function renderTimeout(fn: Function, timeout: number = DefaultWaitForRender): number
  ```

- `testDom` helps set a fixture in unit tests.
  ```typescript
  function testDom(height: number | string, width: number | string): JQuery
  ```
  Example:
  ```typescript
  import { testDom }  from "powerbi-visuals-utils-testutils";
  describe("testDom", () => {
      it("should return an element", () => {
          let element: JQuery = testDom(500, 500);
          expect(element.get(0)).toBeDefined();
      });
  });
  ```

### Color-related helper methods

- `getSolidColorStructuralObject`
  ```typescript
  function getSolidColorStructuralObject(color: string): any
  ```
  Returns the following structure:

  ```json
  { solid: { color: color } }
  ```

- `assertColorsMatch` compares **RgbColor** objects parsed from input strings.
  ```typescript
  function assertColorsMatch(actual: string, expected: string, invert: boolean = false): boolean
  ```

- `parseColorString` parses color from the input string and returns it in specified interface **RgbColor**.
  ```typescript
  function parseColorString(color: string): RgbColor
  ```

### Number-related helper methods

- `getRandomNumbers` generates a random number using min and max values. You can specify `exceptionList` and provide a function for result change.
  ```typescript
  function getRandomNumber(
      min: number,
      max: number,
      exceptionList?: number[],
      changeResult: (value: any) => number = x => x): number
  ```

- `getRandomNumbers` provides an array of random numbers generated by the `getRandomNumber` method with specified min and max values.
  ```typescript
  function getRandomNumbers(count: number, min: number = 0, max: number = 1): number[]
  ```

### Event-related helper methods
The following methods are written for web page event simulation in unit tests.

- `clickElement` simulates a click on the specified element.
  ```typescript
  function clickElement(element: JQuery, ctrlKey: boolean = false): void
  ```

- `createTouch` returns a **Touch** object to help simulate a touch event.
  ```typescript
  function createTouch(x: number, y: number, element: JQuery, id: number = 0): Touch
  ```

- `createTouchesList` returns a list of simulated **Touch** events.
  ```typescript
  function createTouchesList(touches: Touch[]): TouchList
  ```

- `createContextMenuEvent` returns **MouseEvent**.
  ```typescript
  function createContextMenuEvent(x: number, y: number): MouseEvent
  ```

- `createMouseEvent` creates and returns **MouseEvent**.
  ```typescript
  function createMouseEvent(
      mouseEventType: MouseEventType,
      eventType: ClickEventType,
      x: number,
      y: number,
      button: number = 0): MouseEvent
  ```

- `createTouchEndEvent`
  ```typescript
  function createTouchEndEvent(touchList?: TouchList): UIEvent
  ```

- `createTouchMoveEvent`
  ```typescript
  function createTouchMoveEvent(touchList?: TouchList): UIEvent
  ```

- `createTouchStartEvent`
  ```typescript
  function createTouchStartEvent(touchList?: TouchList): UIEvent
  ```

### D3 event-related helper methods

The following methods are used to simulate D3 events in unit tests.

- `flushAllD3Transitions` forces all D3 transitions to complete.

  ```typescript
  function flushAllD3Transitions()
  ```
  
  > [!NOTE]
  > Normally, zero-delay transitions are executed after an instantaneous delay (<10 ms), but this can cause a brief flicker if the browser renders the page twice. Once at the end of the first event loop, then again immediately on the first timer callback.
  >
  > These flickers are more noticeable on IE and with a large number of webviews and aren't recommended for iOS.
  > 
  > By flushing the timer queue at the end of the first event loop, you can run any zero-delay transitions immediately and avoid the flicker.

The following methods are also included:
```typescript
function d3Click(element: JQuery, x: number, y: number, eventType?: ClickEventType, button?: number): void
function d3MouseUp(element: JQuery, x: number, y: number, eventType?: ClickEventType, button?: number): void
function d3MouseDown(element: JQuery, x: number, y: number, eventType?: ClickEventType, button?: number): void
function d3MouseOver(element: JQuery, x: number, y: number, eventType?: ClickEventType, button?: number): void
function d3MouseMove(element: JQuery, x: number, y: number, eventType?: ClickEventType, button?: number): void
function d3MouseOut(element: JQuery, x: number, y: number, eventType?: ClickEventType, button?: number): void
function d3KeyEvent(element: JQuery, typeArg: string, keyArg: string, keyCode: number): void
function d3TouchStart(element: JQuery, touchList?: TouchList): void
function d3TouchMove(element: JQuery, touchList?: TouchList): void
function d3TouchEnd(element: JQuery, touchList?: TouchList): void
function d3ContextMenu(element: JQuery, x: number, y: number): void
```

### Helper interfaces
The following interface and enumerations are used in the helper function.

```typescript
interface RgbColor {
    R: number;
    G: number;
    B: number;
    A?: number; 
}

enum ClickEventType {
    Default = 0,
    CtrlKey = 1,
    AltKey = 2,
    ShiftKey = 4,
    MetaKey = 8,
}

enum MouseEventType {
    click,
    mousedown,
    mouseup,
    mouseover,
    mousemove,
    mouseout,
}
```

## Related content

To write unit tests for webpack-based Power BI visuals, and unit test with `karma` and `jasmine`, see [Tutorial: Add unit tests for Power BI visual projects](./unit-tests-introduction.md).
