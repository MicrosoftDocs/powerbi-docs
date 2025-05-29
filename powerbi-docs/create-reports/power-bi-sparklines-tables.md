---
title: Create sparklines in a table or matrix in a report
description: In Power BI, you can create sparklines in a table or matrix in a Power BI report.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/21/2024
LocalizationGroup: Visualizations
---
# Create sparklines in a table or matrix in a Power BI report

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A good way to add meaning to a table or matrix is to add *sparklines*. Sparklines are tiny charts shown within cells of a table or matrix that make it easy to see and compare trends quickly. Sparklines are currently in preview. You can use them to show trends in a series of values, such as seasonal increases or decreases, economic cycles, or to highlight max and min values.

:::image type="content" source="media/power-bi-sparklines-tables/sparklines-1-matrix.png" alt-text="Screenshot of Sparklines in a matrix." lightbox="media/power-bi-sparklines-tables/sparklines-1-matrix.png":::

## Video

Watch this video showing how to add sparklines, and then try it yourself.

> [!NOTE]
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=543c6732-a00a-4a58-9b7d-fe5e2917044d]

## Add a sparkline

You can add sparklines to both your table and matrix visuals. 

1. Create a table or matrix.
1. Select the dropdown arrow next to one of the numeric fields, and select **Add a sparkline**.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-2-add-sparkline.png" alt-text="Screenshot of Add a sparkline." lightbox="media/power-bi-sparklines-tables/sparklines-2-add-sparkline.png":::

1. In the dialog box, you configure the details of your sparkline. The numeric field you started with is prepopulated for the **Y-axis**. You can change both the field and **Summarization** type, if needed. You also need to select a field, typically a date field, to use as the **X-axis** of the sparkline.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-3-add-sparkline-dialog.png" alt-text="Screenshot of Complete the Sparkline dialog box.":::

    Read more about [working with auto date/time fields](../transform-model/desktop-auto-date-time.md#work-with-auto-datetime) in Power BI Desktop.

> [!NOTE]
> When working with sparklines and [calculation groups](../transform-model/calculation-groups.md) together, you can decide how a calculation group is applied to the sparkline. You can choose between **Individual values** (default) and **Whole sparkline**. See [combining sparklines and calculation groups](#combining-sparklines-and-calculation-groups) for more info.

1. Select **Create**. The sparkline is automatically added to your table or matrix as a new column.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-4-new-column.png" alt-text="Screenshot of the sparkline is added to your table." lightbox="media/power-bi-sparklines-tables/sparklines-4-new-column.png":::

## Combining sparklines and calculation groups
When using [calculation groups](../transform-model/calculation-groups.md) and sparklines together, you can decide how to apply a calculation group to the sparkline. Two options are available:
- **Individual values**. This is the default value and applies the calculation group to each individual value on the sparkline.
- **Entire sparkline**. This applies the calculation group to the entire sparkline as a whole, not to the individual values. Calculation groups that perform arithmetic operations are not supported in this mode.

For example, take a sparkline that shows the Sum of Gross Sales measure by Month Number and a calculation group item that returns the value of the selected measure but only if it is above 1 million, otherwise it returns a blank value, i.e.:

```dax
IF( SELECTEDMEASURE() > 1000000, SELECTEDMEASURE(), BLANK() )
```

The sparkline is configured as:
:::image type="content" source="media/power-bi-sparklines-tables/sparklines-calculation-group-settings-1.png" alt-text="Screenshot of the sparkline configuration. Sum of Gros Sales is on the Y-axis, and the X-axis is set to Month Number. Also, the Apply calculation group to option is set to Individual values." lightbox="media/power-bi-sparklines-tables/sparklines-calculation-group-settings-1.png":::

When the sparkline is set to apply the calculation group to **Individual values** the Sum of Gross Sales for each Month Number is compared against the threshold of 1 million and if it is above that it, the value is returned, otherwise a blank value is returned. In this scenario, some sparklines might show completely, partially or not at all depending if the individual Gross Sales values met the threshold or not. The image below shows this. A matrix is added to show the individual values so you can confirm the results.

:::image type="content" source="media/power-bi-sparklines-tables/sparklines-calculation-group-individual-values-1.png" alt-text="Screenshot of two matrices. The top shows Sum of Gross Sales and the Sum of Gross Sales by Month Number sparkline by Product. The bottom shows the same information but without a sparkline. Only parts of the sparklines are shown because of the calculation group." lightbox="media/power-bi-sparklines-tables/sparklines-calculation-group-individual-values-1.png":::

If, conversely, the sparkline is set to **Entire sparkline** then the Sum of Gross sales for all Months is compared against the threshold and if it is above that, the value is returned, otherwise a blank value is returned. In this scenario, sparklines are either going to show or not at all, depending if the total Gross Sales met the threshold. In the example below we have set the threshold to 3 million. Again a matrix was also added to show that indeed the Sum of Gross Sales for most products was above the threshold, but not for all.

:::image type="content" source="media/power-bi-sparklines-tables/sparklines-calculation-group-entire-sparkline-1.png" alt-text="Screenshot of two matrices. The top shows Sum of Gross Sales and the Sum of Gross Sales by Month Number sparkline by Product. The bottom shows the same information but without a sparkline. Only some of the sparklines are shown because of the calculation group." lightbox="media/power-bi-sparklines-tables/sparklines-calculation-group-entire-sparkline-1.png":::

Now, if we change the calculation group item so it performs an arithmetic operation, then sparklines that are configured to apply the calculation group to the entire sparkline (using the **Entire sparkline** option) will return an error:
:::image type="content" source="media/power-bi-sparklines-tables/sparklines-calculation-group-entire-sparkline-error.png" alt-text="Screenshot of a matrix showing the sparklines has returned and error and needs to be converted to 'Individual values' to show again." lightbox="media/power-bi-sparklines-tables/sparklines-calculation-group-entire-sparkline-error.png":::

Changing the sparkline's configuration to apply the calculation group to the sparkline's individual values will apply the calculation group to the individual values and make the sparklines show again:
:::image type="content" source="media/power-bi-sparklines-tables/sparklines-calculation-group-converted-to-individual-values.png" alt-text="Screenshot of a matrix showing percentage of grand total of Sum of Gross Sales and the percentate of grand total of Sum of Gross Sales by Month Number sparkline by Product." lightbox="media/power-bi-sparklines-tables/sparklines-calculation-group-converted-to-individual-values.png":::

## Formatting the sparkline

You can edit the sparkline’s format.

1. Select the dropdown arrow next to sparkline, and select **Edit sparkline**.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-4-new-column.png" alt-text="Screenshot of select Edit sparkline." lightbox="media/power-bi-sparklines-tables/sparklines-4-new-column.png":::

1. In the **Sparklines** card in the **Format** pane, modify the sparkline line and marker formatting. Change the line color and width, add markers for different value types (highest, first, last, and so on), and change the marker size, color, and shape.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-6-format-pane.png" alt-text="Screenshot of format the sparkline." lightbox="media/power-bi-sparklines-tables/sparklines-6-format-pane.png":::

1. The **Format** pane is also where you change the chart type from a line to a column chart.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-7-column-chart.png" alt-text="Screenshot of change from line to column chart." lightbox="media/power-bi-sparklines-tables/sparklines-7-column-chart.png":::

## Considerations and limitations

- Power BI supports up to five sparklines per visual, and displays up to 52 points per sparkline.
- For performance reasons, the maximum number of columns in a matrix is also limited to 25 when sparklines are on.
- Sparklines are supported on Azure Analysis Services, but currently not supported on on-premises SQL Server Analysis Services.
- Visuals with sparklines don't support pinning to a dashboard.
- Applying a [calculation group](../transform-model/calculation-groups.md) that performs an arithmetic operation to the whole sparkline is not supported. Change the sparkline's configuration to **Individual values** or remove the arithmetic operation in the calculation group.

## Related content

- [Page layout and formatting](/training/modules/visuals-in-power-bi/12-formatting)
- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
