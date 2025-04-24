---
title: Add multiple fields to a hierarchy slicer
description: Learn how to create a hierarchy slicer that contains multiple fields in a hierarchy.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/12/2023
ms.custom: pbibetadocbug
LocalizationGroup: Create reports
---
# Add multiple fields to a hierarchy slicer

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

If you want to filter multiple related fields in a single slicer, you do so by building what's called a *hierarchy* slicer. You can create these slicers in either Power BI Desktop or in the Power BI service.

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-desktop-slicer-hierarchy.png" alt-text="Screenshot of Hierarchy slicer in Power B I Desktop.":::

When you add multiple fields to the slicer, by default it displays an arrow, or *chevron* next to the items that can be expanded to show the items in the next level.

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-arrow.png" alt-text="Screenshot of Hierarchy slicer dropdown in Power B I.":::

When you select one or more children for an item, you see a semi-selected square for the top-level item.

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-semi-selected.png" alt-text="Screenshot of Single-selection hierarchy slicer in Power B I.":::

## Format the slicer

The behavior of the slicer hasn't changed. You can also style your slicer how you want. For example, in the **Format** pane, on the **Visual** tab > **Slicer settings** > **Options** **Style**, you can swap between a **Vertical list** or a **Dropdown**.

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-slicer-hierarchy-dropdown.png" alt-text="Screenshot of the Format pane, Dropdown or Vertical list slicer.":::
you can set it to single-select mode.

You can also make other formatting changes for hierarchy slicers:

- Change the [title](#change-the-title).
- Change the [expand/collapse icon](#change-the-expandcollapse-icon).
- Change the [indentation](#change-the-indentation).

### Change the title

You can edit the title for any slicer, but it's especially useful for hierarchy slicers. By default, the name of a hierarchy slicer is a list of the field names in the hierarchy.

In this example, the title of the slicer lists the three fields in the hierarchy: Category, Commodity, and Item.

:::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-desktop-slicer-title.png" alt-text="Screenshot of hierarchy slicer with Category, Commodity, and Item fields in Power B I Desktop.":::

To change the slicer title:

1. Select the slicer, the **Format** pane, and then the **Visual** tab.

1. Expand **Slicer header** to see the current name of the slicer in the **Title text** box.

   :::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-desktop-slicer-edit-title.png" alt-text="Screenshot of the Format pane with the current title in Power B I Desktop.":::

1. Select the **Title text** box and enter a new name.

   :::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-desktop-slicer-new-title.png" alt-text="Screenshot of new title for hierarchy slicer in Power B I Desktop.":::

### Change the expand/collapse icon

Hierarchy slicers have some other formatting options. You can change the expand/collapse icon from the default arrow to plus and minus signs, or a caret:

1. Select the hierarchy slicer, then select **Format**.
1. From the **Visual** tab, expand **Hierarchy**, and then expand **Expand/collapse**.
1. For **Expand/collapse icon**, select **Chevron**, **Plus/minus**, or **Caret**.

    :::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-desktop-slicer-hierarchy-caret.png" alt-text="Screenshot of Select an expand/collapse icon for your hierarchy slicer in Power B I Desktop.":::

### Change the indentation

If space is tight on your report, you may want to reduce the amount you indent the child items. By default, the indentation is 15 pixels. To change the indentation:

1. Select the slicer, then select **Format**.
1. From the **Visual** tab, expand **Hierarchy**, and then expand **Levels**. Drag **Stepped layout indentation** smaller or larger. You can also enter a number in the box.

    :::image type="content" source="media/power-bi-slicer-hierarchy-multiple-fields/power-bi-desktop-slicer-indentation.png" alt-text="Screenshot of Set the hierarchy slicer indentation in Power B I Desktop.":::

## Considerations and limitations

- When using live connection to SQL Server Analysis Services (SSAS) tabular models and the property **hide members** in the hierarchy is set to **Hide blank members**, Power BI doesn't hide blank members.  This creates a ragged hierarchy.    
- A ragged hierarchy is also created when there are blank values for a category at any hierarchy level. For example, if Employee A has three levels of management (manager > vice-president > CEO) but doesn't have a "director", the data table row for Employee A will have three values (names) and one blank. While you can use the Filters pane to deselect blank values for "director", doing so also prevents the other three values from being included in the slicer for Employee A. As a result, Employee A will be removed from the hierarchy slicer.    
- For tabular models, this feature requires SQL Server Analysis Services 2017 or newer.    
- For multi-dimensional models, this feature requires SQL Server Analysis Services 2019 CU5 or newer with SuperDAXMD enabled. Read more about [SuperDAXMD](/analysis-services/multidimensional-models/dax-for-multidimensional-models#superdaxmd).

## Related content

- [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
