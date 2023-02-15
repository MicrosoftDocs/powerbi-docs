---
title: Show the data that was used to create the report visual
description: Learn how Power BI business users can "see" the data used to create a report visual by showing it as a table.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 01/26/2023
LocalizationGroup: Visualizations
---
# Show the data used to create a Power BI visualization

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

A Power BI visual is constructed using data from underlying datasets. If you're interested in seeing behind the scenes, the Power BI service lets you show the data that's being used to create a visual in a report. Use **Show as a table** to display the data in the visual as a table.  Use **Show data point as a table** to display a table of the data used to calculate a single data point.

You can also [export the data to Excel](/power-bi/visuals/power-bi-visualization-export-data) for visuals in a report and visuals on a dashboard.   

## Show the data that creates a report visual
1. In the Power BI service, [open a report](end-user-report-open.md) and select a visual.  
2. To show the data behind the visual, select **More options** (...) and choose **Show as a table**.
   
   :::image type="content" source="./media/end-user-show-data/power-bi-show-data-vertical.png" alt-text="Screenshot with Show as a table selected from the More options dropdown.":::

3. By default, the data appears below the visual.
   
   :::image type="content" source="./media/end-user-show-data/power-bi-show-data-table.png" alt-text="Screenshot showing the visual with a table below it.":::

4. To change the orientation, select vertical layout :::image type="icon" source="media/end-user-show-data/power-bi-vertical-icon-new.png":::.
   
   :::image type="content" source="./media/end-user-show-data/power-bi-show-horizontal.png" alt-text="Screenshot showing the visual with a table next to it.":::

To return to the report, select **Back to report** from the upper left corner. 

   ![Screenshot showing the Back to report button.](./media/end-user-show-data/power-bi-back.png)

## Show a data point as a table
You can also focus on one data record in a visualization, and drill into the data behind it. To use **Data point table**, right-click a data element and select **Show data point as a table** from the menu that appears.

:::image type="content" source="media/end-user-show-data/power-bi-data-point.png" alt-text="Screenshot that shows a column chart in the Power BI service. In a shortcut menu for one of the columns, Show data point as a table is called out.":::

When you select **Show data point as a table** for a data element, the Power BI service opens a separate screen and displays all the data associated with the selected element.

:::image type="content" source="media/end-user-show-data/power-bi-data-point-table.png" alt-text="Screenshot of the Power BI service. All the data for the selected column element is visible in a table.":::


To get back to the report, select **< Back to Report** in the upper-left corner of the canvas.

## Considerations and limitations
**Show data point as a table** has the following limitations:
* The option is only available for specific types of data. If you hover over a data point and don't see the option to **Show data point as a table**, then the visual contains data that does not support it. For example, if the visual has a measure in the **Value** field, **Show data points as a table** will not be available.  
* You can't change the data in the **Show data point as a table** view and save it back to the report.
* You can't export the **Save data point as a table** view to PDF or static PowerPoint. 

## Next steps
[Visuals in Power BI reports](../visuals/power-bi-report-visualizations.md)    
[Power BI reports](end-user-reports.md)
