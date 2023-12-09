---
title: "Power BI implementation planning: BI tactical planning"
description: "This article helps you to identify your business intelligence objectives and form actionable plans to achieve incremental progress toward your strategic BI goals."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 09/09/2023
---

# Power BI implementation planning: BI tactical planning

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to identify your business intelligence (BI) objectives and form actionable plans to achieve incremental progress toward your strategic BI goals. It's primarily targeted at:

- **BI and analytics directors or managers:** Decision makers who are responsible for overseeing the BI program and BI strategic planning.
- **Center of Excellence (COE), IT, and BI teams:** The teams that are responsible for tactical planning, and for measuring and monitoring progress toward the BI objectives.
- **Subject matter experts (SMEs) and content owners and creators:** The teams and individuals that champion analytics in a department and conduct BI solution planning.

A BI strategy is a plan to implement, use, and manage data and analytics. You define your BI strategy by starting with [BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md). In strategic planning, you assemble a working team to research and assess the current state of BI adoption and implementation to identify your BI goals and priorities. To work toward your BI goals, the working team defines specific objectives by doing _tactical planning_. Tactical planning is based on the [assessments](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-assessments) done and the [BI goals and priorities](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#step-4-decide-on-the-bi-goals-and-priorities) decided during BI strategic planning.

In short, this article describes how the working team can perform tactical planning to define objectives and success for the BI strategy. It also describes how the working team should prepare to iteratively reevaluate and assess this planning.

> [!NOTE]
> In this series, we define _goals_ as high-level descriptions of what you want to achieve. In contrast, _objectives_ are specific, actionable targets that help you achieve a goal. While a goal describes the desired future state, objectives describe the path to get there.
>
> Further, we define _solutions_ as processes or tools built to address specific business needs for users. A solution can take many forms, such as a data pipeline, a data lakehouse, a Power BI semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) or report.

The following high-level diagram depicts how to conduct BI tactical planning.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-tactical-planning/bi-tactical-planning-levels.svg" alt-text="Diagram shows an overview of strategic, tactical, and solution planning for business intelligence. Tactical planning is highlighted. The details about tactical planning are described in the table below." border="false":::

You take the following steps to conduct BI tactical planning.

| **Step** | **Description** |
| :-: | --- |
| **1** | Identify and describe specific, actionable objectives for your [BI goals and priorities](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md). |
| **2** | Define what success will look like, and how you'll measure progress toward your desired outcomes. |
| **3** | Prepare to reevaluate and assess planning with continuous improvement cycles. |

## Step 1: Identify and describe objectives

Your first step to conduct tactical planning involves identifying specific objectives for your prioritized BI goals. This process shifts the focus from _strategic_ planning to _tactical_ planning.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-tactical-planning/bi-tactical-planning-step-1.svg" alt-text="Diagram shows step 1 in a series of three steps to conduct technical planning to define objectives and actions for the BI strategy. Step 1 is about identifying and describing objectives." border="false":::

Objectives describe paths to your desired future state. They're specific, actionable, and achievable within a defined period of time. To make progress toward the desired future state, you should identify objectives that address the business data needs, BI goals, and priorities that you identified during BI strategic planning.

> [!TIP]
> Refer to your [assessments](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-assessments) from BI strategic planning when you identify and describe your objectives. Be sure to focus on the key weaknesses to improve, and the opportunities to leverage.

Ensure that your objectives:

- Address one or more of the prioritized goals of your BI strategy.
- Result in measurable and achievable outcomes within the tactical planning period.
- Relate to both your business strategy and BI strategy.
- Follow consistent criteria, like the [SMART system](https://wikipedia.org/wiki/SMART_criteria), and that they're:
  - **Specific:** Target an explicit area of improvement.
  - **Measurable:** Use an indicator to monitor progress.
  - **Assignable:** Specify who's responsible for the objective.
  - **Realistic:** State whether you can achieve the objective, given the current level of organizational readiness and available resources.
  - **Time-related:** Specify when you can achieve the results.

To start, we recommend that you first address time-sensitive, quick-win, and high-impact objectives.

### Identify time-sensitive objectives

Some objectives have a defined window of action, meaning that they must be addressed before a deadline or specific event occurs. Typically, these objectives address problems that don't currently impact the business, but will impact the business at some time in the future (if left unaddressed). Alternatively, these objectives can be linked to technology or business deadlines. You should identify and address these objectives before the time window of action expires.

Here are some examples of time-sensitive objectives.

- Tools, systems, or features that have a known decommission date.
- Business processes or initiatives that have a deadline.
- Known flaws or risks inherent in existing solutions or processes.
- Processes with a high degree of manual data handling and capacity constraints.
- The conclusion of a fiscal or budgeting period.

### Identify quick-win and high-impact objectives

When assessing timelines and priorities, you should identify _quick-wins_. Quick wins are objectives that deliver more benefit than the effort required to implement them. They typically have few dependencies, and they don't involve significant new designs or processes. The key benefit of a quick win is that it can quickly demonstrate a return on the BI strategic initiative for the business. This return creates momentum and can result in fast agreement to support larger initiatives.

> [!IMPORTANT]
> When you identify objectives, also consider how you can objectively evaluate and measure their impact. It's critical that you accurately describe the (potential) return on investment (ROI) for BI initiatives in order to attain sufficient executive support and resources. You can assess this impact together with your measures of success for your BI strategy.

Quick wins can also be high-impact objectives. In this case, they're initiatives or solutions that have the potential to make substantial advancements across many areas of the business. Typically, identifying high-impact objectives is essential to progress further in your BI strategy because they can prompt other, downstream objectives.

Here are some examples of quick-win or high-impact objectives.

- Minor changes that improve existing solutions for a large number of end users.
- Solution audits and optimizations that improve performance and reduce capacity usage and costs.
- Training initiatives for key users.
- Setting up a centralized portal to consolidate a user [community of practice](fabric-adoption-roadmap-community-of-practice.md).
- Creating shared, central themes, templates, and design guidelines for reports.

### Identify other objectives

Once you've identified time-sensitive, high-priority, and quick-win objectives, you should next identify and describe objectives for adoption, governance, and implementation. Identify objectives that you can achieve in the next quarter and that directly address the weaknesses and opportunities that you identified in your [data culture](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-the-data-culture-assessment) and [technical assessments](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-the-technical-assessment). Describe how achieving these objectives will help make progress toward the BI goals in the next 12-18 months.

> [!TIP]
> Refer to the relevant sections of the [Fabric adoption roadmap](fabric-adoption-roadmap.md) and the [Power BI implementation planning](powerbi-implementation-planning-introduction.md) to help you identify and describe your objectives.

> [!IMPORTANT]
> When identifying your objectives, remember that the successful implementation of your BI strategy is more likely when you aim for an evolution instead of a revolution from your current state. _Evolution_ implies that you strive for gradual change over time. Small but consistent, sustained progress is better than an abundance of change that risks disruption to ongoing activities.

#### Adoption

First, identify your adoption objectives. These objectives can address many areas, but typically describe the actions you'll take to improve overall [organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels) and [data culture](fabric-adoption-roadmap-data-culture.md).

Here are some examples of adoption objectives.

- For each enterprise BI solution, document the specific business questions, objectives, and processes that it supports.
- Increase the proportion of business users who respond positively to the question _BI tools and initiatives help me achieve my business objectives_.
- Create a survey to measure business user data literacy and a training plan to improve data literacy.
- Increase the use of endorsed, centralized Power BI semantic models in [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenarios.
- Create a process for self-service content creators so they can request mentoring or support from the COE or the central BI team.

#### Governance

Next, identify your [governance](fabric-adoption-roadmap-governance.md) objectives. These objectives should describe how you'll sustainably enable users to answer business problems with data, while mitigating risks to data security or compliance. These governance objectives should be motivated by, and closely tied to, your adoption objectives.

Here are some examples of governance objectives.

- Identify overall usage events, including abnormal or unexpected events, such as a high amount of data export.
- Reduce the number of data exports from reports.
- Perform a content delivery audit to minimize or eliminate content distribution from workspaces in favor of publishing content in Power BI apps.
- Reduce the number of reports that are shared with the executive leadership.
- Create standard processes so users can request access to new data.
- Define how endorsement should be used to promote and certify content.

> [!IMPORTANT]
> If you don't have an effective process to monitor user activities and content, you should make it one of your highest governance priorities. An understanding of these activities and items informs better governance decisions and actions.

#### Implementation

Finally, identify your implementation objectives. These objectives have two purposes. They:

- **Support adoption and governance objectives:** Describe the solutions you build and initiatives you enact to achieve your adoption and governance objectives. These solutions help you work toward improving [organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels) and [user adoption](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages).
- **Support business data needs:** Describe specific solutions you'll build to address the prioritized needs that the working team described in [BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md). With these solutions, you should aim to achieve or improve [solution adoption](fabric-adoption-roadmap-maturity-levels.md#solution-adoption-phases).

Implementation objectives typically describe either initiatives you'll enact or solutions that you'll build.

- **Initiatives:** Processes, training resources, and policies that support other objectives. Initiatives are typically non-technical instruments that support users or processes. Examples of initiatives include:
  - Processes for self-service content creators so that they can request access to tools, data, or training.
  - Governance [data policies](fabric-adoption-roadmap-governance.md#data-policies) that describe how certain data should be accessed and used.
  - A curated, moderated [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) for the user [community of practice](fabric-adoption-roadmap-community-of-practice.md).
- **Solutions:** Processes or tools built to directly address specific business problems or data needs for users. Examples of solutions include:
  - An actionable [monitoring solution](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) that allows governance teams to follow up on governance and adoption objectives.
  - A unified data lakehouse that delivers business-ready data for consumption by content creators planning other downstream analytical solutions.
  - A Power BI app that addresses specific business data needs for content consumers.

Describing your implementation objectives produces a list of initiatives and solutions. The working team should use this list to produce an ordered backlog prioritized from highest to lowest, so that it's clear what will be implemented first. After tactical planning, you'll work through this backlog to iteratively design and deliver the solutions, which is described in the [BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md) article.

When curating this backlog for your implementation objectives, consider the following points.

- Justify the prioritization of the initiative or solution.
- Approximate the effort involved, if possible.
- Outline the anticipated scope.
- Describe relevant timelines and stakeholders.
- Refer to any existing documentation, research, or related solutions.
- Agree on who will design and implement the solution.

> [!IMPORTANT]
> While your implementation objectives aim to address the business data needs, it's unlikely you'll be able to address all of these needs immediately. Ensure that you plan to mitigate the potential impact of unmet business data needs that you won't address now. Try to assess the impact of these data needs and plan to either partially address them with quick-wins or even stopgap solutions to at least temporarily alleviate the business impact.

### Define organizational readiness

As described in the previous sections, the objectives you identify must be achievable. You should assess your organizational readiness to evaluate how prepared the organization is to achieve the objectives you've identified.

Assess organizational readiness by considering the factors described in the following sections.

#### Identify obstacles

For each of your objectives, identify any obstacles or dependencies that could hinder success or block progress. When you identify obstacles, describe how they could affect your objectives. Define any relevant timelines, what actions could remove these obstacles, and who should perform these actions. You should also assess the risk of possible future obstacles that could prevent you from achieving your objectives.

Here are some examples of obstacles.

- System migrations and other ongoing technical initiatives
- Business processes and planning, like fiscal year budgets
- Business mergers and restructuring
- Availability of stakeholders
- Availability of resources, including the available time of central team members
- Skills of central team members and business users
- Communication and change management activities to adequately inform and prepare business users about the BI strategy

#### Assess the necessary skills and knowledge

Teams and individuals in the organization should have the necessary skills and knowledge to achieve your objectives. That's particularly true for central teams, like the COE or support teams that should lead by example. Confer with these teams about the objectives you've described. Identify early on whether they require training to understand and support your objectives.

To appraise the skills and knowledge of teams for organizational readiness, ask yourself the following questions.

- Do central teams (like the COE) understand the objectives, and how they relate to the high-level strategic goals?
- Are special training programs needed for topics like security, compliance, and privacy?
- What new tools or processes require user training? Who will organize this training?

> [!IMPORTANT]
> Improving the skills and competences of internal teams is particularly important when you migrate to Fabric or Power BI from other technologies. Don't rely exclusively on external consultants for these migrations. Ensure that internal team members have sufficient time and resources to upskill, so they'll work effectively with the new tools and processes.

#### Anticipate change management efforts

[Change management](fabric-adoption-roadmap-change-management.md) is a crucial part of successful adoption and implementation. It's essential that you prepare and support people at all levels of the organization to successfully adopt new behaviors, tools, and processes for working with data. Consider who will be responsible for change management activities and what resources are available to effectively follow through on change management.

After you've favorably assessed organizational readiness, you should proceed with step 2 of tactical planning to define success and how it's measured.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When identifying your BI objectives, key decisions and actions include:

> [!div class="checklist"]
> - **Review BI goals and priorities:** Ensure that your BI goals are current, and that they're understood by everyone who participates in tactical planning.
> - **Review the current state assessments:** The weaknesses and opportunities that the working team identified in the current state assessments directly inform your objectives.
> - **Identify time-sensitive objectives:** Identify any objectives that have a defined time period. Clarify the deadline and its impact on the priority of each objective.
> - **Identify quick-win objectives:** Identify objectives that require low effort or time investment to achieve. Justify why these are quick-win objectives.
> - **Identify high-impact objectives:** Identify objectives that have a significant impact on your BI strategy. Define why these objectives have a high impact.
> - **Identify adoption objectives:** Identify objectives that will help you realize your data culture vision and achieve the BI goals for organizational adoption.
> - **Identify governance objectives:** Identify objectives that will help you balance user enablement and risk mitigation.
> - **Identify implementation objectives:** Identify objectives to either support defined adoption and governance objectives or specific business data needs. Classify implementation objectives as either initiatives or solutions.
> - **Curate the prioritized solution backlog:** Create a prioritized list of BI solutions that you'll implement this quarter. (You will work through this backlog in [BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md).)
> - **Assess organizational readiness:** Evaluate whether the organization is capable of achieving the objectives you identified and described—and if not, whether you need to change objectives or perform specific actions to improve organizational readiness.

## Step 2: Define success and how it's measured

Once you've defined your objectives and you're sure that you can achieve them, you're ready to take the next step. In step 2 of tactical planning, you define success and how it's measured for each of your objectives.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-tactical-planning/bi-tactical-planning-step-2.svg" alt-text="Diagram shows step 2 in a series of three steps to conduct technical planning to define objectives and actions for the BI strategy. Step 2 is about defining success and how it's measured." border="false":::

### Define and measure success

You should define what success will look like for both your BI strategy and the specific objectives you've identified. There are several reasons why you should define and measure success.

- **Demonstrate progress:** A key element of clear success criteria is the ability to acknowledge progress and achievements. Good measures of success demonstrate a clear return on investment (ROI) in BI initiatives. While ROI can be challenging to measure, doing so drives motivation and allows leadership to acknowledge the realized business value of the BI strategy.
- **Continuous improvement:** Clear success criteria help you to evaluate your strategy. This evaluation should motivate your quarterly tactical planning, together with user feedback and changes to the business or technology.
- **Corrective action:** A good definition of success is backed by measurable outcomes. Monitoring these measurable outcomes during operations can inform specific decisions and actions to adjust tactical planning, or intervene if you're heading off track.

There are two ways to track measurable achievement. Some organizations use KPIs (Key Performance Indicators), while others use OKRs (Objective Key Results). Both approaches are equally valid.

- **KPIs:** Evaluate the success of a particular activity against a target.
- **OKRs:** Evaluate key measurable success criteria that track achievement of objectives. While KPIs typically measure performance, OKRs measure outcomes.

KPIs and OKRs provide measurable success criteria that you monitor to take corrective or proactive actions when there's significant deviation from your objectives. What's most important is that you find an approach to measure progress toward your objectives that works for your teams and your organization.

> [!NOTE]
> Your measures of success should be closely aligned with business objectives. Ensure that your success criteria aren't specific to technical tasks or implementations. Instead, they should focus on better enabling business users to work toward organizational goals.

> [!CAUTION]
> Measure a limited number of KPIs or OKRs. These metrics are only useful when you know what they measure and how you should act upon them. It's better to have a few strategic, valuable KPIs or OKRs than many metrics, which you don't regularly monitor or follow up.

#### Identify and describe indicators

You should identify and describe indicators, such as KPIs or OKRs, for your objectives. To this end, you should first have a clear understanding of the hierarchical relationship between your BI goals, objectives, and the KPIs or OKRs you want to measure.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-tactical-planning/relationship-between-bi-goals-objectives-and-kpis-okrs.svg" alt-text="Diagram shows the hierarchical relationship between BI goals, objectives, and KPIs or OKRs as already described in this section." border="false":::

Here are some examples of BI goals together with related objectives and the KPIs to track them.

| **Example BI goal** | **Example BI objectives** | **Example KPIs** |
| --- | --- | --- |
| Improve executive adoption and support of BI. | &bull;&nbsp;Identify and engage an executive sponsor. <br/><br/>&bull;&nbsp;Create a communication plan with the Center of Excellence (COE), which will involve distributing a regular newsletter from the executive sponsor to share updates, announcements, and highlights from BI solutions and initiatives. <br/><br/>&bull;&nbsp;Hold targeted mentoring sessions with the executive sponsor to improve their knowledge and understanding about relevant BI topics, and allowing them to lead by example. | &bull;&nbsp;**Executive feedback score:** Measures executive endorsement and sentiment. Collected from a brief survey of executives, including (but not limited to) the executive sponsor. The survey should ask for quantitative feedback about the effectiveness, usability, and relevance of BI solutions—a high score indicates progress toward the BI goal. |
| Achieve a better balance of user enablement and risk mitigation in BI governance. | &bull;&nbsp;Perform a tenant-wide audit to gain visibility on general usage trends and anomalies. <br/><br/>&bull;&nbsp;Create a tenant-wide monitoring solution to track critical solutions and risk-creating behaviors. <br/><br/>&bull;&nbsp;Create a centralized portal to share templates and training materials, and to provide visibility on governance team activities and policies. | &bull;&nbsp;**Ratio of Power BI semantic models to reports:** Measures whether semantic models are reused for ad hoc analysis and reporting, or whether data is duplicated across models—a ratio close to one indicates that users might be creating a new semantic model for each report, which is a governance risk. <br/><br/>&bull;&nbsp;**Ratio of exports to views:** Measures how often users export data to files instead of using existing reports for their analysis—a ratio close to one indicates that users are regularly exporting data, which is a governance risk. |
| Improve data-driven decision making in the user community | &bull;&nbsp;Create a data literacy training program to improve the data competences of the user community. <br/><br/>&bull;&nbsp;Create organizational design standards, templates, and theme files for Power BI reports—adopt these standards in business-critical reporting solutions. <br/><br/>&bull;&nbsp;Hold weekly office hours events to allow users to ask questions about central reports, or request guidance for their decentralized self-service BI solutions. | &bull;&nbsp;**Number of users trained in the data literacy program:** Measures how many users have completed data literacy training and have achieved a passing score. <br/><br/>&bull;&nbsp;**Time-to-insight:** Uses controlled trials to measure how long it takes a random sample of users to correctly answer typical business questions from available semantic models and reports—a fast (low) time-to-insight indicates effective data-driven decision making. |

> [!IMPORTANT]
> Ensure that your chosen KPIs or OKRs genuinely reflect your desired outcomes. Regularly evaluate these indicators to avoid incentivizing counterproductive behaviors. Consider Goodhart's Law, which states: _When a measure becomes a target, it ceases to be a good measure_.

#### Effectively use indicators

Once you implement relevant indicators to measure progress toward your BI objectives, you should regularly monitor them to track progress and take action where necessary.

Here are some key decisions and considerations to help you successfully use KPIs or OKRs.

- **Report your KPIs or OKRs:** Create reporting solutions for your indicators that let you effectively monitor them. Ensure that these reports are highly visible for the relevant teams and individuals who need this information. In the reports, communicate how the metric is calculated and which strategic objective it supports.
- **Automate data collection:** Ensure that data for KPIs and OKRs aren't collected manually. Find efficient ways to streamline and automate the collection of the data so that it's current, accurate, and reliable.
- **Track change:** Visualize the current indicator value, but also the trend over time. Progress is best demonstrated as a gradual improvement. If the indicator exhibits high volatility or variance, consider using a moving average to better illustrate the trend.
- **Assign an owner:** Ensure that a team or individual is responsible for measuring the indicator and keeping its data current.
- **Define an acceptable range:** Establish targets or an acceptable range of values to assign status (like _on track_ or _off track_) to the indicator. When values fall outside the target or range, it should prompt someone to investigate or take corrective action.
- **Set up data-driven alerts:** Set up automated alerts that notify key teams or individuals, for example, [by using Power Automate](/power-bi/collaborate-share/service-flow-integration). That way, timely action can be taken when the indicator is off track.
- **Define actions and interventions:** Clearly describe how you'll use this information to take action, either to address issues or to justify moving to the next step in your BI strategy.

### Validate tactical planning

When you've clearly defined success for your objectives, you should get approval from executives and the key stakeholders before enacting your tactical planning. Present the objectives to executives and key stakeholders, highlighting the expected benefits and relevant outcomes for the business should tactical planning be successful. Also, explain how the described BI objectives support the business objectives and data needs identified in [BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md). Use any feedback to adjust tactical planning, where necessary.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When considering your desired future state, key decisions and actions include:

> [!div class="checklist"]
> - **Define success for your BI strategy:** Clearly describe the success criteria for each of your objectives.
> - **Identify measures of success:** For each objective, identify how to measure progress. Ensure that these measures can be reliably tracked and that they'll effectively encourage the behaviors that you expect.
> - **Create KPIs or OKRs to measure progress toward critical goals:** Create indicators that objectively report progress toward your strategic BI goals. Ensure that the indicators are well documented and have clear owners.
> - **Create monitoring solutions:** Create solutions that automatically collect data for KPI or OKR reporting. Set up data alerts for when the KPIs or OKRs exceed thresholds or fall outside of an acceptable range. Agree upon the necessary action to take when these metrics get off track, and by whom.
> - **Identify obstacles to success:** Ensure that key risks and obstacles to success are identified and define how you'll address them.
> - **Evaluate organizational readiness:** Assess how prepared the organization is to adopt and implement the BI strategy and enact your tactical plan.
> - **Plan to address gaps in skills, knowledge, and executive support:** Ensure that gaps are addressed in objectives and tactical planning.
> - **Validate tactical planning with executives:** Request that the executive sponsor present an executive summary of the tactical planning to leadership for their input.
> - **Validate tactical planning with key stakeholders:** Obtain feedback from key stakeholders about the final tactical plan and its objectives.

## Step 3: Periodically revise the plan

The business and technology context of your organization regularly changes. As such, you should periodically reevaluate and reassess your BI strategy and tactical planning. The goal is to keep them relevant and useful for your organization. In step 3 of tactical planning, you take practical steps to iteratively reevaluate and reassess planning.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-tactical-planning/bi-tactical-planning-step-3.svg" alt-text="Diagram shows step 3 in a series of three steps to conduct technical planning to define objectives and actions for the BI strategy. Step 3 is about preparing to reevaluate and assess planning." border="false":::

### Prepare iterative planning and anticipate change

To ensure BI and business strategic alignment, you should establish continuous improvement cycles. These cycles should be influenced by the success criteria (your KPIs or OKRs) and the feedback that you regularly collect to evaluate progress.

We recommend that you conduct tactical planning at regular intervals with evaluation and assessment, as depicted in the following diagram.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-bi-tactical-planning/revise-tactical-planning-quarterly.svg" alt-text="Diagram shows how to revise tactical planning quarterly to plan and evaluate BI objectives." border="false":::

The diagram depicts how you can iteratively revise the BI strategy to achieve incremental progress.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | **BI strategic planning:** Define and reassess your BI goals and priorities every 12-18 months. In between BI strategic planning sessions, strive for incremental progress toward your BI goals by achieving your BI objectives defined in tactical planning. Additionally, in between strategic planning, you should collect feedback to inform future strategic decision-making. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | **BI tactical planning:** Identify and reevaluate your BI objectives every 1-3 months. In between, you implement these tactical plans by building BI solutions and launching BI initiatives. Additionally, in between tactical planning, you should collect feedback and monitor your KPIs or OKRs to inform future tactical decision-making. |

Future objectives and priorities defined in your strategic and tactical planning are informed by using regular feedback and evaluation mechanisms, such as those described in the following sections.

#### Collect feedback about the business strategy

Business objectives regularly change, resulting in new business data needs and changing requirements. For this reason, your tactical planning must be flexible and remain well aligned with the business strategy. To enable this alignment, you can:

- **Schedule business alignment meetings:** When conducting tactical planning, schedule strategic meetings with key business and data decision makers to assess what was done in the previous period. You should schedule these meetings to align with other key strategic business meetings. Discussions during these meetings provide an opportunity to revise BI strategic and tactical planning and also to demonstrate and reflect upon progress.
- **Review feedback and requests:** Feedback and requests from the user community is valuable input to reevaluate your BI strategy. Consider setting up a [communication hub](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#create-a-communication-hub), possibly with channels like _office hours_, or feedback forms to collect feedback.
- **Couple tactical planning with project planning:** Tactical planning can be integrated with your project planning processes. For example, you might integrate tactical planning with your _agile planning_ processes. Agile planning is a project management approach that focuses on delivering value through iterative work cycles. Coupling tactical and agile planning helps to create a consistent, iterative structure around the operationalization of your BI strategy.

> [!TIP]
> Creating structured processes to handle changing business objectives can help to avoid reactive or spontaneous planning, especially to meet new, urgent business requests.

#### Anticipate change in technology

Tactical planning should address relevant technological changes. Technological changes can strongly impact on your planning and business processes. Many changes are also opportunities to improve existing or planned implementations. It's important to ensure that your planning is always current to ensure that you can best use the opportunities new technology provide. Not only does it help people remain effective, it helps your organization remain competitive in its market.

Here are some examples of technological changes that can affect your tactical planning.

- New products, features, or settings (including those in preview release)
- Decommissioned tools, systems, or features
- Changes in how the user community use tools or analyze data (such as generative AI)

To mitigate impact and capitalize on opportunities of change, you should regularly examine the technological context of your business. Consider the following points about responding to technological change.

- **Follow updates:** Keep current with new developments and features in [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview). Read the monthly community blog posts and keep pace with announcements at conference events.
- **Document key changes:** Ensure that any impactful changes are included in your tactical planning, and include relevant references. Call attention to any changes that have a direct or urgent impact on business data needs or BI objectives.
- **Decide how to handle features in preview:** Clarify how you'll use new [preview features](/power-bi/consumer/end-user-preview-features#what-are-preview-features) that aren't yet generally available. Identify any preview features or tools that have a strategic impact in your organization or help you achieve strategic objectives. Consider how you'll benefit from these preview features while identifying and mitigating any potential risks or limitations.
- **Decide how to handle new third-party and community tools:** Clarify your policy about third-party and community tools. If these tools are allowed, describe a process to identify new tools that have a strategic impact in your organization or help you achieve strategic objectives. Consider how you'll benefit from these tools while identifying and mitigating any potential risks or limitations.

### Proceed with solution planning

A key outcome of tactical planning is the prioritized backlog of solutions that you'll implement to address business data needs. The next step is to plan and implement these solutions. Implementing these solutions helps you to achieve your BI objectives and make incremental progress toward your BI goals.

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - When planning to revise your strategic and tactical planning, key decisions and actions include:

> [!div class="checklist"]
> - **Schedule periodic planning workshops:** At the end of each planning period, schedule workshops to assess progress and review the milestones attained.
> - **Schedule regular workshops to re-align with business strategy:** Use workshops to align the BI strategy with the business strategy by having a cross-functional discussion between the working team and key stakeholders.
> - **Create mechanisms for assessment and feedback:** Ensure that feedback relevant to the BI strategy is documented. Create forms, or encourage key stakeholders to use the communication hub to provide feedback and submit new requests.
> - **Assign a team to own feedback:** Ensure that there's a team that has clear ownership of user feedback and requests. This team should respond to users to acknowledge their requests or request more detail.
> - **Create a schedule to review requests:** Review feedback regularly, like every week. Identify priority requests before they become urgent and disrupt existing planning. Clearly and transparently communicate any rejected requests to users. Propose alternatives and workarounds so that users can continue their work without disruption.

## Next steps

In the [next article in this series](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md), learn how to conduct BI solution planning.
