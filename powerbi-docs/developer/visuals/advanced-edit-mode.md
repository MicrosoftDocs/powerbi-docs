---
title: Advanced edit mode in Power BI visuals
description: This article discusses how to set advanced UI controls in Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Advanced edit mode in Power BI visuals

If you require advanced UI controls in your Power BI visual, you can take advantage of advanced edit mode. When you're in report editing mode, you select an **Edit** button to set the edit mode to **Advanced**. The visual can use the `EditMode` flag to determine whether it should display this UI control.

By default, the visual doesn't support advanced edit mode. If a different behavior is required, you can explicitly state this in the visual's *capabilities.json* file by setting the `advancedEditModeSupport` property.

The possible values are:

- `0` - NotSupported

- `1` - SupportedNoAction

- `2` - SupportedInFocus

## Enter advanced edit mode

An **Edit** button is displayed if:

* The `advancedEditModeSupport` property is set in the *capabilities.json* file to either `SupportedNoAction` or `SupportedInFocus`.

* The visual is viewed in report editing mode.

If `advancedEditModeSupport` property is missing from the *capabilities.json* file or set to `NotSupported`, the **Edit** button is not displayed.

![Enter edit mode](media/advanced-edit-mode/edit-mode.png)

When you select **Edit**, the visual gets an update() call with EditMode set to `Advanced`. Depending on the value that's set in the *capabilities.json* file, the following actions occur:

* `SupportedNoAction`: No further action is required by the host.
* `SupportedInFocus`: The host pops out the visual into in focus mode.

## Exit advanced edit mode

The **Back to report** button is displayed if:

* The `advancedEditModeSupport` property is set in the *capabilities.json* file to `SupportedInFocus`.
