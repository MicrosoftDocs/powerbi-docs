---
title: "Power BI implementation planning: BI strategic planning"
description: "This article helps you to define your business intelligence focus areas and objectives through strategic planning."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 01/24/2024
---

# Power BI implementation planning: BI strategic planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to define your business intelligence (BI) focus areas and objectives through strategic planning. It's primarily targeted at:

- **BI and analytics directors or managers:** Decision makers who are responsible for overseeing the BI program and BI strategic planning.
- **Center of Excellence (COE), IT, and BI teams:** The teams that are responsible for tactical planning, and for measuring and monitoring progress toward the BI goals.
- **Subject matter experts (SMEs) and content owners and creators:** The teams and individuals that champion analytics in a team or department and conduct BI solution planning. These teams and individuals are responsible for representing the strategy and data needs of their business area when you define the BI strategy.

A BI strategy is a plan to implement, use, and manage data and analytics. As described in the [BI strategy overview](powerbi-implementation-planning-bi-strategy-overview.md) article, your BI strategy is a subset of your data strategy. It supports your business strategy by enabling business users to make decisions and take actions by using data and BI solutions more effectively.

In short, this article describes how you can perform strategic planning to define the focus areas and objectives of your BI strategy.

[!INCLUDE [powerbi-implementation-planning-bi-strategy-context](includes/powerbi-implementation-planning-bi-strategy-context.md)]

The following high-level diagram depicts how to conduct BI strategic planning.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/bi-strategic-planning-levels.svg" alt-text="Diagram shows an overview of strategic, tactical, and solution planning for business intelligence. Strategic planning is highlighted. The details about strategic planning are described in the table below." border="false":::

You take the following steps to define your strategic BI focus areas and objectives.

| **Step** | **Description** |
| :-: | --- |
| **1** | Establish a working team to lead the BI strategy initiative. |
| **2** | Establish business alignment by conducting research and workshops to gather information about the business objectives and data needs, and also existing BI solutions and initiatives. |
| **3** | Complete a current state assessment by running a series of strategic planning workshops with key stakeholders. |
| **4** | Use the assessments and stakeholder input to decide on the strategic BI focus areas and objectives. |

This article describes each step of the BI strategic planning process.

## Step 1: Assemble a working team

Your first step when defining your BI strategy is to establish a _working team_. A working team leads the initiative to describe and plan the BI strategy. It's a cross-functional group of experts that's enabled by the support of the executive sponsor. The group should have a deep understanding of technical and business processes across the organization.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/bi-strategic-planning-step-1.svg" alt-text="Diagram shows step 1 in a series of four steps to define BI focus areas and objectives with BI strategic planning. Step 1 is about assembling a working team." border="false":::

Ideally, the working team should represent each department, business unit, and region that's in scope for the initiative.

The following diagram depicts the following roles that appoint the working team members, and the types of members in a working team.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/working-team.svg" alt-text="Diagram shows the roles and relationships involved with establishing a working team. Each role is described in the table below." border="false":::

The diagram depicts the following roles.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md) typically provides top-down objectives and support of the working team, including funding. The executive sponsor might also appoint the working team members together with the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | A COE or central BI team confers with the executive sponsor to identify and appoint working team members. The COE might also provide guidance to the working team to support their activities. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | COE members form part of the working team. They're responsible for using their BI expertise to drive BI information gathering and complete the current state assessments. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Business SMEs form part of the working team. They represent the interests of their department or business unit. SMEs are responsible for driving business strategy information gathering. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Functional team members, like those from a master data team, can form part of the working team. They're responsible for clarifying strategically important processes during information gathering. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Technical team members, like those from a data engineering team, can form part of the working team. They're responsible for clarifying strategically important systems during information gathering. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Security team members form part of the working team. They're responsible for identifying and clarifying compliance, security, and privacy requirements during information gathering. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Other IT team members can form part of the working team. They might identify other technical requirements related to areas such as networking or application management. |

> [!NOTE]
> Not all roles depicted in the diagram have to be present in the working team. Involve roles that are relevant for the scope and scale of your BI strategy initiative.

> [!IMPORTANT]
> Defining the BI strategy is a significant undertaking. It's important that working team members understand what's expected of them, and that they have the resources and time to fulfill their role. An engaged executive sponsor can help by clarifying focus areas and ensuring that all required resources are available.

Working team members are typically appointed and guided by an executive sponsor of BI and analytics, like the [Power BI executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md). Identifying and engaging an executive sponsor is the first step of a BI strategy initiative.

### Identify and engage an executive sponsor

A key role of the [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md) is to help formulate strategic BI focus areas and objectives. The executive sponsor is an individual in a position of senior, strategic leadership who has an invested stake in BI efforts and the BI strategy. They provide top-down guidance and reinforcement by regularly promoting, motivating, and investing in the BI strategy.

In addition to the many [activities listed in the adoption roadmap](fabric-adoption-roadmap-executive-sponsorship.md), an executive sponsor plays a key role in BI strategic planning by:

- **Supporting the working team and COE:** The executive sponsor takes a leading role in defining the BI strategy by providing top-down guidance and reinforcement.
- **Allocating resources:** They confirm funding, staffing, roles, and responsibilities for the working team.
- **Advocating for the initiative:** They advance the strategic initiative by:
  - Legitimizing working team activities, particularly when the working team faces resistance to change.
  - Promoting the BI strategy initiative with announcements or public endorsement.
  - Motivating action and change to progress the BI strategy initiative.
  - Representing the working team and sharing the BI strategic plan among C-level executives to obtain executive feedback.
- **Making strategic decisions:** They make decisions about what should be the focus areas, objectives, and key results.

> [!TIP]
> Before assembling the working team, you should first identify and engage an [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md). Work through [this checklist](fabric-adoption-roadmap-executive-sponsorship.md#considerations-and-key-actions) to ensure that you take the necessary actions to ensure a sufficiently engaged executive sponsor.

### Decide on the scope of the BI initiative

Because the working team contains members from different business areas, the composition of the working team will depend on the scope of your BI initiative. Typically, a BI strategy encompasses many areas of an organization. However, you should refine this scope to define the specific areas it should address. You might limit the scope of your BI strategy initiative for two reasons.

- **Practical reasons:** A successful BI strategy starts small and simple, achieving incremental growth as you experience success. When you first define the BI strategy, focus on key areas so that you achieve quick wins to demonstrate value, while achieving sustainable, incremental progress.
- **Strategic reasons:** You can have distinct initiatives for different business areas. For example, different parts of the organization might require independent BI strategies because their business strategies are sufficiently different. These independent strategies should align with an overall BI strategy, whenever possible.

As part of the scoping exercise, you should also plan how you'll set expectations with stakeholders that the BI strategy will be defined iteratively.

### Understand the working team purpose and responsibilities

Once you've identified and engaged an executive sponsor and clarified the scope of the BI initiative, you then assemble the working team. This team leads the initiative to define and plan the BI strategy.

The responsibilities of the working team include:

- **Planning and preparation:** The working team should plan and prepare the various aspects of the BI strategy initiative, such as:
  - Defining the timelines, deliverables, and milestones for the initiative.
  - Identifying stakeholders who can accurately describe the business objectives and goals of their respective departments.
  - Communication with stakeholders, the executive sponsor, and each other.
- **Information gathering:** The working team should gather sufficient information to accurately assess the current state of the BI implementation. Examples of information gathering activities include:
  - Conducting independent research about the business context and existing BI solutions or initiatives.
  - Running interactive workshops with stakeholders to elicit input about business objectives and data needs.
  - Documenting summarized findings and sharing conclusions.
- **Feedback and follow-up:** The working team summarizes the findings from the information gathered and proposes BI objectives, focus areas, and next steps. It gathers feedback and follows up by:
  - Assessing the current state of BI adoption and implementation.
  - Creating a prioritized list of business data needs.
  - Presenting their conclusions and proposed next steps to stakeholders and executive leadership.

> [!NOTE]
> Because the working team communicates with stakeholders and business users, they're often considered ambassadors for Fabric, Power BI, and other BI initiatives in your organization. Ensure that your working team members understand and accept this responsibility.

### Assemble and prepare the working team

Working team members should include representatives from different departments and business units. The following sections describe where you might source working team members.

> [!IMPORTANT]
> The working team should be comprised of people with credibility in the organization. These people should have knowledge of technical processes and business processes. A working team that consists only of consultants could indicate that the BI initiative isn't sufficiently understood or prioritized by the organization.

#### Center of Excellence members

You can source working team members from the [Power BI Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md), or a similar group of multidisciplinary BI experts. The main responsibility of COE members in the working team is to take advantage of their COE expertise to contribute to information gathering. Further, COE members can share workshop findings back to the COE to inform tactical planning decisions and actions.

Some organizations don't have a COE, possibly because the role of a COE is performed by their BI team or IT. In this case, consider adding members from the BI team or IT to the working team.

> [!NOTE]
> Ensure that the working team doesn't consist only of members from your COE, central IT, or BI teams. A BI strategy encompasses many areas of the organization, and each of these areas should be well represented.

> [!TIP]
> If you don't have a COE, consider establishing one while assembling the working team. Establishing a COE with the working team members could be a natural evolution of the working team's activities, once the BI strategic vision is defined. This approach is a good way to capture the knowledge and understanding that the working team gained during the BI strategy initiative.

#### Business subject matter experts (SMEs)

Working team members should include business SMEs. The main responsibility of business SMEs is to represent their business unit. You should include business SMEs in the working team to avoid assumptions that results in a BI vision that doesn't work for part of the organization.

Business SMEs in the working team must have a deep understanding of data needs and business processes within their business unit or department. Ideally, they should also understand the BI tools and technologies used to address these needs.

> [!NOTE]
> It might not be practical to include every department, business unit, or region in the working team. In this case, ensure that you dedicate effort to identifying assumptions and exceptions for any unrepresented departments, business units, or regions.

#### Champions network

Working team members can include users from your existing [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network) in the [community of practice](fabric-adoption-roadmap-community-of-practice.md). A champion typically has exceptional knowledge of both BI tools and the data needs of their business area. They're often leaders in the community of practice. The main responsibility of champions in the working team is to promote information gathering, and to involve their community of practice in the initiative.

> [!NOTE]
> Including champions can help to avoid making assumptions that can result in an inaccurate assessment of the current state of [Fabric adoption](fabric-adoption-roadmap.md) and [implementation](powerbi-implementation-planning-introduction.md).

#### Functional, IT, and security team members

A working team can include members from specific functional areas, especially when other expertise is required. The main responsibility of these members is to bring their expertise about specific important topics to the BI strategy.

Here are some examples of when you might include members from functional areas in the working team.

- **Functional teams:** Include relevant representatives from functional teams in the working team. For example, if your organization uses one or more large enterprise resource planning systems (ERPs), then you should include an expert of these ERPs in the working team. This individual would be responsible for clarifying how the systems are used in the context of feedback provided during information gathering.
- **IT teams:** Include relevant IT experts in the working team. For example, your organization could have specific networking requirements, or a complex scenario involving multiple [tenants](powerbi-implementation-planning-tenant-setup.md). The IT experts would be responsible for describing specific requirements, which is particularly important in [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md). They can also help identify risks or pain points during information gathering.
- **Security teams:** Include members from security teams in the working team. For example, your organization could have specific compliance, security, or privacy requirements. These individuals would be responsible for describing security-related requirements when defining the future state. They can also help identify compliance risks and security threats during information gathering.

### Create a communication hub

Efficient and structured communication between working team members and stakeholders is critical for your initiative to succeed. One way to improve communication is by centralizing it in a _communication hub_. A communication hub is a place that you use to consolidate communication, documentation, and planning about the BI strategy. It also helps promote collaboration between the working team and stakeholders.

The following diagram depicts how to use a communication hub to centralize BI strategic planning and input.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/communication-hub.svg" alt-text="Diagram shows how to create a communication hub to centralize strategic planning. The concepts and processes are described in the table below." border="false":::

The diagram conveys the following concepts or processes.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | A communication hub is a central location in Microsoft Teams or a similar platform. Its purpose is to centralize communication, documentation, and planning. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The working team creates and manages different channels for each business area. The separation by business area should correspond to the top-level structure of the initiative. Each channel contains a repository of summarized findings, timelines, and discussions about the BI strategy. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Designated working team members curate and moderate the communication hub. Moderation ensures that the communication hub remains useful and current. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Key stakeholders and working team members actively participate in the communication hub. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The executive sponsor limits participation. For example, they might resolve disputes as they arise. |

> [!TIP]
> We recommend that you use the communication hub beyond the strategic planning workshops. Because the communication hub is a source of regular input and discussion from key business stakeholders, it can help your team keep the BI strategy relevant and up to date.

#### Communicate consistently and effectively

The working team should maintain and follow a concise, organized, and transparent process to define the BI strategy by using the communication hub.

Here are some recommendations to get the most value from the communication hub.

- **Have well-defined working team responsibilities:** Ensure that the working team has well-defined responsibilities for the communication hub, such as curating and moderating it. Having active and involved moderation ensures that the communication hub remains current, informative, and useful for the working team and key stakeholders.
- **Organize discussions and files:** Ensure that it's easy to find files or previous discussions in the communication hub by creating and maintaining a logical structure. An organized communication hub encourages its effective use.
- **Be concise in documents and posts:** Avoid overwhelming people with large volumes of information. Key stakeholders have limited time, so encourage people to publish posts and documents to the communication hub that are concise and easy to understand.
- **Be consistent in communication:** Ensure that the communication hub is used instead of alternative channels, like email. You should also strive to ensure that documents and updates are consistent in tone, format, and length.
- **Be transparent and foster a collaborative environment:** An effective communication hub has an active, collaborative social environment. It requires transparency from the working team who should be sharing regular updates and findings throughout the initiative.

> [!IMPORTANT]
> Success of strategic planning relies on effective communication. Promoting concise and consistent communication benefits not only strategic planning, but also the broader adoption and implementation of BI initiatives across your organization.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When establishing a working team, key decisions and actions include:

> [!div class="checklist"]
> - **Involve an executive sponsor:** If there isn't an executive sponsor, identify and engage one before assembling the working team.
> - **Decide on the scope of the BI initiative:** Together with the executive sponsor, determine which business areas the BI strategy will cover.
> - **Communicate the initiative:** Have the executive sponsor raise awareness throughout the organization of the initiative to define the BI strategy.
> - **Assemble the working team:** Appoint members who can provide sufficient coverage of the relevant business areas, technical areas, and compliance areas.
> - **Set expectations of the working team members:** Clarify the time and effort requirements, and ensure that team members understand what's expected of them (and that they have the time and resources to fulfil their role).
> - **Clarify working team roles and responsibilities:** Ensure that everyone in the working team knows what they should do to drive successful strategic planning.

## Step 2: Plan workshops and conduct research

After you assemble the working team (step 1), the newly assembled working team can start the following activities to establish business alignment.

- **Conduct independent research:** The working team performs research into the business context and existing BI solutions or initiatives.
- **Plan workshops:** The working team prepares strategic planning workshops to collect input from key stakeholders about their business objectives and data needs.

These activities are prerequisites for the workshops and complete assessments (step 3).

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/bi-strategic-planning-step-2.svg" alt-text="Diagram shows step 2 in a series of four steps to define BI focus areas and objectives with BI strategic planning. Step 2 is about planning workshops and conducting research." border="false":::

### Conduct independent research

The working team conducts research to document the current state of BI adoption and implementation. This research is used to complete assessments, but it also helps the working team to prepare for the workshops.

#### Research the business context

To define an effective BI strategy, the working team must understand the business objectives. By understanding the business objectives, the working team has the right business context to describe why people use data and BI tools, and comprehension of their desired outcomes. You should define data needs and use cases with respect to the business processes they support and the goals they address.

Business SMEs in the working team should use their expertise to lead the effort to describe the business context. However, it's important that all members of the working team participate. It's essential that the working team has a shared understanding of the business strategy. That way, the BI strategy focuses on addressing business needs instead of solving abstract, technical problems.

#### Research existing BI initiatives and solutions

To define an effective BI strategy, the working team must also understand the current state of BI adoption and implementation. The current state describes how people use existing data and BI tools, and what data and tools are strategically important. You should identify the existing BI initiatives and solutions with respect to the business processes they support and goals they address. These solutions help illustrate what business users do today to address their data needs, so that you can assess whether it's effective.

COE members in the working team should use their expertise to lead the effort to describe the current state of BI adoption and implementation. An example of an activity that helps this effort is [tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md). Auditing allows the working team to collect an inventory of current BI initiatives and solutions to prepare for workshops.

> [!IMPORTANT]
> Ensure that the working team has a good understanding of the compliance requirements and information protection needed in your organization. Document these requirements during independent research, and ensure that they're well understood by everyone in the working team.

#### Topics to address with independent research

The following diagram depicts topics typically addressed with independent research.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/independent-research.svg" alt-text="Diagram shows how to conduct independent research to inform assessments. The concepts and processes are described in the table below." border="false":::

The diagram depicts the following concepts and processes.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The working team researches the business context to document and understand the business strategy. This research is led by business SMEs for their respective departments or business units. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The working team researches the business context by first identifying the business objectives. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The working team identifies specific business objectives that departments or business units have to make progress toward with their objectives. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Business processes are initiatives or plans created to work toward business objectives. The working team identifies the processes in place to help achieve the business objectives. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Business data needs are the data, tools, and solutions required to support business processes and strategic goals. The working team identifies the business data needs. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | The working team researches any existing BI initiatives and solutions to understand the current state of BI adoption and implementation. COE members or BI experts lead this research. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The working team investigates strategically important BI solutions to understand how the organization currently addresses business data needs. Specifically, the working team identifies who the business users are, how they use the solutions. The working team also documents key data questions or problems that these solutions address, and also potential flaws, opportunities, and inefficiencies. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | The working team surveys and documents the existing tools and technologies that the organization uses to address business data needs. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | The working team identifies past or parallel initiatives to define the BI strategy. Past initiatives might contain valuable learnings, while parallel initiatives could be combined to avoid duplication of effort. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | The working team identifies strategically important calculations and master data. These calculations and master data are critical to enabling the business to achieve their business objectives. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | The working team assesses the usage and adoption of strategically important BI solutions among the user community. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | The working team identifies any potential governance and compliance risks identified in existing BI solutions. |

> [!IMPORTANT]
> The topics and examples presented in this section are intended to guide you in conducting your own independent research. These topics aren't an exhaustive or required list. Use these topics as inspiration. We recommend that you use the [maturity levels](fabric-adoption-roadmap-maturity-levels.md) documented in the Fabric adoption roadmap to help you evaluate and focus upon areas that are most important for your organization and its business context.

Taken together, research on the business context and existing BI initiatives and solutions describe the current state of BI adoption and implementation. The working team verifies this research in workshops when capturing stakeholder input.

### Plan workshops

While performing independent research, you should plan workshops with stakeholders. The purpose of these workshops is to gather input about the business objectives and data needs. You also validate the conclusions from independent research in these workshops.

> [!NOTE]
> This article uses the term _workshops_ to describe interactive meetings with key stakeholders. The goal of the workshops is to gather input so you can accurately describe and understand the goals and data needs.

The following sections describe key considerations for planning and preparing workshops.

#### Involve the correct key stakeholders

Successful BI strategic planning requires the working team to involve the right stakeholders in the workshops. The working team should identify key stakeholders who have sufficient knowledge and credibility to represent their business area. In each workshop, the role of these stakeholders is to participate in discussions that are led by the working team. Stakeholders need to describe the business objectives and data needs for their areas, and the current state of data and analytics initiatives to support the business objectives.

Identifying the right stakeholders is essential in order to run successful workshops and gain an accurate understanding of the business areas in scope.

> [!WARNING]
> If you engage the wrong stakeholders, there's significant risk that the BI strategy won't align with strategic business objectives or support business users to achieve their goals.

The following diagram depicts the process to identify and inform the right key stakeholders about the BI strategy initiative.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/involve-stakeholders.svg" alt-text="Diagram shows how to identify and involve the right key stakeholders. The steps involved in the process are described in the table below." border="false":::

The diagram depicts the following steps.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | List the functional areas (departments and business units) in scope for the BI strategy initiative. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | For each functional area, identify two to three candidate key stakeholder representatives. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Engage with stakeholders to inform them of the initiative, and validate their selection. At this stage, candidate stakeholders can decline to participate and might suggest alternative people. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Select a final list of key stakeholders. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | The executive sponsor informs key stakeholders and formally requests their participation. All further communication with the key stakeholders is posted to the communication hub. |

When you initially request key stakeholder participation, ensure that you:

- Obtain approval from their manager, as appropriate.
- Explain the scope of the initiative, and its goals, timelines, and deliverables.
- Describe specifically why they've been asked to participate and what the desired outcomes of the initiative are.
- Outline the necessary time commitment and participation that you need from them.
- Communicate clearly and concisely.

> [!IMPORTANT]
> Often, top-down BI initiatives limit stakeholders to executives and decision makers. While these individuals have a significant role to play (to obtain sufficient executive buy-in and strategic alignment), they aren't necessarily the right stakeholders. In this scenario, you risk defining a strategy isolated from the reality experienced by business users. This misalignment can result in strategies and solutions that don't meet the needs of day-to-day users, and consequentially they aren't used.
>
> To mitigate this risk, ensure that you involve stakeholders from various levels of the organization. When selecting key stakeholders, engage with different teams to briefly introduce the initiative and gather input on who the right stakeholders might be. This level of engagement not only raises awareness of the initiative, but it also enables you to involve the right people more easily.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning workshops and conducting research, key decisions and actions include:

> [!div class="checklist"]
> - **Agree on communication values:** Encourage all working team members to engage with concise, clear, and consistent communication throughout the initiative.
> - **Set up the communication hub:** Create a central, structured hub for all communication, documentation, and planning. Document how the hub can be used effectively.
> - **Research the business context:** With assistance from business SMEs, describe the business objectives for each of the business areas that are in scope.
> - **Research existing BI initiatives and solutions:** Conduct tenant-level auditing and targeted investigation of strategically important solutions to describe the current state of BI adoption and implementation.
> - **Select the right key stakeholders:** Engage representatives from each business area who have sufficient knowledge and credibility.
> - **Invite key stakeholders to the communication hub:** When ready, onboard the key stakeholders to the communication hub and send meeting invitations for the workshops.

## Step 3: Run workshops and complete assessments

After you complete independent research and workshop planning (step 2), you run the workshops and complete the assessments. The objective of the workshops is to use stakeholder input to document:

- The business objectives, strategy, and data needs of the in-scope business areas.
- The current state of BI adoption and implementation for the in-scope business areas.

The working team combines the stakeholder input together with independent research. These inputs should provide the working team with a sufficient understanding of the business strategy and the current state of BI adoption and implementation.

With this understanding, the working team evaluates the maturity and effectiveness of the current state of BI adoption and implementation. This evaluation is summarized in a data culture assessment and a technical assessment, which are the key outputs of the workshops. The goal of these assessments is to clearly identify both weaknesses and opportunities in the data culture, and technical areas that should be a focus for the BI strategy.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/bi-strategic-planning-step-3.svg" alt-text="Diagram shows step 3 in a series of four steps to define BI focus areas and objectives with BI strategic planning. Step 3 is about running workshops and completing assessments." border="false":::

> [!IMPORTANT]
> If no working team members have experience running and moderating interactive meetings or workshops, the working team should first undertake training or seek support to help run the workshops.

### Run workshops

The workshops are organized as a series of interactive sessions structured to effectively elicit and collect information from stakeholders. The number of sessions and how they're conducted will depend on the number of stakeholders, their location, time availability, and other factors.

The following sections describe the types of sessions you typically conduct when running workshops.

#### Introduction session

The introduction session is run by the working team, and it should involve all stakeholders and the executive sponsor. It introduces the initiative and clarifies the scope, goals, timeline, and deliverables.

The goal of this session is to set expectations about the purpose of the workshops and what's needed for the BI initiative to succeed.

#### Workshops

Workshops are interactive meetings between a few members of the working team and the key stakeholders. A member of the working team moderates the discussion, posing questions to stakeholders to elicit input. Stakeholders provide input about their business strategy, existing BI initiatives and solutions, and their data needs.

> [!NOTE]
> While a moderator should be proficient in eliciting information, they don't require deep domain knowledge. Ideally, all workshops for a given business area should be led by the same moderator.

The goal of the workshops is to collect sufficient input from stakeholders to accurately describe their business objectives and data needs. A successful workshop concludes with stakeholders feeling that the working team members understand the business objectives and data needs. This stakeholder input is used together with the working team's independent research to complete an assessment of the current state of BI adoption and implementation.

Here are some practical considerations to help you plan and organize effective workshops.

- **Keep workshop attendance focused:** Don't saturate meetings with too many attendees. Involving too many people can result in prolonged discussions, or discussions where only the most assertive personalities provide input.
- **Keep the discussion focused:** Take any debates, excessively specific questions, or remarks offline to discuss later in short one-on-one meetings. Similarly, identify and address any resistance directly, and involve the executive sponsor whenever necessary. Keeping the discussion focused ensures that workshops concentrate on the overall discussion of strategic planning, and they don't get distracted by small details.
- **Be flexible with preparation:** Depending on time and preference, you can use prepared material to conduct more effective discussion. However, understand that discussions could go in unexpected directions. If a session departs from your prepared material but still produces helpful input, don't force the discussion back to a fixed agenda. When stakeholders are focused on a different point, it means that it's important. Be flexible by addressing these points to capture the most valuable input.
- **Document stakeholder input:** During the workshops, you should document stakeholders' inputs about their business objectives and the BI strategy.
- **Document business data needs:** One outcome of workshop information gathering is a high-level list of the unmet business data needs. You should first organize the list from the highest to lowest priority. Determine these focus areas based on stakeholder input, and the impact the list items have on business effectiveness.

> [!NOTE]
> The list of prioritized data needs is a key outcome of strategic planning that later facilitates [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md) and [solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md).

### Complete assessments

The working team should combine independent research and the stakeholder input into summarized findings. These goal findings should convey an accurate description of the current state of BI adoption and implementation (for conciseness, referred to as _the current state_). For each business area in scope, these findings should describe:

- Business objectives.
- Business key results to measure progress towards their objectives.
- Business key initiatives, which are intended to achieve their key results.
- Business data needs to support the key initiatives.
- BI tools and solutions that people use to address their business data needs.
- How people use the tools and solutions, and any challenges that prevent them from using the tools and solutions effectively.

With an understanding of the current state, the working team should then proceed to assess the overall BI maturity and its effectiveness in supporting the business strategy. These assessments address specific data culture and technical areas. They also help you to identify weaknesses and opportunities that you'll focus on in your BI strategy. To address these weaknesses and opportunities, you define high-level, strategic BI objectives.

To help identify focus areas, the working team conducts two types of assessment: a data culture assessment and a technical assessment.

#### Contents of an assessment

Making a concise and accurate assessment of the current state is essential. Assessments should highlight the strengths and challenges of the organization's ability to use data to drive decisions and take actions.

An effective maturity assessment consists of the following content.

- **Maturity level:** Evaluate the overall [maturity level](fabric-adoption-roadmap-maturity-levels.md) on a five-point scale from 100 (initial) to 500 (efficient). The score represents a high-level, subjective assessment by the working team of the effectiveness in different areas.
- **Business cases:** Justify and illustrate the maturity level scores in the assessment. Concrete examples include actions, tools, and processes taken by business users to achieve their business objectives with data. The working team uses business cases together with summarized findings to support their assessment. A business case typically consists of:
  - A clear explanation of the desired outcome, and business data needs the current process aims to address.
  - An as-is description of how the general process is currently done.
  - Challenges, risks, or inefficiencies in the current process.
- **Supplemental information:** Support the conclusions, or documents significant details that are relevant to the BI and business strategy. The working team documents supplemental information to support later decision-making and tactical planning.

#### Complete the data culture assessment

The data culture assessment evaluates the current state of BI adoption. In order to complete this assessment, the working team performs the following tasks.

1. **Review summarized findings:** The working team reviews the inputs collected from conducting independent research and running workshops.
1. **Evaluate the maturity levels:** The working team proceeds through each of the data culture areas described in this section. Using the [Fabric adoption roadmap](fabric-adoption-roadmap.md), they evaluate the effectiveness of each area by assigning a maturity score.
1. **Justify the subjective evaluation with goal evidence:** The working team describes several key business cases and supporting information that justifies their evaluation of the maturity scores for each area.
1. **Identify weaknesses and opportunities:** The working team highlights or documents specific findings that could reflect a particular strength or challenge in the organization's data culture. It can be the lowest-scoring or highest-scoring areas, or any areas that they feel have a high impact on the organization's data culture. These key areas will be used to identify the BI focus areas and objectives.

> [!TIP]
> Use the [Fabric adoption roadmap](fabric-adoption-roadmap.md) to guide you when completing the data culture assessment. Also, consider other factors specific to your organizational culture and the ways your users work. If you're looking for more information, consult other reputable sources like the [Data Management Body of Knowledge (DMBOK)](https://www.dama.org/cpages/body-of-knowledge).

The following diagram depicts how the working team assesses the organizational data culture in BI strategic planning for specific data culture areas.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/data-culture-assessment.svg" alt-text="Diagram shows examples of data culture areas to assess in BI strategic planning. Each data culture area is described in the table below." border="false":::

The diagram depicts the following data culture areas.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | **[Business alignment](fabric-adoption-roadmap-business-alignment.md):** How well the data culture and data strategy enable business users to achieve business objectives. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | **[Executive sponsorship](fabric-adoption-roadmap-executive-sponsorship.md):** How effectively a person of sufficient credibility, authority, and influence supports BI solutions and initiatives to drive successful adoption. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | **[Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md):** How effectively a central BI team enables the user community, and whether this team has filled all the COE roles. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | **[Data literacy](fabric-adoption-roadmap-data-culture.md#data-literacy):** How effectively users are able to read, interpret, and use data to form opinions and make decisions. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | **[Data discovery](fabric-adoption-roadmap-data-culture.md#data-discovery):** How discoverable the right data is, at the right time, for the people who need it. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | **[Data democratization](fabric-adoption-roadmap-data-culture.md#data-democratization):** Whether data is put in the hands of users who are responsible for solving business problems. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | **[Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md):** Whether there's a clear vision for centralized and decentralized ways that content creators manage data (such as data models), and how they're supported by the COE. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | **[Content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md):** Whether there's a clear vision of who uses, or consumes, analytical content (such as reports), and how they're supported by the COE. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | **[Mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md):** Whether end users have the resources and training to effectively use data and improve their data literacy. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | **[Community of practice](fabric-adoption-roadmap-community-of-practice.md):** How effectively people with a common interest can interact with and help each other on a voluntary basis. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | **[User support](fabric-adoption-roadmap-user-support.md):** How effectively users can get help when data, tool, or process issues arise. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | **[Governance](fabric-adoption-roadmap-governance.md):** The effectiveness of processes for monitoring user behavior to empower users, maintain regulatory requirements, and fulfill internal requirements. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | **[System oversight](fabric-adoption-roadmap-system-oversight.md):** The effectiveness of everyday administrative activity concerned with enacting governance guidelines, empowering users, and facilitating adoption. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | **[Change management](fabric-adoption-roadmap-change-management.md):** How effectively change is handled, including procedures that safeguard against disruption and productivity loss due to changes in solutions or processes. |

To evaluate these data culture areas, see the [Fabric adoption roadmap](fabric-adoption-roadmap.md). Specifically, refer to the maturity level sections and _Questions to ask_ sections, which guide you to perform assessments.

#### Complete the technical assessment

The technical assessment evaluates technical areas that strategically enable the success of BI implementation. The purpose of this assessment isn't to audit individual technical solutions or assess the entirety of technical areas related to BI. Instead, the working team describes the maturity level and general effectiveness for strategically critical areas, like those described in this section. To complete this assessment, the working team performs the following tasks.

1. **Identify technical areas:** The working team identifies specific technical areas that are relevant and strategically important to the success of BI to include in their assessment. Some examples of technical areas are described in this section and shown in the following diagram.
1. **Define maturity levels:** The working team defines the maturity levels to score the high-level effectiveness for each technical area in the assessment. These maturity levels should follow a consistent scale, such as those found in the template provided in the [maturity levels of the Fabric adoption roadmap](fabric-adoption-roadmap-maturity-levels.md).
1. **Review summarized findings:** The working team reviews the collected inputs by conducting independent research and running workshops.
1. **Evaluate the maturity levels:** The working team evaluates the effectiveness of each area by assigning a maturity score.
1. **Justify the subjective evaluation with goal evidence:** The working team describes several key business cases and supporting information that justifies their evaluation of the maturity scores for each area.
1. **Identify weaknesses and opportunities:** The working team highlights or documents specific findings that could reflect a particular strength or challenge in the organization's BI implementation. It can be the lowest-scoring technical areas, or any areas that they feel have a high impact on the organization's strategic success with implementing BI tools and processes. These key areas will be used to identify the BI focus areas and objectives.

The following diagram depicts technical areas that you might assess when defining your BI strategy.

> [!NOTE]
> If you're adopting [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview), be aware that many of these areas are represented as separate parts of the Fabric analytics platform.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/technical-assessment.svg" alt-text="Diagram shows examples of technical areas to assess in BI strategic planning. Each technical area is described in the table below." border="false":::

The diagram depicts the following technical areas.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | **[Data integration](/fabric/data-factory/data-factory-overview):** How effectively tools or systems connect to, ingest, and transform data from various sources to create harmonized views for analytical purposes. Evaluating data integration means equally assessing enterprise data pipelines and self-service data integration solutions, like dataflows in Power BI and Fabric. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | **[Data engineering](/fabric/data-engineering/data-engineering-overview):** How effective the current architectures are at supporting analytical use cases and adapting to changes in business data needs. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | **[Data science](/fabric/data-science/data-science-overview):** Whether the organization can use exploratory and sophisticated techniques to discover new insights and benefit from predictive or prescriptive analytics. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | **[Data warehousing](/fabric/data-warehouse/data-warehousing):** The effectiveness of relational databases in modeling business logic to support downstream analytical use cases. Data warehousing is often considered together with data engineering. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | **[Real-time analytics](/fabric/real-time-analytics/overview):** Whether the organization can correctly identify, capture, and use low latency data to provide an up-to-date picture of systems and processes. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | **[Data visualization](/power-bi/fundamentals/power-bi-overview):** Whether visualizations can be used effectively to reduce the time-to-action of reporting experiences for business users. Effective visualizations follow best practices, directing attention to important, actionable elements, enabling users to investigate deeper or take the correct actions. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | **[Actions and automation](/fabric/real-time-intelligence/data-activator/activator-introduction):** How consistently and effectively tasks are automated and data alerts are used to enable manual intervention at critical moments in a system or process. You should also evaluate how actionable BI solutions are, meaning how effectively and directly they enable report users to take the right actions at the right time. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | **[Lifecycle management](/fabric/cicd/cicd-overview):** How effectively content creators can collaborate to manage and track changes in BI solutions for consistent, regular releases or updates. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | **[Data security](powerbi-implementation-planning-security-overview.md):** Whether data assets comply with regulatory and organizational policies to ensure that unauthorized people can't view, access, or share data. Data security is typically evaluated together with information protection and data loss prevention. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | **[Information protection](powerbi-implementation-planning-info-protection.md):** How well the organization mitigates risk by identifying and classifying sensitive information by using tools like sensitivity labels. Information protection is typically evaluated together with data security and data loss prevention. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | **[Data loss prevention (DLP)](powerbi-implementation-planning-data-loss-prevention.md):** Whether the organization can proactively prevent data from leaving the organization. For example, by using DLP policies based on a sensitivity label or sensitive information type. DLP is typically evaluated together with data security and information protection. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | **Master data management** :Whether quantitative fields and business attributes are effectively managed, centrally documented, and uniformly maintained across the organization. |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | **Data quality:** Whether BI solutions and data are trustworthy, complete, and accurate according to the business user community. |
| ![Item 14.](../media/legend-number/legend-number-14-fabric.svg) | **Artificial intelligence (AI)**: Whether the organization makes effective use of generative AI tools and models to enhance productivity in BI processes. Additionally, whether AI is used to deliver valuable insights in analytics workloads. |

> [!NOTE]
> The technical areas depicted in the diagram aren't all necessarily part of BI; instead some are strategic enablers of a successful BI implementation. Further, these areas don't represent an exhaustive list. Be sure to identify and assess the technical areas that are strategically important for your organization.

> [!CAUTION]
> When performing the technical assessment, don't assess details beyond the scope of strategic planning. Ensure that all activities that investigate the BI implementation focus directly on defining and evaluating the current state to define your BI focus areas and objectives.
>
> Getting too detailed in the technical assessment risks diluting key messages about the BI strategy. Always keep in mind the big picture questions like: _Where do we want to go?_ and _How can BI effectively support the business?_

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When running workshops and completing assessments, key decisions and actions include:

> [!div class="checklist"]
> - **Decide and communicate the workshop format:** Outline the number of sessions, their length, participants, and other relevant details for participating stakeholders.
> - **Nominate a moderator from the working team:** Decide who from the working team will moderate the workshops. Their objective is to guide discussions and elicit information.
> - **Collect input:** Organize the workshops so that you collect sufficient input about the business strategy and the current state of BI implementation and adoption.
> - **Summarize findings:** Document the inputs that justify the assessments. Include specific business cases that illustrate strategically important processes and solutions.
> - **Complete the maturity assessments:** Complete the relevant assessments for the current state of BI adoption and implementation.
> - **Document business cases and supporting information:** goally document the evidence used to justify the maturity levels you assign in each assessment.

## Step 4: Decide on the BI focus areas and objectives

After you run the workshops and complete assessments (step 3), the working team, together with the executive sponsor, decide on the BI focus areas and objectives to address in tactical planning.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-strategic-planning/bi-strategic-planning-step-4.svg" alt-text="Diagram shows step 4 in a series of four steps to define BI focus areas and objectives with BI strategic planning. Step 4 is about deciding on the BI focus areas and objectives." border="false":::

> [!NOTE]
> While the working team should be involved in clarifying and documenting focus areas and objectives, it isn't responsible for defining them. The executive sponsor and equivalent decision makers own these decisions. The executive sponsor and other decision makers have the authority to decide and allocate resources to deliver on these focus areas and objectives.

### Decide on strategic focus areas

The assessments should clearly identify weaknesses and opportunities in the data culture or technical areas to focus on for the BI strategy. From the weaknesses and opportunities in the assessments, work with key decision makers, like your executive sponsor, to decide which of the areas are focus areas you'll aim to improve in the short-term. With this focus, you aim for sustainable, incremental progress toward your BI objectives.

### Decide on strategic BI objectives

In the last step of BI strategic planning, for each of the focus areas, the working team defines several objectives to work toward in the next 12-18 months. Typically, these objectives represent the envisioned future state and maturity level growth.

> [!TIP]
> For data culture areas, we recommend that you define your objectives by using the [Fabric adoption roadmap](fabric-adoption-roadmap.md). It can help you to identify the maturity level you should aim to achieve for your desired future state. However, it's not realistic to aim for a level 500 for each category. Instead, aim for an achievable maturity level increase in the next planning period.

For technical areas, we recommend that you define your objectives by using the maturity scales described in the [technical assessment](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-the-technical-assessment) by the working team.

#### Examples of strategic BI objectives

Here are some examples of strategic BI objectives.

- Improve executive support of BI initiatives and solutions.
- Improve the effectiveness of the COE.
- Create a clear content ownership strategy and structure.
- Better understand and monitor user behavior with data to improve governance.
- Move from descriptive analytics solutions to predictive analytics solutions.
- Improve decision-making processes with more effective data visualization.
- Expand the number of effective content creators to improve time-to-delivery and the business value obtained from BI solutions.

Before you conclude strategic planning, the working team should align the decided BI focus areas and objectives with stakeholders and executives.

### Align with stakeholders and executives

It's critical that the final assessments and decisions be shared with stakeholders. In the communication hub, stakeholders can asynchronously follow up on the progress of these deliverables and contribute feedback. However, you should conclude strategic planning by presenting the assessments and focus areas back to stakeholders and executives.

The following sections describe how you align with stakeholders and executives.

#### Conduct an alignment session

The alignment session is the final meeting for each business area. Each alignment session involves key stakeholders and the executive sponsor, who review the assessments made by the working team.

The goal of this session is to achieve consensus about the conclusions and assessments, and the agreed BI focus areas and objectives.

> [!NOTE]
> Ensure that stakeholders understand that the BI strategy isn't final and unchanging. Emphasize that the BI strategy evolves alongside the business and technology. Ideally, the same stakeholders will continue to take part in this iterative exercise.

#### Prepare and present an executive summary

The executive summary is typically delivered by the executive sponsor to other executives responsible for the overall business strategy. The executive sponsor describes the assessment results and outlines the key challenges and opportunities that justify the focus areas identified. Importantly, the executive sponsor describes the next steps to start making actionable progress toward the future state.

The goal of this session is to obtain executive alignment and approval on the outcomes of strategic planning and the next steps.

### Proceed with tactical planning

Once you've identified your BI focus areas and objectives, you have concluded strategic planning. The next step is to identify goals to help you make progress towards your BI objectives, which you do by conducting [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When deciding BI focus areas and objectives, key decisions and actions include:

> [!div class="checklist"]
> - **Curate a list of business data needs and opportunities:** Create a consolidated, prioritized list of the business data needs, pain points, and opportunities. This output is used in tactical planning.
> - **Decide on the strategic BI objectives:** Work with your executive sponsor and other decision makers to identify high-level BI objectives for the next 12-18 months.
> - **Align with stakeholders:** Obtain consensus agreement that the assessments and other deliverables are accurate.
> - **Align with executives:** Obtain approvals on the outcomes of strategic planning and the next steps.

## Related content

In the [next article in this series](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md), learn how to conduct BI tactical planning.
