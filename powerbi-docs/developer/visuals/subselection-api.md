---
title: Sub-selection API in Power BI Visuals
description: The article describes how to use Power BI Visuals sub-selectionAPI to allow users to format visuals easily.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 01/23/2024
---

# Sub-selection API

As part of [on-object formatting](./on-object-formatting.md), the sub-selection service is used to emit sub-selection and outlines to Power BI.

The SubSelection Service provides two methods:

* [subSelect]
* [updateRegionOutlines]


## How to use the sub-selection API

### subSelect

Sends a sub-subselection to PowerBI to use when a user clicks on a sub-selectable element.

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

	- customVisualObjects: this is an array which contains customVisualObjects, the objectName of the object should be as declared in the capabilities.json, and the selectionId for the selected data point if exists.
	- displayName:  the display name, it should be localized if the visual supports localization.
	- subSelectionType: the type of the sub-selection(shape, text or Numeric text)
	- selectionOrigin: the coordinates of the sub-selected element.
	- showUI: Whether to show the UI for this sub-selection, like formatting context menus and toolbar
	- immediateDirectEdit:  If immediate direct edit should be triggered, the ID of the sub-selection outline to edit

If you don't use the HTMLSubSelectionHelper, you need to manage the sub-selections.

Example:
In this example we will add an event listener to the host element, for the click, context menu events.

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

### updateRegionOutlines

Send outlines to PowerBI to get rendered, a good place to use it is in the update method of the visual, since in the update PowerBI will send the subSelection in the update options which was previously sent by the visual, or when you want to render an outline for a hovered element.
updateRegionOutlines(outlines: visuals.SubSelectionRegionOutline[]): void

SubSelectionRegionOutline
interface SubSelectionRegionOutline {
            id: string;
            visibility: SubSelectionOutlineVisibility; // controls visibility for outlines
            outline: SubSelectionOutline;
        }

If you don't use the HTMLSubSelectionHelper, you have to manage the outlines and their state, if they're active, hovered or not visible.

Example: 
In this example we assume that we had an object called myObject, and we want to render a rectangle outline when the relevant element is hovered, we will use the code in the example for the subSelect.
In the update we also need to add an event listener for the pointerover event
We want to manage our outlines using a Record.

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
	
