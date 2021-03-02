---
title:  Mobile development in Power BI embedded analytics for better embedded BI insights
description:  How to create mobile-friendly Power BI visuals. Enable better embedded BI insights using Power BI embedded analytics.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/12/2019
---
# How to create mobile-friendly Power BI visuals
Mobile consumption has a major role in Power BI. One of its strengths is staying connected to your data anytime, anywhere.

As a developer creating Power BI visuals, the unique constraints of each mobile device must be addressed to reach as many users as possible, and provide the best mobile experience.

Use the [Power BI app for Windows, iOS, and Android](../../consumer/mobile/mobile-apps-for-mobile-devices.md) to give your business users a comprehensive view of their data on the go, at the touch of their fingertips.

## Requirements

The following requirements are essential for mobile friendly visual development:

- Render

  Your Power BI visuals has to render on all supported mobile devices, including supported browsers and applications, with no errors in reports, dashboards, or when running in **Focus** mode. 

- Interactive

  Interactive functionality must be provided in the same way as it's provided for desktop devices. All events handled on desktop browsers must be supported, or have comparable event handlers for mobile devices.
  
  For example, basic navigation and the selection of data points, should have the same functionality as in desktop browsers. If a visual supports multi-select using **Ctrl**, the developer needs to consider adding a similar event handler for mobile devices.

  The following table provides a list of corresponding events on mobile devices.

  | Mouse event name | Touch event name |
  |:----------------:|:----------------:|
  | `click` | `click` |
  | `mousemove` | `touchmove` |
  | `mousedown` | `touchstart` |
  | `mouseup` | `touchend` |
  | `dblclick` | use external library |
  | `contextmenu` | use external library |
  | `mouseover` | `touchmove` |
  | `mouseout` | `touchmove` (or external library) |
  | `wheel` | `NaN` |

  > [!NOTE]
  > Not all mobile or touch screen devices support mouse (or *mouse* prefixed) events. In such cases, handle both *mouse* and *touch* events at the same time.

## Optional
The following are considered optional and used to create a better end-user experience.

- Render

  To support smaller visual sizes, try adding format options that the user can change to adjust the size of each element. For example, add format options to labels, for use in reports and dashboards. This allows users to customize a visual specifically for their mobile device.
  
  The same settings can also be applied to the visuals in desktop browsers, and if needed, be overridden to adapt the visual to smaller screens.

  > [!NOTE]
  > To optimize a visual in **Focus** mode, both portrait and landscape screen size orientations need consideration, see [Display content in Focus mode](../../consumer/end-user-focus.md).

- Interactive

  Consider the addition of mobile specific event handlers, such as dragging and scrolling.

- Failover

  A visual should show a descriptive error if it cannot render on the mobile device.

## Supported browsers and devices
The Power BI visual must render on all devices supporting Power BI Apps, for more information see [supported browsers for Power BI](../../fundamentals/power-bi-browsers.md) and [Power BI mobile apps](../../consumer/mobile/mobile-apps-for-mobile-devices.md).

When testing against the latest models of Windows, iOS, and Android devices, the developer needs to consider most of these quality aspects.

## Next steps
To get started, see [Developing a Power BI circle card visual](./develop-circle-card.md).