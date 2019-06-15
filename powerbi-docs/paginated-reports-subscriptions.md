---
title: "Subscribe to paginated reports in the Power BI service"
description: In this article, you learn things to keep in mind about subscribing to  paginated reports in the Power BI service. 
author: maggiesMSFT
ms.author: maggies
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 05/24/2019
---

# Subscribe yourself and others to paginated reports in the Power BI service 

You can now set up email subscriptions for yourself and others for paginated reports in the Power BI service. In general, the process is the same as [subscribing to reports and dashboards in the Power BI service](service-report-subscribe.md). This article spells out the differences and considerations. 

In setting up subscriptions, you choose how often you want to receive the emails: daily, weekly, or hourly. If you choose daily or weekly, you can choose the time you'd like the subscription to run. In all, you can set up to 24 different subscriptions per day for every report. 

## Considerations for paginated report subscriptions 

- Unlike subscriptions for dashboards or Power BI reports, your subscription contains an attachment of the entire report output.  The following attachment types are supported: PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML.

- There is no preview image of the report in the email body.  We are planning to have the image of the first page of the report as an optional item. 

- The maximum report attachment size is 25 MB. 

- You can subscribe other users for paginated reports that connect to any currently supported data sources, including Azure Analysis Services or Power BI datasets. Keep in mind the report attachment reflects the data based on your permissions, just as SQL Server Reporting Services does today. 

- Report page subscriptions are tied to the name of the report.  

- Email subscriptions are sent with the report's default parameter values. 

- There is no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source. 

## Next steps

[Subscribe yourself and others to reports and dashboards in the Power BI service](service-report-subscribe.md)

[What are paginated reports in Power BI Premium?](paginated-reports-report-builder-power-bi.md)
