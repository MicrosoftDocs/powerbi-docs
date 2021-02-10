---
title: Add context menu to Power BI Visual in Power BI embedded analytics for better embedded BI insights
description: Learn how to add a context menu to a Power BI visual. Enable better embedded BI insights using Power BI embedded analytics.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
manager: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/18/2019
---

# Add context menu to Power BI Visual

You can use `selectionManager.showContextMenu()` with parameters `selectionId` and a position (as an `{x:, y:}` object) to have Power BI display a context menu for your visual.

> [!IMPORTANT]
> The `selectionManager.showContextMenu()` was introduced in Visuals API 2.2.0.

Typically it's added as a right-click event (or long-press for touch devices)
Context-Menu was added to the sample BarChart for reference:

```typescript
    public update(options: VisualUpdateOptions) {
        //...
        //handle context menu
        this.svg.on('contextmenu', () => {
            const mouseEvent: MouseEvent = d3.event as MouseEvent;
            const eventTarget: EventTarget = mouseEvent.target;
            let dataPoint = d3.select(eventTarget).datum();
            this.selectionManager.showContextMenu(dataPoint? dataPoint.selectionId : {}, {
                x: mouseEvent.clientX,
                y: mouseEvent.clientY
            });
            mouseEvent.preventDefault();
        });
```
