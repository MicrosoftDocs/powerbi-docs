---
title: Report Reading view and Editing view in Power BI service
description: High level overview of the differences between Reading view and Editing view for Power BI service reports
services: powerbi
documentationcenter: ''
author: mihart
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
ms.date: 12/21/2017
ms.author: mihart

---
# Reading View and Editing View in Power BI service reports
In Power BI service (not Power BI Desktop) there are two modes for viewing and interacting with reports: Reading view and Editing view.  

Reading view is available to all users while Editing view is only available to report creators and owners. Reading view is designed for report *consumers*; those colleagues who open reports from Apps or who have reports shared with them. Reading view ensures that every single consumer of a specific report is seeing the same report, the same visualizations, with the same filters applied.  Consumers can interact with the reports, but cannot save changes.

>**NOTE**: In certain circumstances, report consumers may see different data because of row level security and data permissions. 

Editing view is only available to those who created the report or who co-own the report as a member or admin of an app workspace.

## Reading view

Reading view is a fun and safe way to play with and get to know the data. Reading view is not as interactive as [Editing view](service-interact-with-a-report-in-editing-view.md), but it still gives you many options for exploring your data. This comes in handy, for example, when viewing reports [shared with you](service-share-dashboards.md), that can only be opened in Reading view.

To learn more, see [Reading view for Power BI reports](service-interact-with-a-report-in-reading-view.md).

## Editing view
In Editing View in Power BI (compared to [Reading View](service-interact-with-a-report-in-reading-view.md)) you can dig even deeper into your data by adding and removing fields, changing visualization type, creating new visualizations, and adding and deleting visualizations and pages from the report.

To learn more, see [Editing view for Power BI reports](service-interact-with-a-report-in-editing-view.md)

## Navigating between Editing view and Reading view
Remember, only report creators and owners will be able to open a report in Editing view.

1. By default, a report usually opens in Reading view. You can tell you're in Reading view if you see an option for **Edit report**. If **Edit report** is greyed out, you do not have permissions to open the report in Editing view.

   ![](media/service-reading-view-and-editing-view/power-bi-edit-report-grey.png)

2. If **Edit Report** is not greyed out, select it to open the report in Editing view. 
   
   ![](media/service-reading-view-and-editing-view/power-bi-edit-report.png)
   
   The report is now in Editing view and uses the same [display settings](power-bi-report-display-settings.md) you last used in Reading View.

2. To return to Reading view, select **Reading view** from the top navigation bar.
   
    ![](media/service-reading-view-and-editing-view/power-bi-reading-view.png)

There are so many ways to interact with a report in Reading view, slicing and dicing your data to discover insights and get answers to questions.  The next topic, [Interact with a report in Reading view](service-interact-with-a-report-in-editing-view.md), lists and describes these in detail.

### Next steps
[Interact with a report in Reading view](service-interact-with-a-report-in-editing-view.md)    
Back to [reports in Power BI](service-reports.md)    
More questions? [Try the Power BI Community](http://community.powerbi.com/) 

