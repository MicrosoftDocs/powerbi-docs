---
title: Enable Sync Slicers
description: How to add sync slicers feature for Power BI Visuals
author: EugeneElkin
ms.author: v-evelk
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Sync Slicers

To support [Sync Slicers](https://docs.microsoft.com/power-bi/desktop-slicers), your custom slicer visual must use API 1.13 or higher.

The second necessary aspect is enabled option in `capabilities.json` (see a sample below).

```json
{
    ...
    "supportsHighlight": true,
    "suppressDefaultTitle": true,
    "supportsSynchronizingFilterState": true,
    "sorting": {
        "default": {}
    }
}
```

After changes in `capabilities.json`, you can see Sync Slicers options panel when you click on your custom slicer visual.

> [!NOTE]
> If your slicer has more than 1 field (category or measure) the feature will be disabled because Sync Slicers don't support several fields.

![Sync slicers panel](./media/sync-slicers-panel.png)

In the panel, you can see that your slicer visibility and its filtration may be applied for several report pages.
