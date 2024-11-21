---
title: Power BI custom visual dynamic format API.
description: This article describes the API used to allow a Power BI custom visual process value with dynamic format strings.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 05/12/2024
#customer intent: As a Power BI visual developer, I want to learn how to use dynamic format strings in my custom visual so that I can process values with dynamic formatting.
---

# Power BI custom visual dynamic format API

From API version 4.2, developers can create reports with [dynamic string formats](../../create-reports/desktop-dynamic-format-strings.md) support.

## Enable the dynamic format support for visual

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

## How to use the dynamic string format

When dynamic string format is enabled, the custom visual receives format strings through the `update()` options as shown in the screenshot. 

:::image type="content" source="media/dynamic-format/dynamic-format-strings-example.png" alt-text="Screenshot of update options content with dynamic format strings.":::

There are two arrays inside of `options.dataViews[0].categorical.values[0]`:
1. `values` - values from the dataset
2. `objects` - objects with `general.formatString` property

Each `object` corresponds to a `value`. As an example value `12519995905.9842` from the screenshot has the format `¥ #,0`.
To apply this format to the value, you can use the [format method](./utils-formatting.md#format) from [powerbi-visuals-utils-formattingutils](./utils-formatting.md).
