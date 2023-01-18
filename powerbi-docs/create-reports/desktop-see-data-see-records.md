---
title: Visual table and records in Power BI visuals
description: Use the Power BI Visual table and Data point table features to drill into the details of a visualization. See a textual representation of the underlying data.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/18/2023
LocalizationGroup: Learn more
---
# Use Visual table and Data point table in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In **Power BI** you can drill into the details of a visualization, and see textual representations of the underlying data or the individual data records for the selected visual. These features are sometimes referred to as *click-through*, *drillthrough*, or *drillthrough to details*.

You can use **Visual table** to view the data in a visual as a table, or use **Data point table** to view a table of the data used to calculate a single data point. These capabilities are available in Power BI Desktop and in the Power BI service.

# [Power BI Desktop](#tab/powerbi-desktop)

:::image type="content" source="media/desktop-see-data-see-records/see-data-record.png" alt-text="Screenshot that shows where to find the Visual table and Data point table features in the Data/Drill tab in the Power B I Desktop ribbon.":::

# [Power BI service](#tab/powerbi-service)

:::image type="content" source="media/desktop-see-data-see-records/service-see-data-record.png" alt-text="Screenshot that shows where to find the Visual table and Data point table features in a shortcut menu in the Power B I service.":::

---

>[!IMPORTANT]
>**Visual table** and **Data point table** support only the following visualization types:
>  - Bar chart
>  - Column chart
>  - Donut chart
>  - Filled map
>  - Funnel
>  - Map
>  - Pie chart
>  - Treemap

## Use Visual table in Power BI

# [Power BI Desktop](#tab/powerbi-desktop)

**Visual table** shows you the data underlying a visualization. **Visual table** appears in the **Data/Drill** tab in the ribbon when a visual is selected.

:::image type="content" source="media/desktop-see-data-see-records/visual-table-01.png" alt-text="Screenshot that shows where to find the Visual table feature in the Data/Drill tab of the Power B I Desktop ribbon.":::

You can also see the data by using one of these options:

- Right-click on a visualization, and then select **Show as a table** from the menu that appears.
- Select **More options** (...) in the upper-right corner of a visualization, and then select **Show as a table**.

![Screenshot that shows where to find the Visual table feature in Power B I Desktop. The feature is visible in a shortcut menu.](media/desktop-see-data-see-records/visual-table-02.png)&nbsp;&nbsp;![Screenshot that shows where to find the Visual table feature in Power B I Desktop. The feature is visible in the More options menu.](media/desktop-see-data-see-records/visual-table-03.png)

# [Power BI service](#tab/powerbi-service)

**Visual table** shows you the data underlying a visualization. You can see the data by using one of these options:

- Right-click on a visualization, and then select **Show as a table** from the menu that appears.
- Select **More options** (...) in the upper-right corner of a visualization, and then select **Show as a table**.

:::image type="content" source="media/desktop-see-data-see-records/service-shortcut-menu-visual-table-item.png" alt-text="Screenshot that shows where to find the Visual table feature in the Power B I service. The feature is visible in the More options menu and a shortcut menu.":::

---

> [!NOTE]
> You must be hovering over a data point in the visual for the right-click menu to be available.

When you select **Visual table** or **Data point table**, Power BI displays both the visual and the textual representation of the data. In the *horizontal view*, the visual is displayed on the top half of the canvas, and the data is shown on the bottom half.

# [Power BI Desktop](#tab/powerbi-desktop)

:::image type="content" source="media/desktop-see-data-see-records/visual-table-04.png" alt-text="Screenshot that shows a pie chart in Power B I Desktop. Below the chart is a table that shows the details of the data.":::

# [Power BI service](#tab/powerbi-service)

:::image type="content" source="media/desktop-see-data-see-records/service-visual-table-horizontal-view.png" alt-text="Screenshot that shows a pie chart in the Power B I service. Below the chart is a table that shows the details of the data.":::

---

You can toggle between the horizontal view and a *vertical view* by selecting the icon in the upper-right corner of the canvas.

# [Power BI Desktop](#tab/powerbi-desktop)

:::image type="content" source="media/desktop-see-data-see-records/visual-table-05.png" alt-text="Screenshot that shows a pie chart in Power B I Desktop with a data table to its right. In the upper-right corner, an icon is called out.":::

# [Power BI service](#tab/powerbi-service)

:::image type="content" source="media/desktop-see-data-see-records/service-visual-table-vertical-view.png" alt-text="Screenshot that shows a pie chart in the Power B I service with a data table to its right. In the upper-right corner, an icon is called out.":::

---

To get back to the report, select **< Back to Report** in the upper-left corner of the canvas.

# [Power BI Desktop](#tab/powerbi-desktop)

:::image type="content" source="media/desktop-see-data-see-records/visual-table-06.png" alt-text="Screenshot that shows the upper-left corner of the Power B I Desktop canvas. Back to report is called out.":::

# [Power BI service](#tab/powerbi-service)

:::image type="content" source="media/desktop-see-data-see-records/service-back-button.png" alt-text="Screenshot that shows the upper-left corner of the Power B I service canvas. Back to report is called out.":::

---
> [!NOTE]
> **Show as table** has the following limitations:
>
> - You can't export the **Show as table** view to PDF or static PowerPoint. 

## Use Data point table in Power BI

# [Power BI Desktop](#tab/powerbi-desktop)

You can also focus on one data record in a visualization, and drill into the data behind it. To use **Data point table**, select a visualization, then select **Data point table** in the **Data/Drill** tab of the ribbon, and then select a data point or row on the visualization.

:::image type="content" source="media/desktop-see-data-see-records/visual-table-07.png" alt-text="Screenshot that shows Power B I Desktop. A column chart is selected. In the Data/Drill tab of the ribbon, Data point table is called out.":::

> [!NOTE]
> If the **Data point table** button in the ribbon is disabled and grayed-out, it means the selected visualization does not support **Data point table**.

You can also right-click a data element and select **Show data point as a table** from the menu that appears.

:::image type="content" source="media/desktop-see-data-see-records/visual-table-08.png" alt-text="Screenshot that shows a column chart in Power B I Desktop. In a shortcut menu for one of the columns, Show data point as a table is called out.":::

When you select **Data point table** for a data element, the Power BI Desktop canvas displays all the data associated with the selected element.

:::image type="content" source="media/desktop-see-data-see-records/visual-table-09.png" alt-text="Screenshot of a Power B I Desktop canvas. All the data for the selected column element is visible in a table.":::

# [Power BI service](#tab/powerbi-service)

You can also focus on one data record in a visualization, and drill into the data behind it. To use **Data point table**, right-click a data element and select **Show data point as a table** from the menu that appears.

:::image type="content" source="media/desktop-see-data-see-records/service-shortcut-menu-data-point-table.png" alt-text="Screenshot that shows a column chart in the Power B I service. In a shortcut menu for one of the columns, Show data point as a table is called out.":::

When you select **Show data point as a table** for a data element, the Power BI service displays all the data associated with the selected element.

:::image type="content" source="media/desktop-see-data-see-records/service-data-point-table.png" alt-text="Screenshot of the Power B I service. All the data for the selected column element is visible in a table.":::

---

To get back to the report, select **< Back to Report** in the upper-left corner of the canvas.

> [!NOTE]
> **Data point table** has the following limitations:
>
> - You can't change the data in the **Data point table** view and save it back to the report.
> - You can't use **Data point table** when your visual uses a calculated measure in a (multidimensional) measure group.
> - You can't use **Data point table** when you are connected to a live multidimensional (MD) model.
> - You can't export the **Data point table** view to PDF or static PowerPoint. 

## Next steps

There are all sorts of report formatting and data management features in **Power BI**. Check out the following resources for a few examples:

- [Create a drillthrough button in Power BI](desktop-drill-through-buttons.md)
- [Use gridlines and snap-to-grid in Power BI reports](desktop-gridlines-snap-to-grid.md)
