---
title: Small multiples in Power BI (preview)
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
# Small multiples in Power BI (preview)

[!INCLUDE [applies-to](../includes/applies-to.md)] [!INCLUDE [yes-desktop](../includes/yes-desktop.md)] [!INCLUDE [yes-service](../includes/yes-service.md)]

Small multiples, or trellising, splits a visual into multiple versions of itself, presented side-by-side, with its data partitioned across these versions by a chosen dimension. For example, a small multiple could split a “sales by category” column chart across product lines or regions. In this preview, small multiples have a small set of capabilities, with more coming in later releases.

## Enable the preview feature

On the **File** menu, select **Options and settings** > **Options** > **Preview features**, and select the **Small multiples** check box.

:::image type="content" source="media/power-bi-visualization-small-multiples/small-mulitple-sales-category-region.png" alt-text="Screenshot of small multiples for category and region":::

Restart Power BI Desktop, and you're ready to try small multiples.

b. Creating small multiples
Currently, you can create small multiples on your bar/column, line, and area charts. To get started, create one of the above visuals and choose a field along which you would like to partition its data. Drag that field into the “small multiples” well in the Fields pane. You will see your chart split into a 2×2 grid, where the data has been divided along your chosen dimension. The grid should be filled with the small multiples charts, sorted by the sort order of the chosen dimension, from left-to-right, then top-to-bottom.



You’ll see that the axes are synchronized, with one Y axis at the left of each row and one X axis at the bottom of each column.

c. Interacting with your data
Selection

You can select different subsets of data by clicking on different parts of the visual.

Data points: Hovering the data point on one multiple causes the tooltip to show in that multiple, as well as a guide line on the x axis for line charts. Clicking on that data point will cross highlight/filter other visuals by both the axis value and the small multiple category, as well as dim other multiples.


Categorical axis value: Clicking on a category label will cross highlight/filter other visuals by that axis value.


Title: Clicking on a multiple’s title will cross filter/highlight other visuals by the category or combination of categories listed on that subheader.


Legend: Clicking on a legend category will cross filter/highlight other visuals and cross highlight other multiples.


Scrolling

If you have more small multiples than fit into the grid, you will be able to scroll down to see the rest of your categories.

If you have a categorical X axis with many categories, you will also see a scrollbar for each copy of that axis. Scrolling on that axis will move them all together. If you are using a scroll wheel, holding shift and scrolling will scroll the categorical axes.

Sorting

You may also notice a new sort UI that allows you to sort multiple different aspects of a visual at once:



While this experience is rolling out only for small multiples visuals at the moment, we plan on making this the new sort experience for visuals in the rest of the product, as well — consider it a step towards our supporting more sortable visual elements in the future.

d. Formatting your small multiples visual
You will find some new options in the formatting pane to allow you to control the look and feel of the grid.

You can adjust the style and position of the small multiple titles in the Small multiple title card:



And you can change the dimensions of the grid in the Grid layout card:



The default is a 2×2 grid of small multiples, but you can adjust the number of rows and columns to up to 6×6. Any multiples that don’t fit on that grid will load in as you scroll down.

II. Preview limitations
While the feature is in preview, we’re constantly working on making sure it interacts well with the rest of our features. Some of those interactions aren’t quite there yet, but as we continue development on small multiples, we’ll start crossing limitations off this list:

Fields pane

Date (and other continuous) hierarchies: Creating small multiples out of a visual with a date hierarchy in the X axis, like a line chart, will convert that axis into a categorical axis (from continuous).
Show items with no data: the option still exists, but the behavior may not align with your expectations.
Visual interactions

Categorical axis load more: in non-small multiples visuals, when you have many categories in the axis of your visual, scrolling to the end of the axis will prompt the visual to load more categories in. Currently, a small multiples visual will not load more categories in.
Small multiples sort by measure: sorting on small multiples at all is technically new functionality, but you may be expecting to be able to sort your small multiples by a measure. Currently, you can only sort your multiples by the field’s natural sort order.
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

Authoring small multiples on the web will not be supported while the feature is in preview. This means that while you will be able to view a report with a small multiples visual and even format the visual, the small multiples field well will not show up for visuals that are do not already have a field in the small multiples well.

III. Feature roadmap
We wanted to let you know what we’ve got planned for this feature, both in terms of new functionality and in terms of support for the above. Hopefully, small multiples will grow more and more versatile as we work on it – and ultimately cover the vast majority of your use cases.

Keep in mind that while feature work is currently prioritized broadly as follows, they will not necessarily all be coming at the same time or in back-to-back releases. Items on these lists may move around or be removed entirely – everything is tentative. That said, we do hope to make all of these improvements between now, through GA, and in the releases after, and in roughly the following order.

Take a look at what’s coming:

Preview Milestone 1

Limitations: support for date/continuous axis hierarchies
New visual: support for combo (line and stacked/clustered column) charts
Formatting: adding and formatting grid lines between the multiples
Formatting: adjusting padding between small multiples elements
Formatting: subheader text wrap and font color
Formatting: small multiple background colors
Preview Milestone 2

Limitations: support for category axis load more
New visual: support for scatter charts
Formatting: X and Y axes can be shared or repeated (so that they are repeated for each multiples rather than only at the ends of row/columns)
Formatting: Y axis ranges can be synchronized or unsynchronized (to allow comparison of trends across multiples whose ranges vary wildly)
General availability and beyond

Limitations: support for small multiples sort by measure
Limitations: support for show items with no data
Limitations: high density sampling
Limitations: responsive toggle
Limitations: axis concatenate labels
Limitations: analytics (trend lines, forecasting)
Limitations: zoom sliders
Limitations: data point rectangle select
Limitations: total labels for stacked charts
Limitations: dynamic formatting for highlight labels
Interaction: hovering a data point on a line chart also causes the guide line and data label to show for the data point at the same X value in other multiples
Formatting: an “auto” option for grid formatting, a new default which automatically sets grid dimensions (rather than defaulting to 2×2)
Formatting: shared axis title (so that the axis title only shows up once, rather than for each row/column)
Accessibility support

Share your feedback
Small multiples is a big feature with a lot of use cases, and the best way to make sure we’re giving you the functionality you need is by hearing from you yourself. We would love to hear your feedback for us, and we’re hopefully making it convenient for you to share those thoughts!

The best way for you to provide feedback is through our survey. In this survey, we’ll ask you specific questions to get a sense for how well small multiples is meeting your needs, what you think of what we have planned, and what else you would like to see. Every question is optional, and we’ll include a text box at the end for any feedback you might have. Here’s the link:

You can also let us know your thoughts on our community forum and Ideas pages.

Community post
Ideas page 


