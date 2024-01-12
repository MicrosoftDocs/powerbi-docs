---
title: Create a relative time slicer or filter in Power BI
description: Learn how to use a slicer or filter to constrain relative time ranges in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 01/13/2023
LocalizationGroup: Create reports
---

# Create a relative time slicer and filter in Power BI

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

With emerging fast refresh scenarios, the ability to filter to a smaller window of time can be useful. By using the relative time slicer or relative time filter, you can apply time-based filters to any date or time column in your data model. For example, you can use the relative time slicer to show only video views within the last minute or hour.

:::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time.gif" alt-text="Animation showing an example graph that uses the relative time slicer.":::

You don't have to use the relative time feature in conjunction with the [automatic page refresh](../create-reports/desktop-automatic-page-refresh.md) feature. However, many relative time scenarios pair well with the automatic page refresh feature.

> [!NOTE]
> When you apply a relative time filter or slicer at the page or report level, all visuals on that page or report are filtered to the exact same time range by using a shared *anchor* time. Because visuals might have slightly different execution times, this shared anchor time ensures that visuals are synchronized across your page or across your report. For more information, see [anchor time](#understanding-anchor-time).

## Create a relative time slicer or filter

After you've enabled the feature, you can drag and drop the date or time field to the field well of a slicer or to the drop zone in the Filters pane.

### Create a slicer

1. Drag a date or time field to the canvas.

2. Select the **Slicer** visualization type.

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-desktop-relative-time-create-slicer.png" alt-text="Screenshot showing how to create a time slicer.":::

### Create a filter

- Drag a date or time field to the **Filters** pane, in the **Filters on this visual**, **Filters on this page**, or **Filters on all pages** section.

### Set relative time

1. Select the slicer, and in the **Format** pane, under **Visual** > **Slicer settings** > **Options**, change the **Style** to **Relative Time**.

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time-slicer-set.png" alt-text="Screenshot showing the slicer with the Format pane and Relative Time selected.":::

   Here’s how it looks in a slicer:

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time-slicer.png" alt-text="Screenshot showing relative time applied to a slicer.":::

   Here’s how it looks in a filter card:

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time-filter.png" alt-text="Screenshot showing a filter card with Relative time selected as the Filter type.":::

1. With this new filter type, you can filter based on a time period of **Last**, **Next**, or **This**:

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time-last-next.png" alt-text="Screenshot showing time period options for a filter card.":::

1. You specify the time window using a whole number and a unit of time: **Minutes** or **Hours**.

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time-minutes-hours.png" alt-text="Screenshot showing time window options for a filter card.":::

1. If you need to save space on the canvas, you can also create the relative time filter as a filter card in the **Filters** pane.

   :::image type="content" source="media/slicer-filter-relative-time/power-bi-relative-time-set-filter.png" alt-text="Screenshot showing a filter card with a Filter type of Relative time selected.":::

## Understanding anchor time

When a filter is applied to the page or report level, all visuals on that page or report are synchronized to the same exact time range. These queries are all issued relative to a time called the *anchor time*. The anchor time automatically refreshes in the following conditions:

- Initial page load.
- Manual refresh.
- Automatic or change detection page refresh.
- A change to the model.

### Anchor time exceptions

- Relative time filtering using the Q&A visual isn't relative to this anchor time, until you convert the Q&A visual to a standard visual. However, the other AI visuals, such as key influencers and the decomposition tree, are synchronized with the anchor time.
- Additionally, relative date filters or slicers aren't relative to the anchor time unless in the presence of relative time filters. If a relative date and a relative time filter are on the same page, the relative date filter respects the anchor time.

## Considerations and limitations

The following considerations and limitations currently apply to the relative time slicer and filter.

- **Time zone considerations**: Data models in Power BI don't include time zone info. The models can store times, but there's no indication of the time zone they're in. The slicer and filter are always based on the time in Coordinated Universal Time (UTC). If you set up a filter in a report and send it to a colleague in a different time zone, you both see the same data. Unless you or your colleague are in the same UTC time zone, you both must account for the time offset you’ll experience. Use the Query Editor to convert data captured in a local time zone to UTC.
- This new filter type is supported in Power BI Desktop, the Power BI service, Power BI Embedded, and the Power BI mobile apps. However, it isn't supported for Publish to web.

- **Query caching**: We use the client cache. Say you specify "last 1 minute," then "last 5 minutes," then back to "last 1 minute." At that point, you see the same results as when it was first run unless you refresh the page or the page automatically refreshes.

## Related content

- [Creating a relative date slicer and filter in Power BI](../visuals/desktop-slicer-filter-date-range.md)
- [Slicers in Power BI](../visuals/power-bi-visualization-slicers.md)
