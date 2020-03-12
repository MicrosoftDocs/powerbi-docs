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
# How to create mobile-friendly custom visual
One of Power BI's major strengths is staying connected to your data from anywhere, anytime, with the Power BI app for Windows, iOS, and Android. Business users can get a 360° view of your business data on the go - at the touch of their fingertips.  
Mobile consumption plays a major role in Power BI, and creating custom visuals that address the unique needs of mobile devices should be one of your top of minds as a developer, to reach as many users as possible and provide them with the best experience possible.

## Must-Have requirements
The following requirements are essential in development of mobile-friendly visual.

### Rendering
Custom visual must render on all supported mobile browsers and mobile applications without errors in reports, dashboards and in focus mode. 

### Interactivity
Interactivity is important in order to provide the same functionality as for desktop devices. Try to support all events that are handled on desktop browsers or support analogous event handlers for mobile devices. Selection of data points and navigation should be implemented if visual provides such functionality on desktop browsers. If visual supports multi-selecting using Ctrl key - consider adding similar event handling for mobile devices.

Some mobile devices (touch screen devices) don't support any mouse events (all events with "mouse" prefix). In other words, you have to listen to mouse and touch events at the same.

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
Visual should be mobile-friendly in Focus mode – it should be optimized for the mobile screen size and looks good both in portrait and landscape orientations. 

Support small sizes of the visual.  Add new formatting options so a user will be able to change the size of visual elements (for example, of labels). Such improvement will allow users to customize visual for their reports or dashboards on mobile devices. The same settings will be applied to the visual in desktop browsers. If needed, you can override user formatting settings in order to adapt your visual to the small sizes of the visual.

### Failover
Visual should show descriptive error if it cannot be rendered on mobile devices for some reasons.

### Interactions
Consider adding mobile-specific event handlers, like dragging and scrolling.

## Supported browsers and devices
Visual should be rendered on all devices that support Power BI Apps. 

Testing against latest models of Windows, iOS, and Android devices should cover most quality aspects. Use the following devices list for testing to be sure that your visual provides the best experience to mobile users:

*	iPhone devices
    *	iPhone 7
    * iPhone 6
*	iPad tablets
    *	iPad 5
*	Android devices
    *	Samsung Galaxy S7 Edge
    *	Samsung Galaxy S6
*	Android tablets
    *	Google Nexus 7
    *	Samsung Galaxy Tab
*	Windows Phone devices
    *	Surface Pro 4
    * Lumia 950 or Lumia 950 XL