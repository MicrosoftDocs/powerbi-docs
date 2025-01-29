---
title: Compare Power BI Report Server and the Power BI service
description: This article compares the features of Power BI Report Server and the Power BI service.
author: kfollis
ms.author: kfollis
keywords: 
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.custom: mvc, intro-overview
ms.date: 11/12/2024
#Customer intent: As a customer of Power BI, I'd like to understand how Power BI Report Server and the Power BI service are the same and are different.
---

# Compare Power BI Report Server and the Power BI service

Power BI Report Server and the Power BI service have many similarities and some key differences. This table explains which is which.

## Features of Power BI Report Server and the Power BI service

| Features | Power BI Report Server | Power BI Service | Notes |
|---------|---------|---------|---------|
| Analyze in Excel | No | Yes | [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) |
| Bookmarks | No | Yes| Bookmarks in the [Power BI service](../consumer/end-user-bookmarks.md) |
| Deployment | On-premises or hosted cloud | Cloud | Power BI Report Server can be deployed in Azure VMs (hosted cloud) if licensed through Power BI Premium or SQL Server Enterprise with Software Assurance|
| Data sources | Cloud and/or on-premises | Cloud and/or on-premises |  |
| License | Power BI Premium or SQL Server EE with Software Assurance (SA) | Power BI Pro and/or Power BI Premium | |  
| Lifecycle | Modern lifecycle policy | Fully managed service |  |
| Release cycle | Three times a year (January, May, September) | Once a month | Latest features and fixes come to the Power BI service first. A rollup of features from Power BI Desktop releases for the service comes to Power BI Report Server in each release; most other features are only meant for the Power BI service. |
| Composite models | No | Yes | |
| Connect to services like Salesforce | Yes | Yes | [Connect to the services you use](../connect-data/service-connect-to-services.md) with template apps in the Power BI service. In Power BI Report Server, use certified connectors to connect to services. See [Power BI report data sources in Power BI Report Server](data-sources.md) for details. |
| Create Power BI reports in Power BI Desktop | Yes | Yes |  |
| Create Power BI reports in the browser | No | Yes |  |
| Dashboards | No | Yes | [Dashboards in the Power BI service](../consumer/end-user-dashboards.md) |
| Distribute group of reports using apps | No | Yes | [Create and publish apps with dashboards and reports](../collaborate-share/service-create-distribute-apps.md) |
| Dynamic M Query Parameters | No | Yes | |
| Export to Power Point (PPTX) | No | Yes | Export data for visuals to CSV or Excel options are available in Report Server. |
| Gateway required | No | Yes for on-premises data sources |  |
| Host and connect to Power BI shared datasets | No | Yes | [Intro to datasets across workspaces](../connect-data/service-datasets-across-workspaces.md) |
| Q&A | No | Yes | [Q&A in the Power BI service and Power BI Desktop](../create-reports/power-bi-tutorial-q-and-a.md) 
| Quick insights | No | Yes | [Automatically generate data insights with Power BI](../consumer/end-user-insights.md) |
| Paginated reports | Yes | Yes | [Paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md) |
| Personalize visuals | No | No | You can [interact with a report to see different data](../consumer/end-user-paginated-report.md#interact-with-a-paginated-report), but you can't modify the report itself. |
| Power BI mobile apps | Yes | Yes | [Power BI mobile apps overview](../consumer/mobile/mobile-apps-for-mobile-devices.md) |
| Real-time streaming | No | Yes | [Real-time streaming in Power BI](../connect-data/service-real-time-streaming.md) |
| Automatic page refresh for DirectQuery models | No | Yes | [Automatic page refresh](../create-reports/desktop-automatic-page-refresh.md) |
| ArcGIS for Power BI | Yes | Yes | [ArcGIS for Power BI](../visuals/power-bi-visualizations-arcgis.md) |
| Email subscriptions for Power BI reports | No | Yes | [Subscribe yourself or others](/power-bi/collaborate-share/end-user-subscribe) to a report or dashboard in the Power BI service |
| Email subscriptions for paginated reports | Yes | Yes | [Subscribe yourself and others to paginated reports in the Power BI service](/power-bi/collaborate-share/end-user-subscribe)<br><br>[Email delivery in Reporting Services](/sql/reporting-services/working-with-subscriptions-web-portal)  |
| Data alerts | No | Yes | [Data alerts](../create-reports/service-set-data-alerts.md) in the Power BI service
| Row-level security (RLS) | Yes | Yes | Available in both DirectQuery (data source) & Import mode <br><br>Row-level security in the [Power BI service](/fabric/security/service-admin-row-level-security) <br><br>Row-level security in [Power BI Report Server](row-level-security-report-server.md) |
| Many-to-many relationships | No | Yes | [Apply many-to-many relationships](../transform-model/desktop-many-to-many-relationships.md) in Power BI Desktop |
| Cross-report drillthrough | No | Yes | [Use cross-report drillthrough](../create-reports/desktop-cross-report-drill-through.md) |
| Full-screen mode | Yes | Yes | [Full-screen mode](../consumer/end-user-focus.md) in the Power BI service |
| R scripts and visuals | No | Yes | [Create R visuals](../create-reports/desktop-r-visuals.md) and run R scripts in Power BI Desktop and publish them to the Power BI service. You can't save Power BI reports with R scripts or visuals to Power BI Report Server.  |
| Python scripts and visuals | No | Yes | [Create Python scripts](../connect-data/desktop-python-scripts.md) and visuals in Power BI Desktop and publish them to the Power BI service. You can't save Power BI reports with Python scripts or visuals to Power BI Report Server. |
| Preview features | No | Yes |   |
| Power BI visuals | Yes | Yes | [Power BI visuals](../developer/visuals/power-bi-custom-visuals.md) |
| Power BI Desktop | Version optimized for Report Server, available for download with Report Server | Version optimized for Power BI Service, available from the Windows Store | [Power BI Desktop for the report server](https://powerbi.microsoft.com/report-server/) <br><br> [Power BI Desktop for the Power BI service](https://aka.ms/pbidesktopstore) |
| Data Privacy Levels | No | Yes | [Data Privacy Levels](../enterprise/desktop-privacy-levels.md) are available for reports in the Power BI service. In Power BI Report Server, use [Role definitions](/sql/reporting-services/security/role-definitions-predefined-roles). |
| Sensitivity Labels | No | Yes | [Sensitivity Labels](../enterprise/service-security-sensitivity-label-overview.md) |
| Template apps | No | Yes | [Install and distribute template apps in your organization](../connect-data/service-template-apps-install-distribute.md) |

## Considerations and limitations

These considerations and limitations apply to Power BI Report Server.

The following Power BI service features are not supported within Power BI Report Server:

- **Export data – Data with current layout** option for all visuals, including the improvements to the Export to Excel experience for Power BI table and matrix visuals. Only the **Summarized data** option is supported within Power BI Report Server.
- The key influencers visual.

## Related content

- [Install Power BI Report Server](install-report-server.md)
