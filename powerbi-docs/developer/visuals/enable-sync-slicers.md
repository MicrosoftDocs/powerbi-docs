---
title: Enable the Sync Slicers feature in Power BI visuals
description: This article describes how to add the Sync Slicers feature to Power BI visuals so you can filter information across multiple pages in a Power BI report.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/2/2023
ms.custom: engagement-fy23
#customer intent: As a Power BI visual developer, I want to learn how to enable the Sync Slicers feature in my custom visual so that I can filter information across multiple pages in a Power BI report.
---

# Sync slicers across pages in Power BI reports

[Slicers](../../visuals/power-bi-visualization-slicers.md) are a useful way to filter information and focus on a specific portion of the semantic model. They allow you to select exactly which values to display in your Power BI visual.

Sometimes you might want to use a slicer on only one specific page of the report. Other times, you might want to apply the slicer to several pages. By using the *sync slicers* feature, a slicer selection on any page will affect visualizations on all selected pages.

For information about sync slicers and how they work, see [Sync and use slicers on other pages](../../visuals/power-bi-visualization-slicers.md#sync-and-use-slicers-on-other-pages).

## How to enable the sync slicer feature

In the [*capabilities.json* file](./visual-project-structure.md#capabilitiesjson), set `"supportsSynchronizingFilterState": true`, as shown in the following example:

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

After you've updated the *capabilities.json* file, you can view the **Sync slicers** pane when you select your custom slicer visual.

:::image type="content" source="media/enable-sync-slicers/sync-slicers-panel.png" alt-text="Screenshot of Power BI Desktop, which shows the View Sync slicers pane.":::

From the **Sync slicers** pane, you can select which report pages the slicer visibility and filtration should apply to.

For more information on how to sync slicers, see [Sync and use slicers on other pages](../../visuals/power-bi-visualization-slicers.md#sync-and-use-slicers-on-other-pages).

>[!NOTE]
>A report using the sync slicers feature must use API version 1.13.0 or later.

## Considerations and limitations

The sync slicers feature only supports one field at a time. If your slicer has more than one field (**Category** or **Measure**), the sync slicers feature is disabled.

## Related content

[Add a context menu to your Power BI visual](context-menu.md)
