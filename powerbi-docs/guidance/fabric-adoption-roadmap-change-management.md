---
title: "Microsoft Fabric adoption roadmap: Change management"
description: "Learn about effective change management for Microsoft Fabric."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Change management

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

When working toward improved data and business intelligence (BI) adoption, you should plan for effective _change management_. In the context of data and BI, change management includes procedures that address the impact of change for people in an organization. These procedures safeguard against disruption and productivity loss due to changes in solutions or processes.

> [!NOTE]
> Effective change management is particularly important when you [migrate to Power BI](powerbi-migration-overview.md).

Effective change management improves adoption and productivity because it:

- Helps content creators and consumers use analytics more effectively and sooner.
- Limits redundancy in data, analytical tools, and solutions.
- Reduces the likelihood of risk-creating behaviors that affect shared resources (like Fabric capacity) or organizational compliance (like data security and privacy).
- Mitigates resistance to change that obstructs planning and inhibits user adoption.
- Mitigates the impact of change and improving user wellbeing by reducing the potential for disruption, stress, and conflict.

Effective change management is critical for successful adoption at all levels. To successfully manage change, consider the key actions and activities described in the following sections.

> [!IMPORTANT]
> Change management is a fundamental obstacle to success in many organizations. Effective change management requires that you understand that it's about people—not tools or processes.
>
> Successful change management involves empathy and communication. Ensure that change isn't forced or resistance to change is ignored, because it can widen organizational divides and further inhibit effectiveness.

> [!TIP]
> Whenever possible, we recommend that you describe and promote change as _improvement_—it's much less threatening. For many people, _change_ implies a cost in terms of effort, focus, and time. Alternatively, _improvement_ means a benefit because it's about making something better.

## Types of change to manage

When implementing data and BI solutions, you should manage different types of change. Also, depending on the scale and scope of your implementation, you should address different aspects of change.

Consider the following types of change to manage when you plan for Fabric adoption.

### Process-level changes

Process-level changes are changes that affect a broader user community or the entire organization. These changes typically have a larger impact, and so they require more effort to manage. Specifically, this change management effort includes specific plans and activities.

Here are some examples of process-level changes.

- Change from centralized to decentralized approaches to ownership (change in [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md)).
- Change from enterprise to departmental, or from team to personal content delivery (change in [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md)).
- Change of central team structure (for example, forming a [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md)).
- Changes in [governance](fabric-adoption-roadmap-governance.md) policies.
- [Migration](powerbi-migration-overview.md) from other analytics products to Fabric, and the changes this migration involves, like:
  - The [separation of semantic models and reports](report-separate-from-model.md), and a model-based approach to analytics.
  - Transitioning from exports or static reports to interactive analytical reports, which can involve filtering and cross-filtering.
  - Moving from distributing reports as PowerPoint files or flat files to accessing reports directly from the Fabric portal.
  - Shifting from information in tables, paginated reports, and spreadsheets to interactive visualizations and charts.
  - Changing from an on-premises or platform as a service (PaaS) platform to a software as a service (SaaS) tool.

> [!NOTE]
> Typically, giving up export-based processes or Excel reporting is a significant challenge. That's because these methods are usually deeply engrained in the organization and are tied to the autonomy and data skills of your users.

### Solution-level changes

Solution-level changes are changes that affect a single solution or set of solutions. These changes limit their impact to the user community of those solutions and their dependent processes. Although solution-level changes typically have a lower impact, they also tend to occur more frequently.

> [!NOTE]
> In the context of this article, a _solution_ is built to address specific business needs for users. A solution can take many forms, such as a data pipeline, a lakehouse, a semantic model, or a report. The considerations for change management described in this article are relevant for all types of solutions, and not only reporting projects.

Here are some examples of solution-level changes.

- Changes in calculation logic for KPIs or measures.
- Changes in how master data or hierarchies for business attributes are mapped, grouped, or described.
- Changes in data freshness, detail, format, or complexity.
- Introduction of advanced analytics concepts, like predictive analytics or prescriptive analytics, or general statistics (if the user community isn't familiar with these concepts, already).
- Changes in the presentation of data, like:
  - Styling, colors, and other formatting choices for visuals.
  - The type of visualization.
  - How data is grouped or summarized (such as changing from different measures of central tendency, like average, median, or geometric mean).
- Changes in how content consumers interact with data (like connecting to a [shared semantic model](/power-bi/connect-data/desktop-report-lifecycle-datasets) instead of exporting information for [personal usage scenarios](powerbi-implementation-planning-usage-scenario-personal-bi.md)).

How you prepare change management plans and activities will depend on the types of change. To successfully and sustainably manage change, we recommend that you implement incremental changes.

## Address change incrementally

Change management can be a significant undertaking. Taking an incremental approach can help you facilitate change in a way that's sustainable. To adopt an incremental approach, you identify the highest priority changes and break them into manageable parts, implementing each part with iterative phases and action plans.

The following steps outline how you can incrementally address change.

1. **Define what's changing:** Describe the change by outlining the before and after states. Clarify the specific parts of the process or situation that you'll change, remove, or introduce. Justify why this change is necessary, and when it should occur.
1. **Describe the impact of the change:** For each of these changes, estimate the business impact. Identify which processes, teams, or individuals the change affects, and how disruptive it will be for them. Also consider any downstream effects the change has on other dependent solutions or processes. Downstream effects might result in other changes. Additionally, consider how long the situation remained the same before it was changed. Changes to longer-standing processes tend to have a higher impact, as preferences and dependencies arise over time.
1. **Identify priorities:** Focus on the changes with the highest potential impact. For each change, outline a more detailed description of the changes and how it will affect people.
1. **Plan how to incrementally implement the change:** Identify whether any high-impact changes can be broken into stages or parts. For each part, describe how it might be incrementally implemented in phases to limit its impact. Determine whether there are any constraints or dependencies (such as when changes can be made, or by whom).
1. **Create an action plan for each phase:** Plan the actions you will take to implement and support each phase of the change. Also, plan for how you can mitigate disruption in high-impact phases. Be sure to include a rollback plan in your action plan, whenever possible.

> [!TIP]
> Iteratively plan how you'll implement each phase of these incremental changes as part of your quarterly [tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md).

When you plan to mitigate the impact of changes on Power BI adoption, consider the activities described in the following sections.

### Effectively communicate change

Ensure that you clearly and concisely describe planned changes for the user community. Important communication should  originate from the executive sponsor, or another leader with relevant authority. Be sure to communicate the following details.

- **What's changing:** What the situation is now and what it will be after the change.
- **Why it's changing:** The benefit and value of the change for the audience.
- **When it's changing:** An estimation of when the change will take effect.
- **Further context:** Where people can go for more information.
- **Contact information:** Who people should contact provide feedback, ask questions, or raise concerns.

Consider maintaining a history of communications in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal). That way, it's easy to find communications, timings, and details of changes after they've occurred.

> [!IMPORTANT]
> You should communicate change with sufficient advanced notice so that people are prepared. The higher the potential impact of the change, the earlier you should communicate it. If unexpected circumstances prevent advance notice, be sure to explain why in your communication.

### Plan training and support

Changes to tools, processes, and solutions typically require training to use them effectively. Additionally, extra support might be required to address questions or respond to support requests.

Here are some actions you can take to plan for training and support.

- Centralize training and support by using a [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal). The portal can help organize discussions, collect feedback, and distribute training materials or documentation by topic.
- Consider [incentives](fabric-adoption-roadmap-community-of-practice.md#incentives) to encourage self-sustaining support within a community.
- Schedule recurring [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) to answer questions and provide mentorship.
- Create and demonstrate end-to-end scenarios for people to practice a new process.
- For high-impact changes, prepare training and support plans that realistically assess the effort and actions needed to prevent the change from causing disruption.

> [!NOTE]
> These training and support actions will differ depending on the scale and scope of the change. For high-impact, large-scale changes (like transitioning from enterprise to managed self-service approaches to data and BI), you'll likely need to plan iterative, multi-phase plans that span multiple planning periods. In this case, carefully consider the effort and resources needed to deliver success.

### Involve executive leadership

Executive support is critical to effective change management. When an executive supports a change, it demonstrates its strategic importance or benefit to the rest of the organization. This top-down endorsement and reinforcement is particularly important for high-impact, large-scale changes, which have a higher potential for disruption. For these scenarios, ensure that you actively engage and involve your [executive sponsor](fabric-adoption-roadmap-executive-sponsorship.md) to endorse and reinforce the change.

> [!CAUTION]
> Resistance to change from the executive leadership is often a warning sign that stronger [business alignment](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md) is needed between the business and BI strategies. In this scenario, consider specific alignment sessions and change management actions with executive leadership.

### Involve stakeholders

To effectively manage change, you can also take a bottom-up approach by engaging the stakeholders, who are the people the change affects. When you create an action plan to address the changes, identify and engage key stakeholders in focused, limited sessions. In this way you can understand the impact of the change on the people whose work will be affected by the change. Take note of their concerns and their ideas for how you might lessen the impact of this change. Ensure that you identify any potentially unexpected effects of the change on other people and processes.

## Handle resistance to change

It's important to address resistance to change, as it can have substantial negative impacts on adoption and productivity. When you address resistance to change, consider the following actions and activities.

- **Involve your executive sponsor:** The authority, credibility, and influence of the executive sponsor is essential to support change management and resolve disputes.
- **Identify blocking issues:** When change disrupts the way people work, this change can prevent people from effectively completing tasks in their regular activities. For such blocking issues, identify potential workarounds when you take into account the changes.
- **Focus on data and facts instead of opinions:** Resistance to change is sometimes due to opinions and preferences, because people are familiar with the situation prior to the change. Understand why people have these opinions and preferences. Perhaps it's due to convenience, because people don't want to invest time and effort in learning new tools or processes.
- **Focus on business questions and processes instead of requirements:** Changes often introduce new processes to address problems and complete tasks. New processes can lead to a resistance to change because people focus on what they miss instead of fully understanding what's new and why.

Additionally, you can have a significant impact on change resistance by engaging _promoters_ and _detractors_.

### Identify and engage promoters

Promoters are vocal, credible individuals in a user community who advocate in favor of a tool, solution, or initiative. Promoters can have a positive impact on adoption because they can influence peers to understand and accept change.

To effectively manage change, you should identify and engage promoters early in the process. You should involve them and inform them about the change to better utilize and amplify their advocacy.

> [!TIP]
> The promoters you identify might also be great candidates for your [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network).

### Identify and engage detractors

Detractors are the opposite of promoters. They are vocal, credible individuals in a user community who advocate against a tool, solution, or initiative. Detractors can have a significant negative influence on adoption because they can convince peers that the change isn't beneficial. Additionally, detractors can advocate for alternative or solutions marked for retirement, making it more difficult to decommission old tools, solutions, or processes.

To effectively manage change, you should identify and engage detractors early in the process. That way, you can mitigate the potential negative impact they have. Furthermore, if you address their concerns, you might convert these detractors into promoters, helping your adoption efforts.

> [!TIP]
> A common source of detractors is content owners for solutions that are going to be modified or replaced. The change can sometimes threaten these content owners, who are incentivized to resist the change in the hope that their solution will remain in use. In this case, identify these content owners early and involve them in the change. Giving these individuals a sense of ownership of the implementation will help them embrace, and even advocate in favor, of the change.

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess change management.

- Is there a role or team responsible for change management in the organization? If so, how are they involved in data and BI initiatives?
- Is change seen as an obstacle to achieving strategic success among people in the organization? Is the importance of change management acknowledged in the organization?
- Are there any significant promoters for data and BI solutions and processes in the user community? Conversely, are there any significant detractors?
- What communication and training efforts are performed to launch new data tools and solutions? How long do they last?
- How is change in the user community handled (for example, with new hires or promoted individuals)? What onboarding activities introduce these new individuals to existing solutions, processes, and policies?
- Do people who create Excel reports feel threatened or frustrated by initiatives to automate reporting with BI tools?
- To what extent do people associate their identities with the tools they use and the solutions they have created and own?
- How are changes to existing solutions planned and managed? Are changes planned, with a visible roadmap, or are they reactive? Do people get sufficient notification about upcoming changes?
- How frequently do changes disrupt existing processes and tools?
- How long does it take to decommission legacy systems or solutions when new ones become available? How long does it take to implement changes to existing solutions?
- To what extent do people agree with the statement _I am overwhelmed with the amount of information I am required to process_? To what extent do people agree with the sentiment _things are changing too much, too quickly_?

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

An assessment of change management evaluates how effectively the organization can enact and respond to change.

The following maturity levels will help you assess your current state of change management, as it relates to data and BI initiatives.

| **Level** | **State of change management** |
| --- | --- |
| **100: Initial** | &bull;&nbsp;Change is usually reactive, and it's also poorly communicated. <br/><br/>&bull;&nbsp;The purpose or benefits of change aren't well understood, and resistance to change causes conflict and disruption. <br/><br/>&bull;&nbsp;No clear teams or roles are responsible for managing change for data initiatives. |
| **200: Repeatable** | &bull;&nbsp;Executive leadership and decision makers recognize the need for change management in data and BI projects and initiatives. <br/><br/>&bull;&nbsp;Some efforts are taken to plan or communicate change, but they're inconsistent and often reactive. Resistance to change is still common. Change often disrupts existing processes and tools. |
| **300: Defined** | &bull;&nbsp;Formal change management plans or roles are in place. These plans include communication tactics and training, but they're not consistently or reliably followed. Change occasionally disrupts existing processes and tools. <br/><br/>&bull;&nbsp;Successful change management is championed by key individuals that bridge organizational boundaries. |
| **400: Capable** | &bull;&nbsp;Empathy and effective communication are integral to change management strategies. <br/><br/>&bull;&nbsp;Change management efforts are owned by particular roles or teams, and effective communication results in a clear understanding of the purpose and benefits of change. Change rarely interrupts existing processes and tools. |
| **500: Efficient** | &bull;&nbsp;Change is an integral part of the organization. People in the organization understand the inevitability of change, and see it as a source for momentum instead of disruption. Change almost never unnecessarily interrupts existing processes or tools. <br/><br/>&bull;&nbsp;Systematic processes address change as a challenge of people and not processes. |

## Related content

In the [next article](fabric-adoption-roadmap-conclusion.md) in the Microsoft Fabric adoption roadmap series, in conclusion, learn about adoption-related resources that you might find valuable.
