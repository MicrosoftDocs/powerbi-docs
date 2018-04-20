---
title: What is Power BI Report Server?
description: Get an overview of Power BI Report Server to understand how it fits in with SQL Server Reporting Services (SSRS) and the rest of Power BI.
services: powerbi
keywords: 
author: maggiesMSFT
ms.author: maggies
ms.component: powerbi-report-server
ms.date: 04/16/2018
ms.topic: overview
ms.service: powerbi
manager: kfile
ms.custom: mvc
---
# What is Power BI Report Server?

Power BI Report Server is an on-premises report server for deploying and managing Power BI, paginated, and mobile reports, and KPIs, plus the tools to create them.  

Power BI Report Server is a solution you deploy on premises for creating, publishing, and managing reports. Then you deliver reports to your users in different ways: viewing them in web browser, on their mobile device, or as an email in their in-box.

Power BI Report Server is a suite of products: an on-premises report server with a web portal in which you display and manage reports and KPIs, and the tools to create Power BI reports, paginated reports, mobile reports, and KPIs.

A web portal you can view in any modern browser. In the web portal, you can organize and display reports and KPIs. You can also store Excel workbooks on the portal.

## Comparing Power BI Report Server 
In different ways, Power BI Report Server is similar to both SQL Server Reporting Services and the Power BI online service. Like the Power BI service, Power BI Report Server hosts Power BI reports (.PBIX) and Excel files. Like Reporting Services, Power BI Report Server is on premises, and hosts paginated reports (.RDLX). Power BI Report Server is a superset of Reporting Services: everything you can do in Reporting Services, you can do with Power BI Report Server, and more, with the addition of support for Power BI reports.

## Licensing Power BI Report Server

Power BI Report Server is available through two different licenses: [Power BI Premium](../service-premium.md) and [SQL Server Enterprise Edition](https://www.microsoft.com/sql-server/sql-server-2017-editions) with Software Assurance.  


## Web portal
![](media/get-started/web-portal.png)

The entry point for Power BI Report Server is a web portal you can view in any modern browser. Here, you can access all your reports and KPIs. The content on the web portal is organized in a traditional folder hierarchy. In your folders, content is grouped by type: Power BI reports, mobile reports, paginated reports and KPIs, plus Excel workbooks, shared datasets, and shared data sources to use as building blocks for your reports. You can tag favorites to view them into a single folder. And you can create KPIs right in the web portal. 

Depending on your permissions, you can securely store and manage reports here in the web portal, and manage the content.
You can also schedule report processing, access reports on demand, and subscribe to published reports in the new web portal. You can also apply your own custom [branding](https://docs.microsoft.com/sql/reporting-services/branding-the-web-portal) to your web portal. 

More about the [Power BI Report Server web portal](https://docs.microsoft.com/sql/reporting-services/web-portal-ssrs-native-mode).

## Power BI reports
![](media/get-started/powerbi-reports.png)

Power BI reports, created with Power BI Desktop, that you can view within the web portal in your own environment.
A Power BI report is a multi-perspective view into a dataset, with visualizations that represent different findings and insights from that dataset.  A report can have a single visualization or pages full of visualizations. Depending on your job role, you may consume and use reports, or you may create them for others.

Reports are based on a single dataset. The visualizations in a report each represent a nugget of information. And the visualizations aren't static; you can add and remove data, change visualization types, and apply filters and slicers as you dig into the data to discover insights and look for answers. Like a dashboard, but more-so, a report is highly interactive and highly customizable and the visualizations update as the underlying data changes.

## Paginated reports
![](media/get-started/paginated-reports.png)

Paginated reports are document-style reports, in which the more data you have, the more rows in the tables, and the more pages the report would have. Thye're great for generating fixed-layout, pixel-perfect documents optimized for printing, such as PDF and Word files.

You can create modern-looking reports using [Report Builder](https://docs.microsoft.com/sql/reporting-services/report-builder/report-builder-in-sql-server-2016) or Report Designer in [SQL Server Data Tools (SSDT)](https://docs.microsoft.com/sql/reporting-services/tools/reporting-services-in-sql-server-data-tools-ssdt).

## SQL Server mobile reports
Mobile reports with a responsive layout that adapts to different devices and the different ways you hold them.

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


