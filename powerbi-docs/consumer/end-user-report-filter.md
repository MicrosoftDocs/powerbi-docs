---
title: Tour the report Filters pane
description: How to add a filter to a report in the Power BI service for consumers
author: mihart
manager: kvivek
ms.reviewer: ''
ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 10/22/2019
ms.author: mihart
LocalizationGroup: Reports
---

# Take a tour of the report Filters pane

[!INCLUDE [power-bi-service-new-look-include](../includes/power-bi-service-new-look-include.md)]

This article takes a look at the report **Filters** pane in the Power BI service. Use the filters to discover new insights in your data.

There are many different ways to filter data in Power BI. For more info about filters, see [Filters and highlighting in Power BI reports](../power-bi-reports-filters-and-highlighting.md).

![Screenshot of a report in the browser with an arrow pointing to the Filters option.](media/end-user-report-filter/power-bi-report.png)

## Working with the report Filters pane

When a colleague shares a report with you, be sure to look for the **Filters** pane. Sometimes it's collapsed along the right edge of the report. Select it to expand it.

![Screenshot of the report with the Filters pane expanded.](media/end-user-report-filter/power-bi-expand-filter-pane.png)

The **Filters** pane contains filters that the report *designer* added to the report. *Consumers* like you can interact with the existing filters and save your changes, but you can't add new filters to the report. For example, in the screenshot above the designer added three page level filters: **Segment is All**, **Year is 2014**, and **Region is Central**. You can interact and change these filters, but you can't add a fourth page level filter.

In the Power BI service, reports keep any changes you make in the **Filters** pane. The service carries those changes through to the mobile version of the report. 

To reset the **Filters** pane to the designer's defaults, select **Reset to default** from the upper menu bar.

![Screenshot of the Reset to default icon.](media/end-user-report-filter/power-bi-reset-icon.png) 

> [!NOTE]
> If you don't see the **Reset to default** option, it may have been disabled by the report *designer*. The *designer* can also lock specific filters so that you can't change them.

## View all the filters for a report page

The **Filters** pane displays all filters added by the designer to the report. The **Filters** pane is also the area where you can view information about the filters and interact with them. Save changes you make or use **Reset to default** to revert to the original filter settings.

If there are changes you'd like to save, you can also create a personal bookmark. For more information, see [What are bookmarks?](end-user-bookmarks.md).

The **Filters** pane displays and manages several types of report filters: report, report page, and visual.

In this example, we've selected a visual that has three filters. The report page also has filters, listed under the **Filters on this page** heading. Also, the entire report has a filter for **Date**.

![Screenshot of a report with a visualization and its related filters called out.](media/end-user-report-filter/power-bi-filters-pane.png)

Some of the filters have **(All)** next to them. **(All)** means all values are being included in the filter. In the screenshot above, **Segment(All)** tells us this report page includes data about all the product segments. 

Anyone viewing this report can interact with these filters.

### View only those filters applied to a visual

To get a closer look at the filters applied to a specific visual, hover over the visual to reveal the filter icon ![Screenshot of the Filter icon.](media/end-user-report-filter/power-bi-filter-icon.png). Select that filter icon to see a pop-up with all the filters, slicers, and so on, affecting that visual. The filters on the pop-up include the same filters displayed on the **Filters** pane, plus additional filtering affecting the selected visual.

![Screenshot of a list of filters with arrows pointing to where those filters are on the Filters pane.](media/end-user-report-filter/power-bi-hover-filters.png)

Here are the types of filters this view can display:

- Basic filters
- Slicers
- Cross-highlighting
- Cross-filtering
- Advanced filters
- Top N filters
- Relative Date filters
- Sync-slicers
- Include/Exclude filters
- Filters passed through a URL

In this example:
1. **Included** tells us that the visual has been cross-filtered. What this means is that the states of Utah, Colorado, and Texas have been selected on one of the other visuals on this report page. In this case, it's the map. The selection of those three states has eliminated data for all other states from displaying on the selected bar chart.  

1. **Date** is a filter applied to all pages in this report, and

1. **Region is Central** and **Year is 2014** are filters applied to this report page, and

4. **Manufacturer is VanArsdel, Natura, Aliqui, or Pirum** is a filter applied to this visual.


### Search in a filter

Sometimes a filter can have a long list of values. Use the search box to find and select the value you want.

![Screenshot of how to search in a filter.](media/end-user-report-filter/power-bi-search.png)

### Display filter details

To understand a filter, take a look at the available values and counts.  View the details of the filter by hovering and selecting the arrow next to the filter name.
  
![Screenshot of a filter that shows the west region selected.](media/end-user-report-filter/power-bi-filter-expand.png)

### Change filter selections

One way to search for data insights is to interact with the filters. You can change filter selections using the drop-down arrow next to the field name.  Depending on the filter and type of data that Power BI is filtering, your options will range from simple selections from a list to identifying ranges of dates or numbers. In the advanced filter below, we've changed the **Total Units YTD** filter on the treemap to be between 2,000 and 3,000. Notice that this change removes Pirum from the treemap.
  
![Screenshot of a report and its filters that shows treemap visual selected.](media/end-user-report-filter/power-bi-treemap-filters.png)

> [!TIP]
> To select more than one filter value at a time, hold down the CTRL key. Most filters support multi-select.

### Reset filter to default

If you want to back out of all changes you've made to the filters, select **Reset to default** from the top menu bar.  This selection reverts the filters to their original state, as set by the report designer.

![Screenshot of the Reset to default option.](media/end-user-report-filter/power-bi-reset-icon.png)

### Clear a filter

To reset a filter to (All), clear it by selecting the eraser icon next to the filter name.

![Screenshot of the Eraser icon.](media/end-user-report-filter/power-bi-eraser.png)
  
<!--  too much detail for consumers

## Types of filters: text field filters
### List mode
Ticking a checkbox either selects or deselects the value. The **All** checkbox can be used to toggle the state of all checkboxes on or off. The checkboxes represent all the available values for that field.  As you adjust the filter, the restatement updates to reflect your choices. 

![list mode filter](media/end-user-report-filter/power-bi-restatement-new.png)

Note how the restatement now says "is Mar, Apr or May".

### Advanced mode
Select **Advanced Filtering** to switch to advanced mode. Use the dropdown controls and text boxes to identify which fields to include. By choosing between **And** and **Or**, you can build complex filter expressions. Select the **Apply Filter** button when you've set the values you want.  

![advanced mode](media/end-user-report-filter/power-bi-advanced.png)

## Types of filters: numeric field filters
### List mode
If the values are finite, selecting the field name displays a list.  See **Text field filters** &gt; **List mode** above for help using checkboxes.   

### Advanced mode
If the values are infinite or represent a range, selecting the field name opens the advanced filter mode. Use the dropdown and text boxes to specify a range of values that you want to see. 

![advanced filter](media/end-user-report-filter/power-bi-dropdown-and-text.png)

By choosing between **And** and **Or**, you can build complex filter expressions. Select the **Apply Filter** button when you've set the values you want.

## Types of filters: date and time
### List mode
If the values are finite, selecting the field name displays a list.  See **Text field filters** &gt; **List mode** above for help using checkboxes.   

### Advanced mode
If the field values represent date or time, you can specify a start/end time when using Date/Time filters.  

![datetime filter](media/end-user-report-filter/pbi_date-time-filters.png)

-->

## Next steps

Learn how and why [visuals cross-filter and cross-highlight each other on a report page](end-user-interactions.md)