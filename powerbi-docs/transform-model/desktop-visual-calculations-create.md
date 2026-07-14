---
title: Add and Edit Visual Calculations
description: Learn how to add and edit visual calculations in Power BI Desktop, and see a worked example that returns a hex color code for conditional formatting.
author: kgremban
ms.author: kgremban
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 07/14/2026
ai-usage: ai-assisted
LocalizationGroup: Model your data
#customer intent: As a report author, I want to add a visual calculation to a visual, so that I can perform business calculations without adding a measure to the semantic model.
---

# Create visual calculations

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A visual calculation is a DAX calculation that you author directly on a report visual, rather than in the underlying semantic model. Visual calculations let you perform business calculations, such as running sums or moving averages, for a single visual without adding measures or calculated columns that affect other reports.

This article shows you how to add and edit a visual calculation, and walks through an example that uses a visual calculation to drive conditional formatting. For background on how visual calculations behave and when to use them, see [Visual calculations](desktop-visual-calculations-overview.md).

## Prerequisites

- A report in Power BI Desktop or the Power BI service with a table or matrix visual that contains at least one numeric column or measure.

## Add a visual calculation

1. Select the visual that you want to add a calculation to.

1. On the **Home** tab of the ribbon, select **New visual calculation**.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-02.png" alt-text="Screenshot of selecting the new visual calculation button in the ribbon.":::

   The visual calculations window opens in **Edit** mode. The Edit mode screen has three major sections, shown from top to bottom in the following image:

   - The **visual preview** shows the visual you're working with.
   - A **formula bar** is where you enter the visual calculation expression.
   - The **visual matrix** shows the data in the visual and displays the results of visual calculations as you add them. Styling or theming that you apply to your visual isn't applied to the visual matrix.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png" alt-text="Screenshot showing areas of the visual calculations edit screen." lightbox="media/desktop-visual-calculations-overview/desktop-visual-calculations-03.png":::

1. Type the expression in the formula bar. For example, in a visual that contains **Sales Amount** and **Total Product Cost** by **Fiscal Year**, you could add a calculation that returns the profit for each year:

   ```dax
   Profit = [Sales Amount] - [Total Product Cost]
   ```

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-04.png" alt-text="Screenshot of entering a visual calculation.":::

   For each row of the visual matrix, the current `Sales Amount` and `Total Product Cost` are subtracted, and the result is returned in the `Profit` column. You don't need to add an aggregation function like [SUM](/dax/sum-function-dax); most visual calculations evaluate row-by-row like a calculated column.

1. Select **Back to report** to exit the visual calculation editor.

To create a calculation from a prebuilt template instead, select the bottom part of the **New visual calculation** button and choose a template. For the list of available templates, see [Visual calculation templates](desktop-visual-calculations-overview.md#visual-calculation-templates).

## Edit an existing visual calculation

To edit a visual calculation in Power BI Desktop, right-click the visual calculation in the field list of the **Visualizations** pane and select **Edit calculation**. The visual calculations edit screen reopens in **Edit** mode, where you can change the expression in the formula bar and see updated results in the visual matrix.

## Example: Return a hex color code for conditional formatting

Use a visual calculation to return a hex color code, and then apply the color code through conditional formatting.

1. Select the visual where you want to use conditional formatting.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-01.png" alt-text="Screenshot of a table visual with two columns Value and Progress.":::

1. On the **Home** tab, select **New visual calculation**.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-02.png" alt-text="Screenshot of the New visual calculation button on the Power BI Desktop Home tab.":::

1. Write your visual calculation. Here's an IF statement that returns either green or red based on whether a measure is greater or less than 0.5:

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-03.png" alt-text="Screenshot of DAX code listed out in the visual calculation editor.":::

   ```dax
   Conditional Hex Code = IF ( [Progress] > .5, "#5BA300", "#E91C1C" )
   ```

1. Expand the **Formatting** pane and select **Properties**.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-04.png" alt-text="Screenshot of the Formatting pane with the Properties option highlighted.":::

1. Expand the **Data Format** section, select your visual calculation, and set both the data type and format to **Text**.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-05.png" alt-text="Screenshot of the formatting pane showing you should apply a data type to your visual calculation of text.":::

1. Before you exit the visual calculation editor, select the hide icon next to the visual calculation to hide it.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-06.png" alt-text="Screenshot of the build pane showing how to select a button to hide the visual calculation you're creating.":::

1. Use the visual calculation in a conditional formatting section.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-07.png" alt-text="Screenshot of a conditional formatting window where the visual calculation is selected.":::

1. Select **Back to report** to exit the visual calculation editor.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-08.png" alt-text="Screenshot of the Back to report button in the visual calculation editor toolbar.":::

1. Your table now shows conditional formatting driven by the visual calculation.

   :::image type="content" source="media/desktop-visual-calculations-overview/desktop-visual-calculations-hex-example-09.png" alt-text="Screenshot of the table visual with Value and Progress columns, showing conditional formatting colors applied to the Progress values.":::

## Related content

- [Visual calculations in Power BI Desktop](desktop-visual-calculations-overview.md)
- [Using calculations options in Power BI Desktop](desktop-calculations-options.md)
- [Create and format table visualizations in Power BI](../visuals/power-bi-visualization-tables.md)
