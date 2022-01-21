---
title: 'Artificial Intelligence Sample for Power BI: Take a tour'
description: 'Artificial Intelligence Sample for Power BI: Take a tour'
author: itsnotaboutthecell
ms.author: alpowers
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 01/21/2022
LocalizationGroup: Samples
---
# Artificial Intelligence Sample for Power BI: Take a tour

The Artificial Intelligence Sample contains a report for a fictitious company named Contoso. The Contoso Sales Manager created this report to understand their products and regions key contributors for revenue won/loss, identify the highest or lowest breakdown of revenue and determine if there are anomalies in their data. This sample is part of a series that shows how you can use Power BI with business-oriented data, reports, and dashboards.

   :::image type="content" source="media/sample-artificial-intelligence/power-bi-ai-sample-report.png" alt-text="Opened Artificial Intelligence Sample.":::

This tutorial explores the Artificial Intelligence Sample in the Power BI service. Because the report experience may be similar in Power BI Desktop and in the service, you can also follow along by downloading the sample .pbix file in Power BI Desktop.

As a [business user](../consumer/end-user-features) you don't need a Power BI license to explore the samples in the Power BI service.

## Get the sample

### Get the sample from the Power BI service

1. Open the Power BI service ([app.powerbi.com](https://app.powerbi.com)) and sign in.

2. On the left navigation, select **Learn**.
   
   :::image type="content" source="media/sample-artificial-intelligence/power-bi-learn.png" alt-text="Select Learn.":::

3. In the **Sample reports** section, select the **Artificial Intelligence Sample**.

   :::image type="content" source="media/sample-artificial-intelligence/power-bi-ai-sample.png" alt-text="Sample reports.":::
   
4. Power BI will open the **Artificial Intelligence Sample** report automatically.

### Sample location

The **Artificial Intelligence Sample** will be added to your My workspace as a report and dataset.

   :::image type="content" source="media/sample-artificial-intelligence/power-bi-my-workspace.png" alt-text="My workspace contents.":::
  
### Get the .pbix file for this sample

Alternatively, you can [download a report from the service to Power BI Desktop](./create-reports/service-export-to-pbix) after it has been deployed to your My Workspace from the steps above as a .pbix file, for use with Power BI Desktop.

## Artificial Intelligence Sample report

The sample report has three pages **Key Influencers**, **Decomposition Tree**, and **Anomaly Detection** to demonstrate how people can discover new insights and inform their decision making with easy to use Artificial Intelligence visuals.

### Key Influencers page
The first report page we’ll explore is **Key Influencers**, where we’ll analyze our data to understand the impact and influence of key contributors on our results.

#### What are our top contributors for wins and losses?

1. We’ll start by reviewing the top contributors that resulted in a **Status of Won** using the **Key influencers** visual in the center of our report. From the visual we notice the top contributor is when the **Discount goes up 2%** we are **2.76x** more likely to win new revenue.
1. After selecting the **2.76x** indicator a scatter chart will now be displayed to the right displaying the correlation between our **Discount** and **% Status is Won** for this influencer.
 
   :::image type="content" source="media/sample-artificial-intelligence/power-bi-top-contributor.png" alt-text="Top contributor to revenue won.":::

1. By interacting with slicers, filters, and other visuals the Key influencers visual will reruns its analysis based on the updated choice. From the **Close % by Product category** stacked bar chart select the **Furniture** category, to generate new insights based upon the updated selection and to learn that when the **Product category** is **Furniture** and when the **Sales owner is Molly Clark** we are **1.50x** more likely to win  new revenue.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-key-influencers-update.png" alt-text="Updated analysis for Key influencers.":::

1. To review the top contributors for when our **Status** changes, from the drop-down select the **Lost** option to generate new insights based upon the updated selection. From the updated selection we can now answer the question **“What is the top contributor when a loss occurs?"**

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-key-influencers-status-change.png" alt-text="Status change for Key influencers.":::

To learn more, see [Key influencers visuals](../visuals/power-bi-visualization-influencers).

### Decomposition Tree page
The second report page we’ll explore is **Decomposition Tree**, where we’ll conduct root cause and ad hoc analysis to understand the impact of **Sales Opportunities** across the different fields within our data.

#### Who is the top sales owner and largest opporunity path for computer sales
1. From the **Decomposition tree** visual in the center of our report, select the **Computers** option within the **Category** breakdown to re-run the analysis.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-decomposition-selection.png" alt-text="Decomposition tree re-run analysis.":::

1. With our updated analysis, we can leverage **artificial intelligence splits** to determine the path to the next highest sales opportunities in our data, select the "**+**" symbol next to **Tablets** and the **High value** option.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-decomposition-ai-split.png" alt-text="Decomposition tree ai split path.":::

3. The **Territory** field is determined as the next path for sales opportunity with the **US-SOUTH** being the largest. Select the "**+**" symbol next to **US-SOUTH** and then the **High value** option. From the updated selection we can now answer the question **“Who is the top sales owner?"**

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-decomposition-ai-split-sales-owner.png" alt-text="Decomposition tree ai split path to highest value.":::

To learn more, see [Decomposition tree visuals](../visuals/power-bi-visualization-decomposition-tree).

### Anomaly Detection page
The final report page we'll explore is **Anomaly Detection**, where we’ll combine several Artificial Intelligence capabilities to detect anomalies in our results, generate dynamic text summaries, and use our own natural language to ask questions and get answers from our data.

#### Why the sharp decline in software revenue?
1. The clustered bar chart in the top right of the page is divided into multiple versions of itself (**small multiples**) to compare data across the **Manager** and **Product category** fields. Within the **Software** multiple select the bar for **Low, Spencer** to dynamically filter the rest of the page to Spencer's specific results.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-small-multiple.png" alt-text="Small multiple for Product category.":::

1. On the right side of a page a dynamic summary has been generated based on the updated selection and with the text summary describing the highest and lowest calendar months for **Revenue Won**.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-smart-narrative.png" alt-text="Smart narrative summary.":::

1. Within the line chart in the center of the page, right click the **December 2020** data point. Within the menu options select the **Analyze** and then  **Explain the decrease.** to answer **"Why the sharp decline in revenue in December 2020?"** using quick insights.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-quick-insights.png" alt-text="Quick insights to explain the decrease.":::

To learn more, see [Smart narratives](../visuals/power-bi-visualization-smart-narrative) and [Apply insights to explain fluctuations in visuals](../create-reports/desktop-insights).

#### Why the unexpected increase in revenue over the last 90 days?

1. In the top right of the page select the **Last 90 days** to view the **Revenue Won** displayed as individual days.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-button.png" alt-text="Power BI button selection.":::

1. The button has preserved the **Low, Spencer** & **Software** selections from earlier steps and has re-written the **Revenue Summary** based upon the last 90 days filter which we can review for new insights. Within the line chart are also visual **anomaly** indicators, select the **April 25th** for a possible explanation as to **"Why?"** an anomaly was detected.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-anomaly-detection.png" alt-text="Anomaly detection.":::

1. The **Anomalies** pane is now displayed on the right side of your report page, including **Possible explanations**, a **Strength score** which means that higher scores may have had a greater impact, and possibly more explanations if we to scroll below. From our highest possible explanation score, to answer the question **"Why the increase in revenue?"**. When finished you collapse the anomalies pane using the **>>**.

    :::image type="content" source="media/sample-artificial-intelligence/power-bi-anomalies-pane.png" alt-text="Anomalies pane.":::

To learn more, see [Anomaly detection](../visuals/power-bi-visualization-anomaly-detection).

## Next steps: Connect to your data
This environment is a safe one to play in, because you can choose not to save your changes. But if you do save them, you can always visit the **Learn** section's **Sample reports** for a new copy of this sample.

We hope this tour has shown how the artificial intelligence capabilities in Power BI can provide insights into data. Now it's your turn; connect to your own data. With Power BI, you can connect to a wide variety of data sources. To learn more, see [Get started with the Power BI service](../fundamentals/service-get-started.md).
