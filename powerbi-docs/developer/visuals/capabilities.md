---
title: Capabilities and properties of Power BI visuals
description: This article describes the capabilities and properties of Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/13/2021
---

# Capabilities and properties of Power BI visuals 

Every visual has a `capabilities.json` file where you provide information to the host about your visual. All properties in the `capabilities.json` file are *optional*.

The root objects of a visual's capabilities file are:  

* [dataRoles](#dataroles-the-data-fields-that-your-visual-expects)
* [dataViewMappings](#dataviewmappings-how-you-want-the-data-mapped)
* [objects](#objects-define-property-pane-options)
* [supportsHighlight](#supportshighlight-how-to-handle-partial-highlighting)
* [advancedEditModeSupport](#advancededitmodesupport-how-to-handle-advanced-edit-mode)
* [sorting](#sorting-data-sorting-options-for-your-visual)

The `capabilities.json` file looks like this:

```json
{
    "dataRoles": [ ... ],
    "dataViewMappings": [ ... ],
    "objects":  { ... },
    "supportsHighlight": true|false,
    "advancedEditModeSupport": 0|1|2,
    "sorting": { ... }
}

```

## dataRoles: the data fields that your visual expects

The `dataRoles` objects appear on the **Properties pane**. The user drags data fields into them to bind data the data fields to the objects.

### DataRole properties

DataRoles are defined by the following properties:

* **name**: The internal name of this data field (must be unique).
* **displayName**: The name displayed to the user in the **Properties** pane.
* **kind**: The kind of field:
    * `Grouping`: Discrete values that are used to group measure fields.
    * `Measure`: Numeric data values.
    * `GroupingOrMeasure`: Values that can be used as either a grouping or a measure.
* **description**: A short text description of the field (optional).
* **requiredTypes**: The required type of data for this data role. Values that don't match are set to null (optional).
* **preferredTypes**: The preferred type of data for this data role (optional).

#### Valid data types for requiredTypes and preferredTypes

* **bool**: A boolean value
* **integer**: An integer value
* **numeric**: A numeric value
* **text**: A text value
* **geography**: A geographic data

### dataRoles example

```json
"dataRoles": [
    {
        "displayName": "My Category Data",
        "name": "myCategory",
        "kind": "Grouping",
        "requiredTypes": [
            {
                "text": true
            },
            {
                "numeric": true
            },
            {
                "integer": true
            }
        ],
        "preferredTypes": [
            {
                "text": true
            }
        ]
    },
    {
        "displayName": "My Measure Data",
        "name": "myMeasure",
        "kind": "Measure",
        "requiredTypes": [
            {
                "integer": true
            },
            {
                "numeric": true
            }
        ],
        "preferredTypes": [
            {
                "integer": true
            }
        ]
    }
]
...
}
```

The preceding data roles would create the fields that are displayed in the following image:

![Data role fields](media/capabilities/data-role-display.png)

## dataViewMappings: how you want the data mapped

The `dataViewMappings` objects describe how the data roles relate to each other and  allow you to specify conditional requirements for the displaying data views.

Most visuals provide a single mapping, but you can provide multiple dataViewMappings. Each valid mapping produces a data view.

```json
"dataViewMappings": [
    {
        "conditions": [ ... ],
        "categorical": { ... },
        "table": { ... },
        "single": { ... },
        "matrix": { ... }
    }
]
```

For more information, see [Understand data view mapping in Power BI visuals](dataview-mappings.md).

## objects: define property pane options

Objects describe customizable properties that are associated with the visual. Each object can have multiple properties, and each property has a type that's associated with it.

```json
"objects": {
    "myCustomObject": {
        "displayName": "My Object Name",
        "properties": { ... }
    }
}
```

For more information, see [Objects and properties of Power BI visuals](objects-properties.md).

## supportsHighlight: how to handle partial highlighting

By default, the `supportsHighlight` value is set to `false`. This means that when something on a page is selected your values are automatically filtered accordingly. This automatic filtering updates your visual to display only the selected value. If you want to display the full data but highlight only the selected items, you need to set `supportsHighlight` to `true` in your *capabilities.json* file.

```json
"supportsHighlight": true
```

For more information, see [Highlight data points in Power BI visuals](highlight.md).

## advancedEditModeSupport: how to handle advanced edit mode

By default, a visual doesn't support advanced edit mode (`"advancedEditModeSupport": 0`). Setting the advanced edit mode support enables certain advanced UI controls. The `advancedEditModeSupport` object can be set to one of the following values:

0 - NotSupported
1 - SupportedNoAction
2 - SupportedInFocus

For more information, see [Advanced edit mode in Power BI visuals](advanced-edit-mode.md).

## sorting: data sorting options for your visual

A visual can define its sorting behavior through its capabilities. By default, a visual doesn't support modifying its sorting order, unless stated otherwise in the *capabilities.json* file.

For more information, see [Sorting options for Power BI visuals](sort-options.md).

## Next steps

> [!div class="nextstepaction"]
> [Understand data view mapping in Power BI visuals](dataview-mappings.md)

> [!div class="nextstepaction"]
> [Objects and properties of Power BI visuals](objects-properties.md)

> [!div class="nextstepaction"]
> [Advanced edit mode in Power BI visuals](advanced-edit-mode.md)
