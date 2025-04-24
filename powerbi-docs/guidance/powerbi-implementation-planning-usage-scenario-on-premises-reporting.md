---
title: "Power BI usage scenarios: On-premises reporting"
description: "Learn how Power BI on-premises reporting is about customer-managed reporting."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI usage scenarios: On-premises reporting

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

The *on-premises reporting* scenario is one of several *hybrid and custom scenarios* for deploying Power BI solutions without using the Power BI service.

This scenario involves using [Power BI Report Server](../report-server/get-started.md), which is an on-premises portal for publishing, sharing, and consuming business intelligence content within the organizational network. It's useful when the organization needs an alternative to the cloud-based Power BI service for deploying some (or all) BI content. For example, a fully customer-managed platform could be necessary for regulatory, legal, or intellectual property reasons.

## Scenario diagram

The following diagram depicts a high-level overview of the most common user actions and Power BI components to support on-premises reporting. The focus is on using Power BI Report Server, which runs on a Windows server within the organizational network.

:::image type="content" source="media/powerbi-implementation-planning-usage-scenario-on-premises-reporting/usage-scenario-on-premises-reporting-inline.svg" alt-text="Diagram shows on-premises reporting, which is about delivering an internally managed reporting solution. Items in the diagram are described in the table below." lightbox="media/powerbi-implementation-planning-usage-scenario-on-premises-reporting/usage-scenario-on-premises-reporting-expanded.svg" border="false":::

> [!TIP]
> We encourage you to [download the scenario diagram](powerbi-implementation-planning-usage-scenario-diagrams.md#on-premises-reporting) if you'd like to embed it in your presentation, documentation, or blog post—or print it out as a wall poster. Because it's a Scalable Vector Graphics (SVG) image, you can scale it up or down without any loss of quality.

The scenario diagram depicts the following user actions, tools, and features:

| Item | Description |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | A Power BI content creator builds a BI solution. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | [Power BI Desktop for Report Server](../report-server/install-powerbi-desktop.md) connects to data from one or more data sources. Queries and data mashups, which combine multiple sources, are developed in the [Power Query Editor](/power-query/power-query-what-is-power-query). |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Data model development and report creation are done in Power BI Desktop for Report Server. It generates a specific type of Power BI Desktop file (.pbix) that can be published to Power BI Report Server. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | The report creator can also build paginated reports using [Power BI Report Builder](../paginated-reports/report-builder-power-bi.md). This tool generates a Report Definition Language file (.rdl) that can be published to Power BI Report Server. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The report creator can also develop reports using Excel. The Excel workbook file (.xlsx) can be published to Power BI Report Server. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | When ready, the content creator publishes their file to Power BI Report Server. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Content is published to a [folder](../report-server/getting-around.md) in Power BI Report Server. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Report consumers view reports published to Power BI Report Server. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Report consumers can also view reports using [Power BI mobile apps](../consumer/mobile/mobile-apps-for-mobile-devices.md). |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Server administrators manage the Windows server infrastructure. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Database administrators manage Power BI Report Server, including the report server databases, and SQL Server Agent. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | SQL Server Agent jobs periodically [refresh import semantic models](../report-server/configure-scheduled-refresh.md). |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Administrators oversee and monitor activity in Power BI Report Server. |

## Key points

The following are some key points to emphasize about the on-premises reporting scenario.

### Report creator experience

Content creators use a specific tool named [Power BI Desktop for Report Server](https://powerbi.microsoft.com/report-server/). This version of Power BI Desktop is updated three times per year and is compatible with the Power BI Report Server release cycle.

> [!NOTE]
> For report creators who create content for both the Power BI service and Power BI Report Server, the two versions of Power BI Desktop can be installed side by side.

### Report consumer experience

The report consumer experience for Power BI Report Server is very different from the Power BI service. The Power BI Report Server is a web portal for viewing, storing, and managing content. Content files (.pbix, .rdl, or .xlsx) are published to a folder hierarchy. For more information, see [Manage content in the web portal](../report-server/getting-around.md).

### Power BI Report Server

Power BI Report Server is a distinct product from SQL Server Reporting Services (SSRS). It's licensed and installed separately. Power BI Report Server is considered a superset of SSRS because it comprises additional capabilities beyond SSRS.

> [!IMPORTANT]
> Although Power BI Report Server and the Power BI service are supported by the same engineering team at Microsoft, there are substantial functionality differences between the two products. Power BI Report Server is a basic reporting portal for on-premises reporting. For this reason there are many [feature differences](../report-server/compare-report-server-service.md) between it and the Power BI service. The feature set of Power BI Report Server is intentionally simple, and parity should not be expected. Before installing Power BI Report Server, verify that critical features you intend to use are supported.

### Report server databases

SQL Server hosts the Report Server databases. Most commonly, a SQL Server Database Engine instance is [installed on a Windows server](../report-server/system-requirements.md#database-server-version-requirements) in an on-premises data center. It can also be installed on a virtual machine in Azure (hosted cloud) or hosted by Azure SQL Managed Instance (not depicted in the scenario diagram). The database infrastructure is managed by a database administrator.

### Mobile access

Additional configurations must be done to enable remote mobile access to Power BI Report Server. For more information, see [Configure Power BI mobile app access to Report Server remotely](../report-server/configure-powerbi-mobile-apps-remote.md).

### Licensing Power BI Report Server

There are two ways to [license Power BI Report Server](../report-server/get-started.md#licensing-power-bi-report-server): Power BI Premium and SQL Server Enterprise Edition with Software Assurance.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

With the purchase of Power BI Premium capacity, Power BI Report Server can be installed on an on-premises server, provided it has the same number of cores as the capacity node's v-cores. This way, it's possible to adopt a hybrid approach supporting publication of content to the Power BI service (cloud) and to Power BI Report Server (on-premises or hosted cloud in Azure).

> [!NOTE]
> When licensing Power BI Report Server as part of the Premium capacity feature set, it's only available with the P SKUs. The other capacity-based SKUs (EM and A SKUs) do not offer this benefit, nor does Power BI Premium Per User (PPU).

## Related content

For other useful scenarios to help you with Power BI implementation decisions, see the [Power BI usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) article.
