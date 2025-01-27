---
title: Create a metrics visual in a Power BI report
description: 'Create a scorecard visual and add it to a report in Power BI'
author: aphilip94
ms.author: anphil
ms.reviewer: kfollis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 07/19/2022
LocalizationGroup: Visualizations
---
# Create a metrics visual in a Power BI report (Preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Integrating metrics and scorecards deeply into reporting solutions is a great way to drive alignment and progress on a team. With the metrics visual in Power BI Desktop, you have the flexibility from an authoring perspective to add an entire scorecard or  individual metrics in reports, showcasing metrics alongside other visuals in the context of the rest of the report data. You can seamlessly integrate new or existing scorecards and metrics into reports, and even make updates to them directly from Power BI Desktop.

:::image type="content" source="media/power-bi-visualization-scorecard-visual/scorecard-visual.png" alt-text="Screenshot showing a visual with a scorecard in a report.":::

## Prerequisites

- You must be signed in to Power BI Desktop and have a Power BI Pro license.

## Add the metrics visual

1. Select the **Metrics visual** icon from the **Visualizations** pane.

    :::image type="content" source="media/power-bi-visualization-scorecard-visual/scorecard-visual-icon.png" alt-text="Screenshot showing scorecard visual icon.":::

1. Select **Add metrics**. 
    
    :::image type="content" source="media/power-bi-visualization-scorecard-visual/add-metrics.png" alt-text="Screenshot showing add metrics option.":::
    
1. Choose either **Add a single metric as a visual** to add one metric, or **Add multiple metrics as a list** to add a scorecard.

    :::image type="content" source="media/power-bi-visualization-scorecard-visual/metrics-visual-options.png" alt-text="Screenshot showing options for the Metrics visual.":::
    
1. Choose either **Create new** or **Browse metrics**. 

   Select **Create new** for **Add multiple metrics as a list** to author scorecards in Power BI Desktop, just as you can in the Power BI service. Check out [Create scorecards and manual metrics in Power BI](../create-reports/service-goals-create.md) to learn more. The new scorecard and the associated dataset get created in the workspace that you select.

    :::image type="content" source="media/power-bi-visualization-scorecard-visual/create-scorecard.png" alt-text="Screenshot showing create scorecard experience.":::

    Select **Browse metrics** for **Add multiple metrics as a list** to select and embed an existing scorecard from the list of ones that you have access to.

    Select **Create new** for **Add a single metric as a visual** to create a new metric.
    
     :::image type="content" source="media/power-bi-visualization-scorecard-visual/create-metric.png" alt-text="Screenshot showing create metric experience.":::
     
     Select **Browse metrics** for **Add a single metric as a visual** to select a metric from an existing scorecard you have access to.

## Edit the visual 

To edit the visual containing the scorecard, hover over the bottom to access the toolbar. To edit the visual containing a single metric, do the same in focus mode.

:::image type="content" source="media/power-bi-visualization-scorecard-visual/actions.png" alt-text="Screenshot showing scorecard visual actions.":::

The toolbar provides the following options:

-	**Edit**: Edit the scorecard or metric just like in the Power BI service. Create or update metrics and submetrics, view or add notes and check-ins, set up automated status rules, and so on. These changes made to the scorecard will be synced to the original scorecard.
-	**Open in service**: Select this link to open this scorecard or metric in the Power BI service.
-	**Replace scorecard**: Replace the scorecard with another existing or new scorecard.

## Format the visual

The visual supports various formatting options, such as font size, style, colors, and backgrounds, so you can customize the scorecard or metric to fit the look and feel of the rest of your report. You can turn off elements of the scorecard such as the header or status overview cards or the elements in the metric such as owners, due date, and so on.

| Format the scorecard | Format the scorecard, continued |
|-----|------|
| :::image type="content" source="media/power-bi-visualization-scorecard-visual/format-scorecard.png" alt-text="Screenshot showing scorecard formatting options.":::  | :::image type="content" source="media/power-bi-visualization-scorecard-visual/format-scorecard-2.png" alt-text="Screenshot showing other scorecard formatting options."::: |

|  Format the metric | Format the metric, continued|
|-----|------|
| :::image type="content" source="media/power-bi-visualization-scorecard-visual/format-metric.png" alt-text="Screenshot showing metric formatting options.":::  | :::image type="content" source="media/power-bi-visualization-scorecard-visual/format-metric-2.png" alt-text="Screenshot showing other metric formatting options."::: |

When you connect to an existing scorecard or metric in the Power BI service from Power BI Desktop, formatting changes you make from the **Visualizations** pane will only apply to the scorecard or metric in this report. They won't update the original scorecard or metric in the Power BI service.
 
## Considerations and limitations

- Since the visual requires you to be signed in, it isn't supported in Platform as a Service (PaaS) or anonymous report embed.
- The visual doesn't support cross-filtering or highlighting.
- You can't connect metrics to the current report until you publish the report to the Power BI service.

## Related content

- [Create scorecards and manual metrics in Power BI](../create-reports/service-goals-create.md)
