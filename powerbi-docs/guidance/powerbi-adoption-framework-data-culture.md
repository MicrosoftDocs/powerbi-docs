---
title: "Power BI adoption framework: Data culture"
description: Encourage a data culture to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption framework: Data culture

Building a data culture is closely related to adopting Power BI and is often a key aspect of an organization's digital transformation. The term "data culture" can be defined in different ways by different organizations. In this series of articles, data culture refers to a set of behaviors and norms in the organization which encourages a data-driven culture that regularly employs informed data decision-making:

- By more stakeholders throughout more areas of the organization
- Based on analytics, not opinion
- In an effective, efficient way based on best practices from the [Center of Excellence](powerbi-adoption-framework-center-of-excellence.md)
- Based on trusted data
- Which reduces reliance on undocumented tribal knowledge
- Which reduces reliance on hunches and gut decisions

> [!IMPORTANT]
> Think of data culture as what you do, not what you say. Your data culture is not a set of rules (that's governance). Data culture is a somewhat abstract concept. It's the behaviors and norms that are allowed, rewarded, and encouraged – or those that are disallowed and discouraged. A healthy data culture motivates employees at any level of the organization to generate and distribute actionable knowledge.

Within an organization, certain business units or teams will have their own behaviors and norms for getting things done. This means that the specific ways that data culture objectives are achieved might vary across organizational boundaries, but they should all align with the organizational data culture objectives. This can be thought of as "aligned autonomy."

The following diagram is intended to convey the inter-related aspects which influence your data culture:

:::image type="content" source="media/powerbi-adoption-framework-data-culture/powerbi-adoption-framework-data-culture.png" alt-text="Image shows various relationships and influences in a data culture, which are described next.":::

The above circular diagram represents the somewhat ambiguous relationships among the following:

- **Data culture** as the outer circle: all topics within it contribute to the state of the data culture
- **Organizational adoption** (including the implementation aspects of **mentoring and user enablement, user support, community of practice, governance,** and **system oversight** ) as the inner circle: all are major contributors to the data culture
- **Executive support** and the **Center of Excellence** are drivers for the success of organizational adoption
- **Data literacy, data democratization** , and **data discovery** are data culture aspects that are heavily influenced by organizational adoption
- **Content ownership and management** , as well as **content delivery scope** , are most closely related to data democratization

All the items within the above diagram are discussed throughout the remainder of this series of articles.

## Data culture vision

The concept of data culture is imprecise which can make it difficult to define and measure. Even though it's challenging to articulate in a way that is meaningful, actionable, and measurable, it's important that you have a well-understood definition of what a healthy data culture means to your organization. This vision of a healthy data culture should:

- Originate from the executive level
- Align with organizational objectives
- Directly influence your adoption strategy
- Serve as the high-level guiding principles for enacting governance policies and guidelines

Data culture outcomes are not specifically mandated. Rather, the state of the data culture is the result of following the governance rules as they are enforced (or the lack thereof). Leaders at all levels need to actively demonstrate what's important through their actions, including how they praise, recognize, and reward staff members who take initiative. This is what makes the concept of data culture imprecise and somewhat abstract.

> [!TIP]
> If you can take it for granted that your efforts building a data artifact (such as a dataset or a report) to solve a business problem or improve a business process will be valued and appreciated, that's an excellent indicator of a healthy data culture. Sometimes, however, this depends on what your immediate manager values most.

The initial motivation for establishing a data culture often comes from a specific strategic business problem or initiative. This may be:

- A reactive change, such as responding to new agile competition.
- A proactive change, such as initiating a new line of business, or expanding into new markets, and seizing the "green field" opportunity to be more data-driven from the beginning when there are fewer constraints and complications compared to more established contexts.
- Driven by external changes, such as pressure to eliminate inefficiencies and redundancies during an economic downturn.

In any of these situations, there is often a specific area - a scope of effort that is smaller than the entire organization, even if it is still significant - where the data culture takes root, driven by key business priorities that make the status quo untenable. Once the necessary changes are made at this smaller scope, they can be incrementally replicated and adapted for the rest of the organization.

Although technology can help advance the goals of a data culture, implementing specific tools or features isn't the objective. This adoption series of articles covers a lot of things which contribute to a healthy data culture. The remainder of this article will address three essential aspects of data culture: data literacy, data democratization, and data discovery.

## Data discovery

A successful data culture depends on more people working with the right data as part of their day-to-day activities. To achieve this goal, users need to be able to find and access the data sources, reports, and other artifacts they need.

Data discovery is the ability to effectively search for and locate relevant data sources and artifacts across the organization. Primarily, data discovery is concerned with improving awareness that data exists, particularly in situations when data is distributed across siloed departmental systems. Once aware of its existence, a user can go through the standard process to request access to the information. Technology can help a lot with data discovery and advancing past the stage of asking a colleague where to find data artifacts.

> [!TIP]
> It's important to have a clear, simple to understand, process to request access. Discovering that a data artifact exists, but not being able to access it within the guidelines and processes established by the domain owner, can be so frustrating that it encourages people to use inefficient workarounds rather than pursue requesting access through the proper channels.

Data discovery contributes to adoption efforts and the implementation of governance practices by:

- Encouraging the use of trusted high-quality data sources
- Encouraging users to take advantage of investments in existing data resources
- Promoting the use and enrichment of existing Power BI artifacts
- Helping people understand who owns and manages data artifacts
- Establishing connections between consumers, creators, and owners

In Power BI, the [datasets hub](../connect-data/service-datasets-hub.md) and [use of endorsements](../collaborate-share/service-endorse-content.md) promote data discovery of existing [shared datasets](../connect-data/service-datasets-across-workspaces.md) (which can be [reused and augmented](../connect-data/desktop-directquery-datasets-azure-analysis-services.md) by self-service creators). Data catalog solutions, such as [Azure Purview](https://docs.microsoft.com/azure/purview/overview) (which can scan an entire Power BI tenant), are also extremely valuable for data discovery purposes and can help with additional metadata descriptions for cataloging context and meaning.

## Data democratization

Data democratization refers to putting data into the hands of more people who are responsible for solving business problems and enabling them to make decisions with the data.

> [!NOTE]
> The concept of data democratization does not imply a lack of security, nor does it imply a lack of justification based on job role. As part of a healthy data culture, data democratization also helps reduce shadow IT by providing data artifacts which are secured, governed, and well-managed and which meet business needs in cost effective and timely ways.

Your organization's position on data democratization will have a wide-reaching impact on adoption and governance-related efforts. Examples of a few Power BI governance decisions that will impact data democratization:

- Who is permitted to have Power BI Desktop installed? Who is permitted to have Pro or Premium Per User licenses?
- What is the desired level of self-service BI user enablement? How does this vary based on business unit or job role?
- What is the desired balance between enterprise BI and self-service BI?
- Are there data sources which are strongly preferred? What is the allowed use of unsanctioned data sources?
- Who can manage content? Is this decision different for data versus reports? Is the decision different for enterprise BI staff versus decentralized staff who own and manage self-service BI content?
- Who may consume content? Is this decision different for external partners, customers, and suppliers?

> [!WARNING]
> If access to data and/or the ability to perform analytics is limited to a small number of select individuals in the organization, that is typically a warning sign since the ability to work with data is a key characteristic of a data culture. It's difficult to scale data-driven decision-making when data democratization isn't a priority.

## Data literacy

Data literacy refers to the ability to interpret, create, and communicate with data accurately and effectively.

Training efforts (discussed in the [mentoring and user enablement article](powerbi-adoption-framework-mentoring-and-user-enablement.md) often focus on how to use the technology itself. Technology skills are important to produce high-quality solutions, but it's also important to consider how to purposely advance data literacy throughout the organization. Put another way, successful adoption takes a lot more than merely providing Power BI software and licenses to users.

How you go about improving data literacy in your organization depends on many things such as current staff skillsets, complexity level of the data, and the types of analytics that are being performed. A few things you might choose to focus on related to data literacy include:

- Interpreting charts and graphs
- Assessing the validity of data
- Performing root cause analysis
- Discerning correlation and causation
- Understanding how context and outliers affect results that are presented
- Using storytelling to help consumers quickly understand and act

> [!TIP]
> If you are struggling to get data culture or governance efforts approved, focusing on tangible benefits that you can achieve with data discovery ("find the data"), data democratization ("use the data"), or data literacy ("understand the data") can help. It's also effective to focus on specific problems that can be solved or mitigated through data culture advancements. Getting the right stakeholders to agree on the problem is usually the first step in getting them to agree on the strategic approach to a solution, and from there on to the solution details.

## Considerations and key actions

Considerations and key actions you can take to strengthen your data culture:

- Give serious consideration as to the type of data culture you wish to cultivate. Ideally, it's from a position of user empowerment more so than a position of command and control.
- Talk to stakeholders in different business units to understand what analytics practices are currently working well vs. not working well to enable data-driven decision making. A series of workshops can work well for understanding current state and formulating the desired future state.
- Talk to stakeholders in IT, BI, and/or the [COE](powerbi-adoption-framework-center-of-excellence.md) to understand what [governance](powerbi-adoption-framework-governance.md) constraints need to be considered. This often also includes educating teams like security and infrastructure on what Power BI really is (and that it's significantly more powerful than a query tool).
- Verify the level of [executive sponsorship](powerbi-adoption-framework-executive-sponsorship.md) and support you have in place to advance data culture goals.
- Make purposeful decisions about your BI strategy. This includes deciding what the ideal balance of business-led self-service BI, managed self-service BI, and enterprise BI should be for the major business units in the organization (discussed in the [content ownership and management](powerbi-adoption-framework-content-ownership-and-management.md) article). Also consider how this relates to the extent that content is published for personal BI, team BI, departmental BI, and enterprise BI (discussed in the [content delivery scope](powerbi-adoption-framework-content-delivery-scope.md) article). Determine how these decisions affect your action plan.
- Begin creating an action plan for immediate, short-term, and long-term action items. Identify business groups and problems that can represent a "quick win" and can make a visible difference.

## Maturity levels

The following maturity levels will help you assess the current state of your data culture:

| **Level** | **State of data culture** |
| --- | --- |
| 100: Initial | There are business intelligence initiatives taking place - with some successes - in various parts of the organization. These activities are occurring in a somewhat chaotic manner, with few formal processes, and without a strategic plan.</br></br>A significant backlog of requests may exist for the enterprise BI team.</br></br>There is a lack of oversight and visibility into self-service BI operations. The successes or failures of BI solutions is not well-understood. |
| 200: Repeatable | Multiple teams have had measurable successes with self-service BI solutions.</br></br>Investments are being made to identify the ideal balance of enterprise BI and self-service BI. |
| 300: Defined | Specific goals have been established for advancing the data culture, and these goals are being implemented incrementally.</br></br>Effective self-service BI practices are being incrementally, and purposely, replicated throughout more parts of the organization. |
| 400: Capable | The data culture goals to employ informed decision-making are aligned with organizational objectives, actively supported by the executive sponsor, and directly impact the adoption strategies put into place.</br></br>A healthy and productive partnership exists between the COE, business units, and IT.</br></br>It's common for individuals that take initiative in building valuable BI solutions to be recognized and rewarded. |
| 500: Efficient | Key performance indicators are measured and reviewed regularly to validate that data culture results are aligned with intentions.</br></br>It's common for the business value of BI solutions to be regularly evaluated and measured, with feedback loops in place to encourage ongoing improvements.</br></br>Continual improvement of organizational adoption, user adoption, and solution adoption are top priorities. Learnings are incrementally adapted throughout the organization on an ongoing basis. |

## Next steps

In the [next article in this series](powerbi-adoption-framework-executive-sponsorship.md), learn more about the importance of an executive sponsor.
