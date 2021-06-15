---
title: Visual interactions in Power BI visuals
description: This article discusses how to check whether Power BI visuals should allow visual interactions.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/10/2021
---

# Visual interactions in Power BI visuals

Sometimes you want to allow the user to interact with the visual by selecting, zooming, or clicking on it. Other times you want the visual to remain static without the ability to interact with it.

Visuals can query the value of the `allowInteractions` flag, which indicates whether the visual should allow visual interactions. For example, visuals can be interactive during [report](../../create-reports/desktop-report-view.md) viewing or editing, but not interactive when they're viewed in a [dashboard](../../create-reports/service-dashboards.md). These interactions include *click*, *pan*, *zoom*, *selection*, and others.

> [!NOTE]
> You should [enable tooltips](add-tooltips.md#manage-tooltips) in all scenarios, regardless of which flag is indicated.

## Set interactive permissions

The `allowInteractions` flag is passed as a boolean value during the initialization of the visual, as a member of the `IVisualHost` interface.

For any Power BI scenario that requires that the visuals not be interactive (for example, dashboard tiles), set the `allowInteractions` flag to `false`. Otherwise (for example, Report), set `allowInteractions` to `true`.

```typescript
   ...
   let allowInteractions = options.host.allowInteractions;
   bars.on('click', function(d) {
       if (allowInteractions) {
           selectionManager.select(d.selectionId);
           ...
       }
   });
```

For more information, see the [SampleBarChart visual repository](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/59a47935d8f5272ce145fe804193599ddb7e2001).

## Next steps

>[!div class="nextstepaction"]
>[Visual API](visual-api.md)
