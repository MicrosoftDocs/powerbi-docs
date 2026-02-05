---
title: Get Power BI Insights
description: Discover the types of insights Power BI finds automatically in your data, including trends, outliers, and patterns. Learn how each insight type helps you interpret data faster.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: concept-article
ms.date: 01/12/2026
ai-usage: ai-assisted
LocalizationGroup: Dashboards
---
# Get Power BI insights

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

Power BI insights help you discover important patterns in your data automatically. Instead of manually exploring every chart and number, you can ask Power BI to analyze your data and highlight interesting findings. Think of insights as your data assistant, pointing out trends, unusual values, and patterns you might have missed.

You can get insights from:

- Dashboard tiles
- Report visuals  
- Report pages

For step-by-step instructions, see [View data insights on dashboard tiles with Power BI](end-user-insights.md).

:::image type="content" source="media/end-user-insight-types/power-bi-insight-lines.png" alt-text="Screenshot of a set of Insights with the Insights panel highlighted.":::

## What insights reveal

Power BI examines your data and applies advanced algorithms to find meaningful patterns. When you request insights, Power BI creates new visuals that highlight discoveries like unusual spikes, hidden correlations, and seasonal patterns.

The insights you see depend on your data. For dashboard tiles, you might see up to 10 different types of insights. For reports, Power BI automatically analyzes trends, unusual changes, and key performance indicators.

## Common terms

As you explore insights, you might encounter these terms:

- **Measure**: Numbers you analyze, like sales totals, average scores, or counts. Measures answer questions like "how many?" and "how much?"
- **Dimension**: Categories that organize your measures, like product names, regions, or time periods. Dimensions answer "what type?" and "where?"
- **Correlation**: When two things change together in similar or opposite ways. For example, if ice cream sales increase when temperatures rise, they're positively correlated.
- **Time series**: Data points shown over time, like daily sales, monthly website visits, or yearly revenue.

## Types of insights Power BI finds

Here are the insights Power BI can discover in your data. Each one helps you understand your data from a different angle.

### Top and bottom performers

**What it finds**: Categories that stand out from the rest with much higher or lower values.

**Why it matters**: You can quickly identify your best and worst performers without manually comparing every category.

**Example**: If you're looking at sales by product, this insight might show that Product A sells 10 times more than any other product.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-category-outliers.png" alt-text="Screenshot of a category outlier Insight report window.":::

### Significant changes over time

**What it finds**: Points in time when your data shifted direction or changed dramatically.

**Why it matters**: Helps you spot when something important happened that affected your metrics.

**Example**: Customer complaints dropped sharply in March, coinciding with a new product release.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-changepoint.png" alt-text="Screenshot of change points in time series Insight visual.":::

### Correlated patterns

**What it finds**: Multiple metrics that move together in similar or opposite directions.

**Why it matters**: Reveals relationships between different aspects of your business.

**Example**: Marketing spend and website traffic both increase during the same months.

:::image type="content" source="./media/end-user-insight-types/power-bi-auto-insight-type-correlation.png" alt-text="Screenshot of a correlation Insight visual.":::

### Consistent values

**What it finds**: When values are remarkably similar across different categories.

**Why it matters**: Shows when performance is evenly distributed, which might indicate stability or lack of differentiation.

**Example**: All five regions have nearly identical customer satisfaction scores.

:::image type="content" source="./media/end-user-insight-types/power-bi-insights-low-variance.png" alt-text="Screenshot of a low variance Insight visual.":::

### Dominant contributors

**What it find**: One category that makes up most of the total value.

**Why it matters**: It highlights concentration risk or your biggest driver.

**Example**: 80% of your revenue comes from one customer segment.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-majority.png" alt-text="Screenshot of a majority Insight visual.":::

### Unusual values

**What it find**: Individual data points that don't fit the expected pattern.

**Why it matters**: It flags anomalies that might need investigation or represent special circumstances.

**Example**: One store's inventory levels are three times higher than all other stores.

:::image type="content" source="./media/end-user-insight-types/power-bi-outliers.png" alt-text="Screenshot of an outlier Insight visual.":::

### Upward or downward trends

**What it find**: Steady increases or decreases over time.

**Why it matters**: It shows the overall direction your metrics are moving.

**Example**: Monthly active users have been steadily increasing for six months.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-trend.png" alt-text="Screenshot of an overall trend Insight visual.":::

### Seasonal patterns

**What it finds**: Recurring patterns that repeat at regular intervals like weekly, monthly, or yearly.

**Why it matters**: Helps you anticipate cyclical changes and plan accordingly.

**Example**: Sales spike every December and dip every February.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-seasonality-new.png" alt-text="Screenshot of a seasonality in time Insight visual.":::

### Stable proportions

**What it finds**: When a category maintains the same percentage of the total over time, even as the total changes.

**Why it matters**: Shows consistent market share or stable distribution.

**Example**: The East region consistently represents 25% of total sales, whether monthly sales are $100,000 or $200,000.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-steadyshare.png" alt-text="Screenshot of a steady share Insight visual.":::

### Unusual dates or times

**What it finds**: Specific dates or times with values that differ dramatically from other periods.

**Why it matters**: Identifies exceptional days that might represent opportunities or problems.

**Example**: Website crashes on Black Friday caused a traffic spike 500% higher than normal.

:::image type="content" source="./media/end-user-insight-types/pbi-auto-insight-type-time-series-outliers-purple.png" alt-text="Screenshot of a time series Insight visual.":::

## Related content

- [View data insights on dashboard tiles with Power BI.](end-user-insights.md)

Have more questions? Ask the [Power BI Community](https://community.powerbi.com/).