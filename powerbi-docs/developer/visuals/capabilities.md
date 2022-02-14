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

You use capabilities to provide information to the host about your visual. All properties on the capabilities model are `optional` except `privileges`, which are mandatory.

The root objects of a visual's capabilities are `privileges`, `dataRoles`, `dataViewMappings`, and so on.

```json
{
    "privileges": [ ... ],
    "dataRoles": [ ... ],
    "dataViewMappings": [ ... ],
    "objects":  { ... },
    "supportsHighlight": true|false,
    "advancedEditModeSupport": 0|1|2,
    "sorting": { ... }
}

```

## Define the special permissions that your visual requires: privileges

Privileges are special operations your visual requires to operate. Privileges take an array of `Privilege` objects, which defines all privilege properties. The following sections describe the privileges that are available in Power BI.

### General privilege definition

A JSON privilege definition contains these components:

- `name` - (string) The name of the privilege.
- `essential` - (Boolean) Indicates whether the visual functionality requires this privilege. A value of `true` means the privilege is required; `false` means the privilege is not mandatory.
- `parameters` - (string array) Arguments. `parameters` is optional, and if missing, it's considered an empty array.

### Access external resources

A visual that accesses any external resource must add a `WebAccess` privilege in the capabilities section. The privilege definition can contain an optional list of URLs the visual needs to access in the format `http://xyz.com` or `https://xyz.com`. Each URL can also include a wildcard to specify subdomains.

#### Example to access external resources

```json
{
    "name": "WebAccess",
    "essential": true,
    "parameters": [ "https://*.microsoft.com", "http://example.com" ]
}
```

The preceding definition means that the visual needs to access any subdomain of the `microsoft.com` domain via HTTPS protocol only and `example.com` without subdomains via HTTP, and that this access privilege is essential for the visual's normal work.

### Access browser local storage

If the visual accesses the browser local storage via the [Local Storage API](./local-storage.md), you must add a `LocalStorage` privilege in the capabilities section.

#### Example to access browser local storage

```json
{
    "name": "LocalStorage",
    "essential": false
}
```

The preceding definition means that the visual might need to access browser local storage, and that if it is not permitted access, it will continue to work anyway.

### Common example of a privileges definition

```json
"privileges": [
    {
        "name": "WebAccess",
        "essential": true,
        "parameters": [ "https://*.virtualearth.net" ]
    },
    {
        "name": "LocalStorage",
        "essential": false
    }
]
```

### No privileges

If the visual does not requires any special permissions, the `privileges` array should be empty:

```json
  "privileges": []
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
