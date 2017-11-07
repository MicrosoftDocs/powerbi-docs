---
title: what is a Power BI dashboard?
description: Dashboards are a key feature of Power BI service.
services: powerbi
documentationcenter: ''
author: mihart
manager: erikre
backup: ''
editor: ''
tags: ''
qualityfocus: monitoring
qualitydate: 04/05/2017

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 05/31/2017
ms.author: mihart

---
# Dashboards in Power BI service
## What is a dashboard?
A Power BI ***dashboard*** is a single page, often called a canvas, that uses visualizations to tell a story. Because it is limited to one page, a well-designed dashboard contains only the most-important elements of that story.

![](media/service-dashboards/power-bi-dashboard2.png)

The visualizations you see on the dashboard are called *tiles* and are *pinned* to the dashboard from reports. If you're new to Power BI, you can get a good foundation by reading [Power BI basic concepts](service-basic-concepts.md).

> [!NOTE]
> Dashboards are a feature of Power BI service and are not available in Power BI Desktop. Dashboards can't be created on mobile devices but they can be [viewed and shared](powerbi-mobile-create-dashboard.md).
> 
> 

The visualizations on a dashboard come from reports and each report is based on one dataset. In fact, one way to think of a dashboard is as an entryway into the underlying reports and datasets. Selecting a visualization takes you to the report (and dataset) that was used to create it.

![](media/service-dashboards/power-bi-diagram.png)

## Advantages of dashboards
Dashboards are a wonderful way to monitor your business, to look for answers, and to see all of your most-important metrics at a glance. The visualizations on a dashboard may come from one underlying dataset or many, and from one underlying report or many. A dashboard combines on-premises and cloud-born data, providing a consolidated view regardless of where the data lives.

A dashboard isn't just a pretty picture; it's highly interactive and highly customizable and the tiles update as the underlying data changes.

## Dashboards versus reports
[Reports](powerbi-service-reports.md) are often confused with dashboards since they too are canvases filled with visualizations. But there are some major differences.

| **Capability** | **Dashboards** | **Reports** |
| --- | --- | --- |
| Pages |One page |One or more pages |
| Data sources |One or more reports and one or more datasets per dashboard |A single dataset per report |
| Available in Power BI Desktop |No |Yes, can create and view reports in Desktop |
| Pinning |Can pin existing visualizations (tiles) only from current dashboard to your other dashboards |Can pin visualizations (as tiles) to any of your dashboards. Can pin entire report pages to any of your dashboards. |
| Subscribe |Can't subscribe to a dashboard |Can subscribe to report pages |
| Filtering |Can't filter or slice |Many different ways to filter, highlight, and slice |
| Set alerts |Can create alerts to email you when certain conditions are met |No |
| Feature |Can set one dashboard as your "featured" dashboard |Cannot create a featured report |
| Natural language queries |Available from dashboard |Not available from reports |
| Can change visualization type |No. In fact, if a report owner changes the visualization type in the report, the pinned visualization on the dashboard does not update |Yes |
| Can see underlying dataset tables and fields |No. Can export data but can't see tables and fields in the dashboard itself. |Yes. Can see dataset tables and fields and values. |
| Can create visualizations |Limited to adding widgets to dashboard using "Add tile" |Can create many different types of visuals, add custom visuals, edit visuals and more with Editing permissions |
| Customization |Can do things with the visualizations (tiles) like move and arrange, resize, add links, rename, delete, and display full screen. But the data and visualizations themselves are read-only. |In Reading view you can publish, embed, filter,export, download as .pbix, view related content, generate QR codes, analyze in Excel, and more.  In Editing view you can do everything mentioned so far and so much more. |

## Dashboard ***creators*** and dashboard ***consumers***
Depending on your role, you may be someone who creates dashboards for your own use or to share with colleagues. You want to learn how to create and share dashboards. Or, you may be someone who receives dashboards from others. You want to learn how to understand and interact with the dashboard.

Here are some topics, by role, to help you get started.

Power BI Pro is required for both sharing a dashboard and viewing a shared dashboard.

### If you will be creating and sharing dashboards
* Use one of our samples to [create a dashboard from a report](service-dashboard-create.md).
* Learn about [dashboard tiles](service-dashboard-tiles.md) and all the different ways to pin them to a dashboard.
* Help your dashboard consumers by creating dashboards that [work well with Q&A natural language queries](powerbi-service-make-your-data-work-well-with-q-and-a.md) and with [Quick insights](service-insights-optimize.md).
* Discover all the different ways you can [share a dashboard with colleagues](service-how-to-collaborate-distribute-dashboards-reports.md).

### If you will be receiving and consuming dashboards
* Get comfortable with dashboards by taking a tour of one of our [sample dashboards](sample-tutorial-connect-to-the-samples.md).
* Learn about [dashboard tiles](service-dashboard-tiles.md) and what will happen when you select one.
* Don't like the look of a dashboard?  You can [resize, move, and rename the tiles](service-dashboard-edit-tile.md).
* Want to track an individual dashboard tile and receive an email when it reaches a certain threshold? [Create alerts on tiles](powerbi-service-set-data-alerts.md).
* Have fun asking your dashboard questions. Learn how to use [Power BI Q&A](service-how-to-q-and-a.md) to ask a question about your data and get the answer in the form of a visualization.

> [!TIP]
> If you didn’t find what you’re looking for here, use the Table of Contents to the left.
> 
> 

## Next steps
[Get Started with Power BI](service-get-started.md)  
[Power BI - Basic Concepts](service-basic-concepts.md)  
[Power BI Premium - what is it?](service-premium.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

