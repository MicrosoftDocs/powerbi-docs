---
title: Create a button slicer (preview)
description: Learn how to create a button slicer (preview) in Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 05/20/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the button slicer (preview) feature in Power BI Desktop, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create a button slicer (preview)

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

In Power BI, the button slicer (preview) is an interactive visual element that allows users to filter data in reports and dashboards, providing an easy and dynamic way to browse and analyze large datasets.

Among the various types of slicers, the button slicer (preview) stands out due to its unique properties. It offers customizable button styles, interactive states, conditional formatting for labels, and a grid layout for arranging buttons in rows and columns. Additionally, the button slicer (preview) can integrate images, enhancing visual appeal and providing more context. 

These features make the button slicer (preview) a powerful tool for creating interactive and visually appealing reports, offering a user-friendly setup and comprehensive formatting options.

> [!IMPORTANT]
> The button slicer (preview) is currently in preview and only available for Power BI Desktop. This information relates to a prerelease product that might be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Prerequisites

Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

For the purposes of this guide, in Power BI Desktop's **Global options**, under the **Preview features** section, the **Button slicer visual** feature is *disabled* by default, however, by completing the following steps you can enable it:

1. Open **Power BI Desktop**.
1. Navigate to the **Options** section found under the **File** menu.
1. In the **Global options** window, go to the **Preview features** section and find the **Button slicer visual** option.
1. Select the checkbox to enable the feature.

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). After downloading the file, let’s get started:

1. Launch **Power BI Desktop**.
1. On the left-side navigation pane, select **Open**; otherwise, on the top-left of the window, select **File > Open**.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view, ready for you to begin.

:::image type="content" source="media/button-slicer/button-slicer-sample.png" alt-text="Screenshot of the sample file showing district manager names as selectable tiles." lightbox="media/button-slicer/button-slicer-sample.png":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual **Power BI Pro license** or that you save the report in **Premium capacity**.

## Let’s create a button slicer

In this quick and easy three-step guide, we create a **Button slicer** in Power **BI Desktop**. Review the [Prerequisites](#prerequisites) section before following these steps.

1. With the **Retail Analysis Sample PBIX** open, make sure you are on the Overview page by selecting the **Overview** tab. To make room for your button slicer, select and resize the Scatter chart by dragging the dark **visualization handles**. Then, with nothing selected on the report canvas, select the **Button slicer** icon in the **Build visual** tab on the **Visualizations** pane to create a new slicer on the report canvas.

   :::image type="content" source="media/button-slicer/button-slicer-icon-highlighted.png" lightbox="media/button-slicer/button-slicer-icon-highlighted.png" alt-text="Screenshot of the Power BI Desktop Overview tab, Visualizations pane, Build visual, and Button slicer icon highlighted, slicer placeholder with resize handles on canvas.":::

1. To add data to the visual, we use the **Data** pane. With your slicer selected on the report canvas, navigate to the Data pane, expand the **District** table, and select **DM** to populate the slicer. The slicer now displays tiles with the district manager names. You can resize the slicer as needed and rearrange the elements on the canvas to your preference. but be cautious not to make the slicer too small, which affects the displayed information.

   :::image type="content" source="media/button-slicer/button-slicer-district-highlighted.png" lightbox="media/button-slicer/button-slicer-district-highlighted.png" alt-text="Screenshot of the Data pane, District table, DM selected and highlighted, slicer on canvas displaying  nine tiles with truncated district manager names.":::

1. To customize your slicer, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available format settings. This allows you to tailor the slicer's appearance and functionality to your specific requirements as demonstrated in the following example. 

   :::image type="content" source="media/button-slicer/button-slicer-displayed.png" lightbox="media/button-slicer/button-slicer-displayed.png"  alt-text="Screenshot of Visualizations pane expanded, Format visual icon selected, showing Visual and General tabs, and a formatted slicer with DM pics displayed.":::

Great job! Congratulations on successfully creating a button slicer with Power BI.

Next, take time familiarize yourself with the [Considerations and limitations](power-bi-visualization-button-slicer-considerations-limitations.md) for button slicers. 

## Related content

- [Button slicer considerations and limitations](power-bi-visualization-button-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
