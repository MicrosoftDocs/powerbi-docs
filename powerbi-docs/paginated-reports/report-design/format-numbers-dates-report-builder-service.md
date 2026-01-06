---
title: Format Numbers and Dates in Power BI Paginated Reports

description: Learn how to format numbers and dates in Power BI Report Builder data regions in a paginated report by selecting a format from the Number page of the data region's Properties dialog box.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: rpatkar
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
---
# Format numbers and dates in paginated reports (Power BI Report Builder)

You can format numbers and dates in paginated reports to improve readability and ensure consistency across different regions and export formats. This article explains how to apply standard and custom formats using the **Text box properties** dialog or expressions.

## Format numbers

To format numbers in a table, matrix, or chart:

1. Select the text box or cell.
1. Right-click and choose **Text box properties**.
1. Go to the **Number** page.
1. Choose a category (such as **Number**, **Currency**, or **Percentage**).
1. Adjust options like decimal places, thousand separators, and negative number display.

### Example number formats

|Format type|Format string|Example input|Output |
|---|---|---|---|
| Number | `N2` | `1234.567` | `1,234.57` |
| Currency | `C` | `1234.5` | `$1,234.50` |
| Percentage | `P1` | `0.856` | `85.6%` |
| Custom | `#,##0.00` | `9876.543` | `9,876.54` |

> [!NOTE]  
> If the field’s data type is set to `String`, numeric formatting options might be unavailable. Ensure the field is typed correctly in the dataset.

## Format dates and times

To format dates:

1. Select the text box or cell containing the date.
1. Right-click and choose **Text box properties**.
1. Go to the **Number** page and select **Date**.
1. Choose a predefined format or use a custom format string.

You can also use expressions to format dates dynamically:

```
=Format(Fields!OrderDate.Value, "MM/dd/yyyy")
```

### Example date formats

|Format type | Format string|Example output|
|---|---|---|---|
| Short date |`d` | `9/15/2025` |
| Long date | `D` | `Monday, September 15, 2025` | 
| General date/time (short time) | `g` | `9/15/2025 3:30 PM`|
| General date/time (long time) | `G` | `9/15/2025 3:30:00 PM`|
| ISO format | `yyyy-MM-dd`| `2025-09-15`|
| Custom format | `MMM dd, yyyy`  | `Sep 15, 2025` |

> [!TIP]
> Use `Globals!ExecutionTime` to display the report run time:
> ```
> VisualBasic=Format(Globals!ExecutionTime, "MMMM dd, yyyy hh:mm tt")
> ```

## Culture and localization considerations

By default, formatting reflects the client’s regional settings. To ensure consistent formatting across users:

- Use explicit format strings.
- Avoid relying solely on system locale settings.
- Test formats with different regional settings if your report has a global audience.

## Format values in charts and gauges

- **Charts**: Right-click the axis > **Axis Properties** > **Number** tab.
- **Gauges**: Right-click the scale > **Radial/Linear Scale Properties** > **Number** tab.

Only numeric formats are supported on value axes.

### Troubleshoot

- If a format string is invalid, the report might display it as literal text.
- Ensure the data type of the field matches the format type (for example, `DateTime` for date formats).
- Use expressions for more control over formatting logic.

## Related content

- [Formatting Text and Placeholders &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/formatting-text-and-placeholders-report-builder-and-ssrs)   
- [Formatting Lines, Colors, and Images &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/formatting-lines-colors-and-images-report-builder-and-ssrs)   
- [Format a chart in a paginated report (Power BI Report Builder)](visualizations/formatting-chart-report-builder.md)
- [Format axis labels as dates or currencies in a paginated report (Power BI Report Builder)](visualizations/format-axis-labels-dates-currencies-report-builder.md)
- [Formatting Scales on a Gauge &#40;Report Builder and Report Designer&#41;](/sql/reporting-services/report-design/formatting-scales-on-a-gauge-report-builder-and-ssrs)  
  
