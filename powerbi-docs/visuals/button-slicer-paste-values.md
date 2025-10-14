---
title: Paste Values Into a Button Slicer for Faster Filtering
description: Learn how to quickly paste a list of values into a button slicer to apply multiple selections at once, speed filtering, and reduce manual selection—try it now.
author: julcsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/14/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the button slicer feature in Power BI Desktop, including how to paste values for quick selections, so I can enhance my reports with interactive filtering options.
---

# Paste values into a button slicer for faster filtering

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The **Paste** feature lets you quickly apply multiple selections to a button slicer by pasting a prepared list, speeding filtering and reducing missed items. You can copy values from sources like Excel or email, and the slicer matches and selects them at once—saving time on large or precise analyses.

Pasting values eliminates the need to manually select each option one by one. This functionality streamlines the filtering process, especially when working with large datasets or predefined lists. This approach not only saves time but also reduces the likelihood of overlooking values, making it ideal for scenarios where precision and speed are essential.

## Prerequisites

Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/en-us/download/details.aspx?id=58494) installed before proceeding.

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). After downloading the file, let's get started:

1. Launch **Power BI Desktop**.
1. On the left-side navigation pane, select **Open**; otherwise, on the top-left of the window, select **File > Open**.
1. Locate and select your copy of the **Retail Analysis Sample PBIX**. The file opens in report view, ready for you to begin.
1. Before proceeding, make sure you created a button slicer as described in the [Let's create a button slicer](/power-bi/visuals/power-bi-visualization-button-slicer#lets-create-a-button-slicer) section.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-get-started.png" alt-text="Screenshot of button slicer visual overview in Power BI Desktop." lightbox="media/button-slicer-visual-highlights/button-slicer-get-started.png":::

> [!NOTE]
> Sharing your report with a Power BI colleague requires that you both have an individual Power BI Pro license or that you save the report in Premium capacity.

## Paste values into a button slicer

1. To paste a set of values into a button slicer, begin by opening Excel. Create a new worksheet and enter your desired list of values. For instance, type "Brad Sutton" in cell A1, "Carlos Grilo" in cell A2, and "Tina Lassila" in cell A3. Your worksheet should look like:

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-worksheet.png" alt-text="Screenshot of Excel worksheet with sample names entered for button slicer." lightbox="media/button-slicer-visual-highlights/button-slicer-worksheet.png":::

1. After entering the names in Excel, highlight the cells containing your list (A1 to A3) and copy them. Next, return to Power BI, select your button slicer on the report canvas, and use **Ctrl-V** to paste the copied values, or use the slicer's ellipsis menu to paste the copied values. Each button with the matching names appears selected within the slicer, enabling straightforward filtering and analysis.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-paste.png" alt-text="Screenshot of button slicer after pasting values showing selected names." lightbox="media/button-slicer-visual-highlights/button-slicer-paste.png":::

Pasting values into the button slicer streamlines filtering by quickly selecting multiple relevant entries at once, saving time and effort during data analysis.

## Related content

- [Create a button slicer](power-bi-visualization-button-slicer.md)
- [Use visual highlights](button-slicer-visual-highlights.md)
- [Use conditional formatting](button-slicer-conditional-formatting.md)
- [Button slicer considerations and limitations](power-bi-visualization-list-slicer-considerations-limitations.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
