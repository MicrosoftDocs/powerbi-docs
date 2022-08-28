---
title: Sorting options for Power BI visuals
description: This article discusses sorting behavior options for Power BI visuals. Default, implicit and custom sort.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 05/10/2022
---

# Sorting options for Power BI visuals

This article describes the different options available for to specifying the the way a visual sorts items in Power BI.

By default, a visual doesn't support modifying its sorting order, unless stated otherwise in the *capabilities.json* file.

The sorting capability requires one of the following parameters.

* [default](#default-sorting)
* [implicit](#implicit-sorting)
* [custom](#custom-sorting)

## Default sorting

The `default` option is the simplest form. It allows the user to sort according to any one field and direction (ascending or descending).

:::image type="content" source="media/sort-options/default-sorting.png" alt-text="Screenshot of table of US states with default sorting options the context menu.":::

To enable default sorting, add the following code to your capabilities.json file:

```json
    "sorting": {
        "default": {   }
    }
```

## Implicit sorting

Implicit sorting allows you to pre-define a sorting array using parameter `clauses`, that describes sorting for each data role. The user can't change the sorting order, so Power BI doesn't display sorting options in the visual's menu. However, Power BI does sort data according to specified settings.

To enable implicit sorting, add the following code to your capabilities.json file:

```json
    "sorting": {
        "implicit": {   }
    }
```

`clauses` parameters can contain several objects with two parameters:

* `role`: Determines `DataMapping` for sorting
* `direction`: Determines sort direction (1 = Ascending, 2 = Descending)

```json
    "sorting": {
        "implicit": {
            "clauses": [
                {
                    "role": "category",
                    "direction": 1
                },
                {
                    "role": "measure",
                    "direction": 2
                }
            ]
        }
    }
```

## Custom sorting

Custom sorting means that the sorting is managed by the developer in the visual's code.

Custom sorting gives the developer more control over the sorting options. The developer can:

* Allow the user to sort by multiple fields at a time.
* Limit the sorting options to only specific fields and/or directions
* Set a default sorting order for the data
* Allow custom sorting operations during runtime

### Enable custom sorting

To create a visual that allows custom sorting, add the following lines to your *capabilities.json* file:

```typescript
    "sorting": {
        "custom": {} 
    },
```

The custom sorting API had the following commands:

* getSortableRoles() - returns the list of sortable roles

### Example: Custom sort API

After successfully executing applyCustomSort, the `OrderBy` parameter is added to the query:

```typescript
{
    "Commands": [
        {
            "SemanticQueryDataShapeCommand": {
                "Query": {
                    "Version": 2,
                    "From": [
                        {
                            "Name": "i",
                            "Entity": "Item",
                            "Type": 0
                        },
                        {
                            "Name": "s",
                            "Entity": "Sales",
                            "Type": 0
                        }
                    ],
                    "Select": [
                        {
                            "Column": {
                                "Expression": {
                                    "SourceRef": {
                                        "Source": "i"
                                    }
                                },
                                "Property": "Segment"
                            },
                            "Name": "Item.Segment"
                        },
                        {
                            "Measure": {
                                "Expression": {
                                    "SourceRef": {
                                        "Source": "s"
                                    }
                                },
                                "Property": "Avg $/Unit TY"
                            },
                            "Name": "Sales.Avg $/Unit TY"
                        }
                    ],
                    "OrderBy": [
                        {
                            "Direction": 2,
                            "Expression": {
                                "Column": {
                                    "Expression": {
                                        "SourceRef": {
                                            "Source": "i"
                                        }
                                    },
                                    "Property": "Segment"
                                }
                            }
                        }
                    ]
                },
                "Binding": {
                    "Primary": {
                        "Groupings": [
                            {
                                "Projections": [
                                    0,
                                    1
                                ]
                            }
                        ]
                    },
                    "DataReduction": {
                        "DataVolume": 3,
                        "Primary": {
                            "Window": {
                                "Count": 50
                            }
                        }
                    },
                    "Version": 1
                },
                "ExecutionMetricsKind": 1
            }
        }
    ]
}
```

## Next steps

* [Understand data view mapping in Power BI visuals](dataview-mappings.md)
* [Understanding capabilities](capabilities.md)
