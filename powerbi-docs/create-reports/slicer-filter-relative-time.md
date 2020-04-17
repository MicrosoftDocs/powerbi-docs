---
title: Use a relative time slicer or filter in Power BI
description: Learn how to use a slicer or filter to constrain relative time ranges in Power BI.
author: maggiesMSFT
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 04/06/2020
ms.author: maggies
LocalizationGroup: Create reports
---

# Use a relative time slicer and filter in Power BI

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

With emerging fast refresh scenarios, the ability to filter to a smaller window of time can be useful. Using the relative time slicer or relative time filter, you can apply time-based filters to any date or time column in your data model. For example, you can use the relative time slicer to show only video views within the last 2 minutes or hours. 
 
> [!NOTE]
> When the relative time filter or slicer is applied to the page or report level, all visuals on that page or report are filtered to the exact same time range, using a shared anchor time. Because visuals might have slightly different execution times, this shared anchor time ensures that visuals are synchronized across your page or across your report. 

## Set up relative time

The relative time filter is in preview, so you need to turn it in the **Options** dialog. 
 
You don't have to use the feature in conjunction with the [automatic page refresh](../desktop-automatic-page-refresh.md) feature. However, many relative time scenarios pair well with the automatic page refresh feature. 
Once you have enabled the feature, you can drag and drop the date or time field to the field well of a slicer or to the drop zone in the filter pane. 
 
Next, you need to change the filter type to Relative Time.
 
Here’s how it looks in a slicer:
 

Here’s how it looks in a filter card: 
 
With this new filter type, you have the option to filter based on Last, Next, or This time period: 
 
You can specify the time window using a whole number and a unit of time: Minutes or Hours.
 

If you need to save real estate on the canvas, you can also create the relative time filter as a filter card in the filter pane:
 
## Understanding anchor time

When the filter is applied to the page or report level, all visuals on that page or report are synchronized to the same exact time range. The time that these queries are all issued relative to is called the *anchor time*. The anchor time automatically refreshes in the following conditions:

- Initial page load
- Manual refresh
- Automatic or change detection page refresh 
- A change to the model

### Anchor time exceptions

- Relative time filtering using the Q&A visual isn't relative to this anchor time, until the Q&A visual is converted into a standard visual. However, the other AI visuals, such as key influencers and decomposition tree are synchronized with the anchor time. 
- Additionally, relative date filters or slicers are not relative to the anchor time, unless in the presence of relative time filters, meaning, if a relative date and a relative time filter are on the same page, the relative date filter respects the anchor time.

## Limitations and considerations

The following limitations and considerations currently apply to the relative time slicer and filter.

- **Time zone considerations**: Data models in Power BI don't include time zone info. The models can store times, but there's no indication of the time zone they're in. The slicer and filter are always based on the time in UTC. If you set up a filter in a report and send it to a colleague in a different time zone, you'll both see the same data. Unless you are in the UTC time zone, you and your colleague must account for the time offset you’ll experience. You can convert data captured in a local time zone to UTC using the Query Editor.
- This new filter type is also supported in Power BI Desktop, the Power BI service, Power BI Embedded, and the Power BI mobile apps. However, there are a few known support limitations:

    - It isn't supported through the Embed API
    - It isn't supported for Publish to web

- **Query caching**: We utilize the client cache. Therefore, if you specify last 1 minute, and then check last 5 minutes, and then back to last 1 minute, you see the same results as when it was first run, unless you refresh the page (or the page automatically refreshes).

## Next steps

Learn how to [use grouping and binning in Power BI Desktop](../desktop-grouping-and-binning.md).
