---
title: Create dynamic format strings for measures in Power BI Desktop
description: Learn how to create dynamic format strings for measures in Power BI Desktop measures.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 4/24/2024
LocalizationGroup: Create reports
---
# Create dynamic format strings for measures

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

With *dynamic format strings for measures*, you can determine how measures appear in visuals by conditionally applying a format string with a separate DAX expression.

> [!NOTE]
> Dynamic format strings for measures is currently in Preview. When in Preview, functionality and documentation are likely to change.

Dynamic format strings overcome an inherent disadvantage of using the FORMAT function. That is, with FORMAT even numeric data types are returned as a string, which may not work with visuals that require numeric values, like charts.
When using dynamic format strings, the measure keeps its data type and isn't forced to change to a string data type. This applies different format strings to the measure depending on the context.

Dynamic format strings can also be used with calculation groups. The same DAX patterns that work with calculation groups can also be utilized in dynamic format strings for measures, but the scope is limited to individual measures instead of all measures in the model. To learn more, see [Calculation groups - Dynamic format strings](/analysis-services/tabular-models/calculation-groups?view=power-bi-premium-current#dynamic-format-strings&preserve-view=true).

## Create dynamic format strings

#### To create a dynamic format string

1. In the **Data** pane, select the measure for which you want to specify a dynamic format string.
1. In the **Measure tools** ribbon > **Formatting** section > **Format** listbox, select **Dynamic**. A new listbox with **Format** already selected appears to the left of the DAX formula bar. This drop down is how you can switch between the static measure DAX expression and the dynamic format string DAX expression. Whatever the static format string was in use before switching to Dynamic is prepopulated as a string in the DAX formula bar.

    :::image type="content" source="media/desktop-dynamic-format-strings/format-dropdown.png" alt-text="Screen shot of Format dropdown":::

1. Overwrite the string with a DAX expression that outputs the correct format string for your measure. For example, the following expression looks up the currency format string we want from a ‘Country Currency Format Strings’ table:

    :::image type="content" source="media/desktop-dynamic-format-strings/format-dynamic-measure.png" alt-text="Screen shot of Dynamic format measure expression":::

1. Verify your dynamic format string works in a visual.

    To delete the dynamic format string and return to using a static format string, in the **Formatting** section > **Format** listbox, select a different format option. Because there's no undo to this action, a dialog appears asking if you want to proceed. If you want to go back to using a dynamic format string again, you must reenter the DAX expression.

    :::image type="content" source="media/desktop-dynamic-format-strings/format-change-warning.png" alt-text="Screen shot of Format change warning":::

## Example

The best way to learn about a new feature is to try it yourself. You can do just that with the sample **Adventure Works 2020 PBIX** file available at [DAX sample model](/dax/dax-sample-model). By using the sample model, you can add currency conversion to show converted sales amount by year. After downloading, open the file in Power BI Desktop.

#### Create new tables

The sample model doesn't contain all the data necessary to create and use dynamic format strings. To get started, you first need to add two tables.

1. On the **Home** ribbon, select **Enter data**.

1. In the **Create Table** dialog, enter the following table name, and then copy and paste the following table:

    Table name: **Country Currency Format Strings**
    
    | Country        | Currency | Format    |
    |----------------|----------|-----------|
    | Australia      | Dollar   | AU$#,0.00 |
    | Canada         | Dollar   | C$#,0.00  |
    | Denmark        | Krone    | kr#,0     |
    | Euro Zone      | Euro     | € #,0.00  |
    | Japan          | Yen      | ¥ #,0     |
    | Sweden         | Krona    | kr#,0     |
    | Switzerland    | Franc    | CHF#,0.00 |
    | United Kingdom | Pound    | £ #,0     |
    | United States  | Dollar   | US$#,0.00 |

1. Verify the table looks correct, and then click **Load**.

    :::image type="content" source="media/desktop-dynamic-format-strings/create-table-dialog.png" alt-text="Screen shot of Create table dialog":::

1. Repeat the previous steps for the following table:

    Table name: **Yearly Average Exchange Rates**

    | Country        | Currency | Year | Yearly Average Exchange Rate |
    |----------------|----------|------|------------------------------|
    | Australia      | Dollar   | 2022 | 1.442                        |
    | Australia      | Dollar   | 2021 | 1.332                        |
    | Australia      | Dollar   | 2020 | 1.452                        |
    | Australia      | Dollar   | 2019 | 1.439                        |
    | Australia      | Dollar   | 2018 | 1.34                         |
    | Australia      | Dollar   | 2017 | 1.358                        |
    | Canada         | Dollar   | 2022 | 1.301                        |
    | Canada         | Dollar   | 2021 | 1.254                        |
    | Canada         | Dollar   | 2020 | 1.341                        |
    | Canada         | Dollar   | 2019 | 1.327                        |
    | Canada         | Dollar   | 2018 | 1.297                        |
    | Canada         | Dollar   | 2017 | 1.35                         |
    | Denmark        | Krone    | 2022 | 7.077                        |
    | Denmark        | Krone    | 2021 | 6.29                         |
    | Denmark        | Krone    | 2020 | 6.538                        |
    | Denmark        | Krone    | 2019 | 6.67                         |
    | Denmark        | Krone    | 2018 | 6.319                        |
    | Denmark        | Krone    | 2017 | 6.864                        |
    | Euro Zone      | Euro     | 2022 | 0.951                        |
    | Euro Zone      | Euro     | 2021 | 0.846                        |
    | Euro Zone      | Euro     | 2020 | 0.877                        |
    | Euro Zone      | Euro     | 2019 | 0.893                        |
    | Euro Zone      | Euro     | 2018 | 0.848                        |
    | Euro Zone      | Euro     | 2017 | 0.923                        |
    | Japan          | Yen      | 2022 | 131.454                      |
    | Japan          | Yen      | 2021 | 109.817                      |
    | Japan          | Yen      | 2020 | 106.725                      |
    | Japan          | Yen      | 2019 | 109.008                      |
    | Japan          | Yen      | 2018 | 110.424                      |
    | Japan          | Yen      | 2017 | 116.667                      |
    | Sweden         | Krona    | 2022 | 10.122                       |
    | Sweden         | Krona    | 2021 | 8.584                        |
    | Sweden         | Krona    | 2020 | 9.205                        |
    | Sweden         | Krona    | 2019 | 9.457                        |
    | Sweden         | Krona    | 2018 | 8.703                        |
    | Sweden         | Krona    | 2017 | 8.894                        |
    | Switzerland    | Franc    | 2022 | 0.955                        |
    | Switzerland    | Franc    | 2021 | 0.914                        |
    | Switzerland    | Franc    | 2020 | 0.939                        |
    | Switzerland    | Franc    | 2019 | 0.994                        |
    | Switzerland    | Franc    | 2018 | 0.979                        |
    | Switzerland    | Franc    | 2017 | 1.024                        |
    | United Kingdom | Pound    | 2022 | 0.811                        |
    | United Kingdom | Pound    | 2021 | 0.727                        |
    | United Kingdom | Pound    | 2020 | 0.779                        |
    | United Kingdom | Pound    | 2019 | 0.784                        |
    | United Kingdom | Pound    | 2018 | 0.75                         |
    | United Kingdom | Pound    | 2017 | 0.808                        |

#### Create a Year column

A new Year column is needed in the existing Date table.

1. In **Model** view, right-click the **Date** table, and then select **New column**.

1. In the DAX formula bar, enter the following expression: `Year = YEAR([Date])`, and then press **Enter**.

    :::image type="content" source="media/desktop-dynamic-format-strings/formular-bar-year.png" alt-text="Screen shot of Year formula in DAX formula bar":::

#### Create relationships

Relationships are needed between your new Yearly Average Exchange Rates and Country Currency Format Strings tables, and between Yearly Average Exchange Rates table and the existing Date table.

1. If you have Autodetect for relationships on, the relationship between **Country Currency Format Strings** and **Yearly Average Exchange Rates** on the **Country** column may have been created for you. If not, then create this relationship:
    - Table 1: **Yearly Average Exchange Rates**
    - Table 1 Column: **Country**
    - Cardinality: **Many to one**
    - Table 2: **Country Currency Format Strings**
    - Table 2 Column: **Country**
    - Make this relationship active: **Yes**
    - Cross filter direction: **Single**

    The relationship should look like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/ccfs-year-relationship.png" alt-text="Screen shot of Relationship properties between Country Currency Format Strings and Yearly Average Exchange Rates":::

1. If you have Autodetect for relationships on, a relationship between **Country Currency Format Strings** and **Sales territory** on the **Country** column may have been created. This relationship, however, isn't correct for our model. In **Model** view, delete this relationship.

1. Instead, create a relationship between **Yearly Average Exchange Rates** and **Date**  on the **Year** column.
    - Table 1: **Yearly Average Exchange Rates**
    - Table 1 Column: **Year**
    - Cardinality: **Many to Many**
    - Table 2: **Date**
    - Table 2 Column: **Year**
    - Make this relationship active: **Yes**
    - Cross filter direction: **Single (‘Yearly Average Exchange Rate’ filters ‘Date’)**

   The relationship should look like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/year-date-relationship.png" alt-text="Screen shot of Relationship":::

1. Save your model.

#### Create a measure group table

A measure group helps you organize different measures by having them in a single table.

1. In the **Home** ribbon, select **Enter data**.

1. In the **Create Table** dialog, leave the values blank. Name the table **Sales measures**, and then click **Load**. This table contains your new measures.

#### Create measures

1. In the **Data** pane, expand and right-click **Sales measures**, and then select **New measure**. Enter the following DAX expression into the DAX formula bar, and then press **Enter**:

    ```dax
    Sales Amount = SUM(Sales[Sales Amount])
    ```

    It should look like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/sales-amount-measure-formula.png" alt-text="Screen shot of Sales amount measure DAX formula":::

1. In **Sales measures**, right-click **Column1**, and then select **Hide in report view**. This changes Sales measures to a measure group, which now appears at the top of the Data pane with a measure group icon, like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/sales-measures-column1.png" alt-text="Screen shot of Column1 in Sales measure group":::

1. You can now create a measure to compute the exchange rate. Right-click **Sales measures**, select **New measure**, enter the following expression into the DAX formula bar, and then press **Enter**:

    ```dax
    Exchange Rate (Yearly Avg) = 
    IF (
        ISBLANK ( SELECTEDVALUE ( 'Country Currency Format Strings'[Country] ) )
            || SELECTEDVALUE ( 'Country Currency Format Strings'[Country] ) = "United States",
        1,
        AVERAGE ( 'Yearly Average Exchange Rates'[Yearly Average Exchange Rate] )
    )
    
    ```

    It should look like this:
    :::image type="content" source="media/desktop-dynamic-format-strings/exchange-rate-dax-formula.png" alt-text="Screen shot of Exchange rate dax formula in DAX editor":::

1. Now you create another measure to convert the **Sales Amount** measure to other currencies. Right-click **Sales measures**, select **New measure**, enter the following expression into the DAX formula bar, and then press **Enter**:

    ```dax
        Converted Sales Amount = 
        SUMX('Date',
        CALCULATE( [Sales Amount] * [Exchange Rate (Yearly Avg)]))

    ```

    The **Sales measures** measure group should now look like this:
    :::image type="content" source="media/desktop-dynamic-format-strings/converted-sales-amount-measure-formula.png" alt-text="Screen shot of Converted sales amount measure formula":::

#### Create a report

1. Go to **Report view**. Add a new, blank page to the report.

1. Add a line chart visual to your new report page. You use this visual to see your measure before adding the dynamic format string for measures.

1. In the **Data** pane > **Sales measures**, select **Converted Sales Amount**. Without clicking anywhere else, also select **Year** in the **Date** table.

    :::image type="content" source="media/desktop-dynamic-format-strings/line-chart-visual.png" alt-text="Screen shot of Line chart visual in Report view":::

1. Copy and then paste the visual so you have two line chart visuals. Change the second line chart visual to a table visual, and then move it below the line chart, like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/copy-line-chart-visual.png" alt-text="Screen shot of Copy line chart visual":::

1. Add a slicer visual to your report page. In the **Format** ribbon, add **Country** from the **Country Currency Format Strings** table to the slicer.

    :::image type="content" source="media/desktop-dynamic-format-strings/country-slicer.png" alt-text="Screen shot of Country slicer":::

1. Rearrange the visuals until they have a better layout, something like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/rearrange-visuals.png" alt-text="Screen shot of Rearrange visuals":::

1. While not required, you can change visual properties to make a nicer report:

    Slicer

    - Slicer settings: Single select
    - Size and Style, Padding: 10 px, all edges
    - Size and Style, Visual border: light grey, 10 px rounded corners
    - Slicer settings, Style: Tile
    - Slicer header: Off
    - Values, border: Left, #333333, 6 line width

    Table

    - Size and Style, Padding: 10 px, all edges
    - Size and Style, Visual border: light grey, 10 px rounded corners
    - Grid, Horizontal gridlines: White, 2 width
    - Grid, Vertical gridlines: White, 2 width
    - Grid, Border: White
    - Grid, Options: 2 row padding
    - Values, Values: Background color #F6F4F4
    - Values, Values: Alternate background color #F6F4F4
    - Column headers, Text: Bold, Text color white, Background color #0D6ABF

    Line chart

    - Size and Style, Padding: 10 px, all edges
    - Size and Style, Visual border: light grey, 10 px rounded corners
    - Title, Subtitle: On
    - Y-axis, Title: Off
    - Y-axis: Off
    - Markers: On
    - Data labels: On
    - Data labels, Values: Bold, Blue

    Canvas (optional)

    - Canvas background: light grey, 85% transparency

    With those visual properties, you get a nice report page, like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/visual-formatting-gray.png" alt-text="Screen shot of Gray cnvas background for visual":::

#### Create a dynamic format string

Selecting different **Country** names in the slicer shows the Converted Sales Amount measure result in visuals, but not in the right format for that country or region.

1. In the **Data** pane > **Sales measures**, select **Converted Sales Amount**.

1. In the **Measure tools** ribbon, click the **Format** drop down, and then select **Dynamic**.

1. The dropdown listbox to the left of the formula bar should now say **Format**, and the formula in the formula bar should have a format string. Replace the format string with the following DAX expression, and then press **Enter**:

    ```dax
    SELECTEDVALUE ( 'Country Currency Format Strings'[Format], "\$#,0.00;(\$#,0.00);\$#,0.00" )
    ```

    It should look like this:

    :::image type="content" source="media/desktop-dynamic-format-strings/country-currency-format-strings-dynamic-formula.png" alt-text="Screen shot of Country Currency Format Strings dynamic formula":::

1. Select a different Country in the slicer. The table and line chart visuals should now show the converted currency amount, in the correct format, for that country or region. Try selecting a different country/region in the slicer to see how the visuals change.

    :::image type="content" source="media/desktop-dynamic-format-strings/converted-sales-amount-visual.png" alt-text="Screen shot of Converted sales amount visual":::

1. Save your model.

## Known issues and considerations

During Preview, the following issues and limitations are being addressed:

- Visuals have formatting options that may impact how the format string is displayed. If the formatting is showing unexpectedly in a visual, go to the visual Format options, search for **Display units** and change it from **Auto** to **None**.

    :::image type="content" source="media/desktop-dynamic-format-strings/display-units.png" alt-text="Screen shot of Display units from auto to none":::

- The measure itself can be referenced directly in its dynamic format string by using its name, like [Measure A], or indirectly by using `SELECTEDMEASURE()`.
- Dynamic format strings for measures are only for model measures. *Report measures* that can be added to a live connect report can't have dynamic format strings for measures.
- With DirectQuery for Analysis Services, when you click **Make changes to this model** on a live connect report, it shifts the connection to the DirectQuery over Analysis Services. In general, you can make changes to the format strings of the remote model measures. During **Preview**:
    - Remote model measures with dynamic format strings defined are blocked from making format string changes to a static format string or to a different dynamic format string DAX expression.
    - Remote model measures can't be changed from a static format string to a dynamic format string DAX expression defined in the local model.
    - Local model measures are blocked from using dynamic format strings for measures.

## Related content

- [Measures in Power BI Desktop](../transform-model/desktop-measures.md)  
- [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)  
- [Custom format strings in Power BI Desktop](desktop-custom-format-strings.md)  
- [Dynamic format strings for calculation groups](/analysis-services/tabular-models/calculation-groups)  
- [FORMAT function](/dax/format-function-dax)
