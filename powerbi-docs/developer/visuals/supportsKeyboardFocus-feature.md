---
title: supportsKeyboardFocus feature
description: This article describes how to use supportsKeyboardFocus feature in Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 04/16/2020
---

# SupportsKeyboardFocus feature
This article describes how to use `supportsKeyboardFocus` feature in Power BI visuals.
`supportsKeyboardFocus` feature allows navigating the data points of the visual using the keyboard only.

[Learn more about keyboard navigation for visuals](../../desktop-accessibility-consuming-tools.md#keyboard-navigation)

## Example
Select any data point within the visual and click on tab. You should be able to navigate through the data point.

See the blue square that is the navigation mode.
![](./media/supportsKeyboardFocus-feature/example.png)

## Requirements
> This feature requires API v2.0.0 or higher.

This feature can be applied to all visuals except image visuals.

## Usage
To use `supportsKeyboardFocus` feature you need to add the following code in your visual's `capabilities.json` file.
This capability allows the visual to receive focus through keyboard navigation.

```json
    {   
            ...
        "supportsKeyboardFocus": true
            ...
    }

```