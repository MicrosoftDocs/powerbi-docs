---
title: The Filter applied API in Power BI custom visuals
description: This article describes the API parameter that indicates whether or not a filter is applied to a visual.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/06/2024
#customer intent: As a Power BI visual developer, I want to learn how to detect if a filter is applied to a visual so that I can adjust the display accordingly.
---

# Detect filter state

> [!NOTE]
> This feature is available from API version 5.4

The `isDataFilterApplied` boolean parameter in the `DataViewMetadata` object notes if the rendered visual or report has any filters applied to it. The developer can then adjust the display accordingly (for example, by adding or removing text depending on if there's a filter). This feature applies whether the filter is applied to the entire report, page, or specific visual.

To use the `isDataFilterApplied` parameter:

```typescript
public update(options: VisualUpdateOptions) {
    const dataView = options?.dataViews[0]; 
    if (dataView && dataView?.metadata?.isDataFilterApplied) {
        ...
 }
}
```

## Related content

[Use Power BI visuals selections to add interactivity to a visual](selection-api.md)
