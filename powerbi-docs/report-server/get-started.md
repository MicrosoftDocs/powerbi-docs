---
title: What Is Power BI Report Server?
description: Get an overview of Power BI Report Server to understand how it fits in with SQL Server Reporting Services (SSRS) and the rest of Power BI.
author: JulCsc
ms.author: juliacawthra
keywords: 
ms.date: 09/29/2025
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.custom: mvc, intro-overview
#Customer intent: As a Power BI admin, end user, or developer, I want an overview of Power BI Report Server so I understand how it fits in with SSRS and the Power BI service.
---
# What is Power BI Report Server?

Power BI Report Server is an on-premises report server with a web portal where you display and manage reports and KPIs. Along with it come the tools to create Power BI reports, paginated reports, mobile reports, and KPIs. Your users can access those reports in different ways: viewing them in a web browser or mobile device, or as an email in their inbox.

:::image type="content" source="media/get-started/power-bi-report-server-overview.png" alt-text="Screenshot of the Power BI Report Server web portal.":::

## Compare to SQL Server Reporting Services and Power BI Service

Power BI Report Server is similar to both SQL Server Reporting Services and the Power BI service, but in different ways. Like the Power BI service, Power BI Report Server hosts Power BI reports (.pbix), Excel files, and paginated reports (.rdl). Like Reporting Services, Power BI Report Server is on premises. Power BI Report Server features are a superset of Reporting Services: everything you can do in Reporting Services, you can do with Power BI Report Server, along with support for Power BI reports. See [Comparing Power BI Report Server and the Power BI service](compare-report-server-service.md) for details. With an F64 reserved instance, you can create a hybrid deployment mixing cloud and on-premises.

## Licensing Power BI Report Server

Power BI Report Server operates on a core-based licensing model and is currently available through [Fabric F64+ reserved instances](/fabric/enterprise/licenses) and various SQL licensing options depending on which version of SQL Server the customer is running.

With SQL Server 2025, customer may run Power BI Report Server software on the Licensed Server, on any allowed Fail-over OSE in accordance with those same limits, or in Azure. Customer may run the software on a maximum number of cores equal to the number of SQL Server Standard or Enterprise Edition Core Licenses assigned to the Licensed Server, subject to a minimum of four core licenses per OSE. Alternatively, if the software is run in Azure, Customer must allocate one SQL Server Standard or Enterprise Edition Core License per virtual core, subject to a minimum of four core licenses per OSE. See [Microsoft Volume Licensing](https://www.microsoft.com/licensing/docs) for SQL Server licensing details.  

For versions of SQL Server Enterprise Edition released prior to 2025, Power BI Report Server use rights apply only to Enterprise Edition Core Licenses with active SA. This right expires upon expiration of customer's SA coverage.

Similar to SQL Server licensing, customers may run the Power BI Report Server software in a physical or virtual OSE with up to the number of cores included under their Fabric F64+ capacity. The number of Power BI v-cores available for each Fabric license can be found [here](/fabric/enterprise/licenses).


> [!NOTE]
> For Power BI Premium, Power BI Report Server is only included with P SKUs. It's not included with EM SKUs. Power BI Report Server is also **not** included with any F SKUs under F64 reserved instance.

## Web portal

The entry point for Power BI Report Server is a secure web portal you can view in any modern browser. Here, you access all your reports and KPIs. The content on the web portal is organized in a traditional folder hierarchy. In your folders, content is grouped by type: Power BI reports, mobile reports, paginated reports, KPIs, and Excel workbooks. Shared datasets and shared data sources are in their own folders, to use as building blocks for your reports. You tag favorites to view them in a single folder. And you create KPIs right in the web portal.

> [!NOTE]
> There's no dedicated **Exit** button. To leave or end your session, either close the browser tab/window or select your profile menu (top right) and select **Sign out**.

:::image type="content" source="media/get-started/web-portal.png" alt-text="Screenshot of a laptop displaying the Power BI Report Server web portal.":::

![Photograph shows a laptop that displays the Power BI Report Server web portal.](media/get-started/web-portal.png)

Depending on your permissions, you can manage the content in the web portal. You can schedule report processing, access reports on demand, and subscribe to published reports. You can also apply your own custom [branding](/sql/reporting-services/branding-the-web-portal) to your web portal.

More about the [Power BI Report Server web portal](/sql/reporting-services/web-portal-ssrs-native-mode).

## Power BI reports

You create Power BI reports (.pbix) with the version of Power BI Desktop optimized for the report server. Then you publish them and view them in the web portal in your own environment.

:::image type="content" source="media/get-started/report-server-power-bi-reports.png" alt-text="Screenshot of Power BI reports displayed in Power BI Report Server.":::

A Power BI report is a multiperspective view into a data model, with visualizations that represent different findings and insights from that data model. A report can have a single visualization or pages full of visualizations. Depending on your role, you may read and explore reports, or you may create them for others.

Read about [installing Microsoft Power BI Desktop](install-powerbi-desktop.md).

## Paginated reports

Paginated reports (.rdl) are document-style reports with visualizations, in which tables expand horizontally and vertically to display all their data, continuing from page to page as needed. They're great for generating fixed-layout, print-ready documents optimized for printing, such as PDF and Word files.

:::image type="content" source="media/get-started/paginated-reports.png" alt-text="Screenshot of paginated reports in Power BI Report Server.":::

You can create paginated reports using [Microsoft Report Builder](/sql/reporting-services/report-builder/report-builder-in-sql-server-2016) or Report Designer in [SQL Server Data Tools (SSDT)](/sql/reporting-services/tools/reporting-services-in-sql-server-data-tools-ssdt).

## Report Server programming features

Take advantage of Power BI Report Server programming features to extend and customize your reports, with APIs to integrate or extend data and report processing in custom applications.

More [Report Server developer documentation](/sql/reporting-services/reporting-services-developer-documentation).

## Related content

- [Install Power BI Report Server](install-report-server.md)  
- [Download Microsoft Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
