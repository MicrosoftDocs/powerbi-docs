---
title: Add context menu to Power BI Visual
description: Learn how to add a context menu to a Power BI visual.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
manager: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 04/25/2021
---

# Add a context menu to your Power BI Visual

Right-clicking anywhere inside a visual's viewport (or long-press for touch devices) triggers a display of the context menu.
There are two possible context menus that can be displayed depending on if you click on a datapoint or on empty space inside the visual:

* Calling the context menu on empty space allows you to perform various operations on the visual, such as analyzing, summarizing, or copying it.

    ![Context menu called on empty space](media/context-menu/context-menu-called-on-empty-space-in-barchart.png)

* Calling the Context menu on a specific datapoint gives you additional options that can be applied to that datapoint. In this case the context menu contains *Include* and *Exclude* which will apply the corresponding filter options to that DataPoint.

    ![Context menu called on datapoint](media/context-menu/datapoint-context-menu-in-barchart.png)

> [!IMPORTANT]
> All visuals published to AppSource must support both `ContextMenu` modes.

## How to add a context menu

Use `selectionManager.showContextMenu()` with parameters `selectionId` and a position (as an `{x:, y:}` object) to have Power BI display a context menu for your visual.

> [!NOTE]
> The `selectionManager.showContextMenu()` is only available from Visuals API 2.2.0 and above.

A context menu was added to the following sample BarChart for reference:

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

## Next steps

>[!div class="nextstepaction"]
>[Make visual interactive](selection-api.md)

>[!div class="nextstepaction"]
>[Tooltips in Power BI visuals](add-tooltips.md)
