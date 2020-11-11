---
title: Anomaly detection tutorial
description: 'Tutorial: Detect Anomalies in Power BI'
author: aphilip94
ms.reviewer: aphilip94
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: how-to
ms.date: 11/06/2020
ms.author: anphil

LocalizationGroup: Visualizations
---
# Anomaly detection (preview)

[!INCLUDE[consumer-appliesto-nyyn](../includes/consumer-appliesto-nyyn.md)]    

Anomaly detection helps you enhance your line charts by automatically detecting anomalies in your time series data. It also provides explanations for the anomalies to help with root cause analysis.  With just a couple of clicks, you can easily find insights without slicing and dicing the data. You can create and view anomalies in both Power BI Desktop and the Power BI service. The steps and illustrations in this article are from Power BI Desktop.

This feature is in preview, so you first need to turn on the feature switch. Go to **File** > **Options and Settings** > **Options** > **Preview features**, and make sure **Anomaly detection** is turned on:

:::image type="content" source="media/power-bi-visualization-anomaly-detection//preview-feature-switch.png" alt-text="Screenshot showing how to enable Anomaly detection preview feature switch.":::
 
## Get started
This tutorial uses online sales data for various products. You can find the pbix used  here: online sales.pbix

You can enable Anomaly detection by selecting the chart and adding "Find Anomalies" option in the analytics pane. 

 ![Screenshot showing entry point for anomaly detection](media/power-bi-visualization-anomaly-detection/entry-point.png)

 For example, this chart shows Revenue over time. Adding anomaly detection automatically enriches the chart with anomalies, and the expected range of values. When a value goes outside this expected boundary, it's marked as an anomaly.

 ![Screenshot showing how to add anomalies](media/power-bi-visualization-anomaly-detection/add-anomalies.gif)
 
### Format anomalies

This experience  is highly customizable. You can format the anomaly's shape, size, color and also the color, style, transparency of expected range. You can also configure the parameter of the algorithm.  If you increase the sensitivity, the algorithm would be very sensitive to changes in your data. In that case, even a slight deviation is marked as an anomaly. If you decrease the sensitivity, the algorithm is more selective on what it considers an anomaly.

 ![Screenshot showing how to format anomalies](media/power-bi-visualization-anomaly-detection/format-anomalies.gif)
 
## Explanations
Besides detecting anomalies, you can also automatically explain the anomalies the data. When you select the anomaly, Power BI runs an analysis across fields in your data model to figure out possible explanations. It gives you a natural language explanation of the anomaly, and factors associated with that anomaly, sorted by its explanatory strength. Here I see that on August 30, Revenue was $5187, which is above the expected range of $2447 to $3423. I can open the cards in this pane to see more details of the explanation.

![Screenshot showing how to to view explanations](media/power-bi-visualization-anomaly-detection/view-explanations.gif)
 
### Configure explanations
You can also control the fields that are used for analysis. For example, by dragging Seller and City into the **Explain by** field well, Power BI restricts the analysis to just those fields. In this case,  the anomaly on August 31 seems to be associated with a particular seller and particular cities. Here, seller "Fabrikam" has a strength of 99%. Power BI calculates *strength* as the ratio of the deviation from expected value, when filtered by the dimension to the deviation in total value.  Concretely, it's the ratio of deviation (actual minus expected value) between the component time series (for example, Revenue for Seller = Fabrikam) and the aggregate time series (for example, overall Revenue) for the anomaly point. Opening this card shows the visual with a spike in the revenue for this seller on August 31. Use the **Add to report** option to add this visual to the page.
![Screenshot showing how to configure explanations](media/power-bi-visualization-anomaly-detection/configure-explanations.gif)


