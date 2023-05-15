---
title: "Power BI adoption roadmap: Data culture"
description: Encourage a data culture to drive strong and successful adoption of Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 10/31/2022
---

# Power BI adoption roadmap: Data culture

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

Building a data culture is closely related to adopting Power BI, and it's often a key aspect of an organization's digital transformation. The term *data culture* can be defined in different ways by different organizations. In this series of articles, data culture means a set of behaviors and norms in an organization. It encourages a culture that regularly employs informed data decision-making:

- By more stakeholders throughout more areas of the organization.
- Based on analytics, not opinion.
- In an effective, efficient way that's based on best practices endorsed by the [Center of Excellence (COE)](powerbi-adoption-roadmap-center-of-excellence.md).
- Based on trusted data.
- That reduces reliance on undocumented tribal knowledge.
- That reduces reliance on hunches and gut decisions.

> [!IMPORTANT]
> Think of data culture as what you do, not what you say. Your data culture is not a set of rules (that's governance). So, data culture is a somewhat abstract concept. It's the behaviors and norms that are allowed, rewarded, and encouraged—or those that are disallowed and discouraged. Bear in mind that a healthy data culture motivates employees at all levels of the organization to generate and distribute actionable knowledge.

Within an organization, certain business units or teams are likely to have their own behaviors and norms for getting things done. The specific ways to achieve data culture objectives can vary across organizational boundaries. What's important is that they should all align with the organizational data culture objectives. You can think of this structure as *aligned autonomy*.

The following circular diagram conveys the interrelated aspects that influence your data culture:

:::image type="content" source="media/powerbi-adoption-roadmap-data-culture/powerbi-adoption-roadmap-data-culture.png" alt-text="Diagram that shows various relationships and influences in a data culture." border="false":::

The diagram represents the somewhat ambiguous relationships among the following items:

- Data culture is the outer circle. All topics within it contribute to the state of the data culture.
- Organizational adoption (including the implementation aspects of mentoring and user enablement, user support, community of practice, governance, and system oversight) is the inner circle. All topics are major contributors to the data culture.
- Executive support and the Center of Excellence are drivers for the success of organizational adoption.
- Data literacy, data democratization, and data discovery are data culture aspects that are heavily influenced by organizational adoption.
- Content ownership, content management, and content delivery scope are closely related to data democratization.

The elements of the diagram are discussed throughout this series of articles.

## Data culture vision

The concept of data culture can be difficult to define and measure. Even though it's challenging to articulate data culture in a way that's meaningful, actionable, and measurable, you need to have a well-understood definition of what a healthy data culture means to your organization. This vision of a healthy data culture should:

- Originate from the executive level.
- Align with organizational objectives.
- Directly influence your adoption strategy.
- Serve as the high-level guiding principles for enacting governance policies and guidelines.

Data culture outcomes aren't specifically mandated. Rather, the state of the data culture is the result of following the governance rules as they're enforced (or the lack of governance rules). Leaders at all levels need to actively demonstrate what's important through their actions, including how they praise, recognize, and reward staff members who take initiative. 

> [!TIP]
> If you can take for granted that your efforts to develop a data solution (such as a dataset or a report) will be valued and appreciated, that's an excellent indicator of a healthy data culture. Sometimes, however, it depends on what your immediate manager values most.

The initial motivation for establishing a data culture often comes from a specific strategic business problem or initiative. It might be:

- A reactive change, such as responding to new agile competition.
- A proactive change, such as starting a new line of business or expanding into new markets to seize a "green field" opportunity. Being data driven from the beginning can be relatively easy when there are fewer constraints and complications, compared with an established organization.
- Driven by external changes, such as pressure to eliminate inefficiencies and redundancies during an economic downturn.

In any of these situations, there's often a specific area where the data culture takes root. The specific area could be a scope of effort that's smaller than the entire organization, even if it's still significant. After necessary changes are made at this smaller scope, they can be incrementally replicated and adapted for the rest of the organization.

Although technology can help advance the goals of a data culture, implementing specific tools or features isn't the objective. This series of articles covers a lot of topics that contribute to adoption of a healthy data culture. The remainder of this article addresses three essential aspects of data culture: [data discovery](#data-discovery), [data democratization](#data-democratization), and [data literacy](#data-literacy).

## Data discovery

A successful data culture depends on users working with the right data in their day-to-day activities. To achieve this goal, users need to find and access data sources, reports, and other items.

Data discovery is the ability to effectively search for, and locate, relevant data sources and reports across the organization. Primarily, data discovery is concerned with improving awareness that data exists, particularly when data is siloed in departmental systems. After a user is aware of the data's existence, that user can go through the standard process to request access to the information. Today, technology helps a lot with data discovery, advancing well past asking colleagues where to find datasets.

> [!TIP]
> It's important to have a clear and simple process so users can request access to data. Knowing that a dataset exists—but being unable to access it within the guidelines and processes that the domain owner has established—can be a source of frustration for users. It can force them to use inefficient workarounds instead of requesting access through the proper channels.

Data discovery contributes to adoption efforts and the implementation of governance practices by:

- Encouraging the use of trusted high-quality data sources.
- Encouraging users to take advantage of investments in existing data resources.
- Promoting the use and enrichment of existing Power BI items.
- Helping people understand who owns and manages datasets.
- Establishing connections between consumers, creators, and owners.

In Power BI, the [data hub](/power-bi/connect-data/service-data-hub) and the [use of endorsements](/power-bi/collaborate-share/service-endorse-content) help promote data discovery of [shared datasets](/power-bi/connect-data/service-datasets-across-workspaces). They also encourage self-service creators to [reuse and augment datasets](/power-bi/connect-data/desktop-directquery-datasets-azure-analysis-services).

Further, data catalog solutions are extremely valuable for data discovery. They can record metadata tags and descriptions to provide deeper context and meaning. For example, [Azure Purview](/azure/purview/overview) can scan and catalog an entire Power BI tenant.

## Data democratization

Data democratization refers to putting data into the hands of more users who are responsible for solving business problems. It's about enabling them to make decisions with the data.

> [!NOTE]
> The concept of data democratization does not imply a lack of security or a lack of justification based on job role. As part of a healthy data culture, data democratization helps reduce *shadow IT* by providing datasets that:
>- Are secured, governed, and well managed.
>- Meet business needs in cost-effective and timely ways.

Your organization's position on data democratization will have a wide-reaching impact on adoption and governance-related efforts. Here are some examples of Power BI governance decisions that can affect data democratization:

- Who is permitted to have Power BI Desktop installed?
- Who is permitted to have Power BI Pro or Power BI Premium Per User (PPU) licenses?
- What is the desired level of self-service business intelligence (BI) user enablement? How does this level vary based on business unit or job role?
- What is the desired balance between enterprise BI and self-service BI?
- Are any data sources strongly preferred? What is the allowed use of unsanctioned data sources?
- Who can manage content? Is this decision different for data versus reports? Is the decision different for enterprise BI users versus decentralized users who own and manage self-service BI content?
- Who can consume content? Is this decision different for external partners, customers, and suppliers?

> [!WARNING]
> If access to data or the ability to perform analytics is limited to a select number of individuals in the organization, that's typically a warning sign because the ability to work with data is a key characteristic of a data culture.

## Data literacy

Data literacy refers to the ability to interpret, create, and communicate data accurately and effectively.

Training efforts, as described in the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article, often focus on how to use the technology itself. Technology skills are important to producing high-quality solutions, but it's also important to consider how to purposely advance data literacy throughout the organization. Put another way, successful adoption takes a lot more than merely providing Power BI software and licenses to users.

How you go about improving data literacy in your organization depends on many factors, such as current user skillsets, complexity of the data, and the types of analytics that are required. You can focus on these activities related to data literacy:

- Interpreting charts and graphs
- Assessing the validity of data
- Performing root cause analysis
- Discerning correlation from causation
- Understanding how context and outliers affect how results are presented
- Using storytelling to help consumers quickly understand and act

> [!TIP]
> If you're struggling to get data culture or governance efforts approved, focusing on tangible benefits that you can achieve with data discovery ("find the data"), data democratization ("use the data"), or data literacy ("understand the data") can help. It can also be helpful to focus on specific problems that you can solve or mitigate through data culture advancements. 
>
> Getting the right stakeholders to agree on the problem is usually the first step. Then, it's a matter of getting the stakeholders to agree on the strategic approach to a solution, along with the solution details.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - Here are some considerations and key actions that you can take to strengthen your data culture.

> [!div class="checklist"]
> - **Align on data culture goals and strategy:**  Give serious consideration to the type of data culture that you want to cultivate. Ideally, it's more from a position of user empowerment than a position of command and control.
> - **Understand your current state:** Talk to stakeholders in different business units to understand which analytics practices are currently working well and which practices aren't working well for data-driven decision-making. Conduct a series of workshops to understand the current state and to formulate the desired future state.
> - **Speak with stakeholders:** Talk to stakeholders in IT, BI, and the [COE](powerbi-adoption-roadmap-center-of-excellence.md) to understand which [governance](powerbi-adoption-roadmap-governance.md) constraints need consideration. These talks can present an opportunity to educate teams on topics like security and infrastructure. You can also use the opportunity to educate them on what Power BI actually is (and how it includes powerful data preparation and modeling capabilities, in addition to being a vizualiation tool).
> - **Verify executive sponsorship:** Verify the level of [executive sponsorship](powerbi-adoption-roadmap-executive-sponsorship.md) and support that you have in place to advance data culture goals.
> - **Make purposeful decisions about your BI strategy:** Decide what the ideal balance of business-led self-service BI, managed self-service BI, and enterprise BI should be for the key business units in the organization (covered in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article). Also consider how the strategy relates to the extent of published content for personal BI, team BI, departmental BI, and enterprise BI (described in the [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) article). Determine how these decisions affect your action plan.
> - **Create an action plan:** Begin creating an action plan for immediate, short-term, and long-term action items. Identify business groups and problems that represent "quick wins" and can make a visible difference.
> - **Create goals and metrics:** Determine how you'll measure effectiveness for your data culture initiatives. Create KPIs (key performance indicators) or OKRs (objectives and key results) to validate the results of your efforts.

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.png" border="false":::

The following maturity levels will help you assess the current state of your data culture.

| **Level** | **State of data culture** |
| --- | --- |
| 100: Initial | The enterprise BI team can't keep up with the needs of the business. A significant backlog of requests exists for the enterprise BI team. </br></br>Self-service BI initiatives are taking place—with some successes—in various areas of the organization. These activities are occurring in a somewhat chaotic manner, with few formal processes and no strategic plan. </br></br>There's a lack of oversight and visibility into self-service BI activities. The successes or failures of BI solutions aren't well understood. |
| 200: Repeatable | Multiple teams have had measurable successes with self-service BI solutions. People in the organization are starting to pay attention. </br></br>Investments are being made to identify the ideal balance of enterprise BI and self-service BI. |
| 300: Defined | Specific goals are established for advancing the data culture. These goals are implemented incrementally. </br></br>Learnings from what works in individual business units is shared. </br></br>Effective self-service BI practices are incrementally—and purposely—replicated throughout more areas of the organization. |
| 400: Capable | The data culture goals to employ informed decision-making are aligned with organizational objectives. They're actively supported by the executive sponsor, the COE, and they have a direct impact on adoption strategies. </br></br>A healthy and productive partnership exists between the executive sponsor, COE, business units, and IT. The teams are working towards shared goals. </br></br>Individuals who take initiative in building valuable BI solutions are recognized and rewarded. |
| 500: Efficient | The business value of BI solutions is regularly evaluated and measured. KPIs or OKRs are used to track data culture goals and the results of BI efforts. </br></br>Feedback loops are in place, and they encourage ongoing data culture improvements. </br></br>Continual improvement of organizational adoption, user adoption, and solution adoption is a top priority. |

## Next steps

In the [next article](powerbi-adoption-roadmap-executive-sponsorship.md) in the Power BI adoption roadmap series, learn more about the importance of an executive sponsor.
