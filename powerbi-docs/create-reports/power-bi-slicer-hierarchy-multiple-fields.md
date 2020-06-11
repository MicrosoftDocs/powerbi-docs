---
title: Add multiple fields to a hierarchy slicer
description: Learn how to create a hierarchy slicer that contains multiple fields in a hierarchy.
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/11/2020
ms.author: maggies

LocalizationGroup: Create reports
---
# Add multiple fields to a slicer

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

If you want to filter across multiple related fields within a single slicer, you can do so by building what's called a *hierarchy* slicer. 

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy.png" alt-text="Hierarchy slicer in Power BI":::

When you add multiple fields to the slicer, by default it displays an arrow, or *chevron* next to the items that can be expanded to show the items in the next level.

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-arrow.png" alt-text="Hierarchy slicer dropdown in Power BI":::
 
 
When you select one or more children for an item, you see a semi-selected circle for the top-level item.
 
:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-semi-selected.png" alt-text="Single-selection hierarchy slicer in Power BI":::

## Format the slicer

The behavior of the slicer hasn't changed. You can still swap between a list and dropdown. You can also style your slicer how you want. For example, you can set it to single-select mode. 

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-dropdown.png" alt-text="Hierarchy slicer formatted as dropdown slicer":::

### Change the expand/collapse icon

Hierarchy slicers have some other formatting options. You can change the expand/collapse icon from the default arrow to a plus/minus signs, or a caret.

1. Select the slicer, then select **Format**.
1. Expand **Items** and select **Expand/collapse icon**.
1. Choose from **Chevron**, **Plus/minus**, or **Caret**.
 
    :::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-caret.png" alt-text="Select an expand/collapse icon for your hierarchy slicer":::
 
### Change the indentation

If space is tight on your report, you may want to reduce the amount you indent the child items. By default, the indentation is 15 pixels, but you can increase or lower that. 

1. Select the slicer, then select **Format**.
1. Expand **Items**, then drag **Stepped layout indentation** smaller or larger. You can also just type a number in the box.

    :::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-indentation.png" alt-text="Set the hierarchy slicer indentation":::

## Next steps

- [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)