---
title: "Subscribe to paginated reports in the Power BI service"
description: In this article, you learn things to keep in mind about subscribing to paginated reports in the Power BI service. 
author: mihart
ms.author: maggies
ms.reviewer: cmfinlan
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 03/08/2021
---

# Subscribe yourself and others to paginated reports in the Power BI service 

You can now set up email subscriptions for yourself and others for paginated reports in the Power BI service. In general, the process is the same as [subscribing to reports and dashboards in the Power BI service](end-user-subscribe.md). This article spells out the differences and considerations. 

In setting up subscriptions, you choose how often you want to receive the emails: daily, weekly, monthly, or hourly. You can also choose the time(s) you'd like the subscription to run. There is no limit to the number of subscriptions you may set for every report. 

## Considerations for paginated report subscriptions 

- You don't need edit permissions to the paginated report to create a subscription for yourself, but you must have edit permissions to create one for someone else in your organization. If you have at least a Contributor role in the workspace where the paginated report is, then you can create subscriptions for others in your organization. Read more about [Roles in workspaces](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces).

- To subscribe external users who are not members of your organization, the external user must first [onboard using B2B (Business to business)](/power-platform/admin/invite-users-azure-active-directory-b2b-collaboration). 

- Unlike subscriptions for dashboards or Power BI reports, your subscription contains an attachment of the entire report output.  The following attachment types are supported: PDF, PowerPoint presentation (PPTX), Excel Workbook (XLSX), Word Document (DOCX), CSV file, and XML.

- You may include a preview image of the report in the email body.  This is optional, and may differ slightly than the first page of your attached report document, depending on the attachment format you select.

- The maximum report attachment size is 25 MB.

- You can subscribe other users in your organization to paginated reports that connect to any currently supported data sources, including Azure Analysis Services or Power BI datasets. Keep in mind the report attachment reflects the data based on your permissions. 

- Email subscriptions can be sent with either the currently selected or default parameters for your report.  You may set different parameter values for each subscription you create for your report. 

- If your report author has set expression-based parameters (for example, the default is always today's date), the subscription uses that as the default value. You can change other parameter values and choose to use current values, but unless you explicitly change that value as well, the subscription uses the expression-based parameter.

- There is no **After Data Refresh** option for frequency with paginated reports. You always get the latest values from the underlying data source. 

## Next steps

[Subscribe yourself and others to reports and dashboards in the Power BI service](../collaborate-share/service-report-subscribe.md)

[Paginated reports in the Power BI service](end-user-paginated-report.md)
