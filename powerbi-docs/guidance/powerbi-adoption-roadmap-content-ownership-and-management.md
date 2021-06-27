---
title: "Power BI adoption roadmap: Content ownership and management"
description: Develop strategies about how BI content is owned and managed to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: Content ownership and management

There are three primary strategies for how business intelligence content is owned and managed: business-led self-service BI, managed self-service BI, and enterprise BI. For purposes of this series of articles the term "content" can refer to any type of data artifact. It's synonymous with "solution."

The organization's data culture is the driver for why, how, and by whom each of these three content ownership strategies are implemented:

:::image type="content" source="media/powerbi-adoption-roadmap-content-ownership-and-management/powerbi-adoption-roadmap-content-ownership.png" alt-text="Image shows content ownership responsibilities for the three types of B I delivery, which are described in the table below.":::

The areas in the above diagram include:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | **Business-led self-service BI:** All content is owned and managed by the creators and subject matter experts within a business unit. Also known as a decentralized or bottom-up BI strategy. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | **Managed self-service BI:** The data is owned and managed by a centralized team, whereas business users take responsibility for reports and dashboards. This strategy is also known as "discipline at the core and flexibility at the edge." |
| ![Item 3.](media/common/icon-03-red-30x30.png) | **Enterprise BI:** All content is owned and managed by a centralized team such as IT, enterprise BI, or the Center of Excellence. |

It's unlikely for an organization to operate exclusively in one mode for content ownership and management. Depending on your data culture, one strategy might be far more common than the others. The strategy can change from solution to solution, and from team to team. In fact, a single team can operate in multiple modes if it's a consumer of enterprise BI content and a producer of its own self-service content. Which strategy to pursue depends on factors such as:

- Requirements for a solution (such as a collection of reports)
- Staff skills
- Ongoing commitment for training and skills growth
- Flexibility required
- Complexity level
- Priorities and leadership commitment level

The organization's [data culture](powerbi-adoption-roadmap-data-culture.md), particularly its position on data democratization, is a considerable influence on the extent to which each of the three content ownership strategies are used. Although there are common patterns for success, there is no one-size-fits-all approach. Each organization's governance model and approach to content ownership and management should reflect the differences in data sources, applications, and business context.

How content is owned and managed has a significant effect on [governance](powerbi-adoption-roadmap-governance.md), the extent of [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md), needs for [user support](powerbi-adoption-roadmap-user-support.md), and the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md) (COE) operating model.

As discussed in the [governance](powerbi-adoption-roadmap-governance.md) article, the level of governance and oversight depends on:

1. Who owns and manages the content.
1. The [scope of content delivery](powerbi-adoption-roadmap-content-delivery-scope.md).
1. The data subject area and sensitivity level.
1. The criticality of the data.

In general:

- Business-led self-service BI content is subject to the least stringent governance and oversight controls.
- Managed self-service BI content is subject to moderate stringent governance and oversight controls.
- Enterprise BI solutions are subject to more rigorous governance controls and oversight.

As stated in the [adoption maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article, organizational adoption measures the state of data management processes and governance. The choices made for content ownership and management significantly affect how organizational adoption is achieved.

## Ownership and stewardship

The terms owner, data steward, and subject matter expert can be used many ways and can be easily misunderstood. Following are possible ways you may conceptually define these roles:

| **Role** | **Description** |
| --- | --- |
| Data steward | Responsible for defining and/or managing acceptable data quality levels as well as master data management. |
| Subject matter expert (SME) | Responsible for defining what the data means, what it is used for, who may access it, and how the data is presented to others. Collaborates with domain owner as needed and supports colleagues in their use of data. |
| Technical owner | Responsible for creating, maintaining, publishing, and securing access to data and reporting artifacts. |
| Domain owner | Higher-level decision-maker who collaborates with governance teams on data management policies, processes, and requirements. The decision-maker for defining appropriate and inappropriate uses of the data. Participates on the data governance board, as discussed in the [governance](powerbi-adoption-roadmap-governance.md) article. |

Specifying ownership for a data domain tends to be more straightforward when managing transactional source systems. In business intelligence solutions we may integrate data from multiple domain areas, transform it, and enrich it. This fundamentally makes the topic of ownership more complex for downstream analytical solutions.

> [!NOTE]
> Being clear on who is responsible for managing data artifacts is crucial to ensure a good experience for the consumers of the content. Clarity on ownership is helpful for:
>
> - Who to contact with questions
> - Feedback
> - Enhancement requests
> - Support requests
>
> In the Power BI service, the [contact list property](../create-reports/service-item-contact.md) can be set on most types of artifacts. The contact is also used in security workflows (for instance, when a user was sent a URL, doesn't have access, and clicks the request access button).

Guidelines for being successful with managing ownership:

- Define how ownership and stewardship terminology is used in your organization, including expectations for these roles.
- Set [contacts for each workspace](../collaborate-share/service-create-the-new-workspaces.md#create-a-contact-list) and for individual artifacts to signify ownership and/or support responsibilities.
- Specify 2-4 [workspace administrators](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) and conduct an [audit](/rest/api/power-bi/admin/groups_getgroupusersasadmin) of those workspace admins on a regular basis (ex: twice a year). Workspace administrators might be directly responsible for managing the content in the workspace, or it may be their colleagues doing the hands-on work. In all cases, the workspace admins should be able to easily get in touch with the owner of specific content in the workspace.
- Include consistent branding on reports to indicate who produced the content, and who to contact for help. A small icon or label in the report footer is valuable when the report is exported out of the Power BI service. A standard template (discussed in the [mentoring and user enablement article](powerbi-adoption-roadmap-mentoring-and-user-enablement.md)) can encourage and simplify the consistent use of branding.
- Make use of best practices reviews with the COE, which is discussed in the [COE](powerbi-adoption-roadmap-center-of-excellence.md) article.

The remainder of this article will cover considerations related to the three strategies for content ownership and management.

## Business-led self-service BI

With business-led self-service BI, all content is owned and managed by creators and subject matter experts. Because responsibility is retained within a business unit, this is often thought of as a bottom-up or decentralized approach.

> [!IMPORTANT]
> The concept of business-led self-service BI is not the same as shadow IT. In both scenarios, BI content is created, owned, and managed by business users. However, shadow IT implies that the business unit is circumventing IT and that the solution is not sanctioned. With business-led self-service BI solutions, the business unit has full authority to create and manage this content. Resources and support are available to the content creators. It's also expected that the business unit will comply with all established data governance guidelines and policies.

Business-led self-service BI is most suitable when:

- Decentralized data management is something that aligns with the organization's data culture, and the organization is prepared to support these efforts.
- Data exploration and freedom to innovate is a high priority.
- The business unit wants to have the most involvement and retain the highest level of control.
- The business unit has skilled staff capable of, and fully committed to, supporting solutions through their entire lifecycle. This includes all types of Power BI artifacts including the data (dataflows and datasets), the visuals (reports and dashboards), as well as apps.
- The flexibility to respond to changing business conditions and iterate quickly outweighs the need for stricter governance and oversight.

Guidelines for being successful with business-led self-service BI:

- Teach your creators to use the same techniques that IT would use, such as [shared datasets](../connect-data/service-datasets-across-workspaces.md) and [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md). Having fewer duplicate datasets reduces maintenance, improves consistency, and reduces risk.
- Focus on providing mentoring, training, resources, and documentation (discussed in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article). The importance of these efforts can't be overstated. Be prepared for skill levels of self-service content creators to vary quite a lot. It's also quite common for a solution to deliver excellent business value yet be built in such a way that it won't scale or perform well over time. Having the [COE](powerbi-adoption-roadmap-center-of-excellence.md) available to help when these situations come up is very valuable.
- Provide guidance on the best way to use the promoted [endorsement](../collaborate-share/service-endorse-content.md) for content produced by self-service creators. Consider reserving use of the certified endorsement for enterprise BI content and managed self-service BI content (discussed next).
- Analyze data from the [activity log](../admin/service-admin-auditing.md) to reveal situations where the COE could proactively contact self-service owners to offer helpful information. This is especially useful when a suboptimal usage pattern is detected (for example, the overuse of individual item sharing when an app or workspace roles may be a better choice). This is a great way for the COE to offer advice to the business units to increase the quality of solutions, while allowing the business to retain full ownership and control of the content.

## Managed self-service BI

Managed self-service BI is a blended approach in which the data is owned and managed by a centralized team (such as IT, enterprise BI, or the COE), whereas responsibility for reports and dashboards belongs to creators and subject matter experts within the business units.

This approach is often called _[discipline at the core and flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core)_. This is because the data architecture is maintained by a single team with an appropriate level of discipline and rigor. Flexibility exists to create reports and dashboards according to specific needs of each business unit, based on the centralized data. This allows report creators to be far more efficient because they can focus most of their time on delivering value from their data analysis and visuals.

Managed self-service BI is most suitable when:

- Centralized data management is something that aligns with the organization's data culture.
- The organization has a team of BI experts to manage the data architecture.
- There's value in the reuse of data, by many self-service report creators, across organizational boundaries.
- Self-service report creators need to produce content at a pace faster than the centralized team can accommodate.
- Different people are responsible for handling data preparation, data modeling, and report creation.

Guidelines for being successful with managed self-service BI:

- Teach users to use [live connection](../connect-data/desktop-report-lifecycle-datasets.md) for connecting to an existing dataset. When the dataset is decoupled from the report (i.e., a physically separate .pbix file), that allows the data to be reused for many reports by many authors. Decoupling is an effective way to facilitate the separation of duties.
- Use [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md) to centralize data preparation logic and to share commonly used tables (such as date, customer, product, or sales) with many dataset authors. Refine the dataflow as much as possible, including friendly column names and correct data types to reduce the effort required by dataset authors (who consume the dataflow as a source). Dataflows are an effective way to reduce the time involved for data preparation and improve consistency across datasets. The use of dataflows also reduces the number of data refreshes on source systems and allows fewer people to require direct access to source systems.
- When self-service creators would like to augment an existing dataset with departmental data, educate them to use "[DirectQuery for Power BI datasets and Azure Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md)." This feature allows for an ideal balance of self-service enablement while taking advantage of the investment in data assets which are centrally managed.
- Use the certified [endorsement](../collaborate-share/service-endorse-content.md) for datasets and dataflows to help content creators identify trustworthy sources of data.
- Include consistent branding on all reports to indicate who produced the content, and who to contact for help. This is particularly helpful to distinguish content that is produced by self-service creators. A small icon or label in the report footer is valuable when the report is exported out of the Power BI service.
- Consider implementing separate [workspaces](../collaborate-share/service-new-workspaces.md) for storing data and reports. This allows for better clarity on who is responsible for content. It also allows [workspace roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) to be handled separately, which is a significant advantage (i.e., report creators may only publish content in their reporting workspace; read + build permissions on the dataset allows creators to build new reports with row-level security in effect when applicable).
- Analyze data from the [Power BI REST APIs](/rest/api/power-bi/) to compile an inventory of content. Analyze the ratio of datasets to reports to evaluate the extent of dataset reuse.

## Enterprise BI

Enterprise BI is a centralized approach in which all content is owned and managed by a centralized team. This is usually IT, enterprise BI, or the COE.

Enterprise BI is most suitable when:

- Centralizing content management with a single team aligns with the organization's data culture.
- The organization has a BI expertise to manage all the BI artifacts end-to-end.
- The needs for consumers of the content are well-defined, and there's little need to customize or explore data beyond the reporting solution that is delivered.
- Content ownership and direct access to data needs to be highly limited to a small number of people.
- The data is highly sensitive or subject to regulatory requirements.

Guidelines for being successful with enterprise BI:

- Implement a rigorous process for use of the certified [endorsement](../collaborate-share/service-endorse-content.md) for reports and apps. Not all enterprise BI content needs to be certified, but much of it probably will be. Certified content should indicate that data quality has been validated. Certified content should also follow change management rules, have formal support, and be fully documented. Because of the requirements to become certified, the expectations for trustworthiness are higher.
- Include consistent branding on enterprise BI reports to indicate who produced the content, and who to contact for help. A small icon or label in the report footer is valuable when the report is exported out of the Power BI service.
- If you use specific report branding to indicate enterprise BI content, be careful with the "save a copy" functionality which would allow a user to download a copy of a report and personalize it. Although this functionality is an excellent way to bridge enterprise BI with managed self-service BI, it dilutes the value of the branding. A more seamless solution is to provide a separate [template](../create-reports/desktop-templates.md#using-report-templates) for self-service authors (ex: a .pbit file which is a starter report connected to an existing dataset) which excludes the branding. This can be distributed as a link within a Power BI app, or within the community site.

## Ownership transfers

Occasionally, the ownership of a particular solution may need to be transferred to another team. Types of situations when ownership is transferred from a business unit to a centralized team include:

- A business-led solution is now being used by a significant number of people or is now used for critical business decisions, so it needs to be managed by a team with processes in place to implement higher levels of governance and support.
- A business-led solution is a candidate to be used far more broadly throughout the organization, so it needs to be managed by a team who can set security and deploy content widely throughout the organization.
- A business unit no longer has the staff, budget, or time available to continue managing the content.
- The size or complexity of a solution has grown to a point where different data architecture decisions or redesign is required.
- A proof of concept was created which is now ready to be operationalized.

The [COE](powerbi-adoption-roadmap-center-of-excellence.md) should have well-documented procedures for identifying when a solution is a candidate for an ownership transfer. It's very helpful if help desk personnel know what to look for as well. Having a customary pattern for self-service creators to build and grow a solution, and hand it off in certain circumstances, is an indicator of a productive and healthy data culture. A simple ownership transfer may be able to be addressed during COE office hours, or a more complex one may warrant a short project with the COE.

> [!NOTE]
> There's potential that the new owner will need to do some refactoring before they are willing to assume full ownership and support. Refactoring is most likely to occur with the less visible aspects of data preparation, data modeling, and calculations. If there are any manual steps or flat file sources, this is an ideal time to take on those enhancements. The branding of the reports and dashboards may also need to change (ex: if there's a footer indicating who to contact with questions or a label indicating the content is certified).

It's also possible for a centralized team to transfer ownership to a business unit. This could happen when:

- The team with domain knowledge is better equipped to own and manage the content going forward.
- The centralized team has created the solution for a business unit that does not have the skills to create it from scratch, but it can maintain and extend the solution going forward.

> [!TIP]
> Don't forget to recognize and reward the work of the original creator, particularly if ownership transfers are a common occurrence.

## Considerations and key actions

Considerations and key actions you can take to strengthen your approach to content ownership and management:

- Ensure that you deeply understand how content ownership and management is currently happening throughout the organization. Recognize that there likely will not be a one-size-fits-all approach to apply uniformly across the entire organization.
- Determine what is working well currently, what isn't working well, and what the desired balance is between the three ownership strategies. Schedule discussions with various people on various teams to understand more if necessary and develop a plan for moving from current state to future state.
- If your enterprise BI team currently has challenges related to scheduling and priorities, do an assessment to determine if a managed self-service BI strategy can be put in place to empower more content creators throughout the organization. Managed self-service BI can be extremely effective on a global scale.
- Clarify terms used in your organization for owner, steward, and expert. Make sure roles and responsibilities are documented, including backup personnel.
- Ensure that all of your content owners, from both the business and IT, are part of your [community of practice](powerbi-adoption-roadmap-community-of-practice.md).
- Determine how you will use the contacts feature in Power BI. Communicate with content creators about how it should be used, and why it's important.
- If ownership transfers occur regularly, create a process for how this will work.
- Determine your strategy for using [external tools](https://powerbi.microsoft.com/blog/community-tools-for-enterprise-powerbi-and-analysisservices/) for advanced authoring scenarios and increased productivity.

## Maturity levels

The following maturity levels will help you assess the current state of your content ownership and management:

| **Level** | **State of Power BI content ownership &amp; management** |
| --- | --- |
| 100: Initial | Content is owned and managed by self-service creators throughout the organization in an uncontrolled way, without a specific strategy.</br></br>A high ratio of datasets to reports exists, indicating an opportunity to improve data reusability and reduce the number of duplicate datasets.</br></br>Discrepancies between different reports is a common occurrence, causing distrust of content produced by others. |
| 200: Repeatable | A plan is in place for which content ownership and management strategy to use in which circumstances.</br></br>Initial steps have been taken to improve the consistency and trustworthiness levels for self-service BI efforts.</br></br>Guidance for the user community is available which includes expectations for self-service vs. enterprise content. |
| 300: Defined | Managed self-service BI is a priority and an area of investment to further advance the data culture. The priority is to allow report creators the flexibility they need while using well-managed, secure, trustworthy data sources.</br></br>Report branding is consistently used to indicate who produced the content.</br></br>A [mentoring program](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) exists which assists self-service content creators with following best practices and making good decisions. |
| 400: Capable | Criteria is defined to align governance requirements for self-service vs. enterprise content.</br></br>There is a plan in place for how to request and handle ownership transfers.</br></br>Managed self-service BI, and techniques for the reuse of data, are commonly used and very well-known. |
| 500: Efficient | Proactive measures are taken to communicate with a user when any concerning user activities are detected in the activity log.</br></br>External tools are used by highly proficient content creators for improved productivity and efficiency. |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-content-delivery-scope.md), learn more about the scope of content delivery.
