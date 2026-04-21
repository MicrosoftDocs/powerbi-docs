---
title: "Share and Collaborate on Power BI Reports and Dashboards"
description: "Learn how to share Power BI reports and dashboards inside and outside your organization. Explore sharing methods, manage permissions, and collaborate effectively."
author: JulCsc
ms.author: juliacawthra
ms.reviewer: sunaraya, sergeig
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 04/21/2026
ai-usage: ai-assisted
LocalizationGroup: Share your work
ms.custom: sfi-image-nochange
---

# Share and collaborate on Power BI reports and dashboards

Power BI offers several ways to share and collaborate on Power BI reports, dashboards, and data with others - inside or outside your organization. This article explains the main sharing and collaboration options, when to use each, and how to manage permissions.

<!-- PG-APPROVED SECURITY CONTENT: The following security overview was reviewed and approved by the Power BI product group (PG). Do not edit or remove without consulting PG. -->

> [!IMPORTANT]
> When you share a report, you also share access to its underlying semantic model. By default, a report consumer's read access isn't restricted to the elements and data visible in the report. Define security on the semantic model using [row-level security (RLS)](/fabric/security/service-admin-row-level-security) to restrict access to rows of data, or [object-level security (OLS)](/analysis-services/tabular-models/object-level-security) to restrict access to columns and tables. Hiding a table, column, measure, visual, or report page doesn't prevent a report user from accessing these hidden elements - hiding isn't a security measure, but an option to provide a clutter-free user experience. For more information about security planning, see [Report consumer security planning](../guidance/powerbi-implementation-planning-security-report-consumer-planning.md) and [Fabric permission model](/fabric/security/permission-model).

<!-- END PG-APPROVED SECURITY CONTENT: Security overview -->

## Choose a sharing method

Not sure which option to use? Start here:

| Scenario | Best method | Requirements |
|---|---|---|
| Share a specific report or dashboard with named people | [Direct link or access](#share-reports-and-dashboards) | Pro/PPU license or Premium capacity |
| Distribute polished content to a large team or your whole org | [Publish an app](#publish-apps-to-distribute-content) | Pro/PPU license to publish; free license to consume in Premium/Fabric capacity |
| Co-author or collaborate on content with a team | [Workspace](#collaborate-using-workspaces) | Assign workspace roles (Admin, Member, Contributor) |
| Share and discuss reports in Microsoft Teams | [Teams integration](#share-reports-in-microsoft-teams) | Power BI app for Teams |
| Share with people outside your organization | [External sharing](#share-power-bi-content-outside-your-organization) | Admin must enable external sharing; users sign in with Microsoft Entra B2B |
| Share with a large audience via a security group | [Security group access](#share-with-large-groups-using-security-groups-or-apps) | Pro/PPU license or Premium capacity |

## Prerequisites

- To share content, you need a [Power BI Pro or Premium Per User (PPU) license](../fundamentals/service-features-license-type.md), unless the content is in a [Premium capacity](../enterprise/service-premium-what-is.md).
- Recipients also need a Power BI Pro or PPU license, unless the content is in a Premium or Fabric capacity.
- To let recipients edit a shared report, assign them a workspace role that allows editing. See [Roles in workspaces](service-roles-new-workspaces.md) for details.
- For recipients with free licenses to access shared reports, both the report and its underlying semantic model must be in Premium capacity. If the semantic model is in a different workspace that isn't in Premium capacity, free users receive a prompt to upgrade their license.

> [!NOTE]
> Only **P SKUs** and **F SKUs** F64 or larger let users with a Microsoft Fabric free license and the Viewer role use Power BI apps and shared content. Smaller **F SKUs** require a Pro license. The **F SKU** is part of Fabric. To learn more, see [Microsoft Fabric licenses](/fabric/enterprise/licenses).

## Share reports and dashboards

- Share reports and dashboards from **My Workspace** or other workspaces when you have the right role or permissions.
- [Share reports and dashboards from the Power BI mobile apps](../explore-reports/mobile/mobile-share-dashboard-from-the-mobile-apps.md).
- [Share reports and dashboards from Power BI Desktop](../create-reports/desktop-sharepoint-save-share.md) with OneDrive and SharePoint integration.
- [Publish reports from Power BI Desktop](../create-reports/desktop-upload-desktop-files.md) to the Power BI service.

1. In a list of reports or dashboards, or when viewing one, select **Share**.
1. In the **Send link** dialog, choose how to share:
   - **People in your organization**: Anyone in your organization with the link can view (not for external or guest users).
   - **Specific people**: Enter names or emails to share directly (can include Microsoft Entra B2B guests).
   - **People with existing access**: Send a link to someone who already has access.
1. Set permissions:
   - **Reshare**: Allow recipients to share with others.
   - **Build**: Allow recipients to build their own reports based on the data.
1. Copy the link or send it directly via email, Outlook, PowerPoint, or Teams.

:::image type="content" source="media/service-share-dashboards/power-bi-share-links.png" alt-text="Screenshot of the Share link dialog in Power BI showing People in your organization, Specific people, and People with existing access options for sharing reports and dashboards.":::

> [!NOTE]
> Your organization might restrict shareable links to **People in your organization**. See [tenant settings](/fabric/admin/service-admin-portal-export-sharing#allow-shareable-links-to-grant-access-to-everyone-in-your-organization).

<!-- PG-APPROVED SECURITY CONTENT: The following Link settings section was reviewed and approved by the Power BI product group (PG) as part of the response to Nokod Security's claims. This doc is linked to from https://microsoft.sharepoint.com/sites/FabricCATPortal/SitePages/Fabric-Security.aspx to address https://nokodsecurity.com/blog/in-plain-sight-how-microsoft-power-bi-reports-expose-sensitive-data-on-the-web/. Do not edit or remove without consulting PG. -->

### Link settings

You can choose who your sharing link gives access to and what they can do with the report and associated data:

- **People in your organization**: This type of link allows people in your organization to access the report. This link doesn't work for external users or guest users. Use this link type when:
  - You want to share with someone in your organization.
  - You're comfortable with the link being shared with other people inside your organization.
  - You want to ensure that the link doesn't work for external or guest users.
- **People with existing access**: This type of link generates a URL to the report, but it doesn't give any access to the report. Use this link type if you just want to send a link to somebody who already has access.
- **Specific people**: This type of link allows specific people or groups to access the report. If you select this option, enter the names or email addresses of the people you want to share with. This link type lets you share with guest users in your organization's Microsoft Entra ID. You can't share with external users who aren't guests in your organization.
- **Settings**: Links that give access to **People in your organization** or **Specific people** always include at least read access. However, you can also specify if you want the link to include or exclude the following permissions:
  - Reshare permissions (included by default) - allows recipients to share the report with others.
  - Build permissions (excluded by default) - allows recipients to build their own reports in other workspaces based on the data associated with the report. Read more about [creating reports based on semantic models from different workspaces](../connect-data/service-datasets-discover-across-workspaces.md).
  - Links for **People with existing access** don't have any other settings because these links don't give any access to the report.

### Additional link considerations

- Users can't use a link not shared directly with them to access a report. However, the report might be shared with the user via a different link or they might have direct access to the report through a workspace role.
- If your Power BI admin has disabled shareable links to **People in your organization**, you can only copy and share links to **Specific people** or **People with existing access**.
- If you have reshare permissions to the report but you don't have reshare permissions to the report's underlying data, your shareable links don't give access to the underlying data.
- If you don't have reshare permissions to the report, you can only copy and share links to **People with existing access**.
- If you don't have a Power BI Pro license, you can only copy and share links to **People with existing access**.

<!-- END PG-APPROVED SECURITY CONTENT: Link settings -->

## Collaborate using workspaces

- Use workspaces to collaborate on content with a team.
- Assign roles (Admin, Member, Contributor, Viewer) to control access and editing.
- Publish content in workspaces as apps for broader distribution.

When you collaborate with a team in a workspace, the team has access to all the data in the workspace. To restrict a user's data access, assign the Viewer role and define [RLS](/fabric/security/service-admin-row-level-security) or [OLS](/analysis-services/tabular-models/object-level-security) on the semantic model.

## Publish apps to distribute content

- Package dashboards and reports into an app for easy distribution.
- Share apps with large groups or your entire organization.
- Recipients get a consistent, read-only experience unless you grant build permissions.

When you share a report through an app, recipients get read access to both the report and its underlying semantic model. Without RLS or OLS defined on the semantic model, the report is shared with full access to all the data, even when tables, columns, or measures aren't shown in the report. If users have a direct link to any content in your app, they can access all the data, even if the table, column, or measure is visually hidden in the app navigation. When you create an app, you can also grant users build permissions on the semantic model, which enables them to build new solutions on top of the data.

## Share reports in Microsoft Teams

- Share reports and dashboards directly in Teams channels or chats.
- Collaborate in real time and discuss insights with your team.

<!-- PG-APPROVED SECURITY CONTENT: The following Link settings section was reviewed and approved by the Power BI product group (PG) as part of the response to Nokod Security's claims. This doc is linked to from https://microsoft.sharepoint.com/sites/FabricCATPortal/SitePages/Fabric-Security.aspx to address https://nokodsecurity.com/blog/in-plain-sight-how-microsoft-power-bi-reports-expose-sensitive-data-on-the-web/. Do not edit or remove without consulting PG. -->

## Share a dashboard

In a list of dashboards or in an open dashboard, select **Share**.

In the **Share dashboard** dialog, grant users or groups direct access to the dashboard. Enter the name or email address of the user or group, optionally type a message, and select **Grant access**.

Similar to report sharing, specify if you want to grant users the following permissions:

- Reshare permissions (included by default) - recipients can share the dashboard with others.
- Build permissions (included by default) - recipients can build content with the data associated with the dashboard.

You can share the dashboard with guest users whose addresses are outside your organization, but guest users can't reshare dashboards.

> [!NOTE]
> The input box supports up to 100 separate users or groups. To learn how to share with more people, see [Share with large groups using security groups or apps](#share-with-large-groups-using-security-groups-or-apps).

## Manage permissions to a dashboard

To manage permissions for the dashboard, select the **More options** menu (...) in the upper right of the **Share dashboard** dialog, and then select **Manage permissions**.

The **Manage permissions** pane opens, where you can see who has direct access. Select the plus icon (+) to grant more users direct access to the dashboard.

For more access management capabilities, select the **Advanced** option in the footer of the **Manage permissions** pane. On the management page that opens, you can:

- View and manage who has **Direct access** and grant people direct access.
- View and manage **Pending** access requests and invitations.
- View and manage **Related content**.
- Apply **Filters** or **Search** for specific people.

To remove a user's access to the dashboard, select the ellipsis (**...**) next to that user's permissions and select **Remove access**. In the **Remove access** dialog, decide if you also want to remove access to related content, such as reports and semantic models. It's best to also remove access to related content; otherwise, the related content might not display properly.

<!-- END PG-APPROVED SECURITY CONTENT: Dashboard sharing and permissions -->

<!-- PG-APPROVED SECURITY CONTENT: The following external sharing section was reviewed and approved by the Power BI product group (PG) as part of the response to Nokod Security's claims. Do not edit or remove without consulting PG. -->

## Share Power BI content outside your organization

To share content with external users, your Power BI admin must enable external sharing in the tenant settings. For more information, see [tenant settings for guest users](/fabric/admin/service-admin-portal-export-sharing#guest-users-can-access-microsoft-fabric).

When you share with people outside your organization, they receive an email with a link to the shared report or dashboard. The recipient has to sign in to Power BI to see what you shared. If they don't have a Power BI Pro or Premium Per User (PPU) license, they can sign up for a license when they select the link.

After people sign in, they see the shared report or dashboard in its own browser window, not in the usual Power BI portal. External recipients should bookmark the link to get back to this report or dashboard later.

Only your direct recipients see the shared report or dashboard. For example, if you send the email to `Vicki@contoso.com`, only Vicki sees the dashboard. No one else can see the dashboard, even if Vicki forwards them the link. Vicki must use the same email address to access it; if Vicki signs in with any other email address, Vicki doesn't have access to the dashboard.

People outside your organization don't see any data at all if role- or row-level security is implemented on on-premises Analysis Services tabular models.

Use a security group, not a distribution group, to share with a group that includes people with external email addresses. People with external emails in a distribution group can't see the content you share, unless they're Microsoft Entra B2B guest users. For more information, see [Distribute Power BI content to external guest users with Microsoft Entra B2B](/fabric/enterprise/powerbi/service-admin-entra-b2b).

If you send a link from a Power BI mobile app to people outside your organization, selecting the link opens the dashboard in a browser, not in the Power BI mobile app.

<!-- END PG-APPROVED SECURITY CONTENT: External sharing -->

## Share with large groups using security groups or apps

- Use security groups to share with large audiences.
- Or, create an app from a workspace and publish it to many users. See [publishing apps in Power BI](service-create-distribute-apps.md).

## Manage permissions

1. Select **More options (...)** in the sharing dialog, and then select **Manage permissions**.
1. In the **Manage permissions** pane, you can:
   - Copy or change existing links
   - Grant or remove direct access
   - View pending requests and related content
   - Use **Advanced** for more options

:::image type="content" source="media/service-share-dashboards/power-bi-share-manage-settings.png" alt-text="Screenshot of the Manage permissions pane in Power BI showing options to copy links, grant direct access, and view pending requests.":::

> [!NOTE]
> Each report can't have more than 1,000 sharing links. If you reach this limit, remove links for "Specific people" and grant those users direct access.

<!-- PG-APPROVED SECURITY CONTENT: The following Link settings section was reviewed and approved by the Power BI product group (PG) as part of the response to Nokod Security's claims. This doc is linked to from https://microsoft.sharepoint.com/sites/FabricCATPortal/SitePages/Fabric-Security.aspx to address https://nokodsecurity.com/blog/in-plain-sight-how-microsoft-power-bi-reports-expose-sensitive-data-on-the-web/. Do not edit or remove without consulting PG. -->

## Considerations and limitations

> [!IMPORTANT]
> **Publish to web** makes reports publicly accessible on the internet without authentication, including all underlying data in the semantic model. Before using **Publish to web**, review the security guidance in [Publish to web from Power BI](service-publish-to-web.md).

Keep the following considerations in mind when sharing reports and dashboards:

- You can share both reports and dashboards with users through direct access. However, only reports can be shared via links that give access to the report and underlying data.
- If you have reshare permissions to the underlying semantic model, when you share a report or dashboard with colleagues you're also sharing the underlying semantic model. Your colleagues get access to the entire semantic model unless [row-level security (RLS)](/fabric/security/service-admin-row-level-security) or [object-level security (OLS)](/analysis-services/tabular-models/object-level-security) limits their access. Report authors might customize user experiences when viewing or interacting with reports. For example, authors might hide columns or limit the actions on visuals. These customized user experiences don't restrict what data users can access in the semantic model. Hiding isn't a security measure - it provides a clutter-free experience. Use [RLS](/fabric/security/service-admin-row-level-security) in the semantic model to restrict access to rows of data, and [OLS](/analysis-services/tabular-models/object-level-security) to restrict access to columns and tables, so that each person's credentials determine which data they can access.
- For free users to access shared content, both the report and the underlying semantic model must be in Premium capacity. If the semantic model is stored in a different workspace that isn't in Premium capacity, free users are prompted to upgrade their license even if the report itself is in Premium capacity.
- Everyone you successfully share your dashboard with can see it and interact with the related reports in [Reading view](../explore-reports/end-user-reading-view.md#reading-view). In general, they can't create reports or save changes to existing reports. However, if you select **Allow recipients to build content with the data associated with this dashboard**, recipients get full access to all elements in the underlying semantic model and can create their own reports, dashboards, and other solutions in other workspaces. They only see data allowed by RLS or OLS rules configured in the semantic model.
- Although no one can see or download the semantic model, they can access the semantic model directly by using the Analyze in Excel feature. An admin can restrict the ability to use Analyze in Excel for everyone in a group. However, the restriction is for everyone in that group and for every workspace the group belongs to.
- Everyone can manually [refresh the data](../connect-data/refresh-data.md).
- You can't share reports that are distributed to you in an app. Ask the app owner to add the person you want to share the report with and republish the app.
- If you use Microsoft Exchange Online for email, you can enter the email address of a distribution group to share with its members.
- You can't use Microsoft 365 Unified groups for direct sharing and email subscriptions. If you don't want to specify individuals, you can use email-enabled distribution groups or security groups to share with multiple users. See [Use group email aliases](end-user-subscribe.md?tabs=creator#use-group-email-aliases) in "Email subscriptions for reports and dashboards in the Power BI service" for more information.
- Coworkers who share your email domain, and coworkers whose domain is different but registered within the same tenant, can share the dashboard with others. For example, say the domains contoso.com and contoso2.com are registered in the same tenant and your email address is `konrads@contoso.com`. Both `ravali@contoso.com` and `gustav@contoso2.com` can share your dashboard, as long as you give them permission to share.
- If your coworkers already have access to a specific report or dashboard, you can send a direct link by copying the URL when you're on the dashboard or report. For example: `https://app.powerbi.com/reports/g12466b5-a452-4e55-8634-xxxxxxxxxxxx`.
- When you share reports or dashboards via direct access, an email notification is only sent to individual users, and not to groups.

<!-- END PG-APPROVED SECURITY CONTENT: Considerations and limitations -->

## Related content

- [Roles in workspaces](service-roles-new-workspaces.md)
- [Share from Power BI Desktop](../create-reports/desktop-sharepoint-save-share.md)
- [Troubleshoot sharing dashboards and reports](service-troubleshoot-sharing.md)
- [Sharing for users with free licenses](../explore-reports/end-user-shared-with-me.md)
- [Request or grant access to shared dashboards or reports](service-request-access.md)
- [Share a filtered Power BI report](service-share-reports.md)
- [Report consumer security planning](../guidance/powerbi-implementation-planning-security-report-consumer-planning.md)
- [Fabric permission model](/fabric/security/permission-model)
- Questions? [Try the Power BI Community](https://community.powerbi.com/).
