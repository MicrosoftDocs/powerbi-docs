---
title: Conditional table formatting in Power BI Desktop
description: Apply customized formatting to tables
title: Conditional table formatting in Power BI Desktop
description: Apply customized formatting to tables
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 05/17/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Conditional formatting in tables 
With conditional formatting for tables, you can specify customized cell colors based on cell values, or based on other values or fields, including using gradient colors. You can also display cell values with data bars. 

To access conditional formatting, in the **Fields** well of the **Visualizations** pane in Power BI Desktop, select the down-arrow beside the value in the **Values** well that you want to format (or right-click the field). You can only manage conditional formatting for fields in the **Values** area of the **Fields** well.

![Conditional formatting menu](media/desktop-conditional-table-formatting/table-formatting-0-popup-menu.png)

The following sections describe each of these three conditional formatting options. One or more options can be combined in a single table column.

> [!NOTE]
> When applied to a table, conditional formatting overrides any custom table styles applied to the conditionally formatted cells.

To remove conditional formatting from a visualization, just right-click the field again, select **Remove conditional formatting** and then the type of formatting to remove.

![Remove conditional formatting menu](media/desktop-conditional-table-formatting/table-formatting-1-remove.png)

## Background color scales

Selecting **Conditional formatting** and then **Background color scales** brings up the following dialog.

![Background color scales dialog](media/desktop-conditional-table-formatting/table-formatting-1-default-dialog.png)

You can select a field from your data model to base the colors on, by setting **Color based on** to that field. In addition, you can specify the aggregation type for the selected field with the **Summarization** value. The field to be colored is specified in the **Apply color to** field, so you can keep track. You can apply conditional formatting to text and date fields, as long as you choose a numeric value as the basis of the formatting.

![Color based on field](media/desktop-conditional-table-formatting/table-formatting-1-apply-color-to.png)

To use discrete color values for given value ranges, select **Color by rules**. To use a color spectrum, leave **Color by rules** unchecked. 

![Background color scales dialog](media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules-dialog.png)

### Color by rules

When you select **Color by rules**, you can enter one or more value ranges, each with a set color.  Each value range starts with an *If value* condition, an *and* value condition, and a color.

![Color by rules value range](media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules-if-value.png)

Table cells with values in each range are filled with the given color. There are three rules in the following figure.

![Color by rules example](media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules.png)

The example table now looks like this:

![Example table with color by rules](media/desktop-conditional-table-formatting/table-formatting-1-color-by-rules-table.png)


### Color minimum to maximum

You can configure the *Minimum* and *Maximum* values and their colors. If you select the **Diverging** box, you can configure an optional *Center* value as well.

![Diverging button](media/desktop-conditional-table-formatting/table-formatting-1-diverging.png)

The example table now looks like this:

![Example table with diverging colors](media/desktop-conditional-table-formatting/table-formatting-1-diverging-table.png)

## Font color scales

Selecting **Conditional formatting** and then **Font color scales** brings up the following dialog. This dialog is similar to the **Background color scales** dialog, but changes the font color rather than the cell background color.

![Font color scales dialog](media/desktop-conditional-table-formatting/table-formatting-2-diverging.png)

The example table now looks like this:

![Example table with font color scales](media/desktop-conditional-table-formatting/table-formatting-2-table.png)

## Data bars

Selecting **Conditional formatting** and then **Data bars** brings up the following dialog. 

![Data bars dialog](media/desktop-conditional-table-formatting/table-formatting-3-default.png)

By default, the **Show bar only** option is unchecked, and so the table cell shows both the bar and the actual value.

![Example table with data bars and values](media/desktop-conditional-table-formatting/table-formatting-3-default-table.png)

If the **Show bar only** option is checked, the table cell only shows the bar.

![Example table with data bars only](media/desktop-conditional-table-formatting/table-formatting-3-default-table-bars.png)
