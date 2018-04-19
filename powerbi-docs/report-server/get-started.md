---
title: What is Power BI Report Server?
description: Get an overview of Power BI Report Server to understand how it fits in with SQL Server Reporting Services (SSRS) and the rest of Power BI.
services: powerbi
keywords: 
author: maggiesMSFT
ms.author: maggies
ms.date: 04/16/2018
ms.topic: overview
ms.service: powerbi
manager: kfile
ms.custom: mvc
---
# What is Power BI Report Server?

Power BI Report Server is an on-premises report server for hosting Power BI reports, paginated reports, mobile reports, and KPIs, and the tools to create them.  
Create, deploy, and manage Power BI, mobile and paginated reports on premises with the range of ready-to-use tools and services that Power BI Report Server provides.

Power BI Report Server is a solution that customers deploy on their own premises for creating, publishing, and managing reports, then delivering them to the right users in different ways, whether that’s viewing them in web browser, on their mobile device, or as an email in their in-box.

Power BI Report Server is a suite of products:

* A web portal you can view in any modern browser. In the web portal, you can organize and display reports and KPIs. You can also store Excel workbooks on the portal.
* Power BI reports, created with Power BI Desktop, that you can view within the web portal in your own environment.
* Paginated reports so you can create modern-looking reports, with tools for creating them.
* Mobile reports with a responsive layout that adapts to different devices and the different ways you hold them.

Read on for more about each.


## Web portal
![](media/get-started/web-portal.png)

The entry point for Power BI Report Server is a web portal you can view in any modern browser. You can access all your reports and KPIs in the new portal.

You can apply your own custom [branding](https://docs.microsoft.com/sql/reporting-services/branding-the-web-portal) to your web portal. And you can create KPIs right in the web portal. KPIs can surface business metrics in the browser, without having to open a report.

You organize the content on the web portal in a traditional folder hierarchy, and you can tag favorites to show up at th .by type: Power BI reports, mobile reports, paginated reports and KPIs, plus Excel workbooks, shared datasets, and shared data sources to use as building blocks for your reports. You can store and manage them securely here,  You can tag your favorites, and you can manage the content if you have that role.

And you can schedule report processing, access reports on demand, and subscribe to published reports in the new web portal.

More about the [Web portal](https://docs.microsoft.com/sql/reporting-services/web-portal-ssrs-native-mode).

## Power BI reports
![](media/get-started/powerbi-reports.png)

A Power BI report is a multi-perspective view into a dataset, with visualizations that represent different findings and insights from that dataset.  A report can have a single visualization or pages full of visualizations. Depending on your job role, you may be someone who creates reports and/or you may be someone who consumes or uses reports.

Reports are based on a single dataset. The visualizations in a report each represent a nugget of information. And the visualizations aren't static; you can add and remove data, change visualization types, and apply filters and slicers as you dig into the data to discover insights and look for answers. Like a dashboard, but more-so, a report is highly interactive and highly customizable and the visualizations update as the underlying data changes.

## Paginated reports
![](media/get-started/paginated-reports.png)

Paginated reports are paginated document-style reports, in which the more data you have, the more rows in the tables, and the more pages the report would have. That’s great for generating fixed-layout, pixel-perfect documents optimized for printing, such as PDF and Word files.

You can create modern-looking reports using [Report Builder](https://docs.microsoft.com/sql/reporting-services/report-builder/report-builder-in-sql-server-2016) or Report Designer in [SQL Server Data Tools (SSDT)](https://docs.microsoft.com/sql/reporting-services/tools/reporting-services-in-sql-server-data-tools-ssdt).

## Report Server programming features
Take advantage of Power BI Report Server programming features so you can extend and customize your reporting functionality, with APIs to integrate or extend data and report processing in custom applications.

More [Report Server developer documentation](https://docs.microsoft.com/sql/reporting-services/reporting-services-developer-documentation).

## Next steps
[User handbook](user-handbook-overview.md)  
[Administrator handbook](admin-handbook-overview.md)  
[Quickstart: Install Power BI Report Server](quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)


