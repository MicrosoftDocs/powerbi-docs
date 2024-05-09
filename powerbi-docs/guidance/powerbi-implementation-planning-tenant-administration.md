---
title: "Power BI implementation planning: Tenant administration"
description: "This article introduces key considerations for administering a Fabric tenant."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 02/13/2024
---

# Power BI implementation planning: Tenant administration

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces key considerations for administering a Fabric tenant. This article is targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization.
- **IT and system administrators:** Other administrators who collaborate with Fabric administrators to oversee and integrate systems within the organization.
- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI and supporting Power BI users in the organization. These teams make key decisions and collaborate with the Fabric administrators.

Managing the Power BI service is one key aspect of _system oversight_. For more information, see [System oversight](fabric-adoption-roadmap-system-oversight.md). The routine activities associated with system oversight are commonly known as _system administration_. System administration activities are critical to help ensure that content consumers and content creators consistently have a good experience with Power BI.

As described in the Fabric adoption [maturity levels](fabric-adoption-roadmap-maturity-levels.md) article, organizational adoption refers to the effectiveness of governance and data management practices to support and enable [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) and [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md). Therefore, administrators who manage analytics and BI platforms can have a sizeable and direct influence on the success of your analytics adoption efforts.

> [!NOTE]
> Administering Fabric [capacity](/fabric/enterprise/licenses#microsoft-fabric-concepts) (or Premium capacity) and managing the Power BI service are different concepts. While most organizations have just one [Power BI tenant](powerbi-implementation-planning-tenant-setup.md), an organization can provision multiple capacities for different workloads or business units.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Define scope of responsibilities

There's no single definition of the Fabric administrator role, meaning that the role and routine responsibilities of a Fabric administrator can vary between different organizations. What shouldn't vary is that the role can—and should—evolve over time as organizational priorities and goals change.

From a strategic perspective, a Fabric administrator should focus on:

- **Governance:** Enacting governance guidelines and policies to support enterprise BI and managed self-service BI.
- **User empowerment:** Facilitating and supporting the internal processes and systems that empower the internal user community to the extent possible, while adhering to organizational regulations and requirements.
- **Adoption:** Allowing for broader organizational [adoption of Fabric](fabric-adoption-roadmap.md#microsoft-fabric-adoption) with effective governance and data management practices.

Attempting to balance governance, user empowerment, and adoption goals inherently leads to competing priorities. Ideally, it leads to productive debates about priorities. Clarifying and communicating your expectations for various roles and responsibilities can help to avoid unacceptable levels of friction and conflict.

Consider the following three examples of Fabric administrators.

- **High focus on user enablement:** Riley is a Fabric administrator who works for a large global organization that's made significant investments in [managed self-service BI](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service). To enable self-service BI capabilities for users throughout the organization, Riley spends much time coordinating decisions and actions with the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) and [other administrators](#collaborate-with-other-administrators). When needed, Riley steps in to support existing BI solutions.
- **High focus on governance and compliance:** Parker is a Fabric administrator who works for a highly regulated organization. In this organization, most BI development is handled by BI developers within a centralized [enterprise BI](fabric-adoption-roadmap-content-ownership-and-management.md#enterprise) team. Parker's administrative responsibilities are primarily focused on areas such as [auditing](powerbi-implementation-planning-auditing-monitoring-overview.md), [information protection](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md), and [security](powerbi-implementation-planning-security-overview.md).
- **High involvement in content creation:** Morgan is a Fabric administrator who works for a small organization that's just getting started building its [data culture](fabric-adoption-roadmap-data-culture.md). Presently, the organization has only a few content creators. In addition to system oversight responsibilities, Morgan is a BI developer who regularly creates and publishes content. Sometimes, Morgan gets involved in a [co-development project](fabric-adoption-roadmap-mentoring-and-user-enablement.md#co-development-projects) to mentor a colleague, which helps grow BI expertise in the organization.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning the scope of responsibilities, key decisions and actions include:

> [!div class="checklist"]
> - **Decide on strategic focus:** Determine what the strategic focus for your Fabric administrators should be. Get clarity on goals and priorities to use when decisions (and trade-offs) need to be made.
> - **Identify specific roles and responsibilities:** Determine what the specific expectations are for your Fabric administrators. Clearly document their roles and responsibilities, and update job descriptions with Human Resources when appropriate.

## Appoint administrators

The actions of a Fabric administrator have significant impact on the user experience, [data culture](fabric-adoption-roadmap-data-culture.md) efforts, [governance](fabric-adoption-roadmap-governance.md) efforts, who [owns and manages content](fabric-adoption-roadmap-content-ownership-and-management.md), and [organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels) efforts. So, it's critical that you appoint the right people to administrator roles.

Here are some key points to consider when you select your administrators.

- **Remain conscious of the highly privileged nature of the role**. An administrator role is a high-privilege role because it's authorized to manage a wide array of tenant settings, workspace access, personal workspace access, and it can view all tenant metadata. For more information, see [Power BI administration](powerbi-implementation-planning-security-tenant-level-planning.md#power-bi-administration).
- **Carefully select who's well-suited to be an administrator.** An administrator often needs to collaborate with users and the COE. For this reason, they should understand business intelligence concepts and what users want to accomplish. Someone who has an overbearing personality or who has the tendency to strictly limit what users are permitted to do probably isn't well-suited to managing a self-service BI platform.
- **Choose 2 to 4 administrators.** Because it's a high-privilege role, appoint only a few administrators. Strike the right balance: Having too many administrators increases the risk of unapproved changes occurring, while having too few administrators increases the risk that the system won't be sufficiently supported.
- **Allow for occasional administrators.** If you have users who _occasionally_ need Fabric administrator rights, consider implementing [Privileged Identity Management](/azure/active-directory/privileged-identity-management/pim-configure) (PIM). PIM lets you assign _just-in-time role permissions_ that expire after a few hours. This process provides a useful way to balance risk (of having too many full-time administrators) versus usability (allowing progress to occur). That's especially true in larger, decentralized organizations. When using PIM, delegation of the administrator role is logged and can optionally involve an approval workflow to grant rights.
- **Make Fabric administration a priority.** Often, administration of a BI platform is just one of many responsibilities. Consider how you'll ensure that users are well supported, and your system is sufficiently managed.
- **Regularly review who's assigned to all the related roles.** There are three roles that are permitted to manage the Power BI service: Fabric administrator, Power Platform administrator, and Global administrator. It's important that you audit the membership of these roles regularly.

For more information, see [About admin roles in the Microsoft 365 admin center](/microsoft-365/admin/add-users/about-admin-roles).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When appointing administrators, key decisions and actions include:

> [!div class="checklist"]
> - **Identify current Fabric administrators:** Review who's currently assigned to the role of Fabric administrator. Also consider the Power Platform administrator and Global administrator roles in this review.
> - **Appoint Fabric administrators:** To reduce risk, appoint 2 to 4 people to the Fabric administrator role. If there are currently more than four people assigned, reduce the number of people assigned to the Fabric administrator role.
> - **Use PIM for occasional administrators:** Identify whether you have people who legitimately, but occasionally, need Fabric administrator rights. Implement PIM to assign just-in-time role permissions that expire after a few hours. Document and communicate how the process works, which could include an approval workflow.
> - **Assign backups and conduct cross-training:** Check the status of cross-training and documentation that's in place for handling Fabric administration responsibilities. Ensure that a backup person is trained so that priority user needs can be met in a timely and consistent way.
> - **Regularly audit administrators:** Verify who's assigned to the Fabric administrator role on a regular basis.

## Collaborate with other administrators

Although the Fabric administrator is a high-privilege role, it's limited to managing Fabric. Therefore, at times you'll need to collaborate with other administrators.

Here are some common reasons why a Fabric administrator collaborates with [other system administrators](/power-bi/admin/service-admin-administering-power-bi-in-your-organization#administrator-roles-related-to-power-bi).

- **Device setup and installations:** You might need to work with IT, an infrastructure team, or a desktop support team in order to install, update, or manage [user devices](powerbi-implementation-planning-user-tools-devices.md).
- **Subscriptions and license purchasing:** The Billing admin role in Microsoft 365 is required to manage subscriptions and purchase licenses. A billing administrator might also be responsible for cost analysis and management. For more information about centralized and decentralized (self-service) ways to manage licenses, see [User licenses](fabric-adoption-roadmap-system-oversight.md#user-licenses).
- **License assignment and user management:** The License admin role in Microsoft 365 is required to assign licenses (that have been purchased) to specific users. The User admin role is required to manage the properties of a user. It's helpful to work with a user administrator when you're planning to implement automation based on user properties (for example, automatic license assignment or automatic group assignment). For more information, see [Commonly used Microsoft 365 admin center roles](/microsoft-365/admin/add-users/about-admin-roles#commonly-used-microsoft-365-admin-center-roles).
- **Microsoft Entra administrators:** There are [various reasons](powerbi-implementation-planning-tenant-setup.md#microsoft-entra-administrators) why you need to work with Microsoft Entra ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)) administrators. Often, reasons include the need to set up or manage users, groups, and service principals. For more information, see [Tenant-level security planning](powerbi-implementation-planning-security-tenant-level-planning.md).
- **Source data access:** You might have to work with a system administrator or database administrator in order to get access to data on behalf of [content creators](powerbi-implementation-planning-security-content-creator-planning.md#creating-new-content). Sometimes, it might also be necessary to request access on behalf of content consumers when semantic models—[previously known as datasets](/power-bi/connect-data/service-datasets-rename)—[enforce data security based on the identity](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity) of content consumers.
- **Data loss prevention and data classification:** You might need to collaborate with your [Microsoft Purview](/training/modules/manage-power-bi-artifacts-use-microsoft-purview/) administrator for governance and information protection.
- **Teams integration:** When integrating Power BI with [Microsoft Teams](/power-bi/collaborate-share/service-collaborate-microsoft-teams), you might need to collaborate with a Teams administrator.
- **OneDrive and SharePoint integration:** When integrating Power BI with [OneDrive or SharePoint](/power-bi/create-reports/desktop-sharepoint-save-share), you might need to collaborate with other administrators.
- **Workspace administration:** You might need to collaborate with a [Fabric workspace administrator](/power-bi/collaborate-share/service-roles-new-workspaces#workspace-roles) to plan, organize, or secure content within specific workspaces.
- **Lifecycle management:** When deploying and managing changes to content, you might need to collaborate with a [deployment pipeline administrator](/fabric/cicd/deployment-pipelines/understand-the-deployment-process#permissions) or an [Azure DevOps administrator](/fabric/cicd/git-integration/git-integration-process#permissions).
- **Premium capacity management:** You might need to collaborate with a capacity administrator when [managing a Premium capacity](/power-bi/enterprise/service-admin-premium-manage).
- **Data gateway management:** You might need to collaborate with a [gateway administrator](/data-integration/gateway/manage-security-roles#gateway-roles) to manage and secure an on-premises data gateway. For more information, see [Manage gateways](powerbi-implementation-planning-data-gateways.md#manage-gateways).
- **Power Platform administration:** You might need to integrate solutions between Power BI and other Power Platform apps (such as Power Automate or Power Apps).
- **Azure administration:** You might need to work with an Azure administrator to set up, access, and secure other [Azure services](/power-bi/connect-data/service-azure-and-power-bi) that you want to integrate with Power BI.
- **Security administration and auditing:** Your organization could have specific compliance, security, or privacy requirements. In this case, you might need to collaborate with your security team to identify and mitigate risks.
- **Networking:** When connecting to different data sources and systems, you might need to work with your [network administrators](/fabric/admin/service-admin-portal-advanced-networking) for performance and security reasons.
- **Mobile device administration:** You might need to collaborate with an Intune administrator in order to [manage mobile device](/power-bi/enterprise/service-admin-mobile-intune) policies and security.

> [!IMPORTANT]
> A Fabric administrator shouldn't make decisions or take action (such as changing [tenant settings](#govern-tenant-settings)) on their own. All key decisions should be discussed, planned, and documented. In addition to collaborating with other administrators, be sure to fully involve the [COE](fabric-adoption-roadmap-center-of-excellence.md) and your [BI strategy working team](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#step-1-assemble-a-working-team). It might also be appropriate to involve your [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md) for strategic decisions.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When collaborating with other administrators, key decisions and actions include:

> [!div class="checklist"]
> - **Determine who will manage device setup and installations:** Make sure you know who manages devices for your organization. Get familiar with their processes and requirements. Be prepared to work with them as needed.
> - **Identify who will manage subscriptions and licenses:** Make sure you know who manages subscriptions and licenses for your organization. Get familiar with their processes and requirements. Be prepared to work with them as needed.
> - **Identify who will assign licenses and manage users, groups, and service principals:** Make sure you know who manages users, groups, and service principals for your organization. Get familiar with their processes and requirements. Be prepared to work with them as needed.
> - **Determine any other administrators to consult:** As you work through your implementation planning process, identify other relevant administrators. Invite them to pertinent meetings and involve them in relevant decision-making processes. Update documentation and processes as needed.

## Govern the Power BI service

Governing and managing the Power BI service is one of the key responsibilities of a Fabric administrator. This section describes how to govern and manage many common settings and features in the Fabric admin portal.

- [Tenant settings](#govern-tenant-settings)
- [Domains](#govern-domains)
- [Workspaces](#govern-workspaces)
- [Embed codes](#govern-embed-codes)
- [Organizational visuals](#govern-organizational-visuals)
- [Azure connections](#govern-azure-connections)

### Govern tenant settings

[Tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings) are the main way to control which Power BI features and capabilities are enabled, and for which users in your organization. Managing tenant settings is one of the most important responsibilities for a Fabric administrator.

Because content creators and content consumers can easily learn about available features and capabilities in Power BI (from documentation), it can result in frustration when they can't do something they expect. It can also lead to user dissatisfaction and less effective [organizational adoption, user adoption, and solution adoption](fabric-adoption-roadmap-maturity-levels.md).

Here are some common questions that confused and frustrated users ask.

- Why can't I create a workspace?
- Why can't I export data?
- Why doesn't my custom visual work?
- Why can't I certify a semantic model?
- Why can't I assign a sensitivity label?
- Why can't I push an app to specific end users?

> [!IMPORTANT]
> Each tenant setting should align with the [governance](fabric-adoption-roadmap-governance.md) guidelines and policies in your organization. When a Fabric administrator decides on their own to enable or disable settings, it's usually a clear indicator that you need to improve and refine your governance processes.

The remainder of this section describes the following process to manage tenant settings.

1. [Review tenant settings](#step-1-review-tenant-settings)
1. [Decide on tenant settings](#step-2-decide-on-tenant-settings)
1. [Update tenant settings](#step-3-update-tenant-settings)
1. [Document tenant settings](#step-4-document-tenant-settings)
1. [Manage tenant settings](#step-5-manage-tenant-settings)
1. [Audit tenant settings](#step-6-audit-tenant-settings)

#### Step 1: Review tenant settings

It's important that you review each tenant setting to clearly understand the current state of your tenant. While you should review all tenant settings, you might prioritize specific critical settings to review first based on a risk assessment.

Here are some factors to consider during the review process.

- **Setting:** Is the specific tenant setting currently enabled or disabled?
- **Permissions:** Is the specific tenant setting applicable to the entire organization? Or is it available, or denied, to specific [security groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups)?

> [!NOTE]
> Some tenant settings are enabled by default, while others are disabled by default.

You can compile the current state of your tenant settings in one of two ways.

- View the tenant setting state within the [admin portal](/power-bi/admin/service-admin-portal).
- Programmatically extract the tenant setting state by using the [Get Tenant Settings](/rest/api/fabric/admin/tenants/get-tenant-settings) REST API.

The following table presents how you could record the current state of your tenant settings.

| **Date last reviewed** | **Tenant setting** | **Current value** | **Security groups allowed** | **Security groups not allowed** | **Tenant setting delegated to other admins** |
| --- | --- | --- | --- | --- | --- |
| Oct 15, 2023 | Create workspaces | Enabled for specific security groups | Power BI workspace creators, Power BI administrators, Power BI COE, Power BI support | N/A | N/A |
| Oct 15, 2023 | Export to Excel | Enabled for entire organization except specific security groups | N/A | Sales Team-Europe | N/A |
| Nov 1, 2023 | Use semantic models across workspaces | Enabled for entire organization | N/A | N/A | N/A |
| Nov 1, 2023 | Certification | Enabled for specific security groups | Power BI certification SMEs | N/A | Domain admins can enable / disable |
| Nov 5, 2023 | Allow specific users to turn on external data sharing | Enabled for specific security groups | Power BI external data sharing | N/A | N/A |

For other considerations about security groups, see [Planning for Power BI groups](powerbi-implementation-planning-security-tenant-level-planning.md#planning-for-power-bi-groups).

For more information about allowable tenant setting states, see [How to use the tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings#how-to-use-the-tenant-settings).

> [!CAUTION]
> Sometimes when an administrator monitors the tenant, they discover a situation that isn't ideal. For example, they might see too many data exports in the [user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#user-activity-data). In this instance, the administrator might be tempted to disable the related tenant setting. However, before disabling a feature entirely, it's important to first understand why users are relying on certain techniques. That's because prohibiting features can lead to user frustration which can tempt users to create workarounds. Consider instead that a solution might need to be redesigned, or perhaps further user education and training could mitigate concerns.

#### Step 2: Decide on tenant settings

After you've reviewed your current tenant settings, it's time to examine the decision-making process. For each tenant setting, use workshops to actively discuss and determine which features and capabilities should be allowed or disallowed, and for which users.

Remember that every tenant setting represents a governance decision. Therefore, expect to collaborate with others to arrive at the right decision. Depending on your circumstance, the decision-making process could involve collaborating with the [COE](fabric-adoption-roadmap-center-of-excellence.md), [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md), security team, BI team, or others (such as stakeholders or [champions](fabric-adoption-roadmap-community-of-practice.md#champions-network)).

> [!TIP]
> One of the biggest challenges is deciding what to do when you encounter inconsistencies between an existing tenant setting versus your goals and purposeful decisions. Be prepared to resolve these conflicts when you encounter them.

Here are some factors to consider during the decision-making process.

- **What governance decisions already exist?** When possible, refer to existing decisions you've made. Always aim to be consistent and efficient. Also, you need to be aware of internal or external compliance requirements. Where applicable, tenant settings should align with broader governance policies. For example, there might be a current [governance policy](fabric-adoption-roadmap-governance.md#governance-policies) that specifies when, who, and how data can be shared outside of the organization.
- **Who makes new governance decisions?** When you need to make a decision about a tenant setting, involve all relevant parties in the conversation. Usually, Fabric administrators alone aren't in the best position to make decisions about tenant settings. For information about assembling a working team and running workshops, see [BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md).
- **Is the decision temporary?** Sometimes, a tenant setting is set for a short period of time only. Usually that's done to allow the COE, BI, and IT teams time to become familiar with a new feature before it's released more broadly throughout the organization. That way, you can verify alignment with governance guidelines, and the user community will be well supported.
- **Will different business units or teams be handled differently?** In larger organizations, a single approach rarely works. To accommodate the needs and skills of different teams, sometimes you might need to set up tenant settings differently for different audiences. Always aim to allow capable teams to operate with as much flexibility as possible, within your governance guidelines.
- **Is there an approval process?** Depending on the specific subject, approval might be required. That's especially true when a tenant setting relates to security or compliance.
- **What's the schedule to re-review each decision?** Schedule a review of each tenant setting decision regularly. Twice a year is a good schedule for this purpose.

The following table presents how you might record your decisions.

| **Date of decision** | **Decision made** | **Decision makers involved** | **Decision approved by** | **Tenant setting affected** | **Pending action** |
| --- | --- | --- | --- | --- | --- |
| Oct 15, 2023 | The COE will train approved content creators on best practices for creating and managing workspaces. Approved creators can be from any business unit. | COE and stakeholders | Ellis Turner (executive sponsor) and Taylor Phillips (COE lead) | Create workspaces | Review existing members of the _Power BI workspace creators_ group |
| Oct 15, 2023 | Export to Excel will be permitted. The COE will track the action in the activity log and contact users who overuse it. A temporary limitation for the Sales Team-Europe exists due to an issue currently under investigation. | COE and security | Ellis Turner (executive sponsor) and Jessie Irwin (Chief Technology Officer) | Export to Excel | Follow up on Europe issue in 60 days |
| Nov 1, 2023 | We strongly encourage the use of shared semantic models to encourage data reuse, minimize data silos, and reduce data duplication. | COE | Ellis Turner (executive sponsor) | Use semantic models across workspaces | N/A |
| Nov 1, 2023 | The COE will train approved content creators on the process and requirements for certifying reports and data assets. Approved creators can be from any business unit. | COE and stakeholders | Ellis Turner (executive sponsor) and Taylor Phillips (COE lead) | Certification | Review existing members of the _Power BI certification SMEs_ group |
| Nov 5, 2023 | The organization's data sharing policy covers how data can be shared outside of the organization. All users are required to review and acknowledge this policy annually. Training from the COE will help users to comply while working in Power BI. | COE, security, and compliance | Jessie Irwin (Chief Technology Officer) | Allow specific users to turn on external data sharing | Review existing members of the _Power BI external data sharing_ group |

Consider including other contextual information that explains why a decision was made. Also, include links to the location of existing related documents or policies.

> [!NOTE]
> The examples presented in the table intentionally demonstrate how to balance user empowerment, compliance, and internal requirements. For additional considerations, see [Governance](fabric-adoption-roadmap-governance.md).

#### Step 3: Update tenant settings

Now that your existing tenant settings and purposeful decisions are available, you're ready to update your tenant settings.

Considerations during the update process include:

- **Who will handle the update**? If you have several Fabric administrators, it's ideal that one or two Fabric administrators be primarily responsible for updating the tenant settings. The goal is to ensure the process is consistent, well-understood, and well-controlled.
- **What testing process is in place**? Depending on the tenant setting, there might be other effects when it's changed. Conduct testing before making widespread changes. For an example, see [Control the use of semantic models across workspaces](/power-bi/connect-data/service-datasets-admin-across-workspaces).
- **Is there a change management process**? Consider how to avoid discrepancies between decisions, documentation, and the resulting updates. Communication between teams is a key success factor in change management. Depending on your auditing requirements, you might choose to maintain an internal change log to track who made what change, when, and why (to record more detail beyond what's captured in the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data)).
- **How will communication with users be handled?** When making a change that affects what users are able to do, be sure to [communicate](fabric-adoption-roadmap-community-of-practice.md#communication-plan) the change. Always aim to avoid user frustration and unnecessary support requests.

#### Step 4: Document tenant settings

At this point, make sure you have a repeatable method in place for documenting the tenant setting values. For a simplified example, see the table in Step 1 above, which is about reviewing tenant settings.

Here are some aspects to consider for documentation.

- **Extract snapshot data:** When documenting tenant setting values, we recommend that you create a new point-in-time snapshot regularly. For this purpose, creating a snapshot once a week is a good frequency. Use the [Get Tenant Settings](/rest/api/fabric/admin/tenants/get-tenant-settings) REST API to automate the process.
- **Provide admin access to snapshot data:** Administrators, the COE, and internal auditors should have access to all the snapshot data. To identify any tenant settings that have changed, compare two snapshots (for example, this week compared with last week). Data from the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data) complements the snapshot data to provide a complete understanding of what's changed, when, and by whom. For more information, see Step 6 below, which is about auditing tenant settings.
- **Provide a summary of current settings to users:** The tenant setting values are one type of [documentation](fabric-adoption-roadmap-mentoring-and-user-enablement.md#documentation) that can be made available to your community of users in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal). It's a helpful reference for a user who, for example, doesn't understand why a feature isn't available to them. The documentation can also help users know which security group to request to join should they want to use a feature. To reduce the level of manual effort, the latest snapshot results from the REST API can be distributed to users as a Power BI report. Depending on your needs, you might need to merge the snapshot of data with other data that's manually maintained (such as the description of the tenant setting, justification for the setting, links to additional information, or link to a form to request access).

> [!NOTE]
> As previously described in Step 2, you'll also have documentation related to the decision-making process. Typically, that type of documentation is available only to the COE and administrators (rather than all Power BI users). For a simplified example, see Step 2.

#### Step 5: Manage tenant settings

The tenant settings need attention on an ongoing basis. Here are some aspects to consider.

- **New tenant settings:** How will you know when a new tenant setting is available? Since Fabric is a cloud service that continues to evolve, you can expect new tenant settings will be introduced regularly. One way to become aware of new tenant settings is to view the [message(s)](/power-bi/admin/service-admin-portal-about-tenant-settings#new-tenant-settings) announced at the top of the tenant settings page in the admin portal. Another way is to compare the data you extract from the current snapshot with the previous snapshot (described previously in Step 4).
- **Changes to existing tenant settings:** How will you know when the behavior of an existing tenant setting has changed? Tenant setting changes are usually announced in the [Power BI blog](https://powerbi.microsoft.com/blog/) or the [Fabric blog](https://blog.fabric.microsoft.com/). Be sure to follow these blogs to become aware of any notifications.
- **Ongoing user requests:** How will you manage user requests? For example, a user who wants to [certify](/power-bi/collaborate-share/service-endorse-content) content knows to submit a request to become a member of a specific security group that allows it. That's an effective workflow made possible by publishing documentation of your tenant settings for users to reference (as described in Step 4 above). You might choose to use a form for gathering these types of requests. Or you could route requests through your [help desk](fabric-adoption-roadmap-user-support.md#help-desk-support).
- **New security groups:** If a tenant setting is to be limited to specific security groups, does a suitable security group already exist? Or does a new security group need to be created? How will you coordinate getting a new security group created when necessary? For more information, see [Strategy for using groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups).

#### Step 6: Audit tenant settings

Lastly, it's important to have a process for regularly auditing tenant settings. Here are some actions to identify when you audit the tenant settings.

- **A tenant setting has changed:** Look for changed values in the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data) by using the _UpdatedAdminFeatureSwitch_ activity. This activity only indicates that something has been updated (whether it's enabled or disabled, or different security groups have been assigned). For an understanding of what's changed, you'll need to compare the current snapshot with the previous snapshot (described previously in Step 4).
- **A new tenant setting has been introduced:** Look for the [message(s)](/power-bi/admin/service-admin-portal-about-tenant-settings#new-tenant-settings) in the admin portal, or compare the data you extract from the current snapshot with the previous snapshot (described previously in Step 4).
- **A group membership has changed:** In some situations, it might not be enough to know which security group is assigned. You might need to determine the security group membership, which can comprise individual users and service principals. You can source group membership data by using Microsoft Graph. For more information, see [Users and groups data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#users-and-groups-data).

Also, you might want to receive alert notifications when a tenant setting has updated. You can use the audit log alerting capabilities from [Microsoft 365](/purview/alert-policies) or [Microsoft Defender for Cloud Apps](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md#defender-for-cloud-apps-for-power-bi) to be notified when a tenant setting has changed, and by whom, by using the _UpdatedAdminFeatureSwitch_ audit log event. For more information about enabling alerts, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#enable-alerting).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When planning and managing tenant settings, key decisions and actions include:

> [!div class="checklist"]
> - **Conduct a review of all current tenant settings:** Determine the current state by reviewing all the tenant settings. Identify which security groups are assigned to each setting.
> - **Identify existing policies and decisions:** Compile existing governance policies or previous decisions so they're readily available.
> - **Discuss and decide:** Schedule workshops to consider and determine what should be allowed or disallowed, and for which users. Ensure all decisions are aligned with data culture objectives, governance guidelines, and internal policies. Be sure to involve all relevant decision makers and stakeholders for each topic. Obtain additional approval when appropriate.
> - **Create a schedule to re-review decisions:** Set up a schedule to re-review decisions and tenant settings on a regular basis (such as twice a year).
> - **Make updates:** Update the tenant settings based on the decisions made in the workshops.
> - **Extract snapshot data with the API:** Use the _Get Tenant Settings_ REST API to make the process more efficient, potentially automating the creation of snapshots on a scheduled basis.
> - **Create documentation for users:** Create documentation of your tenant settings for your community of users. Publish the documentation to your centralized portal. Include the security groups to which a user must belong to access a feature or capability.
> - **Create a process to handle user requests:** Set up a process for how users can request access to a feature or capability.
> - **Set up a process for routine management of tenant settings:** Create a schedule so that you can identify new tenant settings as soon as possible.
> - **Set up auditing:** Create an auditing process so you can track when a tenant setting has changed, and by whom.

### Govern domains

[Domains](/fabric/governance/domains) are used in Fabric to group together two or more workspaces that have similar characteristics. For example, you might create a domain to group all your sales workspaces together, and another domain for your finance workspaces. A domain represents a single management boundary. Usage of domains can also facilitate workspace ownership and management responsibilities that are distributed across the organization.

For more information about planning for domains, see [Workspace domains](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-domains).

> [!TIP]
> The Fabric domains described in this section are a different concept from [domains in Microsoft 365](/microsoft-365/admin/setup/add-domain).

#### Step 1: Review domains

The first step is to review the existing domains and tenant environment so you can understand the current state. Here are some factors to consider during the review process.

- **Domains:** Which domains, if any, exist? Does the name and description of each domain clearly indicate its purpose?
- **Permissions:** Who are the domain administrators for each domain? Who are the domain contributors for each domain? Do all assigned administrators and contributors align with the intended purpose of the domain?
- **Workspaces assigned:** Which workspaces are assigned to each domain? Do all assigned workspaces align with the intended purpose of the domain?
- **Delegated tenant settings:** Which tenant settings have been delegated to a domain administrator (or a capacity administrator) so they can [override](/fabric/governance/domains#override-tenant-level-settings) the default setting?

#### Step 2: Decide on domains

After you've reviewed your domains, it's time to examine the decision-making process.

For existing workspaces, consider how they can be grouped together to form a single management boundary. For more information and ways that you can organize related workspaces, see [Workspace domains](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-domains).

Here are some factors to consider during the decision-making process.

- **What governance decisions already exist?** When possible, refer to existing decisions. Aim for workspace and domain setup that's consistent and efficient.
- **How decentralized is the ownership and management of content?** Consider how [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) currently happens throughout the organization. Sometimes decentralized approaches are referred to as a _distributed_, _federated_, or as a _data mesh_ architecture. Factor in that information when analyzing needs for organizing workspaces into domains.
- **What domain groupings will work well?** There are many ways to group workspaces into a single management boundary. For example, you might choose to organize domains by subject area, team, business unit, or project. Keep in mind that a workspace can only be assigned to one domain. For more information, see [Workspace domains](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-domains).
- **Who should be permitted to administer each domain?** Ideally, [domain administrators](/fabric/governance/domains#domain-roles) are users who directly own and manage the content for the domain. Also, domain administrators should be familiar with internal, regional, and governmental regulations for the subject area. They should also be familiar with all internal governance and security requirements.
- **Who will be allowed to assign workspaces to a domain?** The [domain contributor(s)](/fabric/governance/domains#domain-roles) role includes users who are permitted to assign a workspace to a domain. Domain contributors must also be a workspace administrator to assign the workspace to the domain. Consider how much control you want to delegate to self-service users in your organization.
- **Will different domains be handled differently?** In larger organizations, some domains might have different policies. Be prepared to adapt your decisions based on the needs and skills of different teams. For more information, see [Override tenant-level settings](/fabric/governance/domains#override-tenant-level-settings).

#### Step 3: Update domains

At this point, your existing domain settings and purposeful decisions are available. You're now ready to add, change, or remove domains (if necessary).

Be sure to follow existing change management practices, and to inform all users who will be impacted by any changes.

#### Step 4: Document domains

Depending on how many domains you have, you might create documentation to augment the information that's available in the admin portal. Your documentation could include:

- More context or detail, such as the purpose for the domain, and why a separate domain is useful.
- Who approved the domain, and when.
- Who the domain owner or steward is—if it's different from the domain administrator(s) set in the admin portal.
- Any other compliance or regulatory requirements related to the domain.

#### Step 5: Manage domains

Domains should be reviewed in the [admin portal](/fabric/governance/domains) regularly. Quarterly, or twice a year, should work well for this purpose.

Also, consider how you'll manage requests from users who want to create a new domain, change an existing domain, or add workspaces to a domain.

#### Step 6: Audit domains

You should have a process to regularly audit domains and their settings. Here are some actions to identify when you audit domains by using the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

- **A new domain has been created:** Look for the _InsertDataDomainAsAdmin_ activity.
- **An existing domain has changed:** Look for the _UpdateDataDomainAsAdmin_ activity.
- **A workspace has been assigned to a domain:** Look for the _UpdateDataDomainFoldersRelationsAsAdmin_ activity.
- **The domain administrators or domain contributors have changed:** Look for the _UpdateDataDomainAccessAsAdmin_ activity.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning and managing domains, key decisions and actions include:

> [!div class="checklist"]
> - **Review current domains:** Determine the current state by reviewing all domains in the admin portal.
> - **Discuss and decide:** Determine what domain groupings will work best to meet your needs. Involve the relevant decision makers and stakeholders when considering how to manage domains.
> - **Verify whether approval is required:** Determine whether a process should exist to obtain approval from others when creating a new domain.
> - **Create a schedule to re-review:** Set up a schedule to re-review domains on a regular basis.
> - **Make updates:** Update domains when new needs arise.
> - **Create documentation:** If you need to record other information, create documentation for your domains.
> - **Create a process to handle user requests:** Set up a process for how users can request a new domain.
> - **Set up auditing:** Create an auditing process so you can track when new domains are created, or when changes occur.

### Govern workspaces

[Workspaces](/fabric/get-started/workspaces) are a fundamental concept in Fabric. Workspaces serve as containers for storing and securing content. Primarily, workspaces are designed for content creation, collaboration, and content distribution.

The [workspaces page](/power-bi/admin/service-admin-portal-workspaces) in the admin portal allows Fabric administrators to review and manage all workspaces in the tenant.

Here are several reasons why a Fabric administrator might get involved with managing workspaces.

- **Get access to a standard workspace.** A Fabric administrator might need to assist with a situation (such as a data refresh failure) when the primary owner of the content is, for example, away on vacation. In that case, they'll need to assign themselves to a workspace role.
- **Get temporary access to a personal workspace.** It's possible for a Fabric administrator to get access to the [personal workspace](/power-bi/admin/service-admin-portal-workspaces#govern-my-workspaces) of another user, but only for 24 hours. Temporary access to a personal workspace is helpful when the workspace owner has left the organization or is away on vacation.
- **Manage workspace roles.** A Fabric administrator has permission to manage workspace roles for all workspaces in the tenant. That's helpful when a centralized team manages workspace access. It's also helpful when the workspace is in an orphaned state (indicating there's no workspace administrator) which can happen as a result of employment terminations or transfers.
- **Reassign a workspace.** To unlock other features, sometimes the workspace [license mode](/fabric/enterprise/licenses#workspace) for a workspace needs to be updated. For example, a Fabric administrator can change a workspace from **Pro** or **Premium per user (PPU)** to a capacity.
- **Determine the type of workspace.** A Fabric administrator can review the [SKU tier](/power-bi/enterprise/service-admin-premium-manage) that a workspace is assigned to. For example, the administrator can quickly determine that there are four workspaces in the tenant currently assigned to PPU.
- **Locate and/or recover deleted workspaces.** The [workspace state](/power-bi/admin/service-admin-portal-workspaces#workspace-states) can indicate that a workspace has been deleted. For a brief period, a Fabric administrator can restore a workspace if it was deleted in error. Or, they can [restore a deleted personal workspace](/power-bi/admin/service-admin-portal-workspaces#restore-a-deleted-my-workspace-as-an-app-workspace) as a standard workspace. For more information, see [Workspace retention](/fabric/admin/portal-workspaces#workspace-retention).
- **Update workspace name.** A Fabric administrator can rename a workspace, perhaps because its name doesn't conform to the established [naming convention](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-naming-conventions).

> [!NOTE]
> The level of involvement in managing workspaces depends on the roles and responsibilities assigned to a Fabric administrator. Your strategy for [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) can also influence the extent to which a Fabric administrator gets involved with workspace management.

#### Step 1: Review workspaces

The first step is to review the existing workspaces and tenant environment so you can understand the current state. Here are some factors to consider during the review process.

- **Current workspaces:** Review all workspaces that currently exist. You should also review the role assignments and settings of each workspace to ensure they're appropriate.
- **Current tenant setting:** Review the current setup of the _Create workspaces_ tenant setting.

There are two ways you can compile a list of current workspaces.

- View the list of workspaces in the [admin portal](/power-bi/admin/service-admin-portal-workspaces). The list can be exported to a CSV file.
- Programmatically extract a [tenant inventory](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-tenant-inventory-data) by using an [admin API](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#choose-a-user-api-or-admin-api) by using:
  - The _metadata scanning_ APIs (also known as the _scanner APIs_). This set of APIs allows you to locate changed workspaces asynchronously. Because it's able to extract incrementally changed workspaces, it's best suited to larger organizations with a large number of workspaces. For more information, see [Metadata scanning APIs](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#metadata-scanning-apis).
  - The _Get Groups As Admin_ REST API or the _Get-PowerBIWorkspace_ PowerShell cmdlet. These methods return data for all workspaces in the tenant, so they're best suited to smaller organizations with lower data volumes. For more information, see [Groups API or workspaces cmdlet](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#groups-apis-or-workspaces-cmdlet).

#### Step 2: Decide on workspaces

After you've reviewed your workspaces, it's time to examine the decision-making process.

Here are some factors to consider during the decision-making process.

- **What governance decisions already exist?** When possible, refer to existing [workspace governance](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-governance-level) decisions. Aim for the workspace setup to be consistent and efficient.
- **Who should be allowed to create workspaces?** Consider that [workspace creation permissions](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-creation-permissions) are a data culture and a governance decision.
- **Should there be a specific process for creating workspaces**? It's important to establish a [workspace creation process](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-creation-process) that's simple and convenient for users to follow.
- **How should workspaces be named?** Determine whether a [workspace naming convention](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-naming-conventions) would benefit the organization.
- **How are workspaces organized?** It's often useful to [organize workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-organization) by subject and scope. The approach for organizing content into workspaces might vary between departments.
- **How much content is contained in personal workspaces?** Consider what the [appropriate use of personal workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md#appropriate-use-of-personal-workspaces) is within your organization.
- **Who should have access to workspaces**? You should primarily limit [workspace access](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-access) to users who create and manage content. For more information, see [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md).

For further considerations, see [Tenant-level workspace planning](powerbi-implementation-planning-workspaces-tenant-level-planning.md) and [Workspace-level workspace planning](powerbi-implementation-planning-workspaces-workspace-level-planning.md).

#### Step 3: Update workspaces

At this point, your existing workspaces and purposeful decisions are available. If you found workspaces to be renamed or reorganized, you're now ready to make any necessary adjustments.

Considerations during the update process include:

- **Who will handle the update**? If you have several Fabric administrators, determine whether workspaces are managed by one or two specific administrators. Ensure the process is consistent, well understood, and well controlled.
- **Is there a change management process?** Consider how to avoid discrepancies between decisions, documentation, and the resulting updates. Communication between teams is a key success factor in change management. Depending on your auditing requirements, you might choose to maintain an internal change log to track who made what change, when, and why (to record more detail beyond what's captured in the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data)).
- **How will communication with users be handled?** When making a change that affects what users are able to do, be sure to [communicate](fabric-adoption-roadmap-community-of-practice.md#communication-plan) the change. Always aim to avoid user frustration and unnecessary support requests.

#### Step 4: Document workspaces

Depending on how many workspaces you have, you might create documentation to augment the information that's available from the admin portal or the REST APIs. This type of documentation is a key part of a [tenant inventory](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#tenant-inventory). Your documentation could include:

- More context or detail, such as the intended purpose for the workspace (if it's not already mentioned in the workspace description).
- Who approved the workspace, and when.
- Who's assigned as the workspace owner, if the owner is different from the workspace administrator(s).
- Compliance or regulatory requirements related to the content stored in the workspace.
- Whether the workspace contains especially sensitive information.
- Governance requirements for the workspace.
- Lifecycle management processes applicable to the workspace.

#### Step 5: Manage workspaces

Managing workspaces on an ongoing basis primarily involves:

- Creating new workspaces.
- Updating workspace metadata (such as name or description).
- Updating workspace roles.
- Recovering deleted workspaces.
- Reassigning a workspace (for example, from Pro to PPU).
- Managing the _Create workspaces_ tenant setting.

Depending on roles and responsibilities, secondary administrator activities might include:

- Publishing content (such as a semantic model or report) to a workspace.
- Troubleshooting issues related to existing workspace content.

> [!IMPORTANT]
> The Fabric administrator role is a high-privilege role that can perform many [high-level functions](powerbi-implementation-planning-security-tenant-level-planning.md#power-bi-administration). Notably, the role doesn't automatically grant access to all data in the tenant. However, because administrators have rights to manage workspaces in the tenant, they can grant access (via workspace roles) to other users including themselves.

#### Step 6: Audit workspaces

You should have a process to regularly audit workspaces. Here are some actions to identify when you audit workspaces by using the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

- **The _Create workspaces_ tenant setting has changed:** Look for changed tenant setting values in the activity log by using the _UpdatedAdminFeatureSwitch_ activity. The item name will be _CreateAppWorkspaces_.
- **A Fabric administrator has obtained access to a user's personal workspace:** Look for the _AddAdminPersonalWorkspaceAccess_ activity. The workspace name will be in the format of _PersonalWorkspace-NameOfUser_. No activity is logged when the system automatically revokes access, which happens after 24 hours.
- **A new workspace has been created:** Look for the _CreateFolder_ activity.
- **An existing workspace has changed:** Look for the _UpdateFolder_ activity.
- **Access for a workspace has changed:** Look for the _UpdateWorkspaceAccess_ activity or the _UpdateFolderAccess_ activity.
- **A workspace has been reassigned:** Look for the _MigrateWorkspaceIntoCapacity_ activity.
- **A workspace has been assigned to a domain:** Look for the _UpdateDataDomainFoldersRelationsAsAdmin_ activity.

> [!TIP]
> In addition to using the activity log, we recommend that you regularly create a tenant inventory. It's a snapshot, as of a point in time, which describes all workspaces and their content (such as semantic models and reports). It can also capture details about workspace access. For more information, see [Tenant inventory](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#tenant-inventory) and [Access to tenant inventory data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-tenant-inventory-data).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning and managing workspaces, key decisions and actions include:

> [!div class="checklist"]
> - **Review current workspaces:** Determine the current state by reviewing all workspaces and related tenant setting in the admin portal.
> - **Discuss and decide:** Determine how to govern and manage workspaces. Involve the relevant decision makers and stakeholders when deciding who's permitted to manage workspaces.
> - **Verify whether approval is required:** Determine whether a process should exist to obtain approval from others when creating a new workspace.
> - **Create a schedule to re-review:** Set up a schedule to re-review workspaces on a regular basis.
> - **Make updates:** Update workspaces, including role assignments, when new needs arise.
> - **Create documentation:** If you need to track supplementary information, create documentation for your workspaces.
> - **Create a process to handle user requests:** Set up a process for how users can request a new workspace.
> - **Set up auditing:** Create an auditing process so you can track when new workspaces are created, or when changes occur.

### Govern embed codes

When you use the [Publish to web](/power-bi/collaborate-share/service-publish-to-web) feature, Power BI generates an _embed code_. An embed code is used to embed a report in a web page that's available on the internet to anyone. This capability is available for specific purposes: It's intended primarily for data journalism or reports containing public data that can be viewed by an anonymous audience, without requiring authentication.

Regularly reviewing and [managing embed codes](/power-bi/admin/service-admin-portal-embed-codes) is a key responsibility of the Fabric administrator. It's an especially critical responsibility because it involves verifying reports that have been published publicly on the internet.

> [!CAUTION]
> Some administrators mistakenly believe that an internal application or intranet site is a safe location to embed a Publish to web report. We strongly discourage using this technique in this way because reports published via _Publish to web_—regardless of where you embed them—can be discovered with a search engine. The appropriate practice to embed Power BI content for internal audiences is to use the [API embedding](/power-bi/developer/embedded/embed-sample-for-your-organization) functionality, or to use the [no-code embed](/power-bi/collaborate-share/service-embed-secure) technique. For more information, see the [embed for your organization](powerbi-implementation-planning-usage-scenario-embed-for-your-organization.md) usage scenario.

#### Step 1: Review embed codes

The first step is to review the existing embed codes and tenant environment so you can understand the current state. Here are some factors to consider during the review process.

- **Current embed codes:** Review each embed code, across all workspaces, in the [admin portal](/power-bi/admin/service-admin-portal-embed-codes). Make note of each [embed code status](/power-bi/collaborate-share/service-publish-to-web#understanding-the-embed-code-status-column) (such as active or blocked).
- **Current tenant setting:** Review the current setup of the [_Publish to Web_ tenant setting](/fabric/admin/service-admin-portal-export-sharing#publish-to-web).

#### Step 2: Decide on embed codes

After you've reviewed your embed codes, it's time to examine the decision-making process. Involve relevant decision makers and stakeholders in discussions about what content, if any, can be published to the web.

Also determine which users are allowed to publish reports to the web. When a governance policy or security policy exists, refer to it whenever possible.

> [!IMPORTANT]
> We strongly recommend that you enable the _Publish to Web_ tenant setting for a very limited set of users. Due to the high risk of accidentally publishing reports that contain sensitive data, consider disallowing or restricting content creators from publishing to web.

#### Step 3: Update embed codes

At this point, your existing embed codes and purposeful decisions are available. You're now ready to make temporary or permanent changes to the existing embed codes.

To determine what updates are necessary, you might need to do some further research.

- Review all reports that have active embed codes to confirm that there's no inappropriate information being published to the web. Also verify that underlying semantic models don't contain confidential or proprietary information.
- Contact the user who published the report to clarify its purpose.
- Work with the content owner to relocate the content, if necessary, to a non-personal workspace that's well suited to the purpose. Consider using a workspace that clearly indicates it contains publicly available content. For example, a _Finance Reporting \[Public\]_ workspace name clearly indicates its purpose.
- Review the [sensitivity label](powerbi-implementation-planning-info-protection.md) that's assigned to the content. Verify that the sensitivity label indicates that the target audience is a public audience.

#### Step 4: Document embed codes

Depending on your circumstances, you might create some documentation to complement the information that's available in the admin portal. Your documentation could include:

- More context and detail, such as purpose, intended audience, and justification.
- Who approved the content to be published publicly, and when.
- Who the content owner is—if it's different from the user who published it.

#### Step 5: Manage embed codes

Embed codes should be monitored in the [admin portal](/power-bi/admin/service-admin-portal-embed-codes) regularly. Also, consider how you'll manage requests from users who want to publish their reports to the web.

> [!NOTE]
> Not all reports are [supported](/power-bi/collaborate-share/service-publish-to-web#considerations-and-limitations) for use with Publish to web. It's possible that users will have [support](fabric-adoption-roadmap-user-support.md) questions related to using the feature.

#### Step 6: Audit embed codes

It's important to have a process to audit embed codes regularly. Here are some actions to identify when you audit embed codes by using the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

- **A new embed code has been created:** Look for the _PublishToWebReport_ activity.
- **The _Publish to Web_ tenant setting has changed:** Look for changed tenant setting values in the activity log by using the _UpdatedAdminFeatureSwitch_ activity. The item name will be _PublishToWeb_.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning and managing embed codes, key decisions and actions include:

> [!div class="checklist"]
> - **Review current embed codes:** Determine the current state by reviewing all embed codes in the admin portal.
> - **Review current tenant setting:** Review the setup of the _Publish to Web_ tenant setting.
> - **Discuss and decide:** Determine what content, if any, can be published publicly and by which users. Involve the relevant decision makers and stakeholders when appropriate. Refer to existing governance policies when possible.
> - **Verify whether approval is required:** Determine whether a process should exist to obtain approval from others when publishing a report to the web.
> - **Create a schedule to re-review:** Set up a schedule to re-review embed codes on a regular basis.
> - **Make updates:** Update the current embed codes as needed. Update the _Publish to Web_ tenant setting based on the decisions made (if they differ from what's currently published).
> - **Create documentation:** If you need to track supplementary information, create documentation of your embed codes.
> - **Create a process to handle user requests:** Set up a process for how users can request publishing their report to the web, or having permission to publish their own reports to the web.
> - **Set up auditing:** Create an auditing process so you can track when a new embed code is created, and when the _Publish to Web_ tenant setting has changed.

### Govern organizational visuals

Power BI report creators can use several types of visuals in their Power BI report design.

- **Core visuals:** The default, out-of-the-box visuals, which are built into Power BI Desktop and the Power BI service.
- **Non-certified custom visuals from AppSource:** Custom visuals that are developed by third-party software vendors or members of the worldwide Power BI community.
- **Certified custom visuals from AppSource:** Custom visuals that are developed by third-party software vendors or members of the worldwide Power BI community, and that have passed a [certification process](/power-bi/developer/visuals/power-bi-custom-visuals-faq#what-tests-are-done-during-the-certification-process-) defined by Microsoft.

An organization might choose to limit the use of custom visuals (when the report is published to the Power BI service) by registering which specific visuals (and versions) are allowed. Allowed visuals are known as _[organizational visuals](/power-bi/developer/visuals/power-bi-custom-visuals#organizational-store)_.

Fabric administrators are responsible for registering and managing organizational visuals in the admin center. They can register:

- Both certified and non-certified visuals from AppSource. Registering a specific visual is especially useful when the [block uncertified (or all) visuals](/fabric/admin/service-admin-portal-power-bi-visuals) tenant setting is enabled, yet a specific visual has been validated and approved for use in your organization.
- Proprietary [visuals developed internally](/power-bi/developer/visuals/develop-power-bi-visuals).
- Custom visuals purchased directly from a vendor.

There are many advantages to registering organizational visuals.

- Some, or all, custom visuals will be automatically available in the visualizations pane for all report creators.
- Content creators don't have to import Power BI visual (.pbiviz) files.
- The version of the custom visuals is consistent for all reports.
- Reports and dashboards will be automatically updated when an organizational visual is updated.
- New and changed custom visuals can be methodically tested and pre-approved before becoming widely available to the organization.
- If an existing custom visual no longer meets the organization's requirements, it can be quickly disabled or deleted.

For more considerations about distributing custom visuals on user devices (for use in Power BI Desktop), see [Custom visuals](powerbi-implementation-planning-user-tools-devices.md#custom-visuals).

The remainder of this section focuses on managing organizational visuals.

#### Step 1: Review organizational visuals

The first step is to review the existing organizational visuals and tenant environment so you can understand the current state.

- **Current organizational visuals:** Review what custom visuals have been added to the [organizational visuals repository](/power-bi/admin/organizational-visuals#organizational-visuals).
- **Current tenant setting:** Review the setup of [_Power BI visuals_ tenant setting](/fabric/admin/service-admin-portal-power-bi-visuals).

#### Step 2: Decide on organizational visuals

After you've reviewed your organizational visuals, it's time to examine the decision-making process. You should be prepared to make carefully considered decisions regarding how to govern custom visuals.

Here are some questions to consider during the decision-making process.

- **Are custom visuals permitted by the organization?** There are several reasons why an organization might choose to be intentional when relying on custom visuals.
  - The expectations for quality and stability will vary based on who developed the custom visual.
  - Freely available custom visuals might not have technical support.
  - For organizations with significant data privacy concerns—or that are extremely sensitive to data leakage concerns—the use of custom visuals might not be compatible with their risk profile. That's because custom visuals have access to data queried from semantic models. Also, it's possible that the custom visual could transmit data back to a web service (which is often for legitimate purposes, such as calling an API or running an AI algorithm).
- **How is a custom visual validated and approved for use?** All custom visuals should be tested and pre-approved for use in the organization. This validation process reduces the risk that untrustworthy visuals are used. It also allows the administrator to specify which version has been tested and approved for use.
- **Who is permitted to use custom visuals?** The _Allow visuals created using the Power BI SDK_ tenant setting controls who's permitted to add, share, or interact with a custom visual. If the organization has made decisions to restrict or limit this functionality (from AppSource or imported .pbiviz files), then you might depend on organizational visuals as the way to allow specific custom visuals.
- **Are certified visuals required?** If AppSource is permitted, some organizations prefer to restrict it to certified visuals only. That's done by setting up the _Add and use certified visuals only_ tenant setting. In this situation, you can use organizational visuals to distribute an uncertified visual that's been approved for use by the organization.
- **Should custom visuals be centrally managed?** When visuals are downloaded from AppSource by individual report creators, there can be issues with mismatched versions. By using the organizational visual repository to centrally manage custom visuals, it makes the process simpler for report creators because it allows all Power BI report creators within the tenant to use the same approved version. However, it does require the Fabric administrator to get involved, which could lead to delays.
- **What sources are allowed?** Organizational visuals can come from either AppSource or a .pbiviz file. AppSource is typically the best source, especially when you want to use a [certified visual](/power-bi/developer/visuals/power-bi-custom-visuals-certified). A .pbiviz file is appropriate when the visual has been obtained from a vendor privately, or when it has been developed internally.
- **When should the custom visual appear in the visualizations pane?** In many cases, it's appropriate to allow the custom visual to appear in the visualizations pane so that it's automatically available to all report creators.

#### Step 3: Update organizational visuals

At this point, your existing organizational visuals and purposeful decisions are available. You're now ready to make temporary or permanent changes to the existing organizational visuals.

You might also need to modify the tenant settings related to custom visuals (if report creators are permitted to download and install custom visuals that aren't in the organizational visuals repository).

> [!NOTE]
> The tenant settings related to custom visuals only apply to published reports, not to reports in Power BI Desktop. To ensure that report creators have consistent custom visual options in both the Power BI service and Power BI Desktop, you'll need to manage local machine customs visuals (for Power BI Desktop) with [Group Policy](/azure/active-directory-domain-services/manage-group-policy). For more information, see [User tools and devices](powerbi-implementation-planning-user-tools-devices.md#group-policy-settings).

#### Step 4: Document organizational visuals

Depending on your situation, you might create some documentation to complement the information that's available in the admin portal. Your documentation could include:

- More context and detail, such as what the custom visual accomplishes.
- Who created the custom visual (such as an internal developer or a vendor), or who to contact for more information.
- Tests that were performed to validate the visual, so that they can be repeated should the visual be updated.
- Who approved the use of the custom visual, and when.

#### Step 5: Manage organizational visuals

Organizational visuals should be monitored in the [admin portal](/power-bi/admin/organizational-visuals#organizational-visuals) regularly. Also, consider how you'll manage requests from users who want to use a new custom visual they find online.

Occasionally, you should also review when each custom visual was last updated. Investigate whether a newer version is available. When a newer version is available, you can update the organizational visual, provided it passes testing.

#### Step 6: Audit organizational visuals

It's important to have a process to audit organizational visuals regularly. Here are some actions to identify when you're auditing organizational visuals by using the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

- **A new organizational visual has been added:** Look for the _InsertOrganizationalGalleryItem_ activity.
- **An existing organizational visual has been updated:** Look for the _UpdateOrganizationalGalleryItem_ activity.
- **The _Allow visuals created using the Power BI SDK_ tenant setting has changed:** Look for changed tenant setting values in the activity log by using the _UpdatedAdminFeatureSwitch_ activity. The item name will be _CustomVisualsTenant_.
- **The _Add and use certified visuals only (block uncertified)_ tenant setting has changed:** Look for changed tenant setting values in the activity log by using the _UpdatedAdminFeatureSwitch_ activity. The item name will be _CertifiedCustomVisualsTenant_.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When planning and managing organizational visuals, key decisions and actions include:

> [!div class="checklist"]
> - **Review current organizational visuals:** Determine the current state by reviewing all organizational visuals in the admin portal.
> - **Review current tenant settings:** Review each of the _Power BI visuals_ tenant settings. Determine how they may influence your reliance on organizational visuals.
> - **Discuss and decide:** Determine how custom visuals should be used in the organization, and by whom. Involve the relevant decision makers and stakeholders when considering how to use organizational visuals, AppSource, and .pbiviz files.
> - **Create a schedule to re-review:** Set up a schedule to re-review organizational visuals on a regular basis.
> - **Make updates:** Update the current organizational visuals as needed. Update the _Power BI visuals_ tenant settings based on decisions made (if they differ from what's currently published).
> - **Manage user machines:** Set up Group Policy to ensure that custom visuals are managed the same way in Power BI Desktop as they are in the Power BI service.
> - **Create documentation:** If you need to track supplementary information, create documentation of your organizational visuals.
> - **Create a process to handle user requests:** Set up a process for how users can request the use of custom visuals (in general) or to request access to a specific custom visual.
> - **Set up auditing:** Create an auditing process so you can track when a new custom visual is registered as an organizational visual, and when any of the _Power BI visuals_ tenant settings have changed.

### Govern Azure connections

Power BI can integrate with Azure services to extend features and provide other functionality. There are three main reasons to use Azure connections.

- **Data storage for dataflows (Gen1).** You can access the data for Power BI dataflows (Gen1) directly in Azure. A workspace can be connected to a storage account that's defined at the tenant level, or to a storage account that's specific to the workspace. This technique is sometimes referred to as _bring-your-own-lake (BYOL)_. The flexibility of a BYOL strategy is helpful when you want to reuse dataflows data beyond Power BI by allowing other processes, or other users, to view or access the data. For more information, see [Configure dataflow storage to use Azure Data Lake Storage Gen2](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration) and the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) usage scenario.
- **Semantic model backup and restore.** You might need to back up and restore a semantic model for disaster recovery purposes, to meet data retention requirements, or to migrate a data model. For more information, see [Backup and restore semantic models with Power BI Premium](/power-bi/enterprise/service-premium-backup-restore-dataset).
- **Azure Log Analytics integration.** You can analyze semantic model activity, performance, and trends. Log Analytics integration allows you to review diagnostic data that's generated by the Analysis Services engine (which hosts Power BI semantic models). For more information, see [Dataset event logs](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#semantic-model-event-logs).

  > [!NOTE]
  > The [dataset name change](../connect-data/service-datasets-rename.md) has been rolled out in the Power BI service and in documentation, though there might be some instances—like with event log operations—where the change hasn't occurred yet.

If your main use case for using Azure connections is for data storage (BYOL described in the first point above), we recommend that you consider using [dataflows Gen2](/fabric/data-factory/dataflows-gen2-overview) and [OneLake](/fabric/onelake/onelake-overview) instead. Although both make use of ADLS Gen2 for data storage, they offer different capabilities, have slightly different purposes, and use different storage options (depending on how the data is written). For example: OneLake stores tabular data and dataflows Gen2 data in the open Delta Parquet format whereas the output from [Power BI dataflows (Gen1)](/power-bi/transform-model/dataflows/dataflows-azure-data-lake-storage-integration#reasons-to-use-the-adls-gen-2-workspace-or-tenant-connection) (with Azure connections) stores data in the common data model format. For more information, see [Getting from dataflow generation 1 to generation 2](/fabric/data-factory/dataflows-gen2-overview).

The remainder of this section focuses on governing Azure connections in the admin portal.

#### Step 1: Review Azure connections

The first step is to review the existing Azure connections and tenant environment so you can understand the current state. There are two areas to review.

First, review the existing settings in the admin portal.

- **Current tenant-level storage setting:** Review how [tenant-level storage](/power-bi/admin/service-admin-portal-azure-connections#tenant-level-storage) is currently set up. It provides a default Azure connection that workspace administrators can choose to connect to within their workspace settings.
- **Current workspace-level storage permissions:** Review whether [workspace-level storage permissions](/power-bi/admin/service-admin-portal-azure-connections#workspace-level-storage-permissions) is enabled. When enabled, workspace administrators are permitted to connect the workspace to their own ADLS Gen2 account.

Second, review the setup of the [_Azure Log Analytics connections for workspace administrators_ tenant setting](/fabric/admin/service-admin-portal-audit-usage#azure-log-analytics-connections-for-workspace-administrators). When enabled, it allows workspace administrators to connect a workspace to an ADLS Gen2 account for the purpose of sending diagnostic data for semantic models.

#### Step 2: Decide on Azure connections

After you've reviewed your Azure connections, it's time to examine the decision-making process.

Here are some questions to consider during the decision-making process.

- **Does the usage of Azure connections fit with your data strategy and user needs?** Consider whether Azure connections would be useful for the storage of dataflows (Gen1). Determine whether you have requirements to use the semantic model backup and restore functionality. Consider whether there are needs for Azure Log Analytics integration.
- **What data storage is centralized versus decentralized?** Understand the needs of your decentralized teams, and whether individuals or departments currently maintain their own Azure Storage accounts. Determine whether workspace administrators will be permitted to connect their own ADLS Gen2 account, or whether you prefer to use one ADLS Gen2 account for all workspaces (tenant-level storage).
- **How will OneLake be used versus Azure connections?** With the introduction of [OneLake](/fabric/onelake/onelake-overview), consider whether you might choose to gradually move to using OneLake for data storage (BYOL).

For more information, see [Workspace integration with ADLS Gen2](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-integration-with-adls-gen2).

For more information, see [Workspace integration with Azure Log Analytics](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-integration-with-azure-log-analytics).

#### Step 3: Update Azure connections

At this point, your existing Azure connections are available, and you've made purposeful decisions about whether you intend to integrate a data lake with Power BI. You're now ready to adjust the settings, if necessary, based on your findings.

#### Step 4: Document Azure connections

Depending on your situation, you should create some documentation to complement the information that's available in the admin portal. Your documentation might include:

- The tenant-level data lake location that's approved for usage. Include who owns and manages the data lake, and who to contact for more information.
- Whether workspace-level data lakes can be integrated. Other information, such as key decisions made and reasons why, should be documented for future reference.

#### Step 5: Manage Azure connections

Azure connections should be monitored in the [admin portal](/power-bi/admin/service-admin-portal-azure-connections) from time to time.

Consider how you'll support multiple ADLS Gen2 accounts in the organization (if workspace-level Azure connections are permitted).

Also, consider how you'll manage requests from users who want to connect a workspace to Azure Log Analytics.

#### Step 6: Audit Azure connections

It's important to have a process to audit Azure connections regularly. There are several actions to identify when you're auditing Azure connections by using the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

- **A workspace has been connected to ADLS Gen2:** Look for the _AddLinkToExternalResource_ activity. The _ResourceType_ will indicate whether it's a storage account or Log Analytics.
- **A workspace has been disconnected from ADLS Gen2:** Look for the _DeleteLinkToExternalResource_ activity. The _ResourceType_ will indicate whether it's a storage account or Log Analytics.
- **Tenant-level storage is enabled or disabled:** Look for changed values in the activity log by using the _AddExternalResource_ or the _DeleteLinkToExternalResource_ activity.
- **Workspace-level storage is enabled or disabled:** Look for changed values in the activity log by using the _UpdatedAdminFeatureSwitch_ activity. The item name will be _storageAccountAttachForWorkspaceAdminsEnabled_. The _SwitchState_ will be either true or false.
- **The _Azure Log Analytics connections for workspace administrators_ tenant setting has changed:** This tenant setting allows some or all workspace administrators to integrate their own ADLS Gen2 account. Look for changed tenant setting values in the activity log by using the _UpdatedAdminFeatureSwitch_ activity. The item name will be _LogAnalyticsAttachForWorkspaceAdmins_.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning and managing Azure connections, key decisions and actions include:

> [!div class="checklist"]
> - **Review current Azure connections:** Determine the current state by reviewing the tenant-level and workspace-level settings for Azure connections in the admin portal. Also review the setup of _Azure Log Analytics connections for workspace administrators_ tenant setting.
> - **Discuss and decide:** Determine whether you intend to integrate Azure connections with Power BI. Going forward, decide what your optimal use is for OneLake versus Azure connections for data storage (BYOL).
> - **Verify whether approval is required:** Determine whether a process should exist to obtain approvals for using workspace-level storage accounts.
> - **Create a schedule to re-review:** Set up a schedule to re-review Azure connections on a regular basis.
> - **Make updates:** Update the current Azure connections as needed to modify tenant-level and workspace-level storage permissions. Also update the _Azure Log Analytics connections for workspace administrators_ tenant setting based on the decisions made (if they differ from what's currently set).
> - **Create documentation:** If you need to track supplementary information, create documentation of your Azure connections.
> - **Create a process to handle user requests:** Set up a process for how users can request to be able to use Azure connections.
> - **Set up auditing:** Create an auditing process so you can monitor when workspaces have set an Azure connection, or when settings have changed.

## Audit usage of Power BI

Tenant-level auditing data allows you to analyze adoption efforts, understand usage patterns, educate users, support users, mitigate risk, improve compliance, manage license costs, and monitor performance. It's critical that you extract and store Power BI auditing data as early as possible, even if today you're not yet ready to analyze the data.

For information about auditing users, activities, and solutions in Power BI, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

## Monitor the Power BI service

Monitoring refers to ongoing activities that inform you about what's going on. Monitoring is usually a passive activity that involves alerting and automation, though sometimes it's done actively.

For information about monitoring Power BI, see [Tenant-level monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md).

## Related content

For more considerations, actions, decision-making criteria, and guidance to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md#subject-areas).
