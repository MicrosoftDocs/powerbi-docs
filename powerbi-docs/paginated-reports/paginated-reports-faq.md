---
title: "Paginated reports in Power BI: FAQ"
description: This article answers frequently asked questions about paginated reports. These reports are highly formatted, pixel-perfect output optimized for printing or PDF generation. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 02/28/2020
---

# Paginated reports in Power BI: FAQ 

This article answers frequently asked questions about paginated reports. These reports are highly formatted, pixel-perfect output optimized for printing or PDF generation. They're called "paginated" because they're formatted to fit well on multiple pages. Paginated reports are based on the RDL report technology in SQL Server Reporting Services. 

This article answers many common questions people have about paginated reports in Power BI Premium, and about Report Builder, the standalone tool for authoring paginated reports. You need a Power BI Pro license to publish a report to the service. You can publish and share paginated reports in your My Workspace or in workspaces, as long as the workspace is in a Power BI Premium capacity. 

## Administration

### What size Premium capacity do I need for paginated reports?

The paginated reports workload is available on P1 – P3 SKUs.  You may also use it with A4 – A6 SKUs for embed or test/dev scenarios.

### What is the maximum memory threshold I can put for paginated reports in my capacity?

You may use up to 100% of the memory for this workload.

### How does user access work for paginated reports?

User access for paginated reports is the same as user access for all other content in the Power BI service 

### How do I turn on/off my paginated reports workload?

The capacity admin can enable or disable the paginated reports workload in the capacity admin portal page.  By default, the workload will be on for any new capacities you create, but will not consume memory until you upload your first paginated report.  

### How can I monitor usage of paginated reports in my tenant?

The Office 365 audit logs detail usage of this report type under the following events: 

- View Power BI Report
- Delete Power BI report
- Create Power BI report
- Downloaded Power BI report

The field ReportType has the value “PaginatedReport” to identify paginated as opposed to Power BI reports.

Also, the audit logs provide the following events for paginated reports:

- Binded Power BI dataset to gateway
- Discover Power BI Datasource
- TakeOverDatasource

### Can I monitor this workload through the Premium Capacity Monitoring App?

Yes, monitoring is available as a new tab with the same relevant details you have for your Power BI datasets.

### Do I need a Pro license to create and publish paginated reports?

You can upload paginated reports to your My Workspace without a Pro license, provided it's in a Premium Capacity.  For other workspaces, you must have a Pro license to author and publish content to them. We encourage you to download and use Power BI Report Builder even without the Pro license, but you can't publish the paginated reports you create without it. 

### What if I have a paginated report in a workspace and the paginated report workload is turned off?

You receive an error message, and you can't view your report until the workload is turned back on. You can still delete the report from the workspace.

### What is the default memory for each of the Premium SKUs supported for paginated reports?

Default memory in each Premium SKU for paginated reports:

- **P1/A4**: 20% default; 10% minimum
- **P2/A5**: 20% default; 5% minimum
- **P3/A6**: 20% default; 2.5% minimum

## General

### When should I use a paginated report vs. a Power BI report?

Paginated reports are best for scenarios that require a highly formatted, pixel-perfect output optimized for printing or PDF generation.  A profit and loss statement is a good example of the type of report you would probably want to create as a paginated report.  

Power BI reports are optimized for exploration and interactivity.  A sales report where different salespeople want to slice the data in the same report for their specific region/industry/customer and see how the numbers change would be best served by a Power BI report.

### The documentation says Power BI Report Builder is the preferred authoring tool. Can I create paginated reports in SQL Server Data Tools for Power BI?

Yes, but the Power BI service only allows you to upload a single item at a time, so many of the scenarios authors use with SQL Server Data Tools (SSDT) aren’t yet supported. See the full [list of unsupported features](#what-paginated-report-features-in-ssrs-arent-yet-supported-in-power-bi) available later in this FAQ.  

### What version(s) of Report Builder do you support?

We released Power BI Report Builder as the primary authoring tool for paginated reports in the Power BI Service. Install [Power BI Report Builder from the Microsoft Download Center](https://go.microsoft.com/fwlink/?linkid=2086513).

### How do I move existing reports I have saved in SQL Server Reporting Services to Power BI?

A project on GitHub now supports migrating content from SQL Server Reporting Services to Power BI.  View details and download the tool here: [https://github.com/microsoft/RdlMigration](https://github.com/microsoft/RdlMigration)

### Can I open reports and publish directly to the service?

Yes. We've added support for opening reports and publishing them directly to the service from Power BI Report Builder.

### What paginated report features in SSRS aren’t yet supported in Power BI?

Currently, paginated reports don’t support the following items:

- Shared data sources
- Shared datasets
- Subreports
- Drillthrough and click-through to other reports
- Linked reports
- Bing map layers
- Custom fonts

You get an error message if you try to upload a file that has an unsupported feature in the Power BI service, other than toggle/sort.

### What data sources do you support currently for paginated reports?

See the article [Supported data sources for Power BI paginated reports](paginated-reports-data-sources.md) for a list of data sources. 

### What authentication methods do you support?

We support SSO for Azure Analysis Services, Azure SQL Database, and Power BI data sources.  We also support OAuth for Azure SQL Database and Azure Analysis Services.  For other data sources, you currently need to store a user name and password with the data source in the portal or gateway.  

### Can I use a Power BI dataset as a data source for my paginated report?

Yes, we support Power BI datasets as data sources for your paginated reports.

### Can I use stored procedures through the Gateway?

Yes, stored procedures through the Gateway are supported for SQL Server data sources, including those that use parameters.

### What export formats are available for my report in the Power BI service?

You can export to Microsoft Excel, Microsoft Word, Microsoft PowerPoint, PDF, .CSV, XML, and MHTML.

### Can I print paginated reports?

Yes, printing is available for paginated reports, including a new and improved print preview experience. 

### Are e-mail subscriptions available for paginated reports?

Yes, e-mail subscriptions are fully supported for paginated reports and include support for six different file formats and parameter values.

### Can I run custom code in my report?

Yes, we support the ability to run code in your reports as you can in SSRS.

### Can I use Power BI embedded to embed my paginated reports into an app I’m hosting?

SaaS embedding, including Secure Embed support, is already available. For PaaS embedding, refer to the [Embed Power BI paginated reports into an application for your customers](../developer/embed-paginated-reports-customers.md) tutorial.

### Can I drill through from a Power BI report to a paginated report?

Yes, this can be accomplished using URL parameters with your paginated reports.

### Can I share my paginated report content through a Power BI app?

Yes, paginated reports are supported to be deployed with apps from both v1 and v2 workspaces. 

### Will other report-specific features in Power BI, like pinning to report tiles to dashboards, work with paginated reports?

We plan to have the reports support the same major scenarios in the service as much as possible.  Ideally, though the tool to author them is different, from a consumer perspective it’s just another report in their list in the portal. They don’t care how it was created, they can accomplish what they need to.  A good example of this feature parity is the planned comment support. Though the feature itself may work slightly differently for each report type, you’ll be able to use comments for both.

### Is there a report viewer control for paginated reports in the Power BI service?

No, a report viewer control isn’t available currently.

### Can you search for paginated reports from the new Home experience in the Power BI service?

Yes, you can now search for your paginated reports from Home.  You also see them in other parts of the new Home experience.

## Next steps

- [Install Power BI Report Builder from the Microsoft Download Center](https://go.microsoft.com/fwlink/?linkid=2086513)
- [Tutorial: Create a paginated report](paginated-reports-quickstart-aw.md)
