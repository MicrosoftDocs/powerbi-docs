---
title: Reports in Power BI
description: Reports in Power BI
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 03/01/2018
ms.author: mihart

LocalizationGroup: Reports
---
# Reports in Power BI
## What is a Power BI report?
A Power BI ***report*** is a multi-perspective view into a dataset, with visualizations that represent different findings and insights from that dataset.  A report can have a single visualization or pages full of visualizations. Depending on your job role, you may be someone who *creates* reports and/or you may be someone who *consumes* or uses reports.

![report page](./media/end-user-reports/reportview.png)

This report has 3 pages (or tabs) and we're currently viewing the Store Sales Overview page. On this page are 6 different visualizations and a page title. Visualizations can be *pinned* to dashboards and when that pinned visualization is selected, it opens the report it was pinned from.

If you're new to Power BI, you can get a good foundation by reading [Power BI basic concepts](end-user-basic-concepts.md)

Reports are a feature of Power BI service and Power BI Desktop. The experience of working with reports is almost identical. However, for mobile, you can't create reports but you can [view, share, and annotate reports](mobile/mobile-reports-in-the-mobile-apps.md).

## Advantages of reports
Reports are based on a single dataset. The visualizations in a report each represent a nugget of information. And the visualizations aren't static; you can add and remove data, change visualization types, and apply filters and slicers as you dig into the data to discover insights and look for answers. Like a dashboard, but more-so, a report is highly interactive and highly customizable and the visualizations update as the underlying data changes.

## Dashboards versus reports
[Dashboards](end-user-dashboards.md) are often confused with reports since they too are canvases filled with visualizations. But there are some major differences.  

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

## Report ***creators*** and report ***consumers***
Depending on your role, you may be someone who creates reports for your own use or to share with colleagues. You want to learn how to create and share reports. Or, you may be someone who receives reports from others. You want to learn how to understand and interact with the reports.

Here are some topics, by role, to help you get started.

### If you will be creating and sharing reports
* Start with a [tour of Power BI service](end-user-basic-concepts.md) so you know where to find reports and report tools.
* Take a tour of the [report editor](../service-the-report-editor-take-a-tour.md).
* Learn how to [create a report from a dataset](../service-report-create-new.md).
* [Learn how to use visualization, page, and report-level filters](end-user-report-filter.md)
* Discover all the different ways you can [share a report with colleagues](../service-share-dashboards.md).

### If you will be receiving and consuming reports
* Start with a [tour of Power BI service](end-user-basic-concepts.md) so you know where to find reports and report tools.
* Learn how to [open a report](end-user-report-open.md) and all the interaction available in [Reading view](end-user-reading-view.md).
* Get comfortable with reports by taking a tour of one of our [samples](../sample-tutorial-connect-to-the-samples.md).  
<!--* Don't need the report any more? You can [remove it](../service-delete.md).-->
* To see which dataset the report is using and which dashboards have tiles pinned from the report, [view related content](end-user-related.md).

> [!TIP]
> If you didn’t find what you’re looking for here, use the Table of Contents to the left to browse all *report* topics.
> 
> 

## Next steps
[What is Power BI?](../power-bi-overview.md) 

[Power BI - Basic Concepts](end-user-basic-concepts.md)

