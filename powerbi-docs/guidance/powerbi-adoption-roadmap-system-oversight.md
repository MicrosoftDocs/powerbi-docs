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

System oversight—also known as Power BI administration—is the ongoing, day-to-day, administrative activities that:

- Enact governance guidelines and policies to support self-service BI and enterprise BI
- Facilitate and support the internal processes and systems to empower the internal user community to the extent possible, while adhering to the organization's regulations and requirements
- Allow for broader organizational adoption of Power BI with effective governance and data management practices

> [!IMPORTANT]
> Your organizational [data culture](powerbi-adoption-roadmap-data-culture.md) objectives provide direction for your [governance](powerbi-adoption-roadmap-governance.md) decisions which, in turn, dictate how [Power BI administration](../admin/service-admin-administering-power-bi-in-your-organization.md) activities take place and by whom.

Administration is a broad and deep topic. The goal for this article is to introduce some of the most important considerations and actions to help you be successful with your [organizational adoption](powerbi-adoption-roadmap-maturity-levels.md) objectives.

## Power BI administrators

The Power BI administrator role is a specific role in Microsoft 365 which delegates a [subset of Power BI-specific](/power-platform/admin/use-service-admin-role-manage-tenant#service-administrator-permission-matrix) management activities. Global Microsoft 365 administrators are also an implicit Power BI administrator.

A key governance decision is who to permit to be a Power BI administrator. This is a centralized role which affects your entire Power BI tenant. Ideally, there are [2-4 people in the organization](/microsoft-365/admin/add-users/about-admin-roles?view=o365-worldwide&preserve-view=true#security-guidelines-for-assigning-roles) who have been trained on how to manage the Power BI service, and who are in close coordination with the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md) (COE).

### High privilege role

The Power BI administrator role is considered a high privilege role because:

- Settings which are managed by a Power BI administrator can have a significant effect on user capabilities and user experience (discussed in the [Tenant settings](#tenant-settings) section below).
- Access for any workspace (new workspace experience excluding personal workspaces) can be updated by the Power BI administrator. This allows access to view or download data artifacts as they see fit (discussed in the [Tenant settings](#tenant-settings) section below).
- The Power BI administrator is able to view all tenant metadata, including all user activities that have occurred in the Power BI service (discussed in the [auditing and monitoring](#auditing-and-monitoring) section below).

> [!IMPORTANT]
> Having too many Power BI administrators is a risk if they make unapproved or unintended changes.

### Roles and responsibilities

The types of activities that an administrator will do on a day-to-day basis will differ between organizations. What's important and given priority in your [data culture](#tenant-settings) will heavily influence what an administrator does to support business-led self-service BI, managed self-service BI, and enterprise BI (see the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article for details).

> [!TIP]
> The best type of person to serve in a Power BI administrator role is one who has enough knowledge about Power BI to understand what self-service users are trying to accomplish.

There are [several types of administrators](../admin/service-admin-administering-power-bi-in-your-organization.md#administrator-roles-related-to-power-bi). Following are the roles used most often on a day-to-day basis:

| **Role** | **Scope** | **Description** |
| --- | --- | --- |
| Power BI administrator | Power BI tenant | Manages tenant settings and other aspects of the Power BI service. All general references to "administrator" in this article refer to this administrator for the Power BI tenant. |
| Power BI Premium capacity administrator | One capacity | Manages workspaces, workloads, and health of a Premium capacity. |
| Power BI gateway administrator | One gateway | Manages gateway data source configuration, credentials, and users assigned. May also handle gateway software updates (or collaborate with infrastructure team on updates). |
| Power BI workspace administrator | One workspace | Manages workspace settings and access. |

The Power BI ecosystem is very broad and deep. There are quite a few different ways that the Power BI service integrates with other systems and platforms. From time to time, it will be necessary to work with other system administrators and IT professionals, such as:

- Global Microsoft 365 administrator
- Azure Active Directory administrator
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

The remainder of this article discusses the most common activities that a Power BI administrator is likely to be involved with, and which are important to carry out effectively when taking a strategic approach to [Power BI organizational adoption](powerbi-adoption-roadmap-overview.md).

## Service management

Overseeing the Power BI service is a crucial aspect of ensuring that all users have a good experience with Power BI.

### Tenant settings

The proper management of [tenant settings](../admin/service-admin-portal.md#tenant-settings) in the Power BI service is critical. Tenant settings are the main way to control which Power BI capabilities are available to which groups of users in your organization.

It's essential for tenant settings to align with governance guidelines and policies, and with how the COE makes decisions. If a Power BI administrator is independently deciding which settings to enable or disable, that's an indicator of an opportunity to improve governance processes.

> [!IMPORTANT]
> Changing the settings should go through a change control process with an approval mechanism that includes a history of approved changes by whom, when, and why.

Since content creators and consumers can easily read online about available features in Power BI, it can be very frustrating when things don't work as expected. This can lead to dissatisfied users and less effective [organizational adoption, user adoption, and solution adoption](powerbi-adoption-roadmap-maturity-levels.md). Common examples of user confusion and frustration:

- Why can't I create a workspace?
- Why can't I export data?
- Why doesn't my custom visual work?
- Why can't I certify a dataset?

> [!CAUTION]
> If you're seeing a situation that isn't ideal (such as too many exports in the activity log), resist the urge to disable the feature entirely. Prohibiting features leads to user frustration and workarounds. Before disabling a setting, find out why users are relying on certain techniques. Perhaps a solution needs to be redesigned, or additional user education and training will mitigate the concerns. The bottom line: knowledge sharing is an effective form of governance.

Since there's no reader role to view tenant settings, this can be a challenge in larger organizations. One of the most helpful things you can do is publish a document with the tenant settings to the centralized portal (discussed in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article).

The following activities apply when reviewing and validating each tenant setting:

- Tenant setting
  - Enabled, or
  - Disabled
- Tenant setting applicable to:
  - The entire organization, or
  - Limited to specific security group(s)
    - Does a suitable security group already exist, or
    - Does a new security group need to be created

### Admin portal

As discussed in the Power BI adoption [maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article, organizational adoption refers to the effectiveness of Power BI governance and data management practices to support and enable enterprise BI and self-service BI. Actively managing all areas of the Power BI service (in addition to the tenant settings previously discussed) in accordance with adoption goals has a direct influence on ensuring that all users have a good experience with Power BI.

These additional responsibilities for managing the Power BI service include:

- [Workspace management &amp; access](../admin/service-admin-portal.md#workspaces)
- [Premium capacity and Premium Per User settings](../admin/service-admin-portal.md#capacity-settings)
- [Embed codes](../admin/service-admin-portal.md#embed-codes)
- [Organizational visuals](../admin/service-admin-portal.md#organizational-visuals)
- [Azure connections](../admin/service-admin-portal.md#azure-connections)
- [Custom branding](../admin/service-admin-portal.md#custom-branding)
- [Featured content](../admin/service-admin-portal.md#manage-featured-content)

In addition to the documentation links above, the [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP) contains additional considerations for Power BI administration topics.

## User machines and devices

Management of user machines and devices is usually a responsibility of the IT department. The adoption of Power BI depends directly on content creators and consumers having the applications they need installed and configured correctly.

The following [software installations](https://powerbi.microsoft.com/downloads/) are available for content creators:

| **Application** | **Audience** |
| --- | --- |
| Power BI Desktop | Content creators who develop data models and interactive reports for deployment to the Power BI service |
| Power BI Desktop Optimized for Report Server | Content creators who develop data models and interactive reports for deployment to Power BI Report Server |
| Power BI Report Builder | Content creators who develop paginated reports for deployment to the Power BI service or Power BI Report Server |
| Power BI Mobile Application | Content creators and consumers who interact with content that's been published to the Power BI service or Power BI Report Server via iOS, Android, and Windows 10 applications |
| On-Premises Data Gateway (Personal Mode) | Content creators who publish datasets to the Power BI service and manage scheduled data refresh (see additional discussion in the Gateway architecture and management section of this article) |

> [!IMPORTANT]
> Not all the software listed above will be necessary for all content creators. Power BI Desktop is the most common, and the starting point when in doubt.

It's very important for all content creators who collaborate with each other to be on the same version of the software (particularly Power BI Desktop which is updated monthly). Ideally, software updates are available from the Microsoft Store or installed by an automated IT process so that users don't have to take any specific action to obtain updates.

Preferably, software updates are released promptly so that users can take advantage of new capabilities that are continually released and that their experience matches public documentation. It's also important to be aware of the [update channel](/deployoffice/overview-update-channels) being used for Microsoft 365 applications since it has a big impact on Excel integrations with Power BI.

Other common items that may need to be installed on user machines include:

- Drivers to support data connectivity (ex: Oracle, HANA, Microsoft Access Engine)
- [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) provider
- [External tools](../transform-model/desktop-external-tools.md) (for example, Tabular Editor, DAX Studio, or ALM Toolkit)
- [Custom data source connectors](../connect-data/desktop-connector-extensibility.md)

In addition to software installations, user machines may be managed for:

- Group policy settings (one example: allowed use of [custom visuals](/admin/organizational-visuals#certified-power-bi-visuals) so that the Power BI Desktop experience aligns with that of the Power BI service to ensure a consistent user experience).
- Registry settings (examples: disable the Power BI Desktop [sign-in form](../admin/desktop-admin-sign-in-form.md) or [tune Query Editor performance](../create-reports/desktop-evaluation-configuration.md)).

> [!TIP]
> Effective management of software, drivers, and settings can make a big difference in user experience which translates to advances in [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages) and reduced [user support](powerbi-adoption-roadmap-user-support.md) costs.

## Architecture

### Data architecture

Data architecture refers to the principles, practices, and methodologies which govern and define what data is collected, how that data is ingested, stored, managed, integrated, modeled, and used.

There are a lot of data architecture decisions. Frequently the COE participates in data architecture design and planning. It's common for administrators to get involved as well, especially if they also manage databases or Azure infrastructure.

> [!IMPORTANT]
> Data architecture decisions significantly impact adoption of Power BI, user satisfaction, and individual project success rates.

A few data architecture considerations that affect adoption of Power BI include:

- Where does Power BI fit in the organization's entire data architecture? Are there other existing components such as an enterprise data warehouse or a data lake which will be important to plan for?
- Is Power BI being used end-to-end for data preparation, data modeling, and data presentation? Or is Power BI being used for a subset of those capabilities?
- Where will users consume the content? Generally, the three main ways to deliver content include the Power BI service, Power BI Report Server, and embedding in custom applications. The [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP) includes a section on Power BI architectural choices which includes when to consider each of these three main choices. Additionally, [Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/) is a convenient alternative to the Power BI service for users who spend a lot of time in Teams.
- Who is responsible for managing and maintaining the data architecture? Is it a centralized team, or a decentralized team? How is the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md) represented in this team? Are certain skillsets required?
- What [data sources](../connect-data/desktop-data-sources.md) are most important, and what types of data will we be acquiring?
- What [connectivity mode](../connect-data/service-dataset-modes-understand.md) and [storage mode](../transform-model/desktop-storage-mode.md) choices (for example, import, live connection, DirectQuery, or composite model frameworks) are best to suit the use cases?
- To what extent is data reusability encouraged with [shared datasets](../connect-data/desktop-report-lifecycle-datasets.md)?
- To what extent is the reusability of data preparation logic encouraged with use of [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)?

When just getting acquainted with Power BI, a lot of system administrators assume it's a query tool much like SQL Server Reporting Services. The breadth of capabilities for Power BI are vast, so it's important for administrators to be aware of its capabilities to make sound architecture decisions.

> [!TIP]
> Get in the habit of completing a technical proof of concept (POC) to test out assumptions and ideas. The goal is to address unknowns and reduce risk as early as possible. A POC doesn't have to be throwaway work, but it should be narrow in scope. Best practices reviews, as discussed in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, are also a very useful way to help content creators with the important architecture decisions.

### Premium capacity management

[Power BI Premium](https://powerbi.microsoft.com/power-bi-premium/) includes additional features and capabilities for delivery of BI solutions at scale. Premium subscriptions may be purchased [by capacity or per user](https://powerbi.microsoft.com/pricing/) with Premium Per User (PPU). This section primarily focuses on Premium capacity which requires additional oversight.

Power BI Premium can play a big role in your BI strategy. A few of the top reasons to invest in Premium include:

- [Unlimited content distribution](../admin/service-premium-what-is.md#unlimited-content-sharing) when there are large numbers of read-only users (content consumption with a free Power BI license is available Premium capacity only not PPU)
- [Deployment pipelines](../create-reports/deployment-pipelines-overview.md) for publishing content to development, test, and production workspaces (highly recommended for critical content to improve stability)
- [Paginated reports](../paginated-reports/paginated-reports-report-builder-power-bi.md) (highly-formatted pixel-perfect reports which allows content creators to meet additional types of information delivery requirements)
- [XMLA endpoint](../admin/service-premium-connect-tools.md) (an industry standard protocol for managing and publishing a dataset, or querying the dataset from any XMLA-compliant tool)
- Increased model size limits ([large dataset](../admin/service-premium-large-models.md) support)
- More frequent [data refreshes](../connect-data/refresh-data.md#power-bi-refresh-types)
- Storage of data in a specific geographic area ([multi-geo](../admin/service-admin-premium-multi-geo.md) available by capacity only)

The above is not an all-inclusive list. Refer to the [complete list of features](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-), including which are supported for PPU licensing.

#### Managing Premium capacity

Overseeing the health of Power BI Premium capacity is an essential ongoing activity for administrators because, by definition, Premium capacity includes a fixed level of system resources. This equates to [memory and CPU limits](../admin/service-premium-what-is.md#limitations-in-premium-gen2) which must be managed to achieve optimal performance.

> [!CAUTION]
> Lack of management and exceeding the limits of Premium capacity can often result in performance challenges and user experience challenges, both of which have a negative impact on adoption efforts.

Suggestions for managing Premium capacity:

- Create a specific set of criteria for content that will be published to Premium capacity. This is particularly relevant when a single capacity is used by multiple business units (because the potential exists to disrupt other users if the capacity is not well-managed). See the best practices review section in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article for a list of items that may be included in the best practices review (such as reasonable dataset size and efficient calculations).
- Regularly use the [Premium monitoring app](../admin/service-premium-gen2-metrics-app.md) to understand resource utilization and patterns for the capacity. Most importantly, look for consistent patterns of overutilization which will cause user disruptions. An analysis of usage patterns will also make you aware if the capacity is being underutilized and more value could be gained from the investment.
- Configure the [tenant setting](../admin/service-interruption-notifications.md#enable-notifications) to be notified if the [Premium capacity is overloaded](https://powerbi.microsoft.com/blog/announcing-timely-premium-capacity-overload-alerts/), or an outage or incident is occurring.

#### Autoscale

[Autoscale](../admin/service-premium-auto-scale.md) is a capability of [Power BI Premium Generation 2](../admin/service-premium-concepts.md) that is intended to handle occasional, unexpected, bursts in Premium usage levels by automatically making available additional CPU resources as the load increases. Automated scaling up reduces the risk of performance and user experience challenges, in exchange for a financial impact. If the Premium capacity is not well-managed, autoscale may occur more often than expected. In this case, the [Premium monitoring app](../admin/service-premium-gen2-metrics-app.md) can help understand what issues exist.

#### Decentralized Premium capacity management

Capacity administrators are responsible for [assigning workspaces](../admin/service-admin-premium-manage.md#assign-a-workspace-to-a-capacity) to a specific capacity (note that workspace administrators can also assign a workspace to PPU if the workspace administrator possesses a PPU license – this would require all other users of the workspace content to also have a PPU license).

Multiple capacities can be set up to facilitate decentralized management by different business units. Decentralizing management of certain aspects of Power BI is a great way to balance agility and control. An example to illustrate how that could be managed for Premium capacity:

- [Purchase](../admin/service-admin-premium-purchase.md) a P3 capacity node in Microsoft 365 which includes 32 virtual cores.
- Create the first capacity in the Power BI service with 16 cores assigned to it which will be used by the Sales team.
- Create the second capacity in the Power BI service with 8 cores assigned to it for the Operations team.
- Create the third capacity in the Power BI with 8 cores assigned to it which will be a general use capacity.

Advantages of the above scenario: Separate [capacity administrators](../admin/service-admin-premium-manage.md#manage-user-permissions) may be configured for each capacity, which facilitates decentralized management situations. If a capacity is not well-managed, the effect of that is limited.

Disadvantages of the above scenario: The [limits per capacity](../admin/service-premium-what-is.md#capacity-nodes) are lower (in the example above, the maximum memory size allowed for a dataset isn't the entire capacity node size of the P3 which was originally purchased; rather, it's the assigned capacity size where the dataset is stored).

### Gateway architecture and management

The [on-premises data gateway](../connect-data/service-gateway-onprem.md) facilitates the secure and efficient transfer of data between organizational data sources and the Power BI service. A gateway is needed for data connectivity to on-premises or cloud services when a data source is (a) located within the enterprise data center, (b) configured behind a firewall, (c) within a virtual network, or (d) within a virtual machine.

There are three types of gateways:

1. **On-premises data gateway: standard mode.** A gateway service which supports multiple types of connectivity to registered data sources for many users to connect through. The gateway software installations and updates are installed on a machine which is managed by the customer.
2. **On-premises data gateway: personal mode.** A gateway service which supports data refresh only. This gateway software is typically installed on a user laptop and supports use by one person only.
3. **Virtual network data gateway.** A Microsoft managed service which supports connectivity for many users. Supports connectivity for datasets and dataflows stored in workspaces assigned to Premium capacity or Premium Per User.

> [!TIP]
> The decision of [who is permitted to install gateway software](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) is a governance decision. For most organizations, use of options 1 or 3 above should be strongly encouraged over option 2 because they are more scalable and manageable.

#### Decentralized gateway management

Each gateway has specific data sources which are registered to it (including connection details and how credentials are handled). For each individual data source, users are specified that are permitted to use the data source.

Certain aspects of gateway management can be done effectively on a decentralized basis to balance agility and control. For example, the Operations group may have a gateway dedicated to its team of self-service content creators and data owners. Decentralized gateway management works best when it's a joint effort as follows:

Managed by the decentralized data owners:

- Departmental data source [connectivity information and privacy levels](../connect-data/service-gateway-data-sources.md#add-a-data-source).
- Departmental data source [stored credentials](../connect-data/service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud) (including responsibility for updating routine password changes).
- Departmental data source [users](../connect-data/service-gateway-data-sources.md#manage-users) who are permitted to use each data source.

Managed by centralized data owners (includes data sources used broadly across the organization; management is centralized to avoid a lot of duplicate data sources):

- Centralized data source [connectivity information and privacy levels](../connect-data/service-gateway-data-sources.md#add-a-data-source).
- Centralized data source [stored credentials](../connect-data/service-gateway-data-sources.md#store-encrypted-credentials-in-the-cloud) (including responsibility for updating routine password changes).
- Centralized data source [users](../connect-data/service-gateway-data-sources.md#manage-users) who are permitted to use each data source.

Managed by IT:

- Gateway software updates (gateway updates are released monthly)
- Installation of drivers and custom connectors (the same items which are installed on [user machines](#user-machines-and-devices) as discussed earlier are required for gateway machines)
- Gateway cluster management (number of machines in the gateway cluster for high availability, disaster recovery, and to eliminate a single point of failure which can cause significant user disruptions)
- Server management (operating system, RAM, CPU, networking connectivity, etc.)
- Management and backup of encryption keys
- Monitor of gateway logs and assess when scale-up or scale-out is necessary
- Alerting of downtime or persistent insufficient resources

> [!TIP]
> Allowing a decentralized team to manage certain aspects of the gateway means they can move faster. The tradeoff of decentralized gateway management does mean running more gateway servers so that each can be dedicated to a specific area of the organization. If gateway management is handled entirely by IT, it's imperative to have a very good process in place to quickly handle requests related to data source and user updates.

## User licenses

Every user of the Power BI service needs a commercial license which is integrated with an Azure Active Directory identity. The user license may be Free, Pro, or Premium Per User. A user license is obtained via a subscription which authorizes a certain number of licenses with a start and end date.

There are two approaches to procuring subscriptions:

1. Centralized: Microsoft 365 billing administrator purchases a subscription for [Power BI Pro or Premium Per User](https://powerbi.microsoft.com/pricing/). This is the most common way of managing subscriptions and license assignments for most larger organizations.
2. Decentralized: Individual departments purchase a subscription via [self-service purchasing](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide&preserve-view=true).

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
- Prerequisites are required for obtaining a license (such as approval, justification, training, or a governance policy requirement).
- There's a valid need, such as a regulatory requirement, to control access to the Power BI service very closely.

### Trials

Another important governance decision is if user trials are allowed. By default, trials are enabled. When content is shared with a colleague, if the recipient does not have a Pro or Premium Per User license, they will be prompted to start a trial to view the content (if the content doesn't reside within Premium capacity). The trial experience is a great convenience and allows people to continue their normal workflow.

Generally, disabling trials is not recommended, as this can encourage users to achieve their goals by exporting data and working outside of supported tools and processes. Consider disabling trials only when:

- There are serious cost concerns which would make it unlikely to grant full licenses at the end of the trial period.
- Prerequisites are required for obtaining a license (such as approval, justification, or a training requirement), and it's not sufficient to meet this requirement during the trial period.
- There's a valid need, such as a regulatory requirement, to control access to the Power BI service very closely.

> [!TIP]
> Don't introduce too many barriers to obtaining a Power BI license. People who need to get work done will find a way, and that way may involve workarounds that aren't ideal. For instance, without a license to use the Power BI service people may rely far too much on sharing files on a file system or via email when significantly better approaches are available.

## Cost management

Managing and optimizing the cost of cloud services like Power BI is an important activity. A few activities you may want to consider:

- Analyze who is using (and, more to the point, not using) their allocated Power BI licenses and adjust license assignments. This can be analyzed using data from the [activity log](../admin/service-admin-auditing.md).
- Analyze the cost effectiveness of [Premium capacity](../admin/service-premium-what-is.md) or [Premium Per User (PPU)](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-). In addition to the [additional features](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-), a cost/benefit analysis can be performed to determine if Premium licensing is more cost-effective when there are a large number of consumers (note: unlimited content distribution is only available with Premium capacity, not PPU licensing).
- Carefully [monitor and manage Premium capacity](../admin/service-premium-gen2-metrics-app.md). Understanding usage patterns over time will allow you to make predictions as to when the purchase of [additional capacity](../admin/service-premium-what-is.md#capacity-nodes) may be necessary. You may, for example, choose to scale up a single capacity from a P1 to P2, or scale out from one P1 capacity to two P1 capacities.
- For occasional spikes in the level of usage, use of [autoscale](../admin/service-premium-auto-scale.md) with [Power BI Premium Gen 2](../admin/service-premium-concepts.md) is recommended. This will scale up capacity resources for 24 hours, then scale back down to normal levels (if sustained activity is not present). Autoscale cost can be managed with a maximum number of v-cores set in the Power BI service, and/or with spending limits set in Azure (because autoscale is supported by the Power BI Embedded service in Azure). Due to the pricing model, autoscale is best suited to handling occasional, unplanned, increases in usage.
- For data sources that reside in Azure, co-locate them in the same region as your Power BI tenant whenever possible to avoid incurring [Azure egress charges](https://azure.microsoft.com/pricing/details/bandwidth/) (which are minimal, but at scale can be a consideration).

## Security and data protection

Security and data protection are joint responsibilities among all content creators, consumers, as well as administrators. That's no small task because there's sensitive information everywhere: customer data, personally identifiable information (PII), protected health information (PHI), intellectual property, proprietary organizational information, just to name a few. Governmental, industry, and contractual regulations may have a big impact on the [governance](powerbi-adoption-roadmap-governance.md) guidelines and policies that you create related to security.

The [Power BI security whitepaper](whitepaper-powerbi-security.md) is an excellent resource for understanding the breadth of considerations, including aspects that Microsoft manages. In this section we'll introduce a few items that customers are responsible for managing.

### User responsibilities

Some organizations ask Power BI users to accept a self-service user acknowledgment. This is a document that explains the user's responsibilities and expectations for safeguarding organizational data. One way to automate the implementation is with an [Azure Active Directory terms of use policy](/azure/active-directory/conditional-access/terms-of-use). The user is required to agree to the policy before they are permitted to visit the Power BI service for the first time (or on a recurring basis, like an annual renewal).

### Data security

In a [cloud shared responsibility model](/azure/security/fundamentals/shared-responsibility), securing the data itself is always the responsibility of the customer. With a self-service BI platform, self-service content creators have a lot of responsibility for properly securing the content that's shared with colleagues. The COE should provide [documentation and training](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) where relevant to assist content creators with best practices (particularly situations for dealing with ultra-sensitive data).

Administrators can be helpful as well by following best practices themselves, and by raising concerns when they see issues which could be discovered when [managing workspaces](../admin/service-admin-portal.md#workspaces), [auditing user activities](../admin/service-admin-auditing.md), or managing [gateway credentials and users](../connect-data/service-gateway-data-sources.md#add-a-data-source). There are also a few [tenant settings](../admin/service-admin-portal.md#tenant-settings) that are usually highly limited to few users (for instance, the ability to [publish to web](../admin/service-admin-portal.md#publish-to-web) or the ability to [publish apps to the entire organization](../admin/service-admin-portal.md#publish-content-packs-and-apps-to-the-entire-organization)).

### External guest users

External users, such as partners, customers, vendors, and consultants are a very common occurrence for certain organizations, and very rare for others. How to handle external users is a governance decision.

External user access is controlled by [tenant settings](../admin/service-admin-portal.md#export-and-sharing-settings) in the Power BI service as well as certain Azure Active Directory settings. For a detailed discussion of external user considerations, review the whitepaper: [Distribute Power BI content to external guest users using Azure Active Directory B2B](whitepaper-azure-b2b-power-bi.md).

### Information protection

Power BI supports capabilities for information protection and data loss prevention through its integration with:

- [Microsoft Integration Protection](/microsoft-365/compliance/information-protection) (MIP). MIP is a collection of features and capabilities with an objective to discover, classify, and protect sensitive information. Its philosophy is to "know your data, protect your data, prevent data loss, and govern your data."

- [Microsoft Cloud App Security](/cloud-app-security/what-is-cloud-app-security) (MCAS). MCAS is a cloud access security broker (CASB) with an objective to audit, monitor, and alert based on activities. See the monitoring discussion later in this article for examples of how MCAS can be used for overseeing the Power BI service.

Power BI's information protection capabilities are built upon [sensitivity labels](whitepaper-powerbi-security.md#data-loss-prevention-dlp) as its foundation. Sensitivity labels are an important building block for data protection, data retention, data loss prevention, compliance, and insider risk management for Microsoft 365 services (including Power BI, as well as other Microsoft services in use by the organization).

> [!IMPORTANT]
> A sensitivity label offers powerful data protection capabilities. However, it is not a replacement for standard data security practices (such as workspace roles, app security, individual item sharing, row-level security, etc.).

The power of sensitivity labels is:

- Automated data loss prevention within the Power BI service (for instance, when [Cloud App Security](../admin/service-security-using-microsoft-cloud-app-security-controls.md) can invoke a policy to prohibit a file download based on a sensitivity label).
- Automated data loss prevention across system boundaries (such as when the [label follows the content](../admin/service-security-sensitivity-label-overview.md#introduction) when it's exported from the Power BI service to Excel or PowerPoint).
- User education so they know what they can and cannot do with the data. This is not automated. Rather, this should be handled with a data governance policy and user education. See the "data classification and protection policy" in the [governance](powerbi-adoption-roadmap-governance.md) article.

There are several [tenant settings](../admin/service-admin-portal.md#information-protection) which relate to information protection. See additional discussion about ways to use sensitivity labels in the auditing and monitoring section below.

### Data residency

For organizations with requirements to store data within a geographic region, Premium capacity (not PPU, however) can be [configured for a specific region](whitepaper-powerbi-security.md#data-residency) that's different from the region of the Power BI home tenant.

### Encryption keys

Microsoft handles encryption of data-at-rest in Microsoft data centers with transparent server-side encryption and auto-rotation of certificates. For customers with regulatory requirements to [manage the Premium encryption key themselves](../admin/service-encryption-byok.md), Premium capacity can be configured to use [Azure Key Vault](/azure/key-vault/general/basic-concepts). Using customer-managed keys (also known as 'bring-your-own-key' or BYOK), is a precaution to ensure that, in the event of a human error by a service operator, customer data cannot be exposed.

Note that [Premium Per User](../admin/service-premium-per-user-faq.yml#using-premium-per-user--ppu-) (PPU) only supports BYOK when it's enabled for the entire Power BI tenant.

## Auditing and monitoring

A wealth of metadata is available for understanding what's happening within your Power BI tenant. The primary source of information is from the Power BI [activity log](../admin/service-admin-auditing.md) which captures information about many different types of activities that users perform. There are also a variety of [REST APIs](/rest/api/power-bi/) that provide additional information about workspaces, apps, datasets, and more. Of particular interest to administrators are the [admin APIs](/rest/api/power-bi/admin) which provide a way to extract metadata for the entire tenant. The [Power BI Management Module](/powershell/power-bi/overview?view=powerbi-ps&preserve-view=true) is a set of PowerShell commands which make it easier to obtain metadata than dealing directly with the APIs (however, substantially more information is available directly from the APIs).

### Auditing

Auditing data is valuable for informing and tracking your adoption goals, helping the Center of Excellence be more effective, ideas for helpful documentation or new training, as well as for governance-related reporting.

Following are a few ideas of the types of things you can do with the information available from the Power BI activity log and APIs:

| **Category of Auditing Data** | **Type of Questions** |
| --- | --- |
| Usage patterns and adoption | What is the most often-used content, by whom?</br></br>How many users are active?</br></br>Are report views trending up or down?</br></br>Is there under-utilized or abandoned content?</br></br>Are viewers using browser or mobile app more often?</br></br>When is content published or updated, and by whom? |
| Governance, security, and compliance | When are workspace roles updated, and by whom?</br></br>How many external users are accessing content?</br></br>Who added or updated a sensitivity label?</br></br>When does a tenant setting change, and by whom?</br></br>What % of report views are based on certified datasets?</br></br>What % of datasets support \&gt;1 report?</br></br>How frequently is content downloaded, and by whom?</br></br>Who generated an embed code for Publish to Web? |
| Architecture reporting and analysis | How many workspaces exist by type?</br></br>How many reports exist by type?</br></br>When is a gateway or data source created or updated? |
| User education and training opportunities | Who started a Power BI trial?</br></br>Who is doing too much sharing from their personal workspace?</br></br>Who is publishing a lot of new datasets?</br></br>Who is doing a lot of exports? |

When considering needs for creating auditing reports, consider the following:

- What does success mean?
- What behaviors do you want to encourage?
- What do you want people to start doing?
- What do you want people to stop doing?

> [!TIP]
> The raw data files which contain the auditing data should be stored in a very secure location, preferably one which is immutable (allowing no modifications or deletions). Immutable storage allows your auditors to rely on this data if required. A service like [Azure Data Lake Storage Gen 2](/azure/storage/blobs/data-lake-storage-introduction) is a flexible and low-cost alternative for this purpose.

### Monitoring

[Microsoft Cloud App Security (MCAS)](https://powerbi.microsoft.com/blog/get-up-to-speed-with-power-bi-and-microsoft-cloud-app-security/) is a cloud access security broker (CASB) which allows administrators to perform activities such as:

- Audit, monitor, and alert based on activities
- Create data loss prevention policies
- Detect unusual behaviors and risky sessions
- Limit activities performed by applications (in conjunction with [Azure Active Directory conditional access app control](/cloud-app-security/proxy-intro-aad))

Some very powerful [Power BI monitoring and protection](https://techcommunity.microsoft.com/t5/security-compliance-and-identity/protect-your-power-bi-instance-using-microsoft-cloud-app/ba-p/2166872) capabilities are available with MCAS. For instance, you could:

- Prohibit all users, or certain users, from downloading a file from the Power BI service when a specific sensitivity label is assigned.
- Receive an alert whenever a tenant setting is updated in the Power BI service (i.e., an administrative activity is detected).
- Detect when suspicious or unusual behaviors have occurred such as massive file downloads or an unusual number of sharing operations in the Power BI service (via built-in anomaly detection).
- Search the activity log for specific activities (such as exports from the Power BI service) for content with a specific sensitivity label assigned.
- Be aware when risky sessions are occurring, such as when the same user account connects from different geographical areas in a narrow time window.
- Find when someone outside a predefined security group views specific content in the Power BI service.

> [!CAUTION]
> Licensing, cost, and administrative permissions for MCAS are all handled separately from Power BI. You can create an [application-specific admin](/cloud-app-security/manage-admins#built-in-cloud-app-security-admin-roles) with permissions scoped to monitoring just the Power BI service.

## Planning for change

Every month, new Power BI features and functionality are released. To be effective, it's crucial for those involved with overseeing the system to stay current.

The [Power BI blog](https://powerbi.microsoft.com/blog/) is the best place for customers to monitor announcements and new releases.

The [Power BI release plan](https://powerbi.microsoft.com/roadmap/) is where customers can find the public roadmap for future features and estimated dates. Sometimes a change that's coming is so important that it's useful to start planning for it well in advance. The planning cycle is in semesters: April-September, and October-March.

> [!IMPORTANT]
> It's difficult to overestimate the importance of staying current. Being a few months behind on announcements can make it difficult to properly oversee Power BI and support the user population efficiently.

## Considerations and key actions

Considerations and key actions you can take to improve system oversight:

- Verify who is permitted to be a Power BI administrator. If possible, reduce the number of people granted this role if it's more than a few people.
- If you have people who occasionally need the Power BI administrator role, consider implementing [Privileged Identity Management](/azure/active-directory/privileged-identity-management/pim-configure) (PIM) in Azure Active Directory for just-in-time access to the role which will expire after a few hours.
- Check the status of cross-training and documentation in place for handling Power BI administration responsibilities.

Considerations and key actions you can take to improve management of the Power BI service:

- Conduct a review of all tenant settings to ensure they are in alignment with [data culture](powerbi-adoption-roadmap-data-culture.md) objectives and [governance](powerbi-adoption-roadmap-governance.md) guidelines and policies. Verify which groups are assigned for each setting.
- Document the tenant settings for the internal Power BI community and post it in the centralized portal. Include which groups a user would need to request to be able to use a feature.
- When user resources have been established (discussed in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article), update the [tenant setting](../admin/service-admin-portal.md#help-and-support-settings) to customize the links under the "get help" menu for directing users to your documentation, community, and help.

Considerations and key actions you can take to improve management of user machines and devices:

- Review your process for how onboarding of new content creators is handled. Determine if new requests for software (such as Power BI Desktop) and user licenses (Pro or Premium Per User) can be handled together to simplify onboarding since new content creators won't always know what to ask for.
- Ensure an automated process is in place to install and update software, drivers, and settings to ensure all users are on the same version.

Considerations and key actions you can take for data architecture planning:

- Assess what your end-to-end data architecture looks like. Make sure you're clear on:
  - How Power BI is currently being used by the different business units in your organization vs. how you want Power BI to be used, and if there's a gap
  - If there are any risks that should be addressed
  - If there are any high-maintenance situations to be addressed
  - What data sources are important for Power BI users, and how they are documented and discoverable
- Review the existing gateways that are being used in your organization. Verify that gateway administrators and users are set correctly. Verify who is supporting each gateway, and that there is a reliable process in place to keep the gateway servers up to date.
- Check the number of personal gateways that are in use, and by whom. If it's significant usage, take steps to move towards further use of the standard mode.

Considerations and key actions you can take to improve management of user licenses:

- Review what the process is for requesting a user license, including any prerequisites.
- Clarify if self-service licensing purchasing is enabled.
- Confirm if Pro and Premium Per User trials are enabled or disabled.

Considerations and key actions you can take to improve cost management:

- Determine what the cost management objectives are and how to balance cost, features, usage patterns, and effective utilization of resources.
- Ensure you have access to the activity log data to assist with cost analysis.
- Schedule a routine (ex: annual) process to evaluate costs.

Considerations and key actions you can take to improve security and data protection:

- Clarify exactly what the expectations are for data protection, and ensure those expectations are communicated to the community of users.
- Understand and document the organizational policies around sharing Power BI content with external users and ensure Power BI service settings support those policies.
- Begin the process of deciding on sensitivity labels if they do not currently exist. Involve the relevant IT teams for decision-making and configuration in Microsoft 365.
- Investigate use of Microsoft Cloud App Security for monitoring of user behavior and activities in the Power BI service.

Considerations and key actions you can take to begin or improve auditing and monitoring:

- Begin retrieving data from the Power BI activity log if you are not currently compiling the raw data. The easiest way to get started is to use the [Get-PowerBIActivityEvent](/powershell/module/microsoftpowerbimgmt.admin/get-powerbiactivityevent?view=powerbi-ps&preserve-view=true) PowerShell cmdlet included with the Power BI Management Module. Retrieve and store the raw data without filtering or formatting, to ensure that all data elements are available for future analysis. A file system or data lake is an ideal location.
- Over time, determine what additional auditing data would be helpful to complement the activity log data.

## Maturity levels

The following maturity levels will help you assess the current state of your Power BI system oversight:

| **Level** | **State of Power BI system oversight** |
| --- | --- |
| 100: Initial | Tenant settings are configured independently by one or more administrators based on their best judgment.</br></br>Architecture needs (such as gateways and capacities) are satisfied on an as-needed basis, though without a strategic plan.</br></br>Power BI activity logs are unused, or selectively used for tactical purposes. |
| 200: Repeatable | Tenant settings are reviewed on a regular basis, and purposefully align with established governance guidelines and policies.</br></br>A small number of specific administrators have been selected who understand well what users are trying to accomplish.</br></br>An effective process exists for users to request licenses and software.</br></br>Sensitivity labels have been configured in Microsoft 365, though usage of labels remains inconsistent. |
| 300: Defined | The tenant settings are fully documented in the community portal for users to reference, including how to request access to the correct groups.</br></br>Cross-training and documentation exists for administrators to ensure continuity and stability.</br></br>Sensitivity labels are assigned to content consistently.</br></br>An automated process is in place to export Power BI activity log and API data to a secure location for reporting and auditing. |
| 400: Capable | Automated policies are configured and actively monitored in Microsoft Cloud App Security for data loss prevention.</br></br>Administrators work closely with COE and governance teams to oversee Power BI with an emphasis on user empowerment within the requisite guardrails.</br></br>Decentralized management of data architecture (such as gateways or capacity management) is effectively handled to balance agility and control.</br></br>Power BI activity log and API data is actively analyzed for monitoring and auditing of Power BI activities. Proactive action is taken based on the data. |
| 500: Efficient | Regular cost management analysis is done to ensure user needs are being met in a cost-effective way.</br></br>Power BI activity log and API data is actively used to inform and improve adoption efforts (in addition to monitoring and auditing of Power BI activities). |

## Next steps

Other helpful resources include:

- [Microsoft Learn – Administer Power BI Part 1](/learn/paths/administer-power-bi-part-1/)
- [Microsoft Learn – Administer Power BI Part 2](/learn/paths/administer-power-bi-part-2/)
- [Administrator In A Day Training – Day 1](https://aka.ms/AdmPBI1)
- [Administrator In A Day Training – Day 2](https://aka.ms/AdmPBI2)
- [Power BI security whitepaper](whitepaper-powerbi-security.md)
- [External guest users whitepaper](whitepaper-azure-b2b-power-bi.md)
- [Planning a Power BI enterprise deployment whitepaper](https://aka.ms/PBIEnterpriseDeploymentWP)
- [Power BI adoption framework](https://github.com/pbiaf/powerbiadoption)
