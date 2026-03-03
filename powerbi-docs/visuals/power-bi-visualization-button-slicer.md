---
title: Create and Use a Button Slicer
description: Learn how to create, customize, and use button slicers in Power BI Desktop. Filter data interactively with grid layouts, visual highlights, and conditional formatting.
author: julcsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/01/2025
LocalizationGroup: Visualizations
#customer intent: As a Power BI user, I want to learn about the button slicer feature in Power BI Desktop, including how to create and customize it, so I can enhance my reports with interactive filtering options.
---

# Create and use a button slicer

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI, the button slicer is an interactive visual element that allows users to filter data in reports and dashboards, providing an easy and dynamic way to browse and analyze large datasets.

Among the various types of slicers, the button slicer stands out due to its unique properties. It offers customizable button styles, interactive states, conditional formatting for labels, and a grid layout for arranging buttons in rows and columns. Additionally, the button slicer can integrate images, enhancing visual appeal and providing more context.

> [!IMPORTANT]
> Because the button slicer is now generally available, your current experience may differ from the earlier preview experience. However, these changes can be easily reverted by making the updates in the **Format** pane.

These features make the button slicer a powerful tool for creating interactive and visually appealing reports, offering a user-friendly setup and comprehensive formatting options.

## Prerequisites for the example

In the following guide, we're using the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

# [Power BI Desktop](#tab/powerbi-desktop)

> [!IMPORTANT]
> Always make sure you have the [latest version of Power BI Desktop](https://www.microsoft.com/download/details.aspx?id=58494) installed before proceeding.

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

## Create a button slicer

In this quick and easy three-step guide, you create a **Button slicer** in Power BI Desktop. Review the [Prerequisites for the example](#prerequisites-for-the-example) section before following these steps.

1. With the **Retail Analysis Sample PBIX** open, make sure you're on the Overview page by selecting the **Overview** tab. To make room for your button slicer, select and resize the scatter chart by dragging the dark **visualization handles**. Then, with nothing selected on the report canvas, select the **Button slicer** icon in the **Build visual** tab on the **Visualizations** pane to create a new slicer on the report canvas.

   :::image type="content" source="media/button-slicer/button-slicer-icon-highlighted.png" lightbox="media/button-slicer/button-slicer-icon-highlighted.png" alt-text="Screenshot of the Power BI Desktop Overview tab, Visualizations pane, Build visual, and Button slicer icon highlighted, slicer placeholder with resize handles on canvas.":::

1. To add data to the visual, use the **Data** pane. With your slicer selected on the report canvas, go to the Data pane, expand the **District** table, and select **DM** to populate the slicer. The slicer now displays tiles with the district manager names. You can resize the slicer as needed and rearrange the elements on the canvas to your preference. Be careful not to make the slicer too small, which affects the displayed information.

   :::image type="content" source="media/button-slicer/button-slicer-district-highlighted.png" lightbox="media/button-slicer/button-slicer-district-highlighted.png" alt-text="Screenshot of the Data pane, District table, DM selected and highlighted, slicer on canvas displaying  nine tiles with truncated district manager names.":::

1. To customize your slicer, select the **Format visual** icon in the **Visualizations** pane. This icon grants you access to all available format settings. You can tailor the slicer's appearance and functionality to your specific requirements.

## Use visual highlights

Highlighting in Power BI enhances report interactivity by letting users focus on selected data points across visuals. When used with the button slicer, it draws attention to selected values and updates other visuals in context.

As you interact with various elements like pie charts or tables, the corresponding buttons in the slicer stay highlighted and easy to identify, while the buttons not related to your selection become dimmed or less prominent.

Understanding how highlighting impacts the button slicer prepares you to create more engaging and insightful reports, making it easier for viewers to analyze filtered data and uncover meaningful trends.

In the following steps, you learn how to set up and utilize highlighting with the button slicer in Power BI, ensuring your report offers a seamless and intuitive data exploration experience.

1. With the button slicer still selected on your report canvas, look to the **Visualizations pane** and choose the **Build visual** tab. Here, you find the **Highlight label** field well. From the **Data pane**, drag the 'Value' measure found under Sales > This Year Sales, to the **Highlight label** field well. Once added, each button in your slicer displays the corresponding sales value as a label below the main callout value, making it easy to see sales figures for each selection.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-highlight-label.png" alt-text="Screenshot of Power BI showing a button slicer with highlight labels added below each button value." lightbox="media/button-slicer-visual-highlights/button-slicer-highlight-label.png":::

1. Now that you've added a highlight label to your button slicer, let's explore how it responds when interacting with other visuals in your report. On your Overview page, locate the "This Year Sales by Chain" pie chart. Select the segment labeled "Lindseys" within the pie chart. In the button slicer, only the buttons related to the Lindseys series remain highlighted, while all other buttons become inactive or greyed out. This visual cue helps you quickly identify which selections are relevant to your chosen data point.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-highlight-relevant.png" alt-text="Screenshot of Power BI showing only Lindseys-related buttons highlighted after selecting a pie chart segment." lightbox="media/button-slicer-visual-highlights/button-slicer-highlight-relevant.png":::

By following these steps, you enhance your Power BI report with an interactive slicer that makes data exploration more intuitive and insightful.

## Use conditional formatting

Conditional formatting in Power BI's button slicer lets you customize the appearance of slicer items based on dynamic data conditions. Whether you want to highlight top performers, flag exceptions, or align visuals with business logic, this feature enhances the user experience and helps guide users' attention to the most relevant selections. It adds clarity, improves interactivity, and helps create a more intuitive and impactful interface.

In this section, you learn how to apply conditional formatting to the button slicer by using a practical example. With this knowledge, you can further tailor your reports with precision and impact.

1. Select the button slicer visual on your report canvas. This action ensures that any formatting changes you apply are specific to that slicer.
1. In the **Visualizations pane**, select the **Format visual icon**. Make sure you're in the **Visual tab**, then scroll down to locate the **Buttons** card to reveal further customization options.
1. Within the **Buttons** card, locate and expand the **Background** group to display the **Fill color** control, along with an 'fx' button beside the color picker.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-conditional-formatting.png" alt-text="Screenshot of conditional formatting background color rules dialog trigger in button slicer settings." lightbox="media/button-slicer-visual-highlights/button-slicer-conditional-formatting.png":::

1. Select the 'fx' button to launch the conditional formatting dialog window. Ensure the Format style is set to Rules. In the **What field should we base this on** dropdown, select **Status measure** for the **This Year Sales**, and then define the rules as follows:

   - First rule: **\>= 0 Percent** and **\< 0 Number** then **red** (*\#D64550*).
   - Second rule: **\>= 0 Number** and **\<=** **100 Percent** then **blue** (*\#118DFF*).

   Once the rules are defined, select **OK** to apply the desired formatting based on your conditions.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-format-fields.png" alt-text="Screenshot of conditional formatting rules dialog for button slicer background settings in Power BI Desktop." lightbox="media/button-slicer-visual-highlights/button-slicer-format-fields.png":::

1. The district managers associated with a negative sales status are now displayed in red, while those with a positive status appear in blue. This color coding makes it easier and quicker for users to identify key information.

    :::image type="content" source="media/button-slicer-visual-highlights/button-slicer-formatting-applied.png" alt-text="Screenshot of button slicer displaying conditional formatting colors for sales status." lightbox="media/button-slicer-visual-highlights/button-slicer-formatting-applied.png":::

Conditional formatting in button slicers helps you visually emphasize important data points, making your reports more intuitive and impactful. It's a simple way to guide users toward meaningful selections and improve overall report clarity.

The button slicer supports conditional formatting for multiple elements, including callout values, callout labels, button backgrounds, button borders, and button effects.

## Paste values to select

The Button slicer supports pasting values to quickly select multiple items at once. Copy values from external sources like Excel or Notepad, with each value on its own line, and paste them directly into the slicer to apply matching selections.

For detailed instructions on using the paste feature, see [Paste values in slicers](power-bi-visualization-slicers.md#paste-values-in-slicers).

## Considerations and limitations

This section lists the key considerations and limitations of the Button slicer in Power BI Desktop so you can anticipate filtering behavior and avoid confusion.

- **Sort buttons**:
  - Sorting via the ellipsis menu is limited to **Value**. **Label** sorting is currently unavailable.
- **Single select toggle**:
  - The **Single select** toggle permits multiple selections only when the **Force selection** toggle is *off*. To select multiple options, hold **CTRL** and select other buttons.
  - If the **Single select** and **Force selection** toggles are *on*, only one option can be selected at a time. Selecting **CTRL** + other buttons isn't allowed.
- **Force selection toggle**:
  - When the **Force selection** toggle is *on*, the button slicer ensures that one item is always selected. This requires **Single select** toggle to also be *on*.
  - If a user applies another filter that hides the currently selected button, the slicer might look unselected. However, the previously selected (but now hidden) value continues to affect other visuals. Selected items are never cleared, even if they're temporarily removed from the current data due to filtering.
  - Currently, the slicer doesn't automatically select the first visible option when the forced selection is *on* and the selected button is filtered out. Instead, the hidden selection remains active until the user chooses another visible option.

## Related content

- [List slicer](power-bi-visualization-list-slicer.md)
- [Input slicer](power-bi-visualization-input-slicer.md)
- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
