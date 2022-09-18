---
title: The Format pane in Power BI visuals
description: This article describes how to customize the new Format pane in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 09/14/2022
---

# The Format pane in Power BI visuals

The [new Power format pane](../../fundamentals/desktop-format-pane.md) will be supported for developers from API version 5.1. Developers can define the cards and their subcategories for any custom property in their custom visual, making it easier for report creators to use custom visuals.

The new API uses a **Formatting model** to customize parts of the format and analytics pane.

In the new API, use the `getFormattingModel` model instead of the `enumerateObjectInstances` model used in previous versions.

It requires to define/build new visuals `FormattingModel` for their CV formatting and analytics pane. 
`FormattingModel` covers old format pane capabilities, In addition it supports new format pane capabilities, new properties and new hierarchies.

To upgrade to API version 5.0.0+, set the `apiVersion` in your *pbiviz.json* file to `5.0.0` or later.

## Upgrade to Modern format pane

To customize settings in the new format pane:
 
* In your *capabilities.json* file:
  Capabilities `objects` is required, But now it’s only requires to add object name, Property name and property type in capabilities `objects`, no more. 
  DisplayName, description and other parameters are now optional to add in capabilities.json.
-	Build custom visual formatting model.
The developers now are required to define the design of their CV formatting model and build it using code (not JSON).
-	Implement `getFormattingModel` API to custom visual class that returns custom visual formatting model. (This API replaces the `enumerateObjectInstances` that was used in previous versions)

* Formatting model

## Define model properties - migrating form older APIs

Each formatting property should have a descriptor that contains objectName and propertyName which should match the object name and property name that were added in capabilities JSON.

Capabilities objects properties are persistent to the same schema (the schema wasn't changed) and capabilities `objects` don't requires to be migrated.
 
For migrating and mapping capabilities object to formatting properties purpose - formatting properties should include descriptor parameter (formatting model object - see images below) with same object name and property name that exist in capabilities
 
For example:
 
Capabilities objects:
 
 
Formatting Property of type ColorPicker
 

You will see errors if:
1.	Object name or property name doesn’t match in capabilities and formatting model
2.	Property type in capabilities doesn’t match the type in formatting model

## Visualization pane properties

To build formatting model we need to:
1.	Define objects in capabilities and define their types
2.	Build formatting model including formatting properties with matching object type.
The following table is showing the formatting property types in capabilities and their match type class in modern formatting model properties

Type	Capabilities Value Type	Formatting Property
Boolean	Bool	ToggleSwitch
Number	numeric
integer	NumUpDown 
Slider
Enumeration List 	enumeration: []	ItemDropdown
ItemFlagsSelection

AutoDropdown
AutoFlagsSelection

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
Font size	FontSize	NumUpDown
Font family	FontFamily	FontPicker
Line Alignment	Alignment	AlignmentGroup
Label Display Units	LabelDisplayUnits	AutoDropDown
Format String	FormatString	Todo




Still not added capabilities properties to documentation – TODO Sherein
1.	filter
2.	operations
3.	scripting
4.	geography

## Composite slice properties


