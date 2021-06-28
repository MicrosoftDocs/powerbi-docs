---
title: "Power BI adoption roadmap: Content delivery scope"
description: Develop scopes for how BI content is owned and managed to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: Content delivery scope

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

The four delivery scopes described in this article include personal BI, team BI, departmental BI, and enterprise BI. To be clear, focusing on the scope of a delivered BI solution does refer to the number of people who may view the solution, though the impact is much more than that. The scope strongly influences best practices for content distribution, sharing, security, and information protection. The scope has a direct correlation to the level of [governance](powerbi-adoption-roadmap-governance.md) (such as requirements for change management, support, or documentation), the extent of [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md), and needs for [user support](powerbi-adoption-roadmap-user-support.md). It also has influence on [user licensing](../admin/service-admin-licensing-organization.md) decisions.

The related [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article makes similar points. Whereas the focus of that article was on the content creator, the focus of this article is on the target content usage. Both inter-related aspects need to be considered to arrive at governance decisions and the Center of Excellence (COE) operating model.

> [!IMPORTANT]
> Not all data and solutions are equal. Be prepared to apply different levels of data management and governance to different teams and various types of content. Standardized rules are easier to maintain, however flexibility or customization is often necessary to apply the appropriate level of oversight for particular circumstances. Your [executive sponsor](powerbi-adoption-roadmap-executive-sponsorship.md) can prove invaluable by reaching consensus across stakeholder groups when difficult situations arise.

## Scope of content delivery

The following image focuses on the number of target users who will consume the content.

:::image type="content" source="media/powerbi-adoption-roadmap-content-delivery-scope/powerbi-adoption-roadmap-target-consumers.png" alt-text="Image shows the four scopes of target consumers, which are described next.":::

The four scopes of content delivery shown in the above image include:

- **Personal BI:** Personal BI solutions are, as the name implies, intended for use by the creator. So, sharing content with others isn't an objective. Therefore, personal BI has the fewest number of target consumers.
- **Team BI:** Collaborates and shares content with a relatively small number of colleagues who work closely together.
- **Departmental BI:** Delivers content to a large number of consumers, who can belong to a department or business unit.
- **Enterprise BI:** Delivers content broadly across organizational boundaries to the largest number of target consumers. Enterprise content is most often managed by a centralized team and is subject to additional governance requirements.

Contrast the above four scopes of content delivery with the following image, which has an inverse relationship with respect to the number of _content creators_.

:::image type="content" source="media/powerbi-adoption-roadmap-content-delivery-scope/powerbi-adoption-roadmap-content-creators.png" alt-text="Image shows the four scopes of content creators, which are described next.":::

The four scopes of content creators shown in the above image include:

- **Personal BI:** Represents the largest number of creators because any user can work with data using business-led self-service BI methods. Although managed self-service BI methods can be used, it's less common with personal BI.
- **Team BI:** Colleagues within a team collaborate and share with each other using business-led self-service BI patterns. It has the next largest number of creators in the organization. Managed self-service BI patterns may also begin to emerge as skill levels advance.
- **Departmental BI:** Involves a smaller population of creators. They are likely to be considered power users who are using sophisticated tools to create sophisticated solutions. Managed self-service BI practices are very common and highly encouraged.
- **Enterprise BI:** Involves the smallest number of content creators because it typically includes only professional BI developers who work in the BI team, the COE, or in IT.

The [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article introduced the concepts of business-led self-service BI, managed self-service BI, and enterprise BI. The most common alignment between ownership and delivery scope is:

- **Business-led self-service BI ownership:** Commonly deployed as personal and team BI solutions.
- **Managed self-service BI ownership:** Can be deployed as personal, team, or departmental BI solutions.
- **Enterprise BI ownership:** Deployed as enterprise BI-scoped solutions.

Some organizations also equate self-service content with community-based support. It's the case when self-service content creators and owners are responsible for supporting the content they publish. The [user support](powerbi-adoption-roadmap-user-support.md) article describes multiple informal and formal levels for support.

> [!NOTE]
> The term _sharing_ can be interpreted two ways: It's often used in a general way related to sharing content with colleagues, which could be implemented multiple ways. It can also reference a [specific feature in Power BI](../collaborate-share/service-share-dashboards.md), which is a specific implementation where a user or group is granted read-only access to a single artifact. In this article, the term _sharing_ is meant in a general way to describe sharing content with colleagues. When the sharing feature is intended, this article will make a clear reference to that feature.

## Personal BI

Personal BI is about enabling an individual to gain analytical value. It's also about allowing them to more efficiently perform business tasks through the effective personal use of data, information, and analytics. It could apply to any type of information worker in the organization, not just data analysts and developers.

Sharing of content with others isn't the objective. Personal content can reside in Power BI Desktop or in a personal workspace in the Power BI service. Usage of the personal workspace is permitted with the free Power BI license.

Characteristics of personal BI:

- The creator's primary intention is data exploration and analysis, rather than report delivery.
- The content is intended to be analyzed and consumed by one person: the creator.
- The content may be an exploratory proof of concept that may, or may not, evolve into a project.

Guidelines for being successful with personal BI:

- Consider personal BI solutions are like an _analytical sandbox_ that has little formal governance and oversight from the governance team or COE. However, it's still appropriate to educate content creators that some general governance guidelines may still apply to personal content. Valid questions to ask include: Can the creator export the personal report and email it to others? Can the creator store a personal report on a non-organizational laptop or device? What limitations or requirements exist for content that contains sensitive data?
- See the techniques described for business-led self-service BI, and managed self-service BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article. They are highly relevant techniques that help content creators create efficient and personal BI solutions.
- Analyze data from the [activity log](../admin/service-admin-auditing.md) to discover situations where personal BI solutions appear to have expanded beyond the original intended usage. It's usually discovered by detecting content sharing from a personal workspace.

> [!TIP]
> See the [adoption maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article for information about how users progress through the stages of user adoption. See the [system oversight](powerbi-adoption-roadmap-system-oversight.md#auditing-and-monitoring) article for information about usage tracking via the activity log.

## Team BI

Team BI is focused on a team of people who work closely together, and who are tasked with solving closely related problems using the same data. Primary objectives are workspace collaboration and content sharing with each other. To support these objectives, each team members must have either a [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md) or [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) license.

Content is often shared among the team informally than is the case for departmental or enterprise BI. For instance, the workspace is often a suitable place to consume content within a small team. It doesn't require for formality of publishing the workspace to distribute it as an app. Also, there isn't a specific number of users when team-based delivery is considered too informal; each team can find the right number that works for them.

Characteristics of team BI:

- Content is created, managed, and viewed among a group of colleagues who work closely together.
- Collaboration and co-management of content is the highest priority.
- Formal delivery of reports may occur by report viewers (especially for managers of the team), but it's usually a secondary priority.
- Reports aren't always highly sophisticated or attractive; functionality and accessing the information is what matters most.

Guidelines for being successful with team BI:

- Ensure the COE is prepared to support the efforts of self-service creators publishing content for their team.
- Make purposeful decisions about how [workspace management](../collaborate-share/service-create-the-new-workspaces.md) will be handled. The workspace is a place to organize related content, a permissions boundary, and the scope for an app. It's tempting to start with one workspace per team, but that may not be flexible enough to satisfy all needs.
- See the techniques described for business-led self-service BI and managed self-service BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article. They are highly relevant techniques that help content creators create efficient and effective team BI solutions.

## Departmental BI

Content is delivered to members of a department or business unit. Content distribution to a larger number of consumers is a priority for departmental BI.

Usually there's a much larger number of consumers who are content viewers (versus a much smaller number of content creators). Therefore, a combination of [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md) licenses, [Premium Per User](../admin/service-premium-per-user-faq.yml) licenses, and/or [Power BI Premium](../admin/service-premium-what-is.md#subscriptions-and-licensing) subscriptions may be used.

Characteristics of departmental BI delivery:

- A few content creators typically publish content for colleagues to consume.
- Formal delivery of reports and apps is a high priority to ensure consumers have the best experience.
- Additional effort is made to deliver more sophisticated and polished reports. Following best practices for data preparation and higher quality data modeling is also expected.
- Needs for change management and application lifecycle management (ALM) begin to emerge to ensure release stability and a consistent experience for consumers.

Guidelines for being successful with departmental BI delivery:

- Ensure the COE is prepared to support the efforts of self-service creators. Creators who publish content used throughout their department or business unit may emerge as candidates to become champions, or they may become candidates to join the COE as a satellite member.
- Make purposeful decisions about how [workspace management](../collaborate-share/service-create-the-new-workspaces.md) will be handled. The workspace is a place to organize related content, a permissions boundary, and the scope for an app. Several workspaces will likely be required to meet all the needs of a large department or business unit.
- Plan how [apps](../consumer/end-user-apps.md) will distribute content to the enterprise. An app can provide a significantly better experience for delivering content. In many cases, content consumers can be granted permissions to view content via the app only, reserving workspace permissions management for content creators and reviewers only.
- Educate content creators on useful techniques for handling data quality validations. As the importance of reports grows, expectations for trustworthiness grows, too.
- Ensure that adequate training, mentoring, and documentation is available to support content creators. Best practices for data preparation, data modeling, and data presentation will result in better quality solutions.
- Provide guidance on the best way to use the [promoted endorsement](../collaborate-share/service-endorse-content.md#promote-content), and when the [certified endorsement](../collaborate-share/service-endorse-content.md#certify-content) may be permitted for departmental BI solutions.
- Ensure that the owner is identified for all departmental content. Clarity on ownership is helpful, including who to contact with questions, feedback, enhancement requests, or support requests. In the Power BI service, content owners can set the [contact list property](../create-reports/service-item-contact.md) of many artifacts types. The contact list is also used in security workflows. For example, when a user is sent a URL to open an app but they don't have permission, they will be presented with an option to make a request for access.
- Consider using [deployment pipelines](../create-reports/deployment-pipelines-overview.md) in conjunction with separate [workspaces](../collaborate-share/service-create-the-new-workspaces.md). It can support development, test, and production environments, which provide more stability for consumers.
- Consider enforcing the use of [sensitivity labels](../admin/service-security-data-protection-overview.md) to implement information protection on all content.
- Include consistent branding on reports to align with departmental colors and styling. It can also indicate who produced the content. For more information, see the [Content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article. A small image or text label in the report footer is valuable when the report is exported from the Power BI service. A standard Power BI Desktop template file can encourage and simplify the consistent use of branding. For more information, see the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article.
- See the techniques described for business-led self-service BI and managed self-service BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article. They are highly relevant techniques that help content creators create efficient and effective departmental BI solutions.

## Enterprise BI

Enterprise BI content is typically managed by a centralized team and is subject to additional governance requirements. Content is delivered broadly across organizational boundaries.

Enterprise BI usually has a significantly larger number of consumers versus content creators. Therefore, a combination of [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md) and [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) licenses, and/or [Power BI Premium](../admin/service-premium-what-is.md#subscriptions-and-licensing) subscriptions may be used.

Characteristics of enterprise BI delivery:

- A centralized team of BI experts manages the content end-to-end and publishes it for others to consume.
- Formal delivery of reports and apps is a high priority to ensure consumers have the best experience.
- The content is highly sensitive, subject to regulatory requirements, or is considered extremely critical.
- Published enterprise-level datasets and dataflows may be used as a source for self-service creators, thus creating a chain of dependencies to the source data.
- Stability and a consistent experience for consumers are highly important. Application lifecycle management, such as [deployment pipelines](../create-reports/deployment-pipelines-overview.md) and [DevOps techniques](https://powerbi.microsoft.com/blog/automate-deployments-with-deployment-pipelines-api-preview/)), is commonly used. Change management processes to review and approve changes before they're deployed are commonly used for enterprise BI content, possibly by a change review board or similar group.
- Processes exist to gather requirements, prioritize efforts, and plan for new projects or enhancements to existing content.
- Integration with other enterprise-level data architecture and management services may exist, possibly with other Azure services and Power Platform products.

Guidelines for being successful with enterprise BI delivery:

- Governance and oversight techniques described in the [governance](powerbi-adoption-roadmap-governance.md) article are relevant for managing an enterprise BI solution. In particular, it encompasses change management and application lifecycle management. Plan for how to effectively use [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml) licenses or [Power BI Premium](../admin/service-premium-what-is.md#subscriptions-and-licensing) subscriptions per workspace. Align your workspace management strategy, like how [workspaces](../collaborate-share/service-create-the-new-workspaces.md) will be organized and secured, to the planned [licensing](../admin/service-admin-licensing-organization.md) strategy.
- Plan how Power BI apps will distribute enterprise BI content. An app can provide a significantly better experience for delivering content. Align the app distribution strategy with your workspace management strategy.
- Consider enforcing the use of [sensitivity labels](../admin/service-security-data-protection-overview.md) to implement information protection on all content.
- Implement a rigorous process for use of the [certified endorsement](../collaborate-share/service-endorse-content.md#certify-content) for enterprise BI reports and apps. Datasets and dataflows can be certified, too, when there's the expectation that self-service creators will build solutions based on them. Not all enterprise BI content needs to be certified, but much of it probably will be.
- Make it a common practice to announce when changes will occur. For more information ,see the [community of practice](powerbi-adoption-roadmap-community-of-practice.md) article for a description of communication types.
- Include consistent branding on reports to align with departmental colors and styling. It can also indicate who produced the content. For more information, see the [Content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article. A small image or text label in the report footer is valuable when the report is exported from the Power BI service. A standard Power BI Desktop template file can encourage and simplify the consistent use of branding. For more information, see the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article.
- Use [lineage view](../collaborate-share/service-data-lineage.md) to understand dependencies, perform impact analysis, and communicate to downstream content owners when changes will occur.
- See the techniques described for enterprise BI in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article. They are highly relevant techniques that help content creators create efficient and effective enterprise BI solutions.
- See the techniques described in the [system oversight](powerbi-adoption-roadmap-system-oversight.md) article for auditing, governing, and the overseeing of enterprise BI content.

## Considerations and key actions

Considerations and key actions you can take to strengthen your approach to content delivery:

- Ensure that guidelines, documentation, and other resources align with the strategic goals defined for Power BI adoption.
- Clarify the scopes for content delivery in your organization, who they apply to, and how they align with governance decisions. Ensure it's consistent with how [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) is handled.
- Consider how to handle situations when a smaller team wants to publish content for an enterprise-wide audience.
  - Will it require the content be owned and managed by a centralized team? For more information, see the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article, which describes an inter-related concept with content delivery scope.
  - Will there be an approval process? Governance can become more complicated when the content delivery scope is broader than the owner of the content. For example, an app owned by a divisional sales team is distributed to the entire organization.
- Create helpful documentation for your community so content creators understand when it's appropriate to use [workspaces](../collaborate-share/service-create-the-new-workspaces.md), [apps](../collaborate-share/service-create-distribute-apps.md), or [sharing (direct access or link sharing)](https://powerbi.microsoft.com/blog/announcing-the-new-sharing-experience/).
- Ensure you have a specific strategy in place to handle user licensing and subscription considerations for [Power BI Pro](../admin/service-admin-purchasing-power-bi-pro.md), [Power BI Premium Per User](../admin/service-premium-per-user-faq.yml), and [Power BI Premium](../admin/service-premium-what-is.md#subscriptions-and-licensing). Create a process to describe how workspaces can be setup to meet [licensing requirements](../collaborate-share/service-new-workspaces.md#licensing-and-administering).

## Maturity levels

The following maturity levels will help you assess the current state of your content delivery:

| **Level** | **State of Power BI content delivery** |
| --- | --- |
| 100: Initial | Content is published by self-service creators in an uncontrolled way, without a specific strategy. |
| 200: Repeatable | Clusters of good practices exist which depend on the knowledge, skills, and habits of the content creator. |
| 300: Defined | Clear guidelines are defined and communicated to describe what can and cannot occur within each delivery scope. These guidelines are followed by some—but not all—groups across the organization. |
| 400: Capable | Criteria are defined to align governance requirements for self-service versus enterprise content.</br></br>Guidelines are followed by most, or all, groups across the organization.</br></br>Change management requirements are in place to approve critical changes to content that is distributed to a larger audience.</br></br>Changes are announced so creators are aware of the downstream effects on their content. |
| 500: Efficient | Proactively communicate to communicate with a user when any concerning activities are detected in the activity log.</br></br>Analysis is conducted regularly to evaluate the business value that's achieved for deployed solutions. |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-center-of-excellence.md), learn more about the Center of Excellence.
