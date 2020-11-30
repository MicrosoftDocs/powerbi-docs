---
title: Visual interactions in Power BI visuals
description: This article discusses how to check whether Power BI visuals should allow visual interactions.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/18/2019
---

# Visual interactions in Power BI visuals

Visuals can query the value of the `allowInteractions` flag, which indicates whether the visual should allow visual interactions. For example, visuals are interactive during report viewing or editing, but not interactive when they're viewed in a dashboard. These interactions are *click*, *pan*, *zoom*, *selection*, and others. 

> [!NOTE]
> You should enable tooltips in all scenarios, regardless of which flag is indicated.

The `allowInteractions` flag is passed as a Boolean during the initialization of the visual, as a member of the IVisualHost interface.

In any Power BI scenario that requires that the visuals not be interactive (for example, dashboard tiles), the `allowInteractions` flag is set to `false`. Otherwise (for example, Report), `allowInteractions` is set to `true`.

For more information, see the [SampleBarChart visual repository](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/59a47935d8f5272ce145fe804193599ddb7e2001).

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
