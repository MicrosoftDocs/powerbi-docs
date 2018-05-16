---
title: Customizing tooltips in Power BI Desktop
description: Create custom tooltips for visuals using drag-and-drop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 05/02/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Customizing Tooltips in Power BI Desktop
Tooltips are an elegant way of providing more contextual information and detail to data points on a visual. The following image shows a tooltip applied to a chart in Power BI Desktop.

![](media/desktop-custom-tooltips/custom-tooltips_1.png)

When a visualization is created, the default tooltip displays the data point's value and category. There are many instances when being able to customize the tooltip information would be useful, and would provide additional context and information for users viewing the visual. Custom tooltips enable you to specify additional data points that display as part of the tooltip.

## How to customize tooltips
To create a customized tooltip, in the **Fields** well of the **Visualizations** pane, simply drag a field into the **Tooltips** bucket, shown in the following image. In the following image, four fields have been placed into the **Tooltips** bucket.

![](media/desktop-custom-tooltips/custom-tooltips_2.png)

Once Tooltips are added to the field well, hovering over a data point on the visualization shows the values for those fields in the tooltip.

![](media/desktop-custom-tooltips/custom-tooltips_3.png)

## Customizing tooltips with aggregation or Quick Calcs
You can further customize a tooltip by selecting an aggregation function or a *Quick Calc* by selecting the arrow beside the field in the **Tooltips** bucket, and selecting from the available options.

![](media/desktop-custom-tooltips/custom-tooltips_4.png)

There are many ways to customize **Tooltips**, using any field available in your dataset, to convey quick information and insights to users viewing your dashboards or reports.

