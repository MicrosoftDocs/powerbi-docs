---
title:  Visual API
description: This article describes how to use IVisual API for Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 02/19/2023
---

# Visual API

All visuals start with a class that implements the `IVisual` interface. You can name the class anything as long as there's exactly one class that implements the `IVisual` interface.

> [!NOTE]
> The visual class name must be the same as the `visualClassName` in the `pbiviz.json` file.

The visual class should implement the following methods as shown in the sample below:

* [`constructor`](#constructor), a standard constructor that initializes the visual's state
* [`update`](#update), updates the visual's data
* [`getFormattingModel`](#getformattingmodel-optional), returns formatting model that populate the property pane (formatting options) where you can modify them as needed
* [`destroy`](#destroy-optional), a standard destructor for cleanup

```typescript
class MyVisual implements IVisual {
    
    constructor(options: VisualConstructorOptions) {
        //one time setup code goes here (called once)
    }
    
    public update(options: VisualUpdateOptions): void {
        //code to update your visual goes here (called on all view or data changes)
    }

    public getFormattingModel(): FormattingModel {
        // returns modern format pane formatting model that contain all format pane components and properties (called on opening format and analytics pane or on editing format properties)
    }
    
    public destroy(): void {
        //one time cleanup code goes here (called once)
    }
}
```

## constructor

The `constructor` of the visual class is called when the visual is instantiated. It can be used for any set-up operations the visual needs.

```typescript
constructor(options: VisualConstructorOptions)
```

### VisualConstructorOptions

* `element: HTMLElement`, a reference to the DOM element that will contain your visual
* `host: IVisualHost`, a collection of properties and services that can be used to interact with the visual host (Power BI)

   `IVisualHost` contains the following services:

  * `createSelectionIdBuilder`, generates and stores metadata for selectable items in your visual
  * `createSelectionManager`, creates the communication bridge used to notify the visual's host about changes in the selection state, see [Selection API](./selection-api.md).
  * `createLocalizationManager`, generates a manager to help with [localization](./localization.md)
  * `allowInteractions: boolean`, a boolean flag that determines whether or not the visual is interactive
  * `applyJsonFilter`, applies specific filter types, see [Filter API](./filter-api.md)
  * `persistProperties`, allows users to create persistent settings and save them along with the visual definition, so they're available on the next reload
  * `eventService`, returns an [event service](./event-service.md) to support **Render** events
  * `storageService`, returns a service to help use [local storage](./local-storage.md) in the visual
  * `tooltipService`, returns a [tooltip service](./add-tooltips.md) to help use tooltips in the visual
  * `launchUrl`, helps to [launch URL](./launch-url.md) in next tab
  * `locale`, returns a locale string, see [Localization](./localization.md)
  * `instanceId`, returns a string to identify the current visual instance
  * `colorPalette`, returns the colorPalette required to apply colors to your data
  * `fetchMoreData`, supports using more data than the standard limit (1K rows)
  * `switchFocusModeState`, helps to change the focus mode state

 ```typescript
   export interface IVisualHost extends extensibility.IVisualHost {
       createSelectionIdBuilder: () => visuals.ISelectionIdBuilder;
       : () => ISelectionManager;
       colorPalette: ISandboxExtendedColorPalette;
       persistProperties: (changes: VisualObjectInstancesToPersist) => void;
       applyJsonFilter: (filter: IFilter[] | IFilter, objectName: string, propertyName: string, action: FilterAction) => void;
       tooltipService: ITooltipService;
       telemetry: ITelemetryService;
       locale: string;
       allowInteractions: boolean;
       launchUrl: (url: string) => void;
       fetchMoreData: () => boolean;
       instanceId: string;
       refreshHostData: () => void;
       createLocalizationManager: () => ILocalizationManager;
       storageService: ILocalVisualStorageService;
       eventService: IVisualEventService;
       switchFocusModeState: (on: boolean) => void;
   }
   ```

## update

All visuals must implement a public update method that's called whenever there's a change in the data or host environment.

```typescript
public update(options: VisualUpdateOptions): void
```

### VisualUpdateOptions

* `viewport: IViewport`, dimensions of the viewport that the visual should be rendered within
* `dataViews: DataView[]`, the dataview object that contains all data needed to render your visual (your visual will typically use the categorical property under DataView)
* `type: VisualUpdateType`, flags indicating the type(s) of data being updated (**Data** | **Resize** | **ViewMode** | **Style** | **ResizeEnd**)
* `viewMode: ViewMode`, flags indicating the view mode of the visual (**View** | **Edit** | **InFocusEdit**)
* `editMode: EditMode`, flag indicating the edit mode of the visual (**Default** | **Advanced**) (if the visual supports **AdvancedEditMode**, it should render its advanced UI controls only when **editMode** is set to **Advanced**, see [AdvancedEditMode](./advanced-edit-mode.md))
* `operationKind?: VisualDataChangeOperationKind`, flag indicating type of data change (**Create** | **Append**)
* `jsonFilters?: IFilter[]`, collection of applied json filters
* `isInFocus?: boolean`, flag to indicate if the visual is in focus mode or not

## getFormattingModel *(optional)*

This method is called once every time we open properties pane or when the user edit any format property in this pane. It returns `FormattingModel` with all information on the properties pane design, hierarchy, properties and latest formatting values.

```typescript
getFormattingModel(): visuals.FormattingModel;
```

## destroy *(optional)*

The destroy function is called when your visual is unloaded and can be used for clean-up tasks such as removing event listeners.

``` typescript
public destroy(): void
```

> [!NOTE]
> Power BI generally doesn't call `destroy` since it's faster to remove the entire IFrame that contains the visual.

## Next steps

>[!div class="nextstepaction"]
>[Visual project structure](visual-project-structure.md)

>[!div class="nextstepaction"]
>[Local storage API](local-storage.md)
