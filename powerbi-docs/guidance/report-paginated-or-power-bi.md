---
title: When to use paginated reports in Power BI
description: Guidance for when to use Power BI paginated reports.
author: maggiemsft
ms.author: maggies
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 11/17/2022
---

# When to use paginated reports in Power BI

This article targets you as a report author who designs reports for Power BI. It provides suggestions to help you choose when to develop [Power BI paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md).

Power BI paginated reports are optimized for **printing**, or **PDF generation**. They also provide you with the ability to produce highly formatted, print-ready layouts. So, paginated reports are ideal for operational reports, like sales invoices.

In contrast, Power BI reports are optimized for **exploration and interactivity**. Also, they can present your data using a comprehensive range of ultra-modern visuals. Power BI reports, therefore, are ideal for analytic reports, enabling your report users to explore data, and to discover relationships and patterns.

We recommend you consider using a Power BI paginated report when:

- You know the report must be printed, or output as a PDF document.
- Data grid layouts could expand and overflow. Consider that a table, or matrix, in a Power BI report can't dynamically resize to display all data—it will provide scroll bars instead. But, if printed, it won't be possible to scroll to reveal any out-of-view data.
- Power BI paginated features and capabilities work in your favor. Many such report scenarios are described later in this article.

## Legacy reports

When you already have SQL Server Reporting Services (SSRS) [Report Definition Language (RDL)](/sql/reporting-services/reports/report-definition-language-ssrs) reports, you can choose to redevelop them as [Power BI reports](../consumer/end-user-reports.md), or migrate them as paginated reports to Power BI. For more information, see [Migrate SQL Server Reporting Services reports to Power BI](migrate-ssrs-reports-to-power-bi.md).

Once published to a Power BI workspace, paginated reports are available side by side with Power BI reports. They can then be easily distributed using [Power BI apps](../collaborate-share/service-create-distribute-apps.md).

You might consider redeveloping SSRS reports, rather than migrating them. It's especially true for those reports that are intended to deliver analytic experiences. In these cases, Power BI reports will likely deliver better report user experiences.

## Paginated report scenarios

There are many compelling scenarios when you might favor developing a Power BI paginated report. Many are features or capabilities not supported by Power BI reports.

- **Print-ready**: Paginated reports are optimized for printing, or PDF generation. When necessary, data regions can expand and overflow to multiple pages in a controlled way. Your report layouts can define margins, and page headers and footers.
- **Render formats**: Power BI can render paginated reports in different formats. Formats include Microsoft Excel, Microsoft Word, Microsoft PowerPoint, PDF, CSV, XML, and MHTML. (The MHTML format is used by the Power BI service to render reports.) Your report users can decide to export in the format that suits them.
- **Precision layout**: You can design highly formatted, print-ready layouts—to the exact size and location configured in fractions of inches, or centimeters.
- **Dynamic layout**: You can produce highly responsive layouts by setting many report properties to use VB.NET expressions. Expressions have access to many core .NET Framework libraries.
- **Render-specific layout**: You can use expressions to modify the report layout based on the rendering format applied. For example, you can design the report to disable toggling visibility (to drill down and drill up) when it's rendered using a non-interactive format, like PDF.
- **Native queries**: You don't need to first publish a Power BI semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)). It's possible to author native queries (or use stored procedures) for any [supported data source](../paginated-reports/paginated-reports-data-sources.md). Queries can include parameterization.
- **Graphic query designers**: Power BI Report Builder includes graphic query designers to help you write, and test, your dataset queries.
- **Static datasets**: You can define a dataset, and enter data directly into your report definition. This capability is especially useful to support a demo, or for delivering a proof of concept (POC).
- **Data integration**: You can combine data from different data sources, or with static datasets. It's done by creating custom fields using VB.NET expressions.
- **Parameterization**: You can design highly customized parameterization experiences, including data-driven, and cascading parameters. It's also possible to define parameter defaults. These experiences can be designed to help your report users quickly set appropriate filters. Also, parameters don't need to filter report data; they can be used to support "what-if" scenarios, or dynamic filtering or styling.
- **Image data**: Your report can render images when they're stored in binary format in a data source.
- **Custom code**: You can develop code blocks of VB.NET functions in your report, and use them in any report expression.
- **Subreports**: You can embed other Power BI paginated reports (from the same workspace) into your report.
- **Flexible data grids**: You have fine-grained control of grid layouts by using the tablix data region. It supports complex layouts, too, including nested and adjacent groups. And, it can be configured to repeat headings when printed over multiple pages. Also, it can embed a subreport or other visualizations, including data bars, sparklines, and indicators.
- **Spatial data types**: The map data region can visualize [SQL Server spatial data types](/sql/relational-databases/spatial/spatial-data-sql-server). So, the GEOGRAPHY and GEOMETRY data types can be used to visualize points, lines, or polygons. It's also possible to visualize polygons defined in ESRI shape files.
- **Modern gauges**: Radial and linear gauges can be used to display KPI values and status. They can even be embedded into grid data regions, repeating within groups.
- **HTML rendering**: You can display richly formatted text when it's stored as HTML.
- **Mail merge**: You can use text box placeholders to inject data values into text. This way, you can produce a mail merge report.
- **Interactivity features**: Interactive features include toggling visibility (to drill down and drill up), links, interactive sorting, and tooltips. You can also add links that drillthrough to Power BI reports, or other Power BI paginated reports. Links can even jump to another location within the same report.
- **Subscriptions**: Power BI can deliver paginated reports on a schedule as emails, with report attachments in any supported format.
- **Per-user layouts**: You can create responsive report layouts based on the authenticated user who opens the report. You can design the report to filter data differently, hide data regions or visualizations, apply different formats, or set user-specific parameter defaults.

## Related content

For more information related to this article, check out the following resources:

- [What are paginated reports in Power BI?](../paginated-reports/paginated-reports-report-builder-power-bi.md)
- [Migrate SQL Server Reporting Services reports to Power BI](migrate-ssrs-reports-to-power-bi.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
