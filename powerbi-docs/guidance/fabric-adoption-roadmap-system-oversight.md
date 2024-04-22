---
title: "Microsoft Fabric adoption roadmap: System oversight"
description: "Apply system oversight consisting of administrative activities to drive strong and successful adoption of Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/24/2023
---

# Microsoft Fabric adoption roadmap: System oversight

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

System oversight—also known as Fabric administration—is the ongoing, day-to-day, administrative activities. It's specifically concerned with:

- **Governance:** Enact governance guidelines and policies to support self-service and enterprise data and business intelligence (BI) scenarios.
- **User empowerment:** Facilitate and support the internal processes and systems that empower the internal user community to the extent possible, while adhering to the organization's regulations and requirements.
- **Adoption:** Allow for broader organizational adoption of Fabric with effective governance and data management practices.

> [!IMPORTANT]
> Your organizational [data culture](fabric-adoption-roadmap-data-culture.md) objectives provide direction for your [governance](fabric-adoption-roadmap-governance.md) decisions, which in turn dictate how [Fabric administration](/fabric/admin/microsoft-fabric-admin) activities take place and by whom.

System oversight is a broad and deep topic. The goal of this article is to introduce some of the most important considerations and actions to help you become successful with your [organizational adoption](fabric-adoption-roadmap-maturity-levels.md) objectives.

## Fabric administrators

The Fabric administrator role is a defined role in Microsoft 365, which delegates a [subset](/power-platform/admin/use-service-admin-role-manage-tenant#service-administrator-permission-matrix) of management activities. Global Microsoft 365 administrators are implicitly Fabric administrators. Power Platform administrators are also implicitly Fabric administrators.

A key governance decision is who to assign as a Fabric administrator. It's a centralized role that affects your entire [tenant](powerbi-implementation-planning-tenant-setup.md). Ideally, there are [two to four people in the organization](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#security-guidelines-for-assigning-roles) who are capable of managing Fabric. Your administrators should operate in close coordination with the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md).

### High privilege role

The Fabric administrator role is a high privilege role because:

- **User experience:** Settings that are managed by a Fabric administrator have a significant effect on user capabilities and user experience. For more information, see [Govern tenant settings](powerbi-implementation-planning-tenant-administration.md#govern-tenant-settings).
- **Full security access:** Fabric administrators can update access permissions for workspaces in the tenant. The result is that an administrator can allow permission to view or download data and reports as they see fit. For more information, see [Govern tenant settings](powerbi-implementation-planning-tenant-administration.md#govern-tenant-settings).
- **Personal workspace access:** Fabric administrators can access contents and govern the [personal workspace](/power-bi/admin/service-admin-portal-workspaces#govern-my-workspaces) of any user.
- **Metadata:** Fabric administrators can view all tenant metadata, including all user activities that occur in the Fabric portal (described in the [Auditing and monitoring](#auditing-and-monitoring) section below).

> [!IMPORTANT]
> Having too many Fabric administrators is a risk. It increases the probability of unapproved, unintended, or inconsistent management of the tenant.

### Roles and responsibilities

The types of activities that an administrator will do on a day-to-day basis will differ between organizations. What's important, and given priority in your data culture, will heavily influence [what an administrator does](powerbi-implementation-planning-tenant-administration.md#define-scope-of-responsibilities) to support business-led self-service, managed self-service, and enterprise data and BI scenarios. For more information, see the [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article.

> [!TIP]
> The best type of person to serve as a Fabric administrator is one who has enough knowledge about the tools and workloads to understand what self-service users need to accomplish. With this understanding, the administrator can balance user empowerment and governance.

In addition to the [Fabric administrator](/admin/service-admin-administering-power-bi-in-your-organization#administrator-roles-related-to-power-bi), there are other roles which use the term _administrator_. The following table describes the roles that are commonly and regularly used.

| **Role** | **Scope** | **Description** |
| --- | --- | --- |
| Fabric administrator | Tenant | Manages tenant settings and other settings in the Fabric portal. All general references to _administrator_ in this article refer to this type of administrator. |
| Capacity administrator | One capacity | Manages workspaces and workloads, and monitors the health of a Fabric capacity. |
| Data gateway administrator | One gateway | Manages gateway data source configuration, credentials, and users assignments. Might also handle gateway software updates (or collaborate with infrastructure team on updates). |
| Workspace administrator | One workspace | Manages workspace settings and access. |

The Fabric ecosystem of workloads is broad and deep. There are many ways that Fabric integrates with other systems and platforms. From time to time, it'll be necessary to work with other administrators and IT professionals. For more information, see [Collaborate with other administrators](powerbi-implementation-planning-tenant-administration.md#collaborate-with-other-administrators).

The remainder of this article provides an overview of the most common activities that a Fabric administrator does. It focuses on activities that are important to carry out effectively when taking a strategic approach to [organizational adoption](fabric-adoption-roadmap.md).

## Service management

Overseeing the tenant is a crucial aspect to ensure that all users have a good experience with Power BI. A few of the key governance responsibilities of a Fabric administrator include:

- **Tenant settings:** Control which Power BI features and capabilities are enabled, and for which users in your organization.
- **Domains:** Group together two or more workspaces that have similar characteristics.
- **Workspaces:** Review and manage workspaces in the tenant.
- **Embed codes:** Govern which reports have been published publicly on the internet.
- **Organizational visuals:** Register and manage organizational visuals.
- **Azure connections:** Integrate with Azure services to provide additional functionality.

For more information, see [Tenant administration](powerbi-implementation-planning-tenant-administration.md).

## User machines and devices

The adoption of Fabric depends directly on content creators and consumers having the tools and applications they need. Here are some important questions to consider.

- How will users request access to new tools? Will access to licenses, data, and training be available to help users use tools effectively?
- How will content consumers view content that's been published by others?
- How will content creators develop, manage, and publish content? What's your criteria for deciding which tools and applications are appropriate for which use cases?
- How will you install and set up tools? Does that include related prerequisites and data connectivity components?
- How will you manage ongoing updates for tools and applications?

For more information, see [User tools and devices](powerbi-implementation-planning-user-tools-devices.md).

## Architecture

In the context of Fabric, architecture relates to data architecture, capacity management, and data gateway architecture and management.

### Data architecture

_Data architecture_ refers to the principles, practices, and methodologies that govern and define what data is collected, and how it's ingested, stored, managed, integrated, modeled, and used.

There are many data architecture decisions to make. Frequently the COE engages in data architecture design and planning. It's common for administrators to get involved as well, especially when they manage databases or Azure infrastructure.

> [!IMPORTANT]
> Data architecture decisions have a significant impact on Fabric adoption, user satisfaction, and individual project success rates.

A few data architecture considerations that affect adoption include:

- Where does Fabric fit into the organization's entire data architecture? Are there other existing components such as an enterprise data warehouse (EDW) or a data lake that will be important to factor into plans?
- Is Fabric used end-to-end for data preparation, data modeling, and data presentation or is Fabric used for only some of those capabilities?
- Are [managed self-service](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service) patterns followed to find the best balance between data reusability and report creator flexibility?
- Where will users consume the content? Generally, the three main ways to deliver content are: the Fabric portal, Power BI Report Server, and embedded in custom applications. Additionally, [Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/) is a convenient alternative for users who spend a lot of time in Teams.
- Who is responsible for managing and maintaining the data architecture? Is it a centralized team, or a decentralized team? How is the [COE](fabric-adoption-roadmap-center-of-excellence.md) represented in this team? Are certain skillsets required?
- What [data sources](/power-bi/connect-data/desktop-data-sources) are the most important? What types of data will we be acquiring?
- What [semantic model connectivity mode](/power-bi/connect-data/service-dataset-modes-understand) and [storage mode](/power-bi/transform-model/desktop-storage-mode) choices (for example, Direct Lake, import, live connection, DirectQuery, or composite model frameworks) are the best fit for the use cases?
- To what extent is data reusability encouraged using [lakehouses](/fabric/data-engineering/lakehouse-overview), [warehouses](/fabric/data-warehouse/data-warehousing), and [shared semantic models](/power-bi/connect-data/desktop-report-lifecycle-datasets)?
- To what extent is the reusability of data preparation logic and advanced data preparation encouraged by using [data pipelines](/fabric/data-factory/data-factory-overview#data-pipelines), [notebooks](/fabric/data-engineering/how-to-use-notebook), and [dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service)?

It's important for administrators to become fully aware of Fabric's technical capabilities—as well as the needs and goals of their stakeholders—before they make architectural decisions.

> [!TIP]
> Get into the good habit of completing a technical proof of concept (POC) to test out assumptions and ideas. Some organizations also call them _micro-projects_ when the goal is to deliver a small unit of work. The goal of a POC is to address unknowns and reduce risk as early as possible. A POC doesn't have to be throwaway work, but it should be narrow in scope. Best practices reviews, as described in the [Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) article, are another useful way to help content creators with important architectural decisions.

### Capacity management

[Capacity](/fabric/enterprise/licenses#capacity-and-skus) includes features and capabilities to deliver analytics solutions at scale. There are two types of Fabric [organizational licenses](/fabric/enterprise/licenses#organizational-licenses): Premium per User (PPU) and capacity. There are several types of [capacity licenses](/fabric/enterprise/licenses#workspace). The type of capacity license determines which Fabric workloads are supported.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

The use of capacity can play a significant role in your strategy for creating, managing, publishing, and distributing content. A few of the top reasons to invest in capacity include:

- [Unlimited Power BI content distribution](/power-bi/enterprise/service-premium-what-is#unlimited-content-sharing) to large numbers of read-only users. Content consumption by users with a free Power BI license is available in Premium capacity only, not PPU. Content consumption by free users is also available with an F64 Fabric capacity license or higher.
- Access to [Fabric experiences](/fabric/enterprise/licenses#workspace) for producing end-to-end analytics.
- [Deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) to manage the publication of content to development, test, and production workspaces. They're highly recommended for critical content to improve release stability.
- [XMLA endpoint](/power-bi/enterprise/service-premium-connect-tools), which is an industry standard protocol for managing and publishing a semantic model, or querying the semantic model from any XMLA-compliant tool.
- Increased model size limits, including [large semantic model](/power-bi/enterprise/service-premium-large-models) support.
- More frequent [data refreshes](/power-bi/connect-data/refresh-data#power-bi-refresh-types).
- [Storage of data](powerbi-implementation-planning-tenant-setup.md#location-for-data-storage) in a specific geographic area that's different from the home region.

The above list isn't all-inclusive. For a complete list, see [Power BI Premium features](/power-bi/enterprise/service-premium-features).

#### Manage Fabric capacity

Overseeing the health of Fabric capacity is an essential ongoing activity for administrators. Each capacity SKU includes a set of resources. Capacity units (CUs) are used to measure compute resources for each SKU.

> [!CAUTION]
> Lack of management, and consistently exceeding the limits of your capacity resources can often result in performance challenges and user experience challenges. Both challenges, if not managed correctly, can contribute to negative impact on adoption efforts.

Suggestions for managing Fabric capacity:

- Define who is responsible for managing the capacity. Confirm the roles and responsibilities so that it's clear what action will be taken, why, when, and by whom.
- Create a specific set of criteria for content that will be published to capacity. It's especially relevant when a single capacity is used by multiple business units because the potential exists to disrupt other users if the capacity isn't well-managed. Consider requiring a [best practices review](fabric-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews) (such as reasonable semantic model size and efficient calculations) before publishing new content to a production capacity.
- Regularly use the [Fabric capacity metrics app](/fabric/enterprise/metrics-app) to understand resource utilization and patterns for the capacity. Most importantly, look for consistent patterns of overutilization, which will contribute to user disruptions. An analysis of usage patterns should also make you aware if the capacity is underutilized, indicating more value could be gained from the investment.
- Set the [tenant setting](/power-bi/support/service-interruption-notifications#enable-notifications) so Fabric notifies you if the [capacity becomes overloaded](https://powerbi.microsoft.com/blog/announcing-timely-premium-capacity-overload-alerts/), or if an outage or incident occurs.

#### Autoscale

[Autoscale](/power-bi/enterprise/service-premium-auto-scale) is intended to handle occasional or unexpected bursts in capacity usage levels. Autoscale can respond to these bursts by automatically increasing CPU resources to support the increased workload.

Automated scaling up reduces the risk of performance and user experience challenges in exchange for a financial impact. If the capacity isn't well-managed, autoscale might trigger more often than expected. In this case, the [metrics app](/fabric/enterprise/metrics-app) can help you to determine underlying issues and do capacity planning.

#### Decentralized capacity management

Capacity administrators are responsible for [assigning workspaces](/power-bi/enterprise/service-admin-premium-manage#assign-a-workspace-to-a-capacity) to a specific capacity.

Be aware that workspace administrators can also assign a workspace to PPU if the workspace administrator possesses a PPU license. However, it would require that all other workspace users must also have a PPU license to collaborate on, or view, Power BI content in the workspace. Other Fabric workloads can't be included in a workspace assigned to PPU.

It's possible to set up multiple capacities to facilitate decentralized management by different business units. Decentralizing management of certain aspects of Fabric is a great way to balance agility and control.

Here's an example that describes one way you could manage your capacity.

- [Purchase](/power-bi/enterprise/service-admin-premium-purchase) a P3 capacity node in Microsoft 365. It includes 32 virtual cores (v-cores).
- Use 16 v-cores to create the first capacity. It will be used by the Sales team.
- Use 8 v-cores to create the second capacity. It will be used by the Operations team.
- Use the remaining 8 v-cores to create the third capacity. It will support general use.

The previous example has several advantages.

- Separate [capacity administrators](/power-bi/enterprise/service-admin-premium-manage#manage-user-permissions) can be set up for each capacity. Therefore, it facilitates decentralized management situations.
- If a capacity isn't well-managed, the effect is confined to that capacity only. The other capacities aren't impacted.
- Billing and chargebacks to other business units are straightforward.
- Different workspaces can be easily assigned to the separate capacities.

However, the previous example has disadvantages, too.

- The [limits per capacity](/power-bi/enterprise/service-premium-what-is#capacity-nodes) are lower. The maximum memory size allowed for semantic models isn't the entire P3 capacity node size that was purchased. Rather, it's the assigned capacity size where the semantic model is hosted.
- It's more likely one of the smaller capacities will need to be scaled up at some point in time.
- There are more capacities to manage in the tenant.

> [!NOTE]
> Resources for Power BI Premium per Capacity are referred to as v-cores. However, a Fabric capacity refers to them as capacity units (CUs). The scale for CUs and v-cores is different for each SKU. For more information, see the [Fabric licensing](/fabric/enterprise/licenses#capacity-and-skus) documentation.

### Data gateway architecture and management

A [data gateway](/power-bi/connect-data/service-gateway-onprem) facilitates the secure and efficient transfer of data between organizational data sources and the Fabric service. A data gateway is needed for data connectivity to on-premises or cloud services when a data source is:

- Located within the enterprise data center.
- Configured behind a firewall.
- Within a virtual network.
- Within a virtual machine.

There are three types of gateways.

- **On-premises data gateway (standard mode)** is a gateway service that supports connections to registered data sources for many users to use. The gateway software installations and updates are installed on a machine that's managed by the customer.
- **On-premises data gateway (personal mode)** is a gateway service that supports data refresh only. This gateway mode is typically installed on the PC of a content creator. It supports use by one user only. It doesn't support live connection or DirectQuery connections.
- **Virtual network data gateway** is a Microsoft managed service that supports connectivity for many users. Specifically, it supports connectivity for semantic models and dataflows stored in workspaces assigned to Premium capacity or Premium Per User.

> [!TIP]
> The decision of [who can install gateway software](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) is a governance decision. For most organizations, use of the data gateway in standard mode, or a virtual network data gateway, should be strongly encouraged. They're far more scalable, manageable, and auditable than data gateways in personal mode.

#### Decentralized gateway management

The On-premises data gateway (standard mode) and Virtual network data gateway support specific data source types that can be registered, together with connection details and how credentials are stored. Users can be granted permission to use the gateway data source so that they can schedule a refresh or run DirectQuery queries.

Certain aspects of gateway management can be done effectively on a decentralized basis to balance agility and control. For example, the Operations group might have a gateway dedicated to its team of self-service content creators and data owners.

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

Every user needs a commercial license, which is integrated with a Microsoft Entra identity. The user license could be Free, Pro, or Premium Per User (PPU).

A user license is obtained via a subscription, which authorizes a certain number of licenses with a start and end date.

> [!NOTE]
> Although each user requires a license, a Pro or PPU license is only required to share Power BI content. Users with a free license can create and share Fabric content other than Power BI items.

There are two approaches to procuring subscriptions.

- **Centralized:** Microsoft 365 billing administrator purchases a subscription for [Pro or PPU](https://powerbi.microsoft.com/pricing/). It's the most common way to manage subscriptions and assign licenses.
- **Decentralized:** Individual departments purchase a subscription via [self-service purchasing](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide&preserve-view=true).

### Self-service purchasing

An important [governance](fabric-adoption-roadmap-governance.md) decision relates to what extent self-service purchasing will be allowed or encouraged.

Self-service purchasing is useful for:

- Larger organizations with decentralized business units that have purchasing authority and want to handle payment directly with a credit card.
- Organizations that intend to make it as easy as possible to purchase subscriptions on a monthly commitment.

Consider disabling self-service purchasing when:

- Centralized procurement processes are in place to meet regulatory, security, and governance requirements.
- Discounted pricing is obtained through an Enterprise Agreement (EA).
- Existing processes are in place to handle intercompany chargebacks.
- Existing processes are in place to handle [group-based](/azure/active-directory/enterprise-users/licensing-groups-assign) licensing assignments.
- Prerequisites are required for obtaining a license, such as approval, justification, training, or a governance policy requirement.
- There's a valid need, such as a regulatory requirement, to control access closely.

### User license trials

Another important governance decision is whether user license trials are allowed. By default, trials are enabled. That means when content is shared with a colleague, if the recipient doesn't have a Pro or PPU license, they'll be prompted to start a trial to view the content (if the content doesn't reside within a workspace backed by capacity). The trial experience is intended to be a convenience that allows users to continue with their normal workflow.

Generally, disabling trials isn't recommended. It can encourage users to seek workarounds, perhaps by exporting data or working outside of supported tools and processes.

Consider disabling trials only when:

- There are serious cost concerns that would make it unlikely to grant full licenses at the end of the trial period.
- Prerequisites are required for obtaining a license (such as approval, justification, or a training requirement). It's not sufficient to meet this requirement during the trial period.
- There's a valid need, such as a regulatory requirement, to control access to the Fabric service closely.

> [!TIP]
> Don't introduce too many barriers to obtaining a Fabric license. Users who need to get work done will find a way, and that way might involve workarounds that aren't ideal. For instance, without a license to use Fabric, people might rely far too much on sharing files on a file system or via email when significantly better approaches are available.

## Cost management

Managing and optimizing the cost of cloud services, like Fabric, is an important activity. Here are several activities you can consider.

- Analyze who is using—and, more to the point, not using—their allocated Fabric licenses and make necessary adjustments. Fabric usage is analyzed using the [activity log](/power-bi/enterprise/service-admin-auditing).
- Analyze the cost effectiveness of [capacity](/power-bi/enterprise/service-premium-what-is) or [Premium Per User](/power-bi/enterprise/service-premium-per-user-faq#using-premium-per-user--ppu-). In addition to the [additional features](/power-bi/enterprise/service-premium-per-user-faq#using-premium-per-user--ppu-), perform a cost/benefit analysis to determine whether capacity licensing is more cost-effective when there are a large number of consumers.
- Carefully [monitor and manage Fabric capacity](/fabric/enterprise/metrics-app). Understanding usage patterns over time will allow you to predict when to purchase [more capacity](/power-bi/enterprise/service-premium-what-is#capacity-nodes). For example, you might choose to scale up a single capacity from a P1 to P2, or scale out from one P1 capacity to two P1 capacities.
- If there are occasional spikes in the level of usage, use of [autoscale](/power-bi/enterprise/service-premium-auto-scale) with Fabric is recommended to ensure the user experience isn't interrupted. Autoscale will scale up capacity resources for 24 hours, then scale them back down to normal levels (if sustained activity isn't present). Manage autoscale cost by constraining the maximum number of v-cores, and/or with spending limits set in Azure. Due to the pricing model, autoscale is best suited to handle occasional unplanned increases in usage.
- For Azure data sources, co-locate them in the same region as your Fabric tenant whenever possible. It will avoid incurring [Azure egress charges](https://azure.microsoft.com/pricing/details/bandwidth/). Data egress charges are minimal, but at scale can add up to be considerable unplanned costs.

## Security, information protection, and data loss prevention

Security, information protection, and data loss prevention (DLP) are joint responsibilities among all content creators, consumers, and administrators. That's no small task because there's sensitive information everywhere: personal data, customer data, or customer-authored data, protected health information, intellectual property, proprietary organizational information, just to name a few. Governmental, industry, and contractual regulations could have a significant impact on the [governance](fabric-adoption-roadmap-governance.md) guidelines and policies that you create related to security.

The [Power BI security whitepaper](whitepaper-powerbi-security.md) is an excellent resource for understanding the breadth of considerations, including aspects that Microsoft manages. This section will introduce several topics that customers are responsible for managing.

### User responsibilities

Some organizations ask Fabric users to accept a self-service user acknowledgment. It's a document that explains the user's responsibilities and expectations for safeguarding organizational data.

One way to automate its implementation is with a [Microsoft Entra terms of use policy](/azure/active-directory/conditional-access/terms-of-use). The user is required to view and agree to the policy before they're permitted to visit the Fabric portal for the first time. You can also require it to be acknowledged on a recurring basis, like an annual renewal.

### Data security

In a [cloud shared responsibility model](/azure/security/fundamentals/shared-responsibility), securing the data is always the responsibility of the customer. With a self-service data platform, self-service content creators have responsibility for properly securing the content that they shared with colleagues.

The COE should provide [documentation and training](fabric-adoption-roadmap-mentoring-and-user-enablement.md) where relevant to assist content creators with best practices (particularly situations for dealing with ultra-sensitive data).

Administrators can help by following best practices themselves. Administrators can also raise concerns when they see issues that could be discovered when [managing workspaces](/power-bi/admin/service-admin-portal-workspaces), [auditing user activities](/power-bi/enterprise/service-admin-auditing), or managing [gateway credentials and users](/power-bi/connect-data/service-gateway-data-sources#add-a-data-source). There are also several [tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings) that are usually restricted except for a few users (for instance, the ability to [publish to web](/power-bi/admin/service-admin-portal-export-sharing#publish-to-web) or the ability to [publish apps to the entire organization](/fabric/admin/service-admin-portal-app#publish-apps-to-the-entire-organization)).

### External guest users

External users—such as partners, customers, vendors, and consultants—are a common occurrence for some organizations, and rare for others. How you handle external users is a governance decision.

External user access is controlled by [tenant settings](/power-bi/admin/service-admin-portal-export-sharing) and certain Microsoft Entra ID settings. For details of external user considerations, review the [Distribute Power BI content to external guest users using Microsoft Entra B2B](whitepaper-azure-b2b-power-bi.md) whitepaper.

### Information protection and data loss prevention

Fabric supports capabilities for information protection and data loss prevention (DLP) in the following ways.

- **Information protection:** [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) (formerly known as Microsoft Information Protection) includes capabilities for discovering, classifying, and protecting data. A key principle is that data can be better protected once it's been classified. The key building block for classifying data is [sensitivity labels](/power-bi/enterprise/service-security-sensitivity-label-overview). For more information, see [Information protection for Power BI planning](powerbi-implementation-planning-info-protection.md).
- **Data loss prevention for Power BI:** Microsoft Purview Data Loss Prevention (formerly known as Office 365 Data Loss Prevention) supports [DLP policies for Power BI](/power-bi/enterprise/service-security-dlp-policies-for-power-bi). By using sensitivity labels or sensitive information types, DLP policies for Power BI help an organization locate sensitive semantic models. For more information, see [Data loss prevention for Power BI planning](powerbi-implementation-planning-data-loss-prevention.md).
- **Microsoft Defender for Cloud Apps:** [Microsoft Defender for Cloud Apps](/fabric/governance/service-security-using-defender-for-cloud-apps-controls) (formerly known as Microsoft Cloud App Security) supports policies that help protect data, including real-time controls when users interact with the Power BI service. For more information, see [Defender for Cloud Apps for Power BI planning](powerbi-implementation-planning-defender-for-cloud-apps.md).

### Data residency

For organizations with requirements to store data within a geographic region, Fabric capacity can be [set for a specific region](whitepaper-powerbi-security.md#data-residency) that's different from the home region of the Fabric tenant.

### Encryption keys

Microsoft handles encryption of _data at rest_ in Microsoft data centers with transparent server-side encryption and auto-rotation of certificates. For customers with regulatory requirements to [manage the Premium encryption key themselves](/power-bi/enterprise/service-encryption-byok), Premium capacity can be configured to use [Azure Key Vault](/azure/key-vault/general/basic-concepts). Using customer-managed keys—also known as _bring-your-own-key_ or _BYOK_—is a precaution to ensure that, in the event of a human error by a service operator, customer data can't be exposed.

Be aware that [Premium Per User (PPU)](/power-bi/enterprise/service-premium-per-user-faq#using-premium-per-user--ppu-) only supports BYOK when it's enabled for the entire Fabric tenant.

## Auditing and monitoring

It's critical that you make use of auditing data to analyze adoption efforts, understand usage patterns, educate users, support users, mitigate risk, improve compliance, manage license costs, and monitor performance. For more information about why auditing your data is valuable, see [Auditing and monitoring overview](powerbi-implementation-planning-auditing-monitoring-overview.md).

There are different ways to approach auditing and monitoring depending on your role and your objectives. The following articles describe various considerations and planning activities.

- **[Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md):** Techniques that report creators can use to understand which users are using the reports that they create, publish, and share.
- **[Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md):** Methods that data creators can use to track the performance and usage patterns of data assets that they create, publish, and share.
- **[Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md):** Key decisions and actions administrators can take to create an end-to-end auditing solution.
- **[Tenant-level monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md):** Tactical actions administrators can take to monitor the Power BI service, including updates and announcements.

## REST APIs

The [Power BI REST APIs](/rest/api/power-bi/) and the [Fabric REST APIs](/rest/api/fabric/) provide a wealth of information about your Fabric tenant. Retrieving data by using the REST APIs should play an important role in managing and governing a Fabric implementation. For more information about planning for the use of REST APIs for auditing, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-overview.md).

You can retrieve auditing data to build an auditing solution, manage content programmatically, or increase the efficiency of routine actions. The following table presents some actions you can perform with the REST APIs.

| **Action** | **Documentation resource(s)** |
|---|---|
| Audit user activities | [REST API to get activity events](/rest/api/power-bi/admin/get-activity-events) |
| Audit workspaces, items, and permissions | [Collection of asynchronous metadata scanning REST APIs to obtain a tenant inventory](/fabric/governance/metadata-scanning-overview) |
| Audit content shared to entire organization | [REST API to check use of widely shared links](/rest/api/power-bi/admin/widely-shared-artifacts-links-shared-to-whole-organization) |
| Audit tenant settings | [REST API to check tenant settings](/rest/api/fabric/admin/tenants/get-tenant-settings) |
| Publish content | [REST API to deploy items from a deployment pipeline](/rest/api/power-bi/pipelines/selective-deploy) or [clone a report to another workspace](/rest/api/power-bi/reports/clone-report-in-group) |
| Manage content | [REST API to refresh a semantic model](/rest/api/power-bi/datasets/refresh-dataset-in-group) or [take over ownership of a semantic model](/rest/api/power-bi/datasets/take-over-in-group) |
| Manage gateway data sources | [REST API to update credentials for a gateway data source](/rest/api/power-bi/gateways/update-datasource) |
| Export content | [REST API to export a report](/rest/api/power-bi/reports/export-report-in-group) |
| Create workspaces | [REST API to create a new workspace](/rest/api/power-bi/groups/create-group) |
| Manage workspace permissions | [REST API to assign user permissions to a workspace](/rest/api/power-bi/groups/update-group-user) |
| Update workspace name or description | [REST API to update workspace attributes](/rest/api/power-bi/admin/groups-update-group-as-admin) |
| Restore a workspace | [REST API to restore a deleted workspace](/rest/api/power-bi/admin/groups-restore-deleted-group-as-admin) |
| Programmatically retrieve a query result from a semantic model | [REST API to run a DAX query against a semantic model](/rest/api/power-bi/datasets/execute-queries-in-group) |
| Assign workspaces to capacity | [REST API to assign workspaces to capacity](/rest/api/power-bi/admin/capacities-assign-workspaces-to-capacity) |
| Programmatically change a data model | [Tabular Object Model (TOM) API](/analysis-services/tom/tom-pbi-datasets) |
| Embed Power BI content in custom applications | [Power BI embedded analytics client APIs](/javascript/api/overview/powerbi/) |

> [!TIP]
> There are many other Power BI REST APIs. For a complete list, see [Using the Power BI REST APIs](/rest/api/power-bi/).

## Planning for change

Every month, Microsoft releases new Fabric features and capabilities. To be effective, it's crucial that everyone involved with system oversight stays current. For more information, see [Tenant-level monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md).

> [!IMPORTANT]
> Don't underestimate the importance of staying current. If you get a few months behind on announcements, it can become difficult to properly manage Fabric and support your users.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Considerations and key actions you can take for system oversight follow.

**Improve system oversight:**

> [!div class="checklist"]
> - **Verify who is permitted to be a Fabric administrator:** If possible, reduce the number of people granted the Fabric administrator role if it's more than a few people.
> - **Use PIM for occasional administrators:** If you have people who _occasionally_ need Fabric administrator rights, consider implementing [Privileged Identity Management](/azure/active-directory/privileged-identity-management/pim-configure) (PIM) in Microsoft Entra ID. It's designed to assign just-in-time role permissions that expire after a few hours.
> - **Train administrators:** Check the status of cross-training and documentation in place for handling Fabric administration responsibilities. Ensure that a backup person is trained so that needs can be met timely, in a consistent way.

**Improve management of the Fabric service:**

> [!div class="checklist"]
> - **Review tenant settings:** Conduct a review of all tenant settings to ensure they're aligned with [data culture](fabric-adoption-roadmap-data-culture.md) objectives and [governance](fabric-adoption-roadmap-governance.md) guidelines and policies. Verify which groups are assigned for each setting.
> - **Document the tenant settings:** Create documentation of your tenant settings for the internal Fabric community and post it in the centralized portal. Include which groups a user would need to request to be able to use a feature. Use the [Get Tenant Settings REST API](/rest/api/fabric/admin/tenants/get-tenant-settings) to make the process more efficient, and to create snapshots of the settings on a regular basis.
> - **Customize the _Get Help_ links:** When user resources are established, as described in the [Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) article, update the [tenant setting](/fabric/admin/service-admin-portal-help-support) to customize the links under the _Get Help_ menu option. It will direct users to your documentation, community, and help.

**Improve management of user machines and devices:**

> [!div class="checklist"]
> - **Create a consistent onboarding process:** Review your process for how onboarding of new content creators is handled. Determine if new requests for software, such as Power BI Desktop, and user licenses (Free, Pro, or PPU) can be handled together. It can simplify onboarding since new content creators won't always know what to ask for.
> - **Handle user machine updates:** Ensure an automated process is in place to install and update software, drivers, and settings to ensure all users have the same version.

**Data architecture planning:**

> [!div class="checklist"]
> - **Assess what your end-to-end data architecture looks like:** Make sure you're clear on:
>   - How Fabric is currently used by the different business units in your organization versus how you want Fabric to be used. Determine if there's a gap.
>   - If there are any risks that should be addressed.
>   - If there are any high-maintenance situations to be addressed.
>   - What data sources are important for Fabric users, and how they're documented and discovered.
> - **Review existing data gateways:** Find out what gateways are being used throughout your organization. Verify that gateway administrators and users are set correctly. Verify who is supporting each gateway, and that there's a reliable process in place to keep the gateway servers up to date.
> - **Verify use of personal gateways:** Check the number of personal gateways that are in use, and by whom. If there's significant usage, take steps to move towards use of the standard mode gateway.

**Improve management of user licenses:**

> [!div class="checklist"]
> - **Review the process to request a user license:** Clarify what the process is, including any prerequisites, for users to obtain a license. Determine whether there are improvements to be made to the process.
> - **Determine how to handle self-service license purchasing:** Clarify whether self-service licensing purchasing is enabled. Update the settings if they don't match your intentions for how licenses can be purchased.
> - **Confirm how user trials are handled:** Verify user license trials are enabled or disabled. Be aware that all user trials are Premium Per User. They apply to Free licensed users signing up for a trial, and Pro users signing up for a Premium Per User trial.

**Improve cost management:**

> [!div class="checklist"]
> - **Determine your cost management objectives:** Consider how to balance cost, features, usage patterns, and effective utilization of resources. Schedule a routine process to evaluate costs, at least annually.
> - **Obtain activity log data:** Ensure you have access to the activity log data to assist with cost analysis. It can be used to understand who is—or isn't—using the license assigned to them.

**Improve security and data protection:**

> [!div class="checklist"]
> - **Clarify exactly what the expectations are for data protection:** Ensure the expectations for data protection, such as how to use sensitivity labels, are documented and communicated to users.
> - **Determine how to handle external users:** Understand and document the organizational policies around sharing Fabric content with external users. Ensure that settings in Fabric support your policies for external users.
> - **Set up monitoring:** Investigate the use of Microsoft Defender for Cloud Apps to monitor user behavior and activities in Fabric.

**Improve auditing and monitoring:**

> [!div class="checklist"]
> - **Plan for auditing needs:** Collect and document the key business requirements for an auditing solution. Consider your priorities for auditing and monitoring. Make key decisions related to the type of auditing solution, permissions, technologies to be used, and data needs. Consult with IT to clarify what auditing processes currently exist, and what preferences of requirements exist for building a new solution.
> - **Consider roles and responsibilities:** Identify which teams will be involved in building an auditing solution, as well as the ongoing analysis of the auditing data.
> - **Extract and store user activity data:** If you aren't currently extracting and storing the raw data, begin retrieving [user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#user-activity-data).
> - **Extract and store snapshots of tenant inventory data:** Begin retrieving metadata to build a [tenant inventory](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#tenant-inventory), which describes all workspaces and items.
> - **Extract and store snapshots of users and groups data:** Begin retrieving metadata about [users, groups, and service principals](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#users-and-groups-data).
> - **Create a curated data model:** Perform data cleansing and transformations of the raw data to create a curated data model that'll support analytical reporting for your auditing solution.
> - **Analyze auditing data and act on the results:** Create analytic reports to analyze the curated auditing data. Clarify what actions are expected to be taken, by whom, and when.
> - **Include additional auditing data:** Over time, determine whether other auditing data would be helpful to complement the activity log data, such as [security data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#security-data).

> [!TIP]
> For more information, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

**Use the REST APIs:**

> [!div class="checklist"]
> - **Plan for your use of the REST APIs:** Consider what data would be most useful to retrieve from the Power BI REST APIs and the Fabric REST APIs.
> - **Conduct a proof of concept:** Do a small proof of concept to validate data needs, technology choices, and permissions.

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess system oversight.

- Are there atypical administration settings enabled or disabled? For example, is the entire organization allowed to publish to web (we strongly advise restricting this feature).
- Do administration settings and policies align with, or inhibit, business the way user work?
- Is there a process in place to critically appraise new settings and decide how to set them? Alternatively, are only the most restrictive settings set as a precaution?
- Are Microsoft Entra security groups used to manage who can do what?
- Do central teams have visibility of effective [auditing and monitoring](powerbi-implementation-planning-auditing-monitoring-overview.md) tools?
- Do monitoring solutions depict information about the data assets, user activities, or both?
- Are auditing and monitoring tools actionable? Are there clear thresholds and actions set, or do monitoring reports simply describe what's in the data estate?
- Is [Azure Log Analytics](/power-bi/transform-model/log-analytics/desktop-log-analytics-overview) used (or planned to be used) for detailed monitoring of Fabric capacities? Are the potential benefits and cost of Azure Log Analytics clear to decision makers?
- Are sensitivity labels and data loss prevention policies used? Are the potential benefits and cost of these clear to decision makers?
- Do administrators know the current number of licenses and licensing cost? What proportion of the total BI spend goes to Fabric capacity, and to Pro and PPU licenses? If the organization is only using Pro licenses for Power BI content, could the number of users and usage patterns warrant a cost-effective switch to Power BI Premium or Fabric capacity?

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your Power BI system oversight.

| **Level** | **State of system oversight** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Tenant settings are configured independently by one or more administrators based on their best judgment. <br/><br/>&bull;&nbsp;Architecture needs, such as gateways and capacities, are satisfied on an as-needed basis. However, there isn't a strategic plan. <br/><br/>&bull;&nbsp;Fabric activity logs are unused, or selectively used for tactical purposes. |
| 200: Repeatable | &bull;&nbsp;The tenant settings purposefully align with established governance guidelines and policies. All tenant settings are reviewed regularly. <br/><br/>&bull;&nbsp;A small number of specific administrators are selected. All administrators have a good understanding of what users are trying to accomplish in Fabric, so they're in a good position to support users. <br/><br/>&bull;&nbsp;A well-defined process exists for users to request licenses and software. Request forms are easy for users to find. Self-service purchasing settings are specified. <br/><br/>&bull;&nbsp;Sensitivity labels are configured in Microsoft 365. However, use of labels remains inconsistent. The advantages of data protection aren't well understood by users. |
| 300: Defined | &bull;&nbsp;The tenant settings are fully documented in the centralized portal for users to reference, including how to request access to the correct groups. <br/><br/>&bull;&nbsp;Cross-training and documentation exist for administrators to ensure continuity, stability, and consistency. <br/><br/>&bull;&nbsp;Sensitivity labels are assigned to content consistently. The advantages of using sensitivity labels for data protection are understood by users. <br/><br/>&bull;&nbsp;An automated process is in place to export Fabric activity log and API data to a secure location for reporting and auditing. |
| 400: Capable | &bull;&nbsp;Administrators work closely with the COE and governance teams to provide oversight of Fabric. A balance of user empowerment and governance is successfully achieved. <br/><br/>&bull;&nbsp;Decentralized management of data architecture (such as gateways or capacity management) is effectively handled to balance agility and control. <br/><br/>&bull;&nbsp;Automated policies are set up and actively monitored in Microsoft Defender for Cloud Apps for data loss prevention. <br/><br/>&bull;&nbsp;Activity log and API data is actively analyzed to monitor and audit Fabric activities. Proactive action is taken based on the data. |
| 500: Efficient | &bull;&nbsp;The Fabric administrators work closely with the COE actively stay current. Blog posts and release plans from the Fabric product team are reviewed frequently to plan for upcoming changes. <br/><br/>&bull;&nbsp;Regular cost management analysis is done to ensure user needs are met in a cost-effective way. <br/><br/>&bull;&nbsp;The Fabric REST API is used to retrieve tenant setting values on a regular basis. <br/><br/>&bull;&nbsp;Activity log and API data is actively used to inform and improve adoption and governance efforts. |

## Related content

For more information about system oversight and Fabric administration, see the following resources.

- [Administer Microsoft Fabric](/training/modules/administer-fabric/)
- [Administer Power BI - Part 1](/training/paths/administer-power-bi-part-1/)
- [Administer Power BI - Part 2](/training/paths/administer-power-bi-part-2/)
- [Administrator in a Day Training – Day 1](https://aka.ms/AdmPBI1)
- [Administrator in a Day Training – Day 2](https://aka.ms/AdmPBI2)
- [Power BI security whitepaper](whitepaper-powerbi-security.md)
- [External guest users whitepaper](whitepaper-azure-b2b-power-bi.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)

In the [next article](fabric-adoption-roadmap-change-management.md) in the Microsoft Fabric adoption roadmap series, learn about effective change management.
