---
title: "Power BI Tenant-Level Security Planning"
description: "Learn about tenant-level security planning for Power BI."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: Tenant-level security

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

Content creators can use and secure Power BI content in different ways, so they make many of their own tactical decisions. But before that occurs, administrators make key strategic planning decisions for the tenant. This article describes those strategic decisions and planning for them.

Tenant-level security decisions affect everything, so we recommend that you make the tenant-level security decisions as early as possible. And, it's easier to make other security decisions after you clarify your overall security goals and objectives.

This article is primarily for:

- **Fabric administrators**: Administrators who are responsible for overseeing Power BI in the organization.
- **Center of Excellence (CoE), IT, and BI teams**: Teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators, information security teams, and other teams.

This article might also be relevant for self-service Power BI creators who create, publish, and manage content in workspaces.

The series of articles is intended to expand the content that's presented in the [Power BI security white paper](whitepaper-powerbi-security.md). The white paper focuses on key technical subjects like authentication, data residency, and network isolation.

The implementation planning series describes considerations and decisions to help you plan for security and privacy.

## Power BI administration

The Fabric Administrator role is a high-privilege role that has substantial control over Power BI in your organization. We recommend that you carefully consider who you assign this role to.

The Fabric Administrator role can perform many high-level functions, including:

- **Manage tenant settings**: The Fabric Administrator role can manage [tenant settings](/fabric/admin/tenant-settings-index) via the admin portal. The role can enable or disable settings and allow or disallow specific users or groups within settings. Tenant settings substantially affect the user experience.
- **Manage the workspace role**: Administrators can [add themselves to the workspace admin role](/fabric/admin/portal-workspaces#workspace-options) via the admin portal. They can potentially update workspace security to access any data or grant rights to other users to access any data in Fabric.
- **Access personal workspaces**: Administrators can access the contents of and govern the [personal workspace](/fabric/admin/portal-workspaces#gain-access-to-any-users-my-workspace) of any user.
- **Access tenant metadata**: Administrators can access metadata that applies to the entire tenant, including the Power BI activity logs and activity events retrieved by the [Power BI admin APIs](/rest/api/power-bi/admin).

> [!TIP]
> To reduce risk and to ensure adequate coverage and cross-training, assign the Fabric Administrator role to between two and four users.

A Power BI administrator is assigned at least one of these [built-in roles](/microsoft-365/admin/add-users/about-admin-roles):

- Fabric Administrator
- Power Platform Administrator
- Global Administrator (a high-privilege role with limited assignment)

When you assign administrator roles, we recommend that you follow [best practices](/entra/identity/role-based-access-control/best-practices).

> [!NOTE]
> Although a Power Platform administrator can manage the Power BI service, the inverse isn't true. A user who is assigned the Fabric Administrator role can't manage other applications in the Power Platform.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you plan which users should be Fabric administrators, key decisions and actions include:

> [!div class="checklist"]
>
> - **Identify who's currently assigned an administrator role**: Identify current users who are assigned one of the roles that can administer Power BI.
> - **Determine who should manage the Power BI service**: If too many users are assigned administrator roles, create a plan to reduce the total number. If users who aren't well-suited to the functions or responsibilities are assigned administrator roles for Power BI, create a plan to resolve the issue.
> - **Clarify roles and responsibilities**: For each Power BI administrator, ensure that responsibilities are clear. Verify that appropriate cross-training has occurred.

## Security and privacy strategies

You'll make tenant-level decisions that relate to security and privacy. The tactics you take and the decisions you make are based on these factors:

- Your [data culture](fabric-adoption-roadmap-data-culture.md). The goal is to encourage a data culture that understands that security and protection of data is everyone's responsibility.
- Your [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) strategies. The level of centralized and decentralized content management significantly affects how you implement security.
- Your [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) strategies. The number of people who view content influences how you need to handle security for the content.
- Your requirements to comply with global, national/regional, and industry regulations.

The following list includes a few examples of high-level security strategies. Some strategies affect the entire organization.

- **Requirements for row-level security**: You can use row-level security (RLS) to restrict data access for specific users. Different users see different data when they access the same report. A Power BI semantic model or a data source (if you use single sign-on) can enforce RLS. For more information, see the _Enforce data security based on consumer identity_ section in [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity).
- **Data discoverability**: Determine the extent to which data discoverability should be encouraged in Power BI. Discoverability affects who can find semantic models or datamarts in the [OneLake catalog](/fabric/governance/onelake-catalog), and whether content authors are allowed to request access to those items by using the _Request access_ workflow. For more information, see the [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) usage scenario.
- **Data that can be stored in Power BI**: Determine whether certain types of data shouldn't be stored in Power BI. For example, you might specify that certain sensitive information types, like bank account numbers or Social Security numbers, can't be stored in a semantic model. For more information, see [Information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md).
- **Inbound private networking**: Determine the requirements for network isolation by using private endpoints to access Power BI. When you use [Azure Private Link](/fabric/security/security-private-links-overview), data traffic is sent by using the Microsoft private network backbone instead of going across the internet.
- **Outbound private networking**: Determine whether more security is required when a user connects to a data source. The [virtual network data gateway](/data-integration/vnet/use-data-gateways-sources-power-bi) enables secure outbound connectivity from Power BI to data sources within a virtual network. You can use an Azure virtual network data gateway when content is stored in a Premium workspace.

> [!IMPORTANT]
> When you consider network isolation, work with your IT infrastructure and networking teams before you change any Fabric tenant settings. Azure Private Link allows enhanced _inbound_ security through private endpoints. An Azure virtual network gateway allows enhanced _outbound_ security to connect to data sources. An Azure virtual network gateway is Microsoft-managed rather than customer-managed, so it eliminates the overhead of installing and monitoring on-premises gateways.

Some of your organization-level decisions result in firm governance policies, especially as they relate to compliance. Other organization-level decisions might result in guidance that you can provide to content creators who are responsible for managing and securing their own content. The resulting policies and guidelines should be included in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal), [training](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training) materials, and [communication plan](fabric-adoption-roadmap-community-of-practice.md#communication-plan).

> [!TIP]
> See the other articles in this series for more suggestions that relate to security planning for [report consumers](powerbi-implementation-planning-security-report-consumer-planning.md) and [content creators](powerbi-implementation-planning-security-content-creator-planning.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you plan your high-level security strategies, key decisions and actions include:

> [!div class="checklist"]
>
> - **Identify regulatory requirements related to security**: Investigate and document each requirement, including how to ensure compliance.
> - **Identify high-level security strategies**: Determine which security requirements are important enough to include in a governance policy.
> - **Collaborate with other administrators**: Contact relevant system administrators to discuss how to meet security requirements and what technical prerequisites exist. Plan to complete a technical proof of concept.
> - **Update Fabric tenant settings**: Set up each relevant Fabric tenant setting. Schedule regular follow-up reviews.
> - **Create and publish user guidance**: Create documentation for high-level security strategies. Include details about the process and how a user can request an exemption from the standard process. Make this information available in your centralized portal and training materials.
> - **Update training materials**: For high-level security strategies, determine which requirements or guidelines to include in user training materials.

## Integration with Microsoft Entra ID

Power BI security is built on a [Microsoft Entra](/azure/active-directory/fundamentals/active-directory-whatis) tenant foundation. The following Microsoft Entra concepts are relevant to the security of a [Power BI tenant](powerbi-implementation-planning-tenant-setup.md):

- **User access**: Access to the Power BI service requires a user account (and a Power BI [license](../fundamentals/service-features-license-type.md): Free, Power BI Pro, or Premium Per User - PPU). You can add both internal users and guest users to Microsoft Entra ID, or they can be synchronized with an on-premises instance of Windows Active Directory. For more information about guest users, see [Strategy for external users](#strategy-for-external-users).
- **Security groups**: Microsoft Entra security groups are required when making certain features available in the [tenant settings](/fabric/admin/about-tenant-settings). You might also need groups to effectively secure Power BI workspace content or for distributing content. For more information, see [Strategy for using groups](#strategy-for-using-groups).
- **Conditional access policies**: You can set up conditional access to the Power BI service and the Power BI mobile app. Microsoft Entra [conditional access](/azure/active-directory/conditional-access/overview) can restrict authentication in various situations. For example, you could enforce policies that:

  - Require multifactor authentication for some or all users.
  - Allow only devices that comply with organizational policies.
  - Allow connectivity from a specific network or IP ranges.
  - Block connectivity from a non-domain-joined machine.
  - Block connectivity for a risky sign-on.
  - Allow only certain types of devices to connect.
  - Conditionally allow or deny access to Power BI for specific users.

- **Service principals**: You might need to create a Microsoft Entra [app registration](/azure/active-directory/develop/quickstart-register-app) to provision a service principal. Service principal authentication is a recommended practice when a Power BI administrator wants to run unattended, scheduled scripts that extract data by using the Power BI [admin APIs](/rest/api/power-bi/admin). Service principals are also useful when [embedding Power BI content](../developer/embedded/embed-service-principal.md) in a custom application.
- **Real-time policies**: You can choose to set up [real-time session control or access control policies](/fabric/governance/service-security-using-defender-for-cloud-apps-controls), which involves both Microsoft Entra ID and [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps). For example, you can prohibit the download of a report in the Power BI service when it has a specific sensitivity label. For more information, see the [information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) articles.

It might be challenging to find the right balance between unrestricted access and overly restrictive access, which can frustrate users. The best strategy is to work with your Microsoft Entra administrator to understand how access currently is set up. Try to remain responsive to the needs of the business while being mindful of necessary restrictions.

> [!TIP]
> Many organizations have an on-premises Active Directory (AD) environment that they synchronize with Microsoft Entra ID in the cloud. This setup is known as a [hybrid identity](/azure/active-directory/hybrid/whatis-hybrid-identity) solution, which is out of scope for this article. The important concept to understand is that users, groups, and service principals must exist in Microsoft Entra ID for cloud-based services like Power BI to work. Having a hybrid identity solution works for Power BI. We recommend talking to your Microsoft Entra administrators about the best solution for your organization.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you identify needs for Microsoft Entra integration, key decisions and actions include:

> [!div class="checklist"]
>
> - **Work with Microsoft Entra administrators**: Collaborate with your Microsoft Entra administrators to find out what existing Microsoft Entra policies are in place. Determine whether there are any policies (current or planned) that'll affect the user experience in the Power BI service and/or in the Power BI mobile applications.
> - **Decide when user access versus service principal should be used**: For automated operations, decide when to use a service principal instead of user access.
> - **Create or update user guidance**: Determine whether there are security topics that you'll need to document for the Power BI user community. That way, they'll know what to expect for using groups and conditional access policies.

## Strategy for external users

Power BI supports [Microsoft Entra Business-to-Business (B2B)](/azure/active-directory/external-identities/what-is-b2b). External users, for instance from a customer or partner company, can be invited as guest users in Microsoft Entra ID for collaboration purposes. External users can work with Power BI and many other Azure and Microsoft 365 services.

> [!IMPORTANT]
> To learn about strategies for handling external users, we recommend the [Microsoft Entra B2B white paper](whitepaper-azure-b2b-power-bi.md).
>
>This article is limited to describing only critical considerations that are relevant to planning.

It's ideal if an external user is from another organization that also has Microsoft Entra ID:

- **Home tenant manages the credentials**: The user's home tenant stays in control of their identity and management of credentials. You don't need to synchronize identities.
- **Home tenant manages the user's status**: When a user leaves that organization and the account is removed or disabled, the user immediately no longer has access to your Power BI content. It's a substantial advantage because you might not know when someone leaves their organization.
- **Flexibility for user licensing**: You have cost-effective [licensing options](whitepaper-azure-b2b-power-bi.md#licensing). An external user might already have a Power BI Pro or PPU license. In that scenario, you don't need to assign one to them. It's also possible to grant them access to content in a Premium capacity or a Fabric F64 or greater capacity workspace by assigning a Fabric (free) license to them.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

### Key settings

You have two options for enabling and managing how external user access works:

- [Microsoft Entra settings](whitepaper-azure-b2b-power-bi.md#additional-microsoft-entra-id-settings-that-affect-experiences-in-power-bi-related-to-microsoft-entra-b2b) that are managed by a Microsoft Entra administrator. These Microsoft Entra settings are a prerequisite.
- [Fabric tenant settings](/fabric/admin/service-admin-portal-export-sharing) that are managed by a Power BI administrator in the admin portal. These settings will control the user experience in the Power BI service.

### Guest invitation process

There are two ways to invite guest users to your tenant.

- **Planned invitations**: You can set up [external users](/azure/devops/organizations/accounts/add-external-user) ahead of time in Microsoft Entra ID. That way, the guest account is ready whenever a Power BI user needs to use it for assigning permissions (for example, app permissions). Although it requires some up-front planning, it's the most consistent process because all Power BI security capabilities are supported. An administrator can use [PowerShell](/azure/active-directory/external-identities/b2b-quickstart-invite-powershell) to efficiently add a large number of external users.
- **Ad hoc invitations**: A guest account can be automatically generated in Microsoft Entra ID at the time that a Power BI user shares or distributes content to an external user (who wasn't previously set up). This approach is useful when you don't know ahead of time who the external users will be. However, this capability must first be [enabled in Microsoft Entra ID](whitepaper-azure-b2b-power-bi.md#additional-microsoft-entra-id-settings-that-affect-experiences-in-power-bi-related-to-microsoft-entra-b2b). The ad hoc invitation approach works for [ad hoc per-item permissions](whitepaper-azure-b2b-power-bi.md#ad-hoc-per-item-sharing) and app permissions.

> [!TIP]
> Not every security option in the Power BI service supports triggering an ad hoc invitation. For this reason, there's an inconsistent user experience when assigning permissions (for example workspace security versus per-item permissions versus app permissions). Whenever possible, we recommend that you use the planned invitation approach because it results in a consistent user experience.

### Customer tenant ID

Every Microsoft Entra tenant has a globally unique identifier (GUID) known as the _tenant ID_. In Power BI, it's known as the _customer tenant ID (CTID)_. The CTID allows the Power BI service to locate content from the perspective of a different organizational tenant. You need to append the CTID to URLs when sharing content with an external user.

Here's an example of appending the CTID to a URL: `https://app.powerbi.com/Redirect?action=OpenApp&appId=abc123&ctid=def456`

When you need to provide the [CTID for your organization](powerbi-implementation-planning-tenant-setup.md#tenant-id-for-external-users) to an external user, you can find it in the Power BI service by opening the **About Power BI** dialog window. It's available from the **Help &amp; Support (?)** menu located at the top-right of the Power BI service. The CTID is appended to the end of the tenant URL.

:::image type="content" source="media/powerbi-implementation-planning-security-tenant-level-planning/determine-customer-tenant-id.png" alt-text="Screenshot of the About Power BI dialog window with the customer tenant ID highlighted." border="false":::

### Organizational branding

When external guest access happens frequently in your organization, it's a good idea to use [custom branding](/fabric/admin/service-admin-custom-branding). Custom branding helps users identify which organizational tenant they're accessing. Branding elements can include include a logo, cover image, and theme color.

The following screenshot shows what the Power BI service looks like from a guest account. It includes a _Guest content_ option, which is available when the CTID is appended to the URL.

:::image type="content" source="media/powerbi-implementation-planning-security-tenant-level-planning/organizational-branding.png" alt-text="Screenshot of the Power BI service with the Guest content option highlighted.":::

### External data sharing

Some organizations have a requirement to do more than share reports with external users. They intend to share semantic models with external users, such as partners, customers, or vendors.

The goal for [in-place semantic model sharing](../collaborate-share/service-dataset-external-org-share-about.md) (also known as _cross-tenant semantic model sharing_) is to allow external users to create their own customized reports and composite models by using data you create, manage, and provide. The original shared semantic model (created by you) remains in your Power BI tenant. The dependent reports and models are stored in the external user's Power BI tenant.

There are several security aspects for making in-place semantic model sharing work.

- **Tenant setting: _Allow guest users to work with shared semantic models in their own tenants_**: This setting specifies whether the external data sharing feature can be used. It needs to be enabled for either of the other two settings (shown next) to take effect. It's enabled or disabled for the entire organization by the Power BI administrator.
- **Tenant setting: _Allow specific users to turn on external data sharing_**: This setting specifies which groups of users can share data externally. The groups of users permitted here will be allowed to use the third setting (described next). This setting is managed by the Power BI administrator.
- **Semantic model setting: _External sharing_**: This setting specifies whether that specific semantic model can be used by external users. This setting is managed by content creators and owners for each specific semantic model.
- **Semantic model permission: _Read_ and _Build_**: The standard semantic model permissions to support content creators are still in place.

> [!IMPORTANT]
> The term _consumer_ usually is used to refer to view-only users who consume content that's produced by others in the organization. However, with in-place semantic model sharing, there's a _producer_ of the semantic model and a _consumer_ of the semantic model. In this situation, the consumer of the semantic model is usually a content creator in the other organization.

If row-level security is specified for your semantic model, it's honored for external users. For more information, see the _Enforce data security based on consumer identity_ section in the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity) article.

### External user subscriptions

It's most common for external users to be managed as guest users in Microsoft Entra ID, as previously described. In addition to this common approach, Power BI provides other capabilities for distributing report subscriptions to users outside the organization.

The Power BI tenant setting _Allow email subscriptions to be sent to external users_ specifies whether users are permitted to send email subscriptions to external users who aren't Microsoft Entra guest users. We recommend that you set this tenant setting to align with how strictly your organization manages external user accounts.

> [!TIP]
> Administrators can verify which external users are sent subscriptions by using the [Get Report Subscriptions as Admin API](/rest/api/power-bi/admin/reports-get-report-subscriptions-as-admin). The email address for the external user is shown. The principal type is _unresolved_ because the external user isn't set up in Microsoft Entra ID.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for how to handle external guest users, key decisions and actions include:

> [!div class="checklist"]
>
> - **Identify requirements for external users in Power BI**: Determine what use cases there are for external collaboration. Clarify the scenarios for using Power BI with Microsoft Entra B2B. Determine whether collaboration with external users is a common or rare occurrence.
> - **Determine the current Microsoft Entra settings**: Collaborate with your Microsoft Entra administrator to find out how external collaboration is currently set up. Determine what the impact will be on using B2B with Power BI.
> - **Decide how to invite external users**: Collaborate with your Microsoft Entra administrators to decide how guest accounts will be created in Microsoft Entra ID. Decide whether ad hoc invitations will be allowed. Decide to what extent the planned invitation approach will be used. Ensure that the entire process is understood and documented.
> - **Create and publish user guidance about external users**: Create documentation for your content creators that will guide them on how to share content with external users (particularly when the planned invitation process is required). Include information about limitations that external users will face if they intend to have external users edit and manage content. Publish this information to your centralized portal and training materials.
> - **Determine how to handle external data sharing**: Decide whether external data sharing should be allowed, and whether it's limited to a specific set of approved content creators. Set the _Allow guest users to work with shared semantic models in their own tenants_ tenant setting and the _Allow specific users to turn on external data sharing_ tenant setting to align with your decision. Provide information about external data sharing for your semantic model creators. Publish this information to your centralized portal and training materials.
> - **Determine how to handle Power BI licenses for external users**: If the guest user doesn't have an existing Power BI license, decide on the process to assign them a license. Ensure that the process is documented.
> - **Include your CTID in relevant user documentation**: Record the URL that appends the tenant ID (CTID) in user documentation. Include examples for creators and consumers on how to use URLs that append the CTID.
> - **Set up custom branding in Power BI**: In the admin portal, set up custom branding to help external users identify which organizational tenant they're accessing.
> - **Verify or update tenant settings**: Check how the tenant settings are currently set up in the Power BI service. Update them as necessary based on the decisions made for managing external user access.

## Strategy for file locations

There are different types of files that should be appropriately stored. So, it's important to help users understand expectations for where files and data should be located.

There can be risk associated with Power BI Desktop files and Excel workbooks because they can contain imported data. This data could include customer information, personal data, proprietary information, or data that's subject to regulatory or compliance requirements.

> [!TIP]
> It's easy to overlook the files that are stored outside of the Power BI service. We recommend that you consider them when you're planning for security.

Here are some of the types of files that might be involved in a Power BI implementation.

- **Source files**
  - **Power BI Desktop files**: The original files (.pbix) for content that's published to the Power BI service. When the file contains a data model, it might contain imported data.
  - **Excel workbooks**: Excel workbooks (.xlsx) might include connections to semantic models in the Power BI service. They might also contain exported data. They might even be original workbooks for content that's published to the Power BI service (as a workbook item in a workspace).
  - **Paginated report files**: The original report files (.rdl) files for content that's published to the Power BI service.
  - **Source data files**: Flat files (for example, .csv or .txt) or Excel workbooks that contain source data that's been imported into a Power BI model.
- **Exported and other files**
  - **Power BI Desktop files**: The .pbix files that have been downloaded from the Power BI service.
  - **PowerPoint and PDF files**: The PowerPoint presentations (.pptx) and PDF documents downloaded from the Power BI service.
  - **Excel and CSV files**: Data exported from reports in the Power BI service.
  - **Paginated report files**: The files exported from paginated reports in the Power BI service. Excel, PDF, and PowerPoint are supported. Other [export file formats](../consumer/end-user-paginated-report.md#export-the-paginated-report) exist for paginated reports as well, including Word, XML, or web archive. When you use the [export files to reports API](/rest/api/power-bi/reports/export-to-file-in-group), image formats are also supported.
  - **Email files**: Email images and attachments from subscriptions.

You need to make some decisions about where users can or can't store files. Typically, that process involves creating a governance policy that users can refer to. The locations for source files and exported files should be secured to ensure appropriate access by authorized users.

Here are some recommendations for working with files.

- **Store files in a shared library**: Use a Teams site, a SharePoint library, or a OneDrive for work or school shared library. Avoid using personal libraries and drives. Ensure that the storage location is backed up. Also ensure that the storage location has versioning enabled so that it's possible to roll back to a previous version.
- **Use the Power BI service as much as possible**: Whenever possible, use the Power BI service for sharing and distribution of content. That way, there's full auditing of access always. Storing and sharing files on a file system should be reserved for the small number of users who are collaborating on content.
- **Don't use email**: Discourage the use of email for sharing files. When someone emails an Excel workbook or a Power BI Desktop file to 10 users, it results in 10 copies of the file. There's always the risk of including an incorrect (internal or external) email address. Also, there's a greater risk that a recipient will forward the file to someone else. (To minimize this risk, work with your Exchange Online administrator to implement [rules to block attachments](/exchange/security-and-compliance/mail-flow-rules/inspect-message-attachments) based on conditions of size or type of file extension. Other data loss prevention strategies for Power BI are described in the [information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) articles.)
- **Use template files**: Occasionally, there's a legitimate need to share a Power BI Desktop file with someone else. In this case, consider creating and sharing a [Power BI Desktop template (.pbit) file](../create-reports/desktop-templates.md). A template file only contains metadata, so it's smaller in size than the source file. This technique requires the recipient to input data source credentials to refresh the model data.

There are [tenant settings](/fabric/admin/service-admin-portal-export-sharing) in the admin portal that control which export formats users are permitted to use when exporting from the Power BI service. It's important to review and set these settings. It's a complementary activity to planning for the file locations that should be used for the exported files.

> [!TIP]
> Certain export formats support end-to-end information protection by using encryption. Due to regulatory requirements, some organizations have a valid need to restrict which export formats users can use. The [Information protection for Power BI](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) article describes factors to consider when deciding which export formats to enable or disable in the tenant settings. In most cases, we recommend that you restrict exporting capabilities only when you must meet specific regulatory requirements. You can use the [Power BI activity log](../enterprise/service-admin-auditing.md) to identify which users are performing many exports. You can then teach these users about more efficient and secure alternatives.

:::image type="icon" source="media/common/checklist.svg" border="false":::

When you plan file locations, key decisions and actions include:

> [!div class="checklist"]
>
> - **Identify where files should be located**: Decide where files should be stored. Determine whether there are specific locations where files shouldn't be stored.
> - **Create and publish documentation about file locations**: Create user documentation that identifies responsibilities for managing and securing files. It should also describe any locations where files should or shouldn't be stored. Publish this information in your centralized portal and in training materials.
> - **Set the tenant settings for exports**: Review and set each tenant setting related to export formats to support.

## Strategy for using groups

We recommend that you use Microsoft Entra [security groups](/azure/active-directory/fundamentals/how-to-manage-groups) to secure Power BI content for the following reasons.

- **Reduced maintenance**: You can modify security group membership without modifying the permissions for the Power BI content. You can add new users to a group and remove users from a group.
- **Improved accuracy**: Because group membership changes are made once, you get more accurate permission assignments. If an error is detected, you can more easily correct it.
- **Delegation**: You can delegate the responsibility of managing group membership to the [group owner](/azure/active-directory/fundamentals/how-to-manage-groups#add-or-remove-members-and-owners).

### High-level group decisions

In this process, you make strategic decisions about how groups are used.

#### Permission to create and manage groups

You make two key decisions about creating and managing groups:

- **Who's allowed to create a group?** Commonly, only IT can create security groups. However, you can add users to the built-in _[Groups administrator](/azure/active-directory/roles/permissions-reference#groups-administrator)_ Microsoft Entra role. That way, certain trusted users, like Power BI champions or satellite members of your COE, can create groups for their business units.
- **Who's allowed to manage members of a group?** It's common that IT manages group membership. But you can specify one or more _[group owners](/azure/active-directory/fundamentals/how-to-manage-groups#add-or-remove-members-and-owners)_, who are permitted to add and remove group members. Using _[self-service group management](/azure/active-directory/enterprise-users/groups-self-service-management)_ is helpful when a decentralized team or satellite members of the COE are permitted to manage the membership of Power BI-specific groups.

> [!TIP]
> Allowing [self-service group management](/azure/active-directory/enterprise-users/groups-self-service-management) and specifying decentralized [group owners](/azure/active-directory/fundamentals/how-to-manage-groups#add-or-remove-members-and-owners) are great ways to balance efficiency and speed with governance.

### Planning for Power BI groups

It's important that you create a high-level strategy for how to use groups for securing Power BI content and many other uses.

#### Use cases for groups

Consider the following use cases for groups:

| Use case | Description | Example group name |
|---|---|---|
| **Communicating with the Power BI Center of Excellence (COE)** | Includes all users associated with the COE, including all core and satellite members of the COE. Depending on your needs, you might also create a separate group for only the core members. It's likely to be a Microsoft 365 group that's correlated with a Teams site. | &bull;&nbsp;Power BI Center of Excellence  |
| **Communicating with the Power BI leadership team** | Includes the executive sponsor and representatives from business units who collaborate on leading the Power BI initiative in the organization. | &bull;&nbsp;Power BI steering committee |
| **Communicating with the Power BI user community** | Includes all users who are assigned any type of Power BI user license. It's useful for making announcements to all Power BI users in your organization. It's likely to be a Microsoft 365 group that's correlated with a Teams site. | &bull;&nbsp;Power BI community |
| **Supporting the Power BI user community** | Includes help desk users who directly interact with the user community to handle Power BI support issues. This email address (and Teams site, if applicable) is available and visible to the user population. | &bull;&nbsp;Power BI user support |
| **Provide escalated support** | Includes specific users, usually from the Power BI COE, who provide escalated support. This email address (and Teams site, if applicable) is typically private, for use only by the user support team. | &bull;&nbsp;Power BI escalated user support |
| **Administer the Power BI service** | Includes specific users who are allowed to administer the Power BI service. Optionally, members of this group can be correlated to the role in Microsoft 365 to simplify management. | &bull;&nbsp;Power BI administrators |
| **Notify allowed features and gradual roll outs of features** | Includes users allowed for a specific tenant setting in the admin portal (if you choose to limit the feature) or if the feature is to be rolled out gradually to groups of users. Many of the tenant settings require you to create a new Power BI-specific group. | &bull;&nbsp;Power BI workspace creators <br/><br/>&bull;&nbsp;Power BI external data sharing |
| **Manage data gateways** | Includes one or more groups of users who are allowed to administer a gateway cluster. There might be several groups of this type when there are multiple gateways or when decentralized teams manage gateways. | &bull;&nbsp;Power BI gateway administrators <br/><br/>&bull;&nbsp;Power BI gateway data source creators <br/><br/>&bull;&nbsp;Power BI gateway data source owners <br/><br/>&bull;&nbsp;Power BI gateway data source users |
| **Manage Premium capacities** | Includes users allowed to manage a Premium capacity. There might be several groups of this type when there are multiple capacities or when decentralized teams manage capacities. | &bull;&nbsp;Power BI capacity contributors |
| **Securing workspaces, apps, and items** | Many groups that are based on subject areas and allowed access for managing security of Power BI workspace roles, app permissions, and per-item permissions. | &bull;&nbsp;Power BI workspace administrators <br/><br/>&bull;&nbsp;Power BI workspace members <br/><br/>&bull;&nbsp;Power BI workspace contributors <br/><br/>&bull;&nbsp;Power BI workspace viewers <br/><br/>&bull;&nbsp;Power BI app viewers |
| **Deploy content** | Includes the users that can deploy content by using a Power BI [deployment pipeline](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines). Use this group in connection with workspace permissions. | &bull;&nbsp;Power BI deployment pipeline administrators |
| **Automating administrative operations** | Includes the service principals that are allowed to use Power BI APIs for embedding or administrative purposes. | &bull;&nbsp;Power BI service principals |

#### Groups for Fabric tenant settings

Depending on the internal processes you have in place, you might need other groups. Some groups help you manage tenant settings.

Here are some examples of how you can use other groups::

- **Power BI workspace creators**: Limit who can create workspaces via the _Create workspaces_ tenant setting.
- **Power BI certification subject matter experts**: Specify who's permitted to use the certified endorsement for content via the _Certification_ tenant setting.
- **Power BI approved content creators**: Useful when you require approval, training, a policy acknowledgment to install Power BI Desktop, or a Power BI Pro or PPU license. It's used by tenant settings that encourage content creation capabilities, such as _Allow DirectQuery connections to Power BI semantic models_, _Push apps to end users_, _Allow XMLA endpoints_, and others.
- **Power BI external tool users**: Useful when you allow the use of external tools for a selective group of users. It's used by group policy, or when software installations or requests must be carefully controlled.
- **Power BI custom developers**: Useful when you need to control who's permitted to embed content in other applications outside of Power BI. It's used to set up the _Embed content in apps_ tenant setting.
- **Power BI public publishing**: Useful when you need to limit who can publish data publicly. It's used to set up the _Publish to web_ tenant setting.
- **Power BI share to entire organization**: Useful when you need to restrict who can share a link with everyone in the organization. It's used to set up the _Allow shareable links to grant access to everyone in your organization_ tenant setting.
- **Power BI external data sharing**: Useful when you need to allow certain users to share semantic models with external users. It's used to set up the _Allow specific users to turn on external data sharing_ tenant setting.
- **Power BI guest user access licensed**: Useful when you need to group approved external users who are granted a license by your organization. It's used to set up the _Allow Microsoft Entra guest users access to Power BI_ tenant setting.
- **Power BI guest user access BYOL**: Useful when you need to group approved external users who bring their own license (BYOL) from their home organization. It's used to set up the _Allow Microsoft Entra guest users access to Power BI_ tenant setting.

> [!TIP]
> For considerations about using groups when planning for workspace access, see the [Workspace-level planning](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-access) article. For information about planning for securing workspaces, apps, and items, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md) article.

### Type of group

You can create different [types of groups](/microsoft-365/community/all-about-groups).

- **Security group**: A security group is the best choice when your primary goal is to grant access to a resource.
- **Mail-enabled security group**: When you need to grant access to a resource and distribute messages to the entire group by email, a mail-enabled security group is a good choice.
- **Microsoft 365 group**: This type of group has a Teams site and an email address. It's the best choice when the primary goal is communication or collaboration in a Teams site. A Microsoft 365 group only has members and owners; there isn't a viewer role. For this reason, its primary purpose is collaboration. This type of group was formerly known as an Office 365 group, modern group, or unified group.
- **Distribution group**: You can use a distribution group to send a broadcast notification to a list of users. Today, it's considered to be a legacy concept that provides backwards compatibility. For new use cases, we recommend that you create a mail-enabled security group instead.

When you request a new group, or you intend to use an existing group, it's important to be aware of its type. The type of group can determine how it's used and managed.

- **Power BI permissions**: Not every type of group is supported for every type of security operation. Security groups (including mail-enabled security groups) offer the highest coverage when it comes to setting Power BI security options. Microsoft documentation generally recommends Microsoft 365 groups. But in Power BI, they aren't as capable as security groups. For more information about Power BI permissions, see the later articles in [this series on security planning](powerbi-implementation-planning-security-overview.md).
- **Fabric tenant settings**: You can only use security groups (including mail-enabled security groups) when allowing or disallowing groups of users to work with [tenant settings](/fabric/admin/about-tenant-settings).
- **Advanced Microsoft Entra features**: Certain types of advanced features aren't supported for all group types. For example, Microsoft 365 groups don't support nesting of groups within a group. Although some group types support dynamic group membership based on user attributes in Microsoft Entra ID, groups that use dynamic membership aren't supported for Power BI.
- **Managed differently**: Your request to create or manage a group might be routed to a different administrator based on the type of group (mail-enabled security groups and distribution groups are managed in Exchange). Therefore, your internal process will differ depending on the type of group.

### Group naming convention

It's likely that you'll end up with many groups in Microsoft Entra ID to support your Power BI implementation. Therefore, it's important to have an agreed-upon pattern for how groups are named. A good naming convention will help to determine the purpose of the group and make it simpler to manage.

Consider using the following standard naming convention: *&lt;Prefix&gt; &lt;Purpose&gt; - &lt;Topic/Scope/Department&gt; &lt;\[Environment\]&gt;*

The following list describes each part of the naming convention.

- **Prefix**: Used to group all Power BI groups together. When the group will be used for more than one analytical tool, your prefix might be just BI, rather than Power BI. In that case, the text that describes the purpose will be more generic so that it relates to more than one analytical tool.
- **Purpose**: The purpose will vary. It could be for a workspace role, app permissions, item-level permissions, row-level security, or other purpose. Sometimes multiple purposes can be satisfied with a single group.
- **Topic/Scope/Department**: Used to clarify who the group applies to. It will often describe the group membership. It can also refer to who manages the group. Sometimes a single group can be used for multiple purposes. For example, a collection of finance workspaces could be managed with a single group.
- **Environment**: Optional. Useful to differentiate between development, test, and production.

Here are some example group names that apply the standard naming convention.

- Power BI workspace admins - Finance \[Dev\]
- Power BI workspace members - Finance \[Dev\]
- Power BI workspace contributors - Finance \[Dev\]
- Power BI workspace viewers - Finance \[Dev\]
- Power BI app viewers - Finance
- Power BI gateway administrators - Enterprise BI
- Power BI gateway administrators - Finance

### Decisions per group

When you plan the groups you need, you must make several key decisions.

When a content creator or owner requests a new group, ideally they use a form to provide the following information.

- **Name and purpose**: A suggested group name and its intended purpose. Consider including _Power BI_ (or just _BI_ when you have multiple BI tools) in the group name to clearly indicate the scope of the group.
- **Email address**: An email address when communication is also required for the group members. Not all types of groups need to be mail-enabled.
- **Type of group**: Options include security group, mail-enabled security group, Microsoft 365 group, and distribution group.
- **Group owner**: Who's allowed to own and manage the members of the group.
- **Group membership**: The intended users who will be members of the group. Consider whether external users and internal users can be added, or whether there's a justification for putting external users into a different group.
- **Use of just-in-time group member assignment**: You can use [Privileged Identity Management (PIM)](/azure/active-directory/privileged-identity-management/pim-configure) to allow time-boxed, just-in-time, access to a group. This service can be helpful when users require temporary access. PIM is also helpful for Power BI administrators who need occasional access.

> [!TIP]
> Existing groups that are based on the organizational chart don't always work well for Power BI purposes. Use existing groups when they meet your needs. However, be prepared to create Power BI-specific groups when the need arises.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist**:  When you create your strategy for how to use groups, consider these key decisions and actions to take:

> [!div class="checklist"]
>
> - **Choose a strategy to use for groups**: Determine your use cases and purposes for groups. Be specific about when to apply security by using user accounts versus when a group is required or preferred.
> - **Create a naming convention for Power BI-specific groups**: For groups you create, ensure that you use a consistent naming convention that support Power BI communication, features, administration, or security.
> - **Decide who can create groups**: Clarify whether IT must create all groups. Can some individuals, like satellite members of the COE, be granted permissions to create groups for their own business units?
> - **Create a process for new group requests**: Create a form for a user to request the creation of a new group. Ensure that a process is in place to respond quickly to requests. Consider that if requests to create new groups are delayed, users might be tempted to bypass the process and start assigning permissions to individual accounts.
> - **Decide when decentralized group management is allowed**: For groups that apply to a specific team, decide when it's acceptable for a group owner (outside of IT) to manage members in the group.
> - **Decide whether to use just-in-time group membership**: Determine whether Privileged Identity Management is useful in your scenario. If it is, determine which groups, such as the Power BI administrator group, you can use it for.
> - **Review current groups**: Determine which existing groups you can use and which groups you need to create.
> - **Review each tenant setting**: For each tenant setting, determine whether to allow it or disallow it for a specific set of users. Determine whether you need to create a new group for the tenant setting.
> - **Create and publish groups guidance for users**: Include documentation for content creators that includes requirements, or preferences, for using groups. Ensure that they know what to ask for when they request a new group. Publish this information to your centralized portal and training materials.

## Related content

In the [next article in this series](powerbi-implementation-planning-security-report-consumer-planning.md), learn about ways to securely deliver content to read-only report consumers.
