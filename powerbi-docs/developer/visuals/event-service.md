---
title: Render events in Power BI visuals
description: Power BI visuals can notify Power BI that they're ready for export to PowerPoint or PDF.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 06/18/2019
---

# Render events in Power BI visuals

The API consists of three methods (`started`, `finished`, or `failed`) that should be called during rendering.

When rendering starts, the Power BI visual code calls the `renderingStarted` method to indicate that the rendering process has started.

If rendering is completed successfully, the Power BI visual code immediately calls the `renderingFinished` method, notifying the listeners (primarily, *export to PDF* and *export to PowerPoint*) that the visual's image is ready for export.

If a problem occurs during the process, the Power BI visual is prevented from being rendered successfully. To notify the listeners that the rendering process hasn't been completed, the Power BI visual code should call the `renderingFailed` method. This method also provides an optional string to provide a reason for the failure.

## Usage

```typescript
export interface IVisualHost extends extensibility.IVisualHost {
    eventService: IVisualEventService ;
}

/**
 * An interface for reporting rendering events
 */
export interface IVisualEventService {
    /**
     * Should be called just before the actual rendering starts, 
     * usually at the start of the update method
     *
     * @param options - the visual update options received as an update parameter
     */
    renderingStarted(options: VisualUpdateOptions): void;

    /**
     * Should be called immediately after rendering finishes successfully
     * 
     * @param options - the visual update options received as an update parameter
     */
    renderingFinished(options: VisualUpdateOptions): void;

    /**
     * Called when rendering fails, with an optional reason string
     * 
     * @param options - the visual update options received as an update parameter
     * @param reason - the optional failure reason string
     */
    renderingFailed(options: VisualUpdateOptions, reason?: string): void;
}
```

### Sample: The visual displays no animations

```typescript
    export class Visual implements IVisual {
        ...
        private events: IVisualEventService;
        ...

        constructor(options: VisualConstructorOptions) {
            ...
            this.events = options.host.eventService;
            ...
        }

        public update(options: VisualUpdateOptions) {
            this.events.renderingStarted(options);
            ...
            this.events.renderingFinished(options);
        }
```

### Sample: The visual displays animations

If the visual has animations or async functions for rendering, the `renderingFinished` method should be called after the animation or inside async function.

```typescript
    export class Visual implements IVisual {
        ...
        private events: IVisualEventService;
        private element: HTMLElement;
        ...

        constructor(options: VisualConstructorOptions) {
            ...
            this.events = options.host.eventService;
            this.element = options.element;
            ...
        }

        public update(options: VisualUpdateOptions) {
            this.events.renderingStarted(options);
            ...
            // Learn more at https://github.com/d3/d3-transition/blob/master/README.md#transition_end
            d3.select(this.element).transition().duration(100).style("opacity","0").end().then(() => {
                // renderingFinished called after transition end
                this.events.renderingFinished(options);
            });
        }
```

## Rendering events for visual certification

One requirement of visuals certification is the support of rendering events by the visual. For more information, see [certification requirements](power-bi-custom-visuals-certified.md#certification-requirements).