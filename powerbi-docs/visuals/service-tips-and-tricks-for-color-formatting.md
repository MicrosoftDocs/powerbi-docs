---
title: Tips and Tricks for Formatting in Reports
description: Learn tips and tricks for formatting in Power BI reports.
author: DataZoeMS
ms.author: zoedouglas
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: conceptual
ms.date: 10/01/2025
ms.custom: sample-Sales-and-Marketing
LocalizationGroup: Visualizations
---
# Tips and tricks for formatting color in reports

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI provides many different ways to customize the formatting and colors used in your report visuals. This article provides some tips to make your Power BI visualizations more compelling, interesting, and customized to your needs.

To make any changes, you must be editing your report.

# [Power BI Desktop](#tab/powerbi-desktop)

Open a report in **Report** view. 

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-desktop-editing-view.png" alt-text="Screenshot of the Report icon on the left Nav panel.":::

# [Power BI service](#tab/powerbi-service)

Open a report, then select **Edit** from the menu bar.

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-service-editing-view.png" alt-text="Screenshot of Edit in the menu bar.":::

---

When the **Filters** and **Visualizations** panes appear along the right side of the report canvas, you're ready to start customizing. If the panes don't appear, select the **arrows** to open them.

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-edit-filter.png" alt-text="Screenshot of canvas with Filter and Visualization panes open.":::

## Apply a theme

In Power BI Desktop, you can apply design changes to your entire report. With themes, you can use corporate colors, change icon sets, or apply new default visual formatting. When you apply a report theme, all visuals in your report use the colors and formatting from your selected theme. To learn more, see [Use report themes in Power BI Desktop](../create-reports/desktop-report-themes.md).

A tenant admin can include organizational themes in the list for all users in addition the themes provided. To learn more, see [Use organizational themes](../create-reports/desktop-organizational-themes.md).

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-themes.png" alt-text="Screenshot of theme options in the View menu.":::

Here, we applied the **Innovate** theme to the report.

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-theme-innovate.png" alt-text="Screenshot of the Innovate theme applied to a report.":::

Report themes are also available in the Power BI service.

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-service-themes.png" alt-text="Screenshot of theme options in the View menu when editing a report in the web.":::

You can undo a theme change with CTRL Z or using the undo buttons.

## Change the color of a single data point

Sometimes you want to highlight one particular data point. Perhaps it's a sales figure for the launch of a new product, or improvements in quality scores after launching a new program. With Power BI, you can highlight a particular data point by changing its color.

The following visualization show sales by segment. 

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-format.png" alt-text="Screenshot of data colors changed to one color.":::

Imagine you want to call out the **Small Business** segment to show how well this brand new segment is performing by using color. Here are the steps:

For each visual type, there are many color options. You can color text, gridlines, backgrounds, and more. The path to the **Color** option that you want might not be the same across visuals. For that reason, select the visual and then use the Search bar to find the chart feature that you want to color. For a column chart, search for **Column**. The color option we want is on the **Columns** card. 

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-search-color.png" alt-text="Screenshot of searching for the option to color bars in a chart.":::

From the **Categories** dropdown, select **All** to set the same color for all columns. To change the color of the Small Business column, select **Small Business** from the **Categories** dropdown and the new color from the **Color** card. 

Once selected, the **Small Business** data point is a nice shade of orange, and certainly stands out.

If you expect to add new columns to the chart and want to maintain the same color scheme, be sure to set the **Default color** to blue.

If you change the bar chart to a different visual, such as a column chart, the visual keeps **Small Business** colored orange.


## Add conditional formatting for visuals color

Visualizations often benefit from dynamically setting color based on a numeric value in the visual. 

The following sections demonstrate different ways to base color on a numeric value.

### Base the color of data points on a value

First, select the image you want to adjust. Open the **Format your visual** pane by selecting the **paint brush** icon and then search for the **Colors** card. Since our example uses a column chart, scroll down to **Columns**. Next to **Default**, select the **fx** icon. 

>[!Note]
>Not all visuals will have the option to conditionally format the color, such as the color on a line visual.
>

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-conditional.png" alt-text="Screenshot of Colors card under Columns.":::

Format style gives you three ways to set the conditional formatting of this color. 

1. **Rules** let's you specify the color based on the value as a list of rules.
2. **Gradient** let's you specify the color based on a minimum or maximum value with option to have a middle color.
3. **Field value** let's you choose a measure or data column in your data model with the color, as a text data type.

In this example, we apply a **gradient** format style and select the **Sum of Sales** for the field we should base this on. Then we choose light blue for the **Lowest value** and dark blue for **Highest value**. 

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-conditional-formatting-new.png" alt-text="Screenshot of the Default color pane.":::

This setting applies the conditional formatting to the bar colors. Selecting the **fx button** opens the dialog to adjust the conditional formatting, and selecting the **Eraser button** clears the conditional formatting. The previously selected color for **Small Business** is removed.

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-default-colors.png" alt-text="Screenshot of column chart with default colors applied.":::

You can also format the color of the visual using a measure or column that isn't part of the visual. In the following image, we use **Sum of Profit**. 

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-conditional-colors.png" alt-text="Screenshot of Column chart with multiple shades of blue.":::


## Undo in Power BI

Like many other Microsoft services and software, Power BI provides an easy way to undo your last change. For example, let's say you change the color of a data point, or a series of data points, and you don't like the color when it appears in the visualization. You don't recall exactly which color it was before, but you know you want that color back.

To undo your last action, or the last few actions, all you have to do is type **CTRL** + **Z** as many times as needed.

To discard all the customizations you did to a part of the visual formatting, select **Reset to default** underneath that setting.

In the **Format pane settings** or ellipsis (...) at the top, you can **Reset all settings to default** for a specific visual.

:::image type="content" source="media/service-tips-and-tricks-for-color-formatting/power-bi-revert.png" alt-text="Screenshot of Formatting card showing Reset to default.":::

## Give us your feedback

Do you have a tip you want to share? Send it our way.

## Related content

- [Get started formatting report visualizations](service-getting-started-with-color-formatting-and-axis-properties.md)
- [Use report themes](../create-reports/desktop-report-themes.md)
- [Use organizational themes](../create-reports/desktop-organizational-themes.md)
- [Share a filtered Power BI report](../collaborate-share/service-share-reports.md)
- [Apply conditional formatting in tables and matrix visuals](../create-reports/desktop-conditional-table-formatting.md)
