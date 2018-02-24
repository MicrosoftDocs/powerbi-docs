---
title: Add a visualization or page or drillthrough or report filter to a report
description: Add a page filter, visualization filter, or report filter to a report in Power BI
services: powerbi
documentationcenter: ''
author: mihart
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: monitoring
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 01/08/2018
ms.author: mihart

LocalizationGroup: Reports
---
# Add a filter to a Power BI report (in Editing view)
> [!TIP]
> We recommend first reading [About filters and highlighting in Power BI reports](power-bi-reports-filters-and-highlighting.md).
> 
> 

## What is the difference between report filters in Editing View versus Reading View
There are two modes for interacting with reports: [Reading View](service-reading-view-and-editing-view.md) and [Editing View](service-interact-with-a-report-in-editing-view.md).  And the filtering capabilities available to you depend on which mode you're in.

* In Editing View, you can add report, page, and visual filters. When you save the report, the filters are saved with it. People looking at the report in Reading View can interact with the filters you added, but not save their changes.
* In Reading View, you can interact with any report, page and visual filters that already exist in the report, but you won't be able to save your filter changes.

> [!NOTE]
> This article describes how to create filters in report **Editing View**.  For more information on filters in Reading VIew, see [interacting with filters in report Reading View](service-reading-view-and-editing-view.md).
> 
> 

## Visual filters, page filters, drillthrough filters, and report filters
A **page filter** applies to all the visuals on the report page. A **visual filter** applies to a single visual on a report page. And a **report filter** applies to all pages in the report.

![](media/power-bi-report-add-filter/power-bi-add-filter-reading-view.png)

## Add a filter to a specific visualization (aka visual filter)
There are 2 ways to do this: 

* by filtering a field that is already being used by the visualization
* by identifying a field that is not already being used by the visualization, and adding that field directly to the **Visual level filters** bucket.

### By filtering the fields already in the visualization
1. Open your [report in Editing View](service-reading-view-and-editing-view.md).
   
   ![](media/power-bi-report-add-filter/power-bi-edit-view.png)
2. Open the Visualizations and Filters pane and the Fields pane (if they're not already open).
   
   ![](media/power-bi-report-add-filter/power-bi-display-panes.png)
3. Select a visual to make it active. All the fields being used by the visual are identified in the **Fields** pane and also listed in the **Filters** pane, under the **Visual level filters** heading.
   
   ![](media/power-bi-report-add-filter/power-bi-default-visual-filter.png)
4. At this point we'll add a filter to a field already being used by the visualization. 
   
   * Scroll down to the **Visual level filters** area and select the arrow to expand the field you'd like to filter. In this example we'll filter **StoreNumberName**
     
      ![](media/power-bi-report-add-filter/power-bi-visual-level-filter.png) 
   * Set either **Basic**, **Advanced**, or **Top N** filtering controls (see [How to use report filters](power-bi-how-to-report-filter.md)). In this example we'll select Basic filtering and place checkmarks next to numbers 10, 11, 15, and 18.
     
      ![](media/power-bi-report-add-filter/power-bi-basic-filters.png) 
   * The visual changes to reflect the new filter. If you save your report with the filter, report readers can interact with the filter in Reading View, selecting or clearing values.
     
      ![](media/power-bi-report-add-filter/power-bi-filter-effect.png)
5. Now let's add a totally new field, as a Visual level filter, to our visualization.
   
   * From the Fields pane, select the field you want to add as a new visual level filter, and drag it into the **Visual level filters area**.  In this example we'll drag **District Manager** into the **Visual level filters** bucket and select only Andrew Ma. 
     
      ![](media/power-bi-report-add-filter/power-bi-andrew.png)
   * Notice that **District Manager** is *not* added to the visualization itself. The visualization is still composed of **StoreNumberName** as the Axis and **This Year Sales** as the Value.  
     
      ![](media/power-bi-report-add-filter/power-bi-visualization.png)
   * And, the visualization itself is now filtered to show only Andrew's sales this year for the specified stores.
     
     ![](media/power-bi-report-add-filter/power-bi-filtered-andrew.png)

## Add a filter to an entire page (aka page view filter)
1. Open your [report in Editing View](service-reading-view-and-editing-view.md).
2. Open the Visualizations and Filters pane and the Fields pane (if they're not already open).
3. From the Fields pane, select the field you want to add as a new page level filter, and drag it into the **Page level filters** area.  
4. Select the values you want to filter and set either  **Basic** or **Advanced** filtering controls (see [How to use report filters](power-bi-how-to-report-filter.md)).
   
   All the visualization on the page, impacted by this filter, are re-drawn to reflect the change. 
   
   ![](media/power-bi-report-add-filter/filterpage.gif)

If you save your report with the filter, report readers can interact with the filter in Reading View, selecting or clearing values.

## Add a drillthrough filter
With drillthrough in Power BI service and Power BI Desktop, you can create a *destination* report page that focuses on a specific entity - such as a supplier, or customer, or manufacturer. Now, from the other report pages, users can right-click on a data point for that entity and drillthrough to the focused page.

### Create a drillthrough filter
To follow along, open the Customer Profitability sample in Editing view. Let's say that you want a page that focuses on Executive business areas.   

1. Add a new page to the report and name it **Team Executive**. This will be the drillthrough *destination* page.
2. Add visualizations that track key metrics for the team executives' business areas.    
3. Add **Executive > Executive Name** to the Drillthrough filters well.    
   
    ![](media/power-bi-report-add-filter/power-bi-drillthrough-filter.png)
   
    Notice that Power BI adds a back arrow to the report page.  Selecting the back arrow returns users to the *originating* report page -- the page they were on when they opted to drillthrough. The back arrow only works in Reading view.
   
     ![](media/power-bi-report-add-filter/power-bi-back-arrow.png)

### Use the drillthrough filter
Let's see how the drillthrough filter works.

1. Start on the **Team Scorecard** report page.    
2. Let's say you're Andrew Ma and you want to see the Team Executive report page filtered to just your data.  From the top-left area chart, right click any green data point to open the Drillthrough menu option.
   
    ![](media/power-bi-report-add-filter/power-bi-drillthrough.png)
3. Select **Drillthrough > Team Executive** to drillthrough to the report page named **Team Executive**. The page is filtered to show information about the data point from which you right-clicked; in this case Andrew Ma. Only the field that is in the Drillthrough filters well gets passed through to the drillthrough report page.  
   
    ![](media/power-bi-report-add-filter/power-bi-drillthrough-executive.png)

## Add a filter to an entire report (aka Report filter)
1. Open your [report in Editing View](service-reading-view-and-editing-view.md).
2. Open the Visualizations and Filters pane and the Fields pane (if they're not already open).
3. From the Fields pane, select the field you want to add as a new report level filter, and drag it into the **Report level filters** area.  
4. Select the values you want to filter (see [How to use report filters](power-bi-how-to-report-filter.md)).

The visuals on the active page, and on all pages in the report, change to reflect the new filter. If you save your report with the filter, report readers can interact with the filter in Reading View, selecting or clearing values.

1. Select the back arrow to return to the previous report page.

## Troubleshooting
### Why your visual level filter and page level filter may return different results
When you add a visual level filter, Power BI filters on the aggregated results.  The default aggregation is Sum, but you can [change the aggregation type](service-aggregates.md).  

When you add a page level filter, Power BI filters without aggregating.  It does this because a page can have many visuals which can each utilize different aggregation types.  So the filter is applied on each data row.

If you do not see the Fields pane, make sure you're in report [Editing view](service-interact-with-a-report-in-editing-view.md)

## Next steps
 [How to use report filters](power-bi-how-to-report-filter.md)

  [Filters and highlighting in reports](power-bi-reports-filters-and-highlighting.md)

[Interact with filters and highlighting in report Reading View](service-reading-view-and-editing-view.md)

[Change how report visuals cross-filter and cross-highlight each other](service-reports-visual-interactions.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

