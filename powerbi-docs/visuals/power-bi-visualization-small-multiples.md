---
title: Create small multiples in Power BI (preview)
description: Small multiples, or trellising, split a visual into multiple versions of itself, presented side-by-side, with its data partitioned across these versions by a chosen dimension.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'mihart'
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 01/21/2021
LocalizationGroup: Visualizations
---
# Create small multiples in Power BI (preview)

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

Small multiples, or trellising, splits a visual into multiple versions of itself, presented side-by-side, with its data partitioned across these versions by a chosen dimension. For example, a small multiple could split a “sales by category” column chart across product lines or regions. In this preview, small multiples have a small set of capabilities, with more coming in later releases.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-mulitple-sales-category-region.png" alt-text="Screenshot of small multiples for category and region":::

## Enable the preview feature

On the **File** menu, select **Options and settings** > **Options** > **Preview features**, and select the **Small multiples** check box.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-enable-preview.png" alt-text="Enable the preview for small multiples.":::

Restart Power BI Desktop, and you're ready to try small multiples.

## Create small multiples

Currently, you can create small multiples on bar, column, line, and area charts. 

To get started, create one of the above visuals and 
Choose a field along which you'd like to partition its data. Drag that field into the **Small multiples** well in the Fields section of the Visualizations pane. 
Your chart splits into a 2×2 grid, with the data divided along your chosen dimension. The grid should be filled with the small multiples charts, sorted by the sort order of the chosen dimension, from left-to-right, then top-to-bottom.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-multiple-two-by-two-grid.png" alt-text="Small multiples in a two-by-two grid":::

You'll see that the axes are synchronized, with one Y axis at the left of each row and one X axis at the bottom of each column.

Now that you've created small multiples, see how you [Interact with small multiples in Power BI (preview)](power-bi-visualization-small-multiples-interact.md)


## Format a small multiples visual

Some new options in the formatting pane let you control the look and feel of the grid.

### Change the grid dimensions

You can change the dimensions of the grid in the Grid layout card:



The default is a 2×2 grid of small multiples, but you can adjust the number of rows and columns to up to 6×6. Any multiples that don't fit in that grid load as you scroll down.


### Adjust the small multiples titles

You can adjust the style and position of the small multiple titles in the Small multiple title card:



## Preview limitations

While the feature is in preview, we're constantly working on making sure it interacts well with the rest of our features. Here are some current limitations.

### Fields pane

Date (and other continuous) hierarchies: Creating small multiples out of a visual with a date hierarchy in the X axis, like a line chart, will convert that axis into a categorical axis (from continuous).
Show items with no data: the option still exists, but the behavior may not align with your expectations.
Visual interactions

Categorical axis load more: in non-small multiples visuals, when you have many categories in the axis of your visual, scrolling to the end of the axis will prompt the visual to load more categories in. Currently, a small multiples visual will not load more categories in.
Small multiples sort by measure: sorting on small multiples at all is technically new functionality, but you may be expecting to be able to sort your small multiples by a measure. Currently, you can only sort your multiples by the field's natural sort order.
Right click/context menu -> Analyze: disabled for now.
Right click/context menu -> Summarize: disabled for now.
Data point rectangle select: disabled for now.
Axis zoom: disabled for now.
Accessibility: keyboard navigation and screen readouts can be adjusted to better support the new “grid” layer that small multiples brings to visuals. Some behavior is missing, such as keyboard navigation through the categorical axis scrollbar.
Formatting options

(General) Responsive toggle: the option still exists, but the behavior may not align with your expectations. Since many mobile accommodations are tied to this toggle, the mobile experience will also very closely mirror the experience you find on Desktop and Service.
(General) High density sampling: for line charts, the high density sampling toggle will still exist, but it is not currently supported by small multiples.
(Axis) Concatenate labels: disabled for now.
(Total labels) Total labels for stacked charts: disabled for now.
(Zoom slider) Zoom sliders: disabled for now.
(Analytics pane) Trend lines: disabled for now.
(Analytics pane) Forecasting: disabled for now.
Dynamic formatting for highlight labels: currently not supported.
Service availability

## Authoring in the Power BI service

Authoring small multiples on the web isn't supported while the feature is in preview. So you can view a report with a small multiples visual, and even format the visual, but the small multiples field well won't show up for visuals that don't already have a field in the small multiples well.

## Share your feedback

Let us know your thoughts about the small multiples visual on our community forum and Ideas pages.

[Power BI Community](https://community.powerbi.com/)
[Power BI Ideas page](https://ideas.powerbi.com/ideas/) 
