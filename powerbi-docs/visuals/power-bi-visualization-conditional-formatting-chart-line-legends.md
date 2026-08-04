---
title: Apply conditional formatting to chart lines and legends in Power BI
description: Learn how to apply conditional formatting to chart lines, line segments, markers, and legend colors in Power BI reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 08/03/2026
LocalizationGroup: Visualizations
ai-usage: ai-assisted
#customer intent: As a Power BI report creator, I want to conditionally format chart lines and legends so that colors respond to data and remain consistent across my report.
---

# Apply conditional formatting to chart lines and legends in Power BI

**Applies to:** [!INCLUDE [applies-to-desktop-service](../includes/applies-to-version/desktop-service.md)]

Conditional formatting lets you control chart colors by using gradients, rules, or field values. Use it to emphasize important lines and data points, show changes within a line, or keep category colors consistent across report visuals.

This article shows you how to apply conditional formatting in six common scenarios. For an overview of supported visuals and format styles, see [Conditional formatting in Power BI visuals](power-bi-visualization-conditional-formatting.md).

## Prerequisites

To follow these examples, you need:

- Edit access to a report in Power BI Desktop or the Power BI service.
- A chart that supports conditional formatting for its lines, markers, slices, bars, or columns.
- A numeric field for gradient formatting, or a text field or measure that returns a color name, hexadecimal code, or theme color name for field value formatting.
- Power BI Desktop, or edit access to an existing semantic model in the Power BI service, if you want to create the example data by using the Tabular Model Definition Language (TMDL) script.

## Set up the examples with TMDL

You can create the tables, measures, and field parameter used in these examples by applying a TMDL script. Apply the script to a blank file in Power BI Desktop or to an existing semantic model by using **TMDL View (Preview)** in the Power BI service or Fabric portal. For more information about applying scripts, see [Use TMDL view in Power BI](../transform-model/desktop-tmdl-view.md).

> [!WARNING]
> This `createOrReplace` script overwrites any tables in the semantic model that have the same names as tables in the script.

To create the example model:

1. Open a blank file in Power BI Desktop or an existing semantic model in the Power BI service.
1. Open **TMDL view**.
1. Select the code editor, and then paste the following script.
1. Select **Apply**.

```tmdl
createOrReplace

    model Model
        culture: en-US
        defaultPowerBIDataSourceVersion: powerBI_V3
        sourceQueryCulture: en-US
        valueFilterBehavior: independent
        dataAccessOptions
            legacyRedirects
            returnErrorValuesAsNull

        /// Sample monthly sales, units, and cost data by year used to demonstrate line trends and measure-based color formatting.
        table 'Trending data'

            /// Returns total monthly sales in the current filter context.
            measure Sales = sum('Trending data'[Monthly sales])
                formatString: \$#,0;(\$#,0);\$#,0

                annotation PBI_FormatHint = {"currencyCulture":"en-US"}

            /// Returns total units sold in the current filter context.
            measure 'Units sold' = sum('Trending data'[Units])
                formatString: #,0

            /// Returns total cost of goods sold in the current filter context.
            measure COGS = sum('Trending data'[Cost])
                formatString: \$#,0.###############;(\$#,0.###############);\$#,0.###############

            /// Returns the latest year in the current filter context for emphasizing the most recent line with conditional formatting.
            measure 'Latest year' = max('Trending data'[Year])
                formatString: 0

            /// Calendar year associated with each monthly observation.
            column Year
                formatString: 0
                summarizeBy: none
                isNameInferred
                sourceColumn: [Year]

                annotation SummarizationSetBy = User

            /// Numeric month from 1 through 12 used to sort the Month labels chronologically.
            column MonthNum
                isHidden
                formatString: 0
                summarizeBy: sum
                isNameInferred
                sourceColumn: [MonthNum]

                annotation SummarizationSetBy = Automatic

            /// Abbreviated month label used on chart axes and sorted by MonthNum.
            column Month
                summarizeBy: none
                isNameInferred
                sourceColumn: [Month]
                sortByColumn: MonthNum

                annotation SummarizationSetBy = Automatic

            /// Number of units sold in the month; source column for the Units sold measure.
            column Units
                isHidden
                formatString: 0
                summarizeBy: sum
                isNameInferred
                sourceColumn: [Units]

                annotation SummarizationSetBy = Automatic

            /// Cost of goods sold for the month; source column for the COGS measure.
            column Cost
                isHidden
                formatString: 0
                summarizeBy: sum
                isNameInferred
                sourceColumn: [Cost]

                annotation SummarizationSetBy = Automatic

            /// Month-level date used for chronological axes, filtering, and date slicers.
            column Date
                formatString: mmm, yyyy
                summarizeBy: none
                isNameInferred
                sourceColumn: [Date]

                annotation SummarizationSetBy = Automatic
                annotation PBI_FormatHint = {"isCustom":true}

            /// Sales amount for the month; source column for the Sales measure.
            column 'Monthly sales'
                isHidden
                formatString: 0
                summarizeBy: sum
                isNameInferred
                sourceColumn: [Monthly sales]

                annotation SummarizationSetBy = Automatic

            partition 'Trending data' = calculated
                mode: import
                source =
                        ADDCOLUMNS(
                            DATATABLE(
                                "Year", INTEGER,
                                "MonthNum", INTEGER,
                                "Month", STRING,
                                "Monthly sales", INTEGER,
                                "Units", INTEGER,
                                "Cost", INTEGER,
                                {
                                    { 2023, 1, "Jan", 53000, 1060, 32860 },
                                    { 2023, 2, "Feb", 43000, 860, 26660 },
                                    { 2023, 3, "Mar", 42000, 840, 26040 },
                                    { 2023, 4, "Apr", 61500, 1230, 38130 },
                                    { 2023, 5, "May", 40500, 810, 25110 },
                                    { 2023, 6, "Jun", 80500, 1610, 49910 },
                                    { 2023, 7, "Jul", 59500, 1190, 36890 },
                                    { 2023, 8, "Aug", 49500, 990, 30690 },
                                    { 2023, 9, "Sep", 45000, 900, 27900 },
                                    { 2023, 10, "Oct", 82500, 1650, 51150 },
                                    { 2023, 11, "Nov", 43500, 870, 26970 },
                                    { 2023, 12, "Dec", 79500, 1590, 49290 },
                                    { 2024, 1, "Jan", 57500, 1150, 35650 },
                                    { 2024, 2, "Feb", 47000, 940, 29140 },
                                    { 2024, 3, "Mar", 45500, 910, 28210 },
                                    { 2024, 4, "Apr", 67000, 1340, 41540 },
                                    { 2024, 5, "May", 44000, 880, 27280 },
                                    { 2024, 6, "Jun", 87500, 1750, 54250 },
                                    { 2024, 7, "Jul", 64500, 1290, 39990 },
                                    { 2024, 8, "Aug", 53500, 1070, 33170 },
                                    { 2024, 9, "Sep", 48500, 970, 30070 },
                                    { 2024, 10, "Oct", 89500, 1790, 55490 },
                                    { 2024, 11, "Nov", 47500, 950, 29450 },
                                    { 2024, 12, "Dec", 86500, 1730, 53630 },
                                    { 2025, 1, "Jan", 62500, 1250, 38750 },
                                    { 2025, 2, "Feb", 51000, 1020, 31620 },
                                    { 2025, 3, "Mar", 49000, 980, 30380 },
                                    { 2025, 4, "Apr", 72500, 1450, 44950 },
                                    { 2025, 5, "May", 47500, 950, 29450 },
                                    { 2025, 6, "Jun", 95000, 1900, 58900 },
                                    { 2025, 7, "Jul", 69500, 1390, 43090 },
                                    { 2025, 8, "Aug", 58000, 1160, 35960 },
                                    { 2025, 9, "Sep", 52500, 1050, 32550 },
                                    { 2025, 10, "Oct", 97000, 1940, 60140 },
                                    { 2025, 11, "Nov", 51500, 1030, 31930 },
                                    { 2025, 12, "Dec", 94000, 1880, 58280 },
                                    { 2026, 1, "Jan", 68000, 1360, 42160 },
                                    { 2026, 2, "Feb", 55500, 1110, 34410 },
                                    { 2026, 3, "Mar", 53500, 1070, 33170 },
                                    { 2026, 4, "Apr", 79000, 1580, 48980 },
                                    { 2026, 5, "May", 52000, 1040, 32240 },
                                    { 2026, 6, "Jun", 103000, 2060, 63860 },
                                    { 2026, 7, "Jul", 75500, 1510, 46810 },
                                    { 2026, 8, "Aug", 63000, 1260, 39060 },
                                    { 2026, 9, "Sep", 57500, 1150, 35650 },
                                    { 2026, 10, "Oct", 105500, 2110, 65410 },
                                    { 2026, 11, "Nov", 56000, 1120, 34720 },
                                    { 2026, 12, "Dec", 102500, 2050, 63550 }
                                }
                            ),
                            "Date", DATE ( [Year], [MonthNum], 1 )
                        )

        /// Generated time-series values with positive and negative spikes used to demonstrate conditional formatting for line segments, shading, and markers.
        table 'Spikes and Dips'

            /// Returns the theme positive color for the maximum selected value, the theme negative color for the minimum, and transparent for all other markers.
            measure 'Min and max marker' =
                    VAR _maxValue =
                        CALCULATE ( MAX ( 'Spikes and Dips'[Value] ), ALLSELECTED () )
                    VAR _minValue =
                        CALCULATE ( MIN ( 'Spikes and Dips'[Value] ), ALLSELECTED () )
                    VAR _dataPoint =
                        SUM ( 'Spikes and Dips'[Value] )
                    RETURN
                        SWITCH (
                            TRUE (),
                            _dataPoint = _maxValue, "good",
                            _dataPoint = _minValue, "bad",
                            "#FFFFFF00"
                        )

            /// Sequential period number used as the x-axis for the generated line series.
            column Period
                formatString: 0
                summarizeBy: none
                isNameInferred
                sourceColumn: [Period]

                annotation SummarizationSetBy = User

            /// Generated value containing typical observations and deliberate positive and negative spikes.
            column Value
                formatString: 0
                summarizeBy: sum
                isNameInferred
                sourceColumn: [Value]

                annotation SummarizationSetBy = Automatic

            partition 'Spikes and Dips' = calculated
                mode: import
                source =
                        SELECTCOLUMNS (
                            ADDCOLUMNS (
                                GENERATESERIES ( 1, 150, 1 ),
                                "ValueCol",
                                    VAR p = [Value]
                                    RETURN
                                        SWITCH (
                                            TRUE (),
                                            p >= 30 && p <= 32, RANDBETWEEN ( 50, 80 ),
                                            p >= 20 && p <= 23, RANDBETWEEN ( -40, -30 ),
                                            RANDBETWEEN ( 1, 10 )
                                        )
                            ),
                            "Period", [Value],
                            "Value", [ValueCol]
                        )

        /// Field parameter that switches among Units sold, Sales, and COGS and assigns a consistent color to each measure.
        table Parameter

            /// Display label for the measure selected through the field parameter.
            column Parameter
                summarizeBy: none
                sourceColumn: [Value1]
                sortByColumn: 'Parameter Order'

                relatedColumnDetails
                    groupByColumn: 'Parameter Fields'

                annotation SummarizationSetBy = Automatic

            /// Internal field reference that identifies the measure used by each field parameter option.
            column 'Parameter Fields'
                isHidden
                summarizeBy: none
                sourceColumn: [Value2]
                sortByColumn: 'Parameter Order'

                extendedProperty ParameterMetadata = {"version":3,"kind":2}

                annotation SummarizationSetBy = Automatic

            /// Numeric sort order for the field parameter options.
            column 'Parameter Order'
                isHidden
                formatString: 0
                summarizeBy: sum
                sourceColumn: [Value3]

                annotation SummarizationSetBy = Automatic

            /// CSS color name assigned to each field parameter measure for conditional formatting.
            column Color
                summarizeBy: none
                sourceColumn: [Value4]

                annotation SummarizationSetBy = Automatic

            partition Parameter = calculated
                mode: import
                source =
                        {
                            ("Units sold", NAMEOF('Trending data'[Units sold]), 0, "MidnightBlue"),
                            ("Sales", NAMEOF('Trending data'[Sales]), 1, "MediumOrchid"),
                            ("COGS", NAMEOF('Trending data'[COGS]), 2, "Crimson")
                        }

        /// Disconnected measure selector that maps each measure choice to a color for dynamic measure and color formatting examples.
        table 'Select measure'

            /// Returns Units sold, Sales, or COGS according to the current Measure selection.
            measure 'Selected measure' =
                    SWITCH (
                        SELECTEDVALUE ( 'Select measure'[Measure] ),
                        "Units sold", [Units sold],
                        "Sales", [Sales],
                        "COGS", [COGS],
                        BLANK ()
                    )
                formatString: 0

            /// Measure name selected by the report viewer to control the dynamic measure result.
            column Measure
                summarizeBy: none
                sourceColumn: [Value1]

                annotation SummarizationSetBy = Automatic

            /// CSS color name associated with each measure selection for conditional formatting.
            column Color
                summarizeBy: none
                sourceColumn: [Value2]

                annotation SummarizationSetBy = Automatic

            partition 'Select measure' = calculated
                mode: import
                source =
                        {
                            ("Units sold", "MidnightBlue"),
                            ("Sales", "MediumOrchid"),
                            ("COGS", "Crimson")
                        }

        /// Sample units by quarter and color category used to demonstrate synchronized legend colors and gradient formatting.
        table 'Quarterly colors'

            /// Returns the quarter with the highest units in the current context while preserving color and other filters.
            measure 'Best Q' =
                    VAR _ColorQuarters =
                        SUMMARIZECOLUMNS (
                            'Quarterly colors'[Quarter],
                            ALL ( 'Quarterly colors'[Quarter] ),
                            "UnitsSold", SUM ( 'Quarterly colors'[Units] )
                        )
                    VAR _MaxUnits =
                        MAXX ( _ColorQuarters, [UnitsSold] )
                    VAR _BestRows =
                        FILTER ( _ColorQuarters, [UnitsSold] = _MaxUnits )
                    RETURN
                        MAXX ( _BestRows, 'Quarterly colors'[Quarter] )

            /// CSS color name that identifies the category and supplies its conditional formatting color.
            column Color
                isNameInferred
                sourceColumn: [Color]

            /// Quarter label used to compare units across Q1, Q2, and Q3.
            column Quarter
                isNameInferred
                sourceColumn: [Quarter]

            /// Number of units associated with each color category and quarter.
            column Units
                isNameInferred
                sourceColumn: [Units]

            partition 'Quarterly colors' = calculated
                mode: import
                source =
                        DATATABLE (
                            "Color", STRING,
                            "Quarter", STRING,
                            "Units", INTEGER,
                            {
                                { "Crimson", "Q1", 45 },
                                { "Crimson", "Q2", 62 },
                                { "Crimson", "Q3", 78 },
                                { "MidnightBlue", "Q1", 72 },
                                { "MidnightBlue", "Q2", 55 },
                                { "MidnightBlue", "Q3", 88 },
                                { "MediumSeaGreen", "Q1", 38 },
                                { "MediumSeaGreen", "Q2", 71 },
                                { "MediumSeaGreen", "Q3", 49 },
                                { "Goldenrod", "Q1", 91 },
                                { "Goldenrod", "Q2", 47 },
                                { "Goldenrod", "Q3", 66 },
                                { "MediumOrchid", "Q1", 56 },
                                { "MediumOrchid", "Q2", 83 },
                                { "MediumOrchid", "Q3", 60 }
                            }
                        )

        cultureInfo en-US

        annotation __PBI_TimeIntelligenceEnabled = 0
        annotation PBI_QueryOrder = []
```

## Fade prior-year lines

When a line chart compares multiple years, use a gradient to emphasize the latest year and show earlier years in shades of gray. The formatting updates when filters or new data change which year is latest.

For this example, configure a line chart with **Month** on the x-axis, **Sales** on the y-axis, and **Year** in the legend.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-chart-year-setup.png" alt-text="Screenshot of a line chart configured with Month on the x-axis, Sales on the y-axis, and Year in the legend.":::

To apply the gradient:

1. Select the line chart, and then select **Format visual**.
1. Expand **Lines**, and then expand **Color**.
1. Select **All series**, and then select the **Conditional formatting** (**fx**) button next to **Color**.

   :::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/year-line-fx-button.png" alt-text="Screenshot of the Lines color settings with All series selected and the conditional formatting button highlighted.":::

1. In the conditional formatting dialog, set **Format style** to **Gradient**.
1. Under **What field should we base this on?**, select the measure that returns the latest year.
1. Set **Minimum** to a light gray and **Maximum** to blue.
1. Select **Add a middle color**, set the middle color to a darker gray, and then select **OK**.

   :::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/year-line-gradient-settings.png" alt-text="Screenshot of gradient conditional formatting based on the latest year, with light gray, dark gray, and blue colors.":::

The latest year appears in blue, while earlier years fade through shades of gray.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/latest-year-line-highlighted.png" alt-text="Screenshot of the result that emphasizes the latest year in blue while retaining earlier years as context in gray.":::

The line color also controls the marker and series label colors. Use markers and series labels as noncolor cues that help distinguish the lines. To show them, expand **Markers** and turn on **Show** for all series. Then expand **Series labels** and turn them on.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/year-lines-labels-and-markers.png" alt-text="Screenshot of markers and series labels providing noncolor cues that distinguish the conditionally formatted lines.":::

When the report's date selection changes, the latest selected year remains blue. Earlier years continue to provide context in gray.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/prior-year-selection.png" alt-text="Screenshot of conditional formatting continuing to emphasize the latest selected year after the report date range changes.":::

To edit the conditional formatting, select the **fx** button again. To remove it and return to static colors, select the eraser button next to **Color**.

## Format line segments and shading

You can format segments within a single line to distinguish high and low values or increases and decreases. This example uses a line chart with **Period** on the x-axis and **Sum of Value** on the y-axis.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-segment-chart-setup.png" alt-text="Screenshot of a line chart configured with Period on the x-axis and Sum of Value on the y-axis.":::

To format the line segments:

1. Select the line chart, and then select **Format visual**.
1. Expand **Lines**, and then expand **Color**.
1. Select the **Conditional formatting** (**fx**) button next to **Color**.
1. Set **Format style** to **Gradient**.
1. Under **What field should we base this on?**, select **Sum of Value**.
1. Set **Minimum** to dark red and **Maximum** to dark blue.
1. Select **Add a middle color**, set **Center** to the custom value `0`, choose gray for its color, and then select **OK**.

   :::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-segment-gradient-settings.png" alt-text="Screenshot of line color gradient settings with red for the minimum, gray at zero, and blue for the maximum.":::

The line segments transition from red for low values through gray at zero to blue for high values. The **Segment type** setting appears and defaults to **Center**. The **Gradient** setting is on by default.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-segments-center-gradient.png" alt-text="Screenshot of line segments transitioning from red for low values through gray to blue for high values.":::

Change **Segment type** to **Left** or **Right** to apply each data point's color to the segment on that side. Gradient blending isn't available when you select **Left** or **Right**.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-segments-left.png" alt-text="Screenshot of conditionally formatted line segments with Segment type set to Left.":::

To make the colors more prominent, turn on **Shade area**. The shaded area uses the conditionally formatted line colors.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-segments-shaded-area.png" alt-text="Screenshot of a shaded area making the conditionally formatted line colors more prominent.":::

## Highlight selected markers

Apply conditional formatting directly to line markers to emphasize specific data points. In this example, a Data Analysis Expressions (DAX) measure assigns the report theme's positive color to the maximum value and negative color to the minimum value. It assigns a transparent color to all other markers.

Without conditional formatting, markers appear at every data point and can make the chart difficult to scan.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/line-markers-before-formatting.png" alt-text="Screenshot of default markers making the line chart difficult to scan before conditional formatting is applied.":::

Create the following measure:

```dax
Min and max marker =
VAR _maxValue =
    CALCULATE (
        MAX ( 'Spikes and Dips'[Value] ),
        ALLSELECTED ()
    )
VAR _minValue =
    CALCULATE (
        MIN ( 'Spikes and Dips'[Value] ),
        ALLSELECTED ()
    )
VAR _dataPoint =
    SUM ( 'Spikes and Dips'[Value] )
RETURN
    SWITCH (
        TRUE (),
        _dataPoint = _maxValue, "good",
        _dataPoint = _minValue, "bad",
        "#FFFFFF00"
    )
```

To apply the measure to the markers:

1. Select the line chart, and then select **Format visual**.
1. Expand **Markers**, and then expand **Color**.
1. Select the **Conditional formatting** (**fx**) button next to **Color**.
1. Set **Format style** to **Field value**.
1. Under **What field should we base this on?**, select **Min and max marker**.
1. Select **OK**.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/marker-field-value-settings.png" alt-text="Screenshot of marker color conditional formatting based on the Min and max marker field value.":::

Only the minimum and maximum markers remain visible. Because the measure returns theme color names, the marker colors update when you change the report theme's sentiment colors.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/conditionally-formatted-markers-theme-sentiment-colors.png" alt-text="Screenshot of conditional formatting highlighting only the minimum and maximum markers with report theme sentiment colors.":::

## Synchronize legend colors across charts

Use a column or measure that returns color values to keep the same category color across multiple visuals. When you define colors in the semantic model, you can update the color in one place.

The following example uses categories whose names are colors. Before conditional formatting, the visual colors don't match their category names.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/legend-colors-before-sync.png" alt-text="Screenshot of category colors before synchronization, showing mismatches between the category names and visual colors.":::

To apply the color field to a donut chart:

1. Select the donut chart, and then select **Format visual**.
1. Expand **Slices**, and then expand **Colors**.
1. Select the **Conditional formatting** (**fx**) button next to **Color**.
1. Set **Format style** to **Field value**.
1. Under **What field should we base this on?**, select the field that contains the category colors.
1. Select **OK**.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/legend-colors-synced-donut.png" alt-text="Screenshot of the donut chart after its slice colors were synchronized with the stored category color values.":::

Repeat these steps for the other charts. The formatting card name varies by visual. For example, use **Columns** for a column chart and **Lines** for a line chart. You can use one visual as a central legend and turn off the legends on the other visuals.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/synchronized-legend-colors.png" alt-text="Screenshot of the result after the same category colors were applied across multiple chart types.":::

When a report viewer selects a category in the central legend, the same category color remains consistent across all the visuals.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/shared-legend-selected-card.png" alt-text="Screenshot of a central legend selection highlighting the same category consistently across the report visuals.":::

## Apply a gradient to legend categories

When a chart has a legend, you can apply a gradient based on a numeric value. The regular categorical legend remains visible. Without a categorical legend, the visual can instead show the conditional formatting gradient scale.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/gradient-legend-comparison.png" alt-text="Screenshot of how a categorical legend determines whether the chart also displays a gradient scale.":::

To apply a gradient:

1. Select the chart, and then select **Format visual**.
1. Expand the formatting card for the visual's data colors, such as **Columns**, **Bars**, or **Slices**.
1. Select the **Conditional formatting** (**fx**) button next to **Color**.
1. Set **Format style** to **Gradient**.
1. Select the numeric field or measure to base the formatting on.
1. Configure the minimum, maximum, and optional center colors, and then select **OK**.

Because the gradient is based on values instead of specific categories, it continues to apply when new legend categories appear.

## Apply colors by using field parameters

Field parameters let report viewers switch the measures or dimensions that a visual uses. The field parameter in the example TMDL script includes a color column that assigns a consistent color to each parameter selection.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/field-parameter-color-column.png" alt-text="Screenshot of a field parameter table with a color assigned to each measure.":::

To apply the color column:

1. Select the chart, and then select **Format visual**.
1. Expand the formatting card for the chart's data colors.
1. Select the **Conditional formatting** (**fx**) button next to **Color**.
1. Set **Format style** to **Field value**.
1. Under **What field should we base this on?**, select the field parameter's color column.
1. Select **OK**.

The visual color changes with the selected field parameter. Apply the same color field to other visuals to maintain a consistent color for the selected measure across the report.

:::image type="content" source="media/power-bi-visualization-conditional-formatting-chart-line-legends/field-parameter-colors-in-use.png" alt-text="Screenshot of the result after the same color was applied to the measure selected through a field parameter.":::

## Considerations and limitations

- Gradient formatting requires a numeric field or measure.
- Rules-based formatting supports numeric and text values, but the available options vary by visual and formatting property.
- Field value formatting requires a field or measure that returns supported color values, such as color names, hexadecimal codes, or report theme color names.
- The field parameter color approach works only when you select one parameter option. It doesn't assign separate colors when multiple parameter options appear in one chart.
- Line segment formatting applies to a single line series. Adding a legend creates multiple series and disables segment formatting.
- Conditional formatting needs an aggregation or measure for the field that controls the formatting.

## Related content

- [Conditional formatting in Power BI visuals](power-bi-visualization-conditional-formatting.md)
- [Create and use line charts in Power BI](power-bi-line-chart.md)
- [Use report themes in Power BI Desktop](../create-reports/desktop-report-themes.md)
- [Create field parameters](../create-reports/power-bi-field-parameters.md)
- [Use TMDL view in Power BI](../transform-model/desktop-tmdl-view.md)