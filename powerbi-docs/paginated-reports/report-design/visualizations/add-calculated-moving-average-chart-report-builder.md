---
title: Add a Calculated Moving Average to a Series on a Chart in a Power BI Paginated Report
description: Learn why you would add the Moving Average formula price indicator on a chart to identify trends in Power BI Report Builder.
ms.date: 12/01/2025
ai-usage: ai-assisted
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
author: JulCsc
ms.author: juliacawthra
ms.reviewer: saurkumar
---
# Add a calculated moving average to a series on a chart (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

A moving average is an average of the data in your series, calculated over a defined period of time. In Power BI paginated reports, the moving average can be shown on the chart to identify significant trends.  

:::image type="content" source="./media/paginated-reports-visualizations/report-builder-column-chart-tutorial.png" alt-text="Screenshot of a column chart showing sales over time." lightbox="./media/paginated-reports-visualizations/report-builder-column-chart-tutorial.png":::

To add a moving average to a chart:
  
1. Right-click on a value in the chart and select **Add Calculated Series**, as shown in the following image. The **Calculated Series Properties** dialog opens.

   :::image type="content" source="./media/paginated-reports-visualizations/menu-add-calculated-series.png" alt-text="Screenshot of the add calculated series command highlighted in the local menu." lightbox="./media/paginated-reports-visualizations/menu-add-calculated-series.png":::
  
1. In the **Calculated Series Properties** dialog, select the **Moving average** option from the **Formula** dropdown list.

   :::image type="content" source="./media/paginated-reports-visualizations/dialog-calculated-series-properties.png" alt-text="Screenshot of the calculated series properties dialog." lightbox="./media/paginated-reports-visualizations/dialog-calculated-series-properties.png":::
  
1. Specify an integer value for the **Period** that represents the period of the moving average.  
  
    > [!NOTE]  
    > The period is the number of days used to calculate a moving average. If date/time values aren't specified on the x-axis, the period is represented by the number of data points used to calculate a moving average. If there's only one data point, the moving average formula doesn't calculate. The moving average is calculated starting at the second point. If you specify the **Start from first point** option, the chart will start the moving average at the first point. If there's only one data point, the point in the calculated moving average will be identical to the first point in your original series.  
  
## Related content

- [Add a moving average to a chart in a Power BI paginated report](add-moving-average-chart-report-builder.md)
- [Tutorial: Add a column chart to your report (Report Builder)](/sql/reporting-services/tutorial-add-a-column-chart-to-your-report-report-builder)
- [Formatting a chart in paginated report (Report Builder)](/sql/reporting-services/report-design/formatting-a-chart-report-builder-and-ssrs)
- [Charts in Power BI paginated reports (Power BI Report Builder)](charts-report-builder.md)
- [Add empty points to a chart in a Power BI paginated report (Power BI Report Builder)](add-empty-points-chart-report-builder.md)
