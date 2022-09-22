---
title: Customize the format pane in Power BI custom visuals
description: This article describes how to customize the new Format pane in Power BI custom visuals using the new formatting model
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 09/19/2022
---

# Customize the format pane in Power BI custom visuals

Starting from API version 5.1, developers can create visuals that use the [new Power format pane](../../fundamentals/desktop-format-pane.md). Developers can define the cards and their categories for any property in their custom visual, making it easier for report creators to use these visuals.

The new API uses the **FormattingModel** method to customize parts of the format and analytics panes.

> [!TIP]
> The `getFormattingModel` method replaces the `enumerateObjectInstances` method used in earlier API versions.

The `getFormattingModel` returns a `FormattingModel` that defines how the visual's formatting and analytics pane look.

In addition to all the old formatting pane capabilities, the new formatting model supports  new format pane capabilities, new properties and new hierarchies.

To upgrade to API version 5.1.0+, set the `apiVersion` in your *pbiviz.json* file to `5.1.0` or later.

## Create a visual that supports the new format pane

To create a custom visual that uses the new format pane:

1. Define all the customizable [`objects`](./objects-properties.md) in your *capabilities.json* file.  
   The following properties are required for each object:

   * object name
   * property name
   * property type
  
   All other properties, including `DisplayName` and `description`, are now optional.

2. Build the custom visual [**FormattingModel**](#formatting-model-components).
  Define the properties of your custom visual formatting model and build it using code (not JSON).

3. Implement the `getFormattingModel` API in the custom visual class that returns custom visual formatting model. (This API replaces the `enumerateObjectInstances` that was used in previous versions).

## Formatting model components

In the new formatting model, property components are grouped together in logical categories and subcategories. These groups make the model easier to scan. These are the five basic components, from largest to smallest:

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

To build formatting model, follow these steps:

1. Define each `object` and type in the *capabilities.json*
2. Build a formatting model that includes all the formatting properties with their matching object type from the *capabilities.json* file.

The following table shows the formatting property types in capabilities and their match type class in modern formatting model properties:

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Boolean          | Bool                    | ToggleSwitch         |
| Number           | numeric integer         | NumUpDown Slider     |
| Enumeration list | enumeration:[]          | See note below       |
| Color            | Fill                    | ColorPicker          |
| Gradient         | FillRule                | GradientBar: property value should be string consisting of: “minValue[,midValue],maxValue”          |
| Date / Time      |                         | DatePicker           |
| Text             | Text                    | TextInput, TextArea  |
|                  |Capabilities Formatting Objects|                |
| Font size           | FontSize             | NumUpDown            |
| Font family         | FontFamily           | FontPicker           |
| Line Alignment      | Alignment            | AlignmentGroup       |
| Label Display Units | LabelDisplayUnits    | AutoDropDown         |
| Format String       | FormatString         |                      |

Note: Enumeration list formatting property is different in the formatting model and in the capabilities file.

* In the formatting model use one of the following properties:
  * ItemDropdown
  * ItemFlagsSelection  

* In the capabilities file, use one of the following types (these types are the same as in the previous API versions):
  * AutoDropdown
  * AutoFlagSelection  

### Composite slice properties

A formatting composite slice is a formatting slice that contains multiple related properties all together.

For now we have two composite slice types:

* FontControl
  Font keeps all font related properties together. It consists of the following properties:
  
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
  
## Migrate from older APIs

If you have a custom visual created with an older API and you want to migrate to the new format pane:

1. Set the `apiVersion` in your *pbiviz.json* file to `5.1.0` or later.

2. For each object name and property name in *capabilities.json*, create a matching formatting property. The formatting property should have a descriptor that contains an `objectName` and `propertyName` that matches the object name and property name in *capabilities.json*.

The `objects` properties in the capabilities file still have the same format and don't need to be changed.

For example, if the `circle` object in your *capabilities.json* file is defined like this:

```json
"objects": {
    "circle": {
        "displayName": "Circle",
        "properties": {
            "circleColor": {
                "displayName": "Color",
                "description": "The fill color of the circle.",
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
