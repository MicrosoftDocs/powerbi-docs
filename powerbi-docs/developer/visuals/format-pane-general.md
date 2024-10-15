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

In addition to all the old formatting pane capabilities, the [new formatting model](#formatting-model) supports new format pane capabilities, new properties and new hierarchies.

:::image type="content" source="media/format-pane/formatting-model.png" alt-text="Screenshot of the new formatting pane.":::

To upgrade to API version 5.1+, set the `apiVersion` in your *pbiviz.json* file to `5.1` or later and do **one** of the following:

* Use [formattingmodel util](./utils-formatting-model.md). (**Recommended**)
* Without this util, use only [APIs](format-pane-example.md).

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
  The top level properties grouping container for formatting properties. Each card consists of one or more formatting groups, as shown here.

  :::image type="content" source="./media/format-pane/formatting-cards.png" alt-text="Screenshot of formatting model with individual formatting cards.":::

* **Formatting group**  
  The secondary-level properties grouping container. The formatting group is displayed as a grouping container for formatting slices.

  :::image type="content" source="./media/format-pane/formatting-groups.png" alt-text="Screenshot of formatting cards divided into formatting groups.":::

* **Formatting slice**  
  Property container. There are two types of slices:
  
  * Simple slice: Individual property container
  * [Composite slice](#composite-slice-properties): Multiple related property containers grouped into one formatting slice

  The following image shows the different types of slices. "Font" is a composite slice consisting of font family, size, and bold, italics and underline switches. "Color", "display units" and the other slices are simple slices with one component each.

  :::image type="content" source="./media/format-pane/format-pane-slices.png" alt-text="Screenshot of format pane composite and simple slices.":::

### Visualization pane formatting properties

Every property in the formatting model should match and object type in the *capabilities.json* file.

The following table shows the formatting property types in *capabilities.json* file and their matching type class in modern formatting model properties:

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Boolean          | Bool                    | [ToggleSwitch](utils-formatting-model-toggleswitch.md)         |
| Number           | <li>numeric</li> <li> integer </li>       | <li> [NumUpDown](utils-formatting-model-numupdown.md) </li> <li>[Slider](utils-formatting-model-slider.md)</li>     |
| Enumeration list | enumeration:[]          | <li> [ItemDropdown](utils-formatting-model-dropdown.md#itemdropdown-implementation)</li> <li> [ItemFlagsSelection](utils-formatting-model-flagselection.md#itemflagsselections-implementation)</li><li> [AutoDropdown](utils-formatting-model-dropdown.md#autodropdown-implementation)</li><li> [AutoFlagsSelection](utils-formatting-model-flagselection.md#autoflagsselection-implementation)</li> <sup>*</sup> See note below       |
| Color            | Fill                    | [ColorPicker](utils-formatting-model-colorpicker.md)          |
| Gradient         | FillRule                | [GradientBar](utils-formatting-model-gradientbar.md): property value should be string consisting of: </n>`minValue[,midValue],maxValue`          |
| Text             | Text                    | <li>[TextInput](utils-formatting-model-textinput.md)</li> <li>[TextArea](utils-formatting-model-textarea.md)</li>  |

Capabilities Formatting Objects

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Font size           | FontSize             | NumUpDown            |
| Font family         | FontFamily           | [FontPicker](utils-formatting-model-fontpicker.md)           |
| Line Alignment      | Alignment            | [AlignmentGroup](utils-formatting-model-alignmentgroup.md)       |
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

* [FontControl](utils-formatting-model-fontcontrol.md)  
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

* [MarginPadding](utils-formatting-model-marginpadding.md)
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