---
title: Keyboard navigation feature in Power BI
description: Learn how to enable the accessibility feature that uses the keyboard to navigate through visuals in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/13/2023
---

# Enable keyboard navigation of a visual

This article describes how to navigate through a Power BI visual using the keyboard. The keyboard makes Power BI more accessible to people with disabilities and allows everyone more choices when interacting with reports.

The `supportsKeyboardFocus` feature makes it possible to navigate the data points of the visual by using only the keyboard.

## How to navigate using the keyboard

Follow these steps for a brief illustration of how keyboard navigation works:

1. Open any visual that has the `supportsKeyboardFocus` feature enabled. Try a visual from the [Retail Analysis sample](../../create-reports/sample-retail-analysis.md#get-the-built-in-sample-in-the-power-bi-service).
2. Select any data point within the visual, and press the **Tab** key.
    The focus moves to the next data point each time you press **Tab**.
3. Press **Enter** to select the highlighted data point.

> [!div class="mx-imgBorder"]
> ![Screenshot of the Power BI visual, which shows a selected data point.](./media/supportskeyboardfocus-feature/supports-keyboard-focus-example.png)

For more information about keyboard navigation for visuals, see [Keyboard navigation](../../create-reports/desktop-accessibility-consuming-tools.md#keyboard-navigation).

## Enable the support keyboard navigation feature

 The `supportsKeyboardFocus` feature allows a visual to receive focus through keyboard navigation. To enable this feature, add the following code to the *capabilities.json* file of your visual:

```json
    {   
            ...
        "supportsKeyboardFocus": true
            ...
    }
```

## Considerations and limitations

* This feature requires API v2.1.0 or higher.
* This feature can't be applied to image visuals.

## Next steps

> [!div class="nextstepaction"]
> [Design Power BI reports for accessibility](../../create-reports/desktop-accessibility-creating-reports.md)

> [!div class="nextstepaction"]
> [Developing a Power BI circle card visual](develop-circle-card.md)
