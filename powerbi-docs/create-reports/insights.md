---
title: Find Insights in your reports
description: 'The Insights feature helps you easily explore and find insights such as anomalies and trends in your data as you interact and consume your reports.'
author: JulCsc
ms.author: juliacawthra
ms.reviewer: anphil
ms.service: powerbi
ms.subservice: powerbi-ai
ms.custom: build-2023, build-2023-dataai
ms.topic: how-to
ms.date: 11/01/2025
ai-usage: ai-assisted
LocalizationGroup: 
---
# Find Insights in your reports (preview)

This *Insights* feature helps you easily explore and find insights such as anomalies and trends in your data as you interact and consume your reports. It notifies you if there are interesting insights and provides explanations for them. It works out of the box on any report, so you can automatically start getting insights from your reports without any setup.

:::image type="content" source="media/power-bi-insights/insights.gif#lightbox" alt-text="Screenshot that shows how to get insights.":::

**Did you know?** Power BI has other insights features that use artificial intelligence (AI):

- [Insights for *individual visuals*](desktop-insights.md) analyzes and explains the fluctuations of data points in visuals.
- [Insights for *dashboard tiles*](../explore-reports/end-user-insights.md) looks at the data being used to render that tile, and presents them in interactive visuals.
- [Quick Insights for *datasets*](service-insights.md) automatically generates data insights on a dataset in the Power BI service.

## License requirements

 The Insights feature is supported for reports in workspaces that are hosted in [Power BI Premium](../enterprise/service-premium-what-is.md) and [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) capacities. If you have a PPU license, you can also use the feature in workspaces that are hosted in shared capacities, but notifications won't be supported.

## Notifications

Power BI automatically runs insights analysis when you open a report. The light bulb in the action bar turns yellow and toast notifications are shown if there are **Top** insights for visuals in your current report page. **Top** insights are insights that are noteworthy, based on factors like recency and significance of the trend or anomaly. These notifications are supported only in Premium and PPU workspaces. The tenant and report setting for receiving notifications should be turned on for this feature to work.

:::image type="content" source="media/power-bi-insights/toast.png" alt-text="Screenshot that shows toast notification for insights.":::

Select the **See insights** button to open the Insights pane or choose **Show me later** if you’d not like to get further notifications for this report in the current session.

If you usually dismiss these notifications or don't engage with them, they're disabled for the current session. You can select **Keep Showing** to continue getting notifications.

:::image type="content" source="media/power-bi-insights/toast-dismiss.png" alt-text="Screenshot that shows notification when toasts are dismissed.":::

You can control the setting for notifications in a report as shown in this image:

:::image type="content" source="media/power-bi-insights/report-setting.png" alt-text="Screenshot that shows report setting for insights.":::

## Get insights on reports and visuals

Select **Get insights** in the action bar to open the Insights pane.

:::image type="content" source="media/power-bi-insights/get-insights-button.png" alt-text="Screenshot that shows the Get Insights button in the app bar.":::

The pane only shows insights about the current report page and it updates when you select a different page on the report.

Select **More options (...)** in the upper-right corner of a visual and then **Get insights** to see insights about just that visual.

:::image type="content" source="media/power-bi-insights/get-insights-button-visual.png" alt-text="Screenshot that shows Get Insights on visual settings.":::

## Insights

The Insights pane currently shows you three types of insights – Anomalies, Trends, and Key Performance Indicator (KPI) analysis.
The **Top** tab shows you Top insights. **All** tab shows you both Top insights and other insights.

:::image type="content" source="media/power-bi-insights/insights-pane.png" alt-text="Screenshot that shows the pane containing insights.":::

Insights are computed for your data every time you open a report or interact with a report. For example, when you change pages, change filters, or cross-filter your data.

### Anomalies

An anomaly is an abnormality in time-series data, such as unexpected spikes and dips in the data. The algorithm computes a boundary around values that are considered normal or expected. Any value found outside this boundary is marked as an anomaly. Check out this [technical blog](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/overview-of-sr-cnn-algorithm-in-azure-anomaly-detector/ba-p/982798) for more details about the Anomaly Detector algorithm. There are three types of anomaly insights:

- Significant Anomaly:
  The anomaly has a high score. Anomaly score indicates how far the point is from the expected range. 
- Recent Anomaly:
  The most recent anomaly in the measure.
- Anomaly summary:
  This insight type summarizes multiple anomalies in the measure.

### Trends

A trend occurs if there's a prolonged increase or decrease in time-series data. There are a series of steps the Power BI algorithm uses to find meaningful trends: It first performs data smoothing, interpolation, and time-series sampling. The trends are then identified for statistical significance based on the slope and length of a change in value. The algorithm removes noise like seasonality and outliers. For example, if sales jump in December, the algorithm doesn't mark that as a noteworthy trend because it's common for sales to jump around the holidays.

- Long trend:
  The trend is significant and is the longest trend within a single series or across multiple series in a visual. 
- Steep trend:
  The trend is significant and is the steepest trend within a single series or across multiple series in a visual.
- Recent trend:
  The trend is significant and is the most recent trend within a single series or across multiple series in a visual.
- Trend reversal:
  Recent trend in a single series or across multiple series in a visual where the reversal is significant, compared to the previous trend segment.

### KPI analysis

KPI analysis with a target looks at the variance of the current value to its target. It's considered significant if the variance is high or low compared to other segments. KPI analysis without a target looks at the value itself and flags ones that are high or low compared to other segments.

## Explanations

Select the card to get more details about the insight. 
Expand/collapse the cards under **Possible Explanations** to view/hide the explanation visuals and text.

### Anomalies

When an anomaly in your data is flagged, Power BI runs the analysis across different dimensions in your data model to look for spikes or dips in the measure that correlate to the anomaly. They're shown as possible explanations ranked by strength. For more information, see [Apply insights in Power BI to explain fluctuations in visuals](desktop-insights.md).

:::image type="content" source="media/power-bi-insights/anomalies-explanations.png" alt-text="Screenshot that shows explanations for an anomaly insight.":::

### Trends

When a trend in your data is flagged, Power BI looks for and identifies the categories that most influenced the increase or decrease in the identified trend. Possible explanations are ranked based on the relative contributions from different categories to the increase or decrease in trend. For more information, see [Run quick insights on a semantic model](service-insights.md#run-quick-insights-on-a-semantic-model).

:::image type="content" source="media/power-bi-insights/trend-explanations.png" alt-text="Screenshot that shows explanations for a trend insight.":::

### KPI analysis

For KPI analysis explanations, Power BI looks for and identifies the categories that have significantly high or low values. For KPI analysis with target, possible explanations are ranked based on Z-scores of the difference of the value from the target. Whereas for KPI analysis without target, possible explanations are ranked based on the Z-scores of the value itself.

:::image type="content" source="media/power-bi-insights/kpi-explanations.png" alt-text="Screenshot that shows explanations for a KPI analysis insight.":::

## Details

If the insight mentions multiple anomalies, or trends, selecting the insight card will show you the **Details** cards to help you choose the specific anomaly/trend/KPI segment you’d like to get explanations for.

:::image type="content" source="media/power-bi-insights/details.png" alt-text="Screenshot that shows the details pane for an insight.":::

## Considerations and limitations

**Insights** is currently not available in apps and embedded for reports in Premium workspaces. Users with PPU license can still use Insights.
If no insights are found, you see this message: "We didn’t find any insights." Here are some possible reasons:

- The data or visuals aren't supported:

  - Anomalies and trend insights are supported on a time-series with numeric data on the following types of visuals: line charts; area charts; stacked area, bar, and column charts; clustered bar and column charts; and KPIs. KPI analysis insight is supported on KPIs, gauges, cards, and bar and column charts.
  -	Anomalies and trends are only supported for built-in date hierarchy or date time fields. They aren't supported on custom date hierarchy.
- The data doesn't have significant anomalies or trends. You can try filtering your data or check back later when there’s new data.
- The following functionality isn't supported:

  - Publish to Web
  - Live Connection to Azure Analysis Services or SQL Server Analysis Services
  - MultiDimensional Analysis Services data sources (for example, SAP BW and SAP HANA)
  - Redshift data sources
  - Power BI Report Server
  
**Explanations** aren't supported in the following cases:

- TopN filters
- Include/exclude filters
- Measure filters
- Non-numeric measures
- Use of "Show value as"
- Filtered measures: filtered measures are visual level calculations with a specific filter applied (for example, Total Sales for France), and are used on some of the visuals created by the insights feature.
- Some measure types such as % grand total and measures from extension schemas
- RLS

If no explanations are found, you see this message: "We didn’t find any significant explanations." You can try bringing in more fields for the analysis.

## Next steps

For more information about insights, see the following articles:

- [Apply insights in Power BI to explain fluctuations in visuals](desktop-insights.md)
- [View data insights on dashboard tiles with Power BI](../explore-reports/end-user-insights.md)
- [Generate data insights on your semantic model automatically with Power BI](service-insights.md)
