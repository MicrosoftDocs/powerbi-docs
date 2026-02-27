---
title: Render events in Power BI visuals
description: Learn about the API needed so that Power BI visuals can notify Power BI that they're ready for export to PowerPoint or PDF.
author: billmath
ms.author: billmath
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 02/27/2026
#customer intent: As a Power BI visual developer, I want to learn how to use the rendering events API so that I can notify Power BI that my visual is ready for export to PowerPoint or PDF.
---

# "Rendering" events in Power BI visuals

In order to get a [visual certified](power-bi-custom-visuals-certified.md), it must include **rendering events**.
These events let listeners (primarily, *export to PDF* and *export to PowerPoint*) know when the visual is being rendered and when it's ready for export.

>[!IMPORTANT]
>Any visual that exports data (for example, to a PowerPoint or *.pdf* file) must contain rendering events to ensure that the export doesn't begin before the visual finished rendering.

The **rendering events API** consists of three methods to call during rendering:

* `renderingStarted`: Call this method to indicate that rendering started. **Always call this method as the first line of your *update* method**, since that's where the rendering process begins.

* `renderingFinished`: Call this method when rendering completes successfully, to notify listeners that the visual's image is ready for export. **This call should be the last line of code that runs** when the visual updates. It's usually, but not always, the last line of the update method.

* `renderingFailed`: Call this method if a problem occurs during rendering, to notify listeners that rendering didn't complete. You can pass an optional string to provide a reason for the failure.

> [!NOTE]
> *Rendering events* are a requirement for visuals certification. Without them your visual won't be approved by the Partner Center for publication. For more information, see [certification requirements](power-bi-custom-visuals-certified.md#certification-requirements).

## How to use the rendering events API

To call the rendering methods, first import the `IVisualEventService` type.

1. In your `visual.ts` file, add the following import:

    ```typescript
    import IVisualEventService = powerbi.extensibility.IVisualEventService;
    ```

2. In the `IVisual` class, add a private field:

    ```typescript
    private events: IVisualEventService;
    ```

3. In the `constructor` method of the `IVisual` class, initialize the field:

    ```typescript
    this.events = options.host.eventService;
    ```

You can now call
`this.events.renderingStarted(options);`,
`this.events.renderingFinished(options);`, and
`this.events.renderingFailed(options);` where appropriate in your *update* method.

## Rendering event lifecycle

Follow these rules in every `update()` cycle:

1. Call `renderingStarted` when rendering begins.
1. Call exactly one completion method for that cycle:
   - `renderingFinished` when rendering succeeds, or
   - `renderingFailed` when rendering fails.
1. For async rendering, call `renderingFinished` only after rendering is truly complete.

> [!IMPORTANT]
> Don't let the `update()` method exit without signaling completion. After you call `renderingStarted`, you must always call either `renderingFinished` or `renderingFailed`.

## Code implementation patterns

### Synchronous update with failure handling

```typescript
public update(options: VisualUpdateOptions): void {
  this.host.eventService.renderingStarted(options);

  try {
    this.renderView(options); // visual rendering logic
    this.host.eventService.renderingFinished(options);
  } catch (error) {
    this.host.eventService.renderingFailed(options, String(error));
    throw error;
  }
}
```

### Asynchronous update with failure handling

```typescript
public async update(options: VisualUpdateOptions): Promise<void> {
  this.host.eventService.renderingStarted(options);

  try {
    await this.renderAsync(options); // visual rendering logic
    this.host.eventService.renderingFinished(options);
  } catch (error) {
    this.host.eventService.renderingFailed(options, String(error));
    throw error;
  }
}
```

### Promise chain with `.then().catch()`

```typescript
public update(options: VisualUpdateOptions): void {
  this.host.eventService.renderingStarted(options);

  this.renderAsync(options) // visual rendering logic
    .then(() => {
      this.host.eventService.renderingFinished(options);
    })
    .catch((error) => {
      this.host.eventService.renderingFailed(options, String(error));
      throw error;
    });
}
```

## Related content

* [Visual API](visual-api.md)
* [Get a Power BI visual certified](power-bi-custom-visuals-certified.md)
