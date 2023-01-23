---
title: Add context menu to Power BI custom visual
description: Learn how you can use the sample BarChart visual to add a context menu that displays on a Power BI visual.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 01/06/2023
---

# Add a context menu to your Power BI Visual

Every Power BI visual can display a context menu. The context menu allows you to perform various operations on the visual, such as analyzing, summarizing, or copying it.
When you right-click anywhere inside a visual's viewport (or long-press for touch devices), the context menu displays.
There are two modes of context menus for each visual. The mode that displays depends on where you click inside the visual:

* Calling the context menu on **empty space** gives you the basic context menu for the visual.
* Calling the context menu on a specific **data point** gives you added options that can be applied to that data point. In this case, the context menu also contains the options *Show data point as a table*, *Include*, and *Exclude*, which will apply the corresponding filter to that data point.

## [Context menu on empty space](#tab/EmptySpace)

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/context-menu/context-menu-called-on-empty-space-in-barchart.png" alt-text="Screenshot of a visual with the basic context menu called from an empty space.":::

## [Context menu on data point](#tab/DataPoint)

>[!div class="mx-imgBorder"]
>:::image type="content" source="media/context-menu/datapoint-context-menu-in-barchart.png" alt-text="Screenshot of a visual with the basic context menu called from a data point.":::

---

## How to add a context menu

Use `selectionManager.showContextMenu()` with parameters `selectionId` and a position (as an `{x:, y:}` object) to have Power BI display a context menu for your visual.

> [!NOTE]
>
> * The `selectionManager.showContextMenu()` is available from Visuals API version 2.2.0.
> * All visuals published to AppSource must support both `ContextMenu` modes (empty space and data point).

The following example shows how to add a context menu to a visual. The code is taken from the `barChart.ts` file, which is part of the [sample BarChart visual](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart):

```typescript
constructor(options: VisualConstructorOptions) {
        ...
        this.handleContextMenu();
    }

private handleContextMenu() {
        this.svg.on('contextmenu', () => {
            const mouseEvent: MouseEvent = getEvent();
            const eventTarget: EventTarget = mouseEvent.target;
            let dataPoint: any = d3Select(<d3.BaseType>eventTarget).datum();
            this.selectionManager.showContextMenu(dataPoint ? dataPoint.selectionId : {}, {
                x: mouseEvent.clientX,
                y: mouseEvent.clientY
            });
            mouseEvent.preventDefault();
        });
    }
```

## Next steps

* [Add interactivity into visual by Power BI visuals selections](selection-api.md)
* [Build a bar chart](create-bar-chart.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com)
