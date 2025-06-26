---  
title: Share Power BI reports and dashboards  
description: Learn how to easily share Power BI reports and dashboards with colleagues inside and outside your organization.  
author: JulCsc  
ms.author: juliacawthra  
ms.reviewer: sunaraya  
ms.service: powerbi  
ms.subservice: pbi-collaborate-share  
ms.topic: how-to  
ms.date: 06/24/2025  
LocalizationGroup: Share your work
ai-usage: ai-assisted
---  

# Share Power BI reports and dashboards  

Sharing is the simplest way to give colleagues access to your Power BI reports and dashboards. Recipients can view and interact with shared content but can't edit it unless you grant extra permissions.  

## Prerequisites  

- You and your recipients need a [Power BI Pro or Premium Per User (PPU) license](../fundamentals/service-features-license-type.md), unless the content is hosted in a [Premium capacity](../enterprise/service-premium-what-is.md).  
- To allow recipients to edit shared reports, assign them an appropriate workspace role. See [Roles in workspaces](service-roles-new-workspaces.md).  

> [!NOTE]
> Only **P SKUs** and **F SKUs** (F64 or larger) allow users with a Microsoft Fabric free license to view shared content. Smaller **F SKUs** require a Pro license. Learn more about [Microsoft Fabric licenses](/fabric/enterprise/licenses).  

## Share reports

1. Open your report and select the **Share** icon.
1. Choose sharing options:  
   - **People in your organization**: Anyone in your organization with the link can view.  
   - **Specific people**: Enter names or emails to share directly.  
   - **People with existing access**: Send a link without granting new permissions.  

   :::image type="content" source="media/service-share-dashboards/power-bi-share-links.png" alt-text="Screenshot of the Share link dialog box." lightbox="media/service-share-dashboards/power-bi-share-links.png":::  

1. Adjust permissions as needed:  
   - **Reshare** (default): Allows recipients to share further.  
   - **Build**: Lets recipients create new reports from the data.  

:::image type="content" source="media/service-share-dashboards/power-bi-share-link-settings.png" alt-text="Screenshot of the Link settings dialog box." lightbox="media/service-share-dashboards/power-bi-share-link-settings.png":::  

Recipients receive an email with a link to access the report.  

## Share dashboards  

1. Open your dashboard and select the **Share** icon.
1. Enter names or emails, set permissions, and select **Grant access**.  

:::image type="content" source="media/service-share-dashboards/power-bi-share-dashboard.png" alt-text="Screenshot of the Share dashboard dialog box." lightbox="media/service-share-dashboards/power-bi-share-dashboard.png":::  

## Manage permissions  

To manage access:  

1. Select **More options (...)** > **Manage permissions**.  
1. Add or remove users, adjust permissions, or manage sharing links.  

:::image type="content" source="media/service-share-dashboards/manage-permissions-pane.png" alt-text="Manage permissions pane" lightbox="media/service-share-dashboards/manage-permissions-pane.png":::  

## Share outside your organization  

You can share reports and dashboards with external users. They must sign in to Power BI and have a Pro or PPU license. External users can't reshare content.  

## Sharing limits and best practices  

- You can share with up to 100 users or groups at once. To share with more, use groups or publish an app.  
- Use security groups (not distribution groups) for external sharing.  
- Apply [row-level security (RLS)](/fabric/security/service-admin-row-level-security) to restrict data access.  

## Considerations  

- Sharing a report or dashboard also shares the underlying semantic model unless restricted by RLS.  
- Recipients can interact with reports and dashboards but can't edit unless explicitly permitted.  
- Users can manually [refresh data](../connect-data/refresh-data.md).  
- You can't reshare content distributed via apps.  

## Related content  

- [Collaborate and share in Power BI](service-how-to-collaborate-distribute-dashboards-reports.md)  
- [Troubleshoot sharing](service-troubleshoot-sharing.md)  
- [Request or grant access](service-request-access.md)  
- [Share filtered reports](service-share-reports.md)  
- Questions? Visit the [Power BI Community](https://community.powerbi.com/).  
