---
title: Create a relative date slicer or filter in Power BI
description: Learn how to use a slicer or filter to constrain relative date ranges in Power BI.
author: miguelmyersMS
ms.author: miguelmyers
ms.reviewer: 'rien'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 06/20/2024
ms.custom: video-removed, sample-Sales-and-Marketing
LocalizationGroup: Create reports
---

# Create a relative date slicer and filter in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

With the **relative date slicer** or **relative date filter**, you can apply time-based filters to any date column in your data model. For example, you can use the **relative date slicer** to show only sales data from within the last 30 days (or month, calendar months, and so on). When you refresh the data, the relative time period automatically applies the appropriate relative date constraint.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-01.png" alt-text="Screenshot showing a sales report and a relative date slicer with the date slicer called out." lightbox="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-01.png":::

If you want to share your report with a Power BI colleague, you both must have individual Power BI Pro licenses or the report must be saved in Premium capacity.

## Create the relative date range slicer

You can use the relative date slicer just like any other slicer. Create a **Slicer** visual for your report and then select a date value for the **Field** value. In the following image, we selected the *Date* field.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-02.png" alt-text="Screenshot of the Visualizations pane with the slicer visual icon and the Field well called out.":::

Select the slicer, and in the **Format** pane, under **Visual** > **Slicer settings** > **Options**, change the **Style** to **Relative Date**.

:::image type="content" source="media/desktop-slicer-filter-date-range/set-relative-date-range-slicer-filter.png" alt-text="Screenshot of the slicer visual with the Format pane and the Relative Date selected.":::

You can then select the settings in the date slicers.

For the first setting, you have the following choices:

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-04.png" alt-text="Screenshot of the Relative config options with the first setting called out.":::

- Last
- Next
- This

In the second (middle) setting in the relative date slicer, you enter a number to define the relative date range.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-04a.png" alt-text="Screenshot of the Relative config options with the second setting called out.":::

In the third setting, you pick the date measurement. You have the following choices:

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-05.png" alt-text="Screenshot of the Relative config options with the third setting called out.":::

- Days
- Weeks
- Weeks (Calendar)
- Months
- Months (Calendar)
- Years
- Years (Calendar)

If you select **Months** from that list, and enter *2* in the middle setting, here's what happens:

- If today is July 20:

  - The data included in visuals constrained by the slicer shows data for the previous two months,
  - Starting on May 21 and going through July 20 (today's date).

In comparison, if you selected *Months (Calendar)*, the visuals constrained would show data from May 1 through June 30 (the last two complete calendar months).

## Create the relative date range filter

You can also create a relative date range filter for your report page or your entire report. To do so, drag a date field from the **Fields** pane into the **Filters on this page** well or the **Filters on all pages** well in the **Filters** pane:

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-06.png" alt-text="Screenshot showing the Date field highlighted in the Fields pane and the Date field highlighted in the 'Filters on this page' well.":::

Once there, you can change the relative date range. It's similar to how you can customize the **relative date slicer**. Select **Relative date** from the **Filter type** drop-down.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-07.png" alt-text="Screenshot showing the Relative date option highlighted in the Filter type drop-down.":::

After you select **Relative date**, you see three sections to change under **Show items when the value**, including a middle numeric box, just like the slicer.

:::image type="content" source="media/desktop-slicer-filter-date-range/relative-date-range-slicer-filter-08.png" alt-text="Screenshot showing the Filters on this page section of the Filters pane, with the 'Show items when the value' options called out.":::

## Considerations and limitations

The following considerations and limitations currently apply to the **relative date range slicer** and filter.

- The data type for the field in the slicer must be a date, and not the default of text. Otherwise, the relative options don't show up in the slicer.
- Data models in **Power BI** don't include time zone info. The models can store times, but there's no indication of the time zone they're in.
- The slicer and filter are always based on the time in UTC. If you set up a filter in a report and send it to a colleague in a different time zone, you both see the same data. Unless you are in the UTC time zone, you and your colleague must account for the time offset that you experience.
- You can convert data captured in a local time zone to UTC using the **Query Editor**.

## Related content

- [Create a relative time slicer and filter in Power BI](../create-reports/slicer-filter-relative-time.md)
- [Slicers in Power BI](power-bi-visualization-slicers.md)
