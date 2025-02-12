---
title: What is Power BI Report Server?
description: Get an overview of Power BI Report Server to understand how it fits in with SQL Server Reporting Services (SSRS) and the rest of Power BI.
author: kfollis
ms.author: kfollis
keywords: 
ms.date: 06/24/2024
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.custom: mvc, intro-overview
#Customer intent: As a Power BI admin, end user, or developer, I want an overview of Power BI Report Server so I understand how it fits in with SSRS and the Power BI service.
---
# What is Power BI Report Server?

Power BI Report Server is an on-premises report server with a web portal in which you display and manage reports and KPIs. Along with it come the tools to create Power BI reports, paginated reports, mobile reports, and KPIs. Your users can access those reports in different ways: viewing them in a web browser or mobile device, or as an email in their in-box.

![Screenshot shows the Power B I Report Server web portal.](media/get-started/power-bi-report-server-overview.png)

## Comparing Power BI Report Server 
Power BI Report Server is similar to both SQL Server Reporting Services and the Power BI online service, but in different ways. Like the Power BI service, Power BI Report Server hosts Power BI reports (.pbix), Excel files, and paginated reports (.rdl). Like Reporting Services, Power BI Report Server is on premises. Power BI Report Server features are a superset of Reporting Services: everything you can do in Reporting Services, you can do with Power BI Report Server, along with support for Power BI reports. See [Comparing Power BI Report Server and the Power BI service](compare-report-server-service.md) for details. With an F64 reserved instance, you can create a hybrid deployment mixing cloud and on-premises.

## Licensing Power BI Report Server
Power BI Report Server is available through two different licenses: [Fabric F64+ reserved instances](/fabric/enterprise/licenses) and SQL Server Enterprise Edition with Software Assurance. See [Microsoft Volume Licensing](https://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=1&ShowArchived=True) for details. 

If you publish paginated reports and Power BI reports to Power BI Report Server, you also need a Power BI Pro license. You don't need a Power BI Pro license to view and interact with paginated and Power BI reports on Power BI Report Server.

> [!NOTE]
> For Power BI Premium, Power BI Report Server is only included with P SKUs. It is not included with EM SKUs. Power BI Report Server is also **not** included with any F SKUs below F64 reserved instance.

## Web portal
The entry point for Power BI Report Server is a secure web portal you can view in any modern browser. Here, you access all your reports and KPIs. The content on the web portal is organized in a traditional folder hierarchy. In your folders, content is grouped by type: Power BI reports, mobile reports, paginated reports, KPIs, and Excel workbooks. Shared datasets and shared data sources are in their own folders, to use as building blocks for your reports. You tag favorites to view them in a single folder. And you create KPIs right in the web portal. 

![Photograph shows a laptop that displays the Power B I Report Server web portal.](media/get-started/web-portal.png)

Depending on your permissions, you can manage the content in the web portal. You can schedule report processing, access reports on demand, and subscribe to published reports. You can also apply your own custom [branding](/sql/reporting-services/branding-the-web-portal) to your web portal. 

More about the [Power BI Report Server web portal](/sql/reporting-services/web-portal-ssrs-native-mode).

## Power BI reports
You create Power BI reports (.pbix) with the version of Power BI Desktop optimized for the report server. Then you publish them and view them in the web portal in your own environment.

![Power BI reports in Power BI Report Server](media/get-started/report-server-power-bi-reports.png)

A Power BI report is a multi-perspective view into a data model, with visualizations that represent different findings and insights from that data model.  A report can have a single visualization or pages full of visualizations. Depending on your role, you may read and explore reports, or you may create them for others.

Read about [installing Microsoft Power BI Desktop](install-powerbi-desktop.md).

## Paginated reports
Paginated reports (.rdl) are document-style reports with visualizations, in which tables expand horizontally and vertically to display all their data, continuing from page to page as needed. They're great for generating fixed-layout, print-ready documents optimized for printing, such as PDF and Word files. 

![Paginated reports in Power BI Report Server](media/get-started/paginated-reports.png)

You can create paginated reports using [Microsoft Report Builder](/sql/reporting-services/report-builder/report-builder-in-sql-server-2016) or Report Designer in [SQL Server Data Tools (SSDT)](/sql/reporting-services/tools/reporting-services-in-sql-server-data-tools-ssdt).

## Reporting Services mobile reports (deprecated)

> [!NOTE]
> SQL Server mobile reports are deprecated starting in 2019.

Mobile reports connect to on-premises data and have a responsive layout that adapts to different devices and the different ways you hold them. You create them with SQL Server Mobile Report Publisher.

## Report Server programming features
Take advantage of Power BI Report Server programming features to extend and customize your reports, with APIs to integrate or extend data and report processing in custom applications.

More [Report Server developer documentation](/sql/reporting-services/reporting-services-developer-documentation).

## Related content

* [Install Power BI Report Server](install-report-server.md)  
* [Download Microsoft Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
