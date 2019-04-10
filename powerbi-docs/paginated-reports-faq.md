---
title: "Paginated reports in Power BI: FAQ (Preview)"
description: This article answers frequently asked questions about paginated reports. These reports are highly formatted, pixel-perfect output optimized for printing or PDF generation. 
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: overview
ms.date: 11/05/2018
---

# Paginated reports in Power BI: FAQ (Preview)

This article answers frequently asked questions about paginated reports. These reports are highly formatted, pixel-perfect output optimized for printing or PDF generation. They're called "paginated" because they're formatted to fit well on multiple pages. Paginated reports are based on the RDL report technology in SQL Server Reporting Services. 

This article answers many common questions people have about paginated reports in Power BI Premium, and about Report Builder, the standalone tool for authoring paginated reports. You need a Power BI Pro license to publish a report to the service. You can publish and share paginated reports in your My Workspace or in app workspaces, as long as the workspace is in a Power BI Premium capacity. 

## Administration

### What size Premium capacity do I need for paginated reports?

The paginated reports workload is available on P1 – P3 SKUs for public preview.  You may also use it for test/dev scenarios with A4 – A6 SKUs.

### What is the maximum memory threshold I can put for paginated reports in my capacity?

Currently, you may only reserve 50% of the memory for this workload. 

### How does user access work for paginated reports?

User access for paginated reports is the same as user access for all other content in the Power BI service 

### How do I turn on/off my paginated reports workload?

The capacity admin can enable or disable the paginated reports workload in the capacity admin portal page.  

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

Yes. You can't upload reports to the workspace without a Pro license. We encourage you to download and use Power BI Report Builder even without the Pro license, but you can't publish the paginated reports you create without it. 

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

We recently released Power BI Report Builder as the primary authoring tool for Paginated Reports in the Power BI Service. Install [Report Builder from the Microsoft Download Center](https://go.microsoft.com/fwlink/?linkid=2086513).

### How do I move existing reports I have saved in SQL Server Reporting Services to Power BI?

You need to download the report from the server, then upload it to Power BI through the portal.  There is no migration tool available at this time, but we’re looking at creating one after we’ve finished public preview and gotten the right level of feature parity between the products.

### Can I open reports and publish directly to the service?

At this point, no. We're adding support for opening reports and publishing them directly to the service from Power BI Report Builder at prior to GA, like you can with Power BI Desktop.

### What paginated report features in SSRS aren’t yet supported in Power BI?

Currently, paginated reports don’t support the following items:

- Shared data sources
- Shared datasets
- Subreports
- Click-through and drill-through actions
- Linked reports
- Bookmarks
- Bing map layers
- Custom fonts

You get an error message if you try to upload a file that has an unsupported feature in the Power BI service, other than toggle/sort.

### What data sources do you support currently for paginated reports?

We support the following data source - 

- Power BI Premium Datasets
- Azure Analysis Services (via SSO)
- Azure SQL Database
- SQL Server*
- SQL Server Analysis Services (SSAS) tabular (DAX) and multidimensional (MDX) models* 
- Oracle* 
- Teradata* 

* requires the on-premises Gateway.

When accessing SSAS through the Gateway, the user whose credentials are stored needs elevated permissions in SSAS to work through the Gateway.

### What authentication methods do you support?

We support SSO for both Azure Analysis Services and Power BI Premium data sources.  For all other data sources, you currently need to store a user name and password with the data source in the portal or gateway.  

### Can I use a Power BI dataset as a data source for my paginated report?

Yes, we now support Power BI Premium datasets as data sources for your Paginated Reports.

### Can I use stored procedures through the Gateway?

You can use a stored procedure through the Gateway, but you may see issues in certain scenarios if stored procedure has parameters.

### What export formats are available for my report in the Power BI service?

You can export to Microsoft Excel, Microsoft Word, Microsoft PowerPoint, PDF, .CSV, XML, and MHTML.

### Can I print paginated reports?

Yes, printing is available for Paginated Reports, including a new and improved print preview experience. 

### Are e-mail subscriptions available yet for paginated reports?

No, e-mail subscriptions are coming soon, however.

### What features from SSRS will you be supporting in the Power BI service?

Our plan is to provide feature parity for most scenarios, but certain things about SSRS and Power BI may not make sense to try to change to fit existing SSRS patterns.  For example, the different permission models in Power BI can't be mapped back to SSRS.  We will be looking for feedback from customers and partners to make those types of decisions.

### Can I run custom code in my report?

Yes, we support the ability to run code in your reports as you can in SSRS.

### Does this mean SSRS is going away?

Not at all.  This new offering offers customers a cloud-based option for their paginated reports.  

### Can I use Power BI embedded to embed my paginated reports into an app I’m hosting?

We plan to support this scenario with the existing Power BI APIs, but we don’t yet have a timeframe on when this scenario will be available.

### Can I drill through from a Power BI report to a paginated report?

Not yet, but we absolutely plan to support this scenario.

### Can I share my paginated report content through a Power BI app?

Yes, paginated reports are supported to be deployed with apps from both v1 and v2 workspaces. 

### Will other report-specific features in Power BI, like pinning to report tiles to dashboards, work with paginated reports?

We plan to have the reports support the same major scenarios in the service as much as possible.  Ideally, though the tool to author them is different, from a consumer perspective it’s just another report in their list in the portal. They don’t care how it was created, they can accomplish what they need to.  A good example of this feature parity is the planned comment support. Though the feature itself may work slightly differently for each report type, you’ll be able to use comments for both.

### Is a migration tool planned so SSRS customers can move their existing reports and assets to Power BI?

We're evaluating options here to allow content to be moved to Power BI in an automated way, but this won't be available until after GA.

### Will I ever be able to create both paginated reports and Power BI reports in a single authoring tool?

Potentially.  We're currently looking at ways to enable this scenario, or if we simply distribute the authoring tools together as a single BI suite vs. having individual downloads/branding.

### Is there a report viewer control for paginated reports in the Power BI service?

No, a report viewer control isn’t available currently.

### Can you search for paginated reports from the new Home experience in the Power BI service?

No, you can't currently search for your paginated reports from Home.  You do see them, however, in the other parts of the new Home experience.

## Next steps

- [Install Power BI Report Builder from the Microsoft Download Center](https://go.microsoft.com/fwlink/?linkid=2086513)
- [Tutorial: Create a paginated report](paginated-reports-quickstart-aw.md)
