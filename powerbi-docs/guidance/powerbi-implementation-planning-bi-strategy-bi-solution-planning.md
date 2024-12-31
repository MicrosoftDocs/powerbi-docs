---
title: "Power BI implementation planning: BI solution planning"
description: "This article helps you to plan solutions that support your business intelligence strategy."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: BI solution planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to plan solutions that support your business intelligence (BI) strategy. It's primarily targeted at:

- **BI and analytics directors or managers**: Decision makers who are responsible for overseeing the BI program and strategically important BI solutions.
- **Center of Excellence (COE), IT, and BI teams**: The teams that design and deploy enterprise BI solutions for their organization.
- **Subject matter experts (SMEs) and content owners and creators**: The teams and individuals that champion analytics in a department and design and deploy solutions for self-service, [departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md), or [team BI](powerbi-implementation-planning-usage-scenario-team-bi.md) usage scenarios.

A BI strategy is a plan to implement, use, and manage data and analytics. You define your BI strategy by starting with [BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md). Strategic planning helps you to identify your BI focus areas and objectives. To determine the path to progress toward your BI objectives, you describe specific key results by using [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md). You then achieve progress toward these key results by planning and deploying BI solutions.

[!INCLUDE [powerbi-implementation-planning-bi-strategy-context](includes/powerbi-implementation-planning-bi-strategy-context.md)]

There are many approaches to plan and implement BI solutions. This article describes one approach that you can take to plan and implement BI solutions that support your BI strategy.

The following high-level diagram depicts how to conduct BI solution planning.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/bi-solution-planning-levels.svg" alt-text="Diagram shows an overview of strategic, tactical, and solution planning for business intelligence. Solution planning is highlighted. The details about solution planning are described in the table below." border="false":::

You take the following steps to conduct BI solution planning.

| Step | Description |
| :-: | --- |
| **1** | Assemble a project team that gathers requirements and defines the design of the solution. |
| **2** | Plan for solution deployment by performing initial setup of tools and processes. |
| **3** | Conduct a solution proof of concept (POC) to validate assumptions about the design. |
| **4** | Create and validate content by using iterative development and validation cycles. |
| **5** | Deploy, support, and monitor the solution after it's released to the production environment. |

> [!NOTE]
> BI solution planning applies to both [self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) and [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) projects.

For more information, see the [Power BI migration](powerbi-migration-overview.md) series. While the series is concerned with migration, the key actions and considerations are relevant to solution planning.

## Step 1: Gather requirements

You commence solution planning by first gathering requirements and defining the solution design.

**Note**: Strategic and tactical planning is led by a _working team_, which leads the initiative. In contrast, solution planning is led by a _project team_, which consists of content owners and creators.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/bi-solution-planning-step-1.svg" alt-text="Diagram shows step 1 in a series of five steps to deliver value iteratively from BI solution planning. Step 1 is about gathering requirements." border="false":::

Gathering the right requirements is critical to achieve successful solution deployment and adoption. An effective way to gather requirements is to identify and involve the right stakeholders, collaboratively define the problem to be solved, and use that shared understanding of the problem to create a solution design.

Here are some benefits from using a collaborative approach to gather requirements.

- **User input produces more useful designs**: By engaging users in focused discussions to collect requirements, you can more effectively capture business data needs. For example, users can demonstrate to content creators how they use existing solutions and provide feedback about the perceived effectiveness of these solutions.
- **Avoid assumptions and mitigate change requests**: Discussions with users often reveal nuances, exceptions, and hidden complexities. These insights reduce the likelihood of late-stage requests, which can be costly to address.
- **Onboarding users increases solution adoption**: By involving users in design and early development, you provide them with an opportunity to influence the final result. Involvement can also give users a sense of intellectual ownership and accountability for the solution. Highly involved users will be more likely to endorse the solution and lead their [community of practice](fabric-adoption-roadmap-community-of-practice.md) in using it effectively.
- **Designs set expectations for stakeholders and business users**: By producing mock-ups or illustrations of the solution design, you can clearly show stakeholders what the solution will deliver. It also helps by creating a mutual understanding of the expected project result. This process is also known as _design thinking_, and it can be an effective way to approach and understand complex problems.

You can take different approaches to engage users and gather requirements. For example, you can gather requirements with _business design_ and _technical design_ (described in detail in later sections of this article).

Business design is an approach to gather business requirements. It focuses on engaging business users in business design sessions to collaboratively design the solution. The output of a business design consists of solution mock-ups and descriptive design documentation.

Technical design is an approach to translate business requirements to technical requirements, and to address design assumptions. A technical design focuses on validating the business design and defining a technical approach to use. To validate the design, content creators typically engage with technical experts in focused discussions called technical design sessions, where necessary.

> [!IMPORTANT]
> Collecting the wrong requirements is a common reason why implementations fail. Often, teams collect the wrong requirements because they engaged with the wrong stakeholders, like decision makers who provide top-down requests for solutions to be built.
>
> Engaging business users by using collaborative approaches like a business design can help you collect better requirements. Better requirements often lead to more efficient development and more robust solutions.

> [!NOTE]
> For some teams, adopting a structured requirements gathering process is a big change. Ensure that you manage this change, and that it doesn't disrupt solution planning. We recommend that you find ways to adapt these approaches to fit with the way your team works.

### Prepare for solution planning

You should first prepare for solution planning by considering the factors described in the following sections.

- **Identify who will conduct solution planning**: As part of the [BI tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md), the working team created a prioritized backlog of solutions. In solution planning, a project team is responsible for designing, developing, and deploying one or more solutions from the backlog. For each solution in the backlog, you should assemble a project team that will be responsible for the solution. In addition to running BI solution planning, the project team should:
  - Define timelines and milestones for solution planning.
  - Identify and involve the right stakeholders for requirements gathering.
  - Set up a centralized location for communication, documentation, and planning.
  - Engage stakeholders to gather requirements.
  - Communicate and coordinate with stakeholders and business users.
  - Orchestrate iterative development and testing cycles with business users.
  - Document the solution.
  - Onboard users to the solution by defining and enacting a training plan.
  - Provide post-deployment solution support.
  - Address reasonable user requests to change or update the solution after deployment.
  - Conduct solution handover after deployment, if necessary.
- **Centralize communication and documentation**: It's important that the project team centralizes communication and documentation for BI solution planning. For example, the project team should centralize requirements, stakeholder communication, timelines, and deliverables. Consider storing all documentation in a [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal).
- **Plan requirements gathering**: The project team should begin by planning the business design sessions to gather business requirements. These sessions take the form of interactive meetings, and they can follow a similar format to the [strategic planning workshops](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#workshops).

> [!TIP]
> Consider identifying and involving the support teams responsible for the solution early in the requirements gathering process. To effectively support the solution, the support teams will need a comprehensive understanding of the solution, its purpose, and the users. That's particularly important when the project team is comprised only of external consultants.

### Gather business requirements

Gathering the right business requirements is critical to designing the right solution. To gather the right requirements and define an effective solution design, the project team can conduct business design sessions together with the business users.

The purpose of the business design sessions is to:

- Confirm the initial solution scope.
- Define and understand the problem the solution should address.
- Identify the right key stakeholders for the solution.
- Gather the right business requirements.
- Prepare a solution design that meets the business requirements.
- Prepare supporting design documentation.

The following diagram depicts how to gather business requirements and define the solution design by using a business design approach.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/business-design.svg" alt-text="Diagram shows a process for business design, which is about gathering business requirements and defining the solution. Each step in the process is described in the table below." border="false":::

The diagram depicts the following steps.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The project team begins the business design by confirming the solution scope that was first documented in [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md). They should clarify the business areas, systems, and data that the solution will encompass. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The project team identifies key stakeholders from the user community who will be involved in the business design sessions. Key stakeholders are users with sufficient knowledge and credibility to represent the subject areas of the solution. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The project team plans business design sessions. Planning involves informing stakeholders, organizing meetings, preparing deliverables, and engaging with business users. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | The project team gathers and researches existing solutions that business users currently use to address existing business data needs. To accelerate this process, the project team can use relevant research from BI strategic planning, which has been documented in the [communication hub](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#create-a-communication-hub). |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The project team runs business design sessions with stakeholders. These sessions are small, interactive meetings, where the project team guides stakeholders to understand business data needs and requirements. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The project team concludes the business design by presenting a draft solution design to stakeholders and other users for feedback and approval. The business design is successful when the stakeholders agree that the design will help them achieve their business objectives. |

The business design concludes with the following deliverables.

- **Draft solution designs**: Mock-ups, prototypes, or wireframe diagrams illustrate the solution design. These documents translate the requirements to a concrete design blueprint.
- **List of business metrics**: Quantitative fields expected in the solution, including business definitions, and expected aggregations. If possible, rank them by importance to the users.
- **List of business attributes**: Relevant attributes and data structures expected in the solution, including business definitions and attribute names. If possible, include hierarchies and rank the attributes by importance to the users.
- **Supplemental documentation**: Descriptions of key functional or compliance requirements. This documentation should be as precise as necessary, yet as concise as possible.

The business design deliverables are used in, and validated by, the technical design.

> [!TIP]
> Solution mock-ups, prototypes, or wireframe diagrams can create a clear understanding of the expected result, both for developers and end users. Creating effective mock-ups doesn't require artistic skill or talent. You can use simple tools like [Microsoft Whiteboard](https://www.microsoft.com/microsoft-365/microsoft-whiteboard/digital-whiteboard-app), PowerPoint, or even just a pen and paper to illustrate the design.

### Gather technical requirements

After completing the business design, the project team validates its outcomes by using a technical design. The technical design is an approach similar to the business design. While the business design focuses on business data needs, the technical design focuses on the technical aspects of a solution. A key outcome of the technical design is the solution plan, which describes the final solution design and informed estimates of the effort to implement it.

> [!NOTE]
> Unlike the business design, the technical design is largely an independent investigation into source data and systems conducted by content creators and owners.

The purpose of a technical design is to:

- Validate the results of the business design.
- Address technical assumptions in the current design.
- Identify the relevant data sources in scope, and define the field calculations and field-source mappings for each data source.
- Translate the business requirements to technical requirements.
- Produce estimations of the effort required for the implementation.

The project team engages technical or functional stakeholders in limited, focused technical design sessions. These sessions are interactive meetings with the functional stakeholders to gather technical requirements. Stakeholders are responsible for specific functional areas required for the solution to work effectively.

Examples of stakeholders in a technical design could be:

- **Security and networking teams**: Responsible for ensuring security and compliance of the data.
- **Functional teams and data stewards**: Responsible for curating the source data.
- **Architects**: Owners of specific platforms, tools, or technology.

The project team engages stakeholders in technical design sessions to address technical aspects of the solution. Technical aspects can include:

- **Data source connections**: Details about how to connect to, and integrate, data sources.
- **Networking and data gateways**: Details about private networks or on-premises data sources.
- **Field source mapping**: Data mappings of business metrics and attributes to data source fields.
- **Calculation logic**: A translation of business definitions to technical calculations.
- **Technical features**: Features or functionality needed to support business requirements.

> [!TIP]
> The project team who conducted the business design should also conduct the technical design. However, for practical reasons, different individuals might lead the technical design. In this case, begin the technical design by reviewing the outcomes of the business design.
>
> Ideally, the individuals who lead the technical design should have a thorough understanding of the outcomes and the business users.

The following diagram depicts how to translate business requirements into technical requirements by using a technical design.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/technical-design.svg" alt-text="Diagram shows a process for technical design, which is about validating and finalizing the outcomes of the business design, and translating business requirements to technical requirements. Each step in the process is described in the table below." border="false":::

The diagram depicts the following steps.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The project team begins the technical design by defining the data source scope based on the results of the business design. The data source scope declares which data are required to build the solution. To identify the right data sources, the project team consults with the business and functional SMEs. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The project team identifies technical or functional stakeholders to involve later in the technical design sessions. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The project team plans limited, focused sessions with functional stakeholders to address technical aspects of the solution. Planning involves informing stakeholders, organizing meetings, and preparing deliverables. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | The project team researches technical requirements. Research includes defining field calculations and data source mappings, and also addressing the business design assumptions with technical analysis and documentation. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | If necessary, the project team involves stakeholders in technical design sessions. Sessions focus on a specific, technical aspect of the solution, like security or data source connections. In these sessions, the project team gathers qualitative feedback from stakeholders and SMEs. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The project team prepares their findings by using a solution plan, which they present to stakeholders and decision makers. The plan is an iteration and extension of the business design outcomes that includes the final design, estimations, and other deliverables. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The technical design should conclude with a final meeting with stakeholders and decision makers to decide whether or not to proceed. This meeting provides a final opportunity to evaluate the solution planning before resources are committed to developing the solution. |

> [!NOTE]
> The technical design might reveal unexpected complexity that could make the solution planning infeasible given the current resource availability or organizational readiness. In this case, the solution should be reevaluated in the subsequent [tactical planning period](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md#step-4-periodically-revise-the-plan). Depending on the urgency of the business data needs, a decision maker, like the executive sponsor, might still want to proceed with a proof of concept, or only one part of the planned solution.

The technical design concludes with a solution plan, which consists of the following deliverables.

- **Tools and technologies**: List of the relevant technical instruments needed to implement the solution. The list typically includes relevant new license options (like Fabric capacity or Premium per user), features, and tools.
- **Defined list of business metrics**: Calculations and field-source mappings of the business metrics for all of the in-scope data sources. To produce this deliverable, the project team uses the list of business metrics created in the business design.
- **Defined list of business attributes**: Field-source mappings of the business attributes for all of the in-scope data sources. To produce this deliverable, the project team uses the list of business attributes created in the business design.
- **Revised designs**: Revisions to the solution design based on changes to, or invalid assumptions about, the business design. Revised designs are updated versions of the mock-ups, prototypes, or wireframe diagrams produced in the business design. If no revisions are necessary, communicate that the technical design validates the business design.
- **Estimate of effort**: Estimate of the resources needed to develop, support, and maintain the solution. The estimate informs the final decision about whether to proceed with implementing the solution, or not.

> [!IMPORTANT]
> Ensure that the project team notifies stakeholders of any changes or unexpected discoveries from the technical design. These technical design sessions should still involve relevant business users. However, ensure that stakeholders aren't unnecessarily exposed to complex technical information.

> [!TIP]
> Because business objectives invariably evolve, it's expected that requirements will change. Don't assume that requirements for BI projects are fixed. If you struggle with changing requirements, it might be an indication that your requirements gathering process isn't effective, or that your development workflows don't sufficiently incorporate regular feedback.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When gathering requirements, key decisions and actions include:

> [!div class="checklist"]
> - **Clarify who owns solution planning**: For each solution, ensure that roles and responsibilities are clear for the project team.
> - **Clarify the solution scope**: The solution scope should already be documented as part of BI tactical planning. You might need to spend additional time and effort to clarify the scope before you start solution planning.
> - **Identify and inform stakeholders**: Identify stakeholders for business designs and technical designs. Inform them in advance about the project and explain the scope, goals, required time investment, and deliverables from the business design.
> - **Plan and conduct business design sessions**: Moderate the business design sessions to elicit information from stakeholders and business users. Request that users demonstrate how they use existing solutions.
> - **Document business metrics and attributes**: By using existing solutions and input from stakeholders, create a list of business metrics and attributes. In the technical designs, map the fields to the data source and describe the calculation logic for quantitative fields.
> - **Draft the solution design**: Create iterative mock-ups based on stakeholder input that visually reflect the expected solution result. Ensure that mock-ups accurately represent and address the business requirements. Communicate to business users that the mock-ups must still be validated (and possibly revised) during the technical design.
> - **Create the solution plan**: Research source data and relevant technical considerations to ensure that the business design is achievable. Where relevant, describe key risks and threats to the design, and any alternative approaches. If necessary, prepare a revision of the solution design and discuss it with the stakeholders.
> - **Create effort estimates**: As part of the final solution plan, estimate the effort to build and support the solution. Justify these estimates with the information gathered during the business design and technical design sessions.
> - **Decide whether to proceed with the plan**: To conclude the requirements gathering process, present the final plan to stakeholders and decision makers. The purpose of this meeting is to determine whether to proceed with solution development.

## Step 2: Plan for deployment

When the project team finishes gathering requirements, creating the solution plan, and receiving approval to proceed, it's ready to plan for solution deployment.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/bi-solution-planning-step-2.svg" alt-text="Diagram shows step 2 in a series of five steps to deliver value iteratively from BI solution planning. Step 2 is about planning for deployment." border="false":::

Deployment planning tasks differ depending on the solution, your development workflow, and your deployment process. A deployment plan typically pertains to many activities involving the planning and setup of tools and processes for the solution.

### Plan to address key areas

The project team should plan for key areas of solution deployment. Typically, planning should address the following areas.

- **Compliance**: Ensure that all the compliance criteria identified in requirements gathering will be addressed by specific actions. Assign each of these actions to specific people, and clearly define the delivery timeframe.
- **Security**: Decide how different layers of solution access will be managed, and any [data security](powerbi-implementation-planning-security-overview.md) rule requirements. Review whether the solution security will be more or less strict than standard content in the tenant.
- **Data gateways**: Evaluate whether the solution needs a data gateway to connect to data sources. Determine whether specific gateway settings or [high availability clusters](/data-integration/gateway/service-gateway-high-availability-clusters) are necessary. Plan who will be able to manage gateway connections via the gateway [security roles](/data-integration/gateway/manage-security-roles), and how to [monitor the gateways](/data-integration/gateway/service-gateway-performance). For more information, see [Provision gateway access](powerbi-implementation-planning-data-gateways.md#provision-gateway-access).
- **Workspaces**: Decide how to [set up and use workspaces](powerbi-implementation-planning-workspaces-workspace-level-planning.md). Determine whether the solution requires lifecycle management tools like [Git integration](/fabric/cicd/git-integration/intro-to-git-integration) and [deployment pipelines](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines), and whether it requires advanced logging with [Azure Log Analytics](../transform-model/log-analytics/desktop-log-analytics-overview.md).
- **Support**: Establish who's responsible for supporting and maintaining the solution after production deployment. If the individuals responsible for support are different than the project team, involve these individuals in development. Ensure that whoever will support the solution understands the solution design, the problem it should address, who should use it, and how.
- **User training**: Anticipate the efforts needed to train the user community so they can effectively use the solution. Consider whether any specific [change management](fabric-adoption-roadmap-change-management.md) actions are necessary.
- **Governance**: Identify any potential governance risks for the solution. Anticipate the effort needed to enable users to effectively use the solution, while mitigating any governance risk (for example, by using [sensitivity labels](powerbi-implementation-planning-info-protection.md#sensitivity-label-structure) and [policies](powerbi-implementation-planning-info-protection.md#published-label-policies)).

### Conduct initial setup

The project team should perform initial set up to commence development. Initial set up activities can include:

- **Initial tools and processes**: Perform first-time setup for any new tools and processes needed for development, testing, and deployment.
- **Identities and credentials**: Create security groups and service principals that will be used to access tools and systems. Effectively and securely store the credentials.
- **Data gateways**: [Deploy data gateways](/data-integration/gateway/service-gateway-install) for on-premises data sources (enterprise mode gateways) or data sources on a private network (virtual network, or VNet, gateways).
- **Workspaces and repositories**: Create and set up workspaces and remote repositories for publishing and storing content.

> [!NOTE]
> Deployment planning differs depending on the solution and your preferred workflow. This article describes only on high-level planning and actionable items.

For more information about deployment planning, see [Plan deployment to migrate to Power BI](powerbi-migration-planning.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning solution deployment, key decisions and actions include:

> [!div class="checklist"]
> - **Plan for key areas**: Plan to address the processes and tools that you need to successfully develop and deploy your solution. Address both technical areas (like data gateways or workspaces) and also adoption (like user training and governance).
> - **Conduct initial setup**: Establish the tools, processes, and features that you need to develop and deploy the solution. Document the setup to help others who will need to do a first-time setup in the future.
> - **Test data source connections**: Validate that the appropriate components and processes are in place to connect to the right data to start the proof of concept.

## Step 3: Conduct a proof of concept

The project team conducts a solution _[proof of concept (POC)](powerbi-migration-proof-of-concept.md)_ to validate outstanding assumptions and to demonstrate early benefits for business users. A POC is an initial design implementation that's limited in scope and maturity. A well-run POC is particularly important for large or complex solutions because it can identify and address complexities (or exceptions) that weren't detected in the technical design.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/bi-solution-planning-step-3.svg" alt-text="Diagram shows step 3 in a series of five steps to deliver value iteratively from BI solution planning. Step 3 is about conducting a proof of concept." border="false":::

We recommend factoring in the following considerations when preparing a POC.

- **Goals and scope**: Describe the purpose of the solution POC and the functional areas it will address. For example, the project team could decide to limit the POC to a single functional area, or a specific set of requirements or features.
- **Source data**: Identify what data will be used in the POC. Depending on the solution, the project team might decide to use different types of data, such as:
  - Production (real) data
  - Sample data
  - Generated synthetic data that resembles actual data volumes and complexity observed in production environments
- **Demonstration**: Describe how and when the project team will demonstrate the POC to stakeholders and users. Demonstrations could be given during regular updates, or when the POC fulfills specific functional criteria.
- **Environment**: Describe where the project team will build the POC. A good approach is to use a distinct _sandbox_ environment for the POC, and deploy it to a development environment when it's ready. A sandbox environment has more flexible policies and fluid content, and it's focused on producing quick results. In contrast, a development environment follows more structured processes that enable collaboration, and it focuses on completing specific tasks.
- **Success criteria**: Define the threshold for when the POC is successful and should move to the next iteration and enter formal development. Before starting the POC, the project team should identify clear criteria for when the POC is successful. By setting these criteria in advance, the project team defines when the POC development ends and when iterative development and validation cycles begin. Depending on the goals of the POC, the project team could set different success criteria, such as:
  - Approval of the POC by stakeholders
  - Validation of features or functionality
  - Favorable review of the POC by peers after a fixed development time
- **Failure**: Ensure that the project team can identify failure of the POC. Identifying failure early on will help to investigate root causes. It can also help to avoid further investment in a solution that won't work as expected when it's deployed to production.

> [!CAUTION]
> When the project team conducts the POC, they should remain alert for assumptions and limitations. For example, the project team can't easily test solution performance and data quality by using a small set of data. Additionally, ensure that the scope and purpose of the POC is clear to the business users. Be sure to communicate that the POC is a first iteration, and stress that it's not a production solution.

> [!NOTE]
> For more information, see [Conduct proof of concept to migrate to Power BI](powerbi-migration-proof-of-concept.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When creating a POC, key decisions and actions include:

> [!div class="checklist"]
> - **Define the goals**: Ensure that the goals of the POC are clear to all people who are involved.
> - **Define the scope of the POC**: Ensure that creating the POC won't take too much development effort, while still delivering value and demonstrating the solution design.
> - **Decide what data will be used**: Identify what source data you'll use to make the POC, justifying your decision and outlining the potential risks and limitations.
> - **Decide when and how to demonstrate the POC**: Plan to show progress by presenting the POC to decision makers and business users.
> - **Clarify when the POC ends**: Ensure that the project team decides on a clear conclusion for the POC, and describe how it'll be promoted to formal development cycles.

## Step 4: Create and validate content

When the POC is successful, the project team shifts from the POC to creating and validating content. The project team can develop the BI solution with iterative development and validation cycles. These cycles consist of iterative releases, where the project team creates content in a development environment and releases it to a test environment. During development, the project team gradually onboards the user community in a pilot process to early (beta) versions of the solution in the test environment.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/bi-solution-planning-step-4.svg" alt-text="Diagram shows step 4 in a series of five steps to deliver value iteratively from BI solution planning. Step 4 is about creating and validating content." border="false":::

> [!TIP]
> Iterative delivery encourages early validation and feedback that can mitigate change requests, promote solution adoption, and realize benefits before the production release.

Iterative development and validation cycles proceed until the project team arrives at a predefined conclusion. Typically, development concludes when there are no more features to implement or user feedback to address. When the development and validation cycles conclude, the project team deploys the content to a production environment with the final production release.

The following diagram depicts how the project team can iteratively deliver BI solutions with development and validation cycles.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/development-and-validation-cycle.svg" alt-text="Diagram shows a process for the development and validation cycle, which is about iteratively building and testing solutions. Each step in the process is described in the table below." border="false":::

The diagram depicts the following steps.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The project team communicates each release to the user community, describing changes and new features. Ideally, communication includes a solution demonstration and Q&A, so users understand what's new in the release, and they can provide verbal feedback. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | During validation, users provide feedback via a central tool or form. The project team should review feedback regularly to address issues, accept or reject requests, and inform upcoming development phases. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The project team monitors usage of the solution to confirm that users are testing it. If there isn't any usage, the project team should engage with the user community to understand the reasons why. Low usage can indicate that the project team needs to take further enablement and change management actions. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | The project team promptly responds to user feedback. If the project team takes too long to address feedback, users might quickly lose motivation to provide it. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The project team incorporates accepted feedback into the solution planning. If necessary, they review the planning priorities to clarify and delegate tasks before the next development phase begins. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The project team continues development of the solution for the next release. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The project team iterates through all steps until they reach a predefined conclusion, and the solution is ready for production deployment. |

The following sections describe key considerations for using iterative development and validation cycles to deliver BI solutions.

### Create content

The project team develops the solution by following their normal development workflow. However, they should consider the following points when creating content.

- During each development cycle, update documentation to describe the solution.
- Conclude each development cycle with an announcement to the user community. Announcements should be posted to the centralized portal, and they should provide brief descriptions of changes and new features in each release.
- With each release, consider organizing sessions to demonstrate changes and new features to the user community, and to answer any verbal questions.
- Define when iterative development and validation cycles will conclude. Ensure that there's a clear process to deploy the solution to the production environment, including a transition to support and adoption activities.

### Validate content

Each iterative development cycle should conclude with [content validation](powerbi-migration-create-validate-content.md#validate-the-solution). For BI solutions, there are typically two kinds of validation.

- **Developer validation**: Solution testing is done by content creators and peers. The purpose of developer validation is to identify and resolve all critical and visible issues before the solution is made available to business users. Issues can pertain to data correctness, functionality, or the user experience. Ideally, content is validated by a content creator who didn't develop it.
- **User validation**: Solution testing is done by the user community. The purpose of user validation is to provide feedback for later iterations, and to identify issues that weren't found by developers. Formal user validation periods are typically referred to as user acceptance testing (UAT).

> [!IMPORTANT]
> Ensure that any data quality issues are addressed during developer validation (before UAT). These issues can quickly erode trust in the solution, and they can harm long-term adoption.

> [!TIP]
> When conducting user validation, consider occasional, short calls with key users. Observe them when they use the solution. Take notes about what they find difficult to use, or what parts of the solution aren't working as expected. This approach can be an effective way to collect feedback.

Factor in the following considerations when the project team validates content.

- **Encourage user feedback**: With each release, request users provide feedback, and demonstrate how they can effectively do so. Consider regularly sharing examples of feedback and requests that have led to recent changes and new features. By sharing examples, you're demonstrating that feedback is acknowledged and valued.
- **Isolate larger requests**: Some feedback items require more effort to address. Ensure that the project team can identify these items and discuss whether they'll be implemented, or not. Consider documenting larger requests to discuss in later [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md#collect-feedback-about-the-business-strategy) sessions.
- **Begin change management activities**: Train users how to use the solution. Be sure to spend extra effort on new processes, new data, and different ways of working. Investing in [change management](fabric-adoption-roadmap-change-management.md) has a positive return on long-term solution adoption.

When the solution reaches a predefined level of completeness and maturity, the project team is ready to deploy it to production. After deployment, the project team transitions from iterative delivery to supporting and monitoring the production solution.

> [!NOTE]
> Development and testing differ depending on the solution and your preferred workflow.

This article describes only high-level planning and actionable items. For more information about iterative development and testing cycles, see [Create content to migrate to Power BI](powerbi-migration-create-validate-content.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When creating and validating content, key decisions and actions include:

> [!div class="checklist"]
> - **Use an iterative process to plan and assign tasks**: Plan and assign tasks for each release of the solution. Ensure that the process to plan and assign tasks is flexible and incorporates user feedback.
> - **Set up content lifecycle management**: Use tools and processes to streamline and automate solution deployment and change management.
> - **Create a tool to centralize feedback**: Automate feedback collection by using a solution that's simple for you and your users. Create a straightforward form to ensure that feedback is concise yet actionable.
> - **Schedule a meeting to review feedback**: Meet to briefly review each new or outstanding feedback item. Decide whether you'll implement the feedback or not, who will be responsible for the implementation, and what actions to take to close the feedback item.
> - **Decide when iterative delivery concludes**: Describe the conditions for when the iterative delivery cycles will conclude, and when you'll release content to the production environment.

## Step 5: Deploy, support, and monitor

When ready, the project team deploys the validated solution to the production environment. The project team should take key adoption and support actions to ensure that the deployment is successful.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-solution-planning/bi-solution-planning-step-5.svg" alt-text="Diagram shows step 5 in a series of five steps to deliver value iteratively from BI solution planning. Step 5 is about deploying, supporting, and monitoring." border="false":::

To ensure a successful deployment, you perform the following support and adoption tasks.

- **Communicate the final release**: The executive sponsor, a manager, or another person with sufficient authority and credibility should announce the release to the user community. Communication should be clear, concise, and include links to the relevant solutions and support channels.
- **Conduct training for content consumers**: Training should be available for content consumers during the first weeks after release to production. Training should focus on clarifying the solution scope, answering user questions, and explaining how to use the solution.
- **Address feedback and requests**: Consider providing users with a channel to submit feedback and requests to the project team. Ensure that reasonable feedback and requests are discussed and, when appropriate, implemented during the post-deployment support period. Acting on feedback and requests after the production release is important. It indicates an agile solution that responds to changing business needs.
- **Plan to connect with the user community**: Even after the post-deployment support period ends, ensure that solution owners regularly meet with the user community. These meetings are valuable sources of feedback for revising your BI strategy. Also, they help support solution adoption by enabling users.
- **Handover actions**: Members of the project team might not be responsible for maintaining the solution. In this case, the team should identify who's responsible and perform a handover. The handover should occur soon after the release to production, and it should address both the solution and the user community.

> [!CAUTION]
> Failing to conduct an effective handover can lead to preventable issues with solution support and adoption during its lifecycle.

After deployment, the project team should plan to proceed to the next solution in the prioritized solution backlog. Ensure that you collect any new feedback and requests and make revisions to [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md#step-4-periodically-revise-the-plan)—including the solution backlog—if necessary.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When considering solution deployment, key decisions and actions include:

> [!div class="checklist"]
> - **Create a communication plan**: Plan how to communicate the release, training, and other solution support or adoption actions. Ensure that any outages or issues are communicated and promptly addressed in the post-deployment support period.
> - **Follow through with a training plan**: Train users to use the solution. Ensure that the training includes both live and recorded training sessions for several weeks after release.
> - **Conduct handover activities**: If necessary, prepare a handover from the development team to the support team.
> - **Conduct solution office hours**: After the post-deployment support period, consider holding regular office hours sessions to answer questions and collect feedback from users.
> - **Set up a continuous improvement process**: Schedule a monthly audit of the solution to review potential changes or improvements over time. Centralize user feedback and review feedback periodically between audits.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
