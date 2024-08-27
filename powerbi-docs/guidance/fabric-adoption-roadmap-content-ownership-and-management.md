---
title: "Microsoft Fabric adoption roadmap: Content ownership and management"
description: "Develop strategies about how data, analytics, and BI content is owned and managed to drive strong and successful adoption of Microsoft Fabric."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Content ownership and management

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

> [!NOTE]
> The Power BI implementation planning [usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) explore many concepts discussed in this article, focusing on the Power BI workload in [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview). The usage scenario articles include detailed diagrams that you might find helpful to support your planning and decision making.

There are three primary strategies for how data, analytics, and business intelligence (BI) content is owned and managed: business-led self-service, managed self-service, and enterprise. For the purposes of this series of articles, the term _content_ refers to any type of data item (like a notebook, semantic model—[previously known as a dataset](/power-bi/connect-data/service-datasets-rename), report, or dashboard).

The organization's data culture is the driver for why, how, and by whom each of these three content ownership strategies is implemented.

:::image type="content" source="media/fabric-adoption-roadmap-content-ownership-and-management/content-ownership.svg" alt-text="Diagram shows content ownership responsibilities for the three types of business intelligence delivery, which are described in the table below." border="false":::

The areas in the above diagram include:

| **Area** | **Description** |
| :-: | --- |
| ![Area 1.](../media/legend-number/legend-number-01-fabric.svg) | **Business-led self-service:** All content is owned and managed by the creators and subject matter experts within a business unit. This ownership strategy is also known as a _decentralized_ or _bottom-up_ strategy. |
| ![Area 2.](../media/legend-number/legend-number-02-fabric.svg) | **Managed self-service:** The data is owned and managed by a centralized team, whereas business users take responsibility for reports and dashboards. This ownership strategy is also known as _discipline at the core and flexibility at the edge_. |
| ![Area 3.](../media/legend-number/legend-number-03-fabric.svg) | **Enterprise:** All content is owned and managed by a centralized team such as IT, enterprise BI, or the Center of Excellence (COE). |

It's unlikely that an organization operates exclusively with one content ownership and management strategy. Depending on your data culture, one strategy might be far more dominant than the others. The choice of strategy could differ from solution to solution, or from team to team. In fact, a single team can actively use multiple strategies if it's both a consumer of enterprise content and a producer of its own self-service content. The strategy to pursue depends on factors such as:

- Requirements for a solution (such as a collection of reports, a Power BI app, or a lakehouse).
- User skills.
- Ongoing commitment for training and skills growth.
- Flexibility required.
- Complexity level.
- Priorities and leadership commitment level.

The organization's [data culture](fabric-adoption-roadmap-data-culture.md)—particularly its position on [data democratization](fabric-adoption-roadmap-data-culture.md#data-democratization)—has considerable influence on the extent of which of the three content ownership strategies are used. While there are common patterns for success, there's no one-size-fits-all approach. Each organization's governance model and approach to content ownership and management should reflect the differences in data sources, applications, and business context.

How content is owned and managed has a significant effect on [governance](fabric-adoption-roadmap-governance.md), the extent of [mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md), needs for [user support](fabric-adoption-roadmap-user-support.md), and the [COE](fabric-adoption-roadmap-center-of-excellence.md) operating model.

As discussed in the [governance](fabric-adoption-roadmap-governance.md) article, the level of governance and oversight depends on:

- Who owns and manages the content.
- The [scope of content delivery](fabric-adoption-roadmap-content-delivery-scope.md).
- The data subject area and sensitivity level.
- The importance of the data, and whether it's used for critical decision making.

In general:

- Business-led self-service content is subject to the least stringent governance and oversight controls. It often includes [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) and [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) solutions.
- Managed self-service content is subject to moderately stringent governance and oversight controls. It frequently includes [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) and [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) solutions.
- [Enterprise](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) solutions are subject to more rigorous governance controls and oversight.

As stated in the [adoption maturity levels](fabric-adoption-roadmap-maturity-levels.md) article, organizational adoption measures the state of data management processes and governance. The choices made for content ownership and management significantly affect how organizational adoption is achieved.

## Ownership and stewardship

There are many roles related to data management. Roles can be defined in many ways and can be easily misunderstood. The following table presents possible ways you might conceptually define these roles:

| **Role** | **Description** |
| --- | --- |
| Data steward | Responsible for defining and/or managing acceptable data quality levels as well as master data management (MDM). |
| Subject matter expert (SME) | Responsible for defining what the data means, what it's used for, who might access it, and how the data is presented to others. Collaborates with domain owner as needed and supports colleagues in their use of data. |
| Technical owner | Responsible for creating, maintaining, publishing, and securing access to data and reporting items. |
| Domain owner | Higher-level decision-maker who collaborates with governance teams on data management policies, processes, and requirements. Decision-maker for defining appropriate and inappropriate uses of the data. Participates on the data governance board, as described in the [governance](fabric-adoption-roadmap-governance.md) article. |

Assigning ownership for a data domain tends to be more straightforward when managing transactional source systems. In analytics and BI solutions, data is integrated from multiple domain areas, then transformed and enriched. For downstream analytical solutions, the topic of ownership becomes more complex.

> [!NOTE]
> Be clear about who is responsible for managing data items. It's crucial to ensure a good experience for content consumers. Specifically, clarity on ownership is helpful for:
>
> - Who to contact with questions.
> - Feedback.
> - Enhancement requests.
> - Support requests.
>
> In the Fabric portal, content owners can set the [contact list property](/power-bi/create-reports/service-item-contact) for many types of items. The contact list is also used in security workflows. For example, when a user is sent a URL to open a [Power BI app](powerbi-implementation-planning-security-report-consumer-planning.md#power-bi-app-permissions) but they don't have permission, they will be presented with an option to make a request for access.

Guidelines for being successful with ownership:

- Define how ownership and stewardship terminology is used in your organization, including expectations for these roles.
- Set [contacts for each workspace](/power-bi/collaborate-share/service-create-the-new-workspaces#create-a-contact-list) and for individual items to communicate ownership and/or support responsibilities.
- Specify between two and four [workspace administrators](/power-bi/collaborate-share/service-roles-new-workspaces) and conduct an [audit](/rest/api/power-bi/admin/groups_getgroupusersasadmin) of workspace admins regularly (perhaps twice a year). Workspace admins might be directly responsible for managing workspace content, or it could be that those tasks are assigned to colleagues who do the hands-on work. In all cases, workspace admins should be able to easily contact owners of specific content.
- Include consistent branding on reports to indicate who produced the content and who to contact for help. A small image or text label located in the report footer is valuable, especially when the report is exported from the Fabric portal. A standard [template file](fabric-adoption-roadmap-mentoring-and-user-enablement.md#power-bi-template-files) can encourage and simplify the consistent use of branding.
- Make use of [best practices reviews](fabric-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews) and [co-development projects](fabric-adoption-roadmap-mentoring-and-user-enablement.md#co-development-projects) with the [COE](fabric-adoption-roadmap-center-of-excellence.md).

The remainder of this article covers considerations related to the three content ownership and management strategies.

## Business-led self-service

With a business-led self-service approach to data and BI, all content is owned and managed by creators and subject matter experts. Because responsibility is retained within a business unit, this strategy is often described as the _bottom-up_, or _decentralized_, approach. Business-led self-service is often a good strategy for [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) and [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) solutions.

> [!IMPORTANT]
> The concept of business-led self-service isn't the same as shadow IT. In both scenarios, data and BI content is created, owned, and managed by business users. However, shadow IT implies that the business unit is circumventing IT and so the solution is not sanctioned. With business-led self-service BI solutions, the business unit has full authority to create and manage content. Resources and support from the [COE](fabric-adoption-roadmap-center-of-excellence.md) are available to self-service content creators. It's also expected that the business unit will comply with all established data governance guidelines and policies.

Business-led self-service is most suitable when:

- Decentralized data management aligns with the organization's data culture, and the organization is prepared to support these efforts.
- Data exploration and freedom to innovate is a high priority.
- The business unit wants to have the most involvement and retain the highest level of control.
- The business unit has skilled users capable of—and fully committed to—supporting solutions through the entire lifecycle. It covers all types of items, including the data (such as a lakehouse, data warehouse, data pipeline, dataflow, or semantic model), the visuals (such as reports and dashboards), and Power BI apps.
- The flexibility to respond to changing business conditions and react quickly outweighs the need for stricter governance and oversight.

Here are some guidelines to help become successful with business-led self-service data and BI.

- Teach your creators to use the same techniques that IT would use, like [shared semantic models](/power-bi/connect-data/service-datasets-across-workspaces) and [dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service). Make use of a well-organized [OneLake](/fabric/onelake/onelake-overview). Centralize data to reduce maintenance, improve consistency, and reduce risk.
- Focus on providing mentoring, training, resources, and documentation (described in the [Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) article). The importance of these efforts can't be overstated. Be prepared for skill levels of self-service content creators to vary significantly. It's also common for a solution to deliver excellent business value yet be built in such a way that it won't scale or perform well over time (as historic data volumes increase). Having the [COE](fabric-adoption-roadmap-center-of-excellence.md) available to help when these situations arise is very valuable.
- Provide guidance on the best way to use endorsements. The [promoted endorsement](/power-bi/collaborate-share/service-endorse-content#promote-content) is for content produced by self-service creators. Consider reserving use of the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for enterprise BI content and managed self-service BI content (described next).
- Analyze the [activity log](/power-bi/enterprise/service-admin-auditing) to discover situations where the COE could proactively contact self-service owners to offer helpful information. It's especially useful when a suboptimal usage pattern is detected. For example, log activity could reveal overuse of individual item sharing when [Power BI app audiences](powerbi-implementation-planning-security-report-consumer-planning.md#app-audience) or [workspace roles](powerbi-implementation-planning-security-content-creator-planning.md#workspace-roles) might be a better choice. The data from the activity log allows the COE to offer support and advice to the business units. In turn, this information can help increase the quality of solutions, while allowing the business to retain full ownership and control of their content. For more information, see [Auditing and monitoring](powerbi-implementation-planning-auditing-monitoring-overview.md).

## Managed self-service

Managed self-service BI is a blended approach to data and BI. The data is owned and managed by a centralized team (such as IT, enterprise BI, or the COE), while responsibility for reports and dashboards belongs to creators and subject matter experts within the business units. Managed self-service BI is frequently a good strategy for [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) and [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) solutions.

This approach is often called_[discipline at the core and flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core)_. It's because the data architecture is maintained by a single team with an appropriate level of discipline and rigor. Business units have the flexibility to create reports and dashboards based on centralized data. This approach allows report creators to be far more efficient because they can remain focused on delivering value from their data analysis and visuals.

Managed self-service BI is most suitable when:

- Centralized data management aligns with the organization's data culture.
- The organization has a team of BI experts who manage the data architecture.
- There's value in the reuse of data by many self-service report creators across organizational boundaries.
- Self-service report creators need to produce analytical content at a pace faster than the centralized team can accommodate.
- Different users are responsible for handling data preparation, data modeling, and report creation.

Here are some guidelines to help you become successful with managed self-service BI.

- Teach users to [separate model and report development](report-separate-from-model.md#separate-report-files). They can use [live connections](/power-bi/connect-data/desktop-report-lifecycle-datasets) to create reports based on existing semantic models. When the semantic model is decoupled from the report, it promotes data reuse by many reports and many authors. It also facilitates the separation of duties.
- Use [dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) to centralize data preparation logic and to share commonly used data tables—like date, customer, product, or sales—with many semantic model creators. Refine the dataflow as much as possible, using friendly column names and correct data types to reduce the downstream effort required by semantic model authors, who consume the dataflow as a source. Dataflows are an effective way to reduce the time involved with data preparation and improve data consistency across semantic models. The use of dataflows also reduces the number of data refreshes on source systems and allows fewer users who require direct access to source systems.
- When self-service creators need to augment an existing semantic model with departmental data, educate them to create [composite models](/power-bi/transform-model/desktop-composite-models). This feature allows for an ideal balance of self-service enablement while taking advantage of the investment in data assets that are centrally managed.
- Use the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for semantic models and dataflows to help content creators identify trustworthy sources of data.
- Include consistent branding on all reports to indicate who produced the content and who to contact for help. Branding is particularly helpful to distinguish content that is produced by self-service creators. A small image or text label in the report footer is valuable when the report is exported from the Fabric portal.
- Consider implementing separate [workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-organization) for storing data and reports. This approach allows for better clarity on who is responsible for content. It also allows for more restrictive [workspace roles](/power-bi/collaborate-share/service-roles-new-workspaces) assignments. That way, report creators can only publish content to their reporting workspace; and, read and build semantic model permissions allow creators to create new reports with row-level security (RLS) in effect, when applicable. For more information, see [Workspace-level planning](powerbi-implementation-planning-workspaces-workspace-level-planning.md). For more information about RLS, see [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md).
- Use the [Power BI REST APIs](/rest/api/power-bi/) to compile an inventory of Power BI items. Analyze the ratio of semantic models to reports to evaluate the extent of semantic model reuse.

## Enterprise

[Enterprise](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) is a centralized approach to delivering data and BI solutions in which all solution content is owned and managed by a centralized team. This team is usually IT, enterprise BI, or the COE.

Enterprise is the most suitable when:

- Centralizing content management with a single team aligns with the organization's data culture.
- The organization has data and BI expertise to manage all items end-to-end.
- The content needs of consumers are well-defined, and there's little need to customize or explore data beyond the reporting solution that's delivered.
- Content ownership and direct access to data needs to be limited to a small number of experts and owners.
- The data is highly sensitive or subject to regulatory requirements.

Here are some guidelines to help you become successful with enterprise data and BI.

- Implement a rigorous process for use of the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for content. Not all enterprise content needs to be certified, but much of it probably should be. Certified content should indicate that data quality has been validated. Certified content should also follow change management rules, have formal support, and be fully documented. Because certified content has passed rigorous standards, the expectations for trustworthiness are higher.
- Include consistent branding on enterprise BI reports to indicate who produced the content, and who to contact for help. A small image or text label in the report footer is valuable when the report is exported by a user.
- If you use specific report branding to indicate enterprise BI content, be careful with the _save a copy_ functionality that would allow a user to download a copy of a report and personalize it. Although this functionality is an excellent way to bridge enterprise BI with managed self-service BI, it dilutes the value of the branding. A more seamless solution is to provide a separate [Power BI Desktop template file](/power-bi/create-reports/desktop-templates#using-report-templates) for self-service authors. The template defines a starting point for report creation with a live connection to an existing semantic model, and it doesn't include branding. The template file can be shared as a link within a Power BI app, or from the [community portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal).

## Ownership transfers

Occasionally, the ownership of a particular solution might need to be transferred to another team. An ownership transfer from a business unit to a centralized team can happen when:

- A business-led solution is used by a significant number of users, or it now supports critical business decisions. In these cases, the solution should be managed by a team with processes in place to implement higher levels of governance and support.
- A business-led solution is a candidate to be used far more broadly throughout the organization, so it needs to be managed by a team who can set security and deploy content widely throughout the organization.
- A business unit no longer has the expertise, budget, or time available to continue managing the content, but the business need for the content remains.
- The size or complexity of a solution has grown to a point where a different data architecture or redesign is required.
- A proof of concept is ready to be operationalized.

The [COE](fabric-adoption-roadmap-center-of-excellence.md) should have well-documented procedures for identifying when a solution is a candidate for ownership transfer. It's very helpful if help desk personnel know what to look for as well. Having a customary pattern for self-service creators to build and grow a solution, and hand it off in certain circumstances, is an indicator of a productive and healthy data culture. A simple ownership transfer could be addressed during COE [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours); a more complex transfer could warrant a small project managed by the COE.

> [!NOTE]
> There's potential that the new owner will need to do some refactoring and data validations before they're willing to take full ownership. Refactoring is most likely to occur with the less visible aspects of data preparation, data modeling, and calculations. If there are any manual steps or flat file sources, now is an ideal time to apply those enhancements. The branding of reports and dashboards might also need to change (for example, if there's a footer indicating report contact or a text label indicating that the content is certified).

It's also possible for a centralized team to transfer ownership to a business unit. It could happen when:

- The team with domain knowledge is better equipped to own and manage the content going forward.
- The centralized team has created the solution for a business unit that doesn't have the skills to create it from scratch, but it can maintain and extend the solution going forward.

> [!TIP]
> Don't forget to recognize and reward the work of the original creator, particularly if ownership transfers are a common occurrence.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Here's a list of considerations and key actions you can take to strengthen your approach to content ownership and management.

> [!div class="checklist"]
> - **Gain a full understanding of what's currently happening:** Ensure you deeply understand how content ownership and management is happening throughout the organization. Recognize that there likely won't be a one-size-fits-all approach to apply uniformly across the entire organization. Review the implementation planning [usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) to understand how Power BI and Fabric can be used in diverse ways.
> - **Conduct discussions:** Determine what is currently working well, what isn't working well, and what the desired balance is between the three ownership strategies. If necessary, schedule discussions with specific people on various teams. Develop a plan for moving from the current state to the desired state.
> - **Perform an assessment:** If your enterprise data team currently has challenges related to scheduling and priorities, do an assessment to determine if a managed self-service strategy can be put in place to empower more content creators throughout the organization. Managed self-service data and BI can be extremely effective on a global scale.
> - **Clarify terminology:** Clarify terms used in your organization for owner, data steward, and subject matter expert.
> - **Assign clear roles and responsibilities:** Make sure roles and responsibilities for owners, stewards, and subject matter experts are documented and well understood by everyone involved. Include backup personnel.
> - **Ensure community involvement:** Ensure that all your content owners—from both the business and IT—are part of your [community of practice](fabric-adoption-roadmap-community-of-practice.md).
> - **Create user guidance for owners and contacts in Fabric:** Determine how you will use the contacts feature in Fabric. Communicate with content creators about how it should be used, and why it's important.
> - **Create a process for handling ownership transfers:** If ownership transfers occur regularly, create a process for how it will work.
> - **Support your advanced content creators:** Determine your strategy for using [external tools](https://powerbi.microsoft.com/blog/community-tools-for-enterprise-powerbi-and-analysisservices/) for advanced authoring capabilities and increased productivity.

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess content ownership and management.

- Do central teams that are responsible for Fabric have a clear understanding of who owns what BI content? Is there a distinction between report and data items, or different item types (like Power BI semantic models, data science notebooks, or lakehouses)?
- Which [usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) are in place, such as [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md), [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md), or [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md)? How prevalent are they in the organization, and how do they differ between key business units?
- What activities do business analytical teams perform (for example, data integration, data modeling, or reporting)?
- What kinds of roles in the organizations are expected to create and own content? Is it limited to central teams, analysts, or also functional roles, like sales?
- Where does the organization sit on the spectrum of [business-led self-service](fabric-adoption-roadmap-content-ownership-and-management.md#business-led-self-service), [managed self-service](fabric-adoption-roadmap-content-ownership-and-management.md#managed-self-service), or [enterprise](fabric-adoption-roadmap-content-ownership-and-management.md#enterprise)? Does it differ between key business units?
- Do strategic data and BI solutions have [ownership](fabric-adoption-roadmap-content-ownership-and-management.md) roles and stewardship roles that are clearly defined? Which are missing?
- Are content creators and owners also responsible for supporting and updating content once it's released? How effective is the ownership of content support and updates?
- Is a clear process in place to [transfer ownership](fabric-adoption-roadmap-content-ownership-and-management.md#ownership-transfers) of solutions (where necessary)? An example is when an external consultant creates or updates a solution.
- Do data sources have data stewards or subject matter experts (SMEs) who serve as a special point of contact?
- If your organization is already using Fabric or Power BI, does the current [workspace setup](powerbi-implementation-planning-workspaces-overview.md) comply with the content ownership and delivery strategies that are in place?

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your content ownership and management.

| **Level** | **State of content ownership and management** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Self-service content creators own and manage content in an uncontrolled way, without a specific strategy. <br/><br/>&bull;&nbsp;A high ratio of semantic models to reports exists. When many semantic models exist only support one report, it indicates opportunities to improve data reusability, improve trustworthiness, reduce maintenance, and reduce the number of duplicate semantic models. <br/><br/>&bull;&nbsp;Discrepancies between different reports are common, causing distrust of content produced by others. |
| 200: Repeatable | &bull;&nbsp;A plan is in place for which content ownership and management strategy to use and in which circumstances. <br/><br/>&bull;&nbsp;Initial steps are taken to improve the consistency and trustworthiness levels for self-service efforts. <br/><br/>&bull;&nbsp;Guidance for the user community is available that includes expectations for self-service versus enterprise content. <br/><br/>&bull;&nbsp;Roles and responsibilities are clear and well understood by everyone involved. |
| 300: Defined | &bull;&nbsp;Managed self-service is a priority and an area of investment to further advance the data culture. The priority is to allow report creators the flexibility they need while using well-managed, secure, and trustworthy data sources. <br/><br/>&bull;&nbsp;Report branding is consistently used to indicate who produced the content. <br/><br/>&bull;&nbsp;A [mentoring program](fabric-adoption-roadmap-mentoring-and-user-enablement.md) exists to educate self-service content creators on how to apply best practices and make good decisions. |
| 400: Capable | &bull;&nbsp;Criteria are defined to align governance requirements for self-service versus enterprise content. <br/><br/>&bull;&nbsp;There's a plan in place for how to request and handle ownership transfers. <br/><br/>&bull;&nbsp;Managed self-service—and techniques for the reuse of data—are commonly used and well-understood. |
| 500: Efficient | &bull;&nbsp;Proactive steps to communicate with users occur when any concerning activities are detected in the activity log. Education and information are provided to make gradual improvements or reduce risk. <br/><br/>&bull;&nbsp;Third-party tools are used by highly proficient content creators to improve productivity and efficiency. |

## Related content

In the [next article](fabric-adoption-roadmap-content-delivery-scope.md) in the Microsoft Fabric adoption roadmap series, learn about the scope of content delivery.
