---
title: Conditional table formatting in Power BI Desktop
description: Apply customized formatting to tables
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 12/26/2019
ms.author: davidi

LocalizationGroup: Create reports
---
# Use conditional formatting in tables 
With conditional formatting for tables, you can specify customized cell colors based on cell values, or based on other values or fields, including using gradient colors. You can also display cell values with data bars. 

To access conditional formatting, select or add a Table or Matrix visualization in Power BI Desktop. In the **Fields** section of the **Visualizations** pane, right-click or select the down-arrow next to the field in the **Values** well that you want to format. 

![Conditional formatting menu](media/desktop-conditional-table-formatting/table-formatting-0-popup-menu.png)

The following sections describe each of the conditional formatting options. You can combine more than one option in a single table column.

> [!NOTE]
> Conditional formatting overrides any custom table styles you applied to the conditionally formatted cells.

To remove conditional formatting from a visualization, select **Remove conditional formatting** from the field's drop-down menu, and then select the type of formatting to remove.

![Remove conditional formatting menu](media/desktop-conditional-table-formatting/table-formatting-1-remove.png)

## Format background color

To format cell background color, select **Conditional formatting** for the field, and then select **Background color** from the drop-down menu. 

### Format by color scale

To format by color scale, in the **Format by** field, select **Color scale**. **Based on field** shows the field you selected to be formatted. You can apply conditional formatting to text and date fields, as long as you choose a numeric value as the basis of the formatting. 

Under **Summarization**, specify the aggregation type you want for the selected field. Under **Default formatting**, select a formatting to apply to blank values. 

Under **Minimum** and **Maximum**, choose whether to apply the color scheme based on the lowest and highest values, or on custom values you enter. Drop down and select the colors swatches you want to apply to the minimum and maximum values. Select the **Diverging** check box to also specify a **Center** value and color. 

![Background color based on field](media/desktop-conditional-table-formatting/table-formatting-1-apply-color-to.png)

Select **OK**. The example table now looks like this:

![Example table with diverging colors](media/desktop-conditional-table-formatting/table-formatting-1-diverging-table.png)

### Color by rules

To format cell background color by rules, in the **Format by** field, select **Rules**. Again, **Based on field** shows the field you selected to be formatted, and **Summarization** shows the aggregation type for the selected field. 

(media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules-dialog.png)

Under **Rules**, you can enter one or more value ranges, each with a set color.  Each value range has an *If value* condition, an *and* value condition, and a color. Table cells with values in each range are filled with the given color. The following example has three rules:

![Color by rules](media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules-if-value.png)

Select **OK**. The example table now looks like this:

![Example table with color by rules](media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules-table.png)

## Format font color

To format cell font color, select **Conditional formatting** for the field, and then select **Font color** from the drop-down menu. 

The **Font color** options are similar to the background color options, but change the font color rather than the cell background color.

![Font color scales dialog](media/desktop-conditional-table-formatting/table-formatting-2-diverging.png)

After selecting conditional formatting options, select **OK**. The example table with conditional font color options applied looks like this:

![Example table with font color scales](media/desktop-conditional-table-formatting/table-formatting-2-table.png)

## Add data bars

To show data bars based on cell values, select **Conditional formatting** for the field, and then select **Data bars** from the drop-down menu. 

![Data bars dialog](media/desktop-conditional-table-formatting/table-formatting-3-default.png)

In the **Data bars** dialog, the **Show bar only** option is unchecked by default, so the table cells show both the bars and the actual values. To show the data bars only, select the **Show bar only** check box.

You can specify **Minimum** and **Maximum** values, data bar colors and direction, and axis color. 

Select **OK**. With data bars applied, the example table now looks like this:

![Example table with data bars](media/desktop-conditional-table-formatting/table-formatting-3-default-table-bars.png)

## Format by color field values

If your column or measure uses color name or hex value data, you can use conditional formatting to automatically apply those colors to a column's background or font color. You can also create custom logic to apply desired colors to the font or background.

You can use any color values listed in the CSS color spec at [https://www.w3.org/TR/css-color-3/](https://www.w3.org/TR/css-color-3/) to color your visuals. Color values can include:
- 3, 6 or 8 digit hex codes, for example #3E4AFF. Make sure you include the # symbol at the start of the code. 
- RGB or RGBA values, like RGBA(234, 234, 234, 0.5).
- HSL or HSLA values, like HSLA(123, 75%, 75%, 0.5).
- Color names, such as Green, SkyBlue, or PeachPuff. 

### Format by color name

In the following table, there's a color associated with each state. 

![State table with color names](media/desktop-conditional-table-formatting/conditional-table-formatting_01.png)

To format the **Color** column based on its field values, select **Conditional formatting** for the **Color** field, and select **Background color**. 

In the **Background color** dialog, select **Field value** from the **Format by** drop-down field.

![Format by Field value](media/desktop-conditional-table-formatting/conditional-table-formatting_02.png)

Select **OK**. The example table now looks like this:

![Example table with formatting by field value](media/desktop-conditional-table-formatting/conditional-table-formatting_03.png)

If you also use **Field value** to format **Font color**, the result is a solid color in the **Color** column of the table. 

![Format by Field value](media/desktop-conditional-table-formatting/conditional-table-formatting_04.png)

### Format based on a calculation

You can create a DAX calculation that outputs different color names or hex codes based on business logic conditions you select. This is usually easier than creating multiple rules in the conditional formatting dialog. For example, the following DAX formula applies a hex color value based on **Affordability** ranking to the **Affordability rank** column:

![DAX calculation](media/desktop-conditional-table-formatting/conditional-table-formatting_05.png)

In your table visualization, select **Background color** conditional formatting for the **Affordability** column. Base the background color on the **Field value** of the **Affordability rank** column. 

![Base background color on a calculated column](media/desktop-conditional-table-formatting/conditional-table-formatting_06.png)

The example table now looks like this:

![Example table with a calculated value based color](media/desktop-conditional-table-formatting/conditional-table-formatting_07.png)

You can create many more variations, just by using your imagination and a bit of DAX.

## Considerations and limitations
There are a few considerations to keep in mind when working with conditional table formatting:

- Conditional formatting is applied only to the values of **Table** or **Matrix** visuals, and does not apply to any subtotals, grand totals, or the **Total** row. 
- Any table that doesn't have a grouping is displayed as a single row that doesn't support conditional formatting.
- If you use gradient formatting with automatic maximum/minimum values, or rule-based formatting with percentage rules, conditional formatting can't be applied if your data contains *NaN* values. NaN means "Not a number," most commonly caused by a divide by zero error. You can use the [DIVIDE() DAX function](https://docs.microsoft.com/dax/divide-function-dax) to avoid these errors.

## Next steps

For more information about color formatting, see [Tips and tricks for color formatting in Power BI](visuals/service-tips-and-tricks-for-color-formatting.md)  

