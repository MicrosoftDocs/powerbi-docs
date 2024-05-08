---
title:  Mobile development in Power BI
description: Learn how to create mobile-friendly Power BI visuals by using essential and recommended functions to add interactive functionality.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 1/19/2024
---

# How to create mobile-friendly Power BI visuals

Mobile devices allow users to connect to their data anytime and anywhere.

[Power BI apps for Windows, iOS, and Android](../../consumer/mobile/mobile-apps-for-mobile-devices.md) enable business users to have a comprehensive view of their data that's always at their fingertips.

As a developer creating Power BI visuals, you must address the unique constraints of each mobile device to reach as many users as possible and provide the best mobile experience.

## Required functionality

The following requirements are essential for developing mobile-friendly visuals:

* **Rendering**

  A Power BI visual has to render on all [supported mobile devices](/power-platform/admin/supported-web-browsers-and-mobile-devices), including browsers and applications. There should be no errors in reports and dashboards, or when visuals run in **Focus** mode.

* **Interactivity**

  Mobile devices should have the same interactive functionality as desktop devices. All events handled on desktop browsers must be supported, or have comparable event handlers, on mobile devices.
  
  For example, if a desktop visual supports multi-selection using the <kbd>Ctrl</kbd> key, consider adding a similar event handler for mobile devices.

  The following table provides a list of corresponding events on mobile devices.

  | Mouse event name | Touch event name |
  |:----------------:|:----------------:|
  | `click` | `click` |
  | `mousemove` | `touchmove` |
  | `mousedown` | `touchstart` |
  | `mouseup` | `touchend` |
  | `dblclick` | external library |
  | `contextmenu` | external library |
  | `mouseover` | `touchmove` |
  | `mouseout` | `touchmove` (or external library) |
  | `wheel` | `N/A` |

  > [!NOTE]
  > Not all mobile or touch screen devices support mouse (or *mouse* prefixed) events. In unsupported cases, handle both *mouse* and *touch* events at the same time.

## Optional functionality

The following functions are optional. The optional functions can be used to create a better end-user experience.

* **Recommended rendering**

  To support smaller visual sizes, add format options that allow the user to adjust the size of each element. For example, add format options to labels to use in reports and dashboards. The format options allow users to customize a visual specifically for their mobile device.
  
  The same settings can be applied to the visuals in desktop browsers and, if needed, be overridden to adapt the visual to smaller screens.

  > [!NOTE]
  > To optimize a visual in **Focus** mode, both portrait and landscape screen size orientations should be considered. See [Display content in Focus mode](../../consumer/end-user-focus.md).

* **Recommended interactivity**

  Consider adding mobile-specific event handlers, like dragging and scrolling.

* **Failover**

  If a visual can't render on a mobile device, the visual should show a **descriptive** error.

## Supported browsers and devices

Power BI visuals must render on all devices that support Power BI apps. For more information, see [supported browsers for Power BI](../../fundamentals/power-bi-browsers.md) and [Power BI mobile apps](../../consumer/mobile/mobile-apps-for-mobile-devices.md).

## Related content

> [!div class="nextstepaction"]
> [Develop a Power BI circle card visual](./develop-circle-card.md)