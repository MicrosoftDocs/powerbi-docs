
# Customize the format pane in Power BI custom visuals

Starting from API version 5.0, developers can create visuals that use the [new Power format pane](../../fundamentals/desktop-format-pane.md). Developers can define the cards and their categories for any property in their custom visual, making it easier for report creators to use these visuals.

The new API uses the **FormattingModel** method to customize parts of the format and analytics panes.

> [!TIP]
> The `getFormattingModel` method replaces the `enumerateObjectInstances` method used in earlier API versions.

The `getFormattingModel` returns a `FormattingModel` that defines how the visual's formatting and analytics pane look.

In addition to all the old formatting pane capabilities, the new formatting model supports  new format pane capabilities, new properties and new hierarchies.

To upgrade to API version 5.0+, set the `apiVersion` in your *pbiviz.json* file to `5.0` or later.

## Create a visual that supports the new format pane

To create a custom visual that uses the new format pane:

1. Define all the customizable [`objects`](./objects-properties.md) in your *capabilities.json* file.  
   The following properties are required for each object:

   * object name
   * property name
   * property type
  
   All other properties, including `DisplayName` and `description`, are now optional.

2. Build the custom visual [**FormattingModel**](#formatting-model).
  Define the properties of your custom visual formatting model and build it using code (not JSON).

3. Implement the `getFormattingModel` API in the custom visual class that returns custom visual formatting model. (This API replaces the `enumerateObjectInstances` that was used in previous versions).

## Map formatting properties

If you have a custom visual created with an older API and you want to migrate to the new format pane, or if you're creating a new custom visual:

1. Set the `apiVersion` in your *pbiviz.json* file to `5.0` or later.

2. For each object name and property name in *capabilities.json*, create a matching formatting property. The formatting property should have a `descriptor` that contains an `objectName` and `propertyName` that matches the object name and property name in *capabilities.json*.

The `objects` properties in the capabilities file still have the same format and don't need to be changed.

For example, if the `circle` object in your *capabilities.json* file is defined like this:

```json
"objects": {
    "circle": {
        "properties": {
            "circleColor": {
                "type": {
                    "fill": {
                        "solid": {
                            "color": true
                        }
                    }
                  }
          },
        }
      }
    }
```

The formatting Property in your model should be of type `ColorPicker` and look like this:

```javascript
control: {
    type: "ColorPicker",
    properties: {
        descriptor: {
            objectName: "circle",
            propertyName: "circleColor"
        },
        value: {
            value: this.visualSettings.circle.circleColor
        }
    }
}
```

You'll get an error if one of the following conditions is true:

* The object or property name in the capabilities file doesn’t match the one in the formatting model
* The property type in the capabilities file doesn’t match the type in formatting model

## Formatting model

The formatting model is where you describe and customize all the properties of your format pane.

### Formatting model components

In the new formatting model, property components are grouped together in logical categories and subcategories. These groups make the model easier to scan. There are the five basic components, from largest to smallest:

* **Formatting model**  
  The largest pane container, used for formatting the pane's frontal interface. It contains a list of formatting cards.

* **Formatting card**  
  The top level properties grouping container for formatting properties. Each card consists of a list of formatting groups.

* **Formatting group**  
  The secondary-level properties grouping container. The formatting group is displayed as a grouping container for formatting slices.

* **Formatting slice**  
  Property container. There are two types of slices:
  
  * Simple slice: Individual property container
  * [Composite slice](#composite-slice-properties): Multiple related property containers grouped into one formatting slice

:::image type="content" source="./media/format-pane/format-pane-components.png" alt-text="Screenshot of two format panes with the different components outlined." lightbox="media/format-pane/format-pane-components.png":::

### Visualization pane formatting properties

Every property in the formatting model should match and object type in the *capabilities.json* file.

The following table shows the formatting property types in *capabilities.json* file and their matching type class in modern formatting model properties:

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Boolean          | Bool                    | ToggleSwitch         |
| Number           | <li>numeric</li> <li> integer </li>       | <li> NumUpDown </li> <li>Slider</li>     |
| Enumeration list | enumeration:[]          | <li> ItemDropdown</li> <li> ItemFlagsSelection</li><li> AutoDropdown</li><li> AutoFlagsSelection</li> <sup>*</sup> See note below       |
| Color            | Fill                    | ColorPicker          |
| Gradient         | FillRule                | GradientBar: property value should be string consisting of: </n>`minValue[,midValue],maxValue`          |
| Text             | Text                    | <li>TextInput</li> <li>TextArea</li>  |

Capabilities Formatting Objects

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Font size           | FontSize             | NumUpDown            |
| Font family         | FontFamily           | FontPicker           |
| Line Alignment      | Alignment            | AlignmentGroup       |
| Label Display Units | LabelDisplayUnits    | AutoDropDown         |

<sup>*</sup> The enumeration list formatting property is different in the formatting model and in the capabilities file.

* Declare the following properties in the formatting settings class, including the list of enumeration items:

  * ItemDropdown
  * ItemFlagsSelection  

* Declare the following properties in the formatting settings class, without the list of enumeration items. Declare their enumeration items list in *capabilities.json* under the appropriate object. (These types are the same as in the previous API versions):

  * AutoDropdown
  * AutoFlagSelection  

### Composite slice properties

A formatting composite slice is a formatting slice that contains multiple related properties all together.

For now we have two composite slice types:

* FontControl  
  This keeps all font related properties together. It consists of the following properties:
  
  * Font Family
  * Font Size
  * Bold [optional]
  * Italic [optional]
  * Underline [optional]

  Each of these properties should have a corresponding object in capabilities file:

  | Property    | Capabilities Type         | Formatting Type  |
  |-------------|---------------------------|------------------|
  | Font Family | Formatting: { fontFamily} | FontPicker       |
  | Font Size   | Formatting: {fontSize}    | NumUpDown        |
  | Bold        | Bool                      | ToggleSwitch     |
  | Italic      | Bool                      | ToggleSwitch     |
  | Underline   | Bool                      | ToggleSwitch     |

* MarginPadding
  Margin padding determines the alignment of the text in the visual. It consists of the following properties:
  
  * Left
  * Right
  * Top
  * Bottom

  Each of these properties should have a corresponding object in capabilities file:

  | Property    | Capabilities Type         | Formatting Type  |
  |-------------|---------------------------|------------------|
  | Left        | Numeric                   | NumUpDown        |
  | Right       | Numeric                   | NumUpDown        |
  | Top         | Numeric                   | NumUpDown        |
  | Bottom      | Numeric                   | NumUpDown        |
  
## Example: Formatting a data card

In this example, we show how to build a custom visual formatting model with one card.  
The card has two groups:

* **Font control group** with one composite property
  * Font control
* **Data design group** with two simple properties
  * Font color
  * Line alignment

First, add objects to capabilities file:

```json
"objects": {
        "dataCard": {
            "properties": {
                "displayUnitsProperty": {
                    "type":
                    {
                        "formatting": {
                            "labelDisplayUnits": true
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
                "fontFamily": {
                    "type": {
                        "formatting": {
                            "fontFamily": true
                        }
                    }
                },
                "fontBold": {
                    "type": {
                        "bool": true
                    }
                },
                "fontUnderline": {
                    "type": {
                        "bool": true
                    }
                },
                "fontItalic": {
                    "type": {
                        "bool": true
                    }
                },
                "fontColor": {
                    "type": {
                        "fill": {
                            "solid": {
                                "color": true
                            }
                        }
                    }
                },
                "lineAlignment": {
                    "type": {
                        "formatting": {
                            "alignment": true
                        }
                    }
                }
            }
        }
    }
```

Then, create the `getFormattingModel`

```typescript
    public getFormattingModel(): powerbi.visuals.FormattingModel {
        // Building data card, We are going to add two formatting groups "Font Control Group" and "Data Design Group"
        let dataCard: powerbi.visuals.FormattingCard = {
            description: "Data Card Description",
            displayName: "Data Card",
            uid: "dataCard_uid",
            groups: []
        }

        // Building formatting group "Font Control Group"
        // Notice that "descriptor" objectName and propertyName should match capabilities object and property names
        let group1_dataFont: powerbi.visuals.FormattingGroup = {
            displayName: "Font Control Group",
            uid: "dataCard_fontControl_group_uid",
            slices: [
                {
                    uid: "dataCard_fontControl_displayUnits_uid",
                    displayName:"display units",
                    control: {
                        type: powerbi.visuals.FormattingComponent.Dropdown,
                        properties: {
                            descriptor: {
                                objectName: "dataCard",
                                propertyName:"displayUnitsProperty"
                            },
                            value: 0
                        }
                    }
                },
                // FontControl slice is composite slice, It means it contain multiple properties inside it
                {
                    uid: "data_font_control_slice_uid",
                    displayName: "Font",
                    control: {
                        type: powerbi.visuals.FormattingComponent.FontControl,
                        properties: {
                            fontFamily: {
                                descriptor: {
                                    objectName: "dataCard",
                                    propertyName: "fontFamily"
                                },
                                value: "wf_standard-font, helvetica, arial, sans-serif"
                            },
                            fontSize: {
                                descriptor: {
                                    objectName: "dataCard",
                                    propertyName: "fontSize"
                                },
                                value: 16
                            },
                            bold: {
                                descriptor: {
                                    objectName: "dataCard",
                                    propertyName: "fontBold"
                                },
                                value: false
                            },
                            italic: {
                                descriptor: {
                                    objectName: "dataCard",
                                    propertyName: "fontItalic"
                                },
                                value: false
                            },
                            underline: {
                                descriptor: {
                                    objectName: "dataCard",
                                    propertyName: "fontUnderline"
                                },
                                value: false
                            }
                        }
                    }
                }
            ],
        };
        // Building formatting group "Font Control Group"
        // Notice that "descriptor" objectName and propertyName should match capabilities object and property names
        let group2_dataDesign: powerbi.visuals.FormattingGroup = {
            displayName: "Data Design Group",
            uid: "dataCard_dataDesign_group_uid",
            slices: [
                // Adding ColorPicker simple slice for font color
                {
                    displayName: "Font Color",
                    uid: "dataCard_dataDesign_fontColor_slice",
                    control: {
                        type: powerbi.visuals.FormattingComponent.ColorPicker,
                        properties: {
                            descriptor:
                            {
                                objectName: "dataCard",
                                propertyName: "fontColor"
                            },
                            value: { value: "#01B8AA" }
                        }
                    }
                },
                // Adding AlignmentGroup simple slice for line alignment
                {
                    displayName: "Line Alignment",
                    uid: "dataCard_dataDesign_lineAlignment_slice",
                    control: {
                        type: powerbi.visuals.FormattingComponent.AlignmentGroup,
                        properties: {
                            descriptor:
                            {
                                objectName: "dataCard",
                                propertyName: "fontColor"
                            },
                            mode: powerbi.visuals.AlignmentGroupMode.Horizonal,
                            value: "right"
                        }
                    }
                },
            ]
        };

        // Add formatting groups to data card
        dataCard.groups.push(group1_dataFont);
        dataCard.groups.push(group2_dataDesign);

        // Build and return formatting model with data card
        const formattingModel: powerbi.visuals.FormattingModel = { cards: [dataCard] };
        return formattingModel;
    }
```

Here's the resulting pane:

:::image type="content" source="./media/format-pane/format-pane-demo-result.png" alt-text="Screenshot of format pane that results from the data card example.":::


## Reset settings to default
Support resetting all formatting card properties values to default by clicking on `Reset to default` that appears in opened card

:::image type="content" source="./media/format-pane/formatCard-resetToDefault.png" alt-text="Screenshot of format card reset to default button.":::

To enable this feature you need to add a list of formatting card properties descriptors to formatting card `revertToDefaultDescriptors`, See the example here:

```typescript
let dataCard: powerbi.visuals.FormattingCard = {
    displayName: "Data Card",
    // ... card parameters and groups list

    revertToDefaultDescriptors: [
        {
            objectName: "dataCard",
            propertyName:"displayUnitsProperty"
        },
        {
            objectName: "dataCard",
            propertyName: "fontFamily"
        },

        // ... the rest of properties descriptors 
    ]
};
```

Adding `revertToDefaultDescriptors` to formatting cards will also make it possible to reset all formatting cards properties at once by clicking on `reset all settings to default` button in format pane top bar:

:::image type="content" source="./media/format-pane/format-pane-resetAllSettingsToDefault.png" alt-text="Screenshot of format pane reset all settings to default button.":::

## Formatting property selector

The optional selector in formatting properties descriptor determines where each property is bound in the dataView. There are [four distinct options](./objects-properties.md#objects-selectors-types).

You can add selector to formatting property in its descriptor object.
Example taken from [SampleBarChart](https://github.com/microsoft/PowerBI-visuals-sampleBarChart) for color custom visual data points using property selectors :
```typescript
new formattingSettings.ColorPicker({
    name: "fill",
    displayName: dataPoint.category,
    value: { value: dataPoint.color },
    selector: dataViewWildcard.createDataViewWildcardSelector(dataViewWildcard.DataViewWildcardMatchingOption.InstancesAndTotals),
    altConstantSelector: dataPoint.selectionId.getSelector(),
    instanceKind: powerbi.VisualEnumerationInstanceKinds.ConstantOrRule
}
```


## Localization 

For more about localization feature and to setup localization environment see [here]((localization.md)
Use localization manager in formatting model when string localization is required:

```typescript
displayName: this.localization.getDisplayName("Font_Color_DisplayNameKey");
description: this.localization.getDisplayName("Font_Color_DescriptionKey");
```

## GitHub Resources

* All formatting model interfaces can be found in [GitHub - microsoft/powerbi-visuals-api: Power BI custom visuals API](https://github.com/microsoft/powerbi-visuals-api) in “formatting-model-api.d.ts”

* We recommend using the new formatting model utils at [GitHub - microsoft/powerbi-visuals-utils-formattingmodel: powerbi visuals formatting model helper utils](https://github.com/microsoft/powerbi-visuals-utils-formattingmodel)

* You can find an example of a custom visual *SampleBarChart* that uses API version 5.0.0 and implements `getFormattingModel` using the new formatting model utils at [GitHub - microsoft/PowerBI-visuals-sampleBarChart: Bar Chart Custom Visual for tutorial](https://github.com/microsoft/PowerBI-visuals-sampleBarChart).

## Next steps

More questions? [Ask the Power BI Community](https://community.powerbi.com)
