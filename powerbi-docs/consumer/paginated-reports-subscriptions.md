---
title: "Subscribe to paginated reports in the Power BI service"
description: In this article, you learn things to keep in mind about subscribing to paginated reports in the Power BI service. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 12/03/2019
---

# Subscribe yourself and others to paginated reports in the Power BI service 

You can now set up email subscriptions for yourself and others for paginated reports in the Power BI service. In general, the process is the same as [subscribing to reports and dashboards in the Power BI service](end-user-subscribe.md). This article spells out the differences and considerations. 

In setting up subscriptions, you choose how often you want to receive the emails: daily, weekly, monthly, or hourly. You can also choose the time(s) you'd like the subscription to run. In all, you can set up to 24 different subscriptions for every report. 

## Considerations for paginated report subscriptions 

- Unlike subscriptions for dashboards or Power BI reports, your subscription contains an attachment of the entire report output.  The following attachment types are supported: PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML.

- You may include a preview image of the report in the email body.  This is optional, and may differ slightly than the first page of your attached report document, depending on the attachment format selected. 

- The maximum report attachment size is 25 MB. 

- You can subscribe other users for paginated reports that connect to any currently supported data sources, including Azure Analysis Services or Power BI datasets. Keep in mind the report attachment reflects the data based on your permissions, just as SQL Server Reporting Services does today. 

- Email subscriptions can be sent with either the currently selected or default parameters for your report.  You may set different parameter values for each subscription you create for your report. 

- If your report author has set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. You can change other parameter values and choose to use current values, but unless you explicitly change that value as well, the subscription uses the expression-based parameter.

- There is no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source. 

## Next steps

[Subscribe yourself and others to reports and dashboards in the Power BI service](../service-report-subscribe.md)

[Paginated reports in the Power BI service](end-user-paginated-report.md)

