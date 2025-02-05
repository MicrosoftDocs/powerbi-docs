---
title: Advanced edit mode in Power BI visuals
description: Learn how to enable and use the Advanced edit mode to configure advanced UI controls in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 02/05/2025
---

# Advanced edit mode in Power BI visuals

Advanced edit mode enables you to use advanced UI controls in your Power BI visual. From report editing mode, select the **Edit** button on a visual and set the edit mode to **Advanced**. The visual uses the `EditMode` flag to determine if it should display this UI control.

:::image type="content" source="media/advanced-edit-mode/edit-mode.png" alt-text="Screenshot that shows how to open Edit Mode.":::

By default, the visual doesn't support advanced edit mode (`"advancedEditModeSupport: 0"`). To enable Advanced edit mode, add a line to the visual's *capabilities.json* file by setting the `advancedEditModeSupport` property.

The possible values are:

- `0` - **NotSupported**. The visual doesn't support Advanced edit mode. The **Edit** button is not displayed on this visual.
- `1` - **SupportedNoAction**. The visual supports Advanced edit mode and doesn't require any further changes.
Power BI doesn't switch the visual to *Focus* Mode. Developers can use this setting as an external button to run several processes in the same viewport.
- `2` - **SupportedInFocus**. The visual supports Advanced edit mode and requires the host to enter Focus mode when entering Advanced edit mode.

## Enter advanced edit mode

An **Edit** button is displayed if:

- The `advancedEditModeSupport` property is set in the *capabilities.json* file to either `SupportedNoAction` or `SupportedInFocus`.
- The visual is viewed in report editing mode.

If `advancedEditModeSupport` property is missing from the *capabilities.json* file or set to `NotSupported`, the **Edit** button doesn't appear.

When you select **Edit**, the visual gets an update() call with EditMode set to `Advanced`. Depending on the value that's set in the *capabilities.json* file, the following actions occur:

- `SupportedNoAction`: The host doesn’t require further action.
- `SupportedInFocus`: The host pops out the visual in Focus mode.

You can read more about how to configure the *capabilities.json* file in [Capabilities and properties of Power BI visuals](capabilities.md). 

## Exit advanced edit mode

The **Back to report** button appears if the `advancedEditModeSupport` property is set in the *capabilities.json* file to `SupportedInFocus`. 

## Related content

[Add conditional formatting](conditional-format.md)
