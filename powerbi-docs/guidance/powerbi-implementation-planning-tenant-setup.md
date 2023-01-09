---
title: "Power BI implementation planning: Tenant setup"
description: "This article introduces important aspects to know about setting up your Power BI tenant."
author: kfollis
ms.author: kfollis
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 12/12/2022
---

# Power BI implementation planning: Tenant setup

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This tenant setup article introduces important aspects to know about setting up your Power BI tenant. It's targeted at multiple audiences:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization.
- **Azure Active Directory administrators:** The team who is responsible for overseeing and managing [Azure Active Directory (Azure AD)](/azure/active-directory/fundamentals/active-directory-whatis).

Power BI is part of a larger Microsoft ecosystem. If your organization is already using other cloud subscription services, such as Azure, Microsoft 365, or Dynamics 365, then Power BI will operate within the same Azure AD *tenant*. Your organizational domain (for example, *contoso.com*) is associated with Azure AD. Like all Microsoft cloud services, Power BI relies on your organization's Azure AD for identity and access management.

> [!TIP]
> Many organizations have an on-premises Active Directory (AD) environment that they synchronize with Azure AD in the cloud. This setup is known as a [hybrid identity](/azure/active-directory/hybrid/whatis-hybrid-identity) solution, which is out of scope for this article. The important concept to understand is that users, groups, and service principals must exist in Azure AD for cloud-based services like Power BI to work. Having a hybrid identity solution will work for Power BI. We recommend talking to your Azure AD administrators about the best solution for your organization.

## Azure AD tenant

Most organizations have one Azure AD tenant, so it's commonly true that an Azure AD tenant represents an organization.

Usually, Azure AD is set up before a Power BI implementation begins. However, sometimes it's when you provision a cloud service that you become aware of the importance of Azure AD.

> [!TIP]
> Because most organizations have one Azure AD tenant, it can be challenging to explore new features in an isolated way. For non-production testing purposes, consider using a free [Microsoft 365 E5 instant sandbox](https://developer.microsoft.com/microsoft-365/dev-program). It includes Power BI licenses and is available through the [Microsoft 365 Developer Program](/office/developer-program/microsoft-365-developer-program-faq).

### Unmanaged tenant

A *managed tenant* has a global administrator assigned in Azure AD. If an Azure AD tenant doesn't exist for a domain (for example, *contoso.com*), when the first user from that domain signs up for a Power BI account - Free, Power BI Pro or Premium Per User (PPU) - an *unmanaged tenant* is created in Azure AD. An unmanaged tenant is also known as a shadow tenant, or a self-service created tenant. It has a basic configuration, allowing the cloud service to work without assigning a global administrator.

To properly manage, configure, and support Power BI, a managed tenant is required. There's a process that a system administrator can follow to [take over an unmanaged tenant](/azure/active-directory/enterprise-users/domains-admin-takeover) so that they can manage it properly on behalf of the organization.

> [!TIP]
> The administration of Azure AD is a broad and deep topic. We recommend that you assign specific people in your IT department as system administrators to [securely manage Azure AD](/azure/active-directory/fundamentals/active-directory-deployment-checklist-p2) for your organization.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When reviewing your Azure AD tenant for use with Power BI, key decisions and actions include:

> [!div class="checklist"]
> - **Take over tenant:** If applicable, initiate the process to take over an unmanaged tenant.
> - **Confirm the Azure tenant is managed:** Verify that your system administrators actively manage your Azure AD tenant.

### Tenant ID for external users

You must consider how users will access your tenant when you have external Power BI users (such as customers, partners, or vendors) or when internal users must access another Power BI tenant. To access the tenant, they'll need to use a modified URL.

Every Azure AD tenant has a globally unique identifier (GUID) known as the *tenant ID*. In Power BI, it's known as the *customer tenant ID (CTID)*. You can find the CTID in the Power BI service by opening the **About Power BI** dialog window. It's available from the **Help & Support (?)** menu located at the top-right of the Power BI service. The CTID is appended to the end of the tenant URL.

:::image type="content" source="media/powerbi-implementation-planning-tenant-setup/determine-customer-tenant-id.png" alt-text="Screenshot of the About Power BI dialog window with the customer tenant ID highlighted." border="false":::

Knowing your CTID is important for [Azure AD B2B scenarios](/power-bi/enterprise/service-admin-azure-ad-b2b). URLs that you provide to external Power BI users (for example, to view a report) must append the CTID parameter in order to access the correct tenant.

If you intend to use Power BI with external users, we recommend setting up [custom branding](/power-bi/admin/service-admin-custom-branding). It helps users identify which organizational tenant they're accessing. Custom branding elements include a logo, cover image, and theme color.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When granting external users permission to view your Power BI content, or when you have multiple tenants, key decisions and actions include:

> [!div class="checklist"]
> - **Include your CTID in relevant user documentation:** Record the URL that appends the tenant ID (CTID) in user documentation.
> - **Set up custom branding in Power BI:** In the admin portal, set up custom branding to help users identity the organizational tenant.

## Azure AD administrators

Power BI administrators periodically need to work with the Azure AD administrators.

The following list includes some common reasons for collaboration between Power BI administrators and Azure AD administrators.

- **Security groups:** You'll need to create new [security groups](/power-bi/enterprise/service-security-using-defender-for-cloud-apps-controls) to properly manage the Power BI tenant settings. You may also need new groups to secure Power BI workspace content or for distributing content.
- **Group ownership:** You may want to assign a [group owner](/azure/active-directory/fundamentals/active-directory-accessmanagement-managing-group-owners) to allow more flexibility in who can manage a group. For example, it could be more efficient to permit the Center of Excellence (COE) to manage the memberships of certain Power BI-specific groups.
- **Service principals:** You may need to create an Azure AD app registration to provision a service principal. Authenticating with a service principal is a recommended practice when a Power BI administrator wants to run unattended, scheduled scripts that extract data by using the Power BI admin APIs, or when [embedding Power BI content](/power-bi/developer/embedded/embed-service-principal) in an application.
- **External users:** You'll need to understand how the settings for [external (guest) users](/azure/active-directory/external-identities/external-identities-overview) are set up in Azure AD. There are several Power BI [tenant settings](/power-bi/admin/service-admin-portal-export-sharing#allow-azure-active-directory-guest-users-to-access-power-bi) related to external users, and they rely on how Azure AD is set up. Also, certain functionality in Power BI only works when using the [planned invitation](/power-bi/enterprise/service-admin-azure-ad-b2b#planned-invites) approach for external users in Azure AD.
- **Real-time policies:** You may choose to set up [real-time session control policies](/power-bi/enterprise/service-security-using-defender-for-cloud-apps-controls), which involves both Azure AD and [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps). For example, you can prohibit the download of a report in the Power BI service when it has a specific sensitivity label.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering how to work with your Azure AD administrators, key decisions and actions include:

> [!div class="checklist"]
> - **Identify your Azure AD administrators:** Make sure you know the Azure AD administrators for your organization. Be prepared to work with them as needed.
> - **Involve your Azure AD administrators:** As you work through the Power BI planning and implementation process, invite Azure AD administrators to pertinent meetings and involve them in relevant decision-making.

## Location for data storage

When you create a Power BI tenant, resources are provisioned in Azure, which is Microsoft's cloud computing platform. Your geographic location becomes the *default data region* for your Power BI tenant. The default data region is also known as the *home region*.

### Default data region

The default data region is important because:

- The performance of reports and dashboards depends, in part, on users being in proximity to the Power BI tenant.
- There may be legal or regulatory reasons that the organization's data be stored in a specific jurisdiction.

The default data region for the organization's Power BI tenant is based on the location of the first user to sign up. If most of your Power BI users are located in a different region, the default data region might not be the best choice.

You can [determine the default data region](/power-bi/admin/service-admin-where-is-my-tenant-located#how-to-find-the-default-region-for-your-organization) for your Power BI tenant by opening the **About Power BI** dialog window in the Power BI service. The region is displayed next to the **Your data is stored in** label.

:::image type="content" source="media/powerbi-implementation-planning-tenant-setup/determine-default-data-region.png" alt-text="Screenshot of the About Power BI dialog window with the default data region highlighted." border="false":::

If you discover that your Power BI tenant resides in a region that isn't ideal, you can move it. To [move your Power BI tenant](/power-bi/admin/service-admin-region-move) to another region, your global Microsoft 365 administrator should open a support request.

The relocation of a Power BI tenant to another region isn't a fully automated process, and some downtime is involved. Be sure to take into consideration the [prerequisites and actions](/power-bi/admin/service-admin-region-move) that are required before and after the move.

> [!TIP]
> Because a lot of effort is involved, when you determine that a move is necessary, we recommend that you do it sooner rather than later.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering the default data region for your Power BI tenant, key decisions and actions include:

> [!div class="checklist"]
> - **Identify your default data region:** Determine the default data region for your Power BI tenant.
> - **Initiate the process to move your tenant:** If you discover that your Power BI tenant is located in an unsuitable geographic region, research the process to move your Power BI tenant.

### Other specific data regions

Some organizations have *data residency* requirements. Data residency requirements typically include regulatory or industry requirements for storing data in a specific geographic region. *Data sovereignty* requirements are similar, but more stringent because the data is subject to the laws of the country or region in which the data is stored. Some organizations also have *data localization* requirements, which dictate that data created within certain borders needs to remain within those borders.

Regulatory, industry, or legal requirements can require you to store certain data in Power BI elsewhere from the default data region (described earlier). In these situations, you can benefit from the [Multi-Geo](/power-bi/admin/service-admin-premium-multi-geo) feature by creating a capacity in a specific region. In this case, you must assign workspaces to the correct capacity to ensure that the workspace data is stored in the desired geographic location.

Multi-Geo support enables organizations to:

- Meet data residency requirements for data at rest.
- Improve the ability to locate data near the user base.

> [!NOTE]
> The Multi-Geo feature is available with Premium or Microsoft Power BI Embedded. It's not available with Premium Per User (PPU) because data stored in workspaces assigned to PPU is always stored in the default data region.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering other specific data regions for your Power BI tenant, key decisions and actions include:

> [!div class="checklist"]
> - **Identify data residency requirements:** Determine what your requirements are for data residency. Identify which regions are appropriate, and which users might be involved.
> - **Investigate use of the Multi-Geo feature:** For specific situations where data should be stored elsewhere from the default data region, investigate enabling Multi-Geo.

## Next steps

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).

> [!TIP]
> To learn how to manage a Power BI tenant, we recommend that you work through the [Administer Power BI learning path](/training/paths/administer-power-bi-part-1/).
