---
title: "Power BI adoption roadmap: System oversight"
description: Apply system oversight consisting of administrative activities to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: System oversight

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

System oversight—also known as Power BI administration—is the ongoing, day-to-day, administrative activities that:

- Enact governance guidelines and policies to support self-service BI and enterprise BI.
- Facilitate and support the internal processes and systems that empower the internal user community to the extent possible, while adhering to the organization's regulations and requirements.
- Allow for broader organizational adoption of Power BI with effective governance and data management practices.

> [!IMPORTANT]
> Your organizational [data culture](powerbi-adoption-roadmap-data-culture.md) objectives provide direction for your [governance](powerbi-adoption-roadmap-governance.md) decisions, which in turn dictate how [Power BI administration](../admin/service-admin-administering-power-bi-in-your-organization.md) activities take place and by whom.

Administration is a broad and deep topic. The goal of this article is to introduce some of the most important considerations and actions to help you become successful with your [organizational adoption](powerbi-adoption-roadmap-maturity-levels.md) objectives.

## Power BI administrators

The Power BI administrator role is a defined role in Microsoft 365, which delegates a [subset of Power BI-specific](/power-platform/admin/use-service-admin-role-manage-tenant#service-administrator-permission-matrix) management activities. Global Microsoft 365 administrators are implicitly Power BI administrators.

A key governance decision is who to assign as a Power BI administrator. It's a centralized role which affects your entire Power BI tenant. Ideally, there are [2-4 people in the organization](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#security-guidelines-for-assigning-roles) who are capable to manage the Power BI service, and who are in close coordination with the [Center of Excellence (COE)](powerbi-adoption-roadmap-center-of-excellence.md).

### High privilege role

The Power BI administrator role is considered a high privilege role because:

- Settings that are managed by a Power BI administrator have a significant effect on user capabilities and user experience (described in the [Tenant settings](#tenant-settings) section below).
- Power BI administrators can update access permissions for any workspace (excluding personal workspaces). They can grant permission to view or download data artifacts as they see fit (described in the [Tenant settings](#tenant-settings) section below).
- Power BI administrators can view all tenant metadata, including all user activities that occur in the Power BI service (described in the [auditing and monitoring](#auditing-and-monitoring) section below).

> [!IMPORTANT]
> Having too many Power BI administrators is a risk as it increases the probability of unapproved or unintended changes.

### Roles and responsibilities

The types of activities that an administrator will do on a day-to-day basis will differ between organizations. What's important, and given priority in your [data culture](#tenant-settings), will heavily influence what an administrator does to support business-led self-service BI, managed self-service BI, and enterprise BI. For more information, see the [Content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article.

> [!TIP]
> The best type of person to assign as a Power BI administrator is one who has enough knowledge about Power BI to understand what self-service users need to accomplish.

There are several [types of Power BI administrators](../admin/service-admin-administering-power-bi-in-your-organization.md#administrator-roles-related-to-power-bi). The following table describes the roles that are used most often on a regular basis:

| **Role** | **Scope** | **Description** |
| --- | --- | --- |
| Power BI administrator | Power BI tenant | Manages tenant settings and other aspects of the Power BI service. All general references to _administrator_ in this article refer to this type of administrator. |
| Power BI Premium capacity administrator | One capacity | Manages workspaces, workloads, and monitors the health of a Premium capacity. |
| Power BI gateway administrator | One gateway | Manages gateway data source configuration, credentials, and users assignments. May also handle gateway software updates (or collaborate with infrastructure team on updates). |
| Power BI workspace administrator | One workspace | Manages workspace settings and access. |

The Power BI ecosystem is very broad and deep. There are many different ways that the Power BI service integrates with other systems and platforms. From time to time, it will be necessary to work with other system administrators and IT professionals, such as:

- Global Microsoft 365 administrator.
- Azure Active Directory administrator.
- Teams administrator.
- OneDrive administrator.
- SharePoint administrator.
- Database administrator.
- Licensing and billing administrator.
- Intune administrator.
- Desktop support team.
- Infrastructure team.
- Networking team.
- Security and compliance team.

The remainder of this article discusses the most common activities that a Power BI administrator does. It focuses on those that are important to carry out effectively when taking a strategic approach to [Power BI organizational adoption](powerbi-adoption-roadmap-overview.md).

## Service management

Overseeing the Power BI service is a crucial aspect to ensure that all users have a good experience with Power BI.

### Tenant settings

Proper management of [tenant settings](../admin/service-admin-portal.md#tenant-settings) in the Power BI service is critical. Tenant settings are the main way to control which Power BI capabilities are enabled and to which groups of users in your organization.

It's essential that tenant settings align with governance guidelines and policies, and also with how the COE makes decisions. If a Power BI administrator independently decided which settings to enable or disable, that's a clear indicator of an opportunity to improve governance processes.

> [!IMPORTANT]
> Changing the tenant settings should go through a change control process with an approval mechanism. It should document all changes, recording who made the change, when, and why.

Since content creators and consumers can easily read online about available features in Power BI, it can be very frustrating when capabilities don't function as expected. It can lead to dissatisfied users and less effective [organizational adoption, user adoption, and solution adoption](powerbi-adoption-roadmap-maturity-levels.md). Here's a list of common questions asked by confused and frustrated users:

- Why can't I create a workspace?
- Why can't I export data?
- Why doesn't my custom visual work?
- Why can't I certify a dataset?

> [!CAUTION]
> If you discover situations that aren't ideal, such as too many data exports in the activity log, resist the urge to disable the feature entirely. Prohibiting features also leads to user frustration, and worse, workarounds. Before disabling a setting, find out why users are relying on certain techniques. Perhaps a solution needs to be redesigned, or additional user education and training could mitigate the concerns. The bottom line: knowledge sharing is an effective form of governance.

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

Additional responsibilities for managing the Power BI service include:

- [Workspace management and access](../admin/service-admin-portal.md#workspaces).
- [Premium capacity and Premium Per User settings](../admin/service-admin-portal.md#capacity-settings).
- [Embed codes](../admin/service-admin-portal.md#embed-codes).
- [Organizational visuals](../admin/service-admin-portal.md#organizational-visuals).
- [Azure connections](../admin/service-admin-portal.md#azure-connections).
- [Custom branding](../admin/service-admin-portal.md#custom-branding).
- [Featured content](../admin/service-admin-portal.md#manage-featured-content).

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
| On-Premises Data Gateway (Personal Mode) | Content creators who publish datasets to the Power BI service and manage scheduled data refresh (see additional description in the [Gateway architecture and management](#gateway-architecture-and-management) section of this article). |

> [!IMPORTANT]
> Not all the listed software will be necessary for all content creators. Power BI Desktop, however, is the most common requirement and so is the starting point when in doubt.

It's very important that all content creators who collaborate with others use the same version of the software—especially Power BI Desktop, which is updated monthly. Ideally, software updates are available from the Microsoft Store or installed by an automated IT process. This way, users don't have to take any specific action to obtain updates.

Because new capabilities are continually released, software updates should be released promptly. This way, users can take advantage of the new capabilities, and their experience is aligned to documentation. It's also important to be aware of the [update channel](/deployoffice/overview-update-channels). It provides new (and updated) features for Office apps, such as Excel and Word, on a regular basis.

Other common items that may need to be installed on user machines include:

- Drivers to support data connectivity, for example, Oracle, HANA, or the Microsoft Access Database Engine.
- The [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) provider.
- [External tools](../transform-model/desktop-external-tools.md), for example, Tabular Editor, DAX Studio, or ALM Toolkit.
- [Custom data source connectors](../connect-data/desktop-connector-extensibility.md).

In addition to software installations, user machines may be managed for:

- Group policy settings. For example, settings can allow the use of [custom visuals](/admin/organizational-visuals#certified-power-bi-visuals) so that the Power BI Desktop experience aligns with the Power BI service to ensure a consistent user experience.
- Registry settings. For example, disable the Power BI Desktop [sign-in form](../admin/desktop-admin-sign-in-form.md) or [tune Query Editor performance](../create-reports/desktop-evaluation-configuration.md).

> [!TIP]
> Effective management of software, drivers, and settings can make a big difference to the user experience, and that can translate to increased [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages) and satisfaction, and reduced [user support](powerbi-adoption-roadmap-user-support.md) costs.

## Architecture

### Data architecture

_Data architecture_ refers to the principles, practices, and methodologies that govern and define what data is collected, and how it is ingested, stored, managed, integrated, modeled, and used.

There are many data architecture decisions to make. Frequently the COE engages in data architecture design and planning. It's common for administrators to get involved as well, especially when they manage databases or Azure infrastructure.

> [!IMPORTANT]
> Data architecture decisions significantly impact on Power BI adoption, user satisfaction, and individual project success rates.

A few data architecture considerations that affect adoption of Power BI include:

- Where does Power BI fit into the organization's entire data architecture? And, are there other existing components such as an enterprise data warehouse (EDW) or a data lake that will be important to factor into plans?
- Is Power BI used end-to-end for data preparation, data modeling, and data presentation? Or, is Power BI used only some of those capabilities?
- Where will users consume the content? Generally, the three main ways to deliver content are: the Power BI service, Power BI Report Server, and embedded in custom applications. The [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP) includes a section on Power BI architectural choices, which describes when to consider each of these three main choices. Additionally, [Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/) is a convenient alternative to the Power BI service, especially for users who spend a lot of time in Teams.
- Who is responsible for managing and maintaining the data architecture? Is it a centralized team, or a decentralized team? How is the [COE](powerbi-adoption-roadmap-center-of-excellence.md) represented in this team? Are certain skillsets required?
- What [data sources](../connect-data/desktop-data-sources.md) are the most important, and what types of data will we be acquiring?
- What [connectivity mode](../connect-data/service-dataset-modes-understand.md) and [storage mode](../transform-model/desktop-storage-mode.md) choices (for example, import, live connection, DirectQuery, or composite model frameworks) are the best fit for the use cases?
- To what extent is data reusability encouraged using [shared datasets](../connect-data/desktop-report-lifecycle-datasets.md)?
- To what extent is the reusability of data preparation logic encouraged using [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)?

When becoming acquainted with Power BI, many system administrators assume it's a query tool much like SQL Server Reporting Services (SSRS). The breadth of capabilities for Power BI, however, are vast in comparison. So, it's important for administrators to become aware of Power BI capabilities before they make architectural decisions.

> [!TIP]
> Get into the good habit of completing a technical proof of concept (POC) to test out assumptions and ideas. The goal of a POC is to address unknowns and reduce risk as early as possible. A POC doesn't have to be throwaway work, but it should be narrow in scope. Best practices reviews, as discussed in the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, are another useful way to help content creators with important architectural decisions.

### Premium capacity management

[Power BI Premium](https://powerbi.microsoft.com/power-bi-premium/) includes additional features and capabilities to deliver BI solutions at scale. Premium subscriptions may be purchased [by capacity or per user](https://powerbi.microsoft.com/pricing/) with Premium Per User (PPU). This section primarily focuses on Premium capacity, which requires additional oversight.

Power BI Premium can play a significant role in your BI strategy. Some top reasons to invest in Premium include:

- [Unlimited content distribution](../admin/service-premium-what-is.md#unlimited-content-sharing) to large numbers of read-only (content consumption with a free Power BI license is available in Premium capacity only, not PPU).
- [Deployment pipelines](../create-reports/deployment-pipelines-overview.md) to manage the publication of content to development, test, and production workspaces. They are highly recommended for critical content to improve release stability.
- [Paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md) to deliver highly-formatted, pixel-perfect reports. This report type allows content creators to meet additional types of information delivery requirements.
- [XMLA endpoint](../admin/service-premium-connect-tools.md), which is an industry standard protocol for managing and publishing a dataset, or querying the dataset from any XMLA-compliant tool.
- Increased model size limits, including ([large dataset](../admin/service-premium-large-models.md) support.
- More frequent [data refreshes](../connect-data/refresh-data.md#power-bi-refresh-types).
- Storage of data in a specific geographic area ([multi-geo](../admin/service-admin-premium-multi-geo.md) is available by capacity only).

This list is not all-inclusive. For a complete list of Premium features, see [Power BI Premium FAQ](../admin/service-premium-faq.yml).

#### Managing Premium capacity

Overseeing the health of Power BI Premium capacity is an essential ongoing activity for administrators because, by definition, Premium capacity includes a fixed level of system resources. It equates to [memory and CPU limits](../admin/service-premium-what-is.md#limitations-in-premium-gen2) that must be managed to achieve optimal performance.

> [!CAUTION]
> Lack of management and exceeding the limits of Premium capacity can often result in performance challenges and user experience challenges. Both challenges, if not managed correctly, can contribute to negative impact on adoption efforts.

Suggestions for managing Premium capacity:

- Create a specific set of criteria for content that will be published to Premium capacity. It's particularly relevant when a single capacity is used by multiple business units because the potential exists to disrupt other users if the capacity is not well-managed. For a list of items that may be included in the best practices review (such as reasonable dataset size and efficient calculations), see the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews) article.
- Regularly use the [Premium monitoring app](../admin/service-premium-gen2-metrics-app.md) to understand resource utilization and patterns for the Premium capacity. Most importantly, look for consistent patterns of overutilization, which will contribute to user disruptions. An analysis of usage patterns should also make you aware if the capacity is underutilized, indicating more value could be gained from the investment.
- Configure the [tenant setting](../admin/service-interruption-notifications.md#enable-notifications) so Power BI notifies you if the [Premium capacity becomes overloaded](https://powerbi.microsoft.com/blog/announcing-timely-premium-capacity-overload-alerts/), or an outage or incident occurs.

#### Autoscale

[Autoscale](../admin/service-premium-auto-scale.md) is a capability of [Power BI Premium Gen 2](../admin/service-premium-concepts.md) that's intended to handle occasional or unexpected bursts in Premium usage levels. It can respond to these bursts by automatically increasing CPU resources to support the increased workload. Automated scaling up reduces the risk of performance and user experience challenges in exchange for a financial impact. If the Premium capacity is not well-managed, autoscale may trigger more often than expected. In this case, the [Premium monitoring app](../admin/service-premium-gen2-metrics-app.md) can help you to determine underlying issues.

#### Decentralized Premium capacity management

Capacity administrators are responsible for [assigning workspaces](../admin/service-admin-premium-manage.md#assign-a-workspace-to-a-capacity) to a specific capacity. Note that workspace administrators can also assign a workspace to PPU if the workspace administrator possesses a PPU license. However, it would require that all other workspace users must also have a PPU license.

It's possible that multiple capacities are set up to facilitate decentralized management by different business units. Decentralizing management of certain aspects of Power BI is a great way to balance agility and control. Here's an example to describe how it could be managed for Premium capacity:

- [Purchase](../admin/service-admin-premium-purchase.md) a P3 capacity node in Microsoft 365, which includes 32 virtual cores.
- Use 16 cores to create the first capacity—it will be used by the Sales team.
- Use 8 cores to create the second capacity—it will be used by the Operations team.
- Use the remaining 8 cores to create the third capacity—it will support general use.

This example has several advantages:

- Separate [capacity administrators](../admin/service-admin-premium-manage.md#manage-user-permissions) may be configured for each capacity, and so it facilitates decentralized management situations.
- If a capacity is not well-managed, the effect of confined to that capacity only. The other capacities are not impacted.

However, the example has disadvantages, too:

- The [limits per capacity](../admin/service-premium-what-is.md#capacity-nodes) are lower. The maximum memory size allowed for datasets isn't the entire P3 capacity node size; rather, it's the assigned capacity size where the dataset is hosted.

### Gateway architecture and management

The [on-premises data gateway](../connect-data/service-gateway-onprem.md) facilitates the secure and efficient transfer of data between organizational data sources and the Power BI service. A gateway is needed for data connectivity to on-premises or cloud services when a data source is:

- Located within the enterprise data center.
- Configured behind a firewall.
- Within a virtual network.
- Within a virtual machine.

There are three types of gateways:

1. **On-premises data gateway (standard mode)** is a gateway service that supports connections to registered data sources for many users to use. The gateway software installations and updates are installed on a machine that's managed by the customer.
2. **On-premises data gateway (personal mode)** is a gateway service that supports data refresh only. This gateway mode is typically installed on the PC of the user. It supports use by one user only. It does not support live connection or DirectQuery connections.
3. **Virtual network data gateway** is a Microsoft managed service that supports connectivity for many users. Specifically, it supports connectivity for datasets and dataflows stored in workspaces assigned to Premium capacity or Premium Per User.

> [!TIP]
> The decision of [who can install gateway software](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) is a governance decision. For most organizations, use of options 1 or 3 should be strongly encouraged over option 2 because they are more scalable and manageable.

#### Decentralized gateway management

The On-premises data gateway (standard mode) and Virtual network data gateway support specific data source types that can be registered, together with connection details and how credentials are stored. Users can be granted permission use the gateway data source.

Certain aspects of gateway management can be done effectively on a decentralized basis to balance agility and control. For example, the Operations group may have a gateway dedicated to its team of self-service content creators and data owners. Decentralized gateway management works best when it's a joint effort as follows:

Managed by the decentralized data owners:

- Departmental data source [connectivity information and privacy levels](../connect-data/service-gateway-data-sources.md#add-a-data-source).
- Departmental data source [stored credentials](../connect-data/service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud) (including responsibility for updating routine password changes).
- Departmental data source [users](../connect-data/service-gateway-data-sources.md#manage-users) who are permitted to use each data source.

Managed by centralized data owners (includes data sources that are used broadly across the organization; management is centralized to avoid duplicated data sources):

- Centralized data source [connectivity information and privacy levels](../connect-data/service-gateway-data-sources.md#add-a-data-source).
- Centralized data source [stored credentials](../connect-data/service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud) (including responsibility for updating routine password changes).
- Centralized data source [users](../connect-data/service-gateway-data-sources.md#manage-users) who are permitted to use each data source.

Managed by IT:

- Gateway software updates (gateway updates are usually released monthly).
- Installation of drivers and custom connectors (the same ones that are installed on [user machines](#user-machines-and-devices)).
- Gateway cluster management (number of machines in the gateway cluster for high availability, disaster recovery, and to eliminate a single point of failure,  which can cause significant user disruptions).
- Server management (for example, operating system, RAM, CPU, or networking connectivity).
- Management and backup of encryption keys.
- Monitoring of gateway logs to assess when scale-up or scale-out is necessary.
- Alerting of downtime or persistent low machine resources.

> [!TIP]
> Allowing a decentralized team to manage certain aspects of the gateway means they can move faster. The tradeoff of decentralized gateway management does mean running more gateway servers so that each can be dedicated to a specific area of the organization. If gateway management is handled entirely by IT, it's imperative to have a good process in place to quickly handle requests to add data sources and apply user updates.

## User licenses

Every user of the Power BI service needs a commercial license which is integrated with an Azure Active Directory identity. The user license may be Free, Power BI Pro, or Power BI Premium Per User. A user license is obtained via a subscription which authorizes a certain number of licenses with a start and end date.

There are two approaches to procuring subscriptions:

- **Centralized:** Microsoft 365 billing administrator purchases a subscription for [Power BI Pro or Premium Per User](https://powerbi.microsoft.com/pricing/). For most larger organizations, it's the most common way to manage subscriptions and assign licenses.
- **Decentralized:** Individual departments purchase a subscription via [self-service purchasing](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide&preserve-view=true).

### Self-service purchasing

An important governance decision relates to what extent self-service purchasing will be allowed or encouraged.

Self-service purchasing is useful for:

- Larger organizations with decentralized business units that have purchasing authority and want to handle payment directly with a credit card.
- Organizations that intend to make it as easy as possible to purchase subscriptions on a monthly commitment.

Consider disabling self-service purchasing when:

- You have centralized procurement processes in place to meet regulatory, security, and governance requirements.
- Discounted pricing is obtained through an Enterprise Agreement (EA).
- Existing processes are in place to handle intercompany chargebacks.
- Existing processes are in place to handle [group-based](/azure/active-directory/enterprise-users/licensing-groups-assign) licensing assignments.
- Prerequisites are required for obtaining a license, such as approval, justification, training, or a governance policy requirement.
- There's a valid need, such as a regulatory requirement, to control access to the Power BI service very closely.

### Trials

Another important governance decision is whether user trials are allowed. By default, trials are enabled. That means when content is shared with a colleague, if the recipient does not have a Power BI Pro or Premium Per User license, they will be prompted to start a trial to view the content (if the content doesn’t reside within Premium capacity). The trial experience is a great convenience and allows people to continue with their normal workflow.

Generally, disabling trials is not recommended. It can encourage users to apply workarounds, perhaps by exporting data or working outside of supported tools and processes. Consider disabling trials only when:

- There are serious cost concerns that would make it unlikely to grant full licenses at the end of the trial period.
- Prerequisites are required for obtaining a license (such as approval, justification, or a training requirement), and it's not sufficient to meet this requirement during the trial period.
- There's a valid need, such as a regulatory requirement, to control access to the Power BI service very closely.

> [!TIP]
> Don't introduce too many barriers to obtaining a Power BI license. People who need to get work done will find a way, and that way may involve workarounds that aren't ideal. For instance, without a license to use the Power BI service, people may rely far too much on sharing files on a file system or via email when significantly better approaches are available.

## Cost management

Managing and optimizing the cost of cloud services, like Power BI, is an important activity. Here are several activities you may want to consider:

- Analyze who is using—and, more to the point, not using—their allocated Power BI licenses and make necessary adjustments. Power BI usage is analyzed using the [activity log](../admin/service-admin-auditing.md).
- Analyze the cost effectiveness of [Premium capacity](../admin/service-premium-what-is.md) or [Premium Per User](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-). In addition to the [additional features](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-), perform a cost/benefit analysis to determine whether Premium licensing is more cost-effective when there are a large number of consumers (unlimited content distribution is only available with Premium capacity, not PPU licensing).
- Carefully [monitor and manage Premium capacity](../admin/service-premium-gen2-metrics-app.md). Understanding usage patterns over time will allow you to predict when to purchase [additional capacity](../admin/service-premium-what-is.md#capacity-nodes). For example, you may choose to scale up a single capacity from a P1 to P2, or scale out from one P1 capacity to two P1 capacities.
- If there are occasional spikes in the level of usage, use of [autoscale](../admin/service-premium-auto-scale.md) with [Power BI Premium Gen 2](../admin/service-premium-concepts.md) is recommended. It will scale up capacity resources for 24 hours, then scale them back down to normal levels (providing sustained activity isn't present). Manage autoscale cost by constraining the maximum number of v-cores, and/or with spending limits set in Azure (because autoscale is supported by the Azure Power BI Embedded service). Due to the pricing model, autoscale is best suited to handle occasional unplanned increases in usage.
- For Azure data sources, co-locate them in the same region as your Power BI tenant whenever possible. It will avoid incurring [Azure egress charges](https://azure.microsoft.com/pricing/details/bandwidth/), which are minimal, but at scale can be considerable.

## Security and data protection

Security and data protection are joint responsibilities among all content creators, consumers, as well as administrators. That's no small task because there's sensitive information everywhere: customer data, personally identifiable information (PII), protected health information (PHI), intellectual property, proprietary organizational information, just to name a few. Governmental, industry, and contractual regulations may have a big impact on the [governance](powerbi-adoption-roadmap-governance.md) guidelines and policies that you create related to security.

The [Power BI security whitepaper](whitepaper-powerbi-security.md) is an excellent resource for understanding the breadth of considerations, including aspects that Microsoft manages. In this section will introduce several topics that customers are responsible for managing.

### User responsibilities

Some organizations ask Power BI users to accept a self-service user acknowledgment. This is a document that explains the user's responsibilities and expectations for safeguarding organizational data. One way to automate its implementation is with an [Azure Active Directory terms of use policy](/azure/active-directory/conditional-access/terms-of-use). The user is required to agree to the policy before they are permitted to visit the Power BI service for the first time (or on a recurring basis, like an annual renewal).

### Data security

In a [cloud shared responsibility model](/azure/security/fundamentals/shared-responsibility), securing the data itself is always the responsibility of the customer. With a self-service BI platform, self-service content creators have responsibility for properly securing the content that's shared with colleagues. The COE should provide [documentation and training](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) where relevant to assist content creators with best practices (particularly situations for dealing with ultra-sensitive data).

Administrators can be help by following best practices themselves, and by raising concerns when they see issues that could be discovered when [managing workspaces](../admin/service-admin-portal.md#workspaces), [auditing user activities](../admin/service-admin-auditing.md), or managing [gateway credentials and users](../connect-data/service-gateway-data-sources.md#add-a-data-source). There are also a several [tenant settings](../admin/service-admin-portal.md#tenant-settings) that are usually restricted except for a few users (for instance, the ability to [publish to web](../admin/service-admin-portal.md#publish-to-web) or the ability to [publish apps to the entire organization](../admin/service-admin-portal.md#publish-content-packs-and-apps-to-the-entire-organization)).

### External guest users

External users—such as partners, customers, vendors, and consultants—are a very common occurrence for some organizations, and very rare for others. How you handle external users is a governance decision.

External user access is controlled by [tenant settings](../admin/service-admin-portal.md#export-and-sharing-settings) in the Power BI service as well as certain Azure Active Directory settings. For details of external user considerations, review the [Distribute Power BI content to external guest users using Azure Active Directory B2B](whitepaper-azure-b2b-power-bi.md) whitepaper.

### Information protection

Power BI supports capabilities for information protection and data loss prevention through its integration with:

- [Microsoft Integration Protection](/microsoft-365/compliance/information-protection) (MIP), which is a collection of features and capabilities with an objective to discover, classify, and protect sensitive information. Its philosophy is to _know your data, protect your data, prevent data loss, and govern your data_.
- [Microsoft Cloud App Security](/cloud-app-security/what-is-cloud-app-security) (MCAS), which is a cloud access security broker (CASB). It can audit, monitor, and raise alerts based on certain activities. See the [monitoring](#monitoring) section later in this article for examples of how MCAS can be used for oversight of the Power BI service.

Power BI's information protection capabilities are built upon [sensitivity labels](whitepaper-powerbi-security.md#data-loss-prevention-dlp). Sensitivity labels are an important building block for data protection, data retention, data loss prevention, compliance, and insider risk management for Microsoft 365 services (including Power BI, as well as other Microsoft services).

> [!IMPORTANT]
> A sensitivity label offers powerful data protection capabilities. However, it's not a replacement for standard data security practices, such as workspace roles, app security, individual item sharing, or row-level security.

The power of sensitivity labels is:

- Automated data loss prevention within the Power BI service, for instance, when [Cloud App Security](../admin/service-security-using-microsoft-cloud-app-security-controls.md) can invoke a policy to prohibit a file download based on a sensitivity label.
- Automated data loss prevention across system boundaries, such as when the [label follows the content](../admin/service-security-sensitivity-label-overview.md#introduction) from when it's exported from the Power BI service to Excel or PowerPoint.
- User education, so users know what they can and cannot do with the data. It's not automated. Rather, it should be handled with a data governance policy and user education.

There are several [tenant settings](../admin/service-admin-portal.md#information-protection) which relate to information protection. For more information, see the [Auditing and monitoring](#auditing-and-monitoring) section in this article.

### Data residency

For organizations with requirements to store data within a geographic region, Premium capacity (not PPU) can be [configured for a specific region](whitepaper-powerbi-security.md#data-residency) that's different from the region of the Power BI home tenant.

### Encryption keys

Microsoft handles encryption of _data at rest_ in Microsoft data centers with transparent server-side encryption and auto-rotation of certificates. For customers with regulatory requirements to [manage the Premium encryption key themselves](../admin/service-encryption-byok.md), Premium capacity can be configured to use [Azure Key Vault](/azure/key-vault/general/basic-concepts). Using customer-managed keys—also known as _bring-your-own-key_ or _BYOK_—is a precaution to ensure that, in the event of a human error by a service operator, customer data cannot be exposed.

Note that [Premium Per User](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-) only supports BYOK when it's enabled for the entire Power BI tenant.

## Auditing and monitoring

A wealth of metadata is available for understanding what's happening within your Power BI tenant. The primary source of information is from the Power BI [activity log](../admin/service-admin-auditing.md), which captures information about many different types of activities that users perform. There are also a variety of [REST APIs](/rest/api/power-bi/) that provide additional information about workspaces, apps, datasets, and more. Of particular interest to administrators are the [admin APIs](/rest/api/power-bi/admin). These APIs provide a means to extract metadata for the entire tenant. The [Power BI Management Module](/powershell/power-bi/overview?view=powerbi-ps&preserve-view=true) is a set of PowerShell commands which make it easier to obtain metadata rather than dealing directly with the APIs. However, substantially more information is available directly from the APIs.

### Auditing

Auditing data is valuable for informing and tracking your adoption goals, helping the COE be more effective, ideas for helpful documentation or new training, as well as for governance-related reporting.

The following table presents are a few ideas of what you can do with the information available from the Power BI activity log and APIs:

| **Category of Auditing Data** | **Type of Questions** |
| --- | --- |
| Usage patterns and adoption | What is the most often-used content, and by whom?</br></br>How many users are active?</br></br>Are report views trending up or down?</br></br>Is there underutilized or abandoned content?</br></br>Are viewers using browser or mobile apps more often?</br></br>When is content published or updated, and by whom? |
| Governance, security, and compliance | When are workspace roles updated, and by whom?</br></br>How many external users are accessing content?</br></br>Who added or updated a sensitivity label?</br></br>When does a tenant setting change, and by whom?</br></br>What percentage of report views are based on certified datasets?</br></br>What percentage of datasets support more than one report?</br></br>How frequently is content downloaded, and by whom?</br></br>Who generated an embed code for publish to web? |
| Architecture reporting and analysis | How many workspaces exist by type?</br></br>How many reports exist by type?</br></br>When is a gateway or data source created or updated? |
| User education and training opportunities | Who started a Power BI trial?</br></br>Who is doing too much sharing from their personal workspace?</br></br>Who is publishing a lot of new datasets?</br></br>Who is doing a lot of exporting? |

When considering needs for creating auditing reports, consider the following:

- What does success mean?
- What behaviors do you want to encourage?
- What do you want people to start doing?
- What do you want people to stop doing?

> [!IMPORTANT]
> The raw data files that contain the auditing data should be stored in a very secure location, preferably one which is immutable (allowing no modifications or deletions). Immutable storage allows your auditors to rely on this data. A service like [Azure Data Lake Storage Gen2](/azure/storage/blobs/data-lake-storage-introduction) is a flexible and low-cost alternative for this purpose.

### Monitoring

[Microsoft Cloud App Security (MCAS)](https://powerbi.microsoft.com/blog/get-up-to-speed-with-power-bi-and-microsoft-cloud-app-security/) is a cloud access security broker (CASB) that allows administrators to perform activities such as:

- Audit, monitor, and raise alerts based on activities.
- Create data loss prevention policies.
- Detect unusual behaviors and risky sessions.
- Limit activities performed by applications (in conjunction with [Azure Active Directory conditional access app control](/cloud-app-security/proxy-intro-aad)).

Some very powerful [Power BI monitoring and protection](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/protect-your-power-bi-instance-using-microsoft-cloud-app/ba-p/2166872) capabilities are available with MCAS. For example, you can:

- Prohibit all—or certain users—from downloading a file from the Power BI service when a specific sensitivity label is assigned.
- Receive an alert whenever a tenant setting is updated in the Power BI service (for instance, an administrative activity is detected).
- Detect when suspicious or unusual behaviors have occurred, such as massive file downloads or an unusual number of sharing operations in the Power BI service.
- Search the activity log for specific activities for content with a specific sensitivity label assigned, such as exports from the Power BI service.
- Be notified when risky sessions are occurring, such as when the same user account connects from different geographical areas in a narrow time window.
- Determine when someone outside a predefined security group views specific content in the Power BI service.

> [!CAUTION]
> Licensing, cost, and administrative permissions for MCAS are all handled separately from Power BI. You can create an [application-specific admin](/cloud-app-security/manage-admins#built-in-cloud-app-security-admin-roles) with permissions scoped to monitoring just the Power BI service.

## Planning for change

Every month, new Power BI features and functionality are released. To be effective, it's crucial for those involved with system oversight to stay current.

The [Power BI blog](https://powerbi.microsoft.com/blog/) is the best place for customers to monitor announcements and new releases..

The [Power BI release plan](https://powerbi.microsoft.com/roadmap/) is where customers can find the public roadmap for future features and estimated dates. Sometimes a change that's coming is so important that it's useful to start planning for it well in advance. The planning cycle is in semesters: April-September, and October-March.

> [!IMPORTANT]
> It's difficult to overestimate the importance of staying current. Being a few months behind on announcements can make it difficult to properly manage the Power BI service and support the user population efficiently.

## Considerations and key actions

Considerations and key actions you can take to improve system oversight:

- Verify who is permitted to be a Power BI administrator. If possible, reduce the number of people granted this role if it's more than a few people.
- If you have people who _occasionally_ need Power BI administrator rights, consider implementing [Privileged Identity Management](/azure/active-directory/privileged-identity-management/pim-configure) (PIM) in Azure Active Directory. It's designed to assign just-in-time role permission that expire after a few hours.
- Check the status of cross-training and documentation in place for handling Power BI administration responsibilities.

Considerations and key actions you can take to improve management of the Power BI service:

- Conduct a review of all tenant settings to ensure they are aligned with [data culture](powerbi-adoption-roadmap-data-culture.md) objectives and [governance](powerbi-adoption-roadmap-governance.md) guidelines and policies. Verify which groups are assigned for each setting.
- Document the tenant settings for the internal Power BI community and post it in the centralized portal. Include which groups a user would need to request to be able to use a feature.
- When user resources are established, as described in the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, update the [tenant setting](../admin/service-admin-portal.md#help-and-support-settings) to customize the links under the **Get Help** menu option. It will direct users to your documentation, community, and help.

Considerations and key actions you can take to improve management of user machines and devices:

- Review your process for how onboarding of new content creators is handled. Determine if new requests for software, such as Power BI Desktop, and user licenses (Power BI Pro or Premium Per User) can be handled together. It can simplify onboarding since new content creators won't always know what to ask for.
- Ensure an automated process is in place to install and update software, drivers, and settings to ensure all users have the same version.

Considerations and key actions you can take for data architecture planning:

- Assess what your end-to-end data architecture looks like. Make sure you're clear on:
  - How Power BI is currently used by the different business units in your organization versus how you want Power BI to be used. Determine if there's a gap.
  - If there are any risks that should be addressed.
  - If there are any high-maintenance situations to be addressed.
  - What data sources are important for Power BI users, and how they are documented and discovered.
- Review existing gateways that are used in your organization. Verify that gateway administrators and users are set correctly. Verify who is supporting each gateway, and that there's a reliable process in place to keep the gateway servers up to date.
- Check the number of personal gateways that are in use, and by whom. If there's significant usage, take steps to move towards use of the standard mode gateway.

Considerations and key actions you can take to improve management of user licenses:

- Review what the process to request a user license, including any prerequisites.
- Clarify whether self-service licensing purchasing is enabled.
- Confirm whether Power BI Pro and Premium Per User trials are enabled or disabled.

Considerations and key actions you can take to improve cost management:

- Determine what the cost management objectives are and how to balance cost, features, usage patterns, and effective utilization of resources.
- Ensure you have access to the activity log data to assist with cost analysis.
- Schedule a routine process to evaluate costs, perhaps annually.

Considerations and key actions you can take to improve security and data protection:

- Clarify exactly what the expectations are for data protection, and ensure those expectations are communicated to the community of users.
- Understand and document the organizational policies around sharing Power BI content with external users, and ensure that Power BI service settings support those policies.
- If they do not currently exist, begin the process of deciding on sensitivity labels. Involve the relevant IT teams for decision-making and configuration in Microsoft 365.
- Investigate the use of Microsoft Cloud App Security to monitor user behavior and activities in the Power BI service.

Considerations and key actions you can take to begin or improve auditing and monitoring:

- Begin retrieving data from the Power BI activity log if you are not currently compiling the raw data. The easiest way to get started is to use the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent?view=powerbi-ps&preserve-view=true) PowerShell cmdlet included with the Power BI Management Module. Retrieve and store the raw data without filtering or formatting, to ensure that all data elements are available for future analysis. A file system or data lake is an ideal location.
- Over time, determine what additional auditing data would be helpful to complement the activity log data.

## Maturity levels

The following maturity levels will help you assess the current state of your Power BI system oversight:

| **Level** | **State of Power BI system oversight** |
| --- | --- |
| 100: Initial | Tenant settings are configured independently by one or more administrators based on their best judgment.</br></br>Architecture needs, such as gateways and capacities, are satisfied on an as-needed basis, though without a strategic plan.</br></br>Power BI activity logs are unused, or selectively used for tactical purposes. |
| 200: Repeatable | Tenant settings are reviewed on a regular basis, and purposefully align with established governance guidelines and policies.</br></br>A small number of specific administrators are selected, and they have a good understanding of what users are trying to accomplish.</br></br>An effective process exists for users to request licenses and software.</br></br>Sensitivity labels are configured in Microsoft 365, though usage of labels remains inconsistent. |
| 300: Defined | The tenant settings are fully documented in the community portal for users to reference, including how to request access to the correct groups.</br></br>Cross-training and documentation exists for administrators to ensure continuity and stability.</br></br>Sensitivity labels are assigned to content consistently.</br></br>An automated process is in place to export Power BI activity log and API data to a secure location for reporting and auditing. |
| 400: Capable | Automated policies are configured and actively monitored in Microsoft Cloud App Security for data loss prevention.</br></br>Administrators work closely with the COE and governance teams to provide oversight of Power BI with an emphasis on user empowerment within the requisite guardrails.</br></br>Decentralized management of data architecture (such as gateways or capacity management) is effectively handled to balance agility and control.</br></br>Power BI activity log and API data is actively analyzed to monitor and audit Power BI activities. Proactive action is taken based on the data. |
| 500: Efficient | Regular cost management analysis is done to ensure user needs are met in a cost-effective way.</br></br>Power BI activity log and API data is actively used to inform and improve adoption efforts (in addition to monitoring and auditing of Power BI activities). |

## Next steps

For more information about system oversight and Power BI administration, see the following resources:

- [Microsoft Learn – Administer Power BI – Part 1](/learn/paths/administer-power-bi-part-1/)
- [Microsoft Learn – Administer Power BI – Part 2](/learn/paths/administer-power-bi-part-2/)
- [Administrator in a Day Training – Day 1](https://aka.ms/AdmPBI1)
- [Administrator in a Day Training – Day 2](https://aka.ms/AdmPBI2)
- [Power BI security whitepaper](whitepaper-powerbi-security.md)
- [External guest users whitepaper](whitepaper-azure-b2b-power-bi.md)
- [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP)
- [Power BI adoption framework](https://github.com/pbiaf/powerbiadoption)

In the [next article](powerbi-adoption-roadmap-conclusion.md) in the Power BI adoption roadmap series, learn about adoption-related resources that you might find valuable.
