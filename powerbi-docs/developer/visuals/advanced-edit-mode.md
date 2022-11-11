---
title: Advanced edit mode in Power BI visuals
description: This article discusses how to set advanced UI controls in Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/14/2021
---

# Advanced edit mode in Power BI visuals

In *Advanced Edit* mode, you can use advanced UI controls in your Power BI visual. From the *Report Editing mode*, select the **Edit** button on a visual and set the edit mode to **Advanced**. The visual uses the `EditMode` flag to determine if the visual displays the **Edit** UI control.

![Screenshot of a Power BI visual, which shows the Edit button in the visual menu.](media/advanced-edit-mode/edit-mode.png)

By default, the visual doesn't support Advanced Edit mode (`"advancedEditModeSupport: 0"`). To enable Advanced Edit mode, add a line to the visual's *capabilities.json* file that sets the `advancedEditModeSupport` property.

The possible values are:

* `0` - **NotSupported**. The visual doesn't support Advanced Edit mode. The **Edit** button does not appear on this visual.

* `1` - **SupportedNoAction**. The visual supports Advanced Edit mode and doesn't require more changes. Power BI doesn't switch the visual to *Focus* Mode. Developers might use this setting as an external button to run several processes in the same viewport.

* `2` - **SupportedInFocus**. The visual supports Advanced Edit mode and requires the host to enter Focus mode when entering Advanced Edit mode.

## Enter advanced edit mode

An **Edit** button appears if:

* The `advancedEditModeSupport` property is set in the *capabilities.json* file to either `SupportedNoAction` or `SupportedInFocus`.

* The visual is viewed in report editing mode.

If `advancedEditModeSupport` property is missing from the *capabilities.json* file or set to `NotSupported`, the **Edit** button does not appear.

When you select **Edit**, the visual gets an `update()` call with EditMode set to `Advanced`. Depending on the value that's set in the *capabilities.json* file, the following actions occur:

* `SupportedNoAction`: The host doesn't require further action.
* `SupportedInFocus`: The host pops out the visual into Focus mode.

## Exit advanced edit mode

The **Back to report** button appears if the `advancedEditModeSupport` property is set in the *capabilities.json* file to `SupportedInFocus`.

## Next steps

> [!div class="nextstepaction"]
> [Add conditional formatting](conditional-format.md)
