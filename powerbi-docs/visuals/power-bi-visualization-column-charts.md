---
title: Create and use column charts in Power BI
description: Learn to create and customize column charts in Power BI Desktop and Power BI service. Master drill-down, zoom, cross-filtering, and conditional formatting to enhance your reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: miguelmyers
ms.custom: sample-Retail-Analysis
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
LocalizationGroup: Visualizations
ai-usage: ai-assisted
ms.date: 11/04/2025
#customer intent: As a Power BI user, I want to learn about column charts, including how to create and customize them, so I can enhance my reports with effective data visualizations and interactive features.
---
# Create and use column charts in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A column chart, commonly referred to as a vertical bar graph, is a visual tool that displays and compares numerical data across different categories. Each column in the chart corresponds to a specific category, and the height of the column represents the associated value. This design makes it easy to compare values across various categories or over distinct time periods. You often see column charts in business and finance to show key financial metrics, like revenue, expenses, and profits. They're also valuable in marketing for showing data points such as sales figures, market share, and customer demographics.

Column charts balance simplicity and flexibility, making them great for both new users and advanced report builders. You can use drill functionality, zoom sliders, cross-filtering, and conditional formatting to enhance your data exploration experience.

Depending on the unique needs of your analysis, you can choose from three distinct types of column charts:

- **Stacked column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/stacked-column-chart-icon.png":::
- **Clustered column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/clustered-column-chart-icon.png":::
- **100% Stacked column chart** :::image type="icon" source="../includes/media/power-bi-visualization-column-charts/100-percent-stacked-column-chart-icon.png":::

## Prerequisites

In the following guide, you use the [Retail Analysis Sample PBIX file](https://download.microsoft.com/download/9/6/D/96DDC2FF-2568-491D-AAFA-AFDD6F763AE3/Retail%20Analysis%20Sample%20PBIX.pbix). Use the steps for your environment:

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

[!INCLUDE[sharing-license-requirements](../includes/share-license-requirements.md)]

## Create a column chart

In this quick three-step guide, you create a column chart in Power BI.

1. From the **Visualizations** pane, select any **Column chart** icon. Power BI adds a visual placeholder to the canvas.
1. To add data to your column chart, choose fields and measures from the **Data pane**. You can select data from within the **Data pane** itself, drag them to the field wells within the **Visualizations pane**, or drag directly to the placeholder on the canvas.

   To create column charts, you need one of the following combinations:

   - At least one data field on the **X-axis** and one measure on the **Y-axis**.
   - At least one data field on the **X-axis**, one measure on the **Y-axis**, and exactly one data field in the **Legend**.
   - One or more data fields on the **X-axis** and multiple measures on the **Y-axis**. Keep in mind that column charts with multiple measures don't support a **Legend**.

   The specific combination you choose depends on the data you're working with and the insights you want to glean from your chart. As a visual guide, in the following example, you select one data field on the **X-axis** and one measure on the **Y-axis**.

1. To customize your column chart, select the **Format visual** icon in the **Visualizations pane**. This icon grants you access to all available formatting options under the **Visual** tab and the **General** tab. You can tailor the chart's appearance and functionality to your specific requirements.

You successfully created a column chart with Power BI. In the following sections, you explore advanced interactive features like drill functionality, zoom sliders, cross-filtering and cross-highlighting, and conditional formatting.

## Drill into column chart data

Power BI's column chart visuals offer more than just a snapshot of your data; they're built for exploration. With **drill** functionality, you can move seamlessly between high-level summaries and detailed views, uncovering insights layer by layer. Whether you're tracking sales variance across months or comparing performance by district manager, drilling into your data helps you spot patterns, identify outliers, and make informed decisions.

In this section, you learn how to set up a column chart with a date hierarchy and use the four drill actions to explore your data interactively.

To enable drill functionality, prepare the column chart with a true date hierarchy.

1. With the column chart selected on your report canvas, go to the **Visualizations** pane and find the **X-axis** field well on the **Build visual** section. Select **x** to remove **FiscalMonth** from the X-axis field well. Then, from the **Data** pane, locate **Time \> Month**, and drag the **Date Hierarchy** field into the X-axis field well. Next, remove **DM** (District Manager) from the **Legend** field well.

   :::image type="content" source="media/power-bi-visualization-column-charts/column-drill.png" alt-text="Screenshot of a Power BI column chart with four drill icons visible above the chart: Drill up, Drill down, Next level, and Expand all levels." lightbox="media/power-bi-visualization-column-charts/column-drill.png":::

1. After updating the column chart, you see four **drill icons**, either above the top-left corner of the column chart visual, or below the bottom-right corner of the column chart visual, depending on where the visual is located on the report canvas and what space is available around the visual.

   - **Drill up** (go up to a higher level in the hierarchy)
   - **Click to turn on Drill down** (enables drill mode)
   - **Go to the next level in the hierarchy** (expands all data points to the next level)
   - **Expand all down one level in the hierarchy** (shows next lower-level data grouped under each top-level category)

1. To begin, use **Drill up**. With each click of the **upward arrow icon** you drill up to a higher level in the hierarchy. For example, if you're viewing data by month, with each click, the drill up mode takes you first to the quarter level and then to the year level.
1. Next, activate the **Drill down** mode by selecting the **downward arrow icon** labeled **Click to turn on drill down**. Once selected, a message appears indicating **Drill mode is on: Click a data point to drill**. This mode allows you to select individual columns in the visual to drill into more detailed data.
1. To drill down into a data point, select a column. Once selected, the chart updates to show the next level in the hierarchy for that specific data point. For example, selecting **Qtr 1** reveals **January, February, March**.
1. Before the next step, select the **upward arrow icon** to drill back up to the next higher level in the hierarchy. Now, use **Go to the next level in the hierarchy** by selecting the **double downward arrow icon** to expand all data points to the next level in the hierarchy. This action shows the next level (for example, all months across all quarters) without needing to select each column individually.
1. Finally, select the **upward arrow icon** again to drill back up to the next higher level in the hierarchy. To use **Expand all down one level in the hierarchy**, select the fourth icon to expand next lower-level data grouped under each top-level category. This view maintains grouping while showing the next level of detail.

Drill features in column charts give you the flexibility to explore your data with precision and clarity, helping to uncover trends, identify anomalies, and support better decision-making.

## Use the zoom slider

Power BI offers interactive features that help you explore data more intuitively. One such feature is the **Zoom slider**, which allows you to focus on specific ranges of data within a visual. By enabling zoom sliders on a column chart, you can dynamically adjust the visible data range along the X and Y axes, making it easier to analyze trends, spot anomalies, and compare values in detail.

In this section, you learn how to enable and configure the Zoom slider in a column chart.

To use the **Zoom slider** feature, first prepare the column chart for zoom slider functionality.

1. With the column chart selected on your report canvas, go to the **Visualizations** pane and find the **X-axis** field well on the **Build visual** section. Select **x** to remove **FiscalMonth** from the X-axis field well. Then, from the **Data** pane, locate **Store \> StoreNumber**, and drag the **StoreNumber** field into the X-axis field well. Next, remove **DM** (District Manager) from the **Legend** field well.

   :::image type="content" source="media/power-bi-visualization-column-charts/column-slider.png" alt-text="Screenshot of Power BI Visualizations pane with X-axis type set to Continuous under Format visual tab, showing the Zoom slider card toggled On." lightbox="media/power-bi-visualization-column-charts/column-slider.png":::

1. While still on the **Visualizations** pane, select **Format visual**. Under the **Visual** tab, expand the **X-axis** card and change the **Type** from **Categorical** to **Continuous**. You need to make this change because Continuous axes allow for smooth scaling and zooming, whereas Categorical axes treat each value as a distinct category.
1. Next, collapse the **X-axis** card, and expand the **Zoom slider** card. To activate the settings for the Zoom slider, toggle the Zoom slider to the **On** position and you see other toggles for:

   - X-axis (On/Off)
   - Y-axis (On/Off)
   - Slider labels (On/Off)
   - Slider tooltips (On/Off)

   After enabling the **Zoom slider**, ensure that both X-Axis and Y-axis toggles are **On**. The chart visual updates to show sliders along both axes, allowing you to adjust the visible data range.

1. Now that the **Zoom slider** is enabled, interact with the column chart visual by dragging the handles at either end of the slider on the X or Y axis. The chart dynamically updates to show only the data points within the selected range, allowing you to focus on specific stores or sales values without changing filters or reconfiguring the chart.
1. Go back to the **Zoom slider** card in the **Visualizations** pane and toggle the **Slider tooltips** to the **On** position. Now, when dragging the slider handles, a tooltip appears, dynamically showing the current value of your position on the slider as you move the slider handles.
1. Lastly, go back to the **Zoom slider** card in the **Visualizations** pane and toggle the **Slider labels** to the **On** position. When activated, a **new row of labels appears, next to the sliders**, showing the **full range of values** available on the axes. These labels are static and represent the entire axis range, not just the selected portion.

   Slider labels provide context for the zoomed-in view by showing you the full scope of the data. This feature makes it easier to understand what portion of the data is currently visible and how it relates to the overall dataset.

The Zoom slider adds a layer of flexibility to your visuals, allowing you to focus on specific data ranges without changing filters or modifying the report structure. It's a simple yet powerful way to explore large datasets with precision.

## Explore cross-filter and cross-highlight

Power BI enables rich interactivity between visuals through cross-filtering and cross-highlighting. These features allow you to select a data point in one visual and instantly see how it affects other visuals on the report page. This interaction helps you uncover relationships, trends, and outliers across multiple dimensions of your data.

**Cross-filtering** helps you focus on relevant data by selecting a value in one visual, which temporarily hides unrelated data in others. For example, clicking a column in a column chart filters the connected visuals, like scatter charts or pie charts, to show only matching data. This feature makes it easier to explore relationships and test scenarios without applying permanent filters to your report. To reset the visuals and remove the filtering or highlighting effect, you can either deselect the item or select an empty space within the visual.

**Cross-highlighting** lets you emphasize related data across visuals without hiding anything. When you select a data point, like a bar in a chart, connected visuals highlight the matching data while dimming the rest. This feature makes it easy to see how one value contributes to the whole, helping you compare relationships across visuals while keeping full context visible.

In this section, you learn how to enable and use cross-filter and cross-highlight features. Using a column chart and a pie chart as examples, this guide walks you through how visuals respond to user selections and how to configure interaction settings to control this behavior.

To use and understand the difference between cross-filter and cross-highlight features, prepare the visuals and enable interactions.

1. Begin by selecting the column chart and then remove **District Manager** from the **Legend** field well under the **Build visual** section of the **Visualizations** pane. This step simplifies the chart, making it easier to observe how selections affect other visuals.

   Next, on the Power BI menu bar, select the **Format** ribbon, then select **Enable interactions**. Interaction icons (**Filter**, **Highlight**, and **None**) appear on your visual, allowing you to control how each visual responds to selections.

   :::image type="content" source="media/power-bi-visualization-column-charts/column-cross.png" alt-text="Screenshot of Power BI showing a column chart with a selected month column highlighted and other columns dimmed. Interaction icons are visible on the pie chart." lightbox="media/power-bi-visualization-column-charts/column-cross.png":::

1. To demonstrate the **Cross-filter** feature, with the column chart still selected, select the **Filter** icon on the pie chart visual to ensure it only shows data related to the selected column in the column chart. Then, select an individual month column in the column chart visual to immediately filter all other visuals, including the pie chart, showing only data related to the selected month. Unselected columns remain visible but are dimmed, helping you see what's included and excluded.

   Try clicking on different monthly columns to observe how visuals update. This step demonstrates how selections dynamically filter visuals. When ready, you can either deselect the item or select an empty space within the column chart.

1. To demonstrate the **Cross-highlight** feature, with the column chart still selected, select the **Highlight** icon on the pie chart visual to ensure it only shows data related to the selected column in the chart. Once again, selecting an individual month column on the column chart visual shows how the pie chart now highlights the relevant slice while dimming the rest, instead of filtering out unrelated data. It helps you compare proportions without losing context.

   Try clicking on different monthly columns to observe how visuals update. This step demonstrates how selections dynamically highlight the relevant data in other visuals. Again, when ready, either deselect the item or select an empty space within the column chart.

1. Now, try cross-filtering and cross-highlighting again, but begin by selecting the pie chart visual.

   With the pie chart visual selected, demonstrate the **Cross-filter** feature by selecting the **Filter** icon on the column chart visual to ensure it only shows data related to the selected slice in the pie chart. Then, select a slice in the pie chart to immediately filter all other visuals, including the column chart, showing only data related to the selected slice. Notice the unselected slice remains visible but is dimmed.

   When ready, deselect the slice or select an empty space within the pie chart.

1. Once again, with the pie chart visual selected, demonstrate the **Cross-highlight** feature by selecting the **Highlight** icon on the column chart visual to ensure it highlights the data related to the selected slice in the pie chart. Then, select a slice in the pie chart to immediately highlight the data in the column chart to show the data related to the selected slice, while other data remains visible but is dimmed.

By enabling cross-filtering and cross-highlighting, you turned a static report into a dynamic, interactive experience with exploration tools. These features help you make connections across visuals, compare data points, and dive deeper into the story behind the numbers.

## Use conditional formatting

Conditional formatting in Power BI lets you visually enhance your charts by applying color based on data values. This formatting makes it easier to spot trends, outliers, and performance indicators at-a-glance. In this section, you learn how to apply three different formatting styles (**Gradient**, **Rules**, and **Field value**) to a column chart. Each style offers a unique way to bring your data to life and improve readability.

To better demonstrate the **Conditional formatting** features, first select the column chart and simplify the visual by removing **District Manager** from the **Legend** field and replacing **FiscalMonth**, in the **X-axis** field well, with **Territory** from the **Store** field. This change helps demonstrate clearer comparisons across regions and makes the conditional formatting more visually distinct.

:::image type="content" source="media/power-bi-visualization-column-charts/column-formatting.png" alt-text="Screenshot of Power BI Conditional formatting dialog with Gradient style selected and Total Sales Variance field chosen for color gradient application." lightbox="media/power-bi-visualization-column-charts/column-formatting.png":::

### Apply conditional formatting with gradients

1. With the **Column chart** selected, go to the **Format visual** tab in the **Visualizations** pane. Under the **Visual** tab, expand the **Columns** section and select the **Conditional formatting** icon (**fx**) next to **Color**. This action opens the Conditional formatting dialog window where you can choose how to apply colors.
1. With the Conditional formatting dialog window open, set the **Format style** to **Gradient**. In the **What field should we base this on** dropdown, ensure **Total Sales Variance** is selected. This selection tells Power BI to apply the color gradient based on the values in the *Total Sales Variance* field.

   Next, define the gradient color range:

   - For **Minimum**, choose **red** (**\#D64550, Theme color 8**) to represent lower values.
   - For **Maximum**, keep the default **blue**, which represents the higher values.

   This gradient visually distinguishes performance levels across columns. Lower values are shaded red, and higher values are shaded blue. Once you configure the settings, select **OK** to apply the formatting.

The column chart updates to reflect the new gradient color formatting. Each column is now shaded based on its **Total Sales Variance** value—columns with lower variance appear in red, while those with higher variance shift toward blue. This visual cue makes it easier to quickly identify which categories are underperforming or excelling, enhancing the chart's readability and impact.

Conditional formatting using **gradients** in Power BI adds visual depth to your column charts by applying color scales based on data values. This technique helps users quickly identify performance trends and outliers, making your visuals more intuitive and impactful.

### Apply rules-based conditional formatting

1. In this next step, you'll apply formatting based on **Rules**. To start, go back to the **Color** setting under Columns on the **Format visual** tab in the **Visualizations** pane, and select the **fx** icon again to reopen the Conditional formatting dialog.
1. With the Conditional formatting dialog window open, set the **Format style** to **Rules**. In the **What field should we base this on** dropdown, start typing **status**, then select **Status** under **Sales \> This Year Sales**. This selection tells Power BI to apply formatting rules based on the values in the *Status* field.

   Now, define the conditional formatting rules:

   - **First rule:** If value **\> = 0** **Percent**, and **\< 0 Number** then **blue** (*\#118DFF*).
   - **Second rule**: If value **\> = 0** **Number** and **\< 100 Percent** then **red** (*\#D64550*).

   These rules allow you to assign specific colors to columns based on logical conditions, helping to highlight performance thresholds or *status* categories. Once the rules are set, select **OK** to apply the formatting.

The column chart updates to reflect the rules-based conditional formatting. Columns are now colored according to the defined conditions, with those meeting the first rule appearing in blue, while those matching the second rule appear in red. This targeted color coding makes it easier to identify specific performance ranges or statuses at a glance.

**Rules-based** conditional formatting gives you control over how your data is displayed by letting you define specific conditions and assign colors accordingly. It's a great way to highlight key thresholds or categories, making your visuals more purposeful and easier to interpret.

### Apply field value formatting

Finally, apply formatting based on **Field value**. First, create a color measure to use as a Field value that dynamically assigns a color based on sales performance.

1. In the **Data pane**, select the ellipsis next to **Store \> Territory** and select **New measure**. Then in the formula bar, enter the following formula:

   **Color status = IF(\[This Year Sales\]\>2000000, "#200AE8", "#F00938")**

   When ready, select the **green checkmark** or press **Enter** to **save**.

1. Return to the **Color** setting under Columns on the **Format visual** tab in the **Visualizations** pane and select the **fx** icon again to reopen the Conditional formatting dialog.

   With the Conditional formatting dialog window open, ensure the Format style is set to **Field value**. In the **What field should we base this on** dropdown, start typing **Color status** in the field selector and choose the newly created **Color status** measure found under the **Store** section. This step uses your custom measure to color each column based on its sales value, giving you full control over the logic. Once you configure the settings, select **OK** to apply the field value conditional formatting.

The column chart updates to reflect the field value conditional formatting. Each column, representing **Total Sales Variance** across different **FiscalMonths** and **District Managers,** is now colored dynamically based on the logic in the **Color status** measure you created. Columns with higher sales performance appear in **blue**, while those with lower performance are shaded **red**. This custom coloring makes it easy to visually compare performance trends across time periods and management areas at a glance.

**Field value** conditional formatting lets you use custom measures to drive the colors in your chart. This flexible approach allows you to tailor the visual experience based on your own business logic, making your charts more dynamic and meaningful.

Whether you're using **gradients**, **rules**, or **field values**, conditional formatting in Power BI helps bring your data to life by using color to reflect data values. Each approach helps surface insights that might otherwise go unnoticed.

## Considerations and limitations

As a Power BI user, it's helpful to be aware of any column chart considerations and limitations when creating effective and visually appealing data visualizations.

Understanding the considerations and limitations allows you to make informed decisions and use the full potential of Power BI column charts. Whether you're a novice or an experienced user, this section aims to enhance your chart-building experience by keeping you up-to-date with practical insights and tips for any known issues.

This section provides an updated list of known column chart considerations and limitations, designed to help you navigate the nuances of column charts in both Power BI Desktop and the Power BI service.

- **X-axis**:
  - **Default scrolling position**: In Power BI, when the categorical axis is set as the X-axis, you might find it inconvenient that the scrollbar starts on the left, particularly when displaying date/time values. This issue arises because there's no setting available to control the default scrolling position. It can be problematic when you want to view dates from earliest to latest. Use a continuous axis instead of a categorical axis when working with date/time values. This choice allows for a more intuitive display of data over time, with the scrollbar beginning at the earliest date as expected.
  - **Intervals**: You might want to control intervals for numerical or date/time values on a continuous axis in Power BI. Unfortunately, there are currently no settings available to manage these intervals directly. Power BI automatically determines the intervals on a continuous axis based on the data points visible and the size of the visual container. This automatic adjustment is designed to optimize the display of data within the available space. As of now, there's no workaround to manually set these intervals. You must rely on the automatic interval settings determined by Power BI.
  - **Conditional formatting on X-axis values**: In Power BI, axis colors determined by conditional formatting are currently based on a general value rather than individual categories. This behavior occurs because conditional formatting for axis colors is applied uniformly across all categories. As a result, individual category distinctions aren't reflected in the axis coloration, leading to a less customized visual representation. While Power BI doesn't offer a direct feature to assign conditional formatting to axis colors on a per-category basis, a workaround involves creating a separate data series for each category. You can then format this series individually, allowing for distinct axis colors corresponding to each category's value.
- **Y-axis**:
  - **Intervals**: Power BI users report difficulties in controlling the intervals on the secondary axis. This limitation arises because Power BI currently lacks direct settings to adjust these intervals. Power BI automatically calculates the intervals for the secondary axis, considering the highest and lowest data values along with the visual container's dimensions. This automatic scaling is intended to ensure the most effective use of space and the best possible data representation. There's currently no manual method to override these automatic interval settings. You must adapt to the intervals that Power BI determines to be most suitable for your data visualization needs.
- **Small multiples**:
  - **Hierarchical axis**: In Power BI, when you use small multiples, the hierarchical axis isn't supported. This limitation results in the axis defaulting to a concatenated format. This behavior occurs because small multiples are designed to display separate, distinct data points across multiple charts, and the hierarchical structure isn't maintained when the axis is split into these individual elements.
  - **Data value settings**: When creating small multiples in Power BI, the titles currently miss data value settings such as display units, decimal places, and custom format options. These settings are essential for precise data representation and can't be modified directly within the small multiples feature. This limitation arises because small multiples are designed to compare and contrast trends across multiple charts, and the title formatting options aren't as extensive as those for individual visuals. The absence of these settings can lead to less informative and harder-to-read titles, affecting the overall effectiveness of data visualization. To address this issue, consider modifying these settings at the Model level, where you have more control over the data representation. Alternatively, you can use visual-level formatting to apply custom format strings to individual elements within your report, overriding the default settings where necessary.
- **Columns**:
  - **Series color assignment**: In Power BI, the assignment of [theme colors to series](../create-reports/desktop-report-themes.md#colors-used-by-dynamic-and-static-series-in-visuals) can vary depending on whether the series is static or dynamic. This variation can lead to inconsistencies in color representation across different report views. For detailed and up-to-date information, see the [Series color assignment](power-bi-visualization-troubleshoot.md#series-color-assignment) section of the [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md) article.
- **Report locale**:
  - **Format strings**: In Power BI, certain visual elements don't utilize the model format string for dates to conserve space and present only the necessary detail. For detailed and up-to-date information, see the [Format strings](power-bi-visualization-troubleshoot.md#format-strings) section of the [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md) article.
  - **Display units suffix**: You might encounter a challenge where the display units suffix in Power BI visuals automatically adjusts based on location or system settings. For detailed and up-to-date information, see the [Display units suffix](power-bi-visualization-troubleshoot.md#display-units-suffix) section of the [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md) article.

## Related content

- [Troubleshoot visualizations in Power BI](power-bi-visualization-troubleshoot.md)
- [Combo charts in Power BI](power-bi-visualization-combo-chart.md)
- [Visualizations overview in Power BI](power-bi-visualizations-overview.md)
