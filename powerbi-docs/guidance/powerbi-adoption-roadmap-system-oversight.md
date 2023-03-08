---
title: "Power BI adoption roadmap: System oversight"
description: Apply system oversight consisting of administrative activities to drive strong and successful adoption of Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 10/31/2022
---

# Power BI adoption roadmap: System oversight

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

System oversight—also known as Power BI administration—is the ongoing, day-to-day, administrative activities. It's specifically concerned with:

- **Governance:** Enact governance guidelines and policies to support self-service BI and enterprise BI.
- **User empowerment:** Facilitate and support the internal processes and systems that empower the internal user community to the extent possible, while adhering to the organization's regulations and requirements.
- **Adoption:** Allow for broader organizational adoption of Power BI with effective governance and data management practices.

> [!IMPORTANT]
> Your organizational [data culture](powerbi-adoption-roadmap-data-culture.md) objectives provide direction for your [governance](powerbi-adoption-roadmap-governance.md) decisions, which in turn dictate how [Power BI administration](/power-bi/admin/service-admin-administering-power-bi-in-your-organization) activities take place and by whom.

System oversight is a broad and deep topic. The goal of this article is to introduce some of the most important considerations and actions to help you become successful with your [organizational adoption](powerbi-adoption-roadmap-maturity-levels.md) objectives.

## Power BI administrators

The Power BI administrator role is a defined role in Microsoft 365, which delegates a [subset of Power BI-specific](/power-platform/admin/use-service-admin-role-manage-tenant#service-administrator-permission-matrix) management activities. Global Microsoft 365 administrators are implicitly Power BI administrators. Power Platform administrators are also implicitly Power BI administrators (however, Power BI administrators don't have the same role in other Power Platform applications).

A key governance decision is who to assign as a Power BI administrator. It's a centralized role that affects your entire [Power BI tenant](powerbi-implementation-planning-tenant-setup.md). Ideally, there are [2-4 people in the organization](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#security-guidelines-for-assigning-roles) who are capable of managing the Power BI service. Your administrators should operate in close coordination with the [Center of Excellence (COE)](powerbi-adoption-roadmap-center-of-excellence.md).

### High privilege role

The Power BI administrator role is a high privilege role because:

- **User experience:** Settings that are managed by a Power BI administrator have a significant effect on user capabilities and user experience (described in the [Tenant settings](#tenant-settings) section below).
- **Full security access:** Power BI administrators can update access permissions for workspaces in the tenant. The result is that an administrator can allow permission to view or download data and reports as they see fit (described in the [Tenant settings](#tenant-settings) section below).
- **Metadata:** Power BI administrators can view all tenant metadata, including all user activities that occur in the Power BI service (described in the [Auditing and monitoring](#auditing-and-monitoring) section below).

> [!IMPORTANT]
> Having too many Power BI administrators is a risk. It increases the probability of unapproved, unintended, or inconsistent management of the tenant.

### Roles and responsibilities

The types of activities that an administrator will do on a day-to-day basis will differ between organizations. What's important, and given priority in your [data culture](#tenant-settings), will heavily influence what an administrator does to support business-led self-service BI, managed self-service BI, and enterprise BI. For more information, see the [Content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article.

> [!TIP]
> The best type of person to assign as a Power BI administrator is one who has enough knowledge about Power BI to understand what self-service users need to accomplish. With this understanding, the administrator can balance user empowerment and governance.

There are several [types of Power BI administrators](/power-bi/admin/service-admin-administering-power-bi-in-your-organization#administrator-roles-related-to-power-bi). The following table describes the roles that are used most often on a regular basis.

| **Role** | **Scope** | **Description** |
| --- | --- | --- |
| Power BI administrator | Power BI tenant | Manages tenant settings and other aspects of the Power BI service. All general references to *administrator* in this article refer to this type of administrator. |
| Power BI Premium capacity administrator | One capacity | Manages workspaces, workloads, and monitors the health of a Premium capacity. |
| Power BI gateway administrator | One gateway | Manages gateway data source configuration, credentials, and users assignments. May also handle gateway software updates (or collaborate with infrastructure team on updates). |
| Power BI workspace administrator | One workspace | Manages workspace settings and access. |

The Power BI ecosystem is broad and deep. There are many ways that the Power BI service integrates with other systems and platforms. From time to time, it will be necessary to work with other system administrators and IT professionals, such as:

- Global Microsoft 365 administrator
- Azure Active Directory (Azure AD) administrator
- Teams administrator
- OneDrive administrator
- SharePoint administrator
- Database administrator
- Licensing and billing administrator
- Intune administrator
- Desktop support team
- Infrastructure team
- Networking team
- Security and compliance team

The remainder of this article discusses the most common activities that a Power BI administrator does. It focuses on those activities that are important to carry out effectively when taking a strategic approach to [Power BI organizational adoption](powerbi-adoption-roadmap-overview.md).

## Service management

Overseeing the Power BI service is a crucial aspect to ensure that all users have a good experience with Power BI.

### Tenant settings

Proper management of [tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings) in the Power BI service is critical. Tenant settings are the main way to control which Power BI capabilities are enabled, and for which groups of users in your organization.

It's essential that tenant settings align with governance guidelines and policies, and with how the COE makes decisions. If a Power BI administrator independently decides which settings to enable or disable, that's a clear indicator of an opportunity to improve and refine your governance processes.

> [!IMPORTANT]
> Changing the tenant settings should go through a change control process with an approval mechanism. It should document all changes, recording who made the change, when, and why.

Because content creators and consumers can easily read online about available features in Power BI, it can be frustrating for users when capabilities don't function as expected. It can lead to dissatisfied users and less effective [organizational adoption, user adoption, and solution adoption](powerbi-adoption-roadmap-maturity-levels.md).

Here's a list of common questions asked by confused and frustrated users:

- Why can't I create a workspace?
- Why can't I export data?
- Why doesn't my custom visual work?
- Why can't I certify a dataset?

> [!CAUTION]
> An administrator may discover situations that aren't ideal, such as too many data exports in the activity log. Resist the urge to disable the feature entirely. Prohibiting features leads to user frustration, and leads users to find workarounds. Before disabling a setting, find out why users are relying on certain techniques. Perhaps a solution needs to be redesigned, or additional user education and training could mitigate the concerns. The bottom line: knowledge sharing is an effective form of governance.

Since there's no reader role to view tenant settings, it can be a challenge in larger organizations. Consider publishing a document to the centralized portal that describes the tenant settings, as described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article.

The following activities apply when reviewing and validating each tenant setting:

- Tenant setting:
  - Enabled, or
  - Disabled
- Tenant setting applicable to:
  - The entire organization, or
  - Limited to specific security group(s):
    - Does a suitable security group already exist?, or
    - Does a new security group need to be created?

### Admin portal

As discussed in the Power BI adoption [maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article, organizational adoption refers to the effectiveness of Power BI governance and data management practices to support and enable enterprise BI and self-service BI. Actively managing all areas of the Power BI service (in addition to the tenant settings) in accordance with adoption goals has a direct influence on ensuring that all users have a good experience with Power BI.

Other responsibilities for managing the Power BI service include:

- [Workspace management and access](/power-bi/admin/service-admin-portal-workspaces)
- [Premium capacity and Premium Per User settings](/power-bi/admin/service-admin-portal-capacity-settings)
- [Embed codes](/power-bi/admin/service-admin-portal-embed-codes)
- [Organizational visuals](/power-bi/admin/service-admin-portal-organizational-visuals)
- [Azure connections](/power-bi/admin/service-admin-portal-azure-connections)
- [Custom branding](/power-bi/admin/service-admin-portal-custom-branding)
- [Featured content](/power-bi/admin/service-admin-portal-featured-content)

In addition to these documentation links, see the [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP), which describes additional considerations for Power BI administration.

## User machines and devices

The management of user machines and devices is usually a responsibility of the IT department. The adoption of Power BI depends directly on content creators and consumers having the applications they need installed and configured correctly.

The following [software installations](https://powerbi.microsoft.com/downloads/) are available for content creators:

| **Software** | **Audience** |
| --- | --- |
| Power BI Desktop | Content creators who develop data models and interactive reports for deployment to the Power BI service. |
| Power BI Desktop Optimized for Report Server | Content creators who develop data models and interactive reports for deployment to Power BI Report Server. |
| Power BI Report Builder | Content creators who develop paginated reports for deployment to the Power BI service or Power BI Report Server. |
| Power BI Mobile Application | Content creators or consumers who interact with content that's been published to the Power BI service or Power BI Report Server, using iOS, Android, or Windows 10 applications. |
| On-premises data gateway (personal mode) | Content creators who publish datasets to the Power BI service and manage scheduled data refresh (see more detail in the [Gateway architecture and management](#gateway-architecture-and-management) section of this article). |
| Third-party tools | Advanced content creators may optionally use third-party tools for [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md). |

> [!IMPORTANT]
> Not all the listed software will be necessary for all content creators. Power BI Desktop is the most common requirement and is the starting point when in doubt.

All content creators who collaborate with others should use the same version of the software—especially Power BI Desktop, which is updated monthly. Ideally, software updates are available from the Microsoft Store or installed by an automated IT process. This way, users don't have to take any specific action to obtain updates.

Because new capabilities are continually released, software updates should be released promptly. This way, users can take advantage of the new capabilities, and their experience is aligned to documentation. It's also important to be aware of the [update channel](/deployoffice/overview-update-channels). It provides new (and updated) features for Office apps, such as Excel and Word, on a regular basis.

Other common items that may need to be installed on user machines include:

- Drivers to support data connectivity, for example, Oracle, HANA, or the Microsoft Access Database Engine
- The [Analyze in Excel](/power-bi/collaborate-share/service-analyze-in-excel) provider
- [External tools](/power-bi/transform-model/desktop-external-tools). For example, Tabular Editor, DAX Studio, or ALM Toolkit.
- [Custom data source connectors](/power-bi/connect-data/desktop-connector-extensibility)

In addition to software installations, user machines may be managed for:

- **Group policy settings:** For example, group policy can specify the allowed usage of [custom visuals](/admin/organizational-visuals#certified-power-bi-visuals) in Power BI Desktop. The objective is for a consistent user experience in Power BI Desktop and the Power BI service. The objective is to prevent user frustration (if they were allowed to create content in Power BI Desktop that can't be displayed in the Power BI service).
- **Registry settings:** For example, you can choose to disable the Power BI Desktop [sign-in form](/power-bi/admin/desktop-admin-sign-in-form) or [tune Query Editor performance](/power-bi/create-reports/desktop-evaluation-configuration).

> [!TIP]
> Effective management of software, drivers, and settings can make a big difference to the user experience, and that can translate to increased [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages) and satisfaction, and reduced [user support](powerbi-adoption-roadmap-user-support.md) costs.

## Architecture

### Data architecture

*Data architecture* refers to the principles, practices, and methodologies that govern and define what data is collected, and how it's ingested, stored, managed, integrated, modeled, and used.

There are many data architecture decisions to make. Frequently the COE engages in data architecture design and planning. It's common for administrators to get involved as well, especially when they manage databases or Azure infrastructure.

> [!IMPORTANT]
> Data architecture decisions have a significant impact on Power BI adoption, user satisfaction, and individual project success rates.

A few data architecture considerations that affect adoption of Power BI include:

- Where does Power BI fit into the organization's entire data architecture? And, are there other existing components such as an enterprise data warehouse (EDW) or a data lake that will be important to factor into plans?
- Is Power BI used end-to-end for data preparation, data modeling, and data presentation? Or, is Power BI used only some of those capabilities?
- Are managed self-service BI patterns followed to find the best balance between data reusability and report creator flexibility?
- Where will users consume the content? Generally, the three main ways to deliver content are: the Power BI service, Power BI Report Server, and embedded in custom applications. The [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP) includes a section on Power BI architectural choices, which describes when to consider each of these three main choices. Additionally, [Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/) is a convenient alternative to the Power BI service, especially for users who spend a lot of time in Teams.
- Who is responsible for managing and maintaining the data architecture? Is it a centralized team, or a decentralized team? How is the [COE](powerbi-adoption-roadmap-center-of-excellence.md) represented in this team? Are certain skillsets required?
- What [data sources](/power-bi/connect-data/desktop-data-sources) are the most important? What types of data will we be acquiring?
- What [connectivity mode](/power-bi/connect-data/service-dataset-modes-understand) and [storage mode](/power-bi/transform-model/desktop-storage-mode) choices (for example, import, live connection, DirectQuery, or composite model frameworks) are the best fit for the use cases?
- To what extent is data reusability encouraged using [shared datasets](/power-bi/connect-data/desktop-report-lifecycle-datasets)?
- To what extent is the reusability of data preparation logic and advanced data preparation encouraged by using [dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service)?

When becoming acquainted with Power BI, many system administrators assume it's a query tool much like SQL Server Reporting Services (SSRS). The breadth of capabilities for Power BI, however, are vast in comparison. So, it's important for administrators to become aware of Power BI capabilities before they make architectural decisions.

> [!TIP]
> Get into the good habit of completing a technical proof of concept (POC) to test out assumptions and ideas. Some organizations also call them *micro-projects* when the goal is to deliver a small unit of work. The goal of a POC is to address unknowns and reduce risk as early as possible. A POC doesn't have to be throwaway work, but it should be narrow in scope. Best practices reviews, as discussed in the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, are another useful way to help content creators with important architectural decisions.

### Premium capacity management

[Power BI Premium](https://powerbi.microsoft.com/power-bi-premium/) includes features and capabilities to deliver BI solutions at scale. Premium subscriptions may be purchased [by capacity or per user](https://powerbi.microsoft.com/pricing/) with Premium Per User (PPU). This section primarily focuses on Premium capacity, which requires more administrative oversight.

Power BI Premium can play a significant role in your BI strategy. Some top reasons to invest in Premium include:

- [Unlimited content distribution](/power-bi/enterprise/service-premium-what-is#unlimited-content-sharing) to large numbers of read-only (content consumption with a free Power BI license is available in Premium capacity only, not PPU).
- [Deployment pipelines](/power-bi/create-reports/deployment-pipelines-overview) to manage the publication of content to development, test, and production workspaces. They're highly recommended for critical content to improve release stability.
- [Paginated reports](/power-bi/paginated-reports/paginated-reports-report-builder-power-bi) to deliver highly formatted, pixel-perfect reports. This report type allows content creators to meet other types of information delivery requirements.
- [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools), which is an industry standard protocol for managing and publishing a dataset, or querying the dataset from any XMLA-compliant tool.
- Increased model size limits, including [large dataset](/power-bi/enterprise/service-premium-large-models) support.
- More frequent [data refreshes](/power-bi/connect-data/refresh-data#power-bi-refresh-types).
- Storage of data in a specific geographic area ([multi-geo](/power-bi/admin/service-admin-premium-multi-geo) is available by capacity only).

This list isn't all-inclusive. For a complete list of Premium features, see [Power BI Premium FAQ](/power-bi/enterprise/service-premium-faq).

#### Managing Premium capacity

Overseeing the health of Power BI Premium capacity is an essential ongoing activity for administrators. By definition, Premium capacity includes a fixed level of system resources. It equates to memory and CPU limits that must be managed to achieve optimal performance.

> [!CAUTION]
> Lack of management and exceeding the limits of Premium capacity can often result in performance challenges and user experience challenges. Both challenges, if not managed correctly, can contribute to negative impact on adoption efforts.

Suggestions for managing Premium capacity:

- Create a specific set of criteria for content that will be published to Premium capacity. It's especially relevant when a single capacity is used by multiple business units because the potential exists to disrupt other users if the capacity isn't well-managed. For a list of items that may be included in the best practices review (such as reasonable dataset size and efficient calculations), see the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews) article.
- Regularly use the [Premium monitoring app](/power-bi/enterprise/service-premium-metrics-app) to understand resource utilization and patterns for the Premium capacity. Most importantly, look for consistent patterns of overutilization, which will contribute to user disruptions. An analysis of usage patterns should also make you aware if the capacity is underutilized, indicating more value could be gained from the investment.
- Configure the [tenant setting](/power-bi/support/service-interruption-notifications#enable-notifications) so Power BI notifies you if the [Premium capacity becomes overloaded](https://powerbi.microsoft.com/blog/announcing-timely-premium-capacity-overload-alerts/), or an outage or incident occurs.

#### Autoscale

[Autoscale](/power-bi/enterprise/service-premium-auto-scale) is a capability of [Power BI Premium](/power-bi/enterprise/service-premium-concepts). It's intended to handle occasional or unexpected bursts in Premium usage levels. Autoscale can respond to these bursts by automatically increasing CPU resources to support the increased workload.

Automated scaling up reduces the risk of performance and user experience challenges in exchange for a financial impact. If the Premium capacity isn't well-managed, autoscale may trigger more often than expected. In this case, the [Premium monitoring app](/power-bi/enterprise/service-premium-metrics-app) can help you to determine underlying issues and do capacity planning.

#### Decentralized Premium capacity management

Capacity administrators are responsible for [assigning workspaces](/power-bi/enterprise/service-admin-premium-manage#assign-a-workspace-to-a-capacity) to a specific capacity.

Be aware that workspace administrators can also assign a workspace to PPU if the workspace administrator possesses a PPU license. However, it would require that all other workspace users must also have a PPU license.

It's possible to set up multiple capacities to facilitate decentralized management by different business units. Decentralizing management of certain aspects of Power BI is a great way to balance agility and control.

Here's an example that describes one way you could manage Premium capacity.

- [Purchase](/power-bi/enterprise/service-admin-premium-purchase) a P3 capacity node in Microsoft 365. It includes 32 virtual cores.
- Use 16 cores to create the first capacity. It will be used by the Sales team.
- Use 8 cores to create the second capacity. It will be used by the Operations team.
- Use the remaining 8 cores to create the third capacity. It will support general use.

The previous example has several advantages.

- Separate [capacity administrators](/power-bi/enterprise/service-admin-premium-manage#manage-user-permissions) may be configured for each capacity. Therefore, it facilitates decentralized management situations.
- If a capacity isn't well-managed, the effect is confined to that capacity only. The other capacities aren't impacted.

However, the previous example has disadvantages, too.

- The [limits per capacity](/power-bi/enterprise/service-premium-what-is#capacity-nodes) are lower. The maximum memory size allowed for datasets isn't the entire P3 capacity node size. Rather, it's the assigned capacity size where the dataset is hosted.
- It's more likely one of the smaller capacities will need to be scaled up at some point in time.
- There are more capacities to manage in the Power BI tenant.

### Gateway architecture and management

A [data gateway](/power-bi/connect-data/service-gateway-onprem) facilitates the secure and efficient transfer of data between organizational data sources and the Power BI service. A data gateway is needed for data connectivity to on-premises or cloud services when a data source is:

- Located within the enterprise data center.
- Configured behind a firewall.
- Within a virtual network.
- Within a virtual machine.

There are three types of gateways.

- **On-premises data gateway (standard mode)** is a gateway service that supports connections to registered data sources for many users to use. The gateway software installations and updates are installed on a machine that's managed by the customer.
- **On-premises data gateway (personal mode)** is a gateway service that supports data refresh only. This gateway mode is typically installed on the PC of a content creator. It supports use by one user only. It doesn't support live connection or DirectQuery connections.
- **Virtual network data gateway** is a Microsoft managed service that supports connectivity for many users. Specifically, it supports connectivity for datasets and dataflows stored in workspaces assigned to Premium capacity or Premium Per User.

> [!TIP]
> The decision of [who can install gateway software](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) is a governance decision. For most organizations, use of the data gateway in standard mode, or a virtual network data gateway, should be strongly encouraged. They're far more scalable, manageable, and auditable than data gateways in personal mode.

#### Decentralized gateway management

The On-premises data gateway (standard mode) and Virtual network data gateway support specific data source types that can be registered, together with connection details and how credentials are stored. Users can be granted permission use the gateway data source so that they can schedule a refresh or run DirectQuery queries.

Certain aspects of gateway management can be done effectively on a decentralized basis to balance agility and control. For example, the Operations group may have a gateway dedicated to its team of self-service content creators and data owners.

Decentralized gateway management works best when it's a joint effort as follows.

Managed by the decentralized data owners:

- Departmental data source [connectivity information and privacy levels](/power-bi/connect-data/service-gateway-data-sources#add-a-data-source).
- Departmental data source [stored credentials](/power-bi/connect-data/service-gateway-data-sources#store-encrypted-credentials-in-the-cloud) (including responsibility for updating routine password changes).
- Departmental data source [users](/power-bi/connect-data/service-gateway-data-sources#manage-users) who are permitted to use each data source.

Managed by centralized data owners (includes data sources that are used broadly across the organization; management is centralized to avoid duplicated data sources):

- Centralized data source [connectivity information and privacy levels](/power-bi/connect-data/service-gateway-data-sources#add-a-data-source).
- Centralized data source [stored credentials](/power-bi/connect-data/service-gateway-data-sources#store-encrypted-credentials-in-the-cloud) (including responsibility for updating routine password changes).
- Centralized data source [users](/power-bi/connect-data/service-gateway-data-sources#manage-users) who are permitted to use each data source.

Managed by IT:

- Gateway software updates (gateway updates are usually released monthly).
- Installation of drivers and custom connectors (the same ones that are installed on [user machines](#user-machines-and-devices)).
- Gateway cluster management (number of machines in the gateway cluster for high availability, disaster recovery, and to eliminate a single point of failure,  which can cause significant user disruptions).
- Server management (for example, operating system, RAM, CPU, or networking connectivity).
- Management and backup of gateway encryption keys.
- Monitoring of gateway logs to assess when scale-up or scale-out is necessary.
- Alerting of downtime or persistent low resources on the gateway machine.

> [!TIP]
> Allowing a decentralized team to manage certain aspects of the gateway means they can move faster. The tradeoff of decentralized gateway management does mean running more gateway servers so that each can be dedicated to a specific area of the organization. If gateway management is handled entirely by IT, it's imperative to have a good process in place to quickly handle requests to add data sources and apply user updates.

## User licenses

Every user of the Power BI service needs a commercial license, which is integrated with an Azure AD identity. The user license may be Free, Power BI Pro, or Power BI Premium Per User.

A user license is obtained via a subscription, which authorizes a certain number of licenses with a start and end date.

There are two approaches to procuring subscriptions.

- **Centralized:** Microsoft 365 billing administrator purchases a subscription for [Power BI Pro or Premium Per User](https://powerbi.microsoft.com/pricing/). It's the most common way to manage subscriptions and assign licenses.
- **Decentralized:** Individual departments purchase a subscription via [self-service purchasing](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide&preserve-view=true).

### Self-service purchasing

An important governance decision relates to what extent self-service purchasing will be allowed or encouraged.

Self-service purchasing is useful for:

- Larger organizations with decentralized business units that have purchasing authority and want to handle payment directly with a credit card.
- Organizations that intend to make it as easy as possible to purchase subscriptions on a monthly commitment.

Consider disabling self-service purchasing when:

- Centralized procurement processes are in place to meet regulatory, security, and governance requirements.
- Discounted pricing is obtained through an Enterprise Agreement (EA).
- Existing processes are in place to handle intercompany chargebacks.
- Existing processes are in place to handle [group-based](/azure/active-directory/enterprise-users/licensing-groups-assign) licensing assignments.
- Prerequisites are required for obtaining a license, such as approval, justification, training, or a governance policy requirement.
- There's a valid need, such as a regulatory requirement, to control access to the Power BI service closely.

### User license trials

Another important governance decision is whether user license trials are allowed. By default, trials are enabled. That means when content is shared with a colleague, if the recipient doesn't have a Power BI Pro or Premium Per User license, they'll be prompted to start a trial to view the content (if the content doesn't reside within Premium capacity). The trial experience is intended to be a convenience that allows users to continue with their normal workflow.

Generally, disabling trials isn't recommended. It can encourage users to seek workarounds, perhaps by exporting data or working outside of supported tools and processes.

Consider disabling trials only when:

- There are serious cost concerns that would make it unlikely to grant full licenses at the end of the trial period.
- Prerequisites are required for obtaining a license (such as approval, justification, or a training requirement). It's not sufficient to meet this requirement during the trial period.
- There's a valid need, such as a regulatory requirement, to control access to the Power BI service closely.

> [!TIP]
> Don't introduce too many barriers to obtaining a Power BI license. Users who need to get work done will find a way, and that way may involve workarounds that aren't ideal. For instance, without a license to use the Power BI service, people may rely far too much on sharing files on a file system or via email when significantly better approaches are available.

## Cost management

Managing and optimizing the cost of cloud services, like Power BI, is an important activity. Here are several activities you may want to consider.

- Analyze who is using—and, more to the point, not using—their allocated Power BI licenses and make necessary adjustments. Power BI usage is analyzed using the [activity log](/power-bi/admin/service-admin-auditing).
- Analyze the cost effectiveness of [Premium capacity](/power-bi/enterprise/service-premium-what-is) or [Premium Per User](/power-bi/enterprise/service-premium-per-user-faq#using-premium-per-user--ppu-). In addition to the [additional features](/power-bi/enterprise/service-premium-per-user-faq#using-premium-per-user--ppu-), perform a cost/benefit analysis to determine whether Premium licensing is more cost-effective when there are a large number of consumers. Unlimited content distribution is only available with Premium capacity, not PPU licensing.
- Carefully [monitor and manage Premium capacity](/power-bi/enterprise/service-premium-metrics-app). Understanding usage patterns over time will allow you to predict when to purchase [more capacity](/power-bi/enterprise/service-premium-what-is#capacity-nodes). For example, you may choose to scale up a single capacity from a P1 to P2, or scale out from one P1 capacity to two P1 capacities.
- If there are occasional spikes in the level of usage, use of [autoscale](/power-bi/enterprise/service-premium-auto-scale) with [Power BI Premium](/power-bi/enterprise/service-premium-concepts) is recommended to ensure the user experience isn't interrupted. Autoscale will scale up capacity resources for 24 hours, then scale them back down to normal levels (if sustained activity isn't present). Manage autoscale cost by constraining the maximum number of v-cores, and/or with spending limits set in Azure (because autoscale is supported by the Azure Power BI Embedded service). Due to the pricing model, autoscale is best suited to handle occasional unplanned increases in usage.
- For Azure data sources, co-locate them in the same region as your Power BI tenant whenever possible. It will avoid incurring [Azure egress charges](https://azure.microsoft.com/pricing/details/bandwidth/). Data egress charges are minimal, but at scale can add up to be considerable unplanned costs.

## Security, information protection, and data loss prevention

Security, information protection, and data loss prevention (DLP) are joint responsibilities among all content creators, consumers, and administrators. That's no small task because there's sensitive information everywhere: personal data, customer data, or customer-authored data, protected health information, intellectual property, proprietary organizational information, just to name a few. Governmental, industry, and contractual regulations may have a significant impact on the [governance](powerbi-adoption-roadmap-governance.md) guidelines and policies that you create related to security.

The [Power BI security whitepaper](whitepaper-powerbi-security.md) is an excellent resource for understanding the breadth of considerations, including aspects that Microsoft manages. This section will introduce several topics that customers are responsible for managing.

### User responsibilities

Some organizations ask Power BI users to accept a self-service user acknowledgment. It's a document that explains the user's responsibilities and expectations for safeguarding organizational data.

One way to automate its implementation is with an [Azure AD terms of use policy](/azure/active-directory/conditional-access/terms-of-use). The user is required to agree to the policy before they're permitted to visit the Power BI service for the first time. You can also require it to be acknowledged on a recurring basis, like an annual renewal.

### Data security

In a [cloud shared responsibility model](/azure/security/fundamentals/shared-responsibility), securing the data is always the responsibility of the customer. With a self-service BI platform, self-service content creators have responsibility for properly securing the content that they shared with colleagues.

The COE should provide [documentation and training](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) where relevant to assist content creators with best practices (particularly situations for dealing with ultra-sensitive data).

Administrators can be help by following best practices themselves. Administrators can also raise concerns when they see issues that could be discovered when [managing workspaces](/power-bi/admin/service-admin-portal-workspaces), [auditing user activities](/power-bi/admin/service-admin-auditing), or managing [gateway credentials and users](/power-bi/connect-data/service-gateway-data-sources#add-a-data-source). There are also several [tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings) that are usually restricted except for a few users (for instance, the ability to [publish to web](/power-bi/admin/service-admin-portal-export-sharing#publish-to-web) or the ability to [publish apps to the entire organization](/power-bi/admin/service-admin-portal-content-pack-app#publish-content-packs-and-apps-to-the-entire-organization)).

### External guest users

External users—such as partners, customers, vendors, and consultants—are a common occurrence for some organizations, and rare for others. How you handle external users is a governance decision.

External user access is controlled by [tenant settings](/power-bi/admin/service-admin-portal-export-sharing) in the Power BI service and certain Azure AD settings. For details of external user considerations, review the [Distribute Power BI content to external guest users using Azure AD B2B](whitepaper-azure-b2b-power-bi.md) whitepaper.

### Information protection and data loss prevention

Power BI supports capabilities for information protection and data loss prevention (DLP) in the following ways.

- **Information protection:** [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) (formerly known as Microsoft Information Protection) includes capabilities for discovering, classifying, and protecting data. A key principle is that data can be better protected once it's been classified. The key building block for classifying data is [sensitivity labels](/power-bi/enterprise/service-security-sensitivity-label-overview). For more information, see [Information protection for Power BI planning](powerbi-implementation-planning-info-protection.md).
- **Data loss prevention for Power BI:** Microsoft Purview Data Loss Prevention (formerly known as Office 365 Data Loss Prevention) supports [DLP policies for Power BI](/power-bi/enterprise/service-security-dlp-policies-for-power-bi). By using sensitivity labels or sensitive information types, DLP policies for Power BI help an organization locate sensitive datasets. For more information, see [Data loss prevention for Power BI planning](powerbi-implementation-planning-data-loss-prevention.md).
- **Microsoft Defender for Cloud Apps:** [Microsoft Defender for Cloud Apps](/power-bi/enterprise/service-security-using-defender-for-cloud-apps-controls) (formerly known as Microsoft Cloud App Security) supports policies that help protect data, including real-time controls when users interact with the Power BI service. For more information, see [Defender for Cloud Apps for Power BI planning](powerbi-implementation-planning-defender-for-cloud-apps.md).

### Data residency

For organizations with requirements to store data within a geographic region, Premium capacity (not PPU) can be [configured for a specific region](whitepaper-powerbi-security.md#data-residency) that's different from the region of the Power BI home tenant.

### Encryption keys

Microsoft handles encryption of *data at rest* in Microsoft data centers with transparent server-side encryption and auto-rotation of certificates. For customers with regulatory requirements to [manage the Premium encryption key themselves](/power-bi/enterprise/service-encryption-byok), Premium capacity can be configured to use [Azure Key Vault](/azure/key-vault/general/basic-concepts). Using customer-managed keys—also known as *bring-your-own-key* or *BYOK*—is a precaution to ensure that, in the event of a human error by a service operator, customer data can't be exposed.

Be aware that [Premium Per User (PPU)](/power-bi/enterprise/service-premium-per-user-faq#using-premium-per-user--ppu-) only supports BYOK when it's enabled for the entire Power BI tenant.

## Auditing and monitoring

A wealth of metadata is available for understanding what's happening within your Power BI tenant. The primary source of information is from the Power BI [activity log](/power-bi/admin/service-admin-auditing), which captures information about many different types of activities that users perform.

There are also various [REST APIs](/rest/api/power-bi/) that provide additional information about workspaces, apps, datasets, and more. Of particular interest to administrators are the [admin APIs](/rest/api/power-bi/admin). These APIs provide a means to extract metadata for the entire tenant. The [Power BI Management Module](/powershell/power-bi/overview?view=powerbi-ps&preserve-view=true) is a set of PowerShell commands that make it easier to obtain metadata rather than dealing directly with the APIs. However, substantially more information is available directly from the APIs.

Long-term [usage and performance insights](https://powerbi.microsoft.com/blog/announcing-long-term-usage-and-performance-insights-public-preview/) are also available for workspaces backed by [Premium capacity](/power-bi/enterprise/service-premium-what-is). Administrators can analyze dataset activity, performance, and behavior. This capability is integrated with [Azure Log Analytics](/azure/azure-monitor/logs/log-analytics-tutorial).

### Auditing

Auditing data is valuable for informing and tracking your adoption goals, helping the COE be more effective, ideas for helpful documentation or new training, and for governance-related reporting.

The following table presents are a few ideas of what you can do with the information available from the Power BI activity log and APIs:

| **Category of auditing data** | **Type of questions** |
| --- | --- |
| Usage patterns and adoption | What is the most often-used content, and by whom? </br></br>How many users are active? </br></br>Are report views trending up or down? </br></br>Is there underutilized or abandoned content? </br></br>Are viewers using browser or mobile apps more often? </br></br>When is content published or updated, and by whom? |
| Governance, security, and compliance | When are workspace roles updated, and by whom? </br></br>How many external users are accessing content? </br></br>Who added or updated a sensitivity label? </br></br>When does a tenant setting change, and by whom? </br></br>What percentage of report views are based on certified datasets? </br></br>What percentage of datasets support more than one report? </br></br>How frequently is content downloaded, and by whom? </br></br>Who generated an embed code for publish to web? |
| Architecture reporting and analysis | How many workspaces exist by type? </br></br>How many reports exist by type? </br></br>When is a gateway or data source created or updated? |
| User education and training opportunities | Who started a Power BI trial? </br></br>Who is doing too much sharing from their personal workspace? </br></br>Who is publishing many new datasets? </br></br>Who is doing a lot of exporting? |

When considering needs for creating auditing reports, consider the following:

- What does success mean?
- What behaviors do you want to encourage?
- What do you want people to start doing?
- What do you want people to stop doing?

> [!IMPORTANT]
> The raw data files that contain the auditing data should be stored in a very secure location, preferably one which is immutable (allowing no modifications or deletions). Immutable storage allows your auditors to rely on this data. A service like [Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-introduction) is a flexible and low-cost alternative for this purpose.

### Monitoring

[Microsoft Defender for Cloud Apps](https://powerbi.microsoft.com/blog/get-up-to-speed-with-power-bi-and-microsoft-cloud-app-security/) is a cloud access security broker (CASB) that allows administrators to perform activities such as:

- Audit, monitor, and raise alerts based on activities
- Create data loss prevention policies
- Detect unusual behaviors and risky sessions
- Limit activities performed by applications (with [Azure AD conditional access app control](/cloud-app-security/proxy-intro-aad))

Some powerful [Power BI monitoring and protection](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/protect-your-power-bi-instance-using-microsoft-cloud-app/ba-p/2166872) capabilities are available with Defender for Cloud Apps. For example, you can:

- Prohibit all—or certain users—from downloading a file from the Power BI service when a specific sensitivity label is assigned.
- Receive an alert whenever a tenant setting is updated in the Power BI service (for instance, an administrative activity is detected).
- Detect when suspicious or unusual behaviors have occurred, such as massive file downloads or an unusual number of sharing operations in the Power BI service.
- Search the activity log for specific activities relating to content with a specific sensitivity label assigned, such as exports from the Power BI service.
- Be notified when risky sessions are occurring, such as when the same user account connects from different geographical areas in a narrow time window.
- Determine when someone outside a predefined security group views specific content in the Power BI service.

> [!CAUTION]
> Licensing, cost, and administrative permissions for Defender for Cloud Apps are all handled separately from Power BI. You can create an [application-specific admin](/cloud-app-security/manage-admins#built-in-defender-for-cloud-apps-admin-roles) with permissions scoped to monitoring just the Power BI service.

## Planning for change

Every month, new Power BI features and functionality are released. To be effective, it's crucial for everyone involved with system oversight to stay current.

The [Power BI blog](https://powerbi.microsoft.com/blog/) is the best place for customers to monitor announcements and new releases.

The [Power BI release plan](https://powerbi.microsoft.com/roadmap/) is where customers can find the public roadmap for future features and estimated dates. Sometimes a change that's coming is so important that it's useful to start planning for it well in advance. The planning cycle is in semesters: April-September, and October-March.

> [!IMPORTANT]
> It's difficult to overestimate the importance of staying current. Being a few months behind on announcements can make it difficult to properly manage the Power BI service and support the user population efficiently.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - Considerations and key actions you can take for system oversight follow.

**Improve system oversight:**

> [!div class="checklist"]
> - **Verify who is permitted to be a Power BI administrator:** If possible, reduce the number of people granted the Power BI administrator role if it's more than a few people.
> - **Use PIM for occasional administrators:** If you have people who *occasionally* need Power BI administrator rights, consider implementing [Privileged Identity Management](/azure/active-directory/privileged-identity-management/pim-configure) (PIM) in Azure AD. It's designed to assign just-in-time role permissions that expire after a few hours.
> - **Train administrators:** Check the status of cross-training and documentation in place for handling Power BI administration responsibilities. Ensure that a backup person is trained so that needs can be met timely, in a consistent way.

**Improve management of the Power BI service:**

> [!div class="checklist"]
> - **Review tenant settings:** Conduct a review of all tenant settings to ensure they're aligned with [data culture](powerbi-adoption-roadmap-data-culture.md) objectives and [governance](powerbi-adoption-roadmap-governance.md) guidelines and policies. Verify which groups are assigned for each setting.
> - **Document the tenant settings:** Create documentation of your tenant settings for the internal Power BI community and post it in the centralized portal. Include which groups a user would need to request to be able to use a feature.
> - **Customize the Get Help links:** When user resources are established, as described in the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, update the [tenant setting](/power-bi/support/service-admin-portal-help-support) to customize the links under the **Get Help** menu option. It will direct users to your documentation, community, and help.

**Improve management of user machines and devices:**

> [!div class="checklist"]
> - **Create a consistent onboarding process:** Review your process for how onboarding of new content creators is handled. Determine if new requests for software, such as Power BI Desktop, and user licenses (Power BI Pro or Premium Per User) can be handled together. It can simplify onboarding since new content creators won't always know what to ask for.
> - **Handle user machine updates:** Ensure an automated process is in place to install and update software, drivers, and settings to ensure all users have the same version.

**Data architecture planning:**

> [!div class="checklist"]
> - **Assess what your end-to-end data architecture looks like:** Make sure you're clear on:
>     - How Power BI is currently used by the different business units in your organization versus how you want Power BI to be used. Determine if there's a gap.
>     - If there are any risks that should be addressed.
>     - If there are any high-maintenance situations to be addressed.
>     - What data sources are important for Power BI users, and how they're documented and discovered.
> - **Review existing data gateways:** Find out what gateways are being used throughout your organization. Verify that gateway administrators and users are set correctly. Verify who is supporting each gateway, and that there's a reliable process in place to keep the gateway servers up to date.
> - **Verify use of personal gateways:** Check the number of personal gateways that are in use, and by whom. If there's significant usage, take steps to move towards use of the standard mode gateway.

**Improve management of user licenses:**

> [!div class="checklist"]
> - **Review the process to request a user license:** Clarify what the process is, including any prerequisites, for users to obtain a license. Determine whether there are improvements to be made to the process.
> - **Determine how to handle self-service license purchasing:** Clarify whether self-service licensing purchasing is enabled. Update the settings if they don't match your intentions for how licenses can be purchased.
> - **Confirm how user trials are handled:** Verify user license trials are enabled or disabled. Be aware that all user trials are Premium Per User. They apply to Free licensed users signing up for a trial, and Power BI Pro users signing up for a Premium Per User trial.

**Improve cost management:**

> [!div class="checklist"]
> - **Determine your cost management objectives:** Consider how to balance cost, features, usage patterns, and effective utilization of resources. Schedule a routine process to evaluate costs, at least annually.
> - **Obtain acitivity log data:** Ensure you have access to the activity log data to assist with cost analysis. It can be used to understand who is—or isn't—using the license assigned to them.

**Improve security and data protection:**

> [!div class="checklist"]
> - **Clarify exactly what the expectations are for data protection:** Ensure the expectations for data protection, such as how to use sensitivity labels, are documented and communicated to users.
> - **Determine how to handle external users:** Understand and document the organizational policies around sharing Power BI content with external users. Ensure that settings in the Power BI service support your policies for external users.
> - **Set up monitoring:** Investigate the use of Microsoft Defender for Cloud Apps to monitor user behavior and activities in the Power BI service.

**Improve auditing and monitoring:**

> [!div class="checklist"]
> - **Retrieve and store data from the activity log:** Begin retrieving data from the Power BI activity log if you aren't currently compiling the raw data. The easiest way to get started is to use the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent?view=powerbi-ps&preserve-view=true) PowerShell cmdlet included with the Power BI Management Module. Retrieve and store the raw data without filtering or formatting, to ensure that all data elements are available for future analysis. A file system or data lake is an ideal location for storing the JSON files.
> - **Include additional auditing data:** Over time, determine what other auditing data would be helpful to complement the activity log data.

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.png" border="false":::

The following maturity levels will help you assess the current state of your Power BI system oversight.

| **Level** | **State of Power BI system oversight** |
| --- | --- |
| 100: Initial | Tenant settings are configured independently by one or more administrators based on their best judgment. </br></br>Architecture needs, such as gateways and capacities, are satisfied on an as-needed basis. However, there isn't a strategic plan. </br></br>Power BI activity logs are unused, or selectively used for tactical purposes. |
| 200: Repeatable | The tenant settings purposefully align with established governance guidelines and policies. All tenant settings are reviewed regularly. </br></br>A small number of specific administrators are selected. All administrators have a good understanding of what users are trying to accomplish in Power BI, so they're in a good position to support users. </br></br>A well defined process exists for users to request licenses and software. Request forms are easy for users to find. Self-service purchasing settings are specified. </br></br>Sensitivity labels are configured in Microsoft 365. However, use of labels remains inconsistent. The advantages of data protection aren't well understood by users. |
| 300: Defined | The tenant settings are fully documented in the centralized portal for users to reference, including how to request access to the correct groups. </br></br>Cross-training and documentation exist for administrators to ensure continuity, stability, and consistency. </br></br>Sensitivity labels are assigned to content consistently. The advantages of using sensitivity labels for data protection are understood by users. </br></br>An automated process is in place to export Power BI activity log and API data to a secure location for reporting and auditing. |
| 400: Capable | Administrators work closely with the COE and governance teams to provide oversight of Power BI. A balance of user empowerment and governance is successfully achieved. </br></br>Decentralized management of data architecture (such as gateways or capacity management) is effectively handled to balance agility and control. </br></br>Automated policies are set up and actively monitored in Microsoft Defender for Cloud Apps for data loss prevention. </br></br>Power BI activity log and API data is actively analyzed to monitor and audit Power BI activities. Proactive action is taken based on the data. |
| 500: Efficient | The Power BI administrators work closely with the COE actively stay current. Blog posts and release plans from the Power BI product team are reviewed frequently to plan for upcoming changes. </br></br>Regular cost management analysis is done to ensure user needs are met in a cost-effective way. </br></br>Power BI activity log and API data is actively used to inform and improve adoption and governance efforts. |

## Next steps

For more information about system oversight and Power BI administration, see the following resources.

- [Administer Power BI - Part 1](/training/paths/administer-power-bi-part-1/)
- [Administer Power BI - Part 2](/training/paths/administer-power-bi-part-2/)
- [Administrator in a Day Training – Day 1](https://aka.ms/AdmPBI1)
- [Administrator in a Day Training – Day 2](https://aka.ms/AdmPBI2)
- [Power BI security whitepaper](whitepaper-powerbi-security.md)
- [External guest users whitepaper](whitepaper-azure-b2b-power-bi.md)
- [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP)
- [Power BI adoption framework](https://github.com/pbiaf/powerbiadoption)

In the [next article](powerbi-adoption-roadmap-conclusion.md) in the Power BI adoption roadmap series, in conclusion, learn about adoption-related resources that you might find valuable.
