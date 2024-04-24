---
title: "Power BI implementation planning: Auditing and monitoring"
description: "An introduction to the Power BI auditing and monitoring planning articles."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 08/31/2023
---

# Power BI implementation planning: Auditing and monitoring

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces the Power BI auditing and monitoring articles. These articles are targeted at multiple audiences:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators might need to collaborate with information security and other relevant teams.
- **Center of Excellence, IT, and BI team:** The teams that are also responsible for overseeing Power BI. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.
- **Content creators and workspace administrators:** Users who need to understand usage and adoption for the content that they've created, published, and shared with others in the organization.

The terms _auditing_ and _monitoring_ are closely related.

- **Auditing:** Actions taken to understand a system, its user activities, and related processes. Auditing activities can be manual, automated, or a combination. An auditing process might focus on one specific aspect (for example, auditing security for a workspace). Or it might reference an end-to-end auditing solution, which involves extracting, storing, and transforming data so that you can analyze and act upon it.
- **Monitoring:** Ongoing activities that inform you about what's occurring. Monitoring usually involves alerting and automation, though sometimes monitoring is done manually. Monitoring can be set up for a process you've selected to audit (for example, notifications when a specific tenant setting changes).

The primary purpose of this series of auditing and monitoring articles is to help you understand _how_ Power BI is used to oversee and govern your Power BI implementation.

Troubleshooting and performance tuning are important components of auditing and monitoring your data assets. However, providing deep performance tuning guidance isn't a goal of these articles. Also, these articles aren't intended to provide a complete reference of all options available to developers.

> [!IMPORTANT]
> We recommend that you closely follow the [Power BI release plan](https://powerbi.microsoft.com/roadmap/) to learn about future enhancements of the auditing and monitoring capabilities.

## Value of auditing and monitoring

The data that's produced from auditing is incredibly valuable for many reasons. Most people think of auditing as an oversight and control function. While that's true, you can also audit data to improve the user experience.

This article describes some valuable ways you can use auditing data.

### Analyze adoption efforts

As described in the [Fabric adoption roadmap](fabric-adoption-roadmap.md), adoption isn't just about _using_ the technology regularly; it's also about using it _effectively_. Adopting a technology like Power BI can be considered from [three inter-related perspectives](fabric-adoption-roadmap-maturity-levels.md):

- **Organizational adoption:** The effectiveness of Power BI governance. It also refers to data management practices that support and enable business intelligence (BI) efforts.
- **User adoption:** The extent to which Power BI consumers and creators continually increase their knowledge. It's concerned with whether they're actively using Power BI, and whether they're using it in an effective way.
- **Solution adoption:** The impact and business value achieved for individual requirements and deployed Power BI items (like semantic models—[previously known as datasets](../connect-data/service-datasets-rename.md)—and reports).

All types of auditing data can be used in many ways to assess and contribute towards actions that improve each aspect of adoption.

### Understand usage patterns

Analyzing usage patterns is primarily about understanding the user activities that occur in your Power BI tenant.

It's helpful to have the data to support whether actual user behavior meets expectations. For example, a manager might be under the impression that a set of reports is critical, whereas the auditing data shows that the reports aren't regularly accessed.

> [!IMPORTANT]
> If you're not already extracting and storing user activities data, make that an urgent priority. Even if you're not ready to build an end-to-end auditing solution, ensure that you're extracting and storing all the activity log data. For more information about the decisions and activities involved, and the different ways to obtain the data, see [Access user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

The following sections describe some of the most common usage patterns you should understand.

#### Content usage

It's valuable to understand the extent to which content is used. The types of questions you might ask include:

- What content is viewed most frequently?
- What content is viewed by the greatest number of users?
- What content is considered most critical (and is therefore vital to the organization) based on its usage patterns?
- What content is frequently used by executives and senior leadership?
- What content requires the most stability and support (due to a high level of usage or usage by a critical user audience)?
- What content should be [endorsed](/power-bi/collaborate-share/service-endorsement-overview) (certified or promoted) based on its usage patterns?
- What percentage of content is endorsed (certified or promoted)?
- Are there high numbers of report views for non-certified reports?
- What content has consistent usage versus sporadic usage?
- What content is updated most frequently, when, and by which users?
- What content _isn't_ used, with the potential to be retired? (For more information about creating an inventory of data assets, see [Access tenant inventory data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-tenant-inventory-data).)
- What type of devices are used to view reports?
- Are there unexpected, or irregular, usage patterns that raise concerns?

#### User activities

It's useful to understand which users are most active. The types of questions you might ask include:

- Which content consumers are most active?
- Which content creators are most active?
- Which content creators publish the most content?
- Which content creators publish the content that's used by the most content consumers?
- How many distinct (licensed) users are there? What percentage of those users are active?
- Are there content creators who are assigned a Power BI Pro or Power BI Premium Per User (PPU) license, but aren't actively using that license?
- Are the most active users members of your Power BI [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network)?

> [!TIP]
> For analytical reporting, it's important that you add classifications to the data model to analyze users based on their level of usage, or to analyze content based on its level of usage. For more information, see [Create classifications](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#create-classifications)

For more information about the Power BI activity log, see [Access user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data). For more information about pre-built reports, see [What is the admin monitoring workspace?](/fabric/admin/monitoring-workspace).

### Understand published items

It's helpful to have an inventory of the content that exists in your Power BI tenant. Whereas the previous section is concerned with _user activities_, this section is concerned with a _tenant inventory_.

A tenant inventory is a snapshot of metadata at a given point in time. It describes what's been published to the Power BI service, and it includes an inventory of all workspaces, all reports, all semantic models, and more. It can also include metadata for data sources or supporting resources, like gateways and capacities.

A tenant inventory is helpful to:

- **Understand how much content you have and where:** Because the tenant inventory includes all published items, it represents a complete inventory at that time. You can use it to identify where content is published, and its dependencies and lineage.
- **Examine the ratio of semantic models to reports:** You can use lineage information from the tenant inventory to determine the extent to which data reuse occurs. For example, if you discover many duplicate semantic models, it could justify user training on [shared semantic models](/power-bi/connect-data/service-datasets-across-workspaces). You might also decide that a consolidation project to reduce the number of semantic models is justified.
- **Understand trends between points in time:** You can compare multiple snapshots to identify trends. For example, you might find that a large number of new items are published every month. Or you might you discover that users are republishing a new report (with a different report name) every time they modify it. Those types of discoveries should prompt you to improve user training.
- **Scrutinize user permissions:** You can gain valuable insight into how user permissions are assigned. For example, you might routinely analyze which users have access to what content. You might undertake further investigation to determine whether asset oversharing is occurring. One approach you can take is to correlate certain [sensitivity labels](powerbi-implementation-planning-info-protection.md) (such as _Highly Restricted_) with high numbers of user permission assignments.
- **Understand lineage and find highly used data sources and gateways:** By correlating the lineage information from the tenant inventory with user activities, you can identify the most frequently used data sources and gateways.
- **Find unused content:** You can compare your tenant inventory to the activity log to find unused (or under-utilized) content. For example, there are 20 reports in a workspace, yet only 12 reports have recent data in the activity log. You can investigate why the other eight reports aren't used, and whether they should be retired. Discovery of unused content might help you detect Power BI solutions that need further development because they aren't useful.

> [!TIP]
> We recommend that you store your tenant inventory snapshot every week or every month. Also, by combining activity log data with your tenant inventory snapshot, you can produce a complete picture and enhance the value of the data.

For more information about the tenant inventory, see [Access tenant inventory data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-tenant-inventory-data).

### Educate and support users

Auditing data allows you to gain a deep understanding of how users in your organization are using Power BI. In turn, your ability to educate and support users can improve dramatically.

Based on actual user data, here are some examples of the types of actions you might take.

- **Provide helpful information to users:** When you see an activity for the first time (for example, the first time a user publishes a report), you can send them an email with information about your internal best practices for [workspaces](powerbi-implementation-planning-workspaces-overview.md) and [security](powerbi-implementation-planning-security-overview.md).
- **Teach users a better way:** When you see certain activities that concern you (for example, a significant and recurring number of report exports), you can contact the user. You can then explain the downsides of their actions and provide them with a better alternative.
- **Include in office hours:** Based on recent activities, you can choose to discuss a relevant topic during [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours).
- **Improve training curriculum:** To better prepare new users (and avoid the same missteps you see happening with existing users), you can improve or expand your [training](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training) content. You might also conduct some cross-training sessions for your [support](fabric-adoption-roadmap-user-support.md) team.
- **Improve the centralized portal:** To improve consistency, you can invest time by adding or changing the guidance and resources available in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal).

### Mitigate risk

Auditing data helps you understand what's happening in your Power BI tenant. This data allows you to mitigate risk in various ways.

Auditing data helps you to:

- **Govern the Power BI tenant:** Find out whether users are following your [governance](fabric-adoption-roadmap-governance.md) guidelines and policies. For example, you might have a governance policy that requires all content that's published to a particular workspace be [certified](/power-bi/collaborate-share/service-endorse-content#certify-content). Or, you might have guidelines for when [groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups) (rather than users) should be used for security. The [activity log](/power-bi/enterprise/service-admin-auditing), your tenant inventory (described previously), and [admin APIs](/rest/api/power-bi/) are helpful resources to help you govern your Power BI tenant.
- **Review security:** Determine whether there are [security](powerbi-implementation-planning-security-overview.md) concerns. For example, you might see overuse of sharing from a personal workspace. Or you might see unrelated content published to a single [workspace](powerbi-implementation-planning-workspaces-overview.md) (which leads to more complicated security for the items in such a broadly defined workspace). The [activity log](/power-bi/enterprise/service-admin-auditing), your tenant inventory (described previously), and the [admin APIs](/rest/api/power-bi/) are helpful for security auditing.
- **Minimize security issues:** Use the activity log data to avoid or minimize the effect of security issues. For example, you might detect that an organization-wide sharing link was used in an unexpected way. By noticing this event in the activity log shortly after it happens, you can take action to resolve the issue before the link is used inappropriately.
- **Monitor tenant setting changes:** Use the activity log data to determine when a [tenant setting](/power-bi/admin/service-admin-portal-about-tenant-settings) has changed. If you see that an unexpected change occurred, or that it was done by an unexpected user, you can act quickly to correct or revert the setting.
- **Review data sources:** Determine whether unknown or unexpected data sources are used by semantic models, dataflows, or datamarts. You might also determine what types of data source are in use (such as files or databases). You might also check whether files are stored in an appropriate location (such as OneDrive for work or school).
- **Information protection:** Review how sensitivity labels are used to reduce the risk of data leakage and misuse of data. For more information, see the [information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) series of articles.
- **Mentoring and user enablement:** Take action to change user behaviors when necessary. As you gain more knowledge about what users need and what actions they are taking, you can influence [mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) activities.
- **Monitor tenant setting changes:** Use the activity log data to determine when a [tenant setting](/power-bi/admin/service-admin-portal-about-tenant-settings) has changed. If you see that an unexpected change has occurred, or that it was done by an unexpected user, you can act quickly to correct or revert the setting. You can also use the [Get Tenant Settings](/rest/api/fabric/admin/tenants/get-tenant-settings) REST API to regularly extract a snapshot of the tenant settings.

### Improve compliance

Auditing data is critical to strengthen your compliance status and respond to formal requests in different scenarios.

The following table provides several examples.

| **Type of requirement** | **Example** |
| --- | --- |
| **Regulatory requirements:** You need data to strengthen your compliance status for industry, governmental, or regional regulatory requirements. | You have a compliance requirement to track where personal data exists. <br/><br/>[Data Loss Prevention (DLP) for Power BI](powerbi-implementation-planning-data-loss-prevention.md) is one option for detecting certain types of sensitive data that's stored in published semantic models. <br/><br/>The [metadata scanning APIs](/fabric/governance/metadata-scanning-overview) are another option for locating personal data. For example, you could check for certain column names or measure names that exist within published semantic models. |
| **Organizational requirements:** You have internal governance, security, or data management requirements. | You have an internal requirement to use [row-level security](/fabric/security/service-admin-row-level-security) (RLS) on all certified semantic models. The [Get Datasets As Admin API](/rest/api/power-bi/admin/datasets-get-datasets-as-admin) can help you verify whether this requirement is being met. <br/><br/>Or, you have an internal requirement that [sensitivity labels are mandatory](powerbi-implementation-planning-info-protection.md#mandatory-labeling-power-bi-content) for all content in Power BI. You can use the [metadata scanning APIs](/fabric/governance/metadata-scanning-overview) to verify which sensitivity labels have been applied to Power BI content. |
| **Contractual requirements:** You have contractual requirements with partners, vendors, or customers. | You have a customer that provides your organization with data. According to your agreement with the customer, the data must be stored in a specific geographic region. You can use the [Get Capacities API](/rest/api/power-bi/capacities/get-capacities) to verify which region a capacity is assigned to. You can use the [metadata scanning APIs](/fabric/governance/metadata-scanning-overview) or the [Get Groups As Admin API](/rest/api/power-bi/admin/groups-get-groups-as-admin) to verify which capacity a workspace is assigned to. |
| **Internal audit requests:** You need to fulfill requests made by internal auditors. | Your organization conducts an internal security audit every quarter. You can use several APIs to audit requests for details about permissions in Power BI. Examples include the [metadata scanning APIs](/fabric/governance/metadata-scanning-overview), the [Get User Artifact Access As Admin API](/rest/api/power-bi/admin/users-get-user-artifact-access-as-admin) for report sharing, the [Get Group Users As Admin API](/rest/api/power-bi/admin/groups-get-group-users-as-admin) for workspace roles, and the [Get App Users As Admin API](/rest/api/power-bi/admin/apps-get-app-users-as-admin) for Power BI app permissions. |
| **External audit requests:** You need to respond to requests made by external auditors. | You receive a request from the auditors to summarize how all your Power BI data assets are classified. The [metadata scanning APIs](/fabric/governance/metadata-scanning-overview) are one way to compile the sensitivity labels that are applied to Power BI content. |

### Manage licenses and costs

Because auditing data contains information about actual user activities, it can help you [manage costs](fabric-adoption-roadmap-system-oversight.md#cost-management) in various ways.

You can use the auditing data to:

- **Understand the mix of user licenses:** To reduce cost, consider reassigning unused [user licenses](/power-bi/fundamentals/service-features-license-type) (Pro or PPU) to other users. You might also be able to reassign a user to a Free user license. When there are many consumers who only view content, it can be more cost effective to use a [Power BI Premium](/power-bi/fundamentals/service-features-license-type#premium-capacity) (P SKU) capacity or Fabric F64 or greater capacity with Free user licenses (known as unlimited content distribution).
- **Assess the use of capacity licenses:** Assess whether a Power BI capacity (purchased with a P SKU, EM SKU, or A SKU) is [sized](/power-bi/enterprise/service-premium-what-is#capacity-nodes) appropriately for your workload and usage patterns. To balance cost with decentralized management needs, you might consider using multiple decentralized capacities (for example, three P1 capacities that are each managed by a different team). To reduce cost, you might provision one larger capacity (for example, a P3 capacity that's managed by a centralized team).
- **Monitor the use of capacity autoscale:** Determine whether [Autoscale](/power-bi/enterprise/service-premium-auto-scale) (available with Power BI Premium) is set up in a cost-effective way. If autoscale is invoked too frequently, it can be more cost-effective to scale up to a higher P SKU (for example, from a P1 capacity to a P2 capacity). Or, you could scale out to more capacities (for example, provision another P1 capacity).
- **Perform chargebacks:** Perform intercompany chargebacks of Power BI costs based on which users are using the service. In this situation, you should determine which [activities](/power-bi/enterprise/service-admin-auditing#operations-available-in-the-audit-and-activity-logs) in the activity log are important, and correlate those activities to business units or departments.
- **View trials:** The activity log records when users sign up for a [PPU trial](/power-bi/fundamentals/service-self-service-signup-purchase-for-power-bi#information-about-power-bi-trials). That information can prepare you to purchase a full license for those users before their trial period ends.

### Performance monitoring

Certain types of auditing data include information that you can use as an input to performance tuning activities.

You can use auditing data to monitor:

- The levels of semantic model usage, when, and by which users.
- The queries submitted by users who open [live connection](/power-bi/connect-data/desktop-report-lifecycle-datasets) reports.
- Which composite models depend on a [shared semantic model](/power-bi/connect-data/service-datasets-across-workspaces).
- Details of [data refresh](/power-bi/connect-data/refresh-data) operations.
- When a [data gateway](/power-bi/connect-data/service-gateway-onprem) is used for queries or data refresh operations.
- Which data sources are used, how frequently, and by which users.
- When [query caching](/power-bi/connect-data/power-bi-query-caching) is enabled for semantic models.
- When [query folding](/power-query/power-query-folding) isn't occurring.
- The number of [active DirectQuery connections](/power-bi/connect-data/desktop-directquery-about#maximum-number-of-connections-option-for-directquery) for data sources.
- The [data storage mode(s)](/power-bi/transform-model/desktop-storage-mode) used by semantic models.

For more information, see [Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md).

## Related implementation planning content

The remainder of the auditing and monitoring content is organized into the following articles.

- **[Report-level auditing](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md):** Techniques that report creators can use to understand which users are using the reports that they create, publish, and share.
- **[Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md):** Methods that data creators can use to track the performance and usage patterns of data assets that they create, publish, and share.
- **[Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md):** Key decisions and actions administrators can take to create an end-to-end auditing solution.
- **[Tenant-level monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md):** Tactical actions administrators can take to monitor the Power BI service, updates, and announcements.

## Related content

In the [next article in this series](powerbi-implementation-planning-auditing-monitoring-report-level-auditing.md), learn about report-level auditing.
