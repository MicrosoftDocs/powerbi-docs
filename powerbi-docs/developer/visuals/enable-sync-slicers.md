---
title: Enable the Sync Slicers feature in Power BI visuals
description: This article describes how to add the Sync Slicers feature to Power BI visuals.
author: KesemSharabi
ms.author: kesharab
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Sync slicers in Power BI visuals

To support the [Sync Slicers](https://docs.microsoft.com/power-bi/desktop-slicers) feature, your custom slicer visual must use API version 1.13 or later.

Additionally, you need to enable the option in the *capabilities.json* file, as shown in the following code:

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

After you've updated the *capabilities.json* file, you can view the **Sync slicers** options pane when you select your custom slicer visual.

> [!NOTE]
> The Sync Slicers feature doesn't support more than one field. If your slicer has more than one field (**Category** or **Measure**), the feature is disabled.

![The "Sync slicers" pane](./media/sync-slicers-panel.png)

In the **Sync slicers** pane, you can see that your slicer visibility and its filtration can be applied to several report pages.
