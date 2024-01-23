---
title: Drill mode in the Power BI service
description: Learn how to drill down, drill up, and expand by using the drill feature in a visual in the Microsoft Power BI service.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 12/24/2023
LocalizationGroup: Visualizations
---
# Drill mode in the Power BI service

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

This article shows you how to use the *drill mode* in the Microsoft Power BI service. You can explore in-depth details about your data by using the drill-down, drill-up, and expand features on your visual. To learn how to create a hierarchy, read [hierarchies in Power BI](../create-reports/desktop-inline-hierarchy-labels.md)

## Drill mode requirements

To use the drill mode, the Power BI visual must have an explicit or implicit hierarchy. Report designers often add explicit date hierarchies to reports. Those hierarchies are marked with the hierarchy icon. A common date hierarchy is one that contains fields for the year, quarter, month, and day. A report might have implicit hierarchies too. These informal hierarchies don't have the icon. But the relationship, and therefore a drill path, exists. For example, you might have a visual that shows the number of medals won in a sports competition. The drill path in this example is the sport, which has specific unique types of the sport, and the events. By default, the visual shows the medal count by sport, like gymnastics, skiing, and aquatics. Then, you can select one of the visual elements, like a bar, line, or bubble, to display the individual sports. For example, selecting the aquatics element shows you data for swimming, diving, and water polo. Then, selecting the diving element opens the next level in the hierarchy and shows you details for springboard, platform, and synchronized diving events. 

You can tell if a visual has a hierarchy by hovering over it. If the drill control options appear in the action bar, your visual has a hierarchy.

:::image type="icon" source="./media/end-user-drill/power-bi-drill-icons.png":::

## Drill down and up

The following example is a bar chart that has a hierarchy made up of category, manufacturer, segment, and product. The bar chart shows the total number of units sold in the year 2014 by category. Category is the top level of the hierarchy. The chart is filtered by the categories Rural and Urban.

:::image type="content" source="./media/end-user-drill/power-bi-filter.png" alt-text="Screenshot of the bar chart. The filters are outlined.":::

## Ways to access the drill features

There are two ways to access the drill-down, drill-up, and expand features for visuals.

One way is to hover over a visual to use the icons in the action bar. Turn on the drill-down option by selecting the single downward arrow. The grey background indicates that the drill-down option is turned on.

:::image type="content" source="./media/end-user-drill/power-bi-drill-hover.png" alt-text="Screenshot of the drill options in the action bar.":::

Another way to access the drill features is by right-clicking a data point on the visual to open a menu with available options.

:::image type="content" source="./media/end-user-drill/power-bi-drill-action-menu.png" alt-text="Screenshot of the right-click menu from a data point.":::

## Drill down all fields at once

There are many ways to drill into your visual. Selecting the double arrow drill-down icon :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon3.png"::: takes you to the next level in the hierarchy. For example, if you're at the category level, you can drill down to the manufacturer level, then the segment level, and, finally, the product level for all categories. Each step in the path shows you new information.

:::image type="content" source="./media/end-user-drill/power-bi-drill-path.png" alt-text="Diagram showing the steps of the drill pathway." lightbox="./media/end-user-drill/power-bi-drill-path.png#lightbox":::

To go up a level in the hierarchy, select the drill-up icon. :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon5.png":::

## Drill down one field at a time

The double arrow drill-down icon drills down all fields on the canvas at once. This example shows how to drill down one field at a time.

1. From the category level, where the chart shows Rural and Urban, select the drill-down icon :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon2.png"::: to turn it on.

    Now you have the option of drilling down **one field at a time** by selecting a visual element, like a bar, bubble, or leaf.

    :::image type="content" source="media/end-user-drill/power-bi-select-drill-icon.png" alt-text="Screenshot of visual with the drill-down on/off icon turned on.":::

    > [!NOTE]
    > If you don't turn on the drill-down option and you select a visual element, it cross-filters the other charts on the report page rather than drilling down.

2. Select the bar for Rural. The bar chart now shows all the Rural manufacturers.

    :::image type="content" source="media/end-user-drill/power-bi-drill-down-first.png" alt-text="Screenshot of the bar chart showing the Rural manufacturers.":::

3. At this point, you can:

    - Continue drilling down for Rural.

    - Drill down for a particular Rural manufacturer.

    - Expand.

    Continue to drill down one field at a time by selecting **Natura**. The bar chart now shows the segments for the Natura manufacturer in the Rural category.

    :::image type="content" source="media/end-user-drill/power-bi-drill-twice.png" alt-text="Screenshot of the bar chart showing the Productivity and Select segments.":::

    Notice that the title changes to show which level you are on as you drill down and back up again.

4. Drill down to the products by selecting the **Productivity** bar. Now you are at the product level.

    :::image type="content" source="media/end-user-drill/power-bi-drill-last.png" alt-text="Screenshot of the bar chart showing products of the Productivity segment." lightbox="media/end-user-drill/power-bi-drill-last.png#lightbox":::

## Expand fields

:::image type="icon" source="./media/end-user-drill/power-bi-drill-icon6.png":::

The **Expand** option adds another hierarchy level to the current view. If you're at the category level, which shows Rural and Urban, you can expand all current bars at the same time. The first time you expand, the manufacturer is added for both Rural and Urban. Expand again and, in addition to the manufacturer, segment data is added for both Rural and Urban. Each step in the path shows the previous information and adds on one level of new information.

:::image type="content" source="./media/end-user-drill/power-bi-expand-path.png" alt-text="Diagram showing the steps of the expand pathway." lightbox="./media/end-user-drill/power-bi-expand-path.png#lightbox":::

## Expand all fields at once

The following example shows how to use this feature to expand all fields at one time.

1. From the previous step, select the drill-up arrow until you reach the second level, **Total Units by Category and Manufacturer**.

    :::image type="content" source="media/end-user-drill/power-bi-expand-second.png" alt-text="Screenshot of the bar chart showing all data for Rural.":::

2. Confirm that the drill-down option :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon2.png"::: is still turned on and select the expand down icon. :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon6.png"::: The bar chart shows more detail. It now shows category, manufacturer, and segment.

    :::image type="content" source="./media/end-user-drill/power-bi-expand-third.png" alt-text="Screenshot of the visual showing category, manufacturer, and segment.":::

3. Select the expand down icon :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon6.png"::: one more time to display all four hierarchy levels of detail for Rural. To see more detail, hover over a bar.

    :::image type="content" source="./media/end-user-drill/power-bi-expand-final.png" alt-text="Screenshot of the bar chart showing a tooltip with bar specific data." lightbox="./media/end-user-drill/power-bi-expand-final.png#lightbox":::

## Expand one field at a time

To get detailed data for one field, you can expand down one level in the hierarchy.

1. From the previous step, select the drill-up icon until you reach the category level.
2. With the drill-down icon turned off, select the Rural bar, and then select the expand down icon. :::image type="icon" source="./media/end-user-drill/power-bi-drill-icon6.png":::

    :::image type="content" source="./media/end-user-drill/power-bi-expand-one.png" alt-text="Screenshot showing the Rural bar selected.":::
    On the next level, the data for the field you selected is emphasized.

    :::image type="content" source="./media/end-user-drill/power-bi-expand-one-field.png" alt-text="Screenshot showing the Category and Manufacturer level. The Rural data is emphasized.":::

When you drill down, you only go to the next level of the hierarchy. When you expand, you go to the next level of the hierarchy while also preserving the data of the level you're on.

## Show the data in a table as you drill

Use **Show as a table** to get a look behind the scenes. Each time you drill or expand, **Show as a table** displays the data used to build the visual. This feature makes it easier to see how hierarchies, drill, and expand work together to build visuals.

1. In the upper right corner, select **More options** (...), and then select **Show as a table**.

    :::image type="content" source="./media/end-user-drill/power-bi-more-actions.png" alt-text="Screenshot of the menu on the action bar. Show as a table is outlined.":::

    The data that makes up the bar chart appears below the visual.

    :::image type="content" source="./media/end-user-drill/power-bi-show-table.png" alt-text="Screenshot of bar chart with data table displayed below the visual." lightbox="./media/end-user-drill/power-bi-show-table.png#lightbox":::

2. Select the double arrow icon to drill down all fields at once. Watch the data in the table change to reflect the data that's being used to create the bar chart. The following table shows the results of drilling down all fields at once from the category level to the product level.  

    The first table represents the top level of the hierarchy. It shows the categories Rural and Urban. The next three tables represent the bar chart's data as you drill down all levels at once, from category to manufacturer to segment to product.

    :::image type="content" source="./media/end-user-drill/power-bi-show-data.png" alt-text="Screenshot of showing data for all four levels of drilling down." lightbox="./media/end-user-drill/power-bi-show-data.png#lightbox":::

## Considerations and limitations

- By default, drilling doesn't filter other visuals in a report, but the report designer can change this setting. As you drill, look to see if the other visuals on the page are cross-filtering or cross-highlighting.

- To view a report that is shared with you, a Power BI Pro or Premium license is required, or the report must be stored in Power BI Premium capacity. For more information, see [Find out which licenses you have](end-user-license.md#find-out-which-licenses-you-have).

## Related content

[Using inline hierarchies](../create-reports/desktop-inline-hierarchy-labels.md)

[Set and use date tables](../transform-model/desktop-date-tables.md)

[Power BI - Basic Concepts](end-user-basic-concepts.md)

More questions? [Visit the Power BI Community](https://community.powerbi.com/)
