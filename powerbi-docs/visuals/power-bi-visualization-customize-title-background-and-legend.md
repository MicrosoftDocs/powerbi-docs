---
title: Customize Power BI Visualization Titles
description: "Learn how to customize Power BI visualization titles, backgrounds, labels, and legends. Follow step-by-step instructions to format your reports. Start customizing today."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: DataZoeMS
featuredvideoid: removed
ms.custom: pbibetadocbug, intro-get-started, sample-retailanalysissample
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 04/12/2026
ai-usage: ai-assisted
LocalizationGroup: Visualizations
---

# Customize Power BI visualization titles

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Learn how to customize Power BI visualization titles, backgrounds, labels, and legends to create professional, branded reports. This tutorial walks you through formatting options in the Format pane, showing you how to customize titles, legends, backgrounds, labels, layers, and themes to enhance your visualizations.

You can't customize all visualizations. See the [complete list](#visualization-types-that-you-can-customize) of visualizations for details.

## Prerequisites

- The Power BI service or Power BI Desktop
- Retail Analysis Sample report

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have individual Power BI Pro licenses or that the report is saved in Premium capacity. See [sharing reports](../collaborate-share/service-share-reports.md).

## Customize visualization titles in reports

To follow along, sign into Power BI Desktop and open the [Retail Analysis Sample](../create-reports/sample-datasets.md) report. To follow along in the Power BI service, open the report and select **Edit**.

> [!NOTE]
> When you pin a visualization to a dashboard, it becomes a dashboard tile. You can also customize the tiles themselves with [new titles and subtitles, hyperlinks, and resizing](../create-reports/service-dashboard-edit-tile.md).

1. Go to the **New Stores** page of the **Retail Analysis Sample** report.
1. Select the **Open Store Count by Open Month and Chain** clustered column chart.
1. In the **Visualizations** pane, select the paint brush icon, then **General** to reveal the format options.
1. Select **Title** to expand that section.

   :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-format-menu.png" alt-text="Screenshot of the Format pane with the paint brush icon and the Title drop-down called out.":::

1. To change the title, enter *Store count by month opened* in the **Text** field.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-title.png" alt-text="Screenshot of the Format pane with the Title text entered.":::

1. Change **Text color** to white and **Background color** to blue.

    a. Select the drop-down and choose a color from **Theme colors**, **Recent colors**, or **More colors**.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-color.png" alt-text="Screenshot of the Font color and Background color options.":::

    b. Select the drop-down to close the color window.

1. Increase the text size to **16 pt**.
1. The final chart title customization is aligning the title to the center of the visualization.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-align.png" alt-text="Screenshot of the Alignment controls with the Center option selected.":::

   At this point in the tutorial, the clustered column chart title looks something like this:

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-table.png" alt-text="Screenshot of the newly configured clustered column chart.":::

Save the changes, and continue to the next section.

If you ever need to revert all of the changes, select **Reset to default**, at the bottom of the **Title** customization pane.

:::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-revert.png" alt-text="Screenshot of the Reset to default option.":::

## Customize visualization backgrounds

With the same clustered column chart selected, expand the **Effects** > **Background** options.

1. Toggle the **Background** switch to **On**.
1. Select the drop-down and choose a grey color.
1. Change **Transparency** to **74%**.

At this point in the tutorial, the clustered column chart background looks something like this:

:::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-background.png" alt-text="Screenshot of the clustered column chart with background color updated.":::

Save the changes, and continue to the next section.

If you ever need to revert all of the changes, select **Reset to default**, at the bottom of the **Background** customization pane.

## Customize visualization legends

1. Open the **Overview** report page and select the **Total Sales Variance by FiscalMonth and District Manager** chart.
1. In the **Visualization** tab, select the paint brush icon to open the Format pane.
1. Expand the **Legend** options. The toggles for **Legend** and **Title** are both **On** by default.
1. Use the **Position** field to move the legend to the left side of the visualization.

   :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-legends.png" alt-text="Screenshot of the Legend card.":::

1. Enter *Manager* in the **Title text** field.
1. Change **Color** to black.

Save the changes, and continue to the next section.

If you ever need to revert all of the changes, select **Reset to default**, at the bottom of the **Legend** customization pane.

## Customize total labels for stacked visuals

Stacked visuals can display data labels and total labels. On a stacked column chart, data labels identify the value for each portion of a column. Total labels display the total value for the entire aggregated column.

Data labels don't display on some visuals, depending on their size. If data labels don't display, make the visual larger or view it in full-screen mode.

The steps described here show how to add total labels to a stacked chart and apply the technique.

1. Open the **District Monthly Sales** report page and select the **Last Year Sales and This Year Sales by FiscalMonth** area chart.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-area-chart.png" alt-text="Screenshot of the 'Last Year Sales and This Year Sales by FiscalMonth' area chart.":::

1. In the **Visualization** tab, select :::image type="icon" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-stacked-bar.png" border="false"::: to convert this area chart to a stacked bar chart.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-stacked-chart.png" alt-text="Screenshot of the new stacked bar chart.":::

1. In the **Visualization** tab, select the Format visual icon to open the Format controls.
1. Toggle **On** the **Data labels** switch.
1. Toggle **On** the **Total labels** switch.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-totals.png" alt-text="Screenshot showing Total labels switch and Data labels switch set to On.":::

1. Optionally, we can format the Total labels. This example uses black text, a bold font style, a larger font size, and values displayed as millions with one decimal place.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-bar-totals.png" alt-text="Screenshot of the new stacked bar chart with total labels.":::

## Customize layer order

Change the layering order of visuals and shapes in your reports. Layer order determines which objects appear in front when selected. When you select an object on the report canvas, that object becomes active and moves to the top layer. This behavior makes visuals easier to interact with. Place shapes and backgrounds on the bottom layer to avoid selecting them by accident.

Layering controls are available in the Power BI service, Power BI Desktop, mobile, and Report server. This article shows you how to change layer order behavior in the Power BI Service.

The steps described here show how to change the layering order of visuals and shapes in a report.

1. Add a new report page by selecting the **+** icon on the page tabs menu.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-new-page.png" alt-text="Screenshot of the New page '+' icon highlighted.":::

1. From the **Insert** ribbon, select **Shapes**, and add a rectangle shape to the canvas. In this example, the canvas displays a blue rectangle.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-shape.png" alt-text="Screenshot of the new report page with a blue rectangle shape.":::

1. Select and copy the "This Year Sales by Chain" visual from the **Overview** tab. Return to the new **Page 1** we created, select the blue rectangle, and from the **Home** ribbon, select **Paste** to place the copied visual in front of the blue rectangle.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-layer.png" alt-text="Screenshot of the new report page with a blue rectangle and a pie chart in front of the rectangle.":::

    Now that you have two layers, try selecting the pie chart and then the background.

    - When you select the pie chart, Power BI makes that object active and displays its header menu. 
    - When you select the rectangle, Power BI makes that object active and brings it to the front where it obscures the pie chart.

    You can change this default behavior with the following steps.

1. Select the pie chart and open the Visualizations pane. Select **Format visual** and then, from the **General** tab, select **Properties** > **Advanced options** and switch **On** the **Maintain layer order** toggle.

   :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-maintain-layer.png" alt-text="Screenshot of the new report page showing the Maintain layer order toggle.":::

1. From the **View** ribbon, open the **Selection** pane. The **Layer order** tab in the Selection pane lets you view and set the layer order.

   :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-view-menu.png" alt-text="Screenshot showing the View menu with the Selection Pane option toggled to On.":::

1. Select the pie chart, hold down the CTRL key, and select the rectangle. Then, from the **Format** ribbon, open the **Group** control, and select **Group**. This action allows us to group both items together.

   :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-group-layer.png" alt-text="Screenshot showing the visual and shape selected, Group control selected from the Format ribbon and the Group option selected.":::

1. Expand the **Selection** pane. The **Layer order** should look like this:

   :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-layer-order.png" alt-text="Screenshot showing the Layer order tab in the Selection pane.":::

1. Save the report changes and switch to **Reading view**.

Now that the visual and the shape are grouped, you can select the shape and it remains in the background. If you leave the Selection pane open, you can see which layer has focus. Notice, that by selecting the canvas in between selecting layers, it activates the Group layer and maintains the layer order. For more information on this behavior, see [Selecting visuals within a group](../create-reports/desktop-grouping-visuals.md#select-visuals-within-a-group).

## Customize colors using a theme

You can apply design changes to your entire report by using report themes. For example, change the color scheme to use corporate colors, change icon sets, or apply new default visual formatting. When you apply a report theme, all visuals in your report use the colors and formatting from your selected theme.

To apply a theme to your report, select the **View** menu and open the **Themes** dropdown. Choose a theme. The report shown here uses the **Solar** theme.

    :::image type="content" source="media/power-bi-visualization-customize-title-background-and-legend/power-bi-theme.png" alt-text="Screenshot of report using Solar theme of yellows, oranges, and reds.":::

## Visualization types that you can customize

Here's a list of the customization options that are available for each visualization type:

| Visualization | Title | Background | Legend | Data labels | Totals / Subtotals |
|:--- |:--- |:--- |:--- |:--- |:--- |
| Area | Yes | Yes | Yes | Yes | Conditional |
| Bar | Yes | Yes | Yes | Yes | Conditional |
| Column | Yes | Yes | Yes | Yes | Conditional |
| Line | Yes | Yes | Yes | Yes | No |
| Combo | Yes | Yes | Yes | Yes | Conditional |
| Scatter | Yes | Yes | Yes | Yes | No |
| Pie | Yes | Yes | Yes | Yes | No |
| Donut | Yes | Yes | Yes | Yes | No |
| Treemap | Yes | Yes | Yes | Yes | No |
| Waterfall | Yes | Yes | Yes | Yes | Conditional |
| Funnel | Yes | Yes | No | Yes | No |
| Map | Yes | Yes | Yes | Conditional | No |
| Map: Azure Maps | Yes | Yes | Yes | Conditional | No |
| Filled map | Yes | Yes | Yes | Conditional | No |
| Table | Yes | Yes | No | No | Yes |
| Matrix | Yes | Yes | No | No | Yes |
| Card | Yes | Yes | No | Value only | No |
| Multi-row Card | Yes | Yes | No | Value only | No |
| KPI | Yes | Yes | No | Value only | No |
| Gauge | Yes | Yes | No | Value only | No |
| Key Influencer | Yes | Yes | No | Automatic | No |
| Q&A | Yes | Yes | No | Automatic | No |
| Slicer | Yes | Yes | No | No | No |
| Shape | No | Yes | No | No | No |
| Textbox | No | Yes | No | No | No |

## Related content

- [Customize X-Axis and Y-Axis properties](power-bi-visualization-customize-x-axis-and-y-axis.md)
- [Getting started with color formatting and axis properties](service-getting-started-with-color-formatting-and-axis-properties.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
