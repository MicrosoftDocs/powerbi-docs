---
title: Custom totals
description: Custom totals
author: julcsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-corevisuals
ms.topic: include
ms.date: 04/22/2026
ms.custom: include file - variant
LocalizationGroup: core-visuals
---

With custom totals in Power BI tables and matrices, you can easily determine what the total row shows for a specific column if needed.

By default the total row shows the result of evaluating the field across the entire filter context of the report page. This behavior is correct in most cases. However, in some specific scenarios you might want to change what the total row displays. You can use DAX to influence what the total row displays, but custom totals provide an easy way of changing the total row value to the sum, min, max, count (distinct) or count of the displayed rows.

#### Working with custom totals

Custom totals are based on [visual calculations](../../transform-model/desktop-visual-calculations-overview.md), so make sure that preview is enabled.

After that, you can right-click on a numerical column in the visual or use the Build pane and choose **Customize total calculation**:

:::image type="content" source="media/custom-totals/custom-total-context-menu.png" alt-text="Screenshot of context menu for custom total calculations." lightbox="media/custom-totals/custom-total-context-menu.png":::

Then, choose the total calculation to apply. These options are available:

| Custom total option | The total row shows |
|---|---|
|Sum|The sum of the displayed row values|
|Min|The minimum value in the displayed rows|
|Max|The maximum value in the displayed rows|
|Count (Distinct)|The number of unique values in the displayed rows|
|Count|The number of values in the displayed rows|
|Reset to default|Default value (option only enabled if a custom total is set)|

#### How custom totals work

Custom totals are based on [visual calculations](../../transform-model/desktop-visual-calculations-overview.md). As soon as you select any of the above options, the following happens:

- The original column's name gets a *_Base* suffix. So if your column is named *Number of Customers*, the column is now named *Number of Customers_Base*.
- The original column is hidden.
- A new visual calculation with the original column name is added. The visual calculation is equal to:

```dax
EXPANDALL ( <aggregation> ( [Original column_Base] ), ROWS COLUMNS )
```

For example, if you add a sum custom total for the Number of Customers column, the new visual calculation is:

```dax
Number of Customers = EXPANDALL ( SUM ( [Number of Customers_Base] ), ROWS COLUMNS )
```

- An Excel-like indicator appears in the total cell for the column on which the custom total was set.

The result shown in visual calculations edit mode is:

:::image type="content" source="media/custom-totals/custom-total-result-vcem.png" alt-text="Screenshot of visual calculations edit mode with a custom total." lightbox="media/custom-totals/custom-total-result-vcem.png":::

> [!NOTE]
> You can edit a custom total just [like another visual calculation](../../transform-model/desktop-visual-calculations-overview.md#adding-a-visual-calculation) by right-clicking on the custom total in the build pane and choosing 'Edit calculation':

#### Reset to default

Once a custom total is set, you can use the **Reset to default** option to get back to Power BI's default behavior. Reset to default removes the custom total and reverts the changes made:

- the custom total visual calculation is removed
- the original column is made visible again
- the original column name is reset

#### Considerations and limitations

- Custom totals aren't available in [Explore](../../consumer/explore-data-service.md).
- Custom totals are only available on the table and matrix visual.
- Custom totals are only available for numerical columns.
- Field formatting doesn't transfer to a custom total. You need to format a custom total like you [format a visual calculation](../../transform-model/desktop-visual-calculations-overview.md#formatting-visual-calculations).
- The same [considerations and limitations of visual calculations](../../transform-model/desktop-visual-calculations-overview.md#considerations-and-limitations) apply to custom totals.
