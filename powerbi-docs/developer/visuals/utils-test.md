---
title:  Introduction to usage of test utils in Power BI visual
description: This article describes how to use test utils  simplify mocks and specific methods usage in unit testing for Power BI visuals
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 02/14/2020
---

# Power BI visuals test utils

This article will help you to install, import, and use Power BI visuals test utils. The test utils are used for unit testing and include the mocks and methods required for dataView, selections, color schemas testing, and etc.

For more information on writing unit tests for webpack-based Power BI Custom Visuals and to explain unit testing with `karma` and `jasmine`, see [Tutorial: Add unit tests for Power BI visual projects](./unit-tests-introduction.md). Basic samples of writing unit tests using `VisualBuilderBase` and `testDataViewBuilder` can be found [here](./unit-tests-introduction.md)

## Requirements

To use the package, you should install the following packages:

* [node.js](https://nodejs.org) (latest LTS version recommended)
* [npm](https://www.npmjs.com/) (version 3.0.0, minimum supported)
* the Custom Visual created by [PowerBI-visuals-tools](https://github.com/Microsoft/PowerBI-visuals-tools)

## Installation

To install the package, run the following command in your current Custom Visual directory:

```bash
npm install powerbi-visuals-utils-testutils --save
```

This command installs the package and adds it as a dependency to your ```package.json```.

## Usage
The Usage Guide describes a public API of the package. Here you'll find a description and examples for each public interface of the package.

Test utils includes: [VisualBuilderBase](#visualbuilderbase), [dataViewBuilder](#dataviewbuilder), [testDataViewBuilder](#testdataviewbuilder), [Mocks](#mocks), [Utils](#utils)

* ## VisualBuilderBase

  This class and its methods are used by `VisualBuilder` in unit-tests.

  The most frequently used for unit testing methods of this class are `build`, `update`, and `updateRenderTimeout`.
  The `build` method returns created instance of the visual.
  `EnumerateObjectInstances` and `updateEnumerateObjectInstancesRenderTimeout` methods are always used when you need to check some bucket's or formatting option's change.

  ```typescript
  abstract class VisualBuilderBase<T extends IVisual> {
      element: JQuery;
      viewport: IViewport;
      visualHost: IVisualHost;
      protected visual: T;
      constructor(width?: number, height?: number, guid?: string, element?: JQuery);
      protected abstract build(options: VisualConstructorOptions): T;
      init(): void;
      destroy(): void;
      update(dataView: DataView[] | DataView): void;
      updateRenderTimeout(dataViews: DataView[] | DataView, fn: Function, timeout?: number): number;
      updateEnumerateObjectInstancesRenderTimeout(dataViews: DataView[] | DataView, options: EnumerateVisualObjectInstancesOptions, fn: (enumeration: VisualObjectInstance[]) => void, timeout?: number): number;
      updateFlushAllD3Transitions(dataViews: DataView[] | DataView): void;
      updateflushAllD3TransitionsRenderTimeout(dataViews: DataView[] | DataView, fn: Function, timeout?: number): number;
      enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstance[];
  }
  ```

  Basic samples of writing unit tests using `VisualBuilderBase` can be found [here](./unit-tests-introduction.md#create-a-visual-instance-builder)

  See an example of real usage [here](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/test/visualBuilder.ts)

* ## dataViewBuilder

  This module provides a `CategoricalDataViewBuilder` class used by `testDataViewBuilder` function in `createCategoricalDataViewBuilder` method. Also it specifies interfaces and methods required for working with mocked dataView in unit-tests.

  This module is used by `testDataViewBuilder`.

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

  * `withValues` method adds static series columns. 
  * `withGroupedValues` adds dynamic series columns.
  * `build` returns the DataView with metadata and DataViewCategorical.

    `Undefined` is returned if the combination of parameters is illegal, such as both dynamic and static series are included when building a visual DataView.

  * It is prohibited to apply both dynamic series and static series in a visual `DataViewCategorical`. It is only possible to use them both in a query `DataViewCategorical`, where `DataViewTransform` is expected to split them up into a separate visual `DataViewCategorical` objects.

* ## testDataViewBuilder

  This class and its methods are used for `VisualData` creation in unit tests.
  When you put data into data-field buckets, Power BI produces a categorical data view object based on your data. The `TestDataViewBuilder` class can help you to simulate categorical dataView creation.

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

  The following lists the most frequently used interfaces in `testDataView` creation.

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

  Basic samples of writing unit tests using `testDataViewBuilder` can be found [here](./unit-tests-introduction.md#how-to-add-static-data-for-unit-tests)

  See an example of real usage [here](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/test/visualData.ts)

* ## Mocks

  This package contains the following mocks and methods: [MockIVisualHost](#mockivisualhost), [MockIColorPalette](#mockicolorpalette), [MockISelectionId](#mockiselectionid), [MockISelectionIdBuilder](#mockiselectionidbuilder), [MockISelectionManager](#mockiselectionmanager), [MockILocale](#mockilocale), [MockITooltipService](#mockitooltipservice), [MockIAllowInteractions](#mockiallowinteractions), [MockILocalizationManager](#mockilocalizationmanager), [MockITelemetryService](#mockitelemetryservice), [MockIAuthenticationService](#mockiauthenticationservice)

  * ### MockIVisualHost
  
    This class implements `IVisualHost` in order to test Custom Visuals without external dependencies such as Power BI Framework. Please note, it's a fake implementation of `IVisualHost`, in other words, it should be used only with unit-tests.

    Pay attention at useful methods `createSelectionIdBuilder`, `createSelectionManager`, `createLocalizationManager` and getter properties.

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
    `createVisualHost`

    This function creates and returns instance of **IVisualHost** (actually it is `MockIVisualHost`).
    ```typescript
    function createVisualHost(locale?: Object, allowInteractions?: boolean, colors?: IColorInfo[], isEnabled?: boolean, displayNames?: any, token?: string): IVisualHost;
    ```

    Example
    ```typescript
    import { createVisualHost } from "powerbi-visuals-utils-testutils"

    let host: IVisualHost = createVisualHost();
    ```

  * ### MockIColorPalette

    This class implements `IColorPalette` in order to test Custom Visuals without external dependencies such as Power BI Framework. Please note, it's a fake implementation of `IColorPalette`, in other words, it should be used only with unit-tests.

    Please pay attention that `MockIColorPalette` provides useful properties for checking color schema or high-contrast mode in unit-tests.
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
    `createColorPalette`

    This function creates and returns an instance of **IColorPalette** (it's actually the `MockIColorPalette`).
    ```typescript
    function createColorPalette(colors?: IColorInfo[]): IColorPalette;
    ```

    Example
    ```typescript
    import { createColorPalette } from "powerbi-visuals-utils-testutils"

    let colorPalette: IColorPalette = createColorPalette();
    ```

  * ### MockISelectionId

    This class implements `ISelectionId` in order to test Custom Visuals without external dependencies, such as Power BI Framework.

    > [!NOTE]
    > `MockISelectionId` is a fake implementation of `IVisualHost` and should only be used with unit-tests.

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

    `createSelectionId`

    This function creates and returns an instance of **ISelectionId** (it's actually `MockISelectionId)`.
    ```typescript
    function createSelectionId(key?: string): ISelectionId;
    ```

    Example
    ```typescript
    import { createColorPalette } from "powerbi-visuals-utils-testutils"

    let selectionId: ISelectionId = createSelectionId();
    ```

  * ### MockISelectionIdBuilder

    This class implements `ISelectionIdBuilder` in order to test Custom Visuals without external dependencies such as Power BI Framework. Please note that it's a fake implementation of `ISelectionIdBuilder`, in other words, it should be used only with unit-tests.

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

    `createSelectionIdBuilder`

    This function creates and returns an instance of `ISelectionIdBuilder` (it's actually `MockISelectionIdBuilder`).
    ```typescript
    function createSelectionIdBuilder(): ISelectionIdBuilder;
    ```

    Example
    ```typescript
    import { selectionIdBuilder } from "powerbi-visuals-utils-testutils";

    let selectionIdBuilder = createSelectionIdBuilder();
    ```

  * ### MockISelectionManager

    This class implements `ISelectionManager` in order to test Custom Visuals without external dependencies such as Power BI Framework. Please note, that it's a fake implementation of `ISelectionManager`, in other words, it should be used only with unit-tests.

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

    `createSelectionManager`

    This function creates and returns an instance of `ISelectionManager` (it's actually `MockISelectionManager` )
    ```typescript
    function createSelectionManager(): ISelectionManager
    ```

    Example
    ```typescript
    import { createSelectionManager } from "powerbi-visuals-utils-testutils";

    let selectionManager: ISelectionManager = createSelectionManager();
    ```

  * ### MockILocale

    This mock allows to set locale and change it for your needs during unit-testing process.
    ```typescript
    class MockILocale {
        constructor(locales?: Object): void; // Default locales are en-US and ru-RU 
        locale(key: string): void;// setter property
        locale(): string; // getter property
    }
    ```
    `createLocale`
    This method creates and returns instance of `MockILocale`.
    ```typescript
    funciton createLocale(locales?: Object): MockILocale;
    ```

  * ### MockITooltipService
    This mock allows to simulate `TooltipService` and call it for your needs during unit-testing process.
    ```typescript
    class MockITooltipService implements ITooltipService {
        constructor(isEnabled: boolean = true);
        enabled(): boolean;
        show(options: TooltipShowOptions): void;
        move(options: TooltipMoveOptions): void;
        hide(options: TooltipHideOptions): void;
    }
    ```
    `createTooltipService`

    This method creates and returns instance of `MockITooltipService`.
    ```typescript
    function createTooltipService(isEnabled?: boolean): ITooltipService;
    ```

  * ### MockIAllowInteractions

    ```typescript
    export class MockIAllowInteractions {
        constructor(public isEnabled?: boolean); // false by default
    }
    ```

    This method creates and returns instance of `MockIAllowInteractions`.
    ```typescript
    function createAllowInteractions(isEnabled?: boolean): MockIAllowInteractions;
    ```

  * ### MockILocalizationManager
    This mock provides basic abilies of `LocalizationManager` needed for unit-testing.
    ```typescript
    class MockILocalizationManager implements ILocalizationManager {
        constructor(displayNames: {[key: string]: string});
        getDisplayName(key: string): string; // returns default or setted displayNames for localized elements
    }
    ```

    This function creates and returns an instance of `ILocalizationManager` (actually `MockILocalizationManager`).
    ```typescript
    function createLocalizationManager(displayNames?: any): ILocalizationManager;
    ```

    Example
    ```typescript
    import { createLocalizationManager } from "powerbi-visuals-utils-testutils";
    let localizationManagerMock: ILocalizationManager = createLocalizationManager();
    ```

  * ### MockITelemetryService
    This mock simulates `TelemetryService` usage.
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
  * ### MockIAuthenticationService
    This mock simulates `AuthenticationService` work by providing mocked AAD token.
    ```typescript
    class MockIAuthenticationService implements IAuthenticationService  {
        constructor(token: string);
        getAADToken(visualId?: string): powerbi.IPromise<string>
    }
    ```

    This function creates and returns an instance of `IAuthenticationService` (it's actually `MockIAuthenticationService`).
    ```typescript
    function createAuthenticationService(token?: string): IAuthenticationService;
    ```

  * ### MockIStorageService
    This mock allows you to use `ILocalVisualStorageService` with the same behavior as LocalStorage.
    ```typescript
    class MockIStorageService implements ILocalVisualStorageService {
    get(key: string): IPromise<string>;
    set(key: string, data: string): IPromise<number>;
    remove(key: string): void;
    }
    ```

    This function creates and returns an instance of `ILocalVisualStorageService` (it's actually `MockIStorageService`).
    ```typescript
    function createStorageService(): ILocalVisualStorageService;
    ```

  * ### MockIEventService
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
    This function creates and returns an instance of `IVisualEventService` (it's actually `MockIEventService`).
    ```typescript
    function createEventService(): IVisualEventService;
    ```

* ## Utils

  Utils include helper method for Power BI visuals' unit testing, such as related to colors, numbers, and events.

  `renderTimeout`

  This method returns timeout
  ```typescript
  function renderTimeout(fn: Function, timeout: number = DefaultWaitForRender): number
  ```

  `testDom`

  This method will help you to set fixture in unit-tests.
  ```typescript
  function testDom(height: number | string, width: number | string): JQuery
  ```
  Example
  ```typescript
  import { testDom }  from "powerbi-visuals-utils-testutils";
  describe("testDom", () => {
      it("should return an element", () => {
          let element: JQuery = testDom(500, 500);

          expect(element.get(0)).toBeDefined();
      });
  });
  ```

  * ### Helper methods related to colors

    `getSolidColorStructuralObject`
    ```typescript
    function getSolidColorStructuralObject(color: string): any
    ```
    Method `getSolidColorStructuralObject`returns the following structure:

    ```json
    { solid: { color: color } }
    ```

    `assertColorsMatch`

    This method compares RgbColors parsed from input strings
    ```typescript
    function assertColorsMatch(actual: string, expected: string, invert: boolean = false): boolean
    ```

    `parseColorString`

    This method parses color from input string and returns it in specified interface RgbColor
    ```typescript
    function parseColorString(color: string): RgbColor
    ```

  * ### Helper methods related to numbers

    `getRandomNumbers`

    This method generates a random number using min and max values. Also you can specify exceptionList and provide a function for result change.
    ```typescript
    function getRandomNumber(
        min: number,
        max: number,
        exceptionList?: number[],
        changeResult: (value: any) => number = x => x): number
    ```

    `getRandomNumbers`

    This method provides you an array of random numbers generated by `getRandomNumber` method with specified min and max values.
    ```typescript
    function getRandomNumbers(count: number, min: number = 0, max: number = 1): number[]
    ```

  * ### Helper methods related to events
    The following methods are written for events simulation on web page for unit-tests.

    `ClickElement`
    This method simulates a click on the specified element.
    ```typescript
    function clickElement(element: JQuery, ctrlKey: boolean = false): void
    ```

    `createTouch`

    This method returns a Touch object that helps to simulate a touch event.
    ```typescript
    function createTouch(x: number, y: number, element: JQuery, id: number = 0): Touch
    ```

    `createTouchesList`

    This method returns a list of simulated Touch events.
    ```typescript
    function createTouchesList(touches: Touch[]): TouchList
    ```

    `createContextMenuEvent`

    This method returns MouseEvent
    ```typescript
    function createContextMenuEvent(x: number, y: number): MouseEvent
    ```

    `createMouseEvent`

    This method creates and returns MouseEvent
    ```typescript
    function createMouseEvent(
        mouseEventType: MouseEventType,
        eventType: ClickEventType,
        x: number,
        y: number,
        button: number = 0): MouseEvent
    ```

    `createTouchEndEvent`
    ```typescript
    function createTouchEndEvent(touchList?: TouchList): UIEvent
    ```

    `createTouchMoveEvent`
    ```typescript
    function createTouchMoveEvent(touchList?: TouchList): UIEvent
    ```

    `createTouchStartEvent`
    ```typescript
    function createTouchStartEvent(touchList?: TouchList): UIEvent
    ```

  * ### Helper methods related to d3 events usage

    The following methods will help you to simulate d3 events in unit-tests.

    `flushAllD3Transitions`

    This method forces all D3 transitions to complete.
      * Normally, zero-delay transitions are executed after an instantaneous delay (<10 ms).
      * This can cause a brief flicker if the browser renders the page twice: once at the end of the first event loop, then again immediately on the first timer callback. By flushing the timer queue at the end of the first event loop.
      * You can run any zero-delay transitions immediately and avoid the flicker.
      * These flickers are noticeable on IE and with a large number of webviews (not recommend you ever do this) on iOS.

    ```typescript
    function flushAllD3Transitions()
    ```

    The following methods require additional clarification, so please take a look at their signatures:
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


  * ### Helper interfaces
    This interface and enumerations are used in helper function. Please look at their declarations, it may help you to better understand test-utils usage.

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
