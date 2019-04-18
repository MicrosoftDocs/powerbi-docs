---
title: "Subscribe yourself and others to a paginated report in the Power BI service"
description: In this article, you learn things to keep in mind about subscribing to  paginated reports in the Power BI service.  
author: maggiesMSFT
ms.author: maggies
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 04/17/2019
---

# Subscribe yourself and others to a paginated report in the Power BI service 

Paginated reports now support email subscriptions in the Power BI service.   You choose how often you want to receive the emails: daily, weekly, or, soon, hourly. If you choose daily or weekly, you can choose the time you'd like the subscription to run. In all, you can set up to 24 different subscriptions per day for every report. 

See the article [Subscribe yourself and others to reports and dashboards in the Power BI service](service-report-subscribe.md) for details.

## Considerations for paginated report subscriptions 

- Unlike subscriptions for dashboards or Power BI reports, your subscription contains a PDF attachment of the entire report output.

- There is no preview image of the report in the email body.  We are planning to have the image of the first page of the report as an optional item. 

- The maximum report attachment size is currently 12 MB. 

- You can subscribe other users for paginated reports that use a live connection to either Azure Analysis Services or Power BI datasets.  The report attachment reflects the data based on your permissions, just as SQL Server Reporting Services does today. 

- Report page subscriptions are tied to the name of the report.  

- Email subscriptions are sent with the report's default parameter values. 

- There is no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source. 

## Next steps

[Subscribe yourself and others to reports and dashboards in the Power BI service](service-report-subscribe.md)
[What are paginated reports in Power BI Premium? (Preview)](paginated-reports-report-builder-power-bi.md)
