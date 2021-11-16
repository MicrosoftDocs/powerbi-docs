---
title: Scorecard visual tutorial
description: 'Create a scorecard visual and add it to a report in Power BI (preview)'
author: aphilip94
ms.author: anphil
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/11/2021
LocalizationGroup: Visualizations
---
# Create a scorecard visual in Power BI (preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Integrating goals and scorecards deeply into reporting solutions is a great way to drive alignment and progress on a team. With the new scorecard visual in Power BI Desktop, you have the flexibility from an authoring perspective to add an existing scorecard to a report, or create a new scorecard. You can seamlessly integrate existing scorecards into reports, and even make updates to a scorecard directly from Power BI Desktop. 

:::image type="content" source="media/power-bi-visualization-scorecard-visual/scorecard-visual.gif" alt-text="Screenshot showing a scorecard visual in a report.":::
## Prerequisites

- You must be signed in to Power BI Desktop and have a Power BI Pro license.

## Get started

This feature is in preview, so you first need to turn the feature on. Go to **File** > **Options and Settings** > **Options** > **Preview features**, and make sure **Scorecard visual** is turned on.

:::image type="content" source="media/power-bi-visualization-scorecard-visual/preview-feature.png" alt-text="Screenshot showing preview features.":::

## Add the scorecard visual

1. Select the **Scorecard visual** icon from the **Visualizations** pane.

    :::image type="content" source="media/power-bi-visualization-scorecard-visual/scorecard-visual-icon.png" alt-text="Screenshot showing scorecard visual icon.":::

1. Choose either to create a new scorecard or connect to an existing scorecard from the Power BI service.

     :::image type="content" source="media/power-bi-visualization-scorecard-visual/scorecard-visual-empty-state.png" alt-text="Screenshot showing scorecard visual empty state.":::

    Selecting **Create new scorecard** lets you author scorecards in Power BI Desktop, just like you can in the Power BI service. The new scorecard and the associated dataset gets created in the workspace that you select.

    :::image type="content" source="media/power-bi-visualization-scorecard-visual/create-scorecard.png" alt-text="Screenshot showing create scorecard experience.":::

    Check out [Create scorecards and manual goals in Power BI](../create-reports/service-goals-create.md) to learn more.

    Selecting **Connect to an existing scorecard** lets you select and embed an existing scorecard from the list of ones that you have access to.

## Edit the scorecard 

When you hover over the visual, you can access the Scorecard toolbar. 

:::image type="content" source="media/power-bi-visualization-scorecard-visual/actions.png" alt-text="Screenshot showing scorecard visual actions.":::

The toolbar provides the following options:

 - **Create a flow**: Launch Power Automate and define automated business processes from events in your scorecard. Check out [Use Power Automate to update goals automatically](../create-reports/service-goals-power-automate.md) to learn more.
 - **Edit**: Edit the scorecard just like in the Power BI service. Create or update goals and subgoals, add notes and check-ins, create automated status rules, and so on. These changes made to the scorecard will be synced to the original scorecard. 
 - **Replace scorecard**: Replace the scorecard with another existing or new scorecard.
 - **Open in service**:  Select this link to open this scorecard in the Power BI service.

## Format the scorecard

 The visual supports various formatting options for scorecards, such as font style, colors, and backgrounds, so you can customize the scorecard to fit the look and feel of the rest of your report. You can also turn off the Scorecard header or status overview cards.
 
:::image type="content" source="media/power-bi-visualization-scorecard-visual/format-scorecard.png" alt-text="Screenshot showing scorecard formatting options.":::

:::image type="content" source="media/power-bi-visualization-scorecard-visual/format-scorecard-2.png" alt-text="Screenshot showing scorecard formatting options.":::

When you connect to an existing scorecard in the Power BI service from Power BI Desktop, formatting changes you make from the **Visualizations** pane will only apply to the scorecard in this report. They won't update the original scorecard in the Power BI service.
 
## Considerations and limitations

- Since the visual requires you to be signed in, it isn't supported in PaaS or anonymous report embed.
- Visual doesn't support cross-filtering or highlighting.
- You can't connect goals to the current report until you publish the report to the Power BI service.

## Next steps

[Create scorecards and manual goals in Power BI](../create-reports/service-goals-create.md)
