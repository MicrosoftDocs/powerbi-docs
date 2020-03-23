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
All visuals start with a class that implements the `IVisual` interface. You can name the class whatever you'd like, but there must be exactly one class that implements the IVisual interface.

> **Note:** your visual class name must match what is defined in your `pbiviz.json` file.

Here are sample visual class with the methods that should be implemented in each visual.
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

`constructor(options: VisualConstructorOptions)`

The constructor of the visual class is called when the visual is instantiated. It can be used for any set up operations needed for your visual.

**VisualConstructorOptions**

* `element: HTMLElement` - a reference to the DOM element that will contain your visual.
* `host: IVisualHost` - a collection of properties and services that can be used to interact with the visual host (Power BI). [Learn more about IVisualHost](IVisualHost.md) 

## update

`public update(options: VisualUpdateOptions): void`

All visuals must implement a public update method. It is called whenever there is a change in the data or host environment.

**VisualUpdateOptions**

* `viewport: IViewport` - the dimensions of the viewport that the visual should be rendered within.
* `dataViews: DataView[]` - the dataview object, which contains all data needed to render your visual.
    * your visual will typically use the categorical property under DataView.
* `type: VisualUpdateType` - flags that indicate the type(s) of this update. (Data | Resize | ViewMode | Style | ResizeEnd)
* `viewMode: ViewMode` - flags that indicate the view mode of the visual. (View | Edit | InFocusEdit)
* `editMode: EditMode` - a flag that indicates the edit mode of the visual. (Default | Advanced).
    * If the visual supports AdvancedEditMode, it should render its advanced UI controls only when editMode is set to 'Advanced'.
	* [Learn more about AdvancedEditMode](../Capabilities/AdvancedEditMode.md)
* `operationKind`?: VisualDataChangeOperationKind;
* `jsonFilters`?: IFilter[];
* `isInFocus`?: boolean;
	
## enumerateObjectInstances `optional`

`enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration`

This method is called for every object listed in capabilities. Using the options (currently just the name) you return a `VisualObjectInstanceEnumeration` with information about how to display this property.

**EnumerateVisualObjectInstancesOptions**

* `objectName: string` - the name of the object

## destroy `optional`

`public destroy(): void`

The destroy function is called when your visual is unloaded and can be used to do clean up tasks such as removing event listeners.

> **Note:** Power BI generally doesn't call this function as it is faster just to remove the entire IFrame that contains the visual.