---
title: Sorting options for Power BI visuals
description: This article discusses default sorting behavior for Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
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

The `default` option is the simplest form. It allows sorting by one data field at a time. The user can select the field and direction for sorting.

```json
    "sorting": {
        "default": {   }
    }
```

:::image type="content" source="media/sort-options/default-sorting.png" alt-text="Screenshot of table of US states with default sorting options the context menu.":::

## Implicit sorting

Implicit sorting is sorting with the array parameter `clauses`, which describes sorting for each data role. `implicit` means that the visual's user can't change the sorting order. Power BI doesn't display sorting options in the visual's menu. However, Power BI does sort data according to specified settings.

`clauses` parameters can contain several objects with two parameters:

- `role`: Determines `DataMapping` for sorting
- `direction`: Determines sort direction (1 = Ascending, 2 = Descending)

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

## Next steps

> [!div class="nextstepaction"]
> [Understand data view mapping in Power BI visuals](dataview-mappings.md)

> [!div class="nextstepaction"]
> [Understanding capabilities](capabilities.md)
