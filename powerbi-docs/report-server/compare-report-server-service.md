---
title: Comparing Power BI Report Server and the Power BI service
description: This article compares the features of Power BI Report Server and the Power BI service.
keywords: 
author: maggiesMSFT
ms.author: maggies
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-report-server
manager: kfile
ms.custom: mvc
ms.date: 05/22/2019
#customer intent: As a customer of Power BI, I'd like to understand how Power BI Report Server and the Power BI service are the same and are different.
---

# Comparing Power BI Report Server and the Power BI service

Power BI Report Server and the Power BI service have many similarities and some key differences. This table explains which is which.

## Features of Power BI Report Server and the Power BI service

| Features | Power BI Report Server | Power BI Service | Notes |
|---------|---------|---------|---------|
| Deployment | On-premises or hosted cloud | Cloud | Power BI Report Server can be deployed in Azure VMs (hosted cloud) if licensed through Power BI Premium |
| Source data | Cloud and/or on-premises | Cloud and/or on-premises |  |
| License | Power BI Premium or SQL Server EE with SA | Power BI Pro and/or Power BI Premium | |  
| Lifecycle | Modern lifecycle policy | Fully managed service |  |
| Release cycle | Once every 4 months | Once a month | Latest features and fixes come to Power BI Service first. Most core functionality comes to Power BI Report Server in the next few releases; some features only meant for the Power BI service. |
| Create Power BI reports in Power BI Desktop | Yes | Yes |  |
| Create Power BI reports in the browser | No | Yes |  |
| Gateway required | No | Yes for on-premises data sources |  |
| Real-time streaming | No | Yes | [Real-time streaming in Power BI](../service-real-time-streaming.md) |
| Dashboards | No | Yes | [Dashboards in the Power BI service](../consumer/end-user-dashboards.md) |
| Distribute group of reports using apps | No | Yes | [Create and publish apps with dashboards and reports](../service-create-distribute-apps.md) |
| Content packs | No | Yes | [Organizational content packs: Introduction](../service-organizational-content-pack-introduction.md) |
| Connect to services like Salesforce | Yes | Yes | [Connect to the services you use](../service-connect-to-services.md) with content packs in the Power BI service. In Power BI Report Server, use certified connectors to connect to services. See [Power BI report data sources in Power BI Report Server](data-sources.md) for details. |
| Q&A | No | Yes | [Q&A in the Power BI service and Power BI Desktop](../power-bi-tutorial-q-and-a.md) 
| Quick insights | No | Yes | [Automatically generate data insights with Power BI](../consumer/end-user-insights.md) |
| Analyze in Excel | No | Yes | [Analyze in Excel](../service-analyze-in-excel.md) 
| Paginated reports | Yes | Yes | [Paginated reports are available in the Power BI service](../paginated-reports-report-builder-power-bi.md) in preview in a Premium capacity |
| Power BI mobile apps | Yes | Yes | [Power BI mobile apps overview](../consumer/mobile/mobile-apps-for-mobile-devices.md) |
| ARC GIS maps | No | Yes | [ArcGIS maps in Power BI service and Power BI Desktop by Esri](../visuals/power-bi-visualization-arcgis.md) |
| Email subscriptions for Power BI reports | No | Yes | [Subscribe yourself or others](../service-report-subscribe.md) to a report or dashboard in the Power BI service |
| Email subscriptions for paginated reports | Yes | No | [E-Mail delivery in Reporting Services](https://docs.microsoft.com/sql/reporting-services/subscriptions/e-mail-delivery-in-reporting-services)  |
| Data alerts | No | Yes | [Data alerts](../service-set-data-alerts.md) in the Power BI service
| Row-level security (RLS) | Yes | Yes | Available in both DirectQuery (data source) & Import mode <br>Row-level security in the [Power BI service](../service-admin-rls.md) <br>Row-level security in [Power BI Report Server](row-level-security-report-server.md) |
| Full-screen mode | No | Yes | [Full-screen mode](../consumer/end-user-focus.md) in the Power BI service |
| Advanced Office 365 collaboration | No | Yes | [Collaborate in an app workspace](../service-collaborate-power-bi-workspace.md) with Office 365 |
| R visuals | No | Yes | [Create R visuals](../desktop-r-visuals.md) in Power BI Desktop and publish them to the Power BI service. You can't save Power BI reports with R visuals to Power BI Report Server.  |
| Preview features | No | Yes | [Opt in for Power BI service preview](../consumer/end-user-preview-features.md) features |
| Custom visuals | Yes | Yes | [Custom visuals in Power BI](../power-bi-custom-visuals.md) |
| Power BI Desktop | Version optimized for Report Server, available for download with Report Server | Version optimized for Power BI Service, available from the Windows Store | [Power BI Desktop for the report server](https://powerbi.microsoft.com/report-server/) <br><br> [Power BI Desktop for the Power BI service](http://aka.ms/pbidesktopstore) |

## Next steps

[Install Power BI Report Server](install-report-server.md)  