---
title: Keyboard navigation feature in Power BI
description: Learn how to enable the accessibility feature that uses the keyboard to navigate through visuals in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/13/2023
---

# Support keyboard navigation of a visual

This article explains how to support navigation through a Power BI visual using the keyboard. Keyboard navigation makes Power BI more accessible to people with disabilities and provides more options for interacting with reports.

The `supportsKeyboardFocus` feature makes it possible to navigate the data points of the visual by using only the keyboard.

## Basic keyboard accessibility features

All visuals come with the following basic keyboard accessibility:

* Press <kbd>Tab</kbd> from outside the visual to navigate through the different elements of the report.
* Press <kbd>Esc</kbd> to move the focus from inside the visual to the visual container.
* Press <kbd>Tab</kbd> from inside a custom visual to navigate through focusable elements in the visual. Pressing <kbd>Tab</kbd> after the last tababble element moves the focus back outside of the visual.

Hoe do you get inside the visual?

> [!div class="mx-imgBorder"]
> ![Screenshot of the Power BI visual, which shows a selected data point.](./media/supportskeyboardfocus-feature/supports-keyboard-focus-example.png)

For more information about keyboard navigation for visuals, see [Keyboard navigation](../../create-reports/desktop-accessibility-consuming-tools.md#keyboard-navigation).

## Enhanced keyboard accessibility

To make your custom visual even more accessible, add the `supportsKeyboardFocus` capability to your visual by adding the following line to the "capabilities.json" file:

```json
    {   
            ...
        "supportsKeyboardFocus": true
            ...
    }
```

This capability adds the following features to your custom visual:

* Press <kbd>Enter</kbd> when the focus is on the visual container to move the focus to inside the custom visual.

* Press <kbd>Tab</kbd> when the focus is inside the custom visual to enable navigation through tabbable elements. The focus stays inside the visual until you press <kbd>Esc</kbd>.

> [!NOTE]
> Not all HTML elements are tabbable by default (e.g., div, span). Make sure to consider adding the correct attribute (e.g tabindex) to such elements if you want them to be tabbable.

## Considerations and limitations

* This feature requires API v2.1.0 or higher.
* This feature can't be applied to image visuals.

## Next steps

* [Design Power BI reports for accessibility](../../create-reports/desktop-accessibility-creating-reports.md)
* [Developing a Power BI circle card visual](develop-circle-card.md)
