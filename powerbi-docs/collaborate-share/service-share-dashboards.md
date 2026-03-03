---
title: Collaborate and share in Power BI
description: Learn how to share Power BI reports and dashboards with colleagues inside and outside your organization. Discover key sharing features and best practices.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: sunaraya
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 11/25/2025
ai-usage: ai-assisted
LocalizationGroup: Share your work
ms.custom: sfi-image-nochange
---

# Collaborate and share Power BI reports and dashboards

Power BI offers several ways to collaborate and share Power BI reports, dashboards, and data with others—inside or outside your organization. This article explains the main sharing and collaboration options, when to use each, and how to manage permissions.

## Prerequisites

- You need a [Power BI Pro or Premium Per User (PPU) license](../fundamentals/service-features-license-type.md) to share content, unless the content is in a [Premium capacity](../enterprise/service-premium-what-is.md).
- Recipients also need a Power BI Pro or PPU license, unless the content is in a Premium or Fabric capacity.
- To let recipients edit a shared report, assign them a workspace role that allows editing. See [Roles in workspaces](service-roles-new-workspaces.md) for details.
- For recipients with free licenses to access shared reports, both the report and its underlying semantic model must be in Premium capacity. If the semantic model is in a different workspace that isn't in Premium capacity, free users will receive a prompt to upgrade their license.

> [!NOTE]
> Only **P SKU**s and **F SKU**s F64 or larger let users with a Microsoft Fabric free license and the Viewer role use Power BI apps and shared content. Smaller **F SKU**s require a Pro license. The **F SKU** is part of Fabric. To learn more, see [Microsoft Fabric licenses](/fabric/enterprise/licenses).

## Ways to collaborate and share

### Share reports and dashboards

- Share from My Workspace or other workspaces (with the right role or permissions).
- [Share from the Power BI mobile apps](../explore-reports/mobile/mobile-share-dashboard-from-the-mobile-apps.md).
- [Share from Power BI Desktop](../create-reports/desktop-sharepoint-save-share.md) with OneDrive and SharePoint integration.
- [Publish reports from Power BI Desktop](../create-reports/desktop-upload-desktop-files.md) to the Power BI service.

1. In a list of reports or dashboards, or when viewing one, select **Share**.
1. In the **Send link** dialog, choose how to share:
   - **People in your organization**: Anyone in your org with the link can view (not for external/guest users).
   - **Specific people**: Enter names or emails to share directly (can include Microsoft Entra B2B guests).
   - **People with existing access**: Send a link to someone who already has access.
1. Set permissions:
   - **Reshare**: Allow recipients to share with others.
   - **Build**: Allow recipients to build their own reports based on the data.
1. Copy the link or send it directly via email, Outlook, PowerPoint, or Teams.

:::image type="content" source="media/service-share-dashboards/power-bi-share-links.png" alt-text="Screenshot of the Share link dialog box in Power BI, showing sharing options for reports.":::

> [!NOTE]
> Your organization might restrict shareable links to "People in your organization." See [tenant settings](/fabric/admin/service-admin-portal-export-sharing#allow-shareable-links-to-grant-access-to-everyone-in-your-organization).

### Workspaces

- Use workspaces to collaborate on content with a team.
- Assign roles (Admin, Member, Contributor, Viewer) to control access and editing.
- Content in workspaces can be published as apps for broader distribution.

### Publish apps

- Package dashboards and reports into an app for easy distribution.
- Share apps with large groups or your entire organization.
- Recipients get a consistent, read-only experience unless you grant build permissions.

### Microsoft Teams integration

- Share reports and dashboards directly in Teams channels or chats.
- Collaborate in real time and discuss insights with your team.

### Share outside your organization

To share content with external users, your Power BI administrator must enable external sharing in the tenant settings. See [tenant settings for guest users](/fabric/admin/service-admin-portal-export-sharing#guest-users-can-access-microsoft-fabric) for details.

- Enter the external user's email address (Microsoft Entra B2B guests recommended).
- Recipients must sign in to Power BI to view shared content.
- Only direct recipients can access the shared content; forwarding the link does not grant access.
- If RLS is implemented, external users only see data they're permitted to view.

For more information, see [Distribute Power BI content to external guest users with Microsoft Entra B2B](/fabric/enterprise/powerbi/service-admin-entra-b2b).

### Share with large groups

- Use security groups to share with large audiences.
- Or, create an app from a workspace and publish it to many users. See [publishing apps in Power BI](service-create-distribute-apps.md).

## Manage permissions

1. Select **More options (...)** in the sharing dialog, then **Manage permissions**.
1. In the **Manage permissions** pane, you can:
   - Copy or change existing links
   - Grant or remove direct access
   - View pending requests and related content
   - Use **Advanced** for more options

:::image type="content" source="media/service-share-dashboards/power-bi-share-manage-settings.png" alt-text="Screenshot of the Manage permissions dialog in Power BI.":::

> [!NOTE]
> Each report can't have more than 1,000 sharing links. If you reach this limit, remove links for "Specific people" and grant those users direct access.

## Considerations and limitations

- Only reports can be shared via links that grant access; dashboards require direct access.
- Sharing a report or dashboard also grants access to the underlying semantic model. For free users to access shared content, both the report and the underlying semantic model must be in Premium capacity. If the semantic model is stored in a different workspace that isn't in Premium capacity, free users will be prompted to upgrade their license even if the report itself is in Premium capacity.
- Recipients can interact with content in Reading view but can't edit unless granted build permissions.
- Analyze in Excel access can be restricted by admins.
- You can't share reports distributed to you in an app; ask the app owner to add users and republish.
- Distribution groups can be used for sharing, but Microsoft 365 Unified groups are not supported for direct sharing.
- If coworkers already have access, you can send a direct link by copying the URL.
- Email notifications are only sent to individual users, not groups.

## Related content

- [Roles in workspaces](service-roles-new-workspaces.md)
- [Share from Power BI Desktop](../create-reports/desktop-sharepoint-save-share.md)
- [Troubleshoot sharing dashboards and reports](service-troubleshoot-sharing.md)
- [Sharing for users with free licenses](../explore-reports/end-user-shared-with-me.md)
- [Request or grant access to shared dashboards or reports](service-request-access.md)
- [Share a filtered Power BI report](service-share-reports.md)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
