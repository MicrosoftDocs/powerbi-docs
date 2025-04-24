---
title: "Highlight chart data by adding strip lines in Power BI paginated report | Microsoft Docs"
description: Use strip lines in horizontal or vertical ranges in a Power BI paginated report to improve readability, highlight dates, or highlight a specific key range in Power BI Report Builder.
ms.date: 04/24/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: saurkumar
---
# Highlight chart data by adding strip lines in Power BI paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

  Strip lines, or strips, are horizontal or vertical ranges that shade the background of the Power BI paginated report chart in regular or custom intervals. You can use strip lines to:  
  
- Improve readability for looking up individual values on the chart. Specify strip lines at regular intervals to help separate data points when reading the chart.  
  
- Highlight dates that occur at regular intervals. For example, in a sales report you might use strip lines to identify weekend data points.  
  
- Highlight a specific key range. Using the previous example, you can use one strip line to highlight the highest range of sales that is between $80-100.  
  
 Strip lines are not applicable to shape or polar chart types.  

## Display interlaced strip lines at regular intervals on a chart  
  
1.  To show horizontal strip lines, right-click the vertical chart axis and select **VerticalAxis Properties**.  
  
     To show vertical strip lines, right-click the horizontal chart axis and select **Horizontal Axis Properties**.  
  
2.  Select the **Use interlacing** option. Grey strip lines will appear on your chart.  
  
3.  (Optional) Specify a color for the strip lines using the adjacent **Color** drop-down list.  
  
## Display interlaced strip lines at custom intervals on a chart  
  
1.  To show horizontal strip lines, right-click the vertical chart axis and select **VerticalAxis Properties**.  
  
     To show vertical strip lines, right-click the horizontal chart axis and select **Horizontal Axis Properties**.  
  
     The axis properties are displayed in the Properties window.  
  
2.  In the **Appearance** section of the Properties pane, for the StripLines property, select the Edit Collection (...) button to open the **ChartStripLine Collection Editor**.  
  
3.  Select **Add** to add a new strip line to the collection.  
  
4.  Select StripWidth to specify the width of the strip line, measured in inches on the report. If you are highlighting dates or times, select StripWidthType and select a time interval.  
  
5.  Type a value or expression for the Interval to specify how often the strip line will repeat.  For example, if you specify an interval of 10, and your strip line width is 5, strip lines will display at values of 0 to 5, 15 to 20, 30 to 35, and so on.  
  
> [!NOTE]  
>  By default, Interval is set to Auto, which means the chart will not calculate an interval for custom strip lines. The chart only calculates intervals for strip lines if an interval value is set.  
  
## Related content

- [Formatting Axis Labels on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
- [Formatting a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-a-chart-report-builder-and-ssrs)   
- [Add a moving average to a chart in Power BI paginated report (Power BI Report Builder)](add-moving-average-chart-report-builder.md) 
