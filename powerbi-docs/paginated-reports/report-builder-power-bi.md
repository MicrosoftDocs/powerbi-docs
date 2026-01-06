---
title: Power BI Report Builder
description: Power BI Report Builder lets you author paginated, print-ready reports and publish them to the Power BI service, showing all data across multiple pages with precise layout control.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.date: 12/01/2025
ai-usage: ai-assisted
ms.service: powerbi
ms.subservice: report-builder
ms.topic: concept-article
ms.assetid: 55bf4f9c-d037-412f-ae57-3fc39ce32fa5
---

# Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)]

Power BI Report Builder enables you to create *paginated reports*—print-friendly, multipage, pixel-precise reports that display all rows in a table. You design a *report definition* that specifies what data to use, where to get it, and how to lay it out. You can preview the report locally, then publish it to the Power BI service. For more information, see [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)

Ready to start authoring? [Install Power BI Report Builder](https://go.microsoft.com/fwlink/?linkid=2086513) from the Microsoft Download Center.

Prefer videos? See the [Power BI Paginated Reports in a Day course](../learning-catalog/paginated-reports-online-course.md).

The following sample invoice report is one of several you can download. For more information, see [sample Power BI paginated reports](paginated-reports-samples.md).

:::image type="content" source="media/report-builder-power-bi/power-bi-report-builder-sample-invoice.png" alt-text="Screenshot of a sample invoice-style paginated report showing header, detail rows, and totals in Power BI Report Builder." lightbox="media/report-builder-power-bi/power-bi-report-builder-sample-invoice.png":::

## Key capabilities (at a glance)

Here's a quick overview of what you can do with Power BI Report Builder:

| Scenario | Supported examples |
| -------- | ------------------ |
| Data sources | SQL Server, Oracle, Power BI semantic models, Analysis Services, Azure SQL, OData, more |
| Layout control | Precise page sizing, headers/footers, repeating groups, nested regions |
| Expressions | Rich expression language for conditional formatting and calculations |
| Delivery | Interactive, export (PDF, Excel, Word, CSV, XML, MHTML) |
| Distribution | Email subscriptions, deployment pipelines |
| Governance | Sensitivity labels, workspace permissions, audit logs |

## System requirements

See the system requirements on the [download page](https://go.microsoft.com/fwlink/?LinkID=2086513).

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../includes/power-bi-paginated-prerequisites.md)]

## Start with the Table, Matrix, or Chart wizard

Create a data source connection, build a dataset query, select a layout and style, add accessibility row properties, and customize your report.

## Start with the Map wizard

Create reports that display aggregated data on geographic or geometric backgrounds, such as SQL spatial, Environmental Systems Research Institute (ESRI) shapefile, or Bing map tiles.

## Design your report

The following features help you design effective paginated reports in Power BI Report Builder:

> [!NOTE]
> The Power BI Report Builder interface is regularly updated. Button locations and menu layouts in the current version might differ from older screenshots in documentation. All functionality remains available, though you might need to explore different ribbon tabs or menus to find specific options.

- **Create paginated reports with table, matrix, chart, and free-form layouts.** Use table layouts for column data, matrix for pivot-style summaries, chart for trends, and free-form for invoices or mixed content.
- **Report from many data sources.** Use relational or multidimensional sources such as SQL Server, Analysis Services, Oracle, or Power BI semantic models.
- **Modify existing reports.** Open and refine reports originally authored in SQL Server Data Tools.
- **Modify your data.** Filter, group, sort, and add expressions.
- **Add charts, gauges, sparklines, and indicators.** Summarize patterns visually.
- **Add interactive features** (document maps, drillthrough, show/hide toggles) plus parameters for user filtering.
- **Embed or reference images** and other resources (internal or external).

## Manage your report

Managing your paginated reports in Power BI Report Builder involves several key tasks to ensure your reports are organized, accessible, and distributed effectively:

- **Save the report definition** locally or to the service.
- **Select export formats** (PDF, Excel, Word, CSV, XML, MHTML, web view).
- **Set up subscriptions.** After publishing, schedule email delivery.

## Use deployment pipelines with paginated reports

By using deployment pipelines, you can develop and test before releasing to users (Development → Test → Production). For more information, see [get started with deployment pipelines](/fabric/cicd/deployment-pipelines/get-started-with-deployment-pipelines).

## Considerations and limitations

You can't set a report parameter to be both **Multivalue** and **Allow null** at the same time. However, you can combine **Multivalue** with **Allow blank**. In paginated reports, a blank value is different from a null value.

## Power BI Report Builder in a virtualized environment

Power BI Report Builder is fully supported on [Azure Virtual Desktop](/azure/virtual-desktop/overview) and [Windows 365](/windows-365/overview). Running it as a virtualized application (for example, Citrix published app) isn't supported.

## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
- [Video-based course: Power BI Paginated Reports in a Day](https://www.youtube.com/watch?v=DN1t5p9aui0&list=PL1N57mwBHtN1icIhpjQOaRL8r9G-wytpT&index=1)
- [Keyboard shortcuts for accessibility in Report Builder](/sql/reporting-services/report-builder/keyboard-shortcuts-report-builder?context=/power-bi/create-reports/context/context)
- [Sample Power BI paginated reports](paginated-reports-samples.md)
