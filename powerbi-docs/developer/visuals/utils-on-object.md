---
title: On object formatting utils in Power BI visuals
description: This article describes how to use on object utils for on-object formatting in Power BI custom visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins, shafeeq
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 02/14/2024
#customer intent: As a Power BI developer, I want to learn how to use on-object formatting utils in Power BI custom visuals, so that I can create custom visuals that support on-object formatting.
---

# On-object utils - subselection helper (preview)

The `HTMLSubSelectionHelper` provides an easy way for your Power BI custom visual to emit subselections to Power BI, get and render outlines.

`HTMLSubSelectionHelper` is a helper class intended to facilitate the creation and subsequent management of subselection outlines. It contains methods for finding subselectable elements.  

The utils exports CSS classes and attributes making it easier for the visual to define and maintain subselections.

> [!NOTE]
> Use version 6.0.1 or higher of the utils.

To define subselectable elements, we also need to add a class to each desired element.

|     CSS Class               |     Purpose                                                                                 |     Required    |
|-----------------------------|---------------------------------------------------------------------------------------------|-----------------|
|     subselectable          |     Provides a selector   for the `HTMLSubSelectionHelper` to find possible subselections    |     yes         |
  
To define subselections for the visual, there are a few attributes that need to be added to the desired elements.

|     Attribute Name                              |     Attribute                                 |     Purpose                                                                                                            |     Required                                                 |     Type                                                        |     Example                                                                                                                                     |
|-------------------------------------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
|     SubSelectableDisplayNameAttribute           |     data-sub-selection-display-name           |     Provide a localized   string for display name of the subselected element                                          |     yes                                                      |     string                                                      |     data-sub-selection-display-name="Visual   Title"                                                                                            |
|     SubSelectableObjectNameAttribute            |     data-sub-selection-object-name            |     Provide an object   name to associate with subselection shortcuts and style                                       |     yes                                                      |     string                                                      |     data-sub-selection-object-name="title"                                                                                                      |
|     SubSelectableTypeAttribute                  |     data-sub-selection-type                   |     Provide the type of   the subselected style                                                                       |     yes                                                      |     SubSelectionStylesType                                      |     data-sub-selection-type="1"                                                                                                                 |
|     SubSelectableDirectEdit                     |     data-sub-selection-direct-edit            |     Provide direct text   edit references, including the CardUID, GroupUID, and the orientation of the   text box      |     no                                                       |     SubSelectableDirectEdit   should be provided as a string    |     data-sub-selection-direct-edit="{"reference":{"cardUid":"Visual-title","groupUid":"title-text","sliceUid":"title-text-text"},"style":0}"    |
|     SubSelectableHideOutlineAttribute           |     data-sub-selection-hide-outline           |     Provide a boolean   value for subselectable elements that shouldn't have an outline shown                       |     no                                                       |     boolean                                                     |     data-sub-selection-hide-outline="true"                                                                                                      |
|     SubSelectableRestrictingElementAttribute    |     data-sub-selection-restricting-element    |     Used to indicate the element that will be restricted, the outlines, and the type of restriction (clamp or clip)    |     no                                                       |     SubSelectionOutlineRestrictionType                          |     data-sub-selection-restricting-element="1"                                                                                                  |
|     SubSelectableSubSelectedAttribute           |     data-sub-selection-sub-selected           |     Indicate whether the   subselectable is selected or not                                                           |     No, the helper assigns it to the elements when needed    |     Boolean                                                     |     data-subselection-sub-selected="true"                                                                                                       |

## Format mode

When the visual enters format mode, You need to disable interactivity for the visual, as we expect the user to select the visual and visual element to initiate formatting.

### HTMLSubSelectionHelper public methods

The `HTMLSubSelectionHelper` has some public methods that you can use, but there are two main methods and the helper does the rest.

The two methods are `setFormatMode` and `updateOutlinesFromSubSelections`.

The public methods of the helper include:

* createHtmlSubselectionHelper(args: HtmlSubselectionHelperArgs): HtmlSubSelectionHelper - This is a static method that takes args of type `HtmlSubselectionHelperArgs` and returns an instance of `HTMLSubSelectionHelper`.

* setFormatMode(isFormatMode: boolean): void - This method sets the format mode for the HTMLSubSelectionHelper, If isFormatMode is true, the helper attaches relevant event listeners to the host element to enable format mode functionality (subselecting, rendering outlines).

* getSubSelectionSourceFromEvent(event: PointerEvent): *HtmlSubSelectionSource* or *undefined* - returns an `HtmlSubSelectionSource` object that is built according to the event parameter.

* onVisualScroll(): void - Indicates to the HTMLSubSelectionHelper that scrolling is currently occurring. Scrolling should remove outlines until scrolling is finished.

* updateElementOutlines(elements: HTMLElement[], visibility: SubSelectionOutlineVisibility, suppressRender: boolean = false): SubSelectionRegionOutlineId[] - update the outlines (and emits them to Power BI to be rendered) of the elements.

* clearHoveredOutline(): void - This method clears hovered outlines if they exist.

* updateRegionOutlines(regionOutlines: HelperSubSelectionRegionOutline[], suppressRender: boolean = false): void - update and emits the given outlines to get rendered.

* getElementsFromSubSelections(subSelections: CustomVisualSubSelection[]): HTMLElement[] - given subSelections, this method returns the relevant HTMLElements.

* updateOutlinesFromSubSelections(subSelections: CustomVisualSubSelection[], clearExistingOutlines?: boolean, suppressRender?: boolean): void - updates and renders the outlines for the given subSelection with respect to suppressRender and clearExistingOutlines.

* hideAllOutlines(suppressRender: boolean = false): void - hide all the outlines with respect to suppressRender.

* getAllSubSelectables(filterType?: SubSelectionStylesType): CustomVisualSubSelection[] -  returns all the subSelectables according to the filterType.

* createVisualSubSelectionForSingleObject(createVisualSubSelectionArgs: CreateVisualSubSelectionFromObjectArgs): CustomVisualSubSelection - create CustomVisualSubSelection object from the createVisualSubSelectionArgs.

* setDataForElement(el: HTMLElement | SVGElement, data: SubSelectionElementData): void - a static method that sets data for the elements.

* getDataForElement(el: HTMLElement | SVGElement): SubSelectionElementData - a static method that gets the associated previously assigned using setDataForElement.

### HtmlSubselectionHelperArgs

```typescript
interface HtmlSubselectionHelperArgs {
    /** Element which contains the items that can be sub-selected */
    hostElement: HTMLElement; // The host element, the helper will attach the listeners to this element
    subSelectionService: powerbi.extensibility.IVisualSubSelectionService;// subSelectionService which is provided in powerbi-visuals-api
    selectionIdCallback?: ((e: HTMLElement) => ISelectionId);// a callback that gets the selectionId for the specific element
    customOutlineCallback?: ((subSelection: CustomVisualSubSelection) => SubSelectionRegionOutlineFragment[]);// a callback to get custom outline for the specific subSelection
    customElementCallback?: ((subSelection: CustomVisualSubSelection) => HTMLElement[]);
    subSelectionMetadataCallback?: ((subSelectionElement: HTMLElement) => unknown);// a callback to attatch any meta data to the subSelection.
}
```

### SubSelectionStylesType

```typescript
const enum SubSelectionStylesType {
            None = 0,
            Text = 1,
            NumericText = 2,
            Shape = 3,
}
```

### SubSelectableDirectEdit

```typescript
interface SubSelectableDirectEdit {
            reference: SliceFormattingModelReference;
            style: SubSelectableDirectEditStyle;
            displayValue?: string;
}
```

### SubSelectionOutlineRestrictionType

```typescript
const enum SubSelectionOutlineRestrictionType {
            /**
             * A clamping element will adjust the outline to prevent it from extending beyond
             * the restricting element.
             */
            Clamp,
            /**
             * A clipping element will make parts of the outline not visible if the outline extends beyond the
             * restricting element's bounds. 
             */
            Clip
        }
```

To add restriction options to a specific element use the `HTMLSubSelectionHelper` `setDataForElement` with this data type, the helper uses the data to update the outlines:

```typescript
interface SubSelectionElementData {
    outlineRestrictionOptions?: SubSelectionOutlineRestrictionOptions;
}

/** Options used to indicate if a restricting element should allow outlines more space to
  * generate by adding padding or if the restricting element should constrict the outline more
  * by adding a margin.
  */
export interface SubSelectionOutlineRestrictionOptions {
        padding?: IOffset;
        margin?: IOffset;
  }
```

## Example

In this example, we implement `customOutlineCallback` and `selectionIdCallback`:
The following code is in Visual Code.
We have an object in the visual called `arcElement`. We want to render the outline when the element is hovered or subselected.

```typescript
import ISelectionId = powerbi.visuals.ISelectionId;

const enum BarChartObjectNames {
    ArcElement = 'arcElement',
    ColorSelector = 'colorSelector',
    …..
}

private ArcOutlines(subSelection: CustomVisualSubSelection): powerbi.visuals.SubSelectionRegionOutlineFragment[] {
        const outlines: powerbi.visuals.SubSelectionRegionOutlineFragment[] = []
        if (subSelection?.customVisualObjects[0].objectName === BarChartObjectNames.ArcElement) {
            const outline: powerbi.visuals.ArcSubSelectionOutline = {
                type: powerbi.visuals.SubSelectionOutlineType.Arc,
                center: { x: this.arcCenterX, y: this.arcCenterY },
                startAngle: this.arcStartAngle,
                endAngle: this.arcEndAngle,
                innerRadius: this.arcInnerRadius,
                outerRadius: this.arcOuterRadius
            };
            outlines.push({
                id: BarChartObjectNames.ArcElement,
                outline
            });
            return outlines;
        }
    }

public selectionIdCallback(e: Element): ISelectionId {
        const elementType: string = d3.select(e).attr(SubSelectableObjectNameAttribute);
        switch (elementType) {
            case BarChartObjectNames.ColorSelector:
                const datum = d3.select<Element, BarChartDataPoint>(e).datum();
                return datum.selectionId;
            default:
                return undefined;
        }
    }
```

Import the HtmlSubSelectionHelper:

`import {  HtmlSubSelectionHelper } from 'powerbi-visuals-utils-onobjectutils';`

In the constructor code, create the HTMLSubSelectionHelper:

```typescript
constructor(options: VisualConstructorOptions) {
    …….
    this.subSelectionHelper = HtmlSubSelectionHelper.createHtmlSubselectionHelper({
                hostElement: options.element,
                subSelectionService: options.host.subSelectionService,
                selectionIdCallback: (e) => this.selectionIdCallback(e),
                customOutlineCallback: (e) => this.ArcOutlines(e),
            });
    ….
}
```

In update method of the visual add the following code to update the outlines of the subSeselection, update the state of the format mode for the `HTMLSubSelectionHelper` and disable interactions that aren't for format mode if format mode is on:

```typescript
public update(options: VisualUpdateOptions) {
 …
 
 if (this.formatMode) {// disabling interaction with the visual data in format mode
             barSelectionMerged.on('click', null);
             this.svg.on('click', null);
             this.svg.on('contextmenu', null);
         } else {
             this.handleBarClick(barSelectionMerged);
             this.handleClick(barSelectionMerged);
             this.handleContextMenu();
         }
         this.subSelectionHelper.setFormatMode(options.formatMode);
         const shouldUpdateSubSelection = options.type & powerbi.VisualUpdateType.Data
             || options.type & powerbi.VisualUpdateType.Resize
             || options.type & powerbi.VisualUpdateType.FormattingSubSelectionChange;
         if (this.formatMode && shouldUpdateSubSelection) {
             this.subSelectionHelper.updateOutlinesFromSubSelections(options.subSelections, true);
         }
 …
}
```

## Related content

* [Subselection API](./subselection-api.md)
* [On-object formatting API](./on-object-formatting-api.md)
