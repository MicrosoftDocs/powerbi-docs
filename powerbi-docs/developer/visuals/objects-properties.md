---
title: Objects and properties of Power BI visuals
description: This article explains which Power BI visual properties are customizable and how to customize the visual properties in the formatting pane.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: concept-article
ms.date: 10/11/2024
#customer intent: As a Power BI visual developer, I want to learn about the objects and properties of Power BI visuals so that I can customize my visuals.
---

# Objects and properties of Power BI visuals

Objects describe customizable properties that are associated with a visual. An object can have multiple properties, and each property has an associated type that describes what the property will be. This article provides information about objects and property types.

`myCustomObject` is the internal name that's used to reference the object within `dataView`.

```json
"objects": {
    "myCustomObject": {
        "properties": { ... }
    }
}
```

## Display name and description

> [!NOTE]
> Display name and description are deprecated from API version 5.1+. The display name and description are now added in the formatting model instead of the *capabilities.json* file.

`displayName` is the name that will be shown in the property pane.
`description` is a description of the formatting property that will be shown to the user as a tooltip.

## Properties

`properties` is a map of properties that are defined by the developer.

```json
"properties": {
    "myFirstProperty": {
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
        "type": {
            "bool": true
        }
    },
    "fill": {
        "type": {
            "fill": {
                "solid": {
                    "color": true
                }
            }
        }
    },
    "fillRule": {
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

## Formatting pane

To customize the properties in the formatting pane, use one of the following methods, depending on what API version you're using.

### [getFormattingModel API method](#tab/getFormattingModel)

> [!NOTE]
> The `getFormattingModel` API method is supported from API versions 5.1+. To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

To use objects effectively in API version 5.1+, you need to implement the `getFormattingModel` method.  
This method builds and returns a formatting model that includes full [properties pane](./format-pane-general.md) hierarchy of formatting cards, formatting groups, Also it contains formatting properties and their values.

### Capabilities objects reflected in formatting model

Each formatting property in the formatting model needs a corresponding object in the *capabilities.json* file. The formatting property should contain a descriptor with an object name and property name that exactly match the corresponding capabilities object (the object and property names are case sensitive).  
For example:

For the following formatting property in the formatting model (See the descriptor object content):

```typescript
 const myCustomCard: powerbi.visuals.FormattingCard = {
            displayName: "My Custom Object Card",
            uid: "myCustomObjectCard_uid",
            groups: [{
                displayName: undefined,
                uid: "myCustomObjectGroup_uid",
                slices: [
                    {
                        uid: "myCustomProperty_uid",
                        displayName: "My Custom Property",
                        control: {
                            type: powerbi.visuals.FormattingComponent.ColorPicker,
                            properties: {
                                descriptor: {
                                    objectName: "myCustomObject",
                                    propertyName: "myCustomProperty",
                                    selector: null // selector is optional
                                },
                                value: { value: "#000000" }
                            }
                        }
                    }
                ],
            }],
        };
```

The corresponding object from the capabilities `objects` section should be:

```json
    "objects": {
        "myCustomObject": {
            "properties": {
                "myCustomProperty": {
                    "type": {
                         "fill": {
                            "solid": {
                                "color": true
                            }
                        }
                    }
                }
            }
        }
    }           
```

### Formatting property selector

The optional selector in formatting properties descriptor determines where each property is bound in the dataView. There are [four distinct options](#objects-selectors-types).

#### Example

The above `myCustomCard` example shows what formatting property in formatting model would look like for an object with one property `myCustomProperty`. This property object bound *statically* to `dataViews[index].metadata.objects`.
Selector in descriptor can be changed accordingly to [selector type](#objects-selectors-types) you choose.

### [enumerateObjectInstances API method - deprecated](#tab/enumerateObjectInstances)

> [!NOTE]
> The enumerateObjectInstances method has been deprecated from API version 5.1. It was replaced by the `getFormattingModel` in the new API.

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

### enumerateObjectInstances properties

The properties in `enumerateObjectInstances` reflect the properties that you defined in your capabilities. For an example, go to the end of this article.

### enumerateObjectInstances Example

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

---

### Objects selectors types

The selector in `enumerateObjectInstances` determines where each object is bound in the dataView. There are four distinct options:

* [static](#static)
* [columns](#columns)
* [selector](#selector)
* [scope identity](#scope-identity)

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

This object is bound to the element that you created a `selectionID` for. In this example, let's assume that we created `selectionID`s for some data points, and we're looping through them.

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

## Related content

[Performance tips](performance-tips.md)
