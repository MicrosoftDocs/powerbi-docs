---
title: Object and properties
description: Customizable properties of the visual
author: MrMeison
ms.author: sranins
manager: AviSander
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Object and properties

Objects describe customizable properties associated with the visual.
Each object can have multiple properties and each property has a type associated with it.
Types refer to what the property will be. See below for more information about types.

`myCustomObject` is the internal name used to reference the object within `dataView` and `enumerateObjectInstances`

```json
"objects": {
    "myCustomObject": {
        "displayName": "My Object Name",
        "properties": { ... }
    }
}
```

## Display Name
`displayName` is the name that will be shown in the property pane.

## Properties
`properties` is a map of properties defined by the developer.

```json
"properties": {
    "myFirstProperty": {
        "displayName": "firstPropertyName",
        "type": ValueTypeDescriptor | StructuralTypeDescriptor
    }
}
```

**NOTE**: `show` is a special property that enables a switch to toggle the object.

Example:

```json
"properties": {
    "show": {
        "displayName": "My Property Switch",
        "type": {"bool": true}
    }
}
```

### Property Types

There are 2 types of property types: `ValueTypeDescriptor` and `StructuralTypeDescriptor`.

#### Value Type Descriptor
`ValueTypeDescriptor` are mostly primitive types and are typically used as a static object.
Here are some of the common `ValueTypeDescriptor`

```typescript
export interface ValueTypeDescriptor {
    text?: boolean;
    numeric?: boolean;
    integer?: boolean;
    bool?: boolean;
}
```

#### Structural Type Descriptor
`StructuralTypeDescriptor` are mostly used for data bound objects.
Fill is the most common `StructuralTypeDescriptor`

```typescript
export interface StructuralTypeDescriptor {
    fill?: FillTypeDescriptor;
}
```

## Gradient property
The gradient property is a property that cannot be set as a standard property. Instead, you need to set a rule for substitution of the color picker property (fill type).
See the example below:

```json
"properties": {
    "showAllDataPoints": {
        "displayName": "Show all",
        "displayNameKey": "Visual_DataPoint_Show_All",
        "type": {
            "bool": true
        }
    },
    "fill": {
        "displayName": "Fill",
        "displayNameKey": "Visual_Fill",
        "type": {
            "fill": {
                "solid": {
                    "color": true
                }
            }
        }
    },
    "fillRule": {
        "displayName": "Color saturation",
        "displayNameKey": "Visual_ColorSaturation",
        "type": {
            "fillRule": {}
        },
        "rule": {
            "inputRole": "Gradient",
            "output": {
                "property": "fill",
                    "selector": [
                        "Category"
                    ]
            }
        }
    }
}
```
Please, pay attention to the `"fill"` and `"fillRule"` properties. The first is the color picker, the second is the substitution rule for gradient that will substitute the "fill" property `visually` when the rule conditions will be met.

This link between the fill property and the substitution rule is set in `"rule"`->`"output"` section of the `"fillRule"` property.

`"Rule"`->`"InputRole"` sets which data role triggers the rule (condition). In this example, if data role `"Gradient"` contains data then the rule will be applied for the `"fill"` property.

Below you can see an example of the data role that triggers the fill rule (`the last item`).

```json
"dataRoles": [
        {
            "name": "Category",
            "kind": "Grouping",
            "displayName": "Details",
            "displayNameKey": "Role_DisplayName_Details"
        },
        {
            "name": "Series",
            "kind": "Grouping",
            "displayName": "Legend",
            "displayNameKey": "Role_DisplayName_Legend"
        },
        {
            "name": "Gradient",
            "kind": "Measure",
            "displayName": "Color saturation",
            "displayNameKey": "Role_DisplayName_Gradient"
        }
]
```

## enumerateObjectInstances
To use objects effectively you will need a function in your custom visual called `enumerateObjectInstances`. This function will populate the propery pane with objects and will also determine where your objects should be bound within the dataView.  

Here is what a typical setup looks like:
```typescript
public enumerateObjectInstances(options: EnumerateVisualObjectInstancesOptions): VisualObjectInstanceEnumeration {
    let objectName: string = options.objectName;
    let objectEnumeration: VisualObjectInstance[] = [];

    switch( objectName ) {
        case 'myCustomObject':
            objectEnumeration.push({
                objectName: objectName,
                properties: { ... },
                selector: { ... }
            });
            break;
    };

    return objectEnumeration;
}
```

## properties
The properties in `enumerateObjectInstances` will reflect the properties you defined in your capabilities. See example at bottom of page. 

## selector
The selector in `enumerateObjectInstances` determines where each object will be bound in the dataView. There are four distinct options. 

#### static 
This object will be bound to metadata `dataviews[index].metadata.objects`
```typescript
selector: null 
```
#### columns 
This object will be bound to columns with the matching `QueryName`. 
```typescript
selector: {
    metadata: 'QueryName'
}
```
#### selector 
This object will be bound to the element we have created a `selectionID` for. In this example, we will assume that we have created `selectionID`'s for some dataPoints, and we are looping through them.

```typescript
for (let dataPoint in dataPoints) {
    ...
    selector: dataPoint.selectionID.getSelector()
}
```
#### scope identity 
This object will be bound to particular values at the intersection of groups. For example, if I have categories `["Jan", "Feb", "March", ...]` and series `["Small", "Medium", "Large"]`, I may want to have an object on the intersection of values matching `Feb` and `Large`. To accomplish this I could get the `DataViewScopeIdentity` of both columns, push them to variable `identities`, and use this syntax with the selector.

```typescript
selector: {
    data: <DataViewScopeIdentity[]>identities
}
```

## Example:
In this example, we show what one objectEnumeration would look like for a customColor object with one property `fill`. We want this object bound statically to `dataViews[index].metadata.objects`
```typescript
objectEnumeration.push({
    objectName: "customColor",
    displayName: "Custom Color",
    properties: {
        fill: {
            solid: {
                color: dataPoint.color
            }
        }
    },
    selector: null
});
```