---
title: Use Drill Mode to Explore Visuals in Power BI Service
description: Learn how to use drill mode in the Power BI service to drill down, drill up, and expand visuals built on a hierarchy. Start exploring today.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.topic: how-to
ms.date: 06/18/2026
ai-usage: ai-assisted
LocalizationGroup: Reports
# customerintent: As a Power BI business user viewing a shared report, I want to understand the drill icons on a visual so I can explore data at different levels of detail without needing creator-level knowledge.
---

# Use drill mode to explore visuals in the Power BI service

[!INCLUDE [consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

*Drill mode* lets you explore a visual at different levels of detail. For example, you can move from yearly totals down to quarters or months without leaving the report. Drill works on visuals built from a *hierarchy* - data organized into nested levels, such as Year > Quarter > Month or Category > Subcategory > Product.

By using drill mode, you can answer your own follow-up questions about a chart - such as "What's behind that spike?" - instead of asking the report author for a new view.

This article shows you how to recognize the drill icons on a visual and use them to explore data.

## Check whether a visual has a hierarchy

Drill icons appear in the header or footer of a visual when that visual uses a hierarchy. If you don't see the icons right away, hover over the visual to reveal the action bar. If no drill icons appear even after you hover, one of the following conditions is true:

- The visual doesn't use a hierarchy.
- The visual uses a hierarchy, but the report designer didn't turn on drill.

The icons might appear at the top of the visual or at the bottom, depending on the available space.

## Drill icons on a Power BI visual

When a visual supports drill, you see up to four icons together.

Each icon does something different:

- **Drill up**: Goes back up to a higher level in the hierarchy. This icon appears dimmed until you drill down at least once.
- **Click to turn on drill down**: Turns on drill mode so you can select a single data point to drill into. Select the icon again to turn drill mode off.
- **Go to the next level in the hierarchy**: Moves the entire visual down one level. You don't need to pick a specific data point.
- **Expand all down one level in the hierarchy**: Adds the next level of detail while keeping the current level visible for context.

## Drill down on one data point in a Power BI visual

Use drill down when you want to focus on a single category, such as one quarter or one product line. Drill down moves only the selected data point to the next level of the hierarchy.

1. Select the **Click to turn on drill down** icon. A message confirms that drill mode is on.
1. Select the data point you want to explore. For example, select the column for **Qtr 1**.
1. The visual updates to show the next level of the hierarchy for that data point only. For example, the visual now shows **January**, **February**, and **March** for **Qtr 1**. The visual title also updates to show your current level.
1. To go back to the previous level, select **Drill up**.

When you're finished drilling, select the **Click to turn on drill down** icon again to turn drill mode off.

> [!NOTE]
> If drill mode is turned off and you select a data point, you cross-filter the other visuals on the page instead of drilling. For more information, see [How visuals cross-filter each other in a Power BI report](end-user-interactions.md).

## Go to the next level for all data points in a Power BI visual

Use **Go to the next level in the hierarchy** to see the next level of detail across the whole visual at once. This option moves every data point down one level instead of just the one you select.

1. Select **Go to the next level in the hierarchy**.
1. The visual replaces the current level with the next level for *all* data points. For example, the visual now shows every month across every quarter, instead of the quarters themselves.
1. To return to the previous level, select **Drill up**.

## Expand a Power BI visual to keep context while adding detail

*Expand* and *go to next level* sound similar, but they show different results. *Go to next level* replaces the current view with the next level down. *Expand* keeps the current view and adds the next level underneath each category. Use expand to compare detail without losing the higher-level grouping.

1. Select **Expand all down one level in the hierarchy**.
1. The visual keeps the current grouping and adds the next level of detail under each top-level category. For example, you see each quarter *and* the months inside each quarter.
1. To go back, select **Drill up**.

To expand only one data point instead of all of them, make sure drill mode is turned off, select the data point you want to focus on, and then select **Expand all down one level in the hierarchy**. The visual shows the next level of detail, with your selected data point emphasized.

## Drill on a Power BI visual by using the right-click menu

You can also drill from the right-click menu on most Power BI visuals. On a touch device, press and hold a data point instead of right-clicking.

Right-click a data point to open the menu, and then select **Drill down**, **Drill up**, **Show next level**, or **Expand to next level**. These commands behave like the drill icons in the visual header.

## Drill versus drillthrough in Power BI

Drill and drillthrough sound alike, but they're different Power BI features.

- **Drill** explores levels of a hierarchy *within the same visual*. The report page and the other visuals don't change.
- **Drillthrough** takes you to a *different report page* filtered to your selection. For more information about drillthrough buttons, see [Identify and use buttons in the Power BI service](end-user-buttons.md).

## Drill mode considerations in Power BI

- By default, drilling one visual doesn't filter the other visuals on the report page. The report designer can change this behavior so that drilling filters the other visuals. For more information, see [How visuals cross-filter each other in a Power BI report](end-user-interactions.md).
- Drill mode and the drill icons are available only when the report designer turns on drill for a visual that uses a hierarchy.
- The **Drill up** icon dims until you drill down at least one level.

## Related content

- [How visuals cross-filter each other in a Power BI report](end-user-interactions.md)
- [Show the data that's used to create a visual](end-user-show-data.md)
- [Identify and use buttons in the Power BI service](end-user-buttons.md)
- [Work with visuals in a Power BI report](end-user-visualizations.md)
- [Interact with reports in Reading view](end-user-reading-view.md)
