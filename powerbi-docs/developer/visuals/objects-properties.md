---
title: Objects and properties of Power BI visuals
description: This article describes the customizable properties of Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Objects and properties of Power BI visuals

Objects describe customizable properties that are associated with a visual. An object can have multiple properties, and each property has an associated type that describes what the property will be. This article provides information about objects and property types.

`myCustomObject` is the internal name that's used to reference the object within `dataView` and `enumerateObjectInstances`.

```json
"objects": {
    "myCustomObject": {
        "displayName": "My Object Name",
        "properties": { ... }
    }
}
```

## Display name

`displayName` is the name that will be shown in the property pane.

## Properties

`properties` is a map of properties that are defined by the developer.

```json
"properties": {
    "myFirstProperty": {
        "displayName": "firstPropertyName",
        "type": ValueTypeDescriptor | StructuralTypeDescriptor
    }
}
```

> [!NOTE]
> `show` is a special property that enables a switch to toggle the object.

Example:

```json
"properties": {
    "show": {
        "displayName": "My Property Switch",
        "type": {"bool": true}
    }
}
```

### Property types

There are two property types: `ValueTypeDescriptor` and `StructuralTypeDescriptor`.

#### Value type descriptor

`ValueTypeDescriptor` types are mostly primitive and are ordinarily used as a static object.

Here are some of the common `ValueTypeDescriptor` elements:

```typescript
export interface ValueTypeDescriptor {
    text?: boolean;
    numeric?: boolean;
    integer?: boolean;
    bool?: boolean;
}
```

#### Structural type descriptor

`StructuralTypeDescriptor` types are mostly used for data-bound objects.
The most common `StructuralTypeDescriptor` type is *fill*.

```typescript
export interface StructuralTypeDescriptor {
    fill?: FillTypeDescriptor;
}
```

## Gradient property

The gradient property is a property that can't be set as a standard property. Instead, you need to set a rule for the substitution of the color picker property (*fill* type).

An example is shown in the following code:

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

Pay attention to the *fill* and *fillRule* properties. The first is the color picker, and the second is the substitution rule for the gradient that will replace the *fill property*, `visually`, when the rule conditions are met.

This link between the *fill* property and the substitution rule is set in the `"rule"`>`"output"` section of the *fillRule* property.

`"Rule"`>`"InputRole"` property sets which data role triggers the rule (condition). In this example, if data role `"Gradient"` contains data, the rule is applied for the `"fill"` property.

An example of the data role that triggers the fill rule (`the last item`) is shown in the following code:

```json
{
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
}
```

## The enumerateObjectInstances method

To use objects effectively, you need a function in your custom visual called `enumerateObjectInstances`. This function populates the property pane with objects and also determines where your objects should be bound within the dataView.  

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

### Properties

The properties in `enumerateObjectInstances` reflect the properties that you defined in your capabilities. For an example, go to the end of this article.

### Objects selector

The selector in `enumerateObjectInstances` determines where each object is bound in the dataView. There are four distinct options.

#### static

This object is bound to metadata `dataviews[index].metadata.objects`, as shown here.

```typescript
selector: null
```

#### columns

This object is bound to columns with the matching `QueryName`.

```typescript
selector: {
    metadata: 'QueryName'
}
```

#### selector

This object is bound to the element that you created a `selectionID` for. In this example, let's assume that we've created `selectionID`s for some data points, and that we're looping through them.

```typescript
for (let dataPoint in dataPoints) {
    ...
    selector: dataPoint.selectionID.getSelector()
}
```

#### Scope identity

This object is bound to particular values at the intersection of groups. For example, if you have categories `["Jan", "Feb", "March", ...]` and series `["Small", "Medium", "Large"]`, you might want to have an object at the intersection of values that match `Feb` and `Large`. To accomplish this, you could get the `DataViewScopeIdentity` of both columns, push them to variable `identities`, and use this syntax with the selector.

```typescript
selector: {
    data: <DataViewScopeIdentity[]>identities
}
```

##### Example

The following example shows what one objectEnumeration would look like for a customColor object with one property, *fill*. We want this object bound statically to `dataViews[index].metadata.objects`, as shown:

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
