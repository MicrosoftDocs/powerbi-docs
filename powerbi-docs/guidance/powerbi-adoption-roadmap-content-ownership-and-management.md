---
title: "Power BI adoption roadmap: Content ownership and management"
description: Develop strategies about how BI content is owned and managed to drive strong and successful adoption of Power BI.
author: kfollis
ms.author: kfollis
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 10/31/2022
---

# Power BI adoption roadmap: Content ownership and management

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

> [!NOTE]
> The Power BI implementation planning [usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) explore many concepts discussed in this article. The usage scenario articles include detailed diagrams that you may find helpful to support your planning and decision making.

There are three primary strategies for how business intelligence (BI) content is owned and managed: business-led self-service BI, managed self-service BI, and enterprise BI. For the purposes of this series of articles, the term *content* refers to any type of data item (like a report or dashboard). It's synonymous with *solution*.

The organization's data culture is the driver for why, how, and by whom each of these three content ownership strategies is implemented.

:::image type="content" source="media/powerbi-adoption-roadmap-content-ownership-and-management/powerbi-adoption-roadmap-content-ownership.png" alt-text="Image shows content ownership responsibilities for the three types of BI delivery, which are described in the table below." border="false":::

The areas in the above diagram include:

| **Area** | **Description** |
| --- | --- |
| ![Area 1.](media/common/icon-01-red-30x30.png) | **Business-led self-service BI:** All content is owned and managed by the creators and subject matter experts within a business unit. This ownership strategy is also known as a *decentralized* or *bottom-up BI* strategy. |
| ![Area 2.](media/common/icon-02-red-30x30.png) | **Managed self-service BI:** The data is owned and managed by a centralized team, whereas business users take responsibility for reports and dashboards. This ownership strategy is also known as *discipline at the core and flexibility at the edge*. |
| ![Area 3.](media/common/icon-03-red-30x30.png) | **Enterprise BI:** All content is owned and managed by a centralized team such as IT, enterprise BI, or the Center of Excellence (COE). |

It's unlikely that an organization operates exclusively with one content ownership and management strategy. Depending on your data culture, one strategy might be far more dominant than the others. The choice of strategy could differ from solution to solution, or from team to team. In fact, a single team can actively use multiple strategies if it's both a consumer of enterprise BI content and a producer of its own self-service content. The strategy to pursue depends on factors such as:

- Requirements for a solution (such as a collection of reports).
- User skills.
- Ongoing commitment for training and skills growth.
- Flexibility required.
- Complexity level.
- Priorities and leadership commitment level.

The organization's [data culture](powerbi-adoption-roadmap-data-culture.md)—particularly its position on data democratization—has considerable influence on the extent of which of the three content ownership strategies are used. While there are common patterns for success, there's no one-size-fits-all approach. Each organization's governance model and approach to content ownership and management should reflect the differences in data sources, applications, and business context.

How content is owned and managed has a significant effect on [governance](powerbi-adoption-roadmap-governance.md), the extent of [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md), needs for [user support](powerbi-adoption-roadmap-user-support.md), and the [COE](powerbi-adoption-roadmap-center-of-excellence.md) operating model.

As discussed in the [governance](powerbi-adoption-roadmap-governance.md) article, the level of governance and oversight depends on:

- Who owns and manages the content.
- The [scope of content delivery](powerbi-adoption-roadmap-content-delivery-scope.md).
- The data subject area and sensitivity level.
- The importance of the data.

In general:

- Business-led self-service BI content is subject to the least stringent governance and oversight controls. It often includes [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) and [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) solutions.
- Managed self-service BI content is subject to moderately stringent governance and oversight controls. It frequently includes [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) and [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) solutions.
- [Enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) solutions are subject to more rigorous governance controls and oversight.

As stated in the [adoption maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article, organizational adoption measures the state of data management processes and governance. The choices made for content ownership and management significantly affect how organizational adoption is achieved.

## Ownership and stewardship

There are many roles related to data management. Roles can be defined many ways and can be easily misunderstood. The following table presents possible ways you may conceptually define these roles:

| **Role** | **Description** |
| --- | --- |
| Data steward | Responsible for defining and/or managing acceptable data quality levels as well as master data management (MDM). |
| Subject matter expert (SME) | Responsible for defining what the data means, what it's used for, who may access it, and how the data is presented to others. Collaborates with domain owner as needed and supports colleagues in their use of data. |
| Technical owner | Responsible for creating, maintaining, publishing, and securing access to data and reporting items. |
| Domain owner | Higher-level decision-maker who collaborates with governance teams on data management policies, processes, and requirements. Decision-maker for defining appropriate and inappropriate uses of the data. Participates on the data governance board, as described in the [governance](powerbi-adoption-roadmap-governance.md) article. |

Assigning ownership for a data domain tends to be more straightforward when managing transactional source systems. In BI solutions, data is integrated from multiple domain areas, then transformed and enriched. For downstream analytical solutions, the topic of ownership becomes more complex.

> [!NOTE]
> Be clear about who is responsible for managing data items. It's crucial to ensure a good experience for content consumers. Specifically, clarity on ownership is helpful for:
>
> - Who to contact with questions.
> - Feedback.
> - Enhancement requests.
> - Support requests.
>
> In the Power BI service, content owners can set the [contact list property](/power-bi/create-reports/service-item-contact) for many types of items. The contact list is also used in security workflows. For example, when a user is sent a URL to open an app but they don't have permission, they will be presented with an option to make a request for access.

Guidelines for being successful with ownership:

- Define how ownership and stewardship terminology is used in your organization, including expectations for these roles.
- Set [contacts for each workspace](/power-bi/collaborate-share/service-create-the-new-workspaces#create-a-contact-list) and for individual items to communicate ownership and/or support responsibilities.
- Specify 2-4 [workspace administrators](/power-bi/collaborate-share/service-roles-new-workspaces) and conduct an [audit](/rest/api/power-bi/admin/groups_getgroupusersasadmin) of workspace admins regularly (perhaps twice a year). Workspace admins might be directly responsible for managing workspace content, or it may be that those tasks are assigned to colleagues who do the hands-on work. In all cases, workspace admins should be able to easily contact owners of specific content.
- Include consistent branding on reports to indicate who produced the content and who to contact for help. A small image or text label located in the report footer is valuable, especially when the report is exported from the Power BI service. A standard template, as described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, can encourage and simplify the consistent use of branding.
- Make use of best practices reviews with the COE, which are discussed in the [COE](powerbi-adoption-roadmap-center-of-excellence.md) article.

The remainder of this article covers considerations related to the three content ownership and management strategies.

## Business-led self-service BI

With business-led self-service BI, all content is owned and managed by creators and subject matter experts. Because responsibility is retained within a business unit, this strategy is often described as the *bottom-up*, or *decentralized*, approach. Business-led self-service BI is often a good strategy for [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) and [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) solutions.

> [!IMPORTANT]
> The concept of business-led self-service BI is not the same as shadow IT. In both scenarios, BI content is created, owned, and managed by business users. However, shadow IT implies that the business unit is circumventing IT and so the solution is not sanctioned. With business-led self-service BI solutions, the business unit has full authority to create and manage content. Resources and support from the [COE](powerbi-adoption-roadmap-center-of-excellence.md) are available to self-service content creators. It's also expected that the business unit complies with all established data governance guidelines and policies.

Business-led self-service BI is most suitable when:

- Decentralized data management aligns with the organization's data culture, and the organization is prepared to support these efforts.
- Data exploration and freedom to innovate is a high priority.
- The business unit wants to have the most involvement and retain the highest level of control.
- The business unit has skilled people capable of—and fully committed to—supporting solutions through the entire lifecycle. It covers all types of Power BI items, including the data (dataflows and datasets), the visuals (reports and dashboards), and apps.
- The flexibility to respond to changing business conditions and react quickly outweighs the need for stricter governance and oversight.

Guidelines for being successful with business-led self-service BI:

- Teach your creators to use the same techniques that IT would use, like [shared datasets](/power-bi/connect-data/service-datasets-across-workspaces) and [dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service). Having fewer duplicated datasets reduces maintenance, improves consistency, and reduces risk.
- Focus on providing mentoring, training, resources, and documentation (described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article). The importance of these efforts can't be overstated. Be prepared for skill levels of self-service content creators to vary significantly. It's also common for a solution to deliver excellent business value yet be built in such a way that it won't scale or perform well over time (as historic data volumes increase). Having the [COE](powerbi-adoption-roadmap-center-of-excellence.md) available to help when these situations arise is very valuable.
- Provide guidance on the best way to use endorsements. The [promoted endorsement](/power-bi/collaborate-share/service-endorse-content#promote-content) is for content produced by self-service creators. Consider reserving use of the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for enterprise BI content and managed self-service BI content (discussed next).
- Analyze the [activity log](/power-bi/admin/service-admin-auditing) to discover situations where the COE could proactively contact self-service owners to offer helpful information. It's especially useful when a suboptimal usage pattern is detected. For example, log activity could reveal overuse of individual item sharing when an app or workspace roles may be a better choice. The data from the activity log allows the COE to offer support and advice to the business units. In turn, this information can help increase the quality of solutions, while allowing the business to retain full ownership and control of their content.

## Managed self-service BI

Managed self-service BI is a blended approach. The data is owned and managed by a centralized team (such as IT, enterprise BI, or the COE), while responsibility for reports and dashboards belongs to creators and subject matter experts within the business units. Managed self-service BI is frequently a good strategy for [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) and [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md) solutions.

This approach is often called *[discipline at the core and flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core)*. It's because the data architecture is maintained by a single team with an appropriate level of discipline and rigor. Business units have the flexibility to create reports and dashboards based on centralized data. This approach allows report creators to be far more efficient because they can remain focused on delivering value from their data analysis and visuals.

Managed self-service BI is most suitable when:

- Centralized data management aligns with the organization's data culture.
- The organization has a team of BI experts who manage the data architecture.
- There's value in the reuse of data by many self-service report creators across organizational boundaries.
- Self-service report creators need to produce content at a pace faster than the centralized team can accommodate.
- Different people are responsible for handling data preparation, data modeling, and report creation.

Guidelines for being successful with self-service BI:

- Teach users to [separate model and report development](report-separate-from-model.md#separate-report-files). They can use [live connections](/power-bi/connect-data/desktop-report-lifecycle-datasets) to create reports based on existing datasets. When the dataset is decoupled from the report, it promotes data reuse by many reports and many authors. It also facilitates the separation of duties.
- Use [dataflows](/power-bi/transform-model/dataflows/dataflows-introduction-self-service) to centralize data preparation logic and to share commonly used data tables—like date, customer, product, or sales—with many dataset creators. Refine the dataflow as much as possible, using friendly column names and correct data types to reduce the downstream effort required by dataset authors, who consume the dataflow as a source. Dataflows are an effective way to reduce the time involved with data preparation and improve data consistency across datasets. The use of dataflows also reduces the number of data refreshes on source systems and allows fewer users who require direct access to source systems.
- When self-service creators need to augment an existing dataset with departmental data, educate them to use [DirectQuery connections to Power BI datasets and Azure Analysis Services](/power-bi/connect-data/desktop-directquery-datasets-azure-analysis-services). This feature allows for an ideal balance of self-service enablement while taking advantage of the investment in data assets that are centrally managed.
- Use the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for datasets and dataflows to help content creators identify trustworthy sources of data.
- Include consistent branding on all reports to indicate who produced the content and who to contact for help. Branding is particularly helpful to distinguish content that is produced by self-service creators. A small image or text label in the report footer is valuable when the report is exported from the Power BI service.
- Consider implementing separate [workspaces](/power-bi/collaborate-share/service-new-workspaces) for storing data and reports. This approach allows for better clarity on who is responsible for content. It also allows for more restrictive [workspace roles](/power-bi/collaborate-share/service-roles-new-workspaces) assignments. That way, report creators can only publish content to their reporting workspace; and, read and build dataset permissions allow creators to create new reports with row-level security (RLS) in effect, when applicable.
- Use the [Power BI REST APIs](/rest/api/power-bi/) to compile an inventory of Power BI items. Analyze the ratio of datasets to reports to evaluate the extent of dataset reuse.

## Enterprise BI

[Enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) is a centralized approach in which all content is owned and managed by a centralized team. This team is usually IT, enterprise BI, or the COE.

Enterprise BI is most suitable when:

- Centralizing content management with a single team aligns with the organization's data culture.
- The organization has BI expertise to manage all the BI items end-to-end.
- The content needs of consumers are well-defined, and there's little need to customize or explore data beyond the reporting solution that's delivered.
- Content ownership and direct access to data needs to be limited to a few people.
- The data is highly sensitive or subject to regulatory requirements.

Guidelines for being successful with enterprise BI:

- Implement a rigorous process for use of the [certified endorsement](/power-bi/collaborate-share/service-endorse-content#certify-content) for datasets, reports, and apps. Not all enterprise BI content needs to be certified, but much of it probably should be. Certified content should indicate that data quality has been validated. Certified content should also follow change management rules, have formal support, and be fully documented. Because certified content has passed rigorous standards, the expectations for trustworthiness are higher.
- Include consistent branding on enterprise BI reports to indicate who produced the content, and who to contact for help. A small image or text label in the report footer is valuable when the report is exported from the Power BI service.
- If you use specific report branding to indicate enterprise BI content, be careful with the *save a copy* functionality that would allow a user to download a copy of a report and personalize it. Although this functionality is an excellent way to bridge enterprise BI with managed self-service BI, it dilutes the value of the branding. A more seamless solution is to provide a separate [Power BI Desktop template file](/power-bi/create-reports/desktop-templates#using-report-templates) for self-service authors. The template defines a starting point for report creation with a live connection to an existing dataset, and it doesn't include branding. The template file can be shared as a link within a Power BI app, or from the community site.

## Ownership transfers

Occasionally, the ownership of a particular solution may need to be transferred to another team. An ownership transfer from a business unit to a centralized team can happen when:

- A business-led solution is used by a significant number of people, or it now supports critical business decisions. In these cases, the solution should be managed by a team with processes in place to implement higher levels of governance and support.
- A business-led solution is a candidate to be used far more broadly throughout the organization, so it needs to be managed by a team who can set security and deploy content widely throughout the organization.
- A business unit no longer has the expertise, budget, or time available to continue managing the content.
- The size or complexity of a solution has grown to a point where a different data architecture or redesign is required.
- A proof of concept is ready to be operationalized.

The [COE](powerbi-adoption-roadmap-center-of-excellence.md) should have well-documented procedures for identifying when a solution is a candidate for ownership transfer. It's very helpful if help desk personnel know what to look for as well. Having a customary pattern for self-service creators to build and grow a solution, and hand it off in certain circumstances, is an indicator of a productive and healthy data culture. A simple ownership transfer may be addressed during COE office hours; a more complex transfer may warrant a small project managed by the COE.

> [!NOTE]
> There's potential that the new owner will need to do some refactoring before they're willing to take full ownership. Refactoring is most likely to occur with the less visible aspects of data preparation, data modeling, and calculations. If there are any manual steps or flat file sources, it's an ideal time to apply those enhancements. The branding of reports and dashboards may also need to change, for example, if there's a footer indicating report contact or a text label indicating that the content is certified.

It's also possible for a centralized team to transfer ownership to a business unit. It could happen when:

- The team with domain knowledge is better equipped to own and manage the content going forward.
- The centralized team has created the solution for a business unit that doesn't have the skills to create it from scratch, but it can maintain and extend the solution going forward.

> [!TIP]
> Don't forget to recognize and reward the work of the original creator, particularly if ownership transfers are a common occurrence.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - Here's a list of considerations and key actions you can take to strengthen your approach to content ownership and management.

> [!div class="checklist"]
> - **Gain a full understanding of what's currently happening:** Ensure you deeply understand how content ownership and management is happening throughout the organization. Recognize that there likely won't be a one-size-fits-all approach to apply uniformly across the entire organization. Review the Power BI implementation planning [usage scenarios](powerbi-implementation-planning-usage-scenario-overview.md) to understand how Power BI can be used in diverse ways.
> - **Conduct discussions:** Determine what is currently working well, what isn't working well, and what the desired balance is between the three ownership strategies. If necessary, schedule discussions with specific people on various teams. Develop a plan for moving from the current state to the desired state.
> - **Perform an assessment:** If your enterprise BI team currently has challenges related to scheduling and priorities, do an assessment to determine if a managed self-service BI strategy can be put in place to empower more content creators throughout the organization. Managed self-service BI can be extremely effective on a global scale.
> - **Clarify terminology:** Clarify terms used in your organization for owner, data steward, and subject matter expert.
> - **Assign clear roles and responsibilities:** Make sure roles and responsibilities for owners, stewards, and subject matter experts are documented and well understood by everyone involved. Include backup personnel.
> - **Ensure community involvement:** Ensure that all your content owners—from both the business and IT—are part of your [community of practice](powerbi-adoption-roadmap-community-of-practice.md).
> - **Create user guidance for owners and contacts in Power BI:** Determine how you will use the contacts feature in Power BI. Communicate with content creators about how it should be used, and why it's important.
> - **Create a process for handling ownership transfers:** If ownership transfers occur regularly, create a process for how it will work.
> - **Support your advanced content creators:** Determine your strategy for using [external tools](https://powerbi.microsoft.com/blog/community-tools-for-enterprise-powerbi-and-analysisservices/) for advanced authoring capabilities and increased productivity.

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.png" border="false":::

The following maturity levels will help you assess the current state of your content ownership and management.

| **Level** | **State of Power BI content ownership and management** |
| --- | --- |
| 100: Initial | Self-service content creators own and manage content in an uncontrolled way, without a specific strategy. </br></br>A high ratio of datasets to reports exists. When many datasets only support one report, it indicates opportunities to improve data reusability, improve trustworthiness, reduce maintenance and the number of duplicate datasets. </br></br>Discrepancies between different reports is common, causing distrust of content produced by others. |
| 200: Repeatable | A plan is in place for which content ownership and management strategy to use and in which circumstances. </br></br>Initial steps are taken to improve the consistency and trustworthiness levels for self-service BI efforts. </br></br>Guidance for the user community is available that includes expectations for self-service versus enterprise content. </br></br>Roles and responsibilities are clear and well understood by everyone involved. |
| 300: Defined | Managed self-service BI is a priority and an area of investment to further advance the data culture. The priority is to allow report creators the flexibility they need while using well-managed, secure, and trustworthy data sources. </br></br>Report branding is consistently used to indicate who produced the content. </br></br>A [mentoring program](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) exists to educate self-service content creators on how to apply best practices and make good decisions. |
| 400: Capable | Criteria is defined to align governance requirements for self-service versus enterprise content. </br></br>There's a plan in place for how to request and handle ownership transfers. </br></br>Managed self-service BI—and techniques for the reuse of data—are commonly used and well-understood. |
| 500: Efficient | Proactive steps to communicate with users occur when any concerning activities are detected in the activity log. Education and information are provided to make gradual improvements or reduce risk. </br></br>Third-party tools are used by highly proficient content creators to improve productivity and efficiency. |

## Next steps

In the [next article](powerbi-adoption-roadmap-content-delivery-scope.md) in the Power BI adoption roadmap series, learn more about the scope of content delivery.
