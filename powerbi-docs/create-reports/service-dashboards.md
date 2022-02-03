---
title: Intro to dashboards for Power BI designers
description: Dashboards are a key feature of Power BI service. They're a single page, often called a canvas, that tells a story through visualizations.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 04/02/2021
LocalizationGroup: Dashboards
---
# Introduction to dashboards for Power BI designers

A Power BI *dashboard* is a single page, often called a canvas, that tells a story through visualizations. Because it's limited to one page, a well-designed dashboard contains only the highlights of that story. Readers can view related reports for the details.

![Dashboard](media/service-dashboards/power-bi-dashboard2.png)

Dashboards are a feature of the Power BI service only. They're not available in Power BI Desktop. Although you can't create dashboards on mobile devices, you can [view and share](../consumer/mobile/mobile-apps-view-dashboard.md) them there.

## Dashboard basics 

The visualizations you see on the dashboard are called *tiles*. You *pin* tiles to a dashboard from reports. If you're new to Power BI, you can get a good foundation by reading [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md).

The visualizations on a dashboard originate from reports and each report is based on a dataset. One way to think of a dashboard is as an entryway to the underlying reports and datasets. Selecting a visualization takes you to the report (and dataset) that it's based on.

![Diagram showing relationship between dashboards, reports, datasets](media/service-dashboards/power-bi-diagram.png)

## Advantages of dashboards
Dashboards are a wonderful way to monitor your business and see all of your most important metrics at a glance. The visualizations on a dashboard can come from one underlying dataset or many, and from one underlying report or many. A dashboard combines on-premises and cloud data, providing a consolidated view regardless of where the data lives.

A dashboard isn't just a pretty picture. It's highly interactive and the tiles update as the underlying data changes.

## Who can create a dashboard?
The ability to create a dashboard is considered a *creator* feature and requires edit permissions on the report. Edit permissions are available to report creators and to those colleagues the creator grants access. For example, if David creates a report in workspace ABC and adds you as a member of that workspace, you and David both have edit permissions. On the other hand, if a report has been shared with you directly or as part of a [Power BI app](../collaborate-share/service-create-distribute-apps.md), you're *consuming* the report. You may not be able to pin tiles to a dashboard. 

> [!IMPORTANT]
> You need a [Power BI Pro](../fundamentals/service-features-license-type.md) or Premium Per User (PPU) license to create dashboards in workspaces. You can create dashboards in your own My Workspace without a Power BI Pro or Premium Per User (PPU) license.


## Dashboards versus reports
[Reports](../consumer/end-user-reports.md) and dashboards seem similar because they're both canvases filled with visualizations. But there are major differences, as you can see in the following table.

| **Capability** | **Dashboards** | **Reports** |
| --- | --- | --- |
| Pages |One page |One or more pages |
| Data sources |One or more reports and one or more datasets per dashboard. |A single dataset per report |
| Drilling down in visuals | Only if you [pin an entire report page](service-dashboard-pin-live-tile-from-report.md) to a dashboard. | Yes |
| Available in Power BI Desktop |No | Yes. Can build and view reports in Power BI Desktop. |
| Filtering |No. Can't filter or slice a dashboard. *Can* filter a [dashboard tile in focus mode](../consumer/end-user-focus.md#working-in-focus-mode), but can't save the filter. |Yes. Many different ways to filter, highlight, and slice. |
| Featured |Yes. Can set one dashboard as your *featured* dashboard. |No |
| Favorite | Yes. Can set multiple dashboards as *favorites*. | Yes. Can set multiple reports as *favorites*. |
| Natural language queries (Q&A) |Yes | Yes, provided you have edit permissions for the report and underlying dataset. |
| Set alerts |Yes. Available for dashboard tiles in certain circumstances. |No |
| Subscribe |Yes. Can subscribe to a dashboard. |Yes. Can subscribe to a report page. |
| Can see underlying dataset tables and fields |No. Can export data but can't see tables and fields in the dashboard itself. |Yes |


## Next steps
* Get comfortable with dashboards by taking a tour of one of our [sample dashboards](sample-tutorial-connect-to-the-samples.md).
* Learn about [dashboard tiles](service-dashboard-tiles.md).
* Want to track an individual dashboard tile and receive an email when it reaches a certain threshold? [Create an alert on a tile](service-set-data-alerts.md).
* Learn how to use [Power BI Q&A](power-bi-tutorial-q-and-a.md) to ask a question about your data and get the answer in the form of a visualization.
