---
title: Show the data that was used to create the report visual
description: Learn how Power BI business users can "see" the data used to create a report visual by showing it as a table.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/01/11
LocalizationGroup: Visualizations
---
# Show the data used to create a Power BI visual

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yyny.md)]

A Power BI visual is constructed using data from underlying semantic models. If you're interested in seeing behind the scenes, Power BI shows you the data that's being used to create a visual. The ability to do this is available in Power BI Desktop and in the Power BI service and is available for almost all visual types. 

You can also [export the data to Excel](/power-bi/visuals/power-bi-visualization-export-data) for visuals in a report and visuals on a dashboard.   

# [Power BI Desktop](#tab/powerbi-desktop)

## Use Visual table in Power BI Desktop

Use **Visual table** to display the data underlying a visual. **Visual table** is available from the **Data/Drill** tab in the ribbon when a visual is selected.

:::image type="content" source="media/end-user-show-data/visual-table-01.png" alt-text="Screenshot that shows where to find the Visual table feature in the Data/Drill tab of the Power BI Desktop ribbon.":::

You can also see the data by using one of these options:

- Right-click on a visual, and then select **Show as a table** from the menu that appears.
- Select **More options** (...) in the upper-right corner of a visual, and then select **Show as a table**.

    :::image type="content" source="media/end-user-show-data/visual-table-02.png" alt-text="Screenshot that shows where to find the Visual table feature in Power BI Desktop. The feature is visible in a shortcut menu.":::&nbsp;&nbsp;:::image type="content" source="media/end-user-show-data/visual-table-03.png" alt-text="Screenshot that shows where to find the Visual table feature in Power BI Desktop. The feature is visible in the More options menu.":::

> [!NOTE]
> You must be hovering over a data point in the visual for the right-click menu to be available.

When you select **Visual table** or **Data point table**, Power BI displays both the visual and the textual representation of the data. In the *horizontal view*, the visual is displayed on the top half of the canvas, and the data is shown on the bottom half.

:::image type="content" source="media/end-user-show-data/visual-table-04.png" alt-text="Screenshot that shows a pie chart in Power BI Desktop. Below the chart is a table that shows the details of the data.":::

You can toggle between the horizontal view and a *vertical view* by selecting the icon in the upper-right corner of the canvas.

:::image type="content" source="media/end-user-show-data/visual-table-05.png" alt-text="Screenshot that shows a pie chart in Power BI Desktop with a data table to its right. In the upper-right corner, an icon is called out.":::

To get back to the report, select **< Back to Report** in the upper-left corner of the canvas.

:::image type="content" source="media/end-user-show-data/visual-table-06.png" alt-text="Screenshot that shows the upper-left corner of the Power BI Desktop canvas. Back to report is called out.":::

## Use Data point table in Power BI Desktop

You can also focus on one data record in a visual, and drill into the data behind it. To use **Data point table**, select a visual to make it active. Select **Data point table** in the **Data/Drill** tab of the ribbon, and then select a data point or row on the visual.

:::image type="content" source="media/end-user-show-data/visual-table-07.png" alt-text="Screenshot that shows Power BI Desktop. A column chart is selected. In the Data/Drill tab of the ribbon, Data point table is called out.":::

> [!NOTE]
> If the **Data point table** button in the ribbon is disabled and grayed-out, it means the selected visual does not support **Data point table**.

You can also right-click a data element and select **Show data point as a table** from the menu that appears.

:::image type="content" source="media/end-user-show-data/visual-table-08.png" alt-text="Screenshot that shows a column chart in Power BI Desktop. In a shortcut menu for one of the columns, Show data point as a table is called out.":::

When you select **Data point table** for a data element, the Power BI Desktop canvas displays all the data associated with the selected element.

:::image type="content" source="media/end-user-show-data/visual-table-09.png" alt-text="Screenshot of a Power BI Desktop canvas. All the data for the selected column element is visible in a table.":::


# [Power BI service](#tab/powerbi-service)

## Display the data used to create a report visual

In the Power BI service, report visuals are created from the data in the underlying semantic model. **Show as a table** displays the data underlying a visual.  **Show data point as a table** displays the underlying data used to calculate a single data point. 

:::image type="content" source="media/end-user-show-data/power-bi-data-table-point.png" alt-text="Screenshot that shows where to find the Show as a table feature in a shortcut menu in the Power BI service.":::

> [!NOTE]
> You must be hovering over a data point in the visual for the right-click menu to be available.

When you select **Show as a table** or **Show data point as a table**, Power BI displays both the visual and the textual representation of the data. 


### Show the data that creates a report visual

1. In the Power BI service, [open a report](../consumer/end-user-report-open.md) and select a visual.  
2. To show the data underlying the visual, select **More options** (...) and choose **Show as a table**.
   
   :::image type="content" source="./media/end-user-show-data/power-bi-show-data-vertical.png" alt-text="Screenshot with Show as a table selected from the More options dropdown.":::

3. By default, the data appears below the visual.
   
   :::image type="content" source="./media/end-user-show-data/power-bi-show-data-tables.png" alt-text="Screenshot showing the visual with a table below it.":::

4. To change the orientation, select the vertical layout icon :::image type="icon" source="media/end-user-show-data/power-bi-vertical-icon-new.png"::: from the upper-right corner of the canvas.
   
   :::image type="content" source="./media/end-user-show-data/power-bi-show-horizontals.png" alt-text="Screenshot showing the visual with a table next to it.":::

5. To export the data to a .csv file, select the ellipses and choose **Export data**. 

    :::image type="content" source="./media/end-user-show-data/power-bi-export-data.png" alt-text="Screenshot of menu item for Export data.":::


For more information about exporting the data to Excel, see [Export data from Power BI visualizations](../visuals/power-bi-visualization-export-data.md).

To return to the report, select **Back to report** from the upper left corner. 

### Show the data used to create a data point

You can also focus on one data record in a visual, and drill into the underlying data. Right-click a data element and select **Show data point as a table** from the menu that appears.

:::image type="content" source="media/end-user-show-data/power-bi-data-point.png" alt-text="Screenshot that shows a column chart in the Power BI service. In a shortcut menu for one of the columns, Show data point as a table is called out.":::

When you select **Show data point as a table** for a data element, the Power BI service opens a separate screen and displays all the data associated with the selected element.

:::image type="content" source="media/end-user-show-data/power-bi-data-point-table.png" alt-text="Screenshot of the Power BI service. All the data for the selected column element is visible in a table.":::

To return to the report, select **Back to report** from the upper left corner. 

---

### Considerations and limitations

**Show data point as a table** (Power BI service) and **Data point table** (Power BI Desktop) views

* Can't be exported to PDF or static PowerPoint.
* Are only available for specific types of data. In the Power BI service, if you hover over a data point and don't see the option to **Show data point as a table**, then the visual contains data that doesn't support it. In Power BI Desktop, if the menu option for **Data point table** is grayed out, then the visual contains data that doesn't support it. For example, if the visual has a measure in the **Value** field, showing the data underlying a data point will not be available.  
* You can't change the data in these views and save it back to the report.

**Show as a table** (Power BI service) and **Visual table** (Power BI Desktop) views

* Are not supported for these visual types: Card, KPI, Key influencers, Q&A visual, Smart narrative, Metrics app visual, Paginated report visual, Power Apps for Power BI visual, ArcGIS map for Power BI visual, Power Automate for Power BI visual.
* Can't be exported to PDF or static PowerPoint.
* You can't change the data and then save it back to the report.
* Are not supported when your visual uses a calculated measure in a (multidimensional) measure group.
* Are not supported when you are connected to a live multidimensional (MD) model.
 

## Related content

There are all sorts of report formatting and data management features in **Power BI**. Check out the following resources for a few examples:

- [Create a drillthrough button in Power BI](desktop-drill-through-buttons.md)
- [Use gridlines and snap-to-grid in Power BI reports](desktop-gridlines-snap-to-grid.md)
- [Visuals in Power BI reports](../visuals/power-bi-report-visualizations.md)    
- [Power BI reports](../consumer/end-user-reports.md)
