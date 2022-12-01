---
title: Keyboard navigation feature in Power BI
description: This article describes how to enable using the keyboard to navigate visuals in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 10/27/2022
---

# Enable keyboard navigation of a visual

This article describes how to enable the user to navigate through a Power BI visual using the keyboard. Using the keyboard makes Power BI more accessible to people with disabilities and allows everyone more choice when interacting with reports.

The `supportsKeyboardFocus` feature makes it possible to navigate the data points of the visual using only the keyboard.

## How to navigate using the keyboard

For a brief illustration of how keyboard navigation works:

1. Open any visual that has the `supportsKeyboardFocus` feature enabled. Try a visual from the [Retail Analysis sample](../../create-reports/sample-retail-analysis.md#get-the-sample), for example.
2. Select any data point within the visual and select the **Tab** key.
    The focus moves to the next data point each time you select **Tab**.
3. Press **Enter** to select the highlighted data point.

> [!div class="mx-imgBorder"]
> ![Screenshot of the Power BI visual, which shows a selected data point.](./media/supportskeyboardfocus-feature/supports-keyboard-focus-example.png)

To learn more about keyboard navigation for visuals, see [Keyboard Navigation](../../create-reports/desktop-accessibility-consuming-tools.md#keyboard-navigation).

## Enable the support keyboard navigation feature

 The `supportsKeyboardFocus` feature allows a visual to receive focus through keyboard navigation. To enable, add the following code to the *capabilities.json* file of your visual:

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
