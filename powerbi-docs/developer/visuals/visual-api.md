---
title:  Visual API for Power BI Visuals
description: This article provides a comprehensive guide on how to use the IVisual API for Power BI visuals, including step-by-step instructions and code examples.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 12/17/2023
---

# Visual API

All visuals start with a class that implements the `IVisual` interface. You can name the class anything as long as there's exactly one class that implements the `IVisual` interface.

> [!NOTE]
> The visual class name must be the same as the `visualClassName` in the `pbiviz.json` file.

The visual class should implement the following methods as shown in the following sample:

* [`constructor`](#constructor) - a standard constructor that initializes the visual's state
* [`update`](#update) - updates the visual's data
* [`getFormattingModel`](#getformattingmodel-optional), returns a formatting model that populates the property pane (formatting options) where you can modify properties as needed
* [`destroy`](#destroy-optional) - a standard destructor for cleanup

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

These interfaces get updated with each new API version. For the most updated interface format, go to our [GitHub repo](https://github.com/microsoft/powerbi-visuals-api/blob/main/src/visuals-api.d.ts#L1783C9-L1783C25).

The following list describes some of the properties of the `VisualConstructorOptions` interface:

* `element: HTMLElement` - a reference to the DOM element that contains your visual
* `host: IVisualHost` - a collection of properties and services that can be used to interact with the visual host (Power BI)

   `IVisualHost` contains the following services:

  * `createSelectionIdBuilder` - generates and stores metadata for selectable items in your visual
  * `createSelectionManager` - creates the communication bridge used to notify the visual's host about changes in the selection state, see [Selection API](./selection-api.md).
  * `hostCapabilities`
  * `refreshHostData`
  * `downloadService` - returns expanded result information of the [download](./file-download-api.md).
  * `eventService` - returns information about [rendering events](./event-service.md).
  * `hostEnv`
  * `displayWarningIcon` - returns [error or warning message](./visual-display-warning-icon.md).
  * `licenseManager` - returns [license information](./licensing-api.md).
  * `createLocalizationManager` - generates a manager to help with [localization](./localization.md)
  * `applyJsonFilter` - applies specific filter types. See [Filter API](./filter-api.md)
  * `applyCustomSort` - allows [custom sorting options](./sort-options.md#custom-sorting).
  * `acquireAADTokenService` - returns Microsoft Entra ID [authentication information](./authentication-api.md).
  * `webAccessService` - returns permission status for [accessing remote resources](./permissions-api.md#web-access).
  * `openModalDialog` - returns a [dialog box](./create-display-dialog-box.md).
  * `persistProperties` - allows users to create persistent settings and save them along with the visual definition, so they're available on the next reload
  * `eventService` - returns an [event service](./event-service.md) to support **Render** events
  * `storageService` - returns a service to help use [local storage](./local-storage.md) in the visual
  * `storageV2Service` - returns a service to help use [local storage](./local-storage.md) version 2 in the visual
  * `tooltipService` - returns a [tooltip service](./add-tooltips.md) to help use tooltips in the visual
  * `telemetry`
  * `drill`
  * `launchUrl` - helps to [launch URL](./launch-url.md) in next tab
  * `authenticationService` - returns a Microsoft Entra ID token.
  * `locale` - returns a locale string, see [Localization](./localization.md)
  * `instanceId` - returns a string to identify the current visual instance
  * `colorPalette` - returns the colorPalette required to apply colors to your data
  * `fetchMoreData` - supports using more data than the standard limit (1,000 rows). See [Fetch more data](./fetch-more-data.md)
  * `switchFocusModeState` - helps to change the focus mode state

## update

All visuals must implement a public update method that's called whenever there's a change in the data or host environment.

```typescript
public update(options: VisualUpdateOptions): void
```

### VisualUpdateOptions

* `viewport: IViewport` - dimensions of the viewport that the visual should be rendered within
* `dataViews: DataView[]` - the data view object that contains all data needed to render your visual (a visual generally uses the categorical property under DataView)
* `type: VisualUpdateType` - flags indicating the type of data being updated (**Data** | **Resize** | **ViewMode** | **Style** | **ResizeEnd**)
* `viewMode: ViewMode` - flags indicating the view mode of the visual (**View** | **Edit** | **InFocusEdit**)
* `editMode: EditMode` - flag indicating the edit mode of the visual (**Default** | **Advanced**) (if the visual supports **AdvancedEditMode**, it should render its advanced UI controls only when **editMode** is set to **Advanced**, see [AdvancedEditMode](./advanced-edit-mode.md))
* `operationKind?: VisualDataChangeOperationKind` - flag indicating type of data change (**Create** | **Append**)
* `jsonFilters?: IFilter[]` - collection of applied json filters
* `isInFocus?: boolean` - flag to indicate if the visual is in focus mode or not

## getFormattingModel *(optional)*

This method is called once each time we open the properties pane or the user edits any of the properties in the pane. It returns [`FormattingModel`](./format-pane.md) with all information on the properties pane design, hierarchy, properties, and latest formatting values.

```typescript
getFormattingModel(): visuals.FormattingModel;
```

## destroy *(optional)*

The destroy function is called when your visual is unloaded and can be used for clean-up tasks such as removing event listeners.

``` typescript
public destroy(): void
```

> [!TIP]
> Power BI generally doesn't call `destroy` since it's faster to remove the entire IFrame that contains the visual.

## Related content

* [Visual project structure](visual-project-structure.md)

* [Local storage API](local-storage.md)
