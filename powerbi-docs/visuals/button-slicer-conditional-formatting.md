---
title: Use Conditional Formatting with Button Slicers
description: Learn how to apply conditional formatting to button slicers to highlight key metrics and improve report interactivity in Power BI Desktop.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/14/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the button slicer feature in Power BI Desktop, including how to format it, so I can enhance my reports with interactive filtering options.
---

# Use conditional formatting with button slicers

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

This article shows how to apply **conditional formatting** to a button slicer in Power BI Desktop to highlight key values and improve report clarity. You learn how dynamic colors and rules help emphasize trends, flag exceptions, and align visuals with business logic. A practical example then walks you through configuring rules for status-based styling.

The use of the conditional formatting feature allows you to dynamically style elements within the button slicer based on specific rules or data conditions. By applying formatting such as color changes, font adjustments, or visibility toggles, you can visually emphasize key values, highlight trends, or signal status indicators directly within the slicer interface.

This capability enhances report interactivity and readability by guiding users’ attention to the most relevant selections. Whether you're flagging top-performing categories, marking exceptions, or aligning slicer visuals with business logic, conditional formatting helps create a more intuitive and engaging experience.

## Prerequisites

Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). After downloading the file, let’s get started:

1. Launch **Power BI Desktop**.
1. On the left-side navigation pane, select **Open**; otherwise, on the top-left of the window, select **File > Open**.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view, ready for you to begin.
1. Before proceeding, make sure you created a button slicer as described in the [Let’s create a button slicer](/power-bi/visuals/power-bi-visualization-button-slicer#lets-create-a-button-slicer) section.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-get-started.png" alt-text="Screenshot of button slicer visual overview in Power BI Desktop." lightbox="media/button-slicer-visual-highlights/button-slicer-get-started.png":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual Power BI Pro license or that you save the report in Premium capacity.

## Apply conditional formatting

1. Begin by choosing the desired button slicer within the report view in Power BI Desktop.
1. Navigate to the **Visualization** pane, then open the **Format** tab. Scroll down and expand the **Buttons** card to reveal further customization options.
1. Within the **Buttons** card, locate and expand the **Background** group. The **Color** control is visible, along with an ***fx*** button beside the color picker.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-conditional-formatting.png" alt-text="Screenshot of conditional formatting background color rules dialog trigger in button slicer settings." lightbox="media/button-slicer-visual-highlights/button-slicer-conditional-formatting.png":::

1. Select the ***fx*** button to launch the conditional formatting dialog window. Ensure the **Format** style is set to "Rules." In the "What field should we base this on?" dropdown, select **Status measure** for the **This Year Sales**, and then define the rules as follows:

   - First rule: >= 0 % and < 0 number with a light red color.
   - Second rule: >= 0 number and <= 100 % with a light blue color.

1. Select **OK**.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-format-fields.png" alt-text="Screenshot of conditional formatting rules dialog for button slicer background settings in Power BI Desktop." lightbox="media/button-slicer-visual-highlights/button-slicer-format-fields.png":::

1. Buttons associated with a negative sales status are now displayed in light red, while the buttons with a positive status appear in light blue.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-formatting-applied.png" alt-text="Screenshot of button slicer displaying conditional formatting colors for sales status." lightbox="media/button-slicer-visual-highlights/button-slicer-formatting-applied.png":::

The button slicer supports conditional formatting for multiple elements, including callout values, callout labels, button backgrounds, button borders, and button effects.

## Related content

- [Create a button slicer](power-bi-visualization-button-slicer.md)
- [Use visual highlights](button-slicer-visual-highlights.md)
- [Paste values to select](button-slicer-paste-values.md)
- [Button slicer considerations and limitations](power-bi-visualization-list-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
