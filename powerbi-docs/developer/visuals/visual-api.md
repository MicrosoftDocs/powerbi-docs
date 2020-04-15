---
title:  Visual API
description: This article describes how to use IVisual API for Power BI visuals
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 03/19/2020
---

# Visual API
All visuals start with a class that implements the `IVisual` interface. You can name the class whatever you like, but there must be exactly one class that implements the IVisual interface.

> **Note:** your visual class name must match what is defined in your `pbiviz.json` file.

Here is a sample visual class with methods that should be implemented in each visual.

* `Update` method includes code to update your visual's data.
* `Constructor` method is a standard constructor that initializes visual state.
* `enumerateObjectInstances` method returns objects to populate the property pane (formatting options). Here you can modify them if you need.
* `destroy` method is a standard destructor that cleanup the code.

```typescript
class MyVisual implements IVisual {
    
    constructor(options: VisualConstructorOptions) {
        //one time setup code goes here (called once)
    }
    
    public update(options: VisualUpdateOptions): void {
        //code to update your visual goes here (called on all view or data changes)
    }

    public enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration {
        //returns objects to populate the property pane (called for each object defined in capabilities)
    }
    
    public destroy(): void {
        //one time cleanup code goes here (called once)
    }
}

```
## Constructor

```typescript
constructor(options: VisualConstructorOptions)
```

The constructor of the visual class is called when the visual is instantiated. It can be used for any set up operations needed for your visual.

**VisualConstructorOptions**

* `element: HTMLElement` - a reference to the DOM element that will contain your visual.
* `host: IVisualHost` - a collection of properties and services that can be used to interact with the visual host (Power BI).

IVisualHost currently contains these services and will be expanded in the upcoming API versions.

```typescript
    export interface IVisualHost extends extensibility.IVisualHost {
        createSelectionIdBuilder: () => visuals.ISelectionIdBuilder;
        : () => ISelectionManager;
        colorPalette: ISandboxExtendedColorPalette;
        persistProperties: (changes: VisualObjectInstancesToPersist) => void;
        applyJsonFilter: (filter: IFilter[] | IFilter, objectName: string, propertyName: string, action: FilterAction) => void;
        tooltipService: ITooltipService;
        telemetry: ITelemetryService;
        authenticationService: IAuthenticationService;
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
* `createSelectionIdBuilder` generates and stores metadata for selectable items in your visual.
* `createSelectionManager` - creates the communication bridge used to notify the visual's host on changes in the selection state. [More information about selection API](./selection-api.md).
* `createLocalizationManager` generates a manager that will help you with [localization](./localization.md).
* `allowInteractions: boolean` - a boolean flag which hints whether or not the visual should be interactive.
* `applyJsonFilter` - this method applies specific filter types, find out more [here](./filter-api.md).
* `persistProperties`- allows users to persist properties and save them along with the visual definition, so that they are available on the next reload.
* `eventService` - returns [event service](./event-service.md) that supports Render events.
* `storageService` - returns service that helps you to use [local storage](./local-storage.md) in the visual.
* `authenticationService` - generates service that helps you with user authentication.
* `tooltipService` - returns [tooltip service](./add-tooltips.md) that helps you to use tooltips in visual.
* `launchUrl` - method that helps you to [launch url](./launch-url.md) in next tab.
* `locale` - returns locale string.[More information about localization](./localization.md).
* `instanceId` - returns string that identifies the current visual instance.
* `colorPalette` - returns colorPalette that is required for applying colors to your data.
* `fetchMoreData` - method that supports using more data than a standard limit (1K rows).
* `switchFocusModeState` - method that helps you to change focus mode state.

## update

```typescript
public update(options: VisualUpdateOptions): void
```

All visuals must implement a public update method. It is called whenever there is a change in the data or host environment.

**VisualUpdateOptions**

* `viewport: IViewport` - the dimensions of the viewport that the visual should be rendered within.
* `dataViews: DataView[]` - the dataview object which contains all data needed to render your visual.
    * your visual will typically use the categorical property under DataView.
* `type: VisualUpdateType` - flags that indicate the type(s) of this update. (Data | Resize | ViewMode | Style | ResizeEnd)
* `viewMode: ViewMode` - flags that indicate the view mode of the visual. (View | Edit | InFocusEdit)
* `editMode: EditMode` - a flag that indicates the edit mode of the visual. (Default | Advanced).
    * If the visual supports AdvancedEditMode, it should render its advanced UI controls only when editMode is set to 'Advanced'.
	* [Learn more about AdvancedEditMode](./advanced-edit-mode.md)
* `operationKind`?: VisualDataChangeOperationKind - flag that indicates data change kind. (Create | Append);
* `jsonFilters`?: IFilter[] - collection of applied json filters;
* `isInFocus`?: boolean - flag that indicates is the visual in focus mode or not;
	
## enumerateObjectInstances `optional`

```typescript
enumerateObjectInstances(options:EnumerateVisualObjectInstancesOptions):VisualObjectInstanceEnumeration
```

This method is called for every object listed in capabilities. Using the options (currently just the name) you return a `VisualObjectInstanceEnumeration` with information about how to display this property.

**EnumerateVisualObjectInstancesOptions**

* `objectName: string` - the name of the object

## destroy `optional`

``` typescript
public destroy(): void
```

The destroy function is called when your visual is unloaded and can be used to do clean up tasks such as removing event listeners.

> **Note:** Power BI generally doesn't call this function as it is faster just to remove the entire IFrame that contains the visual.