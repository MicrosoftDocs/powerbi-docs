---
title: Types of filters in Power BI reports
description: Add a page filter, visualization filter, or report filter to a report in Power BI
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 06/24/2019
ms.author: maggies

LocalizationGroup: Reports
---
# Types of filters in Power BI reports

Understanding the different types of filters
Overview
Not all filters behave exactly the same because not all filters are created the same way. In the next section we will take a look at the different ways that filters are created to understand how they behave in the new filter pane in editing mode. 
First let’s start with the two most common filter types.

## Manual Filters 

These are the filters that the report creators drag and drop anywhere on the new filter pane. With these filters, users with edit permission to the report can edit, delete, clear, hide, lock, rename, or sort this filter in the new pane.

## Automatic Filters 

These are the filters that get automatically added to the visual level of the filter pane when you build a visual; these filters are based on the fields that make up your visual. With these filters, users with edit permission to the report can edit, clear, hide, lock, rename, or sort this filter in the new pane, but they cannot delete automatic filters, since the visual references those fields.

## More advanced filters

The next filter types are less common, but it is still important to understand them if they are displayed in your report. 

## Include/Exclude Filters

These are the filters that get automatically added to the filter pane when you use the include or exclude functionality for a visual in your report. With these filters, users with edit permission to the report can delete, lock, hide, or sort this filter in the new pane but they cannot edit, clear, nor rename an include/exclude filter because it is associated with the include/exclude functionality of visuals.

## Drill Down Filters

These are the filters that get automatically added to the filter pane when you use the drill down functionality for a visual in your report. With these filters, users with edit permission to the report can edit or clear the filter in the new pane, but they cannot delete, hide, lock, rename, or sort this filter in the new pane because it is associated with the drill down functionality of visuals. To remove the drill down filter you will need to click the drill up button for the visual.

## Cross Drill Filters

Cross Drill filters are automatically added to the new pane when a drill down filter is passed to another visual on the report page via the cross-filter or cross-highlight feature. Users with edit permission to the report cannot delete, clear, hide, lock, rename, or sort this filter in the new pane because it is associated with the drill down functionality of visuals. They also cannot edit this filter because it comes from another visual’s drill down. To remove the drill down filter you will need to click the drill up button for the visual that is passing the filter.

## Drill through Filters

Drillthrough filters are the filters that get passed from one page to another via the drillthrough feature and will show up in the drillthrough pane. There are two types of drill through filters. First is the one that invokes the drill through. For this type, report editors can edit, delete, clear, hide, or lock this filter. Second type is the drill through filters that get passed along to the target based on the page level filters of the source page. For this transient type of drill through filter, Report editors can edit, delete, clear, this filter, but they cannot lock or hide this filter for the end users.

## URL Filters

These are filters that get added to the new pane by adding a URL query parameter. Users with edit permission to the report can edit, delete, or clear the filter in the new pane, but cannot hide, lock, rename, or sort this filter in the new pane because it is associated with the URL parameters functionality. To remove the filter, you need to remove the parameter from the URL.

app.powerbi.com/groups/me/apps/*app-id*/reports/*report-id*/ReportSection?filter=Stores~2FStatus%20eq%20'Off'

## Pass Through Filters

These are visual-level filters that are created through Q&A. Authors can delete, hide, or sort these filters in the new pane; however, they cannot rename, edit, clear or lock these filters.

## Comparing filter types


| Filter type | Edit | Clear | Delete | Hide | Lock | Sort | Rename |
| Manual Filters | Y | Y | Y | Y | Y | Y | Y |
| Auto Filters | Y | Y | N | Y | Y | Y | Y |
| Include/Exclude Filters | N | N | Y | Y | Y | Y | N |
| Drill Down Filters | Y | Y | N | N | N | N | N |
| Cross Drill Filters | N | N | N | N | N | N | N |
| Drill through Filters (Invokes Drill through) | Y | Y | Y | Y | Y | N | N |
| Drill through Filters (Transient) | Y | Y | Y | N | N | N | N |
| URL Filters - transient | Y | Y | Y | N | N | N | N |
| Pass Through Filters | N | N | Y | Y | N | Y | N |



## Next steps
[Take a tour of the report Filters pane](consumer/end-user-report-filter.md)

[Filters and highlighting in reports](power-bi-reports-filters-and-highlighting.md)

[Interact with filters and highlighting in report Reading view](consumer/end-user-reading-view.md)

[Change how report visuals cross-filter and cross-highlight each other](consumer/end-user-interactions.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

