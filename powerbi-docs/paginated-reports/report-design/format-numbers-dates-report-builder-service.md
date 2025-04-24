---
title: "Format numbers and dates in Power BI paginated reports | Microsoft Docs"

description: Learn how to format numbers and dates in Power BI Report Builder data regions in a paginated report by selecting a format from the Number page of the data region's Properties dialog box.
author: kfollis
ms.author: kfollis
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 01/18/2023
---
# Format numbers and dates in paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

  You can format numbers and dates in data regions in a Power BI paginated report by selecting a format from the **Number** page of the corresponding data region's **Properties** dialog box.  
  
 To specify format strings within a text box report item, you need to select the item that you want to format, right-click, select **Text Box Properties**, and then click **Number**. You can format individual cells in a table or matrix data region in the same manner, because cells in a table or matrix are individual text boxes.  
  
 A chart data region commonly shows dates along the category (x) axis, and values along the value (y) axis. To specify formatting in a chart, right-click an axis and select **Axis Properties**. On the value axis, you can specify formats only for numbers. For more information, see [Formatting Axis Labels on a Chart &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/formatting-axis-labels-on-a-chart-report-builder-and-ssrs).  
  
 To specify formatting in a Gauge data region, right-click the scale of the gauge and select **Radial Scale Properties** or **Linear Scale Properties**.  
  
> [!NOTE]  
>  If some formatting options you want to use are grayed out, it means that those formatting options aren't compatible the field's data type, which is set in the data source. For example, if the field contains number values but the field's data type is String, you cannot apply numerical data formatting options such as currency or decimals.  
 
## Considerations for formatting numbers and dates  

 Before you format numbers and dates in your report, consider the following:  
  
-   By default, numbers are formatted to reflect the cultural settings on the client computer. Use formatting strings to specify how numbers are displayed so that formatting is consistent regardless of where the person who is viewing the report is located.  
  
-   The formats provided on the **Number** page are a subset of the .NET Framework standard numeric format strings. To format a number or date using a custom format that is not shown in the dialog box, you can use any .NET Framework format strings for numbers or dates. For more information about custom format strings, see the [Formatting Types](/previous-versions/) topic on MSDN.  
  
-   If a custom format string has been specified, it has a higher priority over default settings that are culture-specific. For example, suppose you set a custom format string of "#,###" to show the number 1234 as 1,234. This may have different meaning to users in the United States than it does to users in Europe. Before you specify a custom format, consider how the format you choose will affect users of different cultures who may view the report.  
  
-   If you specify an invalid format string, the formatted text is interpreted as a literal string which overrides the formatting.  
  
-   If you're formatting a mix of numbers and characters in the same text box, consider using a placeholder to format the number separately from the rest of the text. For more information, see [Formatting Text and Placeholders &#40;Report Builder and SSRS&#41;](/sql/reporting-services/report-design/formatting-text-and-placeholders-report-builder-and-ssrs). If an invalid format string is specified for the Format property on the text box, the format string is ignored. If an invalid format string is specified for the Format property on the chart or gauge, the format string that you specified is interpreted as a string and formatting is not applied.  
  
-   If you select **Currency** under **Category** and you check **Show values in**, you can select **Thousands**, **Millions**, or **Billions** to display numbers using financial formats. For example, if the field value is 1,789,905,394 and you select **Billions** and specify 2 decimal places, the value displayed in the report is 1.78.  
  
## Related content

- [Formatting Text and Placeholders &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/formatting-text-and-placeholders-report-builder-and-ssrs)   
- [Formatting Lines, Colors, and Images &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/formatting-lines-colors-and-images-report-builder-and-ssrs)   
- [Format a chart in a paginated report (Power BI Report Builder)](visualizations/formatting-chart-report-builder.md)
- [Format axis labels as dates or currencies in a paginated report (Power BI Report Builder)](visualizations/format-axis-labels-dates-currencies-report-builder.md)
- [Formatting Scales on a Gauge &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/formatting-scales-on-a-gauge-report-builder-and-ssrs)  
  
