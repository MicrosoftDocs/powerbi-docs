---
title: Create a button slicer
description: Learn how to create a button slicer in Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/14/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the button slicer feature in Power BI Desktop, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create a button slicer

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI, the button slicer is an interactive visual element that allows users to filter data in reports and dashboards, providing an easy and dynamic way to browse and analyze large datasets.

Among the various types of slicers, the button slicer stands out due to its unique properties. It offers customizable button styles, interactive states, conditional formatting for labels, and a grid layout for arranging buttons in rows and columns. Additionally, the button slicer can integrate images, enhancing visual appeal and providing more context. 

These features make the button slicer a powerful tool for creating interactive and visually appealing reports, offering a user-friendly setup and comprehensive formatting options.

## Prerequisites

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

# [Power BI Desktop](#tab/powerbi-desktop)

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

1. Launch **Power BI Desktop**.
1. From the left-side navigation pane, select **Open**, or select **File > Open** from the menu.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view.

# [Power BI service](#tab/powerbi-service)

1. Sign in to the Power BI service (`app.powerbi.com`).
1. From the left-side navigation pane, select **Learn**.
1. On the **Learning center** page, under **Sample reports**, locate and select **Retail Analysis Sample**. It opens in Reading mode and adds the dashboard, report, and semantic model to your workspace.
1. At the top of the report, select **Edit** to switch to the Report editor (Edit mode).

---

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual Power BI Pro license or that you save the report in Premium capacity.

## Let’s create a button slicer

In this quick and easy three-step guide, we create a **Button slicer** in Power **BI Desktop**. Review the [Prerequisites](#prerequisites) section before following these steps.

1. With the **Retail Analysis Sample PBIX** open, make sure you are on the Overview page by selecting the **Overview** tab. To make room for your button slicer, select and resize the Scatter chart by dragging the dark **visualization handles**. Then, with nothing selected on the report canvas, select the **Button slicer** icon in the **Build visual** tab on the **Visualizations** pane to create a new slicer on the report canvas.

   :::image type="content" source="media/button-slicer/button-slicer-icon-highlighted.png" lightbox="media/button-slicer/button-slicer-icon-highlighted.png" alt-text="Screenshot of the Power BI Desktop Overview tab, Visualizations pane, Build visual, and Button slicer icon highlighted, slicer placeholder with resize handles on canvas.":::

1. To add data to the visual, we use the **Data** pane. With your slicer selected on the report canvas, navigate to the Data pane, expand the **District** table, and select **DM** to populate the slicer. The slicer now displays tiles with the district manager names. You can resize the slicer as needed and rearrange the elements on the canvas to your preference. but be cautious not to make the slicer too small, which affects the displayed information.

   :::image type="content" source="media/button-slicer/button-slicer-district-highlighted.png" lightbox="media/button-slicer/button-slicer-district-highlighted.png" alt-text="Screenshot of the Data pane, District table, DM selected and highlighted, slicer on canvas displaying  nine tiles with truncated district manager names.":::

1. To customize your slicer, select the **Format visual** icon in the **Visualizations** pane, granting you access to all available format settings. This allows you to tailor the slicer's appearance and functionality to your specific requirements.

Great job! Congratulations on successfully creating a button slicer with Power BI.

## Related content

- [Use visual highlights](button-slicer-visual-highlights.md) 
- [Use conditional formatting](button-slicer-conditional-formatting.md)
- [Paste values to select](button-slicer-paste-values.md)
- [Button slicer considerations and limitations](power-bi-visualization-button-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
