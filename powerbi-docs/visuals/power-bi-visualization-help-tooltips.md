---
title: Add Help tooltips to visuals in Power BI
description: Use Help tooltips to add quick guidance to a visual through a Help icon in the visual header. Choose typed text help or a report page for richer content.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/24/2026
LocalizationGroup: Visualizations
ai-usage: ai-assisted
---
# Add Help tooltips to visuals in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Help tooltips add quick guidance to a visual through a small **Help tooltip** icon in the visual header. Consumers select the icon to view either short text or a report page that explains the visual or describes how to interact with it.

For an introduction to all tooltip types, see [Tooltips overview](power-bi-visualization-tooltips-overview.md).

## Enable a Help tooltip

1. Select a visual on the report canvas.
1. In the **Format visual** pane, go to **General** > **Header icons**.
1. Expand **Icons**, and then turn on **Help tooltip**.
1. Choose your content type:
   - **Typed text help** for short explanations.
   - **Report page help** for richer content with visuals, KPIs, or images. For steps to build the page, see [Create report page tooltips in Power BI](../create-reports/desktop-tooltips.md).

> [!NOTE]
> The **Help tooltip** icon appears only when **Header icons** are turned on and the visual header is visible.

> [!TIP]
> You can add an animated GIF as the background of a report page Help tooltip to demonstrate interactions like drilling.

## Considerations and limitations

- Help icon visibility depends on visual header settings.
- Typed text help doesn't respond to slicers or filters.
- Report page help can respond to filters you design into the page.
- Theme colors apply to the Help tooltip frame.
- If the Help tooltip shows the wrong content, confirm the selected type (text or report page). For report pages, also check that **Allow use as tooltip** is turned on.

## Related content

- [Tooltips overview](power-bi-visualization-tooltips-overview.md)
- [Visual tooltips in Power BI](power-bi-visualization-visual-tooltips.md)
- [Create report page tooltips in Power BI](../create-reports/desktop-tooltips.md)
