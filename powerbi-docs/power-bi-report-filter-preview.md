---
title: The new Filters experience in Power BI reports (Preview)
description: Add a page filter, visualization filter, or report filter to a report in Power BI
author: maggiesMSFT
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 10/25/2018
ms.author: maggies

LocalizationGroup: Reports
---
# The new Filters experience in Power BI reports (Preview)

This article spells out the new filter experience -- filters in Power BI are getting new functionality and a new design. Report designers in Power BI Desktop and in the Power BI service can now design the filters pane to look like and act with the whole report. 
 
Default view (no additional customization applied)

As a report designer, here's what you can do with the new filters:

- Show read only view of filters in the visual header, so consumers know exactly what filters or slicers are affecting a given visual
- Format and customize the filter pane so that it feels part of your report
- Flexibility of defining default expand / collapsed filter pane at report load time for consumers
- Hide the entire filter pane or specific filters that you don’t want report consumers to see
- Control and even bookmark the visibility, open, and collapsed state of the new filter pane
- Lock filters that you don’t want consumers to edit

## Turn on the new filter experience 

Since this new filter experience is in Preview, you must first enable it in Power BI Desktop. To do so, select File > Options and Settings > Options > Preview Features, then select the New filter experience checkbox. You’ll need to restart Power BI Desktop after you make this selection.
 

Once this experience has been enabled, all new reports you create will be enabled for this experience by default. 
If desired, you can also enable this experience for an old report. To configure this experience per old report, select File > Options and Settings > Options > Report settings. Keep in mind you’ll need to restart Power BI Desktop after you make a configuration change.
 
Once the experience is enabled, the new filter pane and the read only filter view per visual will start working. 
Building the new filter pane
Once the new filter pane is enabled, you’ll see it attached to the report page. It will be formatted by default based on your current report settings. This new filter pane is what your report consumers will see when you publish your report, and the older filter pane now acts as a filter editing pane. This means you can update existing filters through the new pane, but you’ll use the older filter pane to configure which filters to include.
Note: Wondering why we have two filter panes? The new filter pane gives you a taste of what your report consumers will see without publishing the report (same as any other visual in your report). In a few months, we will remove the old filter pane and the new pane will be used to add new filters as well.
To start with building your new filter pane, drag and drop the fields of interest into the filter editor pane. 
 


Report creator can completely hide the filter pane from the report consumers by clicking on the eye icon as highlighted above.
Report creators can also use the filter editing pane to lock or hide individual filter cards. As you toggle these settings in the editor, you’ll see the changes reflected in the new filter pane. Hiding filter cards is typically useful if report authors are trying to hide data cleanup filters that exclude nulls or unexpected values. It is important to note that hidden filters will not show up in read only per visual filter pop-up.
 

When building your filter pane, you can also configure your filter pane state to flow with your report bookmarks. The pane’s open, close, and visibility state are all bookmarkable.
 


Formatting the new filter pane
A big part of this new experience is that you can now format the filter pane to match the look and feel of your report.
Report authors can format the following for the filter pane: 
•	Background color of the filter pane
•	Background transparency
•	Filter pane border on or off
•	Filter pane border color

 

Report authors can format the following for the applied (when the filter is set to something) and available (when filter is cleared) filter cards: 
•	Background color
•	Background transparency
•	Border: on or off
•	Border color
  

Read only view of filters per visual

This will enable report consumers to know what filters, slicers, cross filters etc. are affecting a visual. The formatting of the edit pop-up will be inherited from the filter pane formatting.

Here’s are the following types of filters captured in this view: 
•	Basic filters
•	Slicers
•	Cross-highlight 
•	Cross-filter
•	Advanced filters
•	Top N filters
•	Relative Date filters
•	Sync-slicers
•	Include/Exclude filters
•	Filters passed through URL

Coming soon

We have plans to incorporate the following improvements in coming months… 
•	Ability to change the order of filter cards
•	Single filter pane experience for report creators 
•	More formatting options
Give the new filter experience a try and provide us your feedback for this feature and how we can continue to improve this experience! 






## Next steps
 [How to use report filters](consumer/end-user-report-filter.md)

  [Filters and highlighting in reports](power-bi-reports-filters-and-highlighting.md)

[Interact with filters and highlighting in report Reading View](consumer/end-user-reading-view.md)

[Change how report visuals cross-filter and cross-highlight each other](consumer/end-user-interactions.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

