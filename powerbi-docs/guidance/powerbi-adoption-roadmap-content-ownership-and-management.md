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

There are three primary strategies for how business intelligence (BI) content is owned and managed: business-led self-service BI, managed self-service BI, and enterprise BI. For the purposes of this series of articles, the term _content_ refers to any type of data artifact. It's synonymous with _solution_.

The organization's data culture is the driver for why, how, and by whom each of these three content ownership strategies are implemented.

:::image type="content" source="media/powerbi-adoption-roadmap-content-ownership-and-management/powerbi-adoption-roadmap-content-ownership.png" alt-text="Image shows content ownership responsibilities for the three types of B I delivery, which are described in the table below.":::

The areas in the above diagram include:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | **Business-led self-service BI:** All content is owned and managed by the creators and subject matter experts within a business unit. This ownership strategy is also known as a _decentralized_ or _bottom-up BI_. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | **Managed self-service BI:** The data is owned and managed by a centralized team, whereas business users take responsibility for reports and dashboards. This ownership strategy is also known as _discipline at the core and flexibility at the edge_. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | **Enterprise BI:** All content is owned and managed by a centralized team such as IT, enterprise BI, or the Center of Excellence (COE). |

It's unlikely that an organization operates exclusively with one content ownership and management strategy. Depending on the data culture, one strategy might be far more dominant than the others. The choice of strategy could differ from solution to solution, or from team to team. In fact, a single team can operate multiple strategies if it's both a consumer of enterprise BI content and a producer of its own self-service content. The strategy to pursue depends on factors such as:

- Requirements for a solution (such as a collection of reports).
- User skills.
- Ongoing commitment for training and skills growth.
- Flexibility required.
- Complexity level.
- Priorities and leadership commitment level.

The organization's [data culture](powerbi-adoption-roadmap-data-culture.md)—particularly its position on data democratization—has considerable influence on content ownership strategy adoption. While there are common patterns for success, there is no one-size-fits-all approach. Each organization's governance model and approach to content ownership and management should reflect the differences in data sources, applications, and business context.

How content is owned and managed has a significant effect on [governance](powerbi-adoption-roadmap-governance.md), the extent of [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md), needs for [user support](powerbi-adoption-roadmap-user-support.md), and the [COE](powerbi-adoption-roadmap-center-of-excellence.md) operating model.

As discussed in the [governance](powerbi-adoption-roadmap-governance.md) article, the level of governance and oversight depends on:

- Who owns and manages the content.
- The [scope of content delivery](powerbi-adoption-roadmap-content-delivery-scope.md).
- The data subject area and sensitivity level.
- The importance of the data.

In general:

- Business-led self-service BI content is subject to the least stringent governance and oversight controls.
- Managed self-service BI content is subject to moderately stringent governance and oversight controls.
- Enterprise BI solutions are subject to more rigorous governance controls and oversight.

As stated in the [adoption maturity levels](powerbi-adoption-roadmap-maturity-levels.md) article, organizational adoption measures the state of data management processes and governance. The choices made for content ownership and management significantly affect how organizational adoption is achieved.

## Ownership and stewardship

There are many roles related to data and data artifacts. Definitions can differ, This series of articles uses the following roles and definitions:

| **Role** | **Description** |
| --- | --- |
| Data steward | Responsible for defining and/or managing acceptable data quality levels as well as master data management (MDM). |
| Subject matter expert (SME) | Responsible for defining what the data means, what it is used for, who may access it, and how the data is presented to others. Collaborates with domain owner as needed and supports colleagues in their use of data. |
| Technical owner | Responsible for creating, maintaining, publishing, and securing access to data and reporting artifacts. |
| Domain owner | Higher-level decision-maker who collaborates with governance teams on data management policies, processes, and requirements. Decision-maker for defining appropriate and inappropriate uses of the data. Participates on the data governance board, as described in the [governance](powerbi-adoption-roadmap-governance.md) article. |

Assigning ownership for a data domain tends to be more straightforward when managing transactional source systems. In BI solutions, data is integrated from multiple domain areas, then transformed and enriched. For downstream analytical solutions, it makes the topic of ownership more complex.

> [!NOTE]
> Be clear about who is responsible for managing data artifacts. It's crucial to ensure a good experience for content consumers. Specifically, clarity on ownership is helpful for:
>
> - Who to contact with questions.
> - Feedback.
> - Enhancement requests.
> - Support requests.
>
> In the Power BI service, content owners can set the [contact list property](../create-reports/service-item-contact.md) of many artifacts types. The contact list is also used in security workflows. For example, when a user is sent a URL to open an app but they don't have permission, they will be presented with an option to make a request for access.

Guidelines for being successful with ownership:

- Define how ownership and stewardship terminology is used in your organization, including expectations for these roles.
- Set [contacts for each workspace](../collaborate-share/service-create-the-new-workspaces.md#create-a-contact-list) and for individual artifacts to communicate ownership and/or support responsibilities.
- Specify 2-4 [workspace administrators](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) and conduct an [audit](/rest/api/power-bi/admin/groups_getgroupusersasadmin) of workspace admins on a regular basis (at least twice a year). Workspace admins might be directly responsible for managing workspace content, or may be those tasks are assigned to colleagues who do the hands-on work. In all cases, workspace admins should be able to easilycontact owners of specific content.
- Include consistent branding on reports to indicate who produced the content and who to contact for help. A small image or text label located in the report footer is valuable, especially when the report is exported from the Power BI service. A standard template, as described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, can encourage and simplify the consistent use of branding.
- Make use of best practices reviews with the COE, which are discussed in the [COE](powerbi-adoption-roadmap-center-of-excellence.md) article.

The remainder of this article covers considerations related to the three content ownership and management strategies.

## Business-led self-service BI

With business-led self-service BI, all content is owned and managed by creators and subject matter experts. Because responsibility is retained within a business unit, this strategy is often described as the bottom-up, or decentralized, approach.

> [!IMPORTANT]
> The concept of business-led self-service BI is not the same as shadow IT. In both scenarios, BI content is created, owned, and managed by business users. However, shadow IT implies that the business unit is circumventing IT and so the solution is not sanctioned. With business-led self-service BI solutions, the business unit has full authority to create and manage content. And, resources and support are available to content creators. It's also expected that the business unit complies with all established data governance guidelines and policies.

Business-led self-service BI is most suitable when:

- Decentralized data management aligns with the organization's data culture, and the organization is prepared to support these efforts.
- Data exploration and freedom to innovate is a high priority.
- The business unit wants to have the most involvement and retain the highest level of control.
- The business unit has skilled people capable of—and fully committed to—supporting solutions through the entire lifecycle. It covers all types of Power BI artifacts, including the data (dataflows and datasets), the visuals (reports and dashboards), and apps.
- The flexibility to respond to changing business conditions and react quickly outweighs the need for stricter governance and oversight.

Guidelines for being successful with business-led self-service BI:

- Teach your creators to use the same techniques that IT would use, like [shared datasets](../connect-data/service-datasets-across-workspaces.md) and [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md). Having fewer duplicated datasets reduces maintenance, improves consistency, and reduces risk.
- Focus on providing mentoring, training, resources, and documentation (described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article). The importance of these efforts can't be overstated. Be prepared for skill levels of self-service content creators to vary significantly. It's also common for a solution to deliver excellent business value yet be built in such a way that it won't scale or perform well over time (as historic data volumes increase). Having the [COE](powerbi-adoption-roadmap-center-of-excellence.md) available to help when these situations arise is very valuable.
- Provide guidance on the best way to use endorsement. The [promoted endorsement](../collaborate-share/service-endorse-content.md#promote-content) is for content produced by self-service creators. Consider reserving use of the [certified endorsement](../collaborate-share/service-endorse-content.md#certify-content) for enterprise BI content and managed self-service BI content (discussed next).
- Analyze the [activity log](../admin/service-admin-auditing.md) to discover situations where the COE could proactively contact self-service owners to offer helpful information. It's especially useful when a suboptimal usage pattern is detected. For example, log activity could reveal overuse of individual item sharing when an app or workspace roles may be a better choice. The activity log presents presents a great way for the COE to offer support and advice to the business units. It can help increase the quality of solutions, while allowing the business to retain full ownership and control of their content.

## Managed self-service BI

Managed self-service BI is a blended approach. The data is owned and managed by a centralized team (such as IT, enterprise BI, or the COE), while responsibility for reports and dashboards belongs to creators and subject matter experts within the business units.

This approach is often called _[discipline at the core and flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core)_. It's because the data architecture is maintained by a single team with an appropriate level of discipline and rigor. Business units have the flexibility to create reports and dashboards based on centralized data. This approach allows report creators to be far more efficient because they can remain focused on delivering value from their data analysis and visuals.

Managed self-service BI is most suitable when:

- Centralized data management aligns with the organization's data culture.
- The organization has a team of BI experts who manage the data architecture.
- There's value in the reuse of data by many self-service report creators across organizational boundaries.
- Self-service report creators need to produce content at a pace faster than the centralized team can accommodate.
- Different people are responsible for handling data preparation, data modeling, and report creation.

Guidelines for being successful with self-service BI:

- Teach users to [separate model and report development](report-separate-from-model.md#separate-report-files). They can use [live connections](../connect-data/desktop-report-lifecycle-datasets.md) to create reports based on existing datasets. When the dataset is stored in separately Power BI Desktop file from the report, it promotes data reuse by many reports and many authors.
- Use [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md) to centralize data preparation logic and to share commonly used data entities—like date, customer, product, or sales—with many dataset creators. Refine the dataflow as much as possible, using friendly column names and correct data types to reduce the downstream effort required by dataset authors, who consume the dataflow as a source. Dataflows are an effective way to reduce the time involved with data preparation and improve data consistency across datasets. The use of dataflows also reduces the number of data refreshes on source systems and allows fewer users requiring direct access to source systems.
- When self-service creators need to augment an existing dataset with departmental data, educate them to use [DirectQuery connections to Power BI datasets and Azure Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md). This feature allows for an ideal balance of self-service enablement while taking advantage of the investment in data assets that are centrally managed.
- Use the [certified endorsement](../collaborate-share/service-endorse-content.md#certify-content) for datasets and dataflows to help content creators identify trustworthy sources of data.
- Include consistent branding on all reports to indicate who produced the content and who to contact for help. Branding is particularly helpful to distinguish content that is produced by self-service creators. A small image or text label in the report footer is valuable when the report is exported from the Power BI service.
- Consider implementing separate [workspaces](../collaborate-share/service-new-workspaces.md) for storing data and reports. This approach allows for better clarity on who is responsible for content. It also allows for more restrictive [workspace roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) assignments. That way, report creators can only publish content to their reporting workspace; and, read and build dataset permissions allow creators to create new reports with row-level security (RLS) in effect, when applicable.
- Use the [Power BI REST APIs](/rest/api/power-bi/) to compile an inventory of Power BI artifacts. Analyze the ratio of datasets to reports to evaluate the extent of dataset reuse.

## Enterprise BI

Enterprise BI is a centralized approach in which all content is owned and managed by a centralized team. This team can be IT, enterprise BI, or the COE.

Enterprise BI is most suitable when:

- Centralizing content management with a single team aligns with the organization's data culture.
- The organization has BI expertise to manage all the BI artifacts end-to-end.
- The content needs of consumers are well-defined, and there's little need to customize or explore data beyond the reporting solution that's delivered.
- Content ownership and direct access to data needs to be limited to a small number of people.
- The data is highly sensitive or subject to regulatory requirements.

Guidelines for being successful with enterprise BI:

- Implement a rigorous process for use of the [certified endorsement](../collaborate-share/service-endorse-content.md#certify-content) for datasets, reports, and apps. Not all enterprise BI content needs to be certified, but much of it probably should be. Certified content should indicate that data quality has been validated. Certified content should also follow change management rules, have formal support, and be fully documented. Because certified content has passed rigorous standards, the expectations for trustworthiness are higher.
- Include consistent branding on enterprise BI reports to indicate who produced the content, and who to contact for help. A small image or text label in the report footer is valuable when the report is exported from the Power BI service.
- If you use specific report branding to indicate enterprise BI content, be careful with the _save a copy_ functionality that would allow a user to download a copy of a report and personalize it. Although this functionality is an excellent way to bridge enterprise BI with managed self-service BI, it dilutes the value of the branding. Consider a more seamless solution that provides a separate [Power BI Desktop template file](../create-reports/desktop-templates.md#using-report-templates) for self-service authors. The template defines a starting point for report creation live connection to an existing dataset, and it doesn't include branding. The template file can be shared as a link within a Power BI app, or from the community site.

## Ownership transfers

Occasionally, the ownership of a particular solution may need to be transferred to another team. Ownership transfer from a business unit to a centralized team can happen when:

- A business-led solution is used by a significant number of people, or it's now supports critical business decisions. So, it now needs to be managed by a team with processes in place to implement higher levels of governance and support.
- A business-led solution is a candidate to be used far more broadly throughout the organization, so it needs to be managed by a team who can set security and deploy content widely throughout the organization.
- A business unit no longer has the expertise, budget, or time available to continue managing the content.
- The size or complexity of a solution has grown to a point where a different data architecture redesign is required.
- A proof of concept was created which is now ready to operationalize.

The [COE](powerbi-adoption-roadmap-center-of-excellence.md) should have well documented procedures for identifying when a solution is a candidate for ownership transfer. It's very helpful if help desk personnel know what to look for as well. Having a customary pattern for self-service creators to build and grow a solution, and hand it off in certain circumstances, is an indicator of a productive and healthy data culture. A simple ownership transfer may be addressed during COE office hours; a more complex transfer may warrant a small project managed by the COE.

> [!NOTE]
> There's potential that the new owner will need to do some refactoring before they're willing to take full ownership. Refactoring is most likely to occur with the less visible aspects of data preparation, data modeling, and calculations. If there are any manual steps or flat file sources, it's an ideal time to apply those enhancements. The branding of reports and dashboards may also need to change. For example, if there's a footer indicating report contact or a text label indicating that the content is certified.

It's also possible for a centralized team to transfer ownership to a business unit. It could happen when:

- The team with domain knowledge is better equipped to own and manage the content going forward.
- The centralized team has created the solution for a business unit that doesn't have the skills to create it from scratch, but it can maintain and extend the solution going forward.

> [!TIP]
> Don't forget to recognize and reward the work of the original creator, particularly if ownership transfers are a common occurrence.

## Considerations and key actions

Here is a list of considerations and key actions you can take to strengthen your approach to content ownership and management:

- Ensure you deeply understand how content ownership and management is happening throughout the organization. Recognize that there likely won't be a one-size-fits-all approach to apply uniformly across the entire organization.
- Determine what is currently working well, what isn't working well. Also, determine what the desired balance is between the three ownership strategies. If necessary, schedule discussions with specific people on various teams. Develop a plan for moving from the current state to the desired state.
- If your enterprise BI team currently has challenges related to scheduling and priorities, do an assessment to determine if a managed self-service BI strategy can be put in place to empower more content creators throughout the organization. Managed self-service BI can be extremely effective on a global scale.
- Clarify terms used in your organization for owner, data steward, and subject matter expert. Make sure roles and responsibilities are documented, including backup personnel.
- Ensure that all your content owners—from both the business and IT—are part of your [community of practice](powerbi-adoption-roadmap-community-of-practice.md).
- Determine how you will use the contacts feature in Power BI. Communicate with content creators about how it should be used, and why it's important.
- If ownership transfers occur regularly, create a process for how it will work.
- Determine your strategy for using [external tools](https://powerbi.microsoft.com/blog/community-tools-for-enterprise-powerbi-and-analysisservices/) for advanced authoring capabilities and increased productivity.

## Maturity levels

The following maturity levels will help you assess the current state of your content ownership and management:

| **Level** | **State of Power BI content ownership and management** |
| --- | --- |
| 100: Initial | Content is owned and managed by self-service creators throughout the organization in an uncontrolled way, without a specific strategy.</br></br>A high ratio of datasets to reports exists, indicating an opportunity to improve data reusability and reduce the number of duplicate datasets.</br></br>Discrepancies between different reports is common, causing distrust of content produced by others. |
| 200: Repeatable | A plan is in place for which content ownership and management strategy to use and in which circumstances.</br></br>Initial steps are taken to improve the consistency and trustworthiness levels for self-service BI efforts.</br></br>Guidance for the user community is available that includes expectations for self-service versus enterprise content. |
| 300: Defined | Managed self-service BI is a priority and an area of investment to further advance the data culture. The priority is to allow report creators the flexibility they need while using well managed, secure, and trustworthy data sources.</br></br>Report branding is consistently used to indicate who produced the content.</br></br>A [mentoring program](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) exists to educate self-service content creators on how to apply best practices and make good decisions. |
| 400: Capable | Criteria is defined to align governance requirements for self-service versus enterprise content.</br></br>There is a plan in place for how to request and handle ownership transfers.</br></br>Managed self-service BI—and techniques for the reuse of data—are commonly used and well understood. |
| 500: Efficient | Proactive measures are in place to communicate with a user when any concering user activities are detected in the activity log.</br></br>External tools are used by highly proficient content creators to improve productivity and efficiency. |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-content-delivery-scope.md), learn more about the scope of content delivery.
