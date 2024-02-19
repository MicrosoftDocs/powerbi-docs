---
title: Subselection API in Power BI Visuals
description: The article describes how to use Power BI Visuals subselectionAPI to allow users to format visuals easily.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins, shafeeq
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 02/19/2024
---

# Subselection API (preview)

[On-object formatting](../../create-reports/power-bi-on-object-interaction.md) allows users to quickly and easily modify the format of visuals by directly selecting the elements they want to modify. When an element is selected, the format pane automatically navigates and expands the specific formatting setting for the selected element. As part of [on-object formatting](./on-object-formatting-api.md), the subselection service is used to send subselections and outlines to Power BI.

## How to use the Subselection API

The SubSelection Service provides two methods:

* [subSelect](#subselect)
* [updateRegionOutlines](#updateregionoutlines)

### subSelect

Sends the subselection for Power BI to use when a user selects an element that allows subselections.

```typescript
subSelect(args: visuals.CustomVisualSubSelection | undefined): void

CustomVisualSubSelection
interface CustomVisualSubSelection {
            customVisualObjects: CustomVisualObject[];
            displayName: string;
            subSelectionType: SubSelectionStylesType;
            selectionOrigin: SubSelectionOrigin;
            /** Whether to show the UI for this sub-selection, like formatting context menus and toolbar */
            showUI: boolean;
            /** If immediate direct edit should be triggered, the ID of the sub-selection outline to edit */
            immediateDirectEdit?: string;
            metadata?: unknown;
        }


interface CustomVisualObject {
            objectName: string;
            selectionId: powerbi.visuals.ISelectionId | undefined;
        }
```

This method has the following parameters:

* customVisualObjects: an array that contains `customVisualObjects`, the objectName of the object should be the same as the one declared in the *capabilities.json*, and the selectionId for the selected data point, if it exists.
* displayName:  the display name should be localized if the visual supports localization.
* subSelectionType: the type of the subselection (shape, text, or Numeric text).
* selectionOrigin: the coordinates of the subselected element.
* showUI: Whether to show the UI for this subselection, like formatting context menus and toolbar.
* immediateDirectEdit:  If immediate direct edit should be triggered, the ID of the subselection outline to edit.

If you don't use the [`HTMLSubSelectionHelper`](./utils-on-object.md), you need to manage the subselections.

#### Subselection example

In this example, we add an event listener to the host element, for the right-click, context menu events.

```typescript
constructor(options: VisualConstructorOptions) {
        this.hostElement = options.element;
        this.subSelectionService = options.host.subSelectionService;
        ….
}

public update(options: VisualUpdateOptions) {
 if (options.formatMode) {
             // remove event listeners which are irrelevant for format mode.
   …
             this.hostElement.addEventListener('click', this.handleFormatModeClick);
             this.hostElement.addEventListener('contextmenu',  this.handleFormatModeContextMenu);
         } else {
             this.hostElement.removeEventListener('click', this.handleFormatModeClick);
             this.hostElement.removeEventListener('contextmenu', this.handleFormatModeContextMenu);
   …
             // add event listeners which are irrelevant for format mode
         }
 }
 
private handleFormatModeClick(event: MouseEvent): void {
        this.subSelectFromEvent(event, true /**showUI */);
    }

 private handleFormatModeContextMenu(event: MouseEvent): void {
        this.subSelectFromEvent(event, false);
    }

private subSelectFromEvent(event: MouseEvent, showUI: boolean): void {
        //find the element which was selected and fill the needed fields
        const cVObject: powerbi.visuals.CustomVisualObject = {
            objectName: 'myObject',//the object name that is relevant to the clicked element
            selectionId: undefined
        };
        const subSelection: CustomVisualSubSelection = {
            customVisualObjects: [cVObject],
            displayName: 'myObject',
            selectionOrigin: {
                x: event.clientX,
                y: event.clientY
            },
            subSelectionType: SubSelectionStylesType.Shape,// choose the relevant type
            showUI
        };
        this.subSelectionService.subSelect(subSelection);
    }
```

### updateRegionOutlines

This method sends outlines to Power BI to render. Use it in the `update` method of the visual since that's where Power BI sends the subselection that the visual sent previously. You can also use it when you want to render an outline for a hovered element.

```tyepscript
updateRegionOutlines(outlines: visuals.SubSelectionRegionOutline[]): void

SubSelectionRegionOutline
interface SubSelectionRegionOutline {
            id: string;
            visibility: SubSelectionOutlineVisibility; // controls visibility for outlines
            outline: SubSelectionOutline;
        }
```

If you don't use the [`HTMLSubSelectionHelper`](./utils-on-object.md), you have to manually manage the outlines and their state (if they're active, hovered or not visible).

#### Update region outlines example

In this example we assume that we have an object called `myObject`, and we want to render a rectangle outline when the relevant element is hovered. We use the code in the previous example for subSelect.

In the update, we also need to add an event listener for the `pointerover` event.  

We want to manage our outlines using a Record.

```typescript
private subSelectionRegionOutlines: Record<string, SubSelectionRegionOutline > = {};


public update(options: VisualUpdateOptions) {
 if (options.formatMode) {
             // remove event listeners which are irrelevant for format mode.
   …
             this.hostElement.addEventListener('click', this.handleFormatModeClick);
             this.hostElement.addEventListener('contextmenu',  this.handleFormatModeContextMenu);
   this.hostElement.addEventListener('pointerover', this.handleFormatModePointerOver);
         } else {
             this.hostElement.removeEventListener('click', this.handleFormatModeClick);
             this.hostElement.removeEventListener('contextmenu', this.handleFormatModeContextMenu);
   this.hostElement.removeEventListener('pointerover', this.handleFormatModePointerOver);
   …
             // add event listeners which are irrelevant for format mode
         }
 }
 
 private handleFormatModePointerOver(event: MouseEvent): void {
         // use the event to extract the element that was hovered.
         // in this example we assume that we found the element and it is related to object called myObject.
         // we need to clear previously hovered outlines before rendering
         const regionOutlines = getValues(this.subSelectionRegionOutlines);
         const hoveredOutline = regionOutlines.find(outline => outline.visibility === SubSelectionOutlineVisibility.Hover);
         if (hoveredOutline) {
             this.subSelectionRegionOutlines[hoveredOutline.id] = {
                 ...this.subSelectionRegionOutlines[hoveredOutline.id],
                 visibility: powerbi.visuals.SubSelectionOutlineVisibility.None
             };
         }
         // now we will build the outline for myObject relevant element.
         let element: HTMLElement;// assume we found the relevant element.
         const domRect = element.getBoundingClientRect();
         const { x, y, width, height } = domRect;
         const outline: powerbi.visuals.RectangleSubSelectionOutline = {
             height,
             width,
             x,
             y,
             type: powerbi.visuals.SubSelectionOutlineType.Rectangle,
         };
     
         const regionOutline: powerbi.visuals.SubSelectionRegionOutline = {
             id: 'myObject',
             visibility: powerbi.visuals.SubSelectionOutlineVisibility.Hover,
             outline
         };
         this.subSelectionRegionOutlines[regionOutline.id] = regionOutline;
         this.renderOutlines();
         // you need to remove the hovered outline when the element is not hovered anymore
     }
     private renderOutlines(): void {
         const regionOutlines = getValues(this.subSelectionRegionOutlines);
         this.subSelectionService.updateRegionOutlines(regionOutlines);
     }
```

## Related content

* [On object utils](./utils-on-object.md)
* [On-object formatting API](./on-object-formatting-api.md)
