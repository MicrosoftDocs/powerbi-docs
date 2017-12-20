---
title: Interact with a report in Reading View in Power BI
description: Interact with a report in Reading View in Power BI
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
ms.date: 12/21/2017
ms.author: mihart

---
# Interact with a report in Reading View in Power BI
## Reading view
Reading view is not as interactive as [Editing view](service-interact-with-a-report-in-editing-view.md), but it still gives you many options for exploring your data. This comes in handy when viewing reports [shared with you](service-share-dashboards.md), that can only be opened in Reading View.

Reading view is a fun and safe way to play with and get to know your data. In Reading View you can cross-highlight and cross-filter visuals on a page.  Simply highlight or select a value in one visual and instantly see its impact on the other visuals. Use the Filter pane to add and modify filters on a report page, and change the way values are sorted in a visualization. Any filtering and highlighting that you do is not saved with the report.

## Cross-highlight the related visualizations on a page
The visualizations on a single report page are all "connected" to each other.  What this means is that if you select one or more values in one visualization, other visualizations that use that same value will change based on that selection.

![cross highlight](media/service-interact-with-a-report-in-reading-view/pagefilter3b.gif)

> [!NOTE]
> To select more than one element in a visualization, hold down the CTRL key.
> 
> 

## Hover over visual elements to see the details
![hover to see details](media/service-interact-with-a-report-in-reading-view/amarillachart.png)

## Sort the data in a visualization
Select the ellipses (...) to open **Sort by**. Select the dropdown arrow to choose which field to sort by or select the AZ icon to switch between ascending and descending. 

![sort a chart](media/service-interact-with-a-report-in-reading-view/pbi_changechartsort.gif) 

## Interact with filters
If the report author added filters to a page in a report, you can interact with them in Reading View. Changes you make will not be saved with the report.

1. Select the Filter icon in the upper-right corner.
   
   ![select the filters icon](media/service-interact-with-a-report-in-reading-view/filters.png)  
2. You'll see all filters that have been applied to the visual you have selected (Visual level filters), across the whole report page (Page level filters), and across the entire report (Report level filters).
   
   ![types of report filters](media/service-interact-with-a-report-in-reading-view/power-bi-reading-filters.png)
3. Hover over a filter and expand it by selecting the down arrow.
   
   ![expand the filter](media/service-interact-with-a-report-in-reading-view/power-bi-expan-filter.png)
4. Make changes to the filters and see how the visuals are impacted.  
   
   * In this example, we have a Page level filter for **Chain**. Change it to **Fashions Direct** instead of **Lindseys** by removing the checkmark from one and adding it to the other.
     
     ![change a page level filter](media/service-interact-with-a-report-in-reading-view/power-bi-filter-chain.png)
   * Or completely remove filtering on **Chain** by selecting the eraser icon ![](media/service-interact-with-a-report-in-reading-view/power-bi-eraser-icon.png) or by selecting both chain stores.
   * Select the **District** page level filter and switch to **Advanced filtering**. Filter to show only districts that start with **FD** and don't contain the number 4.
     
     ![advanced filtering](media/service-interact-with-a-report-in-reading-view/power-bi-advanced-filter.png)

For more information, see [Add a filter to a report](power-bi-report-add-filter.md) and [About filters and highlighting in reports](power-bi-reports-filters-and-highlighting.md).

## Zoom in on individual visuals
Hover over a visual and select the **Focus mode** icon ![](media/service-interact-with-a-report-in-reading-view/pbi_popouticon.jpg). When you view a visualization in Focus mode, it expands to fill the entire report canvas as shown below.

![focus mode](media/service-interact-with-a-report-in-reading-view/powerbi-focus-mode.png)

To display that same visualization without the distraction of menubars, filter pane, and other chrome -- select the **Full Screen** icon from the top menubar  ![](media/service-interact-with-a-report-in-reading-view/power-bi-focus-icon.png)  .

![full screen mode](media/service-interact-with-a-report-in-reading-view/power-bi-full-screen.png)

To learn more, see [Focus mode for reports](service-focus-mode.md) and [Full Screen mode for reports](service-fullscreen-mode.md)

## Adjust the display dimensions
Reports are viewed on many different devices, with varying screen sizes and aspect ratios.  The default rendering may not be what you want to see on your device.  To adjust, select **View** and choose:

* Fit to Page: scale content to best fit the page
* Fit to Width: scale content to the width of the page
* Actual Size: display content at full size  

    ![report View menu](media/service-interact-with-a-report-in-reading-view/power-bi-view.png)

  In Reading View, the display option you select is temporary - it is not saved when you close the report.

  To learn more, see [Tutorial: Change display settings in a report](power-bi-change-report-display-settings.md).

##  Open the **Selection** pane
Easily navigate between the visualizations on the report page. Select **View > Selection pane > On** to open the Selection pane.

![report Selection pane](media/service-interact-with-a-report-in-reading-view/power-bi-selection-pane.png)

To learn more, see Report Selection pane.

##    Miscellaneous other interactions
There are just so many ways you can interact with a report in Reading view. Select a link below to learn more.

- [View report usage metrics](service-usage-metrics.md)
- [View related dashboards, reports, and datasets](service-related-content.md)
- [Subscribe to a report page(s)](service-report-subscribe.md)
- [Analyze in Excel](service-analyze-in-excel.md)
- [Generate QR code](service-create-qr-code-for-report.md)
- [Pin a live page to a dashboard](service-dashboard-pin-live-tile-from-report.md)
- [View messages in the Notifications center](service-notification-center.md)
- [Pin visualizations to a dashboard](service-dashboard-pin-tile-from-report.md)

## Next steps
Back to [Reading view and Editing view in Power BI service](service-reading-view-and-editing-view.md)

[Open Editing view](service-reading-view-and-editing-view.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)

