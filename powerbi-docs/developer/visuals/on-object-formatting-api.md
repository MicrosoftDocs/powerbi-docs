---
title: Format objects directly API in Power BI Visuals
description: The article describes how to use Power BI Visuals On-object formatting API to allow users to format visuals easily.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov , shafeeq
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 02/19/2024
---

# On-object formatting API (preview)

[On-object formatting](../../create-reports/power-bi-on-object-interaction.md) allows users to quickly and easily modify the format of visuals by directly selecting the elements they want to modify. When an element is selected, the format pane automatically navigates and expands the specific formatting setting for the selected element.
For more information about on-object formatting, see [On-object formatting in Power BI Desktop](../../create-reports/power-bi-on-object-interaction.md).

To add these functionalities to your visual, each visual needs to provide a subselection style option and shortcut for each subselectable region.

> [!NOTE]
>
> * Visuals that support on-object formatting need to implement the [getFormattingModel API](./format-pane.md#formatting-model) which is available from API version 5.1.
> * If you are using powerbi-visuals-utils-formattingmodel, use version 6.0.0 at least.

## Create an on-object experience

Use the subselection service when the user selects a subselectable element to send Power BI the subselection. Provide the subselection styles and shortcuts using the [subselction API](./subselection-api.md). The [subselection helper](./utils-on-object.md) can be used to simplify the process.

## Format mode

Format mode is a new mode where the user can turn `onObject` formatting on and off when in authoring mode. The visual is updated with the status of the format mode in the update options. The update options also include the currently subselected subSelection as `CustomVisualSubSelection`.

## How to implement the on-object formatting API

### Capabilities file

In the *capabilites.json* file, add the following properties to declare that the visual supports on-object formatting:

```json
{
  "supportsOnObjectFormatting": true,
  "enablePointerEventsFormatMode": true,
}
```

### IVisual interface

The visual needs to implement the `VisualOnObjectFormatting` interface as part of the IVisual interface.

VisualOnObjectFormatting contains three methods:

* [getSubSelectionStyles](#getsubselectionstyles)
* [getSubSelectionShortcuts](#getsubselectionshortcuts)
* [getSubSelectables](#getsubselectables)

#### getSubSelectionStyles

Each visual is required to implement a `getSubSelectionStyles` method, which is called when a subselectable element is subselected. The `getSubSelectionStyles` method is provided with the current subselected elements as a `CustomVisualSubSelection` array and is expected to return either a `SubSelectionStyles` object or `undefined`.

There are three categories of subselection styles that cover most scenarios:

* Text
* Numeric Text
* Shape

Each `SubSelectionStyles` object provides a different experience for the user for modifying the style of an element.

#### getSubSelectionShortcuts

To provide more options for the user, the visual must implement the `getSubSelectionShortcuts` method. This  method returns either `VisualSubSelectionShortcuts` or `undefined`. Additionally, if `SubSelectionShortcuts` are provided, a `VisualNavigateSubSelectionShortcut` must also be provided so that when a user subselects an element and the format pane is open, the pane automatically scrolls to the appropriate card.

There are several subselection shortcuts to modify the visual state. Each one defines a menu item in the context menu with the appropriate label.

**Sub-Selection Disambiguation Menu:**
The On-Object disambiguation menu provides a method for users to select their desired subselection when it's not clear which visual element is being subselected. This often happens when the user subselects the background of the visual. For the disambiguous menu to present more subselections, the visual must provide all subselections via the [`getSubSelectables`](#getsubselectables) method.

#### getSubSelectables

To provide subselections to the disambiguation menu, the visual needs to implement the `getSubSelectables` method. This method is provided an optional `filterType` argument, of type `SubSelectionStylesType` and returns an array of `CustomVisualSubSelection` or `undefined`.
If the `HTMLSubSelectionHelper` is being utilized to create a subselection, the *HTMLSubSelectionHelper.getSubSelectables()* method can be used to gather subselectable elements from the DOM.

**Sub-Selection Direct Text Editing:**
With On-Object formatting, you can double-click the text of a subs-electable element to directly edit it.
To provide direct-edit capability, you need to provide a `RectangleSubSelectionOutline` with the appropriate cVDirectEdit Property populated with a SubSelectableDirectEdit object. The outline can either be provided as a custom outline or, if you're using the `HTMLSubSelectionHelper` you can use the `SubSelectableDirectEdit` attribute. (See the attributes provided by the HTMLSubSelectionHelper)

Adding a direct edit for a specific datapoint (using selectors) isn't yet supported.

### FormattingId interface

The following interface is used to reference the `subSelection` shortcuts and styles.

```typescript
interface FormattingId {
            objectName: string;
            propertyName: string;
            selector?: powerbi.data.Selector;
        }
```

* objectName: the object name as declared in the capabilities.json.
* propertyName: the property name of an object as declared in the capabilities.json.
* selector:  if the datapoint has a selectionId, use selectionId.getSelector(), this selector must be the same as provided for the formatting model slice.

## Examples

In this example, we  build a custom visual that has two objects, `colorSelector` and `directEdit`. We use the `HTMLSubSelectionHelper` from the `onobjectFormatting` utils, to handle most of the subSelection job.
For more information, see [on-object utils](./utils-on-object.md).

First, we build cards for the formatting pane and provide *subSelectionShortcuts* and *styles* for each subselectable.

### Define the objects

Define the objects and declare that the visual is supporting OnObject Formatting in the capabilities.json:

```json
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
```

### Build the formatting cards

Build their formatting cards using the [formattingModel utils](./format-pane.md#formatting-model).

#### Color selector card settings

```typescript
class ColorSelectorCardSettings extends Card {
    name: string = "colorSelector";
    displayName: string = "Data Colors";
    slices = [];
}
```

Add a method to the formattingSetting so we can populate the slices dynamically for the colorSelector object (our datapoints).

```typescript
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
```

We pass the selector of the specific datapoint in the selector field. This selector is the one used when implementing the get APIs of the OnObject.

#### Direct edit card settings

```typescript
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
```

### Use subselection helper attributes

Add the `HTMLSubSelectionHelper` attributes to our objects. To see which attributes the HTMLSubSelectionHelper provide, check the on [object utils documentation](./utils-on-object.md).

* For the directEdit attribute:

  ```typescript
  import {
     HtmlSubSelectableClass, HtmlSubSelectionHelper, SubSelectableDirectEdit as SubSelectableDirectEditAttr,
     SubSelectableDisplayNameAttribute, SubSelectableObjectNameAttribute, SubSelectableTypeAttribute 
  } from 'powerbi-visuals-utils-onobjectutils';

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
  ```

  The `HTMLSubSelectionHelper` uses the `SubSelectableDirectEditAttr` attribute to provide the directEdit reference of the directEdit outline, so a direct edit starts when a user double clicks on the element.

    :::image type="content" source="./media/on-object-formatting-api/sub-selection-helper.png" alt-text="Screenshot showing how the subselection helper works.":::

* For the colorSelector:

  ```typescript
  barSelectionMerged
            .attr(SubSelectableObjectNameAttribute, 'colorSelector')
            .attr(SubSelectableDisplayNameAttribute, (dataPoint: BarChartDataPoint) => this.formattingSettings.colorSelector.slices[dataPoint.index].displayName)
            .attr(SubSelectableTypeAttribute, powerbi.visuals.SubSelectionStylesType.Shape)
            .classed(HtmlSubSelectableClass, options.formatMode)

  ```

### Define references

Define the following interface to simplify the examples:

> [!NOTE]
> The `cardUid` you provide should be the same as the one provided for the getFormattingModel API. For example, if you're using powerbi-visuals-utils-formattingmodel, provide the `cardUid` as *Visual-cardName-card*, where the cardName is the name you assigned to this card in the formatting model settings. Otherwise, provide it as the *Visual-cardUid* you assigned to this card.

```typescript
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
```

For the purpose of this example, create an enum for the objects names:

```typescript
const enum BarChartObjectNames {
    ColorSelector = 'colorSelector',
    DirectEdit = 'directEdit'
}
```

* References for the `directEdit` object:

```typescript
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
```

* For `colorSelector`:

```typescript
const colorSelectorReferences: References = {
    cardUid: 'Visual-colorSelector-card',
    groupUid: 'colorSelector-group',
    fill: {
        objectName: BarChartObjectNames.ColorSelector,
        propertyName: 'fill'
    }
};
```

### Implement APIs

Now let's implement the get APIs for the onObject formatting and provide them in the visualOnObjectFormatting:

1. In the constructor code, provide the get methods in the visualOnObjectFormatting:

    ```typescript
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
                    getSubSelectables: (filter) => this. getSubSelectables(filter)
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

    private getSubSelectionShortcuts(subSelections: CustomVisualSubSelection[], filter: SubSelectionShortcutsKey | undefined):    VisualSubSelectionShortcuts | undefined {
            const visualObject = subSelections[0]?.  customVisualObjects[0];
            if (visualObject) {
                switch (visualObject.objectName) {
                    case BarChartObjectNames.ColorSelector:
                        return this.getColorSelectorShortcuts(subSelections);
                    case BarChartObjectNames.DirectEdit:
                        return this.getDirectEditShortcuts();
                }
            }
        }
    ```

1. Implement the getSubSelection shortcuts and style for the colorSelector:

    ```typescript
    private getColorSelectorShortcuts(subSelections:  CustomVisualSubSelection[]): VisualSubSelectionShortcuts   {
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
    ```

    The above shortcut returns relevant menu item in the context menu and adds the following functionalities:

    * VisualShortcutType.Navigate: when a user selects on one of the bars (data point), and the formatting pane is open, the format pane scrolls to the color selector card and open it
    * VisualShortcutType.Reset: adds a reset shortcut to the context menu. It's enabled if the fill color was changed.

    ```typescript
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
    ```

When a user right-clicks on a bar, the following appears:

:::image type="content" source="./media/on-object-formatting-api/right-click-bar.png" alt-text="Screenshot of user interface when a user right-clicks on a bar.":::

When changing the color:

:::image type="content" source="./media/on-object-formatting-api/change-color.png" alt-text="Screenshot of changing color.":::

### Subsection shortcuts

To implement the subSelection shortcuts and styles for the directEdit:

```typescript
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
```

This shortcut adds a relevant menu item in the context menu and adds the following functionalities:

* VisualShortcutType.Reset: adds a reset to the default item to the context menu, when one of the properties provided in relatedResetFormattingIds array changes.
* VisualShortcutType.Toggle: adds a Delete options to the context menu. When clicked, the toggle switch for the *directEdit* card is turned off.
* VisualShortcutType.Picker: Adds an option in the context menu to pick between Right and Left, since we added the position slice in the formatting card for the *directEdit*.
* VisualShortcutType.Navigate: When the format pane is open and the user selects the *directEdit* element, the format pane scrolls and opens the *directEdit* card.

```typescript
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
```

We provided the relevant properties as we added them in the formattingSettings.

The following image illustrates how the UI looks when right-clicking on the directEdit element:

:::image type="content" source="./media/on-object-formatting-api/direct-edit.png" alt-text="Screenshot of the direct edit interface.":::

## Localization

The visual should handle the localization and provide localized strings.

## GitHub resources

* All on object formatting interfaces can be found in (link to be provided once the API is released) in on-object-formatting-api.d.ts
* We recommend using the [on object utils], which include the [HTMLSubSelectionHelper](link to be provided once the API is released)
* You can find an example of a custom visual [SampleBarChart](./create-bar-chart.md) that uses API version 5.8.0 and implements the support for the on object formatting using the on object utils at (link to be provided once the API is released)

## Related content

* [Subselection API](./subselection-api.md)
* [On-object utils](./utils-on-object.md)
