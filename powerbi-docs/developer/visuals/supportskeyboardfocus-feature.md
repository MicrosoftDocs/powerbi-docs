---
title: The supportsKeyboardFocus feature in Power BI
description: This article describes how to use the supportsKeyboardFocus feature in Power BI visuals and its requirements.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 04/30/2020
---

# Use the supportsKeyboardFocus feature

This article describes how to use the `supportsKeyboardFocus` feature in Power BI visuals.
The `supportsKeyboardFocus` feature allows navigating the data points of the visual using the keyboard only.

To learn more about keyboard navigation for visuals, see [Keyboard Navigation](../../create-reports/desktop-accessibility-consuming-tools.md#keyboard-navigation).

## Example

Open a visual that uses the `supportsKeyboardFocus` feature. Select any data point within the visual and select tab. The focus moves to the next data point for each time you select tab. Select enter to select the highlighted data point.

![Supports keyboard focus example](./media/supportskeyboardfocus-feature/supports-keyboard-focus-example.png)

## Requirements

This feature requires API v2.1.0 or higher.

This feature can be applied to all visuals except image visuals.

## Usage

To use the `supportsKeyboardFocus` feature, add the following code to the *capabilities.json* file of your visual.
This capability allows the visual to receive focus through keyboard navigation.

```json
    {   
            ...
        "supportsKeyboardFocus": true
            ...
    }

```

## Next steps

To learn more about accessibility features, see [Design Power BI reports for accessibility](../../create-reports/desktop-accessibility-creating-reports.md).

To try out Power BI development, see [Developing a Power BI circle card visual](develop-circle-card.md).
