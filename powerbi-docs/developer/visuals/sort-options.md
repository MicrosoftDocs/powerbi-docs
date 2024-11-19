---
title: Sorting options for Power BI visuals
description: This article discusses sorting behavior options for Power BI visuals. Default, implicit and custom sort.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 10/12/2024
#customer intent: As a Power BI visual developer, I want to learn how to enable sorting options for my visual so that users can sort data in the visual.
---

# Sorting options for Power BI visuals

This article describes the different options available for to specifying the way a visual sorts items in Power BI.

By default, a visual doesn't support modifying its sorting order, unless stated otherwise in the *capabilities.json* file.

The *sorting* capability requires at least one of the following parameters:

* [default](#default-sorting)
* [implicit](#implicit-sorting)
* [custom](#custom-sorting)

## Default sorting

The `default` option is the simplest form. It allows the user to sort according to any one field and direction (ascending or descending). The user selects the direction and field from the **more options** menu.

:::image type="content" source="media/sort-options/default-sorting.png" alt-text="Screenshot of table of US states with default sorting options the context menu.":::

To enable default sorting, add the following code to your capabilities.json file:

```json
    "sorting": {
        "default": {   }
    }
```

## Implicit sorting

Implicit sorting allows you to pre-define a sorting array using parameter `clauses`, that describes sorting for each data role. The user can't change the sorting order, so Power BI doesn't display sorting options in the visual's menu. However, Power BI does sort data according to specified settings.

To enable implicit sorting, add the implicit `clauses` to your *capabilities.json* file
`clauses` parameters can contain several objects with two parameters each:

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

Custom sorting gives the developer more flexibility when sorting. The developer can:

* Allow the user to sort by multiple fields at a time.
* Set a default sorting order for the data
* Allow custom sorting operations during runtime

### Enable custom sorting

To enable custom sorting, add the following code to your *capabilities.json* file:

```typescript
    "sorting": {
        "custom": {} 
    }
```

### Example: Custom sort API

```typescript
let queryName1 = this.dataView.matrix.columns.levels[0].sources[0].queryName;
let queryName2 = this.dataView.matrix.columns.levels[1].sources[0].queryName;
let args: CustomVisualApplyCustomSortArgs = {
    sortDescriptors: [
        {
            queryName: queryName1,
            sortDirection: powerbi.SortDirection.Ascending
        },
        {
            queryName: queryName2,
            sortDirection: powerbi.SortDirection.Descending
        },
    ]
};
this.host.applyCustomSort(args);
```

## Related content

* [Understand data view mapping in Power BI visuals](dataview-mappings.md)
* [Understanding capabilities](capabilities.md)
