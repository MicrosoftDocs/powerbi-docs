---
title: About format pane and formatting model in Power BI custom visuals
description: This article describes what the new Formatting model in Power BI custom visuals is
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/12/2023
#customer intent: As a custom Power BI visual developer, I want to learn how to customize the new Format pane in Power BI custom visuals using the new formatting model so that I can create visuals that are easier for report creators to use.
---

# The format pane in Power BI custom visuals

Starting from API version 5.1, developers can create visuals that use the [new Power format pane](../../fundamentals/desktop-format-pane.md). Developers can define the cards and their categories for any property in their custom visual, making it easier for report creators to use these visuals.

The new API uses the **FormattingModel** method to customize parts of the format and analytics panes.

> [!TIP]
> The `getFormattingModel` method replaces the `enumerateObjectInstances` method in earlier API versions.

The `getFormattingModel` returns a `FormattingModel` that defines how the visual's formatting and analytics pane look.

In addition to all the old formatting pane capabilities, the [new formatting model](#formatting-model) supports new format pane capabilities, new properties, and new hierarchies.

:::image type="content" source="media/format-pane/formatting-model.png" alt-text="Screenshot of the new formatting pane.":::

## Create a visual that supports the new format pane

General steps to add the new format pane support to a custom visual:

1. Set the `apiVersion` in your *pbiviz.json* file to `5.1` or later.

2. Define all the customizable [`objects`](./objects-properties.md) in your *capabilities.json* file. These objects are then [mapped](#map-formatting-properties) to the properties of the formatting pane.
   The following properties are required for each object:

   * object name
   * property name
   * property type
  
   All other properties, including `DisplayName` and `description`, are now optional. 

3. Build the custom visual [**FormattingModel**](#formatting-model) by doing **one** of the following:

* Use [formattingmodel util](./utils-formatting-model.md). (**Recommended**)
* Without this util, use only APIs.

  Define the properties of your custom visual formatting model and build it using code (not JSON).

4. Implement the `getFormattingModel` API in the custom visual class that returns custom visual formatting model. (This API replaces the `enumerateObjectInstances` that was used in previous versions).

## Example of formatting model implementation

* Formatting model using [**formattingmodel util** example](utils-formatting-model.md#build-formatting-pane-model-using-formattingmodel-utils).
* Formatting model using only [**APIs** example](format-pane-example.md).

## Map formatting properties

If you have a custom visual created with an older API and you want to migrate to the new format pane, or if you're creating a new custom visual:

1. Set the `apiVersion` in your *pbiviz.json* file to `5.1` or later.

2. For each object name and property name in *capabilities.json*, create a matching formatting property. The formatting property should have a descriptor that contains an `objectName` and `propertyName` that matches the object name and property name in *capabilities.json*.

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

The formatting property in your model should be of type `ColorPicker` and look like this:

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

You get an error if one of the following conditions is true:

* The object or property name in the capabilities file doesn’t match the one in the formatting model
* The property type in the capabilities file doesn’t match the type in formatting model

## Formatting model

The formatting model is where you describe and customize all the properties of your format pane.

### Formatting model components

In the new formatting model, property components are grouped together in logical categories and subcategories. These groups make the model easier to scan. There are the five basic components, from largest to smallest:

* **Formatting model**
  The largest pane container, used for formatting the pane's frontal interface. It contains a list of formatting cards.

* [**Formatting card**](formatting-model-card.md)
  The top level properties grouping container for formatting properties. Each card consists of one or more formatting groups, as shown here.

  :::image type="content" source="./media/format-pane/formatting-cards.png" alt-text="Screenshot of formatting model with individual formatting cards.":::

* [**Formatting group**](formatting-model-group.md)  
  The secondary-level properties grouping container. The formatting group is displayed as a grouping container for formatting slices.

  :::image type="content" source="./media/format-pane/formatting-groups.png" alt-text="Screenshot of formatting cards divided into formatting groups.":::

* [**Formatting container**](formatting-model-container.md)  
  The secondary-level properties grouping container. The formatting container groups formatting slices into separate container items and alows to switch between them using a drop-down list.

  :::image type="content" source="./media/format-pane/container.png" alt-text="Screenshot of formatting container.":::

* **Formatting slice**  
  Property container. There are two types of slices:
  
  * Simple slice: Individual property container
  * [Composite slice](#composite-slice-properties): Multiple related property containers grouped into one formatting slice

  The following image shows the different types of slices. "Font" is a composite slice consisting of font family, size, and bold, italics, and underline switches. "Color", "display units", and the other slices are simple slices with one component each.

  :::image type="content" source="./media/format-pane/format-pane-slices.png" alt-text="Screenshot of format pane composite and simple slices.":::

### Visualization pane formatting properties

Every property in the formatting model should match and object type in the *capabilities.json* file.

The following table shows the formatting property types in *capabilities.json* file and their matching type class in modern formatting model properties:

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Boolean          | Bool                    | [ToggleSwitch](formatting-model-toggleswitch.md)         |
| Number           | <li>numeric</li> <li> integer </li>       | <li> [NumUpDown](formatting-model-numupdown.md) </li> <li>[Slider](formatting-model-slider.md)</li>     |
| Enumeration list | enumeration:[]          | <li> [ItemDropdown](formatting-model-dropdown.md#tab/itemDropdown)</li> <li> [ItemFlagsSelection](formatting-model-flagselection.md#tab/ItemFlagsSelection)</li><li> [AutoDropdown](formatting-model-dropdown.md#tab/AutoFlagsSelection)</li><li> [AutoFlagsSelection](formatting-model-flagselection.md#tab/AutoFlagsSelection)</li> <sup>*</sup> See note below       |
| Color            | Fill                    | [ColorPicker](formatting-model-colorpicker.md)          |
| Gradient         | FillRule                | GradientBar: property value should be string consisting of: </n>`minValue[,midValue],maxValue`          |
| Text             | Text                    | <li>[TextInput](formatting-model-textinput.md)</li> <li>[TextArea](formatting-model-textarea.md)</li>  |

Capabilities Formatting Objects

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Font size           | FontSize             | NumUpDown            |
| Font family         | FontFamily           | [FontPicker](formatting-model-fontpicker.md)           |
| Line Alignment      | Alignment            | [AlignmentGroup](formatting-model-alignmentgroup.md)       |
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

* [FontControl](formatting-model-fontcontrol.md)  
  This keeps all font related properties together. It consists of the following properties:
  
  * Font Family
  * Font Size
  * Bold [optional]
  * Italic [optional]
  * Underline [optional]

  :::image type="content" source="media/format-pane/font-slices.png" alt-text="Screenshot of font composite slice with font family, font size, bold, italic, and underline options.":::

  Each of these properties should have a corresponding object in capabilities file:

  | Property    | Capabilities Type         | Formatting Type  |
  |-------------|---------------------------|------------------|
  | Font Family | Formatting: { fontFamily} | FontPicker       |
  | Font Size   | Formatting: {fontSize}    | NumUpDown        |
  | Bold        | Bool                      | ToggleSwitch     |
  | Italic      | Bool                      | ToggleSwitch     |
  | Underline   | Bool                      | ToggleSwitch     |

* [MarginPadding](formatting-model-marginpadding.md)
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

## GitHub Resources

* All formatting model interfaces can be found in [GitHub - microsoft/powerbi-visuals-api: Power BI custom visuals API](https://github.com/microsoft/powerbi-visuals-api) in “formatting-model-api.d.ts”

* We recommend using the new formatting model utils at [GitHub - microsoft/powerbi-visuals-utils-formattingmodel: Power BI visuals formatting model helper utils](https://github.com/microsoft/powerbi-visuals-utils-formattingmodel)

* You can find an example of a custom visual *SampleBarChart* that uses API version 5.1.0 and implements `getFormattingModel` using the new formatting model utils at [GitHub - microsoft/PowerBI-visuals-sampleBarChart: Bar Chart Custom Visual for tutorial](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/tree/barChartTutorial).

## Related content

More questions? [Ask the Power BI Community](https://community.powerbi.com)