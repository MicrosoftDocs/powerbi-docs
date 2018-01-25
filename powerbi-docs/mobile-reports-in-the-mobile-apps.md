---
title: Explore reports in the Power BI mobile apps
description: 'Learn about viewing and interacting with reports in the Power BI mobile apps on your phone or tablet. You create reports in the Power BI service or Power BI Desktop, then interact with them in the mobile apps. '
services: powerbi
documentationcenter: ''
author: maggiesMSFT
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 01/23/2018
ms.author: maggies

---
# Explore reports in the Power BI mobile apps
Applies to:

| ![iPhone](media/mobile-reports-in-the-mobile-apps/ios-logo-40-px.png) | ![iPad](media/mobile-reports-in-the-mobile-apps/ios-logo-40-px.png) | ![Android phone](media/mobile-reports-in-the-mobile-apps/android-logo-40-px.png) | ![Android tablet](media/mobile-reports-in-the-mobile-apps/android-logo-40-px.png) | ![Windows 10 devices](media/mobile-reports-in-the-mobile-apps/win-10-logo-40-px.png) |
|:--- |:--- |:--- |:--- |:--- |
| iPhones |iPads |Android phones |Android tablets |Windows 10 devices |

A Power BI report is an interactive view of your data, with visuals representing different findings and insights from that data. Viewing reports in the Power BI mobile apps is the third step in a three-step process.

1. [Create reports in Power BI Desktop](desktop-report-view.md). You can even [optimize a report for phones](mobile-apps-view-phone-report.md) in Power BI Desktop. 
2. Publish those reports to the Power BI service [(https://powerbi.com)](https://powerbi.com) or [Power BI Report Server](report-server/get-started.md).  
3. Then interact with those reports in the Power BI mobile apps.

## Open a Power BI report in the mobile app
Power BI reports are stored in different places in the mobile app, depending on where you got them. They can be in Apps, Shared with me, Workspaces (including My Workspace), or on a report server. Sometimes you go through a related dashboard to get to a report, and sometimes they're listed.

* In a dashboard, tap the ellipsis (...) in the upper-right corner of a tile > **Open report**.
  
  ![Open report](media/mobile-reports-in-the-mobile-apps/power-bi-android-open-report-tile.png)
  
  Not all tiles have the option to open in a report. For example, tiles created by asking a question in the Q&A box don't open reports when you tap them. 
  
  On a phone, the report opens in landscape mode, unless it's [optimized for viewing on a phone](mobile-reports-in-the-mobile-apps.md#view-reports-optimized-for-phones).
  
  ![Phone report in landscape mode](media/mobile-reports-in-the-mobile-apps/power-bi-iphone-report-landscape.png)

## View reports optimized for phones
Power BI report authors can create a report layout specifically optimized for phones. Report pages optimized for phones have added functionality: for example, you can drill down and sort in visuals in focus mode, and you can access the [filters the report author added to the report page](mobile-apps-view-phone-report.md#filter-the-report-page-on-a-phone). In a list of reports, an optimized report has a special icon ![Phone report icon](media/mobile-reports-in-the-mobile-apps/power-bi-phone-report-icon.png):

![Open phone report](media/mobile-reports-in-the-mobile-apps/power-bi-android-phone-report.png)

When you view that report on a phone, it opens in portrait view.

![Report in portrait view](media/mobile-reports-in-the-mobile-apps/07-power-bi-phone-report-portrait.png)

 A report may have a mix of pages that are and aren't optimized for phones. If so, when you flip through the report the view will switch from portrait to landscape for each page.

Read more about [reports optimized for phone view](mobile-apps-view-phone-report.md).

## Use slicers to filter a report page
When designing a report in the Power BI service [(https://powerbi.com)](https://powerbi.com), keep in mind that on a phone, you can't see the Filters pane, but you can [see slicers on a report page](power-bi-visualization-slicers.md). Add slicers to a report so you and your colleagues can use the slicers to filter the page on a phone.

* When you select a value in a slicer on the report page, it filters the other visuals on the page.
  
  ![Report slicer](media/mobile-reports-in-the-mobile-apps/power-bi-android-tablet-report-slicer.png)
  
  In this illustration, the slicer is filtering the column chart to show only July values.

## Cross-filter and highlight a Power BI report page
When you select a value in a visual, it doesn't filter the other visuals. It highlights the related values in the other visuals.

* Tap a value in a visual.
  
  ![Cross-filter a page](media/mobile-reports-in-the-mobile-apps/power-bi-android-tablet-report-highlight.png)
  
  Tapping the Large column in one visual highlights related values in the other visuals. 

## Sort a visual on an iPad or a tablet
* Tap the chart, tap the ellipsis (**...**) and tap the field name.
  
   ![Sort a visual](media/mobile-reports-in-the-mobile-apps/power-bi-android-tablet-report-sort.png)
* To reverse the sort order, tap the ellipsis (**...**) again, then tap the same field name again.

## Drill down and up in a visual on an iPad or a tablet
If a report author has added this capability to a visual, on an iPad or a tablet you can drill down in a visual to see the values that make up one part of it. You [add drill down to a visual](power-bi-visualization-drill-down.md) in Power BI Desktop or the Power BI service. 

> [!NOTE]
> Currently, drill-down doesn't work on maps in the iPad or tablet.
> 
> 

* Tap a visual. If it has up and down arrows in the upper corners ![Drill up, down icons](media/mobile-reports-in-the-mobile-apps/power-bi-mobile-drill-up-down.png), then you can drill down. To drill down on one value, tap the arrow in the upper-right corner, then tap a value in the visual &#151; in this case, the dark-blue FD-04 bubble.
  
  ![Drill down in a visual](media/mobile-reports-in-the-mobile-apps/power-bi-mobile-drill-down-one.png)
* To drill back up, tap the up arrow in the upper-left corner.
  
  ![Drill up](media/mobile-reports-in-the-mobile-apps/power-bi-mobile-drill-up.png)

## Go back to My Workspace
* Tap the arrow next to the report name > tap **My Workspace**.
  
  ![Go back up](media/mobile-reports-in-the-mobile-apps/power-bi-iphone-report-back.png)

## Next steps
* [View and interact with Power BI reports optimized for your phone](mobile-apps-view-phone-report.md)
* [Create a version of a report optimized for phones](desktop-create-phone-report.md)
* Questions? [Try asking the Power BI Community](http://community.powerbi.com/)

