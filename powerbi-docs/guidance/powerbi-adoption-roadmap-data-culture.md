---
title: "Power BI adoption roadmap: Data culture"
description: Encourage a data culture to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: Data culture

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

Building a data culture is closely related to adopting Power BI, and it's often a key aspect of an organization's digital transformation. The term _data culture_ can be defined in different ways by different organizations. In this series of articles, data culture means a set of behaviors and norms in the organization. It encourages a culture that regularly employs informed data decision-making:

- By more stakeholders throughout more areas of the organization.
- Based on analytics, not opinion.
- In an effective, efficient way that is based on best practices endorsed by the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md).
- Based on trusted data.
- That reduces reliance on undocumented tribal knowledge.
- That reduces reliance on hunches and gut decisions.

> [!IMPORTANT]
> Think of data culture as what you do, not what you say. Your data culture is not a set of rules (that's governance). So, data culture is a somewhat abstract concept. It's the behaviors and norms that are allowed, rewarded, and encouraged—or those that are disallowed and discouraged. Bear in mind that a healthy data culture motivates employees at all levels of the organization to generate and distribute actionable knowledge.

Within an organization, certain business units or teams are likely to have their own behaviors and norms for getting things done. It means that the specific ways that data culture objectives are achieved can vary across organizational boundaries. What's important is that they should all align with the organizational data culture objectives. This can be thought of as _aligned autonomy_.

The following diagram conveys the inter-related aspects that influence your data culture:

:::image type="content" source="media/powerbi-adoption-roadmap-data-culture/powerbi-adoption-roadmap-data-culture.png" alt-text="Image shows various relationships and influences in a data culture, which are described next.":::

The above circular diagram represents the somewhat ambiguous relationships among the following items:

- **Data culture** as the outer circle: all topics contained within it contribute to the state of the data culture.
- **Organizational adoption** (including the implementation aspects of **mentoring and user enablement, user support, community of practice, governance** and **system oversight**) as the inner circle: all topics are major contributors to the data culture.
- **Executive support** and the **Center of Excellence** are drivers for the success of organizational adoption.
- **Data literacy, data democratization** and **data discovery** are data culture aspects that are heavily influenced by organizational adoption.
- **Content ownership and management** and **content delivery scope** are closely related to data democratization.

All items in the above diagram are discussed throughout the remainder of this series of articles.

## Data culture vision

The concept of data culture is imprecise, so it can make it difficult to define and measure. Even though it's challenging to articulate in a way that is meaningful, actionable, and measurable, it's important that you have a well understood definition of what a healthy data culture means to your organization. This vision of a healthy data culture should:

- Originate from the executive level.
- Align with organizational objectives.
- Directly influence your adoption strategy.
- Serve as the high-level guiding principles for enacting governance policies and guidelines.

Data culture outcomes are not specifically mandated. Rather, the state of the data culture is the result of following the governance rules as they are enforced (or the lack thereof). Leaders at all levels need to actively demonstrate what's important through their actions, including how they praise, recognize, and reward staff members who take initiative. It's what makes the concept of data culture imprecise and somewhat abstract.

> [!TIP]
> If you can take for granted that your efforts to develop a data solution (such as a dataset or a report) will be valued and appreciated, that's an excellent indicator of a healthy data culture. Sometimes, however, it depends on what your immediate manager values most.

The initial motivation for establishing a data culture often comes from a specific strategic business problem or initiative. It may be:

- A reactive change, such as responding to new agile competition.
- A proactive change, such as initiating a new line of business, or expanding into new markets to seize a "green field" opportunity. It can be relatively easy to be data-driven from the beginning when there are fewer constraints and complications, compared with an established solution.
- Driven by external changes, such as pressure to eliminate inefficiencies and redundancies during an economic downturn.

In any of these situations, there is often a specific area where the data culture takes root. The specific area could be a scope of effort that is smaller than the entire organization, even if it is still significant. Once necessary changes are made at this smaller scope, they can be incrementally replicated and adapted for the rest of the organization.

Although technology can help advance the goals of a data culture, implementing specific tools or features isn't the objective. This adoption series of articles covers a lot of topics that contribute to a healthy data culture. The remainder of this article addresses three essential aspects of data culture: [data discovery](#data-discovery), [data democratization](#data-democratization), and [data literacy](#data-literacy).

## Data discovery

A successful data culture depends on users working with the right data in their day-to-day activities. To achieve this goal, users need to find and access data sources, reports, and other artifacts.

Data discovery is the ability to effectively search for, and locate, relevant data sources and artifacts across the organization. Primarily, data discovery is concerned with improving awareness that data exists, particularly when data is siloed in departmental systems. Once aware of its existence, users can formally request access to the data. Today, technology helps a lot with data discovery, advancing well past asking colleagues where to find data artifacts.

> [!TIP]
> It's important to have a clear and simple process so users can request access to data. Knowing that a data artifact exists—but unable to access it within the guidelines and processes established by the domain owner—can be a source of frustration for users. It can force them to make inefficient workarounds.

Data discovery contributes to adoption efforts and the implementation of governance practices by:

- Encouraging the use of trusted high-quality data sources.
- Encouraging users to take advantage of investments in existing data resources.
- Promoting the use and enrichment of existing Power BI artifacts.
- Helping people understand who owns and manages data artifacts.
- Establishing connections between consumers, creators, and owners.

In Power BI, the [datasets hub](../connect-data/service-datasets-hub.md) and [use of endorsements](../collaborate-share/service-endorse-content.md) help promote data discovery of [shared datasets](../connect-data/service-datasets-across-workspaces.md). It also encourages the [reuse and augmentation](../connect-data/desktop-directquery-datasets-azure-analysis-services.md) of datasets by self-service creators. Further, data catalog solutions such as [Azure Purview](/azure/purview/overview), which can scan and catalog an entire Power BI tenant, are extremely valuable for data discovery purposes. They can record metadata tags and descriptions to provide deeper context and meaning.

## Data democratization

Data democratization refers to putting data into the hands of more users who are responsible for solving business problems. It's about enabling them to make decisions with the data.

> [!NOTE]
> The concept of data democratization does not imply a lack of security, nor does it imply a lack of justification based on job role. As part of a healthy data culture, data democratization helps reduce _shadow IT_ by providing data artifacts that are secured, governed, well-managed, and that meet business needs in cost effective and timely ways.

Your organization's position on data democratization will have a wide-reaching impact on adoption and governance-related efforts. Here are some examples of Power BI governance decisions that can impact on data democratization:

- Who is permitted to have Power BI Desktop installed?
- Who is permitted to have Power BI Pro or Power BI Premium Per User licenses?
- What is the desired level of self-service BI user enablement? How does this vary based on business unit or job role?
- What is the desired balance between enterprise BI and self-service BI?
- Are there data sources that are strongly preferred? What is the allowed use of unsanctioned data sources?
- Who can manage content? Is this decision different for data versus reports? Is the decision different for enterprise BI users versus decentralized users who own and manage self-service BI content?
- Who can consume content? Is this decision different for external partners, customers, and suppliers?

> [!WARNING]
> If access to data and/or the ability to perform analytics is limited to a select number of individuals in the organization, it's typically a warning sign since the ability to work with data is a key characteristic of a data culture. It's difficult to scale data-driven decision-making when data democratization isn't a priority.

## Data literacy

Data literacy refers to the ability to interpret, create, and communicate data accurately and effectively.

Training efforts, as described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, often focus on how to use the technology itself. Technology skills are important to produce high-quality solutions, however it's also important to consider how to purposely advance data literacy throughout the organization. Put another way, successful adoption takes a lot more than merely providing Power BI software and licenses to users.

How you go about improving data literacy in your organization depends on many factors, such as current user skillsets, complexity of the data, and the types of analytics that are required. Several things you can focus on that are related to data literacy include:

- Interpreting charts and graphs.
- Assessing the validity of data.
- Performing root cause analysis.
- Discerning correlation and causation.
- Understanding how context and outliers affect results that are presented.
- Using storytelling to help consumers quickly understand and act.

> [!TIP]
> If you're struggling to get data culture or governance efforts approved, focusing on tangible benefits that you can achieve with data discovery ("find the data"), data democratization ("use the data"), or data literacy ("understand the data") can help. It can also be helpful to focus on specific problems that can be solved or mitigated through data culture advancements. Getting the right stakeholders to agree on the problem is usually the first step. Then, it's a matter of getting the stakeholders to agree on the strategic approach to a solution, and from there on to the solution details.

## Considerations and key actions

Here are some considerations and key actions you can take to strengthen your data culture:

- Give serious consideration to the type of data culture you want to cultivate. Ideally, it's from a position of user empowerment than a position of command and control.
- Talk to stakeholders in different business units to understand what analytics practices are currently working well and what is not working well. It will lead to data-driven decision making. Conduct a series of workshops to understand current state and formulate the desired future state.
- Talk to stakeholders in IT, BI, and/or the [COE](powerbi-adoption-roadmap-center-of-excellence.md) to understand what [governance](powerbi-adoption-roadmap-governance.md) constraints need consideration. These talks can present an opportunity to educate teams on topics like security and infrastructure, and what Power BI actually is (and that it's significantly more powerful than a query tool).
- Verify the level of [executive sponsorship](powerbi-adoption-roadmap-executive-sponsorship.md) and support you have in place to advance data culture goals.
- Make purposeful decisions about your BI strategy. It includes deciding what the ideal balance of business-led self-service BI, managed self-service BI, and enterprise BI should be for the key business units in the organization (discussed in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article). Also consider how it relates to the extent of published content for personal BI, team BI, departmental BI, and enterprise BI (discussed in the [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) article). Determine how these decisions affect your action plan.
- Begin creating an action plan for immediate, short-term, and long-term action items. Identify business groups and problems that represent a "quick win" and can make a visible difference.

## Maturity levels

The following maturity levels will help you assess the current state of your data culture:

| **Level** | **State of data culture** |
| --- | --- |
| 100: Initial | There are business intelligence (BI) initiatives taking place—with some successes—in various areas of the organization. These activities are occurring in a somewhat chaotic manner, with few formal processes, and without a strategic plan.</br></br>A significant backlog of requests may exist for the enterprise BI team.</br></br>There is a lack of oversight and visibility into self-service BI operations. The successes or failures of BI solutions is not well-understood. |
| 200: Repeatable | Multiple teams have had measurable successes with self-service BI solutions.</br></br>Investments are made to identify the ideal balance of enterprise BI and self-service BI. |
| 300: Defined | Specific goals are established for advancing the data culture, and these goals are implemented incrementally.</br></br>Effective self-service BI practices are incrementally—and purposely—replicated throughout more areas of the organization. |
| 400: Capable | The data culture goals to employ informed decision-making are aligned with organizational objectives, actively supported by the executive sponsor, and directly impact on the adoption strategies put into place.</br></br>A healthy and productive partnership exists between the COE, business units, and IT.</br></br>It's common that individuals who take initiative in building valuable BI solutions are recognized and rewarded. |
| 500: Efficient | Regular review of key performance indicators validate that data culture results are aligned with intentions.</br></br>It's common that the business value of BI solutions are regularly evaluated and measured, with feedback loops in place to encourage ongoing improvements.</br></br>Continual improvement of organizational adoption, user adoption, and solution adoption are top priorities. Learnings are incrementally adapted throughout the organization on an ongoing basis. |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-executive-sponsorship.md), learn more about the importance of an executive sponsor.
