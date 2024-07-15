---
title: Keyboard navigation feature in Power BI
description: Learn how to enable the accessibility feature that uses the keyboard to navigate through visuals in Power BI.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/20/2024
#customer intent: As a Power BI visual developer, I want to learn how to enable keyboard navigation in my visual so that users can navigate through the visual using the keyboard.
---

# Support keyboard navigation in a custom visual

This article explains how to support navigation through a Power BI visual using the keyboard. Keyboard navigation makes Power BI more accessible to people with disabilities and provides more options for interacting with reports.

The `supportsKeyboardFocus` feature makes it possible to navigate the data points of the visual by using only the keyboard.

## Basic keyboard accessibility features

All visuals come with the following basic keyboard accessibility:

* Press <kbd>Esc</kbd> to move the focus from inside the visual to the visual container.
* Press <kbd>Tab</kbd> from inside a custom visual to navigate through tabbable elements in the visual. Pressing <kbd>Tab</kbd> after the last tababble element moves the focus back outside of the visual.

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
* Press <kbd>Tab</kbd> from inside the custom visual to navigate through tabbable elements. The focus stays inside the visual until you press <kbd>Esc</kbd>.

> [!NOTE]
> Not all HTML elements are tabbable by default (for example, div and span). Consider adding the correct attribute (e.g tabindex) to these elements to make them tabbable.

## Considerations and limitations

* This feature requires API v2.1.0 or higher.

* This feature can't be applied to image visuals.

* Pressing <kbd>Enter</kbd> on the visual container won't always land on the first focusable element of the visual. To be sure to start at the first element, focus it programmatically after the focus goes into the visual.

* After pressing <kbd>Enter</kbd> on the visual container and after pressing <kbd>Tab</kbd> on the last focusable element, the user might have to press <kbd>Tab</kbd> more than once to get to the first element.

## Related content

* [Design Power BI reports for accessibility](../../create-reports/desktop-accessibility-creating-reports.md)
* [Developing a Power BI circle card visual](develop-circle-card.md)
