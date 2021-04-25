---
title: Capabilities and properties of Power BI visuals
description: This article describes the capabilities and properties of Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Capabilities and properties of Power BI visuals 

You use capabilities to provide information to the host about your visual. All properties on the capabilities model are `optional`.

The root objects of a visual's capabilities are `dataRoles`, `dataViewMappings`, and so on.

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

## Define the data fields that your visual expects: dataRoles

To define fields that can be bound to data, you use `dataRoles`. `dataRoles` takes an array of `DataViewRole` objects, which defines all the required properties.

### Properties

* **name**: The internal name of this data field (must be unique).
* **kind**: The kind of field:
    * `Grouping`: Discrete values that are used to group measure fields.
    * `Measure`: Numeric data values.
    * `GroupingOrMeasure`: Values that can be used as either a grouping or a measure.
* **displayName**: The name displayed to the user in the **Properties** pane.
* **description**: A short description of the field (optional).
* **requiredTypes**: The required type of data for this data role. Values that don't match are set to null (optional).
* **preferredTypes**: The preferred type of data for this data role (optional).

### Valid data types in requiredTypes and preferredTypes

* **bool**: A boolean value
* **integer**: An integer (whole number) value
* **numeric**: A numeric value
* **text**: A text value
* **geography**: A geographic data

### Example

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
    },
    {
        "displayNameKey": "Visual_Location",
        "name": "Locations",
        "kind": "Measure",
        "displayName": "Locations",
        "requiredTypes": [
            {
                "geography": {
                    "address": true
                }
            },
            {
                "geography": {
                    "city": true
                }
            },
            {
                "geography": {
                    "continent": true
                }
            },
            {
                "geography": {
                    "country": true
                }
            },
            {
                "geography": {
                    "county": true
                }
            },
            {
                "geography": {
                    "place": true
                }
            },
            {
                "geography": {
                    "postalCode": true
                }
            },
            {
                "geography": {
                    "region": true
                }
            },
            {
                "geography": {
                    "stateOrProvince": true
                }
            }
        ]
    }
]
```

The preceding data roles would create the fields that are displayed in the following image:

![Data role fields](media/capabilities/data-role-display.png)

## Define how you want the data mapped: dataViewMappings

A DataViewMappings property describes how the data roles relate to each other and allows you to specify conditional requirements for the them.

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

## Define property pane options: objects

Objects describe customizable properties that are associated with the visual. Each object can have multiple properties, and each property has a type that's associated with it. Types refer to what the property will be. 

```json
"objects": {
    "myCustomObject": {
        "displayName": "My Object Name",
        "properties": { ... }
    }
}
```

For more information, see [Objects and properties of Power BI visuals](objects-properties.md).

## Handle partial highlighting: supportsHighlight

By default, this value is set to `false`, which means that your values are automatically filtered when something on the page is selected. This automatic filtering in turn updates your visual to display only the selected value. If you want to display the full data but highlight only the selected items, you need to set `supportsHighlight` to `true` in your *capabilities.json* file.

For more information, see [Highlight data points in Power BI visuals](highlight.md).

## Handle advanced edit mode: advancedEditModeSupport

A visual can declare its support of advanced edit mode. By default, a visual doesn't support advanced edit mode, unless stated otherwise in the *capabilities.json* file.

For more information, see [Advanced edit mode in Power BI visuals](advanced-edit-mode.md).

## Data sorting options for visual: sorting

A visual can define its sorting behavior via its capabilities. By default, a visual doesn't support modifying its sorting order, unless stated otherwise in the *capabilities.json* file.

For more information, see [Sorting options for Power BI visuals](sort-options.md).
