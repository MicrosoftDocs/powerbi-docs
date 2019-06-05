---
title: Tour the report Filters pane
description: How to add a filter to a report in Power BI service for consumers
author: mihart
manager: kvivek
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-consumer
ms.topic: conceptual
ms.date: 05/30/2019
ms.author: mihart

LocalizationGroup: Reports
---
# Take a tour of the report Filters pane
This article takes a look at the report Filters pane in the Power BI service. Use the filters to discover new insights in your data.

There are many different ways to filter data in Power BI and we recommend first reading [About filters and highlighting](../power-bi-reports-filters-and-highlighting.md).

![report in browser](media/end-user-report-filter/power-bi-browser-new2.png)

## Working with the report Filters pane
When a colleague shares a report with you, be sure to look for the **Filters** pane. Sometimes it's collapsed along the right edge of the report. Select it to expand it.   

![report in browser](media/end-user-report-filter/power-bi-filter-pane.png)

The Filters pane contains filters that were added to the report by the report *designer*. *Consumers* like you, can interact with the existing filters and save your changes, but cannot add new filters to the report. For example, in the screenshot above the designer added two page level filters: Segment and Running Year. You can interact and change these filters, but you cannot add a third page level filter.

In the Power BI service, reports retain any changes you make in the Filters pane, and those changes are carried through to the mobile version of the report. To reset the Filter pane to the designer's defaults, select **Reset to default** from the top menubar.  

![reset to default](media/end-user-report-filter/power-bi-reset-to-default.png)   

## View all the filters for a report page
The Filters pane displays all filters added to the report by the  *designer*. The Filters pane is also the area where you can view information about the filters and interact with them. You can save the changes you make or use **Reset to default** to revert to the original filter settings.

If there are changes you'd like to save, you can also create a personal bookmark.  For more information, see [Add a bookmark to a report](end-user-bookmarks.md).

There are several types of report filters that are displayed and managed from the Filters pane, those applied to a visual, to a report page, and to the entire report.

In this example, we've selected a visual that has 2 filters. The report page also has filters, listed under the **Filters on this page** heading. And the entire report has a filter for Date.

![list of filters](media/end-user-report-filter/power-bi-all-filters2.png)

Some of the filters have the word **All** next to them and this means that all values are being included in the filter.  For example, **Segment(All)** in the screenshot above tells us that this report page includes data about all the product segments.  On the other hand, the page level filter of **Region is West** tells us that the report page only includes data for the West region.

Anyone viewing this report can interact with these filters.

### View only those filters applied to a visual
To get a closer look at the filters applied to a specific visual, hover over the visual to reveal the filter icon ![icon](media/end-user-report-filter/power-bi-filter-icon.png). Select that filter icon to see a pop-up with all the filters, slicers, and so on, affecting that visual. The filters on the pop-up are the same filters displayed on the **Filters** pane. 

![list of filters](media/end-user-report-filter/power-bi-hover-visual-filter.png)

 
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



In the example, below:
1. We can see that the column chart has been cross-filtered.
2. **Included** tells us that the cross-filter is for **Segment**, and three are included. 
3. A slicer has been applied for **Quarter**.
4. **Region** is a filter applied to this report page, and
5. **isVanArsdel** and **Year** are filters applied to this visual.


![list of filters](media/end-user-report-filter/power-bi-visual-pop-up.png)

### Search in a filter
Sometimes a filter can have a long list of values. Use the search box to find and select the value you want. 

![Search in a filter](media/end-user-report-filter/power-bi-fiter-search.png)

### Display filter details
To understand a filter, take a look at the available values and counts.  View the details of the filter by hovering and selecting the arrow next to the filter name. 
  
![shows Lindseys selected](media/end-user-report-filter/power-bi-expand-filter.png)

### Change filter selections
One way to search for data insights is to interact with the filters. You can change filter selections using the dropdown arrow next to the field name.  Depending on the filter and type of data being filtered, your options will range from simple selections from a list to identifying ranges of dates or numbers. In the advanced filter below, we've changed the filter **Total Units YTD** on the treemap to be between 2,000 and 3,000. Notice that this removes Prirum from the treemap. 
  
![shows Fashions Direct selected](media/end-user-report-filter/power-bi-filter-treemap.png)

> [!TIP]
> To select more than one filter value at a time, hold down the CTRL key. Most filters support multi-select. 

### Reset filter to default
If you want to back out of all changes you've made to the filters, select **Reset to default** from the top menubar.  This reverts the filters to their original state, as set by the report *designer*. 

![reset to default](media/end-user-report-filter/power-bi-reset-to-default.png)
    
### Clear a filter
If there's just one filter that you'd like to set to **(All)**, clear it by selecting the eraser icon ![ eraser icon ](media/end-user-report-filter/power-bi-eraser-icon.png) next to the filter name.
  
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
[Learn how and why visuals cross-filter and cross-highlight each other on a report page](end-user-interactions.md)