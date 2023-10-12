---
title: Power BI custom visual dynamic format API.
description: This article describes the API used to allow a Power BI custom visual display values with dynamic format strings.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 10/12/2023
---

# Power BI custom visual dynamic format API

From API version 4.2, developers can create visuals with [dynamic string formats](../create-reports/desktop-dynamic-format-strings.md) support.

## How to use the dynamic format

To allow the visual to operate with dynamic format strings, the following fields should be added in the `capabilitites.json`:

```json
"objects": {
    "general": {
        "properties": {
            "formatString": {
                "type": {
                    "formatting": {
                        "formatString": true
                    }
                }
            }
        }
    },
}
```

After that, the custom visual will receive a dynamic format string through the `update()` options shown below: 

IMAGE

There are two arrays inside of `options.dataViews[0].categorical.values[0]`:
1. `values` - values from the dataset
2. `objects` - objects with `general.formatString` property

Each `object` corresponds to a `value`. As an example value `12519995905.9842` from the screenshot above has the format `¥ #,0`.
To apply this format to the value you can use the `format(value: any, format: string)` method from [powerbi-visuals-utils-formattingutils](./visuals/utils-formatting.md).
