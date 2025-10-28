---
title: Show Data Used to Create Power BI Visuals
description: Learn how to display and export the underlying data used to create Power BI visualizations. Show data as tables and export to .csv files.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/27/2025
ai-usage: ai-assisted
ms.custom: sample-opportunity-analysis
LocalizationGroup: Visualizations
---

# Show data used to create Power BI visuals

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Show data as a table

A Power BI visualization is constructed using data from your semantic models. If you're interested in seeing behind-the-scenes, Power BI lets you *display* the data that is being used to create the visual. When you select **Show as a table**, Power BI displays the data as a table below (or next to) the visualization.

You can also export the data that is being used to create the visualization as an .xlsx or .csv file and view it in Excel. For more information, see [Export data from Power BI visualizations](power-bi-visualization-export-data.md).

> [!NOTE]
> *Show as a table* and *Export Data* are both available in Power BI Desktop and the Power BI service. However, Power BI Desktop provides one additional layer of detail; [*Show Records* displays the actual rows from the semantic model](../consumer/end-user-show-data.md).

## Using *Show as a table*

To follow this tutorial in Power BI Desktop, download the [Opportunity Analysis Sample PBIX file](https://download.microsoft.com/download/9/1/5/915ABCFA-7125-4D85-A7BD-05645BD95BD8/Opportunity%20Analysis%20Sample%20PBIX.pbix). If you'd like to use the Power BI service, download the Opportunity Analysis PBIX file, and then upload it to a workspace in the Power BI service.

1. Select a visualization to make it active.
1. Select **More actions** (...) and choose **Show as a table**.

   :::image type="content" source="media/service-reports-show-data/power-bi-more-action.png" alt-text="Screenshot showing the display option for Show as a table.":::

1. By default, the data displays below the visual.

   :::image type="content" source="media/service-reports-show-data/power-bi-show-data-below.png" alt-text="Screenshot of Power BI visual with data displayed in a table below the visualization.":::

1. To change the orientation, select the **Switch to vertical layout** icon in the top-right corner of the visualization.

   :::image type="content" source="media/service-reports-show-data/power-bi-show-data-side.png" alt-text="Screenshot of Power BI visual with data table positioned beside the visualization.":::

1. To export the data to a .csv file, select the ellipses and choose **Export data**.

   :::image type="content" source="media/service-reports-show-data/power-bi-export-data-new.png" alt-text="Screenshot of the Export data option in the More actions menu.":::

   For more information on exporting the data to Excel, see [Export data from Power BI visualizations](power-bi-visualization-export-data.md).

   > [!NOTE]
   > When viewing data in table mode, visual header icons (such as More actions, Focus mode, and other visual options) might not be visible. To access additional visual features and options, select **Back to report** to return to the normal report view.

1. Select **Back to report** to return to the canvas.

## Using Show records

You can also focus on one data record in a visualization, and drill into the details behind it. For more information, see [Use Visual table and Data point table in Power BI](../consumer/end-user-show-data.md).

## Considerations and troubleshooting

- If the **Data point table** button in the ribbon is disabled and grayed-out, it means the selected visualization doesn't support it.

## Related content

- [Export data from Power BI visualizations](power-bi-visualization-export-data.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
