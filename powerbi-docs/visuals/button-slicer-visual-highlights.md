---
title: Use Visual Highlights with Button Slicers
description: Learn how to use visual highlights with button slicers to highlight key metrics and improve report interactivity in Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/14/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the button slicer feature in Power BI Desktop, including how to use visual highlights, so I can enhance my reports with interactive filtering options.
---

# Use visual highlights with button slicers

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Highlighting in Power BI enhances report interactivity by letting users focus on selected data points across visuals. When used with the button slicer, it draws attention to selected values and updates other visuals in context.

As you interact with various elements like pie charts or tables, the corresponding buttons in the slicer stay highlighted and easy to identify, while the buttons not related to your selection become dimmed or less prominent.

Understanding how highlighting impacts the button slicer prepares you to create more engaging and insightful reports, making it easier for viewers to analyze filtered data and uncover meaningful trends.

In the following steps, you learn how to set up and utilize highlighting with the button slicer in Power BI, ensuring your report offers a seamless and intuitive data exploration experience.

## Prerequisites

Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). After downloading the file, let's get started:

1. Launch **Power BI Desktop**.
1. On the left-side navigation pane, select **Open**; otherwise, on the top-left of the window, select **File > Open**.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view, ready for you to begin.
1. Before proceeding, make sure you created a button slicer as described in the [Let's create a button slicer](/power-bi/visuals/power-bi-visualization-button-slicer#lets-create-a-button-slicer) section.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-get-started.png" alt-text="Screenshot of button slicer visual overview in Power BI Desktop." lightbox="media/button-slicer-visual-highlights/button-slicer-get-started.png":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual Power BI Pro license or that you save the report in Premium capacity.

## Use the highlight label

1. With the button slicer still selected on your report canvas, look to the **Visualizations pane** and choose the **Build visual** tab. Here, you find the **Highlight label** field well. From the **Data pane**, drag the 'Value' measure found under Sales > This Year Sales, to the **Highlight label** field well. Once added, each button in your slicer displays the corresponding sales value as a label below the main callout value, making it easy to see sales figures for each selection.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-highlight-label.png" alt-text="Screenshot of Power BI showing a button slicer with highlight labels added below each button value." lightbox="media/button-slicer-visual-highlights/button-slicer-highlight-label.png":::

1. Now that you've added a highlight label to your button slicer, let's explore how it responds when interacting with other visuals in your report. On your Overview page, locate the "This Year Sales by Chain" pie chart. Select the segment labeled "Lindseys" within the pie chart. In the button slicer, only the buttons related to the Lindseys series remain highlighted, while all other buttons become inactive or greyed out. This visual cue helps you quickly identify which selections are relevant to your chosen data point.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-highlight-relevant.png" alt-text="Screenshot of Power BI showing only Lindseys-related buttons highlighted after selecting a pie chart segment." lightbox="media/button-slicer-visual-highlights/button-slicer-highlight-relevant.png":::

By following these steps, you enhance your Power BI report with an interactive slicer that makes data exploration more intuitive and insightful.

## Related content

- [Create a button slicer](power-bi-visualization-button-slicer-considerations-limitations.md)
- [Use conditional formatting](button-slicer-conditional-formatting.md)
- [Paste values to select](button-slicer-paste-values.md)
- [Button slicer considerations and limitations](power-bi-visualization-list-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
