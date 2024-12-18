---
title: "Microsoft Fabric adoption roadmap: Content delivery scope"
description: "Develop scopes for how data, analytics, and business intelligence (BI) content is owned and managed to drive strong and successful adoption of Microsoft Fabric."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Content delivery scope

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

The four delivery scopes described in this article include [personal](powerbi-implementation-planning-usage-scenario-personal-bi.md), [team](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental](powerbi-implementation-planning-usage-scenario-departmental-bi.md), and [enterprise](powerbi-implementation-planning-usage-scenario-enterprise-bi.md). To be clear, focusing on the scope of a delivered data and business intelligence (BI) solution does refer to the number of people who might view the solution, though the impact is much more than that. The scope strongly influences best practices for not only content distribution, but also [content management](fabric-adoption-roadmap-content-ownership-and-management.md), [security](powerbi-implementation-planning-security-overview.md), and [information protection](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md). The scope has a direct correlation to the level of [governance](fabric-adoption-roadmap-governance.md) (such as requirements for change management, support, or documentation), the extent of [mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md), and needs for [user support](fabric-adoption-roadmap-user-support.md). It also influences [user licensing](/power-bi/enterprise/service-admin-licensing-organization) decisions.

The related [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article makes similar points. Whereas the focus of that article was on the content creator, the focus of this article is on the target content usage. Both inter-related aspects need to be considered to arrive at governance decisions and the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) operating model.

> [!IMPORTANT]
> Not all data and solutions are equal. Be prepared to apply different levels of data management and governance to different teams and various types of content. Standardized rules are easier to maintain. However, flexibility or customization is often necessary to apply the appropriate level of oversight for particular circumstances. Your [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md) can prove invaluable by reaching consensus across stakeholder groups when difficult situations arise.

## Scope of content delivery

The following diagram focuses on the number of _target consumers_ who will consume the content.

:::image type="content" source="media/fabric-adoption-roadmap-content-delivery-scope/target-consumers.svg" alt-text="Diagram shows the four scopes of target consumers, which are described next." border="false":::

The four scopes of content delivery shown in the above diagram include:

- **Personal:** Personal solutions are, as the name implies, intended for use by the creator. Sharing content with others isn't an objective. Therefore, a personal data and BI solution has the fewest number of target consumers.
- **Team:** Collaborates and shares content with a relatively small number of colleagues who work closely together.
- **Departmental:** Delivers content to a large number of consumers, who can belong to a department or business unit.
- **Enterprise:** Delivers content broadly across organizational boundaries to the largest number of target consumers. Enterprise content is most often managed by a centralized team and is subject to additional [governance](fabric-adoption-roadmap-governance.md) requirements.

Contrast the above four scopes of content delivery with the following diagram, which has an inverse relationship with respect to the number of _content creators_.

:::image type="content" source="media/fabric-adoption-roadmap-content-delivery-scope/content-creators.svg" alt-text="Diagram shows the four scopes of content creators, which are described next." border="false":::

The four scopes of content creators shown in the above diagram include:

- **Personal:** Represents the largest number of creators because the [data culture](fabric-adoption-roadmap-data-culture.md) encourages any user to work with data using business-led self-service data and BI methods. Although managed self-service BI methods can be used, it's less common with personal data and BI efforts.
- **Team:** Colleagues within a team collaborate and share with each other by using [business-led self-service](fabric-adoption-roadmap-content-ownership-and-management.md#business-led-self-service) patterns. It has the next largest number of creators in the organization. [Managed self-service](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service) patterns could also begin to emerge as skill levels advance.
- **Departmental:** Involves a smaller population of creators. They're likely to be considered power users who are using sophisticated tools to create sophisticated solutions. [Managed self-service](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service) practices are very common and highly encouraged.
- **Enterprise:** Involves the smallest number of content creators because it typically includes only professional data and BI developers who work in the BI team, the COE, or in IT.

The [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article introduced the concepts of business-led self-service, managed self-service, and enterprise. The most common alignment between ownership and delivery scope is:

- **Business-led self-service ownership:** Commonly deployed as personal and team solutions.
- **Managed self-service ownership:** Can be deployed as personal, team, or departmental solutions.
- **Enterprise ownership:** Typically deployed as enterprise-scoped solutions.

Some organizations also equate self-service content with community-based support. It's the case when self-service content creators and owners are responsible for supporting the content they publish. The [user support](fabric-adoption-roadmap-user-support.md) article describes multiple informal and formal levels for support.

> [!NOTE]
> The term _sharing_ can be interpreted two ways: It's often used in a general way related to sharing content with colleagues, which could be implemented multiple ways. It can also reference a [specific feature in Fabric](/power-bi/collaborate-share/service-share-dashboards), which is a specific implementation where a user or group is granted access to a single item. In this article, the term _sharing_ is meant in a general way to describe sharing content with colleagues. When the per-item permissions are intended, this article will make a clear reference to that feature. For more information, see [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md).

## Personal

The [Personal](powerbi-implementation-planning-usage-scenario-personal-bi.md) delivery scope is about enabling an individual to gain analytical value. It's also about allowing them to more efficiently perform business tasks through the effective personal use of data, information, and analytics. It could apply to any type of information worker in the organization, not just data analysts and developers.

Sharing content with others isn't the objective. Personal content can reside in Power BI Desktop or in a personal workspace in the Fabric portal.

Here are the characteristics of creating content for a personal delivery scope.

- The creator's primary intention is data exploration and analysis, rather than report delivery.
- The content is intended to be analyzed and consumed by one person: the creator.
- The content might be an exploratory proof of concept that may, or may not, evolve into a project.

Here are a few guidelines to help you become successful with content developed for personal use.

- Consider personal data and BI solutions to be like an _analytical sandbox_ that has little formal governance and oversight from the governance team or COE. However, it's still appropriate to educate content creators that some general governance guidelines could still apply to personal content. Valid questions to ask include: Can the creator export the personal report and email it to others? Can the creator store a personal report on a non-organizational laptop or device? What limitations or requirements exist for content that contains sensitive data?
- See the techniques described for business-led self-service, and managed self-service in the [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article. They're highly relevant techniques that help content creators create efficient and personal data and BI solutions.
- Analyze data from the [activity log](/power-bi/enterprise/service-admin-auditing) to discover situations where personal solutions appear to have expanded beyond the original intended usage. It's usually discovered by detecting a significant amount of content sharing from a personal workspace.

> [!TIP]
> For information about how users progress through the stages of user adoption, see the [Microsoft Fabric adoption roadmap maturity levels](fabric-adoption-roadmap-maturity-levels.md). For more information about using the activity log, see [Tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

## Team

The [Team](powerbi-implementation-planning-usage-scenario-team-bi.md) delivery scope is focused on a team of people who work closely together, and who are tasked with solving closely related problems using the same data. Collaborating and sharing content with each other in a workspace is usually the primary objective.

Content is often shared among the team more informally as compared to departmental or enterprise content. For instance, the workspace is often sufficient for consuming content within a small team. It doesn't require the formality of publishing the workspace to distribute it as an app. There isn't a specific number of users when team-based delivery is considered too informal; each team can find the right number that works for them.

Here are the characteristics of creating content for a team delivery scope.

- Content is created, managed, and viewed among a group of colleagues who work closely together.
- Collaboration and co-management of content is the highest priority.
- Formal delivery of content might occur for report viewers (especially for managers of the team), but it's usually a secondary priority.
- Reports aren't always highly sophisticated or attractive; functionality and accessing the information is what matters most.

Here are some guidelines to help you become successful with content developed for team use.

- Ensure the COE is prepared to support the efforts of self-service creators publishing content for their team.
- Make purposeful decisions about how [workspace management](powerbi-implementation-planning-workspaces-workspace-level-planning.md) will be handled. The workspace is a place to organize related content, a permissions boundary, and the scope for a Power BI app. It's tempting to start with one workspace per team, but that might not be flexible enough to satisfy all needs.
- See the techniques described for business-led self-service and managed self-service in the [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article. They're highly relevant techniques that help content creators create efficient and effective team data and BI solutions.
  
> [!TIP]
> For more information, see [Workspace-level planning](powerbi-implementation-planning-workspaces-workspace-level-planning.md).

## Departmental

Content is delivered to members of a department or business unit. Content distribution to a larger number of consumers is a priority for [departmental](powerbi-implementation-planning-usage-scenario-departmental-bi.md) delivery scopes.

Here are the characteristics of departmental content delivery.

- A few content creators typically publish content for colleagues to consume.
- Formal delivery of reports by using Power BI apps is a high priority to ensure consumers have the best experience.
- Additional effort is made to deliver more sophisticated and polished reports. Following best practices for data preparation and higher quality data modeling is also expected.
- Needs for change management and [lifecycle management](/fabric/cicd/cicd-overview) begin to emerge to ensure release stability and a consistent experience for consumers.

Here are a few guidelines to help you become successful with departmental BI delivery.

- Ensure that the COE is prepared to support the efforts of self-service creators. Creators who publish content used throughout their department or business unit might emerge as candidates to become champions. Or, they might become candidates to join the COE as a [satellite member](fabric-adoption-roadmap-center-of-excellence.md#structuring-a-coe).
- Make purposeful decisions about how [workspace management](/power-bi/collaborate-share/service-create-the-new-workspaces) will be handled. The workspace is a place to organize related content, a permissions boundary, and the scope for an app. Several workspaces will likely be required to meet all the needs of a large department or business unit.
- Plan how [Power BI apps](/power-bi/consumer/end-user-apps) will distribute content to the enterprise. An app can provide a significantly better user experience for consuming content. In many cases, content consumers can be granted permissions to view content via the app only, reserving workspace permissions management for content creators and reviewers only. The use of app audience groups allows you to _mix and match_ content and target audience in a flexible way.
- Be clear about what data quality validations have occurred. As the importance and criticality level grows, expectations for trustworthiness grow too.
- Ensure that adequate training, mentoring, and documentation is available to support content creators. Best practices for data preparation, data modeling, and data presentation will result in better quality solutions.
- Provide guidance on the best way to use the [promoted endorsement](/power-bi/collaborate-share/service-endorse-content#promote-content), and when the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) could be permitted for departmental solutions.
- Ensure that the owner is identified for all departmental content. Clarity on ownership is helpful, including who to contact with questions, feedback, enhancement requests, or support requests. In the Fabric portal, content owners can set the [contact list property](/power-bi/create-reports/service-item-contact) for many types of items (like reports and dashboards). The contact list is also used in security workflows. For example, when a user is sent a URL to open an app but they don't have permission, they'll be presented with an option to make a request for access.
- Consider using [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) in conjunction with separate [workspaces](/power-bi/collaborate-share/service-create-the-new-workspaces). Deployment pipelines can support development, test, and production environments, which provide more stability for consumers.
- Consider enforcing the use of [sensitivity labels](/power-bi/enterprise/service-security-data-protection-overview) to implement [information protection](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) on all content.
- Include consistent branding on reports by:
  - Using departmental colors and styling to indicate who produced the content. For more information, see [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md).
  - Adding a small image or text label to the report footer, which is valuable when the report is exported from the Fabric portal.
  - Using a standard Power BI Desktop template file. For more information, see [Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md).
- Apply the techniques described for business-led self-service and managed self-service content delivery in the [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article. They're highly relevant techniques that can help content creators to create efficient and effective departmental solutions.

## Enterprise

[Enterprise](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) content is typically managed by a centralized team and is subject to additional governance requirements. Content is delivered broadly across organizational boundaries.

Here are the characteristics of enterprise content delivery.

- A centralized team of experts manages the content end-to-end and publishes it for others to consume.
- Formal delivery of data solutions like reports, lakehouses, and Power BI apps is a high priority to ensure consumers have the best experience.
- The content is highly sensitive, subject to regulatory requirements, or is considered extremely critical.
- Published enterprise-level semantic models and dataflows might be used as a source for self-service creators, thus creating a chain of dependencies to the source data.
- Stability and a consistent experience for consumers are highly important. Application lifecycle management, such as [deployment pipelines](/power-bi/create-reports/deployment-pipelines-overview) and [DevOps techniques](https://powerbi.microsoft.com/blog/automate-deployments-with-deployment-pipelines-api-preview/), is commonly used. Change management processes to review and approve changes before they're deployed are commonly used for enterprise content, for example, by a change review board or similar group.
- Processes exist to gather requirements, prioritize efforts, and plan for new projects or enhancements to existing content.
- Integration with other enterprise-level data architecture and management services could exist, possibly with other Azure services and Power Platform products.

Here are some guidelines to help you become successful with enterprise content delivery.

- Governance and oversight techniques described in the [governance](fabric-adoption-roadmap-governance.md) article are relevant for managing an enterprise solution. Techniques primarily include change management and [lifecycle management](/fabric/cicd/cicd-overview).
- Plan for how to effectively use [Premium Per User](/power-bi/enterprise/service-premium-per-user-faq) or [Fabric capacity](/fabric/enterprise/licenses) licensing per workspace. Align your workspace management strategy, like how [workspaces](/power-bi/collaborate-share/service-create-the-new-workspaces) will be organized and secured, to the planned [licensing](/power-bi/enterprise/service-admin-licensing-organization) strategy.
- Plan how Power BI apps will distribute enterprise content to consumers. An app can provide a significantly better user experience for consuming content. Align the app distribution strategy with your workspace management strategy.
- Consider enforcing the use of [sensitivity labels](/power-bi/enterprise/service-security-data-protection-overview) to implement [information protection](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) on all content.
- Implement a rigorous process for use of the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for enterprise reports and apps. Data assets can be certified, too, when there's the expectation that self-service creators will build solutions based on them. Not all enterprise content needs to be certified, but much of it probably will be.
- Make it a common practice to announce when changes will occur. For more information, see the [community of practice](fabric-adoption-roadmap-community-of-practice.md) article for a description of communication types.
- Include consistent branding on reports, by:
  - Using specific colors and styling, which can also indicate who produced the content. For more information, see [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md).
  - Adding a small image or text label to the report footer, which can be valuable when the report is exported from the Fabric portal.
  - Using a standard Power BI Desktop template file. For more information, see [Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md).
- Actively use the [lineage view](/power-bi/collaborate-share/service-data-lineage) to understand dependencies, perform impact analysis, and communicate to downstream content owners when changes will occur.
- See the techniques described for enterprise content delivery in the [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article. They're highly relevant techniques that help content creators create efficient and effective enterprise solutions.
- See the techniques described in the [system oversight](fabric-adoption-roadmap-system-oversight.md) article for auditing, governing, and the oversight of enterprise content.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Considerations and key actions you can take to strengthen your approach to content delivery.

> [!div class="checklist"]
> - **Align goals for content delivery:** Ensure that guidelines, documentation, and other resources align with the strategic goals defined for Fabric adoption.
> - **Clarify the scopes for content delivery in your organization:** Determine who each scope applies to, and how each scope aligns with governance decisions. Ensure that decisions and guidelines are consistent with how [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) is handled.
> - **Consider exceptions:** Be prepared for how to handle situations when a smaller team wants to publish content for an enterprise-wide audience.
>   - Will it require the content be owned and managed by a centralized team? For more information, see the [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article, which describes an inter-related concept with content delivery scope.
>   - Will there be an approval process? [Governance](fabric-adoption-roadmap-governance.md) can become more complicated when the content delivery scope is broader than the owner of the content. For example, when an app that's owned by a divisional sales team is distributed to the entire organization.
> - **Create helpful documentation:** Ensure that you have sufficient training documentation and support so that your content creators understand when it's appropriate to use [workspaces](/power-bi/collaborate-share/service-create-the-new-workspaces), [apps](/power-bi/collaborate-share/service-create-distribute-apps), or [per-item sharing (direct access or link)](https://powerbi.microsoft.com/blog/announcing-the-new-sharing-experience/).
> - **Create a licensing strategy:** Ensure that you have a specific strategy in place to handle [Fabric licensing](/fabric/enterprise/licenses) considerations. Create a process for how workspaces could be assigned each license type, and the prerequisites required for the type of content that could be assigned to Premium.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess content delivery scope.

- Do central teams that are responsible for Fabric have a clear understanding of who creates and delivers content? Does it differ by business area, or for different content item types?
- Which [usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) are in place, such as [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md), [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md), or [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md)? How prevalent are they in the organization? Are there advanced scenarios, like [advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md) or [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md), or niche scenarios, like [self-service real-time analytics](powerbi-implementation-planning-usage-scenario-self-service-real-time-analytics.md)?
- For the identified content delivery scopes in place, to what extent are guidelines being followed?
- Are there trajectories for helpful self-service content to be "promoted" from personal to team content delivery scopes and beyond? What systems and processes enable sustainable, bottom-up scaling and distribution of useful self-service content?
- What are the guidelines for publishing content to, and using, personal workspaces?
- Are personal workspaces assigned to dedicated [Fabric capacity](/fabric/enterprise/licenses)? In what circumstances are personal workspaces intended to be used?
- On average, how many reports does someone have access to? How many reports does an executive have access to? How many reports does the CEO have access to?
- If your organization is using Fabric or Power BI today, does the current [workspace setup](powerbi-implementation-planning-workspaces-overview.md) comply with the content ownership and delivery strategies that are in place?
- Is there a clear licensing strategy? How many licenses are used today? How many tenants and capacities exist, who uses them, and why?
- How do central teams decide what gets published to Premium (or Fabric) dedicated capacity, and what uses shared capacity? Do development workloads use separate Premium Per User (PPU) licensing to avoid affecting production workloads?

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your content delivery.

| **Level** | **State of content delivery** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Content is published for consumers by self-service creators in an uncontrolled way, without a specific strategy. |
| 200: Repeatable | &bull;&nbsp;Pockets of good practices exist. However, good practices are overly dependent on the knowledge, skills, and habits of the content creator. |
| 300: Defined | &bull;&nbsp;Clear guidelines are defined and communicated to describe what can and can't occur within each delivery scope. These guidelines are followed by some—but not all—groups across the organization. |
| 400: Capable | &bull;&nbsp;Criteria are defined to align governance requirements for self-service versus enterprise content. <br/><br/>&bull;&nbsp;Guidelines for content delivery scope are followed by most, or all, groups across the organization. <br/><br/>&bull;&nbsp;Change management requirements are in place to approve critical changes for content that's distributed to a larger-sized audience. <br/><br/>&bull;&nbsp;Changes are announced and follow a communication plan. Content creators are aware of the downstream effects on their content. Consumers are aware of when reports and apps are changed. |
| 500: Efficient | &bull;&nbsp;Proactively take steps to communicate with users occur when any concerning activities are detected in the activity log. Education and information are provided to make gradual improvements or reduce risk. <br/><br/>&bull;&nbsp;The business value that's achieved for deployed solutions is regularly evaluated. |

## Related content

In the [next article](fabric-adoption-roadmap-center-of-excellence.md) in the Microsoft Fabric adoption roadmap series, learn about the Center of Excellence (COE).
