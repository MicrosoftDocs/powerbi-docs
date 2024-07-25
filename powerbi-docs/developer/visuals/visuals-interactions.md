---
title: Visual interactions in Power BI visuals
description: This article discusses how to check whether Power BI visuals allows users to interact with a visual.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 10/22/2023
#customer intent: As a Power BI developer, I want to learn how to check whether Power BI visuals should allow visual interactions so that I can create effective interactive visuals.
---

# Visual interactions in Power BI visuals

Sometimes you want to allow the user to interact with the visual by selecting, zooming, or clicking on it. Other times you want the visual to be static, so the user can't interact with the visual.

Visuals can query the value of the `allowInteractions` flag, which indicates if the visual allows visual interactions. For example, visuals can be interactive during [report](../../create-reports/desktop-report-view.md) viewing or editing, but visuals can be non-interactive when they're viewed in a [dashboard](../../create-reports/service-dashboards.md). These interactions include *click*, *pan*, *zoom*, *selection*, and others.

> [!NOTE]
> Best practice is to [enable tooltips](add-tooltips.md#manage-tooltips) in all scenarios, regardless of the indicated flag.

## Set interactive permissions

The `allowInteractions` flag is passed as a boolean value during the initialization of the visual as a member of the `IVisualHost` interface.

For any Power BI scenario that requires non-interactive visuals (for example, dashboard tiles), set the `allowInteractions` flag to `false`. Otherwise (for example, Report), set `allowInteractions` to `true`.

The following code sample shows how to use the `allowInteractions` flag to set interactive permissions.

```typescript
   ...
   let allowInteractions = options.host.hostCapabilities.allowInteractions;
   bars.on('click', function(d) {
       if (allowInteractions) {
           selectionManager.select(d.selectionId);
           ...
       }
   });
```

For more information about using the `allowInteractions` flag, see the [SampleBarChart visual repository](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/59a47935d8f5272ce145fe804193599ddb7e2001).

## Related content

[Visual API](visual-api.md)
