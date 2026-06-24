---
title: Power BI custom visual resize optimization
description: Learn how Power BI custom visuals handle resize events and how update flags, cached state, and deferred layout work improve viewport changes.
author: billmath
ms.author: billmath
ms.reviewer: tebercov, asafmozes
ms.date: 06/22/2026
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.custom: doc-kit-assisted
ai-usage: ai-generated
#customer intent: As a Power BI custom visual developer, I want to understand resize-update events so that I can keep visual resize interactions responsive.
---

# Power BI custom visual resize optimization

In this article, you learn how to optimize resize handling in Power BI custom visuals that you build with `powerbi-visuals-api`. When a report user changes a custom visual's size, Power BI calls the visual's `update()` method with `VisualUpdateOptions`, including the current viewport dimensions. This guidance applies only to Power BI custom visuals; it doesn't change resize behavior for built-in Power BI visuals.

If a custom visual treats every `VisualUpdateType.Resize` event as a full data change, repeated resize events can reprocess `options.dataViews`, rebuild Document Object Model (DOM) elements, and block the browser main thread. To keep resize interactions responsive, use `VisualUpdateType` bit flags to separate data changes from viewport changes, cache processed visual state, and defer layout-dependent rendering until `VisualUpdateType.ResizeEnd`.

## How do Power BI VisualUpdateType resize events work?

The [`Visual.update(options)` method](/power-bi/developer/visuals/visual-api#update) receives an `options.type` field indicating why Power BI triggered the update. The viewport is the current custom visual container size from `options.viewport`, including width and height.

| VisualUpdateType flag | When Power BI sends it | Resize handling |
|-------------|--------------------------|-----------------|
| **`VisualUpdateType.Data`** | Data or data view changed. | Perform a full render. |
| **`VisualUpdateType.Resize`** | A Power BI custom visual is being resized, and Power BI sends repeated events while the resize is in progress. | Do only minimal viewport work. |
| **`VisualUpdateType.ResizeEnd`** | The resize operation completed. | Recalculate final layout-dependent elements only when needed. |
| **`VisualUpdateType.ViewMode`** | View mode changed, such as from edit mode to view mode. | Perform a full render. |
| **`VisualUpdateType.Style`** | Theme or style changed. | Perform a full render. |

**Key insight:** `VisualUpdateType` is a bit-flag enum. A single `options.type` value can include `VisualUpdateType.Resize` and other update reasons, such as `VisualUpdateType.Data` or `VisualUpdateType.Style`. Use bitwise checks, such as `(options.type & VisualUpdateType.Resize) !== 0`, instead of equality checks. During `VisualUpdateType.Resize`, do only minimal viewport work. During `VisualUpdateType.ResizeEnd`, perform final layout recalculations that require the final container size.

## How do I implement a resize-only update pattern?

The resize-update pattern separates resize-only work from updates that require data, style, or view-mode rendering. If `options.type` includes any non-resize flags, perform a full render instead of treating the update as a viewport-only change.

| VisualUpdateType condition | Rendering behavior | Work to perform |
|------------------|-------------|-----------------|
| **Non-resize flags are present** | Full render | Reprocess data, apply style or view-mode changes, and rebuild elements that depend on those changes. |
| **Only `VisualUpdateType.Resize` is present** | Resize-only rendering | Adjust viewport dimensions or scale existing content without reprocessing data. |
| **`VisualUpdateType.ResizeEnd` is present with only resize flags** | Resize-end rendering | Recalculate final layout-dependent elements after the container reaches its final size. |

```typescript
public update(options: VisualUpdateOptions): void {
    const resizeFlags = VisualUpdateType.Resize | VisualUpdateType.ResizeEnd;
    const isResize = (options.type & VisualUpdateType.Resize) !== 0;
    const isResizeEnd = (options.type & VisualUpdateType.ResizeEnd) !== 0;
    const hasOnlyResizeFlags = (options.type & ~resizeFlags) === 0;

    if (!hasOnlyResizeFlags) {
        this.fullRender(options);
        return;
    }

    if (isResizeEnd) {
        // Resize finished; recalculate layout-dependent elements only when needed.
        this.recalculateLayout(options.viewport);
        return;
    }

    if (isResize) {
        // Adjust only layout and viewport; do not reprocess data or rebuild the DOM.
        this.adjustViewport(options.viewport);
        return;
    }

    // Full render for data changes, style changes, and other updates.
    this.fullRender(options);
}
```

After you add the pattern, verify it by resizing the custom visual on a report canvas. The visual should update size during the drag without reprocessing the data view, and final layout-dependent elements, such as axis labels, should appear in their final positions after `VisualUpdateType.ResizeEnd`.

## What work belongs in resize and resize-end events?

During an active `VisualUpdateType.Resize` event, prefer operations that update the viewport or scale existing rendered elements. Save resource-intensive work for `VisualUpdateType.ResizeEnd` or for updates that include data, style, or view-mode changes.

### Work to do during `VisualUpdateType.Resize`

- Update SVG `viewBox` or container dimensions with CSS.
- Scale existing rendered content, for example, with CSS `transform`.
- Store the new `options.viewport` width and height for later use.

### Work to avoid during `VisualUpdateType.Resize`

- Requery or reprocess `options.dataViews`.
- Rebuild DOM elements, such as axes, legends, or data points.
- Recalculate text measurements for all labels.
- Trigger resource-intensive layout algorithms, such as force-directed graphs or treemaps.

### Work to do on `VisualUpdateType.ResizeEnd`

- Recalculate axis tick counts or text labels that depend on final `options.viewport` dimensions.
- Rerender elements that can't scale proportionally.
- Persist final viewport-dependent state if the visual stores layout metadata.

## Which resize-resilient rendering techniques should I use?

Use these techniques to reduce the amount of JavaScript work that each resize event performs. Choose the approach that matches how the visual renders axes, labels, legends, and data marks.

| Resize technique | Use this technique when | Resize benefit |
|-----------|----------|----------------|
| **SVG `viewBox`** | The visual content can scale proportionally. | Set a fixed `viewBox` with `preserveAspectRatio` and let the browser scale automatically, so `update()` doesn't need resize-specific work. |
| **CSS-driven layout** | Containers, legends, or simple marks can respond to CSS sizing. | Use percentage-based widths and heights or flexbox so the browser handles resize without JavaScript intervention. |
| **Debounced recalculations** | The visual must recompute layout after the final container size is known. | Debounce recalculation on `VisualUpdateType.ResizeEnd` to avoid redundant work from rapid successive resizes. |
| **Cached processed data** | Data processing doesn't depend on viewport dimensions. | Store processed data points so `VisualUpdateType.Resize` and `VisualUpdateType.ResizeEnd` render with cached data and the new viewport dimensions. |

## What performance impact does resize optimization have?

Power BI custom visuals that perform full renders on every `VisualUpdateType.Resize` call can make resizing feel slow, create unnecessary DOM changes, and block the browser main thread across the report page. A resize-optimized custom visual skips data processing during active resize, updates only viewport-dependent presentation, and performs final layout calculation on `VisualUpdateType.ResizeEnd`.

## How do I verify resize optimization?

Use this checklist to confirm that resize behavior uses minimal resources while preserving full rendering for non-resize updates.

> [!div class="checklist"]
> * Check `options.type` in your `update()` method.
> * Use bitwise checks for `VisualUpdateType` flags.
> * Return early or do minimal work when `options.type` includes `VisualUpdateType.Resize`.
> * Defer resource-intensive recalculations to `VisualUpdateType.ResizeEnd`.
> * Use CSS/SVG responsive techniques where possible.
> * Cache processed data between updates.
> * Verify that data processing doesn't run during active resize events.

## Where can I find Power BI custom visual resize resources?

Use these resources for the API details and related performance guidance:

- [Visual API: `update` method and `VisualUpdateOptions`](/power-bi/developer/visuals/visual-api#update)
- [Power BI Visuals API typings](https://github.com/microsoft/powerbi-visuals-api/blob/main/src/visuals-api.d.ts)
- [Performance tips for custom visuals](/power-bi/developer/visuals/performance-tips)
