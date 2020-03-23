---
title:  Mobile Development
description:  How to create mobile-friendly custom visual
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 03/12/2019
---
# How to create a mobile-friendly Custom Visual
One of Power BI's major strengths is staying connected to your data from anywhere, anytime, with the Power BI app for Windows, iOS, and Android. Business users can get a 360° view of their business data on the go - at the touch of their fingertips. 
Mobile consumption plays a major role in Power BI, and creating Custom Visuals that address the unique needs of mobile devices should be one of your top of minds as a developer, to reach as many users as possible and provide them with the best experience possible.

## Must-Have requirements
The following requirements are essential in development of mobile-friendly visual.

### Rendering
Custom visuals must be rendered on all supported mobile browsers and mobile applications without errors in reports, dashboards and in focus mode. 

### Interactivity
Interactivity is important in order to provide the same functionality as for desktop devices. Try to support all events that are handled on desktop browsers or support analogous event handlers for mobile devices. Selection of data points and navigation should be implemented if the visual provides such functionality on desktop browsers. If the visual supports multi-selecting using Ctrl key - consider adding similar event handling for mobile devices.

Some mobile devices (touch screen devices) don't support any mouse events (all events with "mouse" prefix). In such cases process both "mouse" and "touch" events at the same time.

Use the following table in order to choose the correct event name at mobile devices:

| Mouse event name | Touch event name |
|:----------------:|:----------------:|
| click | click |
| mousemove | touchmove |
| mousedown | touchstart |
| mouseup | touchend |
| dblclick | Use external library |
| contextmenu | Use external library |
| mouseover | touchmove |
| mouseout | touchmove (external library) |
| wheel | NaN |

## Nice-to-Have requirements
Consider implementing requirements below to provide the best experience for mobile users.

### Rendering
A visual should be mobile-friendly in Focus mode – it should be optimized for the mobile screen size and look good both in portrait and landscape orientations.

Support small sizes of the visual. Add new formatting options so that a user will be able to change the size of visual elements (for example, of labels). Such improvement will allow users to customize the visual for their reports or dashboards on mobile devices. The same settings will be applied to the visual in desktop browsers. If needed, you can override user formatting settings in order to adapt your visual to the small sizes.

### Failover
A visual should show descriptive error if it cannot be rendered on mobile devices for some reasons.

### Interactions
Consider adding mobile-specific event handlers, like dragging and scrolling.

## Supported browsers and devices
A visual should be rendered on all devices that support Power BI Apps.

Testing against latest models of Windows, iOS, and Android devices should cover most quality aspects.