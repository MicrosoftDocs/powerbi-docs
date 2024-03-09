---
title: "Subscribe to paginated reports in the Power BI service on OneDrive SharePoint"
description: Subscribe to deliver your full Power BI and paginated reports to the OneDrive SharePoint location when you set up your subscription.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 03/08/2024
---

# Subscribe to paginated reports in the Power BI service on OneDrive SharePoint

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

Subscribe to your Power BI and paginated reports to deliver them to OneDrive SharePoint. Your full report gets delivered to the OneDrive SharePoint location that you can select when you set up your subscription.

## Requirements 

The requirements apply to users in the organization. To create a subscription, you need:

- Permissions to access the report.
- Access to a workspace backed by a Power BI Premium capacity or equivalent Fabric capacity.

Your Fabric admin (previously Power BI admin) needs to enable subscriptions in your tenant. If you’re an admin, see [Enable subscriptions in the Power BI admin portal](/fabric/admin/service-admin-portal-export-sharing#users-can-set-up-email-subscriptions). 

 

## Subscribe to a report 

You can only subscribe to a full report to be delivered to OneDrive SharePoint as follows: 

1. Open a report in the Power BI service. This can be a Power BI report or a paginated report from the top menu bar. 

 

 

1. Select **Create a subscription**. 

 

1. Select **Standard**.  

 

1. By default:  

    - Your subscription is given the same name as your report page.  Optionally, change the name of the subscription to something more meaningful.
    - Your name is populated as the Recipient.  

1. Select the format that you want your report to be in. 

    For Power BI reports, we support .pdf and .pptx 

 

    For paginated reports, we support several formats:

    - Microsoft Excel (.xlsx)
    - PDF (.pdf)
    - Accessible PDF (.pdf)
    - Microsoft PowerPoint (.pptx)
    - XML (.xml)
    - Comma-separated values (.csv)

 

1. Select the type of subscription. 

  

1. When you select **OneDrive** or **SharePoint**, select the folder location that you want the subscription to be delivered to. 

 

1. By default, the File Name is the same as the Subscription name. Optionally, you can change this. Also by default, the option to append the file name with date and time is selected. You have the option to un-select that. 

   

1. Select the **Start date**, frequency of delivery, **Scheduled time** of delivery and **Time zone**. You can select an **End date**, if you want. 

 

1. Save the subscription. 

 

 

You receive the full report in the OneDrive or SharePoint location that you selected at the frequency that you selected. 

 

## Considerations and limitations 

- [Microsoft Entra Business-to-Business (B2B) guest users](../enterprise/service-admin-azure-ad-b2b.md) can't choose OneDrive Share Point. 
- Premium per user accounts can't choose OneDrive SharePoint. 
