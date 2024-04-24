---
title: Find Insights in your reports
description: 'The Insights feature helps you easily explore and find insights such as anomalies and trends in your data as you interact and consume your reports.'
author: aphilip94
ms.author: anphil
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-ai
ms.custom: build-2023, build-2023-dataai
ms.topic: how-to
ms.date: 03/07/2024
LocalizationGroup: 
---
# Find Insights in your reports (preview)

This *Insights* feature helps you easily explore and find insights such as anomalies and trends in your data as you interact and consume your reports. It notifies you if there are interesting insights and provides explanations for them. It works out of the box on any report, so you can automatically start getting insights from your reports without any setup.
 
 [![Screenshot showing how to get insights.](media/power-bi-insights/insights.gif)](media/power-bi-insights/insights.gif#lightbox)

**Did you know?** Power BI has other insights features that use artificial intelligence (AI):

- [Insights for *individual visuals*](desktop-insights.md) analyzes and explains the fluctuations of data points in visuals.
- [Insights for *dashboard tiles*](../consumer/end-user-insights.md) looks at the data being used to render that tile, and presents them in interactive visuals.
- [Quick Insights for *datasets*](service-insights.md) automatically generates data insights on a dataset in the Power BI service.
- [AI Insights for *data models*](../transform-model/desktop-ai-insights.md) in Power Query provide access to pre-trained machine learning models from Azure Cognitive Services.

## License requirements

 Insights is supported for reports in workspaces that are hosted in [Power BI Premium](../enterprise/service-premium-what-is.md) and [Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) capacities. If you have a PPU license, you can also use the feature in workspaces that are hosted in shared capacities, but notifications won't be supported. 

## Notifications

Power BI automatically runs insights analysis when you open a report. The light bulb in the action bar turns yellow and toast notifications are shown if there are **Top** insights for visuals in your current report page. **Top** insights are those that are noteworthy, based on factors like recency and significance of the trend or anomaly. These notifications are supported only in Premium and PPU workspaces. Note that the tenant and report setting for receiving notifications should be turned on for this to work.

 ![Screenshot showing toast notification for insights.](media/power-bi-insights/toast.png)
 
Select the **See insights** button to open the Insights pane or choose **Show me later** if you’d not like to get further notifications for this report in the current session.

If you usually dismiss these notifications or don't engage with them, they'll be disabled for the current session. You can select **Keep Showing** to continue getting notifications.

 ![Screenshot showing notification when toasts are dismissed.](media/power-bi-insights/toast-dismiss.png)
 
 You can control the setting for notifications in a report as shown below:
 
 ![Screenshot showing report setting for insights.](media/power-bi-insights/report-setting.png)
 
 
## Get insights on reports and visuals

Select **Get insights** in the action bar to open the Insights pane.

![Screenshot showing Get Insights button in the app bar.](media/power-bi-insights/get-insights-button.png)

The pane only shows insights about the current report page and it updates when you select a different page on the report.

Select **More options (...)** in the upper-right corner of a visual and then **Get insights** to see insights about just that visual.

![Screenshot showing Get Insights on visual settings.](media/power-bi-insights/get-insights-button-visual.png)

## Insights
The Insights pane currently shows you three types of insights – Anomalies, Trends, and KPI analysis.
The **Top** tab shows you Top insights. **All** tab shows you both Top insights and other insights. 

![Screenshot showing pane containing insights.](media/power-bi-insights/insights-pane.png)

Insights are computed every time you open a report or interact with a report such as changing pages, changing filters, or cross-filtering your data.

### Anomalies
An anomaly is an abnormality in time-series data, such as unexpected spikes and dips in the data. The algorithm computes a boundary around what’s considered a normal or expected value. Any value found outside this boundary is marked as an anomaly. Check out this technical blog for more details about the algorithm. There are three types of anomaly insights:
- Significant Anomaly: 
The anomaly has a high score. Anomaly score indicates how far the point is from the expected range. 
- Recent Anomaly: 
The most recent anomaly in the measure.
- Anomaly summary: 
This insight type summarizes multiple anomalies in the measure.

### Trends
A trend occurs there's a prolonged increase or decrease in time-series data. There are a series of steps the Power BI algorithm uses to find meaningful trends: It first performs data smoothening, interpolation, time-series sampling. The trends are then identified for statistical significance based on the slope and length of a change in value.  The algorithm removes noise like seasonality and outliers. For example, if sales jump in December, the algorithm won't mark that as a noteworthy trend because it's common for sales to jump around the holidays.
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

![Screenshot showing explanations for anomaly insight.](media/power-bi-insights/anomalies-explanations.png)

### Trends
When a trend in your data is flagged, Power BI looks for and identifies the categories that most influenced the increase or decrease in the identified trend. Possible explanations are ranked based on the relative contributions from different categories to the increase or decrease in trend. For more information see [Run quick insights on a semantic model](service-insights.md#run-quick-insights-on-a-semantic-model).

![Screenshot showing explanations for trend insight.](media/power-bi-insights/trend-explanations.png)

### KPI analysis
For KPI analysis explanations, Power BI looks for and identifies the categories that have significantly high or low values. For KPI analysis with target, possible explanations are ranked based on Z-scores of the difference of the value from the target. Whereas for KPI analysis without target, possible explanations are ranked based on the Z-scores of the value itself.

![Screenshot showing explanations for KPI analysis insight.](media/power-bi-insights/kpi-explanations.png)

## Details
If the insight mentions multiple anomalies, or trends, selecting the insight card will show you the **Details** cards to help you choose the specific anomaly/trend/KPI segment you’d like to get explanations for.

![Screenshot showing details pane for insight.](media/power-bi-insights/details.png)

## Considerations and limitations

**Insights** is currently not available in apps and embedded for reports in Premium workspaces. Users with PPU license can still use Insights.
If no insights found are found, you see this message: “We didn’t find any insights”. Here are some possible reasons:

- The data or visuals aren't supported:
    -	 Anomalies and trend insights are supported on time series with numeric data on visuals such as line charts; area charts; stacked area, bar, and column charts; clustered bar and column charts; and KPIs. KPI analysis insight is supported on KPIs, gauges, cards, and bar and column charts.
    -	Anomalies and trends are only supported for built-in date hierarchy or date time fields. They aren't supported on custom date hierarchy. 
-	The data doesn't have significant anomalies or trends. You can try filtering your data or check back later when there’s new data.
-	The following functionality isn't supported:
    - Publish to Web
    -	Live Connection to Azure Analysis Services or SQL Server Analysis Services
    -	MultiDimensional Analysis Services data sources (for example, SAP BW and SAP HANA)
    -	Power BI Report Server
  
**Explanations** aren't supported in the following cases:

- TopN filters
- Include/exclude filters
- Measure filters
- Non-numeric measures
- Use of "Show value as"
- Filtered measures: filtered measures are visual level calculations with a specific filter applied (for example, Total Sales for France), and are used on some of the visuals created by the insights feature.
- Some measure types such as % grand total and measures from extension schemas
- RLS

If no explanations are found, you see this message: “We didn’t find any significant explanations”. You can try bringing in more fields for the analysis.


## Next steps

For more information about insights, see the following articles:

- [Apply insights in Power BI to explain fluctuations in visuals](desktop-insights.md)
- [View data insights on dashboard tiles with Power BI](../consumer/end-user-insights.md)
- [Generate data insights on your semantic model automatically with Power BI](service-insights.md)
- [Use AI Insights in Power BI Desktop](../transform-model/desktop-ai-insights.md)