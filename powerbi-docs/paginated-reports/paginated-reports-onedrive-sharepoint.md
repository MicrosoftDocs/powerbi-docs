---
title: "Send large report subscriptions to OneDrive SharePoint"
description: Subscribe to deliver your full Power BI and paginated reports to the OneDrive SharePoint location when you set up your subscription.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: nirusrin
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.date: 03/25/2024
#customer intent: The customer is looking to set up subscriptions to deliver large Power BI and paginated reports to OneDrive SharePoint.
---

# Send large report subscriptions to OneDrive SharePoint

[!INCLUDE [applies-yes-service-no-report-builder-no-power-bi-desktop](../includes/applies-yes-service-no-report-builder-no-desktop.md)]

You can send all of your large reports, both Power BI (.pbix) and paginated reports, to OneDrive SharePoint.

:::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-subscriptions.png" alt-text="Screenshot showing in the Subscriptions pane, select create a subscription." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-subscriptions.png":::

Subscribe to your Power BI and paginated reports to deliver them to OneDrive SharePoint. Your full report gets delivered to the OneDrive SharePoint location that you can select when you set up your subscription.

## Requirements

The requirements apply to users in the organization. To create a subscription, you need:

- Permissions to access the report.
- Access to a workspace backed by a [Premium capacity](../enterprise/service-premium-what-is.md) or equivalent [Fabric capacity](/fabric/enterprise/licenses#microsoft-fabric-license-types). 

Your Fabric admin (previously Power BI admin) needs to enable subscriptions in your tenant. If you’re an admin, see [Enable subscriptions in the Power BI admin portal](/fabric/admin/service-admin-portal-export-sharing#users-can-set-up-email-subscriptions). 

## Subscribe to a report

Here's how you subscribe to a full report to be delivered to OneDrive SharePoint.

1. From the top menu bar, open a report in the Power BI service. This can be a Power BI report or a paginated report. 

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-subscribe-to.png" alt-text="Screenshot showing subscribe to." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-subscribe-to.png":::

1. Select **Create a subscription**. 

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-create-subscription.png" alt-text="Screenshot showing subscribe to paginated" lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-create-subscription.png":::

1. We currently support Standard subscriptions. Select **Standard**.  

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-standard.png" alt-text="Screenshot showing in the Subscriptions pane, create a standard subscription." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-standard.png":::

1. Select the **Attach full report** option.

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-attach-full-report.png" alt-text="Screenshot showing in the Subscriptions pane, select the Attach full report option." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-attach-full-report.png":::

    By default:  

    - Your subscription is given the same name as your report page.  Optionally, change the name of the subscription to something more meaningful.
    - Your name is populated as the Recipient.  

1. Select the format that you want your report to be in. 

    Power BI reports support two formats:

    - PDF (.pdf)
    - Microsoft PowerPoint (.pptx)

    Paginated reports support several formats:

    - Microsoft Excel (.xlsx)
    - PDF (.pdf)
    - Accessible PDF (.pdf)
    - Microsoft PowerPoint (.pptx)
    - XML (.xml)
    - Comma-separated values (.csv)

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-save-pdf.png" alt-text="Screenshot showing in the Subscriptions pane, select the format for the full report." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-save-pdf.png"::: 

1. Select the type of subscription. 

1. When you select **OneDrive** or **SharePoint**, select the folder location where you want the subscription to be delivered, and enter the subscription schedule to have your report delivered.

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-onedrive-schedule-subscriptions.png" alt-text="Screenshot showing in the Subscriptions pane, select the subscription schedule for the report." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-paginated-onedrive-schedule-subscriptions.png":::

1. By default, the File Name is the same as the Subscription name. Optionally, you can change these values. Also by default, the option to append the file name with date and time is selected. You can unselect that. 

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/power-bi-file-name.png" alt-text="Screenshot showing in the Subscriptions pane, select the Attach full report option." lightbox="media/paginated-reports-onedrive-sharepoint/power-bi-file-name.png":::

1. Select the **Start date**, frequency of delivery, **Scheduled time** of delivery and **Time zone**. You can also select an **End date**, if you want. 

    :::image type="content" source="media/paginated-reports-onedrive-sharepoint/scheduling-subscriptions.png" alt-text="Screenshot showing in scheduling." lightbox="media/paginated-reports-onedrive-sharepoint/scheduling-subscriptions.png":::

1. Save the subscription. 

You receive the full report saved to the OneDrive or SharePoint location that you selected at the frequency that you selected. 

Learn more about [subscribing to OneDrive SharePoint](/sharepoint/onedrive-overview).

## Considerations and limitations 

- [Microsoft Entra Business-to-Business (B2B) guest users](../enterprise/service-admin-azure-ad-b2b.md) can't choose OneDrive SharePoint. 
- Premium per user accounts can't choose OneDrive SharePoint. 

## Related content

- [Tutorial: Create a paginated report and upload it to the Power BI service](paginated-reports-onedrive-sharepoint.md)