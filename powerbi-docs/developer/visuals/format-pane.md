---
title: The Format pane in Power BI visuals
description: This article describes how to customize the new Format pane in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 09/19/2022
---

# The Format pane in Power BI visuals

Starting from API version 5.1, developers can customize visuals using the [new Power format pane](../../fundamentals/desktop-format-pane.md). Developers can define the cards and their subcategories for any custom property in their custom visual, making it easier for report creators to use custom visuals.

The new API uses the **Formatting model** to customize parts of the format and analytics pane.

In the new API, you call the `getFormattingModel` model instead of the `enumerateObjectInstances` model used in previous versions.

In the `getFormattingModel`, you create a `FormattingModel` which defines the custom formatting of the new visual's formatting and analytics pane.

The Formatting Model supports all the old format pane capabilities as well as the new format pane capabilities, new properties and new hierarchies.

To upgrade to API version 5.1.0+, set the `apiVersion` in your *pbiviz.json* file to `5.1.0` or later.

## Update IVisual class to support the new format pane

To customize settings for the new format pane:

* Define all the customizable [`objects`](./objects-properties.md) in your *capabilities.json* file.
  The following object properties are required:

  * object name
  * property name
  * property type
  
  All other properties, including DisplayName and description, are now optional.

* Build the custom visual [**formatting model**](#formatting-model).
  Define the design of your custom visual formatting model and build it using code (not JSON).

* Implement the `getFormattingModel` API to custom visual class that returns custom visual formatting model. (This API replaces the `enumerateObjectInstances` that was used in previous versions)

## Formatting model

### Define model properties - migrating form older APIs

Each formatting property should have a descriptor that contains an `objectName` and `propertyName` that matches the object name and property name in *capabilities.json*.

Capabilities objects properties are persistent to the same schema (the schema wasn't changed) and capabilities `objects` don't requires to be migrated.

For migrating and mapping capabilities object to formatting properties purpose - formatting properties should include descriptor parameter (formatting model object - see images below) with same object name and property name that exist in capabilities

For example:

Capabilities objects:

Formatting Property of type ColorPicker

You will see errors if:

1. Object name or property name doesn’t match the name in capabilities and formatting model
2. Property type in capabilities file doesn’t match the type in formatting model

## Visualization pane properties

To build formatting model we need to:
1.	Define objects in capabilities and define their types
2.	Build formatting model including formatting properties with matching object type.

The following table shows the formatting property types in capabilities and their match type class in modern formatting model properties:

| Type             | Capabilities Value Type | Formatting Property  |
|------------------|-------------------------|----------------------|
| Boolean          | Bool                    | ToggleSwitch         |
| Number           |  numeric integer        | NumUpDown Slider     |
| Enumeration list | enumeration:[]          | ItemDropdown, ItemFlagsSelection        |
| Color            | Fill                    | ColorPicker          |
| Gradient         | FillRule                | GradientBar          |
| Date / Time      |                         | DatePicker           |
| Text             | Text                    | TextInput, TextArea  |


* ItemDropdown and ItemFlagsSelection enumeration items should be added in formatting model in custom visual class

*AutoDropdown and AutoFlagSelection enumeration items should be added in capabilities in enumeration array as it used to be till today
Color	Fill 	ColorPicker
Gradient 	FillRule	GradientBar
* property value should be string consist of:
“minValue[,midValue],maxValue”
Date / Time	TODO	DatePicker
Text	Text	TextInput
TextArea

Capabilities Formatting Objects

| Type                | Capabilities Value Type | Formatting Property |
|---------------------|-------------------------|---------------------|
| Font size           | FontSize                | NumUpDown           |
| Font family         | FontFamily              | FontPicker          |
| Line Alignment      | Alignment               | AlignmentGroup      |
| Label Display Units | LabelDisplayUnits       | AutoDropDown        |
| Format String       | FormatString            | Todo                |

## Composite slice properties

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
  Margin padding consists of the following properties:
  
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
  