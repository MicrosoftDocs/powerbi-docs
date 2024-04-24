---
title: "Microsoft Fabric adoption roadmap: Governance"
description: "Effectively enforce governance to drive strong and successful adoption of Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Governance

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

Data governance is a broad and complex topic. This article introduces key concepts and considerations. It identifies important actions to take when adopting Microsoft Fabric, but it's not a comprehensive reference for data governance.

As defined by the [Data Governance Institute](https://datagovernance.com/the-data-governance-basics/definitions-of-data-governance/), data governance is "a system of decision rights and accountabilities for information-related processes, executed according to agreed-upon models which describe who can take what actions, with what information, and when, under what circumstances, using what methods."

The term _data governance_ is a misnomer. The primary focus for governance isn't on the data itself. The focus is on governing _what users do with the data_. Put another way: the true focus is on governing user's behavior to ensure organizational data is well managed.

When focused on self-service data and business intelligence (BI), the primary goals of governance are to achieve the proper balance of:

- **User empowerment:** Empower the internal user community to be productive and efficient, within requisite guardrails.
- **Regulatory compliance:** Comply with the organization's industry, governmental, and contractual regulations.
- **Internal requirements:** Adhere to the organization's internal requirements.

The optimal balance between control and empowerment will differ between organizations. It's also likely to differ among different business units within an organization. You'll be most successful with a platform like Fabric when you put as much emphasis on user empowerment as on clarifying its practical usage within established guardrails.

> [!TIP]
> Think of governance as a set of established guidelines and formalized policies. All governance guidelines and policies should align with your organizational [data culture](fabric-adoption-roadmap-governance.md) and adoption objectives. Governance is enacted on a day-to-day basis by your [system oversight](fabric-adoption-roadmap-system-oversight.md) (administration) activities.

## Governance strategy

When considering data governance in any organization, the best place to start is by defining a governance strategy. By focusing first on the strategic goals for data governance, all detailed decisions when implementing governance policies and processes can be informed by the strategy. In turn, the governance strategy will be defined by the organization's [data culture](fabric-adoption-roadmap-data-culture.md).

Governance decisions are implemented with documented guidance, policies, and processes. Objectives for governance of a self-service data and BI platform, such as Fabric, include:

- Empowering users throughout the organization to use data and make decisions, within the defined boundaries.
- Improving the user experience by providing clear and transparent guidance (with minimal friction) on what actions are permitted, why, and how.
- Ensuring that the data usage is appropriate for the needs of the business.
- Ensuring that content ownership and stewardship responsibilities are clear. For more information, see the [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article.
- Enhancing the consistency and standardization of working with data across organizational boundaries.
- Reducing risk of data leakage and misuse of data. For more information, see the [information protection and data loss prevention series of articles](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md) article.
- Meeting regulatory, industry, and internal requirements for the proper use of data.

> [!TIP]
> A well-executed data governance strategy makes it easier for more users to work with data. When governance is approached from the perspective of user empowerment, users are more likely to follow the documented processes. Accordingly, the users become a trusted partner too.

## Governance success factors

Governance isn't well-received when it's enacted with top-down mandates that are focused more on control than empowerment. Governing Fabric is most successful when:

- The most lightweight governance model that accomplishes required objectives is used.
- Governance is approached on an iterative basis and doesn't significantly impede productivity.
- A bottom-up approach to formulating governance guidelines is used whenever practical. The [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) and/or the data governance team observes successful behaviors that are occurring within a business unit. The COE then takes action to scale out to other areas of the organization.
- Governance decisions are co-defined with input from different business units before they're enacted. Although there are times when a specific directive is necessary (particularly in heavily regulated industries), mandates should be the exception rather than the rule.
- Governance needs are balanced with flexibility and the ability to be productive.
- Governance requirements can be satisfied as part of users' regular workflow, making it easier for users to do the right thing in the right way with little friction.
- The answer to new requests for data isn't "no" by default, but rather "yes and" with clear, simple, transparent rules for what governance requirements are for data access, usage, and sharing.
- Users that need access to data have incentive to do so through normal channels, complying with governance requirements, rather than circumventing them.
- Governance decisions, policies, and requirements for users to follow are in alignment with organizational data culture goals as well as other existing data governance initiatives.
- Decisions that affect what users can—and can't—do aren't made solely by a system administrator.

## Introduce governance to your organization

There are three primary timing methods organizations take when introducing Fabric governance to an organization.

:::image type="content" source="media/fabric-adoption-roadmap-governance/governance-timing.svg" alt-text="Diagram shows the three main ways governance is introduced, which are described in the table below." border="false":::

The methods in the above diagram include:

| **Method** | **Strategy followed** |
| :-: | --- |
| ![Method 1.](../media/legend-number/legend-number-01-fabric.svg) | **Roll out Fabric first, then introduce governance:** Fabric is made widely available to users in the organization as a new self-service data and BI tool. Then, at some time in the future, a governance effort begins. This method prioritizes agility. |
| ![Method 2.](../media/legend-number/legend-number-02-fabric.svg) | **Full governance planning first, then roll out Fabric:** Extensive governance planning occurs prior to permitting users to begin using Fabric. This method prioritizes control and stability. |
| ![Method 3.](../media/legend-number/legend-number-03-fabric.svg) | **Iterative governance planning with rollouts of Fabric in stages:** Just enough governance planning occurs initially. Then Fabric is iteratively rolled out in stages to individual teams while iterative governance enhancements occur. This method equally prioritizes agility and governance. |

Choose method 1 when Fabric is already used for self-service scenarios, and you're ready to start working in a more efficient manner.

Choose method 2 when your organization already has a well-established approach to governance that can be readily expanded to include Fabric.

Choose method 3 when you want to have a balance of control agility. This balanced approach is the best choice for most organizations and most scenarios.

Each method is described in the following sections.

### Method 1: Roll out Fabric first

Method 1 prioritizes agility and speed. It allows users to quickly get started creating solutions. This method occurs when Fabric has been made widely available to users in the organization as a new self-service data and BI tool. Quick wins and some successes are achieved. At some point in the future, a governance effort begins, usually to bring order to an unacceptable level of chaos since the self-service user population didn't receive sufficient guidance.

**Pros:**

- Fastest to get started
- Highly capable users can get things done quickly
- Quick wins are achieved

**Cons:**

- Higher effort to establish governance once Fabric is used prevalently throughout the organization
- Resistance from self-service users who are asked to change what they've been doing
- Self-service users need to figure out things on their own, which is inefficient and results in inconsistencies
- Self-service users need to use their best judgment, which produces technical debt to be resolved

See other possible cons in the [Governance challenges](#governance-challenges) section below.

### Method 2: In-depth governance planning first

Method 2 prioritizes control and stability. It lies at the opposite end of the spectrum from method 1. Method 2 involves doing extensive governance planning before rolling out Fabric. This situation is most likely to occur when the implementation of Fabric is led by IT. It's also likely to occur when the organization operates in a highly regulated industry, or when an existing data governance board imposes significant prerequisites and up-front requirements.

**Pros:**

- More fully prepared to meet regulatory requirements
- More fully prepared to support the user community

**Cons:**

- Favors enterprise content development more than self-service
- Slower to allow the user population to begin to get value and improve decision-making
- Encourages poor habits and workarounds when there's a significant delay in allowing the use of data for decision-making

### Method 3: Iterative governance with rollouts

Method 3 seeks a balance between agility and governance. It's an ideal scenario that does _just enough_ governance planning upfront. Frequent and continual governance improvements iteratively occur over time alongside Fabric development projects that deliver value.

**Pros:**

- Puts equal priority on governance and user productivity
- Emphasizes a _learning as you go_ mentality
- Encourages iterative releases to groups of users in stages

**Cons:**

- Requires a high level of communication to be successful with agile governance practices
- Requires additional discipline to keep documentation and training current
- Introducing new governance guidelines and policies too often causes a certain level of user disruption

For more information about up-front planning, see the [Preparing to migrate to Power BI](powerbi-migration-pre-migration-steps.md) article.

## Governance challenges

If your organization has implemented Fabric without a governance approach or strategic direction (as described above by method 1), there could be numerous challenges requiring attention. Depending on the approach that you've taken and your current state, some of the following challenges could be applicable to your organization.

### Strategy challenges

- Lack of a cohesive data governance strategy that aligns with the business strategy
- Lack of executive support for governing data as a strategic asset
- Insufficient adoption planning for advancing adoption and the maturity level of BI and analytics

### People challenges

- Lack of aligned priorities between centralized teams and business units
- Lack of identified champions with sufficient expertise and enthusiasm throughout the business units to advance organizational adoption objectives
- Lack of awareness of self-service best practices
- Resistance to following newly introduced governance guidelines and policies
- Duplicate effort spent across business units
- Lack of clear accountability, roles, and responsibilities

### Process challenges

- Lack of clearly defined processes resulting in chaos and inconsistencies
- Lack of standardization or repeatability
- Insufficient ability to communicate and share lessons learned
- Lack of documentation and over-reliance on tribal knowledge
- Inability to comply with security and privacy requirements

### Data quality and data management challenges

- Sprawl of data and reports
- Inaccurate, incomplete, or outdated data
- Lack of trust in the data, especially for content produced by self-service content creators
- Inconsistent reports produced without sufficient data validation
- Valuable data not used or difficult to access
- Fragmented, siloed, and duplicated data
- Lack of data catalog, inventory, glossary, or lineage
- Unclear data ownership and stewardship

### Skills and data literacy challenges

- Varying levels of ability to interpret, create, and communicate with data effectively
- Varying levels of technical skillsets and skill gaps
- Lack of ability to confidently manage data diversity and volume
- Underestimating the level of complexity for BI solution development and management throughout its entire lifecycle
- Short tenure with continual staff transfers and turnover
- Coping with the speed of change for cloud services

>[!TIP]
> Identifying your current challenges—as well as your strengths—is essential to do proper governance planning. There's no single straightforward solution to the challenges listed above. Each organization needs to find the right balance and approach that solves the challenges that are most important to them. The challenges presented above will help you identify how they might affect your organization, so you can start thinking about what the right solution is for your circumstances.

## Governance planning

Some organizations have implemented Fabric without a governance approach or clear strategic direction (as described above by method 1). In this case, the effort to begin governance planning can be daunting.

If a formal governance body doesn't currently exist in your organization, then the focus of your governance planning and implementation efforts will be broader. If, however, there's an existing data governance board in the organization, then your focus is primarily to integrate with existing practices and customize them to accommodate the objectives for self-service and enterprise data and BI scenarios.

> [!IMPORTANT]
> Governance is a big undertaking, and it's never completely _done_. Relentlessly prioritizing and iterating on improvements will make the scope more manageable. If you track your progress and accomplishments each week and each month, you'll be amazed at the impact over time. The [maturity levels](#maturity-levels) at the end of each article in this series can help you to assess where you are currently.

Some potential governance planning activities and outputs that you might find valuable are described next.

### Strategy

**Key activities:**

- Conduct a series of workshops to gather information and assess the current state of data culture, adoption, and data and BI practices. For guidance about how to gather information and define the current state of BI adoption, including governance, see [BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md).
- Use the current state assessment and information gathered to define the desired future state, including governance objectives. For guidance about how to use this current state definition to decide on your desired future state, see [BI tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md).
- Validate the focus and scope of the governance program.
- Identify existing bottom-up initiatives in progress.
- Identify immediate pain points, issues, and risks.
- Educate senior leadership about governance, and ensure [executive sponsorship](fabric-adoption-roadmap-executive-sponsorship.md) is sufficient to sustain and grow the program.
- Clarify where Power BI fits in to the overall [BI and analytics strategy](powerbi-implementation-planning-bi-strategy-overview.md) for the organization.
- Assess internal factors such as organizational readiness, maturity levels, and key challenges.
- Assess external factors such as risk, exposure, regulatory, and legal requirements—including regional differences.

**Key output:**

- Business case with cost/benefit analysis
- Approved governance objectives, focus, and priorities that are in alignment with high-level business objectives
- Plan for short-term goals and priorities (quick wins)
- Plan for long-term and deferred goals and priorities
- Success criteria and measurable key performance indicators (KPIs)
- Known risks documented with a mitigation plan
- Plan for meeting industry, governmental, contractual, and regulatory requirements that impact BI and analytics in the organization
- Funding plan

### People

**Key activities:**

- Establish a governance board and identify key stakeholders.
- Determine focus, scope, and a set of responsibilities for the governance board.
- Establish a COE.
- Determine focus, scope, and a set of responsibilities for COE.
- Define roles and responsibilities.
- Confirm who has decision-making, approval, and veto authority.

**Key output:**

- Charter for the governance board
- Charter and priorities for the COE
- Staffing plan
- Roles and responsibilities
- Accountability and decision-making matrix
- Communication plan
- Issue management plan

### Policies and processes

**Key activities:**

- Analyze immediate pain points, issues, risks, and areas to improve the user experience.
- Prioritize data policies to be addressed by order of importance.
- Identify existing processes in place that work well and can be formalized.
- Determine how new data policies will be socialized.
- Decide to what extent data policies might differ or be customized for different groups.

**Key output:**

- Process for how data policies and documentation will be defined, approved, communicated, and maintained
- Plan for requesting valid exceptions and departures from documented policies

### Project management

The implementation of the governance program should be planned and managed as a series of projects.

**Key activities:**

- Establish a timeline with priorities and milestones.
- Identify related initiatives and dependencies.
- Identify and coordinate with existing bottom-up initiatives.
- Create an iterative project plan that's aligned with high-level prioritization.
- Obtain budget approval and funding.
- Establish a tangible way to track progress.

**Key output:**

- Project plan with iterations, dependencies, and sequencing
- Cadence for retrospectives with a focus on continual improvements

> [!IMPORTANT]
> The scope of activities listed above that will be useful to take on will vary considerably between organizations. If your organization doesn't have existing processes and workflows for creating these types of outputs, refer to the guidance found in the [adoption roadmap conclusion](fabric-adoption-roadmap-conclusion.md#industry-guidance) for some helpful resources, as well as the [implementation planning BI strategy articles](powerbi-implementation-planning-bi-strategy-overview.md).

## Governance policies

### Decision criteria

All governance decisions should be in alignment with the established goals for [organizational adoption](fabric-adoption-roadmap-maturity-levels.md). Once the strategy is clear, more tactical governance decisions will need to be made which affect the day-to-day activities of the self-service user community. These types of tactical decisions correlate directly to the data policies that get created.

How we go about making governance decisions depends on:

- **Who owns and manages the data and BI content?** The [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article introduced three types of strategies: business-led self-service, managed self-service, and enterprise. Who owns and manages the content has a significant impact on governance requirements.
- **What is the scope for delivery of the data and BI content?** The [Content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) article introduced four scopes for delivery of content: personal, team, departmental, and enterprise. The scope of delivery has a considerable impact on governance requirements.
- **What is the data subject area?** The data itself, including its sensitivity level, is an important factor. Some data domains inherently require tighter controls. For instance, personally identifiable information (PII), or data subject to regulations, should be subject to stricter governance requirements than less sensitive data.
- **Is the data, and/or the BI solution, considered critical?** If you can't make an informed decision easily without this data, you're dealing with critical data elements. Certain reports and apps could be deemed critical because they meet a set of predefined criteria. For instance, the content is delivered to executives. Predefined criteria for what's considered _critical_ helps everyone have clear expectations. Critical data is usually subject to stricter governance requirements.

> [!TIP]
> Different combinations of the above four criteria will result in different governance requirements for Fabric content.

### Key Fabric governance decisions

As you explore your goals and objectives and pursue more tactical data governance decisions as described above, it will be important to determine what the highest priorities are. Deciding where to focus your efforts can be challenging.

The following list includes items that you might choose to prioritize when introducing governance for Fabric.

- Recommendations and requirements for [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md)
- Recommendations and requirements for [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md)
- Recommendations and requirements for content [distribution and sharing](/power-bi/collaborate-share/service-how-to-collaborate-distribute-dashboards-reports) with colleagues, as well as for [external users](/power-bi/enterprise/service-admin-azure-ad-b2b), such as customers, partners, or vendors
- How users are permitted to work with regulated data and highly sensitive data
- Allowed use of unverified data sources that are unknown to IT
- When manually maintained data sources, such as Excel or flat files, are permitted
- Who is permitted to [create a workspace](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-creation-permissions)
- How to manage [workspaces](/power-bi/collaborate-share/service-create-the-new-workspaces) effectively
- How [personal workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md#appropriate-use-of-personal-workspaces) are effectively used
- Which workspaces are assigned to [Fabric capacity](/fabric/enterprise/licenses#capacity)
- Who is allowed to be a [Fabric administrator](/fabric/admin/microsoft-fabric-admin)
- [Security](/power-bi/enterprise/service-admin-power-bi-security), privacy, and data protection requirements, and allowed actions for content assigned to each [sensitivity label](/power-bi/enterprise/service-security-apply-data-sensitivity-labels)
- Allowed or encouraged use of [personal gateways](/power-bi/connect-data/service-gateway-personal-mode)
- Allowed or encouraged use of [self-service purchasing](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide&preserve-view=true) of user licenses
- Requirements for who can [certify](/power-bi/collaborate-share/service-endorse-content) content, as well as requirements that must be met
- Application lifecycle management for managing content through its entire lifecycle, including [development, test, and production stages](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines)
- Additional requirements applicable to critical content, such as data quality verifications and documentation
- Requirements to use standardized master data and common data definitions to improve consistency across data assets
- Recommendations and requirements for use of [external tools](/power-bi/transform-model/desktop-external-tools) by advanced content creators

If you don't make governance decisions and communicate them well, users will use their own judgment for how things should work—and that often results in inconsistent approaches to common tasks.

Although not every governance decision needs to be made upfront, it's important that you identify the areas of greatest risk in your organization. Then, incrementally implement  governance policies and processes that will deliver the most impact.

### Data policies

A data policy is a document that defines what users can and can't do. You might call it something different, but the goal remains the same: when decisions—such as those discussed in the previous section—are made, they're documented for use and reference by the community of users.

A data policy should be as short as possible. That way, it's easy for people to understand what is being asked of them.

A data policy should include:

- Policy name, purpose, description, and details
- Specific responsibilities
- Scope of the policy (organization-wide versus departmental-specific)
- Audience for the policy
- Policy owner, approver, and contact
- How to request an exception
- How the policy will be audited and enforced
- Regulatory or legal requirements met by the policy
- Reference to terminology definitions
- Reference to any related guidelines or policies
- Effective date, last revision date, and change log

> [!NOTE]
> Locate, or link to, data policies from your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal).

Here are three common data policy examples you might choose to prioritize.

| **Policy** | **Description** |
| --- | --- |
| Data ownership policy | Specifies when an owner is required for a data asset, and what the data owner's responsibilities include, such as: supporting colleagues who view the content, maintaining appropriate confidentiality and security, and ensuring compliance. |
| Data certification (endorsement) policy | Specifies the process that is followed to certify content. Requirements might include activities such as: data accuracy validation, data source and lineage review, technical review of the data model, security review, and documentation review. |
| Data classification and protection policy | Specifies activities that are allowed and not allowed per classification (sensitivity level). It should specify activities such as: allowed sharing with external users, with or without a non-disclosure agreement (NDA), encryption requirements, and ability to download the data. Sometimes, it's also called a _data handling policy_ or a _data usage policy_. For more information, see the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md#data-classification-and-protection-policy) article. |

> [!CAUTION]
> Having a lot of documentation can lead to a false sense that everything is under control, which can lead to complacency. The level of engagement that the [COE](fabric-adoption-roadmap-center-of-excellence.md) has with the user community is one way to improve the chances that governance guidelines and policies are consistently followed. Auditing and monitoring activities are also important.

### Scope of policies

Governance decisions will rarely be one-size-fits-all across the entire organization. When practical, it's wise to start with standardized policies, and then implement exceptions as needed. Having a clearly defined strategy for how policies will be handled for centralized and decentralized teams will make it much easier to determine how to handle exceptions.

**Pros of organization-wide policies:**

- Much easier to manage and maintain
- Greater consistency
- Encompasses more use cases
- Fewer policies overall

**Cons of organization-wide policies:**

- Inflexible
- Less autonomy and empowerment

**Pros of departmental-scope policies:**

- Expectations are clearer when tailored to a specific group
- Customizable and flexible

**Cons of departmental-scope policies:**

- More work to manage
- More policies that are siloed
- Potential for conflicting information
- Difficult to scale more broadly throughout the organization

> [!TIP]
> Finding the right balance of standardization and customization for supporting self-service data and BI across the organization can be challenging. However, by starting with organizational policies and mindfully watching for exceptions, you can make meaningful progress quickly.

## Staffing and accountability

The organizational structure for data governance varies substantially between organizations. In larger organizations there might be a data governance office with dedicated staff. Some organizations have a data governance board, council, or steering committee with assigned members coming from different business units. Depending on the extent of the data governance body within the organization, there could be an executive team separate from a functional team of people.

> [!IMPORTANT]
> Regardless of how the governance body is structured, it's important that there's a person or group with sufficient influence over data governance decisions. This person should have authority to enforce those decisions across organizational boundaries.

### Checks and balances

Governance accountability is about checks and balances.

:::image type="content" source="media/fabric-adoption-roadmap-governance/governance-accountability.svg" alt-text="Diagram shows the four types of operational, tactical, and strategic involvement, which are described in the table below." border="false":::

Starting at the bottom, the levels in the above diagram include:

| **Level** | **Description** |
| :-: | --- |
| ![Level 1.](../media/legend-number/legend-number-01-fabric.svg) | **Operational - Business units:** Level 1 is the foundation of a well-governed system, which includes users within the business units performing their work. Self-service data and BI creators have a lot of responsibilities related to authoring, publishing, sharing, security, and data quality. Self-service data and BI consumers also have responsibilities for the proper use of data. |
| ![Level 2.](../media/legend-number/legend-number-02-fabric.svg) | **Tactical - Supporting teams:** Level 2 includes several groups that support the efforts of the users in the business units. Supporting teams include the COE, enterprise data and BI, the data governance office, as well as other ancillary teams. Ancillary teams can include IT, security, HR, and legal. A change control board is included here as well. |
| ![Level 3.](../media/legend-number/legend-number-03-fabric.svg) | **Tactical - Audit and compliance:** Level 3 includes internal audit, risk management, and compliance teams. These teams provide guidance to levels 1 and 2. They also provide enforcement when necessary. |
| ![Level 4.](../media/legend-number/legend-number-04-fabric.svg) | **Strategic - Executive sponsor and steering committee:** The top level includes the executive-level oversight of strategy and priorities. This level handles any escalated issues that couldn't be solved at lower levels. Therefore, it's important to have a leadership team with sufficient authority to be able to make decisions when necessary. |

> [!IMPORTANT]
> Everyone has a responsibility to adhere to policies for ensuring that organizational data is secure, protected, and well-managed as an organizational asset. Sometimes this is cited as _everyone is a data steward_. To make this a reality, start with the users in the business units (level 1 described above) as the foundation.

## Roles and responsibilities

Once you have a sense for your governance strategy, roles and responsibilities should be defined to establish clear expectations.

Governance team structure, roles (including terminology), and responsibilities vary widely among organizations. Very generalized roles are described in the table below. In some cases, the same person could serve multiple roles. For instance, the Chief Data Officer (CDO) could also be the executive sponsor.

| **Role** | **Description** |
| --- | --- |
| Chief Data Officer or Chief Analytics Officer | Defines the strategy for use of data as an enterprise asset. Oversees enterprise-wide governance guidelines and policies. |
| Data governance board | Steering committee with members from each business unit who, as domain owners, are empowered to make enterprise governance decisions. They make decisions on behalf of the business unit _and_ in the best interest of the organization. Provides approvals, decisions, priorities, and direction to the enterprise data governance team and working committees. |
| Data governance team | Creates governance policies, standards, and processes. Provides enterprise-wide oversight and optimization of data integrity, trustworthiness, privacy, and usability. Collaborates with the COE to provide governance education, support, and mentoring to data owners and content creators. |
| Data governance working committees | Temporary or permanent teams that focus on individual governance topics, such as security or data quality. |
| Change management board | Coordinates the requirements, processes, approvals, and scheduling for release management processes with the objective of reducing risk and minimizing the impact of changes to critical applications. |
| Project management office | Manages individual governance projects and the ongoing data governance program. |
| Fabric executive sponsor | Promotes adoption and the successful use of Fabric. Actively ensures that Fabric decisions are consistently aligned with business objectives, guiding principles, and policies across organizational boundaries. For more information, see the [Executive sponsorship](fabric-adoption-roadmap-executive-sponsorship.md) article. |
| Center of Excellence | Mentors the community of creators and consumers to promote the effective use of Fabric for decision-making. Provides cross-departmental coordination of Fabric activities to improve practices, increase consistency, and reduce inefficiencies. For more information, see the [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md) article. |
| Fabric champions | A subset of content creators found within the business units who help advance the adoption of Fabric. They contribute to data culture growth by advocating the use of best practices and actively assisting colleagues. For more information, see the [Community of practice](fabric-adoption-roadmap-community-of-practice.md) article. |
| Fabric administrators | Day-to-day-system oversight responsibilities to support the internal processes, tools, and people. Handles monitoring, auditing, and management. For more information, see the [System oversight](fabric-adoption-roadmap-system-oversight.md) article. |
| Information technology | Provides occasional assistance to Fabric administrators for services related to Fabric, such as Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)), Microsoft 365, Teams, SharePoint, or OneDrive. |
| Risk management | Reviews and assesses data sharing and security risks. Defines ethical data policies and standards. Communicates regulatory and legal requirements. |
| Internal audit | Auditing of compliance with regulatory and internal requirements. |
| Data steward | Collaborates with governance committee and/or COE to ensure that organizational data has acceptable data quality levels. |
| All BI creators and consumers | Adheres to policies for ensuring that data is secure, protected, and well-managed as an organizational asset. |

> [!TIP]
> Name a backup for each person in key roles, for example, members of the data governance board. In their absence, the backup person can attend meetings and make time-sensitive decisions when necessary.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Considerations and key actions you can take to establish or strengthen your governance initiatives.

> [!div class="checklist"]
> - **Align goals and guiding principles:** Confirm that the high-level goals and guiding principles of the data culture goals are clearly documented and communicated. Ensure that alignment exists for any new governance guidelines or policies.
> - **Understand what's currently happening:** Ensure that you have a deep understanding of how Fabric is currently used for self-service and enterprise data and BI scenarios. Document opportunities for improvement. Also, document strengths and good practices that would be helpful to scale out more broadly.
> - **Prioritize new governance guidelines and policies:** For prioritizing which new guidelines or policies to create, select an important pain point, high priority need, or known risk for a data domain. It should have significant benefit and can be achieved with a feasible level of effort. When you implement your first governance guidelines, choose something users are likely to support because the change is low impact, or because they are sufficiently motivated to make a change.
> - **Create a schedule to review policies:** Determine the cadence for how often data policies are reevaluated. Reassess and adjust when needs change.
> - **Decide how to handle exceptions:** Determine how conflicts, issues, and requests for exceptions to documented policies will be handled.
> - **Understand existing data assets:** Confirm that you understand what critical data assets exist. Create an inventory of ownership and lineage, if necessary. Keep in mind that you can't govern what you don't know about.
> - **Verify executive sponsorship:** Confirm that you have support and sufficient attention from your [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md), as well as from business unit leaders.
> - **Prepare an action plan:** Include the following key items:
>   - **Initial priorities:** Select one data domain or business unit at a time.
>   - **Timeline:** Work in iterations long enough to accomplish meaningful progress, yet short enough to periodically adjust.
>   - **Quick wins:** Focus on tangible, tactical, and incremental progress.
>   - **Success metrics:** Create measurable metrics to evaluate progress.

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess governance.

- At a high level, what's the current governance strategy? To what extent is the purpose and importance of this governance strategy clear to both end users and the central data and BI teams?
- In general, is the current governance strategy effective?
- What are the key regulatory and compliance criteria that the organization (or specific business units) must adhere to? Where's this criteria documented? Is this information readily available to people who work with data and share data items as a part of their role?
- How well does the current governance strategy align to the user's way of working?
- Is a specific role or team responsible for governance in the organization?
- Who has the authority to create and change governance policies?
- Do governance teams use [Microsoft Purview](/purview/purview) or another tool to support governance activities?
- What are the prioritized governance risks, such as risks to [security](powerbi-implementation-planning-security-overview.md), [information protection](powerbi-implementation-planning-info-protection.md), and [data loss prevention](powerbi-implementation-planning-data-loss-prevention.md)?
- What's the potential business impact of the identified governance risks?
- How frequently is the governance strategy re-evaluated? What metrics are used to evaluate it, and what mechanisms exist for business users to provide feedback?
- What types of user behaviors create risk when users work with data? How are those risks mitigated?
- What sensitivity labels are in place, if any? Are data and BI decision makers aware of sensitivity labels and the benefits to the business?
- What data loss prevention policies are in place, if any?
- How is "Export to Excel" handled? What steps are taken to prevent data loss prevention? What's the prevalence of "Export to Excel"? What do people do with data once they have it in Excel?
- Are there practices or solutions that are out of regulatory compliance that must be urgently addressed? Are these examples justified with an explanation of the potential business impact, should they not be addressed?

> [!TIP]
> "Export to Excel" is typically a controversial topic. Often, business users focus on the requirement to have "Export to Excel" possible in BI solutions. Enabling "Export to Excel" can be counter-productive because a business objective isn't to get data into Excel. Instead, define why end users need the data in Excel. Ask what they do with the data once it's in Excel, which business questions they try to answer, what decisions they make, and what actions they take with the data.
>
> Focusing on business decisions and actions helps steer focus away from tools and features and toward helping people achieve their business objectives.

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your governance initiatives.

| **Level** | **State of governance** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Due to a lack of governance planning, the good data management and informal governance practices that are occurring are overly reliant on judgment and experience level of individuals. <br/><br/>&bull;&nbsp;There's a significant reliance on undocumented tribal knowledge. |
| 200: Repeatable | &bull;&nbsp;Some areas of the organization have made a purposeful effort to standardize, improve, and document their data management and governance practices. <br/><br/>&bull;&nbsp;An initial governance approach exists. Incremental progress is being made. |
| 300: Defined | &bull;&nbsp;A complete governance strategy with focus, objectives, and priorities is enacted and broadly communicated. <br/><br/>&bull;&nbsp;Specific governance guidelines and policies are implemented for the top few priorities (pain points or opportunities). They're actively and consistently followed by users. <br/><br/>&bull;&nbsp;Roles and responsibilities are clearly defined and documented. |
| 400: Capable | &bull;&nbsp;All Fabric governance priorities align with organizational goals and business objectives. Goals are reassessed regularly. <br/><br/>&bull;&nbsp;Processes exist to customize policies for decentralized business units, or to handle valid exceptions to standard governance policies. <br/><br/>&bull;&nbsp;It's clear where Fabric fits into the overall data and BI strategy for the organization. <br/><br/>&bull;&nbsp;Fabric activity log and API data is actively analyzed to monitor and audit Fabric activities. Proactive action is taken based on the data. |
| 500: Efficient | &bull;&nbsp;Regular reviews of KPIs or OKRs evaluate measurable governance goals. Iterative, continual progress is a priority. <br/><br/>&bull;&nbsp;Agility and implementing continual improvements from lessons learned (including scaling out methods that work) are top priorities for the COE. <br/><br/>&bull;&nbsp;Fabric activity log and API data is actively used to inform and improve adoption and governance efforts. |

## Related content

In the [next article](fabric-adoption-roadmap-mentoring-and-user-enablement.md) in the Microsoft Fabric adoption roadmap series, learn about mentoring and user enablement.
