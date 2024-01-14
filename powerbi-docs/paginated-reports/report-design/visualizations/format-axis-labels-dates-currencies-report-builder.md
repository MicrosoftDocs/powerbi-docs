---
title: "Format axis labels as dates or currencies in a Power BI paginated report | Microsoft Docs"
description: Specify a date or time interval for an x-axis by formatting the axis labels and setting the type of axis interval to a valid interval in a Power BI paginated report.
ms.date: 04/12/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: maggiesMSFT
ms.author: maggies
ms.reviewer: monaraya
---
# Format axis labels as dates or currencies in a paginated report (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../../includes/applies-yes-report-builder-no-desktop.md)]

When you show properly formatted DateTime values on an axis in a Power BI paginated report, a chart automatically displays these values as days. To specify a date/time interval for the x-axis, such as an interval of months or an interval of hours, you must format the axis labels and set the type of axis interval to a valid date or time interval.  
  
> [!NOTE]  
> In column and scatter charts, the horizontal, or x-axis, is the category axis. In bar charts, the vertical, or y-axis, is the category axis.  
  
 To format time intervals correctly, the values displayed on the x-axis must evaluate to a <xref:System.DateTime> data type. If your field has a data type of <xref:System.String>, the chart won't calculate intervals as dates or times. For more information, see [Charts &#40;Power BI Report Builder&#41;](charts-report-builder.md).  
  
 When a numeric value is added to the y-axis, by default, the chart doesn't format the number before displaying it. If your numeric field is a sales figure, consider formatting the numbers as currencies to increase the readability of the chart.  
  
  
## Format x-axis labels as monthly intervals  
  
1. Right-click the horizontal, or x-axis, of the chart, and select **HorizontalAxis Properties**.  
  
1. In the **HorizontalAxis Properties** dialog box, select **Number**.  
  
1. From the **Category** list, select **Date**. From the **Type** list, select a date format to apply to the x-axis labels.  
  
1. Select **Axis Options.**  
  
1. In **Interval**, type **1**. In **Interval type** property, select **Months**.  
  
    > [!NOTE]  
    >  If you do not specify an interval type, the chart will calculate intervals in terms of days.  
  
1. Select **OK**.
  
## Format y-axis labels using a currency format  
  
1. Right-click the vertical, or y-axis, of the chart, and select **VerticalAxis Properties**.  
  
1. In the **VerticalAxis Properties** dialog box, select **Number**.  
  
1. From the **Category** list, select **Currency**. From the **Symbol** list, select a currency format to apply to the y-axis labels.  
  
1. Select **OK**.
  
## Related content

- [Formatting Axis Labels on a Chart &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs)   
- [Formatting a Chart &#40;Power BI Report Builder&#41;](formatting-chart-report-builder.md)   
- [Specify a Logarithmic Scale &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/specify-a-logarithmic-scale-report-builder-and-ssrs)   
- [Specify an Axis Interval &#40;Power BI Report Builder&#41;](/sql/reporting-services/report-design/specify-an-axis-interval-report-builder-and-ssrs)  

  
