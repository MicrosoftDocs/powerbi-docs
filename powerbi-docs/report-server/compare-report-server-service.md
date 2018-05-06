---
title: Comparing Power BI Report Server and the Power BI service
description: This article compares the features of Power BI Report Server and the Power BI service.
services: powerbi
keywords: 
author: maggiesMSFT
ms.author: maggies
ms.component: powerbi-report-server
ms.date: 05/07/2018
ms.topic: overview
ms.service: powerbi
manager: kfile
ms.custom: mvc
#customer intent: As a customer of Power BI, I'd like to understand how Power BI Report Server and the Power BI service are the same and are different.
---
# Comparing Power BI Report Server and the Power BI service

Power BI Report Server and the Power BI service have a lot of similarities and some key differences. This table explains which is which.

| Features | Power BI Report Server | Power BI Service | Notes
|---------|---------|---------|---------|
| Deployment | On-premises or hosted cloud | Cloud | Power BI Report Server can be deployed in Azure VMs (hosted cloud) if licensed through Power BI Premium
| Source Data | Cloud and/or on-premises | Cloud and/or on-premises |  
| License | Power BI Premium or SQL Server EE with SA | Power BI Pro and/or Power BI Premium |  
| Lifecycle | Modern lifecycle policy | Fully managed service |  
| Release cycle | Once every 4 months | Once a month | Latest features and fixes come to Power BI Service first. Most core functionality makes its way to Power BI Report Server in the next couple of releases, but some features are only meant for the Power BI service.
| Create Power BI reports in Power BI Desktop | Yes | Yes |  
| Create Power BI reports in the browser | No | Yes |  
| Gateway required | No | Yes for on-premises data sources |  
| Real-time streaming | No | Yes | [Real-time streaming in Power BI](../service-real-time-streaming.md)
| Dashboards | No | Yes | [Dashboards in the Power BI service](../service-dashboards.md) 
| Distribute group of reports using apps | No | Yes | [Create and publish apps with dashboards and reports](../service-create-distribute-apps.md) 
| Content packs | No | Yes | [Organizational content packs: Introduction](../service-organizational-content-pack-introduction.md) 
| Q&A | No | Yes | [Q&A in Power BI service and Power BI Desktop](../power-bi-q-and-a.md) 
| Quick insights | No | Yes | [Automatically generate data insights with Power BI](../service-insights.md) 
| Analyze in Excel | No | Yes | [Analyze in Excel](../service-analyze-in-excel.md) 
| Paginated reports | Yes | No | Paginated reports aren't available in the Power BI service, but you can [pin paginated report items to Power BI dashboards](https://docs.microsoft.com/sql/reporting-services/pin-reporting-services-items-to-power-bi-dashboards)
| Power BI mobile apps | Yes | Yes | [Power BI mobile apps overview](../mobile-apps-for-mobile-devices.md) 
| ARC GIS maps | No | Yes | [ArcGIS maps in Power BI service and Power BI Desktop by Esri](../power-bi-visualization-arcgis.md)
| Email subscriptions for Power BI reports | No | Yes | [Subscribe to a report or dashboard in Power BI service](../service-report-subscribe.md) 
| Email subscriptions for paginated reports | Yes | No | [E-Mail delivery in Reporting Services](https://docs.microsoft.com/sql/reporting-services/subscriptions/e-mail-delivery-in-reporting-services) after 
| Data Alerts | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-set-data-alerts
| Row level Security | Only through data source in Direct Query Mode | Available in both Direct Query (data source) & Import mode | https://docs.microsoft.com/en-us/power-bi/service-admin-rls
| Full Screen mode | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-fullscreen-mode
| Advanced O365 collaboration | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-collaborate-power-bi-workspace
| R visuals | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-r-visuals
| Preview Features | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-preview-features
| Custom Visuals | Yes | Yes | https://docs.microsoft.com/en-us/power-bi/power-bi-custom-visuals
| Power BI Desktop | Version optimized for Report Server and is available for download along with Report Server | Version optimized for Power BI Service and is available for download monthly | Power BI Desktop for Report Server - https://powerbi.microsoft.com/en-us/report-server/ <br> Power BI Desktop for Service - https://powerbi.microsoft.com/en-us/desktop/



## Next steps
[Install Power BI Report Server](quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  



