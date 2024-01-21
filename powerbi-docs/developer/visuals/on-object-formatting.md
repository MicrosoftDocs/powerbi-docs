---
title: Support for on-object interaction with visuals in your report (preview)
description: Learn how to create visuals that support on-object interaction in a report in Power BI Desktop.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: shafeeq, ranin
ms.custom:
ms.service: powerbi
ms.subservice:
ms.topic: how-to
ms.date: 12/11/2023
LocalizationGroup: Visualizations
---

# Support on-object interactions in visuals (preview)

[On-object formatting](../../create-reports/power-bi-on-object-interaction.md) allows users to quickly and easily modify the format of visuals by directly selecting the elements they want to modify. When an element is selected, the format pane automatically navigates and expands the specific formatting setting for the selected element.
For more information about on-object formatting, see [On-object formatting in Power BI Desktop](../../create-reports/power-bi-on-object-interaction.md).

To add these functionalities to your visual, Each visual needs to provide a sub-selection style options and shortcuts for each sub-selectable region.

> [!NOTE]
> Visuals that support on-object formatting need to implement the [getFormattingModel API](./format-pane.md#formatting-model) which is available from API version 5.1.

### [get APIs](#tab/get-apis)

The visuals need to declare that it is supporting OnObject formatting by adding the relevant capabilities to the capabiliites.json file:
{
  "supportsOnObjectFormatting": true,
  "enablePointerEventsFormatMode": true,
}


## VisualOnObjectFormatting

Visuals need to implement the `VisualOnObjectFormatting` interface which is part of the IVisual interface. It contains three methods:

* getSubSelectionStyles
* getSubSelectionShortcuts
* getSubSelectables

### getSubSelectionStyles

Each visual is required to implement a getSubSelectionStyles method, which will be called when sub-selectable element is sub-selected. The getSubSelectionStyles method will be provided with the current sub-selected elements as a CustomVisualSubSelection array and is expected to return either a SubSelectionStyles object or undefined.

SubSelectionStyles

Each of the possible SubSelectionStyles objects provides a different experience for the user for modifying the style of an element. We can define style modification into three definitive categories which should cover most scenarios: Text, Numeric Text and Shape.

### getSubSelectionShortcuts

To provide options for the user, the visual must implement the getSubSelectionShortcuts method. The getSubSelectionShortcuts method must return either VisualSubSelectionShortcuts or undefined. Additionally, if SubSelectionShortcuts are provided by the getSubSelectionShortcuts method, a VisualNavigateSubSelectionShortcut must also be provided to facilitate when a user sub-selects an element and the format pane is open, the pane will automatically scroll to the appropriate card.

SubSelectionShortcuts
There are a variety of sub-selection shortcuts to modify the visual state. Each will define a menu item in the context menu with the appropriate label.

Sub-Selection Disambiguation Menu
The On-Object disambiguation menu provides a method for users to select their desired sub-selection in the case that it is clear which visual element is being sub-selected. Often times, this occurs when the user sub-selects the background of the visual, thus presenting the disambiguous menu. For the disambiguous menu to present additional sub-selections, the visual is required to provide all sub-selections via the getSubSelectables method.

### getSubSelectables

To provide sub-selections to the disambiguation menu, the visual needs to implement the getSubSelectables method. The method will be provided an optional filterType argument, of type SubSelectionStylesType and should return an array of CustomVisualSubSelection or undefined. 
In the case that the HTMLSubSelectionHelper is being utilized to create sub-selection, the HTMLSubSelectionHelper.getSubSelectables() method can be used to gather sub-selectable elements from the DOM.

Sub-Selection Direct Text Editing
On-Object offers the ability to directly edit the text of a sub-selectable element by double-clicking. 
To provide a direct-edit capability, a RectangleSubSelectionOutline must be provided with the appropriate cVDirectEdit Property populated with a SubSelectableDirectEdit object. The outline can either be provided as a custom outline or if you are using the HTMLSubSelectionHelper you can use the SubSelectableDirectEdit attribute. (check out the attributes provided by the HTMLSubSelectionHelper)

Note: adding a direct edit for a specific datapoint (using selectors) will be supported from Desktop SU03

FormattingId:
This interface will be used for the references of the subSelction shortcuts and styles.
interface FormattingId {
            objectName: string;
            propertyName: string;
            selector?: powerbi.data.Selector;
        }
objectName: the object name as declared in the capabilities.json.
propertyName: the property name of an object as declared in the capabilities.json.
selector:  if the datapoint has a selectionId, use selectionId.getSelector(), this selector must be the same as provided for the formatting model slice.


Example:
In this example we will build a custom visual which has two objects 'colorSelector' and 'directEdit'.
We  use the HTMLSubSelectionHelper from the onobjectFormatting utils, to handle most of the job of the subSelection.
you can see how to do  that in the onobject utils documentation.

We will build for them cards for the formatting pane and provide subSelectionShortcuts and styles for each sub-selectable.

First lets define the objects and declare that the visual is supporting OnObject Formatting in the capabilities.json:

"objects": {
      "directEdit": {
      "properties": {
        "show": {
          "displayName": "Show",
          "type": {
            "bool": true
          }
        },
        "textProperty": {
          "displayName": "Text",
          "type": {
            "text": true
          }
        },
        "fontFamily": {
          "type": {
            "formatting": {
              "fontFamily": true
            }
          }
        },
        "fontSize": {
          "type": {
            "formatting": {
              "fontSize": true
            }
          }
        },
        "bold": {
          "type": {
            "bool": true
          }
        },
        "italic": {
          "type": {
            "bool": true
          }
        },
        "underline": {
          "type": {
            "bool": true
          }
        },
        "fontColor": {
          "displayName": "Font Color",
          "type": {
            "fill": {
              "solid": {
                "color": true
              }
            }
          }
        },
        "background": {
          "displayName": "Background",
          "type": {
            "fill": {
              "solid": {
                "color": true
              }
            }
          }
        },
        "position": {
          "displayName": "Position",
          "type": {
            "enumeration": [
              { "displayName": "Left", "value": "Left" }, { "displayName": "Right", "value": "Right" }
            ]
          }
        }
      }
    },
    "colorSelector": {
      "displayName": "Data Colors",
      "properties": {
        "fill": {
          "displayName": "Color",
          "type": {
            "fill": {
              "solid": {
                "color": true
              }
            }
          }
        }
      }
    },
   },
  "supportsOnObjectFormatting": true,
  "enablePointerEventsFormatMode": true,

Now we will build their formatting cards using the formattingModel utils

class ColorSelectorCardSettings extends Card {
    name: string = "colorSelector";
    displayName: string = "Data Colors";
    slices = [];
}
We will add a method to the formattingSetting so we can populate the slices dynamically for the colorSelector object (these will be our datapoints).

class DirectEditSettings extends Card {
    displayName = 'Direct Edit';
    name = 'directEdit';
    private minFontSize: number = 8;
    private defaultFontSize: number = 11;
    show = new formattingSettings.ToggleSwitch({
        name: "show",
        displayName: undefined,
        value: true,
    });
    topLevelSlice = this.show;
    textProperty = new formattingSettings.TextInput({
        displayName: "Text Property",
        name: "textProperty",
        value: "What is your quest?",
        placeholder: ""
    });
    position = new formattingSettings.ItemDropdown({
        name: 'position',
        items: [{ displayName: 'Left', value: 'Left' }, { displayName: 'Right', value: 'Right' }],
        value: { displayName: 'Right', value: 'Right' }
    });
    font = new formattingSettings.FontControl({
        name: "font",
        displayName: 'Font',
        fontFamily: new formattingSettings.FontPicker({
            name: "fontFamily",
            displayName: "Font Family",
            value: "Segoe UI, wf_segoe-ui_normal, helvetica, arial, sans-serif"
        }),
        fontSize: new formattingSettings.NumUpDown({
            name: "fontSize",
            displayName: "Font Size",
            value: this.defaultFontSize,
            options: {
                minValue: {
                    type: powerbi.visuals.ValidatorType.Min,
                    value: this.minFontSize,
                }
            }
        }),
        bold: new formattingSettings.ToggleSwitch({
            name: 'bold',
            displayName: "Font Size",
            value: true
        }),
        italic: new formattingSettings.ToggleSwitch({
            name: 'italic',
            displayName: "Font Size",
            value: true
        }),
        underline: new formattingSettings.ToggleSwitch({
            name: 'underline',
            displayName: "Font Size",
            value: true
        })
    });
    fontColor = new formattingSettings.ColorPicker({
        name: "fontColor",
        displayName: "Color",
        value: { value: "#000000" }
    });
    background = new formattingSettings.ColorPicker({
        name: "background",
        displayName: "Color",
        value: { value: "#FFFFFF" }
    });
    slices = [this.show, this.textProperty, this.font, this.fontColor, this.background, this.position];
}

Now we will add the following method to the FormattingSettingModel for our visual:

populateColorSelector(dataPoints: BarChartDataPoint[]) {
        let slices: formattingSettings.ColorPicker[] = this.colorSelector.slices;
        if (dataPoints) {
            dataPoints.forEach(dataPoint => {
                slices.push(new formattingSettings.ColorPicker({
                    name: "fill",
                    displayName: dataPoint.category,
                    value: { value: dataPoint.color },
                    selector: dataPoint.selectionId.getSelector(),
                }));
            });
        }
    }
important:  we pass the selector of the specific datapoint in the selector field, this selector will be also used when implementing the get APIs of the OnObject.

Now let's add to our objects the needed HTMLSubSelectionHelper attributes, (to see which attributes the HTMLSubSelectionHelper provide please check the on object utils documentation)
For the directEdit:
const DirectEdit: powerbi.visuals.SubSelectableDirectEdit = {
    reference: {
        objectName: 'directEdit',
        propertyName: 'textProperty'
    },
    style: SubSelectableDirectEditStyle.Outline,
};
private visualDirectEditSubSelection = JSON.stringify(DirectEdit);

this.directEditElement
            .classed('direct-edit', true)
            .classed('hidden', !this.formattingSettings.directEditSettings.show.value)
            .classed(HtmlSubSelectableClass, options.formatMode && this.formattingSettings.directEditSettings.show.value)
            .attr(SubSelectableObjectNameAttribute, 'directEdit')
            .attr(SubSelectableDisplayNameAttribute, 'Direct Edit')
            .attr(SubSelectableDirectEditAttr, this.visualDirectEditSubSelection)
	…..

The HTMLSubSelectionHelper will use SubSelectableDirectEditAttr attribute to provide the directEdit reference of the directEdit outline, so when a user double click on the element, a direct edit will start.


For the colorSelector:
barSelectionMerged
            .attr(SubSelectableObjectNameAttribute, 'colorSelector')
            .attr(SubSelectableDisplayNameAttribute, (dataPoint: BarChartDataPoint) => this.formattingSettings.colorSelector.slices[dataPoint.index].displayName)
            .attr(SubSelectableTypeAttribute, powerbi.visuals.SubSelectionStylesType.Shape)
            .classed(HtmlSubSelectableClass, options.formatMode)


Let's define our references, we will define the following interface to make it simpler for the examples:
interface References {
    cardUid?: string;
    groupUid?: string;
    fill?: FormattingId;
    font?: FormattingId;
    fontColor?: FormattingId;
    show?: FormattingId;
    fontFamily?: FormattingId;
    bold?: FormattingId;
    italic?: FormattingId;
    underline?: FormattingId;
    fontSize?: FormattingId;
    position?: FormattingId;
    textProperty?: FormattingId;
}

Let's create an enum for the objects names:
const enum BarChartObjectNames {
    ColorSelector = 'colorSelector',
    DirectEdit = 'directEdit'
}

References for the directEdit object:

const directEditReferences: References = {
    cardUid: 'Visual-directEdit-card',
    groupUid: 'directEdit-group',
    fontFamily: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'fontFamily'
    },
    bold: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'bold'
    },
    italic: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'italic'
    },
    underline: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'underline'
    },
    fontSize: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'fontSize'
    },
    fontColor: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'fontColor'
    },
    show: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'show'
    },
    position: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'position'
    },
    textProperty: {
        objectName: BarChartObjectNames.DirectEdit,
        propertyName: 'textProperty'
    }
};

For colorSelctor:
const colorSelectorReferences: References = {
    cardUid: 'Visual-colorSelector-card',
    groupUid: 'colorSelector-group',
    fill: {
        objectName: BarChartObjectNames.ColorSelector,
        propertyName: 'fill'
    }
};


Now let's implement the get APIs for the onObject formatting and provide them in the visualOnObjectFormatting:
In the constructor code we will provide the get methods in the visualOnObjectFormatting:

public visualOnObjectFormatting: powerbi.extensibility.visual.VisualOnObjectFormatting;
constructor(options: VisualConstructorOptions) {
        this.subSelectionHelper = HtmlSubSelectionHelper.createHtmlSubselectionHelper({
                 hostElement: options.element,
                 subSelectionService: options.host.subSelectionService,
                 selectionIdCallback: (e) => this.selectionIdCallback(e),
            });

	this.visualOnObjectFormatting = {
                getSubSelectionStyles: (subSelections) => this.getSubSelectionStyles(subSelections),
                getSubSelectionShortcuts: (subSelections, filter) => this.getSubSelectionShortcuts(subSelections, filter),
                getSubSelectables: (filter) => this.getSubSelectables(filter)
            }
   }

private getSubSelectionStyles(subSelections: CustomVisualSubSelection[]): powerbi.visuals.SubSelectionStyles | undefined {
        const visualObject = subSelections[0]?.customVisualObjects[0];
        if (visualObject) {
            switch (visualObject.objectName) {
                case BarChartObjectNames.ColorSelector:
                    return this.getColorSelectorStyles(subSelections);
                 case BarChartObjectNames.DirectEdit:
                    return this.getDirectEditStyles();
            }
        }
    }

private getSubSelectionShortcuts(subSelections: CustomVisualSubSelection[], filter: SubSelectionShortcutsKey | undefined): VisualSubSelectionShortcuts | undefined {
        const visualObject = subSelections[0]?.customVisualObjects[0];
        if (visualObject) {
            switch (visualObject.objectName) {
                case BarChartObjectNames.ColorSelector:
                    return this.getColorSelectorShortcuts(subSelections);
                case BarChartObjectNames.DirectEdit:
                    return this.getDirectEditShortcuts();
            }
        }
    }

Let's implement the getSubSelction shortcuts and style for the colorSelector:

private getColorSelectorShortcuts(subSelections: CustomVisualSubSelection[]): VisualSubSelectionShortcuts {
        const selector = subSelections[0].customVisualObjects[0].selectionId?.getSelector();
        return [
            {
                type: VisualShortcutType.Reset,
                relatedResetFormattingIds: [{
                    ...colorSelectorReferences.fill,
                    selector
                }],
            },
            {
                type: VisualShortcutType.Navigate,
                destinationInfo: { cardUid: colorSelectorReferences.cardUid },
                label: 'Color'
            }
        ];
    }
The above shortcut will a relevant menu item in the context menu and will add the following functionalities:
  1.  VisualShortcutType.Navigate: when a user click on one of the bars (data point), and the formatting pane is open, the format pane will scroll to the color selctor card and open it
	1. VisualShortcutType.Reset: this will add a reset shortcut to the context menu, it will be enabled if the fill color was changed.

private getColorSelectorStyles(subSelections: CustomVisualSubSelection[]): SubSelectionStyles {
        const selector = subSelections[0].customVisualObjects[0].selectionId?.getSelector();
        return {
            type: SubSelectionStylesType.Shape,
            fill: {
                label: 'Fill',
                reference: {
                    ...colorSelectorReferences.fill,
                    selector
                },
            },
        };
    }

this how the UI looks when a user right click on a bar:



When changing the color:



Let's implement the subSelection shortcuts and styles for the directEdit:

private getDirectEditShortcuts(): VisualSubSelectionShortcuts {
        return [
            {
                type: VisualShortcutType.Reset,
                relatedResetFormattingIds: [
                    directEditReferences.bold,
                    directEditReferences.fontFamily,
                    directEditReferences.fontSize,
                    directEditReferences.italic,
                    directEditReferences.underline,
                    directEditReferences.fontColor,
                    directEditReferences.textProperty
                ]
            },
            {
                type: VisualShortcutType.Toggle,
                relatedToggledFormattingIds: [{
                    ...directEditReferences.show,
                }],
                ...directEditReferences.show,
                disabledLabel: 'Delete',
            },
            {
                type: VisualShortcutType.Picker,
                ...directEditReferences.position,
                label: 'Position'
            },
            {
                type: VisualShortcutType.Navigate,
                destinationInfo: { cardUid: directEditReferences.cardUid },
                label: 'Direct edit'
            }
        ];
    }

The above shortcut will add a relevant menu item in the context menu and will add the following functionalities:
	1. VisualShortcutType.Reset: will add a reset to default item to the context menu, when one of the properties that is provided in relatedResetFormattingIds array changes.
	2. VisualShortcutType.Toggle: will add a Delete options to the context menu, when clicked, the toggle switch for the directEdit card will be turned off.
	3. VisualShortcutType.Picker: as we added the position slice in the formatting card for the directEdit, this will shortcut will added an option in the context menu to pick between Right and Left.
	4. VisualShortcutType.Navigate: when the format pane is open, and user clicks on the directEdit element, the format pane will scroll and open the directEdit card.

private getDirectEditStyles(): SubSelectionStyles {
        return {
            type: powerbi.visuals.SubSelectionStylesType.Text,
            fontFamily: {
                reference: {
                    ...directEditReferences.fontFamily
                },
                label: 'font family'
            },
            bold: {
                reference: {
                    ...directEditReferences.bold
                },
                label: 'bold'
            },
            italic: {
                reference: {
                    ...directEditReferences.italic
                },
                label: 'italic'
            },
            underline: {
                reference: {
                    ...directEditReferences.underline
                },
                label: 'underline'
            },
            fontSize: {
                reference: {
                    ...directEditReferences.fontSize
                },
                label: 'font size'
            },
            fontColor: {
                reference: {
                    ...directEditReferences.fontColor
                },
                label: 'font color'
            },
            background: {
                reference: {
                    objectName: 'directEdit',
                    propertyName: 'background'
                },
                label: 'background'
            }
        }
    }
We provided the relevant properties as we added them in the formattingSettings.

This is how the UI look when right clicking on the directEdit element:






Localization:
The visual should handle the localization and provide localized strings.


Github resources:
	• All on object formatting interfaces can be found in (link to be provided once the API is released) in on-object-formatting-api.d.ts
	• We recommend using the on object utils which includes the HTMLSubSelectionHelper (link to be provided once the API is released)
	• you can find an example of a custom visual SampleBarChart that uses API version 5.8.0 and implements the support for the on object formatting using the on object utils at (link to be provided once the API is released)

### [service documentation](#tab/service-documentation)

As part of the on object formatting, we introduce the sub-selection service which is used for emitting sub-selection and outlines to PowerBI. 

 

The SubSelection Service provides two methods: 

subSelect 

updateRegionOutlines 

 

subSelect 

Emits sub-subselection to PowerBI, it should be used when a user clicks on a sub-selectable element. 

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

 

customVisualObjects: this is an array which contains customVisualObjects, the objectName of the object should be as declared in the capabilities.json, and the selectionId for the selected data point if exists. 

displayName:  the display name, it should be localized if the visual supports localization. 

subSelectionType: the type of the sub-selection(shape, text or Numeric text) 

selectionOrigin: the coordinates of the sub-selected element. 

showUI: Whether to show the UI for this sub-selection, like formatting context menus and toolbar 

immediateDirectEdit:  If immediate direct edit should be triggered, the ID of the sub-selection outline to edit 

 

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

            this.hostElement.addEventListener('contextmenu',  this.handleFormatModeContextMenu); 

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

 

updateRegionOutlines 

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

            this.hostElement.addEventListener('contextmenu',  this.handleFormatModeContextMenu); 

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

 

 
### [Utils](#tab/utils)

|     CSS Class               |     Purpose                                                                                 |     Required    |   |
|-----------------------------|---------------------------------------------------------------------------------------------|-----------------|:-:|
|     sub-selectable          |     Provides a selector   for the HTMLSubSelectionHelper to find possible sub-selections    |     yes         |   |



|     Attribute Name                              |     Attribute                                 |     Purpose                                                                                                            |     Required                                                   |     Type                                                        |     Example                                                                                                                                     |
|-------------------------------------------------|-----------------------------------------------|------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|-----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
|     SubSelectableDisplayNameAttribute           |     data-sub-selection-display-name           |     Provide a localized   string for display name of the sub-selected element                                          |     yes                                                        |     string                                                      |     data-sub-selection-display-name="Visual   Title"                                                                                            |
|     SubSelectableObjectNameAttribute            |     data-sub-selection-object-name            |     Provide an object   name to associate with sub-selection shortcuts and style                                       |     yes                                                        |     string                                                      |     data-sub-selection-object-name="title"                                                                                                      |
|     SubSelectableTypeAttribute                  |     data-sub-selection-type                   |     Provide the type of   the sub-selected style                                                                       |     yes                                                        |     SubSelectionStylesType                                      |     data-sub-selection-type="1"                                                                                                                 |
|     SubSelectableDirectEdit                     |     data-sub-selection-direct-edit            |     Provide direct text   edit references, including the CardUID, GroupUID, and the orientation of the   text box      |     no                                                         |     SubSelectableDirectEdit   should be provided as a string    |     data-sub-selection-direct-edit="{"reference":{"cardUid":"Visual-title","groupUid":"title-text","sliceUid":"title-text-text"},"style":0}"    |
|     SubSelectableHideOutlineAttribute           |     data-sub-selection-hide-outline           |     Provide a boolean   value for sub-selectable elements which should not have an outline shown                       |     no                                                         |     boolean                                                     |     data-sub-selection-hide-outline="true"                                                                                                      |
|     SubSelectableRestrictingElementAttribute    |     data-sub-selection-restricting-element    |     Used to indicate the   element which will restricted the outlines and the type of restriction (clamp   or clip)    |     no                                                         |     SubSelectionOutlineRestrictionType                          |     data-sub-selection-restricting-element="1"                                                                                                  |
|     SubSelectableSubSelectedAttribute           |     data-sub-selection-sub-selected           |     Indicate whether the   sub-selectable is selected or not                                                           |     No, the helper   assigns it to the elements when needed    |     Boolean                                                     |     data-subselection-sub-selected="true"                                                                                                       |
