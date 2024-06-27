---
title: Create sparklines in a table or matrix in a report (preview)
description: In Power BI, you can create sparklines in a table or matrix in a Power BI report. Sparklines are currently in preview.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/21/2024
LocalizationGroup: Visualizations
---
# Create sparklines in a table or matrix in a Power BI report (preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

A good way to add meaning to a table or matrix is to add *sparklines*. Sparklines are tiny charts shown within cells of a table or matrix that make it easy to see and compare trends quickly. Sparklines are currently in preview. You can use them to show trends in a series of values, such as seasonal increases or decreases, economic cycles, or to highlight max and min values.

:::image type="content" source="media/power-bi-sparklines-tables/sparklines-1-matrix.png" alt-text="Screenshot of Sparklines in a matrix." lightbox="media/power-bi-sparklines-tables/sparklines-1-matrix.png":::

## Turn on the sparklines preview

Sparklines should be on by default. If you don't see the option to add them, here's how to turn on the feature.

- In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Preview features**, and select **Sparklines**.

## Video

Watch this video showing how to add sparklines, and then try it yourself.

> [!NOTE]
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RWRCPQ]

## Add a sparkline

After you enable the preview feature, you can add sparklines to both your table and matrix visuals. 

1. Create a table or matrix.
1. Select the dropdown arrow next to one of the numeric fields, and select **Add a sparkline**.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-2-add-sparkline.png" alt-text="Screenshot of Add a sparkline." lightbox="media/power-bi-sparklines-tables/sparklines-2-add-sparkline.png":::

1. In the dialog box, you configure the details of your sparkline. The numeric field you started with is prepopulated for the **Y-axis**. You can change both the field and **Summarization** type, if needed. You also need to select a field, typically a date field, to use as the **X-axis** of the sparkline.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-3-add-sparkline-dialog.png" alt-text="Screenshot of Complete the Sparkline dialog box.":::

    Read more about [working with auto date/time fields](../transform-model/desktop-auto-date-time.md#work-with-auto-datetime) in Power BI Desktop.

1. Select **Create**. The sparkline is automatically added to your table or matrix as a new column.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-4-new-column.png" alt-text="Screenshot of the sparkline is added to your table." lightbox="media/power-bi-sparklines-tables/sparklines-4-new-column.png":::

## Edit the sparkline

Now you can edit the sparkline’s properties.

1. Select the dropdown arrow next to sparkline, and select **Edit sparkline**.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-4-new-column.png" alt-text="Screenshot of select Edit sparkline." lightbox="media/power-bi-sparklines-tables/sparklines-4-new-column.png":::

1. In the **Sparklines** card in the **Format** pane, modify the sparkline line and marker formatting. Change the line color and width, add markers for different value types (highest, first, last, and so on), and change the marker size, color, and shape.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-6-format-pane.png" alt-text="Screenshot of format the sparkline." lightbox="media/power-bi-sparklines-tables/sparklines-6-format-pane.png":::

1. The **Format** pane is also where you change the chart type from a line to a column chart.

    :::image type="content" source="media/power-bi-sparklines-tables/sparklines-7-column-chart.png" alt-text="Screenshot of change from line to column chart." lightbox="media/power-bi-sparklines-tables/sparklines-7-column-chart.png":::

## Considerations and limitations

- Power BI supports up to five sparklines per visual, and displays up to 52 points per sparkline.
- For performance reasons, the maximum number of columns in a matrix is also limited to 20 when sparklines are on.
- Sparklines are supported on Azure Analysis Services, but currently not supported on on-premises SQL Server Analysis Services.
- Visuals with sparklines don't support pinning to a dashboard.

## Related content

- [Page layout and formatting](/training/modules/visuals-in-power-bi/12-formatting)
- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/)
