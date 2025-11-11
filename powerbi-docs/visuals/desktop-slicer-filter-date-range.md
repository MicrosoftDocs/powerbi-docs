---
title: Create a relative date slicer or filter in Power BI
description: Learn how to use a slicer or filter to constrain relative date ranges in Power BI.
author: DataZoeMS
ms.author: zoedouglas
ms.reviewer: 'rien'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 11/04/2024
LocalizationGroup: Create reports
---

# Create a relative date slicer and filter in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

With the **relative date slicer** or **relative date filter**, you can apply time-based selections in a slicer using a date column from your data model. For example, you can use the **relative date slicer** to show only sales data from within the last 30 days or last calendar month. When you view the report, the relative date period is applied and the specified range filters the other visuals on the page.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-01.png" alt-text="Screenshot showing a sales report and a relative date slicer with the date slicer called out." lightbox="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-01.png":::

## Create the relative date range slicer

You can use the relative date slicer just like any other slicer or visual when editing a report in Power BI. Select a **Slicer** visual to add it to your report page and then select a date column for the **Field** value. In the following image, we selected the *Date* column.

>[!Note]
>If your report has a Date hierarchy with your data column from the [auto date/time feature](/transform-model/desktop-auto-date-time), the date column must be used instead of the date hierarchy to use the slicer in relative date mode.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-02.png" alt-text="Screenshot of the Visualizations pane with the slicer visual icon and the Field well called out.":::

Select the slicer visual, and in the **Format** pane, under **Visualizations** > **Slicer settings** > **Options**, change the **Style** to **Relative Date**.

:::image type="content" source="media/desktop-slicer-filter-date-range/set-relative-date-range-slicer-filter.png" alt-text="Screenshot of the slicer visual with the Format pane and the Relative Date selected.":::

You can then select the settings in the date slicers. These settings are relative to the day the report is viewed, not the data range in the date column.

For the first setting, you have the following choices:

- Last
- Next
- This

In the screenshot, **Last** is selected.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-04.png" alt-text="Screenshot of the Relative config options with the first setting called out.":::


In the second (middle) setting in the relative date slicer, you enter a number to define the relative date range. This is only available for **Last** or **Next**, and disabled for **This** from the first setting. 

In the screenshot, **2** is selected. 

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-04a.png" alt-text="Screenshot of the Relative config options with the second setting called out.":::

In the third setting, you pick the date part. You have the following choices:

- Days
- Weeks
- Weeks (Calendar)
- Months
- Months (Calendar)
- Years
- Years (Calendar)

In the screenshot, **Years** is selected. The settings are read as **in the last 2 years** and the date column is filtered to only dates in the last 2 years for the other visuals on the report page.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-05.png" alt-text="Screenshot of the Relative config options with the third setting called out.":::


If you select **Months** instead, to make it the last 2 months, here's what happens:

- If today is July 20:

  - The data included in visuals constrained by the slicer shows data for the previous two months,
  - Starting on May 21 and going through July 20 (today's date).

In comparison, if you selected **Months (Calendar)**, the visuals constrained would show data from May 1 through June 30. The setting corresponds to the last two complete calendar months. 

>[!Tip]
>To avoid showing partial month in reports are comparing each month to prior months, use the **months (calendar)** setting to ensure only full months are selected.

## Create the relative date range filter

You can also create a relative date range filter for your report page or your entire report. To do so, drag a date column from the **Data** pane into the **Filters on this page** section or the **Filters on all pages** section in the **Filters** pane:

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-06.png" alt-text="Screenshot showing the Date field highlighted in the Fields pane and the Date field highlighted in the 'Filters on this page' well.":::

Once there, you can change the relative date range. It's similar to how you can customize the **relative date slicer**. Select **Relative date** from the **Filter type** drop-down.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-07.png" alt-text="Screenshot showing the Relative date option highlighted in the Filter type drop-down.":::

After you select **Relative date**, you see three sections to change under **Show items when the value**, including a middle numeric box, just like the slicer.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-08.png" alt-text="Screenshot showing the Filters on this page section of the Filters pane, with the 'Show items when the value' options called out.":::

## Considerations and limitations

The following considerations and limitations apply before showing the relative options in the slicer or filter pane.

- The data type for the column used in the slicer must be a date.
- The date hierarchy for auto date/time in Power BI can't be used. Use the date column directly.
- Date columns in **Power BI** don't include time zone info. 
- When the report is published, slicer and filter relative options are always based on the time in UTC. If you set up a filter in a report and send it to a colleague in a different time zone, you both see the same data. 

## Related content

- [Create a relative time slicer and filter in Power BI](../create-reports/slicer-filter-relative-time.md)
- [Slicers in Power BI](power-bi-visualization-slicers.md)
- [Auto date/time in Power BI](/transform-model/desktop-auto-date-time)
