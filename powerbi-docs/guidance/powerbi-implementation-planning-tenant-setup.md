---
title: "Power BI implementation planning: Tenant setup"
description: "TODO PBIIP tenant setup"
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 05/31/2022
---

# Power BI implementation planning: Tenant setup

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

Power BI is part of a larger Microsoft ecosystem. If your organization is already using other cloud subscription services such as Azure, Microsoft 365, or Dynamics 365, then Power BI will operate within the same [Azure Active Directory](/azure/active-directory/fundamentals/active-directory-whatis) (Azure AD) *tenant*. Your organizational domain (such as Contoso.com) is associated with Azure AD. Like all Microsoft cloud services, Power BI relies on your organization's Azure AD for identity and access management.

This article is targeted primarily to Power BI administrators and Azure AD administrators. It focuses on important aspects to know about your Power BI tenant.

> [!TIP]
> Many organizations implement Active Directory (on-premises) and synchronize it to Azure Active Directory (in the cloud). [Hybrid identity](/azure/active-directory/hybrid/whatis-hybrid-identity) techniques are complex, and out of scope for this article. The important concept to be aware of is that users, groups, and service principals must exist in Azure Active Directory for cloud-based services like Power BI to work.

## Azure AD tenant

One Azure AD tenant represents an organization. Usually, Azure AD is set up before a Power BI implementation begins. However, sometimes it's the usage of a cloud service that makes an organization initially aware of the importance of Azure AD.

### Unmanaged tenant

If there's not an Azure AD tenant in existence for a domain (such as Contoso.com), when the first user from Contoso.com signs up for a Power BI account (Free or Pro or PPU), an *unmanaged tenant* is created in Azure AD. This unmanaged tenant is also known as a *shadow tenant,* or a *self-service created tenant*. It has a basic configuration, allowing the cloud service to work, without a global administrator assigned.

There's a process for a system administrator to [take over the unmanaged tenant](/azure/active-directory/enterprise-users/domains-admin-takeover) so that it can be managed properly on behalf of the organization.

> [!NOTE]
> The administration of Azure AD is an immensely wide and deep topic with a lot of considerations. We recommend having specific people who are well-versed in [how to securely manage](/azure/active-directory/fundamentals/active-directory-deployment-checklist-p2) Azure AD for your organization.

When considering your Azure AD tenant for use with Power BI, the key decisions and actions include:

| **Key decisions and actions** |
| --- |
| **Confirm the Azure tenant is managed:** Verify your Azure AD tenant is actively being managed by the system administrators. If it's not, initiate the process to take over the unmanaged tenant. |

### Tenant ID for external users

Every Azure Active Directory tenant has a globally unique identifier (GUID) known as the **tenant ID**. It's known as the *customer tenant ID (CTID)* in Power BI. You can find the CTID in the Power BI service in the **About Power BI** dialog box. It's available from the **Help & Support (?)** dropdown menu in the top right-hand corner when logged into the Power BI service. The CTID is displayed at the end of the **Tenant URL**.

:::image type="content" source="media/powerbi-implementation-planning-tenant-setup/determine-customer-tenant-id.png" alt-text="Image shows how to determine the customer tenant I D, as described in the previous paragraph." border="false":::

Knowledge of your CTID is important for [Azure AD B2B scenarios](../enterprise/service-admin-azure-ad-b2b.md). For instance, you may have external Power BI users (such as customers, partners, or vendors) who are granted permission to view content that's been published to your Power BI tenant. Or your internal users may be granted permission to view content that's been published to another Power BI tenant. URLs that are provided to external Power BI users (for example, to view a report) will need to include the CTID parameter in the URL to appropriately find the content in the correct tenant.

If you intend to use Power BI with external users, [custom branding](../admin/service-admin-custom-branding.md) really helps users identify which organizational tenant they're viewing content in. You're able to update the logo, cover image, and theme color.

When considering your tenant ID for use with Power BI, the key decisions and actions include:

| **Key decisions and actions** |
| --- |
| **Include your CTID in relevant user documentation:** Include the tenant ID (CTID) in any user documentation related to distributing content to external guest users. |
| **Set up custom branding in Power BI:** In the admin portal, update the custom branding if you intend to use Power BI with external guest users. |

## Azure AD administrators

A Power BI administrator will periodically need to work with the Azure AD administrator(s).

The following are a few of the most common reasons for collaboration between the Power BI administrator and Azure AD administrator:

- **Security group:** You'll need to create new [security groups](../enterprise/service-security-using-defender-for-cloud-apps-controls.md) to properly manage the Power BI tenant settings. New groups may also be needed on a regular basis for securing Power BI content (workspace roles, for instance).
- **Group ownership:** You may want to assign a [group owner](/azure/active-directory/fundamentals/active-directory-accessmanagement-managing-group-owners) to allow more flexibility in who can manage a group. For example, it could be most efficient for the Center of Excellence to be permitted to manage the memberships for certain Power BI-specific groups.
- **Service principal:** You may need to create an Azure AD app that a service principal can be provisioned. This is helpful when the Power BI administrator wants to run unattended, scheduled, scripts that extract data from the [Power BI admin APIs](../enterprise/read-only-apis-service-principal-authentication.md) or when [embedding](../developer/embedded/embed-service-principal.md) content into another application.
- **External user:** You'll need to understand how the settings for [external (guest) users](/azure/active-directory/external-identities/external-identities-overview) are configured in Azure AD. There are several Power BI [tenant settings](../admin/service-admin-portal-export-sharing.md#allow-azure-active-directory-guest-users-to-access-power-bi) related to external users, and they have a dependency on how Azure AD is configured. Also, certain functionality in Power BI only works when using the [planned invitation](../enterprise/service-admin-azure-ad-b2b.md#planned-invites) approach for external users in Azure AD.
- **Real-time policy:** You may choose to configure [real-time session control policies](../enterprise/service-security-using-defender-for-cloud-apps-controls.md) (which involves both Azure AD and Microsoft Defender for Cloud Apps). For example, you could prohibit the download of a report in the Power BI service if it has a specific sensitivity label.

When considering how to work with your Azure AD administrators, the key decisions and actions include:

| **Key decisions and actions** |
| --- |
| **Identify your Azure AD administrators:** Make sure you know who administers Azure AD for your organization. Be prepared to work with them as needed. |
| **Involve your Azure AD administrators:** As you undergo the Power BI planning and implementation process, invite an Azure AD administrator to pertinent meetings and involve them in relevant decision-making. |

## Location for storage of data

When a Power BI tenant is created, [resources are provisioned in Azure](whitepaper-powerbi-security.md#power-bi-architecture) which is Microsoft's cloud computing platform. The geographic location used when creating the Power BI tenant becomes the *default data region* for your Power BI tenant. The default data region is also referred to as the *home region*.

### Default data region

The default data region is important because:

- The performance of reports and dashboards depends, in part, on users being in proximity to the Power BI tenant.
- There may be legal or regulatory reasons that the organization's data is stored in a specific jurisdiction.

The default data region is determined from the location chosen during the initial sign-up by the first user from your organization. The region that was selected becomes the default data region for the organization's Power BI tenant. If most of your Power BI users are located in a different region, the default data region might not be the best choice.

You can [find the default data region](../admin/service-admin-where-is-my-tenant-located.md#how-to-find-the-default-region-for-your-organization) for your Power BI tenant in the **About Power BI** dialog box in the Power BI service. It's available from the **Help and Support** dropdown menu (the question mark icon) in the top right-hand corner of the screen when logged into the Power BI service. The region is displayed next to **Your data is stored in**.

:::image type="content" source="media/powerbi-implementation-planning-tenant-setup/determine-default-data-region.png" alt-text="Image shows how to determine the default data region, as described in the previous paragraph." border="false":::

You may discover that your Power BI tenant currently resides in a location that isn't ideal. It's possible to [move your Power BI tenant](/admin/service-admin-region-move.md) to another data region. Your global Microsoft 365 administrator can initiate the move with a support case.

> [!TIP]
> The relocation of a Power BI tenant to a new geographic region is not a fully automated process, and some downtime is involved. Be fully aware of the [prerequisites and actions](../admin/service-admin-region-move.md) that'll be required before and after the move. Although there's quite a bit of effort involved, if you determine that a move is necessary then it's important to do it earlier rather than later.

When considering the default data region for your Power BI tenant, the key decisions and actions include:

| **Key decisions and actions** |
| --- |
| **Identify your default data region:** Verify what the default data region is for your Power BI tenant. If it's an unacceptable geographic region, investigate the process to move your Power BI tenant. |

### Other specific data regions

For situations when data needs to be stored elsewhere from the default data region, a Premium capacity may be assigned to a different data region. Note that individual workspaces must be assigned to the correct Premium capacity to ensure the data is truly stored in the desired geographic location. [Multi-geo](../admin/service-admin-premium-multi-geo.md) support enables organizations to:

- Meet data residency requirements for data at rest.
- Improve the ability to locate data near the user base.

> [!NOTE]
> The multi-geo capability is available with Premium capacity or Power BI Embedded. It's not available with Premium Per User (PPU). Data stored in workspaces assigned to PPU is always in the default data region.

When considering other specific data regions for your Power BI tenant, the key decisions and actions include:

| **Key decisions and actions** |
| --- |
| **Identify other data residency requirements:** For specific situations where data should be stored elsewhere from the default data region, investigate the use of Premium multi-geo. |

## Next steps

For additional considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see the [Power BI implementation planning checklist](powerbi-implementation-planning-checklist.md).
