---
title: "Power BI implementation planning: Tenant setup"
description: "This article introduces important aspects to know about setting up your Fabric tenant for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 11/24/2023
---

# Power BI implementation planning: Tenant setup

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This tenant setup article introduces important aspects to know about setting up your Fabric tenant, with an emphasis on the Power BI experience. It's targeted at multiple audiences:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization.
- **Microsoft Entra administrators:** The team that's responsible for overseeing and managing Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)).

Fabric is part of a larger Microsoft ecosystem. If your organization is already using other cloud subscription services, such as Azure, Microsoft 365, or Dynamics 365, then Fabric operates within the same Microsoft Entra _tenant_. Your organizational domain (for example, _contoso.com_) is associated with Microsoft Entra ID. Like all Microsoft cloud services, your [Fabric tenant](/fabric/enterprise/licenses#tenant) relies on your organization's Microsoft Entra ID for identity and access management.

> [!TIP]
> Many organizations have an on-premises Active Directory (AD) environment that they synchronize with Microsoft Entra ID in the cloud. This setup is known as a [hybrid identity](/azure/active-directory/hybrid/whatis-hybrid-identity) solution, which is out of scope for this article. The important concept to understand is that users, groups, and service principals must exist in Microsoft Entra ID for a cloud-based suite of services like Fabric to work. Having a hybrid identity solution will work for Fabric. We recommend talking to your Microsoft Entra administrators about the best solution for your organization.

For more information about the responsibilities of a Fabric administrator, see [Tenant administration](powerbi-implementation-planning-tenant-administration.md#define-scope-of-responsibilities).

## Microsoft Entra tenant

Most organizations have one Microsoft Entra tenant, so it's commonly true that a Microsoft Entra tenant represents an organization.

Usually, Microsoft Entra ID is set up before a Fabric implementation begins. However, sometimes it's when you provision a cloud service that you become aware of the importance of Microsoft Entra ID.

> [!TIP]
> Because most organizations have one Microsoft Entra tenant, it can be challenging to explore new features in an isolated way. You might qualify for a non-production developer tenant through the [Microsoft 365 Developer Program](https://developer.microsoft.com/microsoft-365/dev-program); for details, see the [FAQ](/office/developer-program/microsoft-365-developer-program-faq#who-qualifies-for-a-microsoft-365-e5-developer-subscription-). Alternatively, you can [sign up for a 1-month free trial or purchase a Microsoft 365 plan](https://www.microsoft.com/en-us/microsoft-365/try).


### Unmanaged tenant

A _managed tenant_ has a global administrator assigned within Microsoft Entra ID. If a Microsoft Entra tenant doesn't exist for an organizational domain (for example, _contoso.com_), when the first user from that organization signs up for a Fabric trial or account, an _unmanaged tenant_ is created in Microsoft Entra ID. An unmanaged tenant is also known as a shadow tenant, or a self-service-created tenant. It has a basic configuration, allowing the cloud service to work without assigning a global administrator.

To properly manage, configure, and support Fabric, a managed tenant is required. There's a process that a system administrator can follow to [take over an unmanaged tenant](/azure/active-directory/enterprise-users/domains-admin-takeover) so that they can manage it properly on behalf of the organization.

> [!TIP]
> The administration of Microsoft Entra ID is a broad and deep topic. We recommend that you assign specific people in your IT department as system administrators to [securely manage Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-deployment-checklist-p2) for your organization.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When reviewing your Microsoft Entra tenant for use with Fabric, key decisions and actions include:

> [!div class="checklist"]
> - **Take over tenant:** If applicable, initiate the process to take over an unmanaged tenant.
> - **Confirm the Microsoft Entra tenant is managed:** Verify that your system administrators actively manage your Microsoft Entra tenant.

### Tenant ID for external users

You must consider how users will access your tenant when you have external users (such as customers, partners, or vendors) or when internal users must access another tenant outside of your organization. To access a different organizational tenant, a modified URL is used.

Every Microsoft Entra tenant has a globally unique identifier (GUID) known as the _tenant ID_. In Fabric, it's known as the _customer tenant ID (CTID)_. The CTID is appended to the end of the tenant URL. You can [find the CTID in the Fabric portal](/fabric/admin/find-fabric-home-region) by opening the _About Microsoft Fabric_ dialog window. It's available from the _Help & Support (?)_ menu, which is located at the top-right of the Fabric portal.

Knowing your CTID is important for [Microsoft Entra B2B scenarios](/power-bi/enterprise/service-admin-azure-ad-b2b). URLs that you provide to external users (for example, to view a Power BI report) must append the CTID parameter in order to access the correct tenant.

If you intend to collaborate with or provide content to external users, we recommend setting up [custom branding](/power-bi/admin/service-admin-custom-branding). Use of a logo, cover image, and theme helps users identify which organizational tenant they're accessing.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When granting external users permission to view your content, or when you have multiple tenants, key decisions and actions include:

> [!div class="checklist"]
> - **Include your CTID in relevant user documentation:** Record the URL that appends the tenant ID (CTID) in user documentation.
> - **Set up custom branding in Fabric:** In the Fabric admin portal, set up custom branding to help users identify the organizational tenant.

## Microsoft Entra administrators

Fabric administrators periodically need to work with the Microsoft Entra administrators.

The following list includes some common reasons for collaboration between Fabric administrators and Microsoft Entra administrators.

- **Security groups:** You'll need to create new [security groups](/fabric/governance/service-security-using-defender-for-cloud-apps-controls) to properly manage the Fabric tenant settings. You might also need new groups to secure workspace content or for distributing content.
- **Security group ownership:** You might want to assign a [group owner](/azure/active-directory/fundamentals/active-directory-accessmanagement-managing-group-owners) to allow more flexibility in who can manage a security group. For example, it could be more efficient to permit the Center of Excellence (COE) to manage the memberships of certain Fabric-specific groups.
- **Service principals:** You might need to create a Microsoft Entra app registration to provision a service principal. Authenticating with a service principal is a recommended practice when a Fabric administrator wants to run unattended, scheduled scripts that extract data by using the [admin APIs](/rest/api/power-bi/admin), or when [embedding content](/power-bi/developer/embedded/embed-service-principal) in an application.
- **External users:** You'll need to understand how the settings for [external (guest) users](/azure/active-directory/external-identities/external-identities-overview) are set up in Microsoft Entra ID. There are several Fabric [tenant settings](/power-bi/admin/service-admin-portal-export-sharing#allow-azure-active-directory-guest-users-to-access-power-bi) related to external users, and they rely on how Microsoft Entra ID is set up. Also, certain security capabilities for the Power BI workload only work when using the [planned invitation](/power-bi/enterprise/service-admin-azure-ad-b2b#planned-invites) approach for external users in Microsoft Entra ID.
- **Real-time control policies:** You can choose to set up [real-time session control policies](/fabric/governance/service-security-using-defender-for-cloud-apps-controls), which involves both Microsoft Entra ID and [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps). For example, you can prohibit the download of a Power BI report when it has a specific sensitivity label.

For more information, see [Collaborate with other administrators](powerbi-implementation-planning-tenant-administration.md#collaborate-with-other-administrators).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering how to work with your Microsoft Entra administrators, key decisions and actions include:

> [!div class="checklist"]
> - **Identify your Microsoft Entra administrators:** Make sure you know the Microsoft Entra administrators for your organization. Be prepared to work with them as needed.
> - **Involve your Microsoft Entra administrators:** As you work through your implementation planning process, invite Microsoft Entra administrators to pertinent meetings and involve them in relevant decision-making.

## Location for data storage

When a new tenant is created, resources are provisioned in Azure, which is Microsoft's cloud computing platform. Your geographic location becomes the _home region_ for your tenant. The [home region](/fabric/admin/find-fabric-home-region) is also known as the _default data region_.

### Home region

The home region is important because:

- The performance of reports and dashboards depends, in part, on users being in proximity to the tenant location.
- There could be legal or regulatory reasons that the organization's data be stored in a specific jurisdiction.

The home region for the organization's tenant is set to the location of the first user that signs up. If most of your users are located in a different region, that region might not be the best choice.

You can [determine the home region](/fabric/admin/find-fabric-home-region) for your tenant by opening the _About Microsoft Fabric_ dialog window in the Fabric portal. The region is displayed next to the _Your data is stored in_ label.

You might discover that your tenant resides in a region that isn't ideal. You can use the [Multi-Geo](/power-bi/admin/service-admin-premium-multi-geo) feature by creating a capacity in a specific region (described in the next section), or, you can move it. To [move your tenant](/power-bi/admin/service-admin-region-move) to another region, your global Microsoft 365 administrator should open a support request.

The relocation of a tenant to another region isn't a fully automated process, and some downtime is involved. Be sure to take into consideration the [prerequisites and actions](/power-bi/admin/service-admin-region-move) that are required before and after the move.

> [!TIP]
> Because a lot of effort is involved, when you determine that a move is necessary, we recommend that you do it sooner rather than later.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering the home region for storing data in your tenant, key decisions and actions include:

> [!div class="checklist"]
> - **Identify your home region:** Determine the home region for your tenant.
> - **Initiate the process to move your tenant:** If you discover that your tenant is located in an unsuitable geographic region (that can't be solved with the Multi-Geo feature), research the process to move your tenant.

### Other specific data regions

Some organizations have _data residency_ requirements. Data residency requirements typically include regulatory or industry requirements for storing data in a specific geographic region. _Data sovereignty_ requirements are similar, but more stringent because the data is subject to the laws of the country or region in which the data is stored. Some organizations also have _data localization_ requirements, which dictate that data created within certain borders needs to remain within those borders.

Regulatory, industry, or legal requirements can require you to store certain data elsewhere from the home region (described in the previous section). In these situations, you can benefit from the [Multi-Geo](/power-bi/admin/service-admin-premium-multi-geo) feature by creating a capacity in a specific region. In this case, you must assign workspaces to the correct capacity to ensure that the workspace data is stored in the desired geographic location.

Multi-Geo support enables organizations to:

- Meet data residency requirements for data at rest.
- Improve the ability to locate data near the user base.

> [!NOTE]
> The Multi-Geo feature is available with any [type of capacity license](/fabric/enterprise/licenses#capacity) (except shared capacity). It's not available with Premium Per User (PPU) because data stored in workspaces assigned to PPU is always stored in the home region (just like shared capacity).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering other specific data regions for your tenant, key decisions and actions include:

> [!div class="checklist"]
> - **Identify data residency requirements:** Determine what your requirements are for data residency. Identify which regions are appropriate, and which users might be involved.
> - **Investigate use of the Multi-Geo feature:** For specific situations where data should be stored elsewhere from the home region, investigate enabling Multi-Geo.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).

> [!TIP]
> To learn how to manage a Fabric tenant, we recommend that you work through the [Administer Microsoft Fabric](/training/modules/administer-fabric/) module.
