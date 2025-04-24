---
title: "Stock charts in Power BI paginated reports | Microsoft Docs"
description: Display financial or scientific data using up to four values per data point in a Power BI paginated report using markers such as lines or triangles in Power BI Report Builder.
ms.date: 03/28/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---

# Stock charts in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  A stock chart in a Power BI paginated report is specifically designed for financial or scientific data that uses up to four values per data point. These values align with the high, low, open and close values that are used to plot financial stock data. This chart type displays opening and closing values by using markers, which are typically lines or triangles. In the following example, the opening values are shown by the markers on the left, and the closing values are shown by the markers on the right.  
  
 ![Screenshot of a Stock chart.](media/paginated-reports-visualizations/stock-chart.gif "Stock chart")  
  
 An example of a stock chart is available as a sample Report Builder report. For more information about downloading this sample report and others, see [Power BI Report Builder sample reports](https://go.microsoft.com/fwlink/?LinkId=198283).  
  
You create and modify Power BI paginated reports in [Power BI Report Builder](../../report-builder-power-bi.md).
  
## Variations  
  
- **Candlestick**. The candlestick chart is a specialized form of the stock chart, wherein boxes are used to show the range between the open and close values. Like the stock chart, the candlestick chart can display up to four values per data point.  
  
## Data considerations for stock charts  
  
- When presenting many stock data points, such as annual stock price trend, it is difficult to distinguish each open, close, high and low value of each data point. In this scenario, consider using a line chart instead of a stock chart.  
  
- When axis labels are generated, labeling usually begins at zero.  In general, stock prices do not fluctuate to the same degree as other data sets. For this reason, you may want to disable the axis labels from starting at zero, in order to get a better view of your data. To do this, set **IncludeZero** to **false** in the **Axis Properties** dialog box or the Properties window. For more information about how the chart generates axis labels, see [Formatting axis labels on a chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs).  
  
- Power BI Report Builder provides many calculated formulas for use with stock charts, including Price Indicator, Relative Strength Index, MACD, and more.  

## Related content

- [Range charts](/sql/reporting-services/report-design/range-charts-report-builder-and-ssrs)
- [Charts in Power BI paginated reports (Power BI Report Builder)](charts-report-builder.md)
- [Formatting a chart](formatting-chart-report-builder.md)    
