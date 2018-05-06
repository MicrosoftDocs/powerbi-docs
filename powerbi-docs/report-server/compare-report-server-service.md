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



| Features | Power BI Report Server | Power BI Service | Notes
|---------|---------|---------|---------|
| Deployment | On-premises or Hosted Cloud | Cloud | Power BI Report Server can be deployed in Azure VMs (Hosted Cloud) if licensed through Power BI Premium
| Source Data | Cloud and/or On-Prem | Cloud and/or On-Prem |  
| License | Power BI Premium or SQL Server EE with SA | Power BI Pro and/or Power BI Premium |  
| Lifecycle | Modern Lifecycle Policy | Fully Managed Service |  
| Release cycle | Once in 4 months | Once in a month | Latest features and fixes come to Power BI Service first. Most of the core functionalities make their way to the Power BI Report Server in the next couple of releases but some features are only meant for the Power BI Service.
| Create Power BI reports | Yes | Yes |  
| Gateway required | No | Yes for on-prem data sources |  
| Real-time streaming | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-real-time-streaming
| Dashboards | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-dashboards
| Content packs | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-organizational-content-pack-introduction
| Q&A | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-q-and-a
| Quick Insight | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-insights
| Analyze in Excel | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-analyze-in-excel
| Paginated reports | Yes | No | Even though paginated reports are not available in Power BI Service, you can pin your paginated reports (SSRS) to Power BI Dashboards - https://docs.microsoft.com/en-us/sql/reporting-services/pin-reporting-services-items-to-power-bi-dashboards
| Mobile BI | Yes | Yes | https://powerbi.microsoft.com/en-us/mobile/
| ARC GIS Maps | No | Yes | http://www.esri.com/software/arcgis/arcgis-maps-for-power-bi
| Email Subscriptions | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-report-subscribe
| Data Alerts | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-set-data-alerts
| Row level Security | Only through data source in Direct Query Mode | Available in both Direct Query (data source) & Import mode | https://docs.microsoft.com/en-us/power-bi/service-admin-rls
| Full Screen mode | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-fullscreen-mode
| Advanced O365 collaboration | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-collaborate-power-bi-workspace
| R visuals | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-r-visuals
| Distribute group of reports using apps | No | Yes | https://powerbi.microsoft.com/en-us/blog/distribute-to-large-audiences-with-power-bi-apps/
| Preview Features | No | Yes | https://docs.microsoft.com/en-us/power-bi/service-preview-features
| Custom Visuals | Yes | Yes | https://docs.microsoft.com/en-us/power-bi/power-bi-custom-visuals
| Power BI Desktop | Version optimized for Report Server and is available for download along with Report Server | Version optimized for Power BI Service and is available for download monthly | Power BI Desktop for Report Server - https://powerbi.microsoft.com/en-us/report-server/ 
|   |   |   | Power BI Desktop for Service - https://powerbi.microsoft.com/en-us/desktop/



## Next steps
[Install Power BI Report Server](quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  



