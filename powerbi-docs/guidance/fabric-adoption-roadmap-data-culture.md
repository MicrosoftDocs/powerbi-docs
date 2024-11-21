---
title: "Microsoft Fabric adoption roadmap: Data culture"
description: "Encourage a data culture to drive strong and successful adoption of Microsoft Fabric."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Data culture

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

Building a data culture is closely related to adopting analytics, and it's often a key aspect of an organization's digital transformation. The term _data culture_ can be defined in different ways by different organizations. In this series of articles, data culture means a set of behaviors and norms in an organization. It encourages a culture that regularly employs informed data decision-making:

- By more stakeholders throughout more areas of the organization.
- Based on analytics, not opinion.
- In an effective, efficient way that's based on best practices approved by the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md).
- Based on trusted data.
- That reduces reliance on undocumented tribal knowledge.
- That reduces reliance on hunches and gut decisions.

> [!IMPORTANT]
> Think of data culture as what you do, not what you say. Your data culture is not a set of rules (that's governance). So, data culture is a somewhat abstract concept. It's the behaviors and norms that are allowed, rewarded, and encouraged—or those that are disallowed and discouraged. Bear in mind that a healthy data culture motivates employees at all levels of the organization to generate and distribute actionable knowledge.

Within an organization, certain business units or teams are likely to have their own behaviors and norms for getting things done. The specific ways to achieve data culture objectives can vary across organizational boundaries. What's important is that they should all align with the organizational data culture objectives. You can think of this structure as _aligned autonomy_.

The following circular diagram conveys the interrelated aspects that influence your data culture:

:::image type="content" source="media/fabric-adoption-roadmap-data-culture/data-culture.svg" alt-text="Diagram shows various relationships and influences in a data culture, which are described below." border="false":::

The diagram depicts the somewhat ambiguous relationships among the following items:

- Data culture is the outer circle. All topics within it contribute to the state of the data culture.
- [Organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels) (including the implementation aspects of [mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md), [user support](fabric-adoption-roadmap-user-support.md), [community of practice](fabric-adoption-roadmap-community-of-practice.md), [governance](fabric-adoption-roadmap-governance.md), and [system oversight](fabric-adoption-roadmap-system-oversight.md)) is the inner circle. All topics are major contributors to the [data culture](fabric-adoption-roadmap-data-culture.md).
- [Executive support](fabric-adoption-roadmap-executive-sponsorship.md) and the [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md) are drivers for the success of organizational adoption.
- [Data literacy](fabric-adoption-roadmap-data-culture.md#data-literacy), [data democratization](fabric-adoption-roadmap-data-culture.md#data-democratization), and [data discovery](fabric-adoption-roadmap-data-culture.md#data-discovery) are data culture aspects that are heavily influenced by organizational adoption.
- [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md), and [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md), are closely related to [data democratization](fabric-adoption-roadmap-data-culture.md#data-democratization).

The elements of the diagram are discussed throughout this series of articles.

## Data culture vision

The concept of data culture can be difficult to define and measure. Even though it's challenging to articulate data culture in a way that's meaningful, actionable, and measurable, you need to have a well-understood definition of what a healthy data culture means to your organization. This vision of a healthy data culture should:

- Originate from the executive level.
- [Align](fabric-adoption-roadmap-business-alignment.md) with organizational objectives.
- Directly influence your adoption strategy.
- Serve as the high-level guiding principles for enacting governance policies and guidelines.

Data culture outcomes aren't specifically mandated. Rather, the state of the data culture is the result of following the governance rules as they're enforced (or the lack of governance rules). Leaders at all levels need to actively demonstrate through their actions what's important to them, including how they praise, recognize, and reward staff members who take initiative.

> [!TIP]
> If you can take for granted that your efforts to develop a data solution (such as a semantic model, a lakehouse, or a report) will be valued and appreciated, that's an excellent indicator of a healthy data culture. Sometimes, however, it depends on what your immediate manager values most.

The initial motivation for establishing a data culture often comes from a specific strategic business problem or initiative. It might be:

- A reactive change, such as responding to new agile competition.
- A proactive change, such as starting a new line of business or expanding into new markets to seize a "green field" opportunity. Being data driven from the beginning can be relatively easier when there are fewer constraints and complications, compared with an established organization.
- Driven by external changes, such as pressure to eliminate inefficiencies and redundancies during an economic downturn.

In each of these situations, there's often a specific area where the data culture takes root. The specific area could be a scope of effort that's smaller than the entire organization, even if it's still significant. After necessary changes are made at this smaller scope, they can be incrementally replicated and adapted for the rest of the organization.

Although technology can help advance the goals of a data culture, implementing specific tools or features isn't the objective. This series of articles covers a lot of topics that contribute to adoption of a healthy data culture. The remainder of this article addresses three essential aspects of data culture: [data discovery](#data-discovery), [data democratization](#data-democratization), and [data literacy](#data-literacy).

## Data discovery

A successful data culture depends on users working with the right data in their day-to-day activities. To achieve this goal, users need to find and access data sources, reports, and other items.

_Data discovery_ is the ability to effectively locate relevant data assets across the organization. Primarily, data discovery is concerned with improving awareness that data exists, which can be particularly challenging when data is siloed in departmental systems.

Data discovery is a slightly different concept from _search_, because:

- Data discovery allows users to see metadata for an item, like the name of a semantic model, even if they don't currently have access to it. After a user is aware of its existence, that user can go through the standard process to request access to the item.
- Search allows users to locate an existing item when they already have security access to the item.

> [!TIP]
> It's important to have a clear and simple process so users can request access to data. Knowing that data exists—but being unable to access it within the guidelines and processes that the domain owner has established—can be a source of frustration for users. It can force them to use inefficient workarounds instead of requesting access through the proper channels.

Data discovery contributes to adoption efforts and the implementation of governance practices by:

- Encouraging the use of trusted high-quality data sources.
- Encouraging users to take advantage of existing investments in available data assets.
- Promoting the use and enrichment of existing data items (such as a lakehouse, data warehouse, data pipeline, dataflow, or semantic model) or reporting items (such as reports, dashboards, or metrics).
- Helping people understand who owns and manages data assets.
- Establishing connections between consumers, creators, and owners.

The [OneLake data hub](/fabric/get-started/onelake-data-hub) and the [use of endorsements](/power-bi/collaborate-share/service-endorse-content) are key ways to promote data discovery in your organization.

Furthermore, data catalog solutions are extremely valuable tools for data discovery. They can record metadata tags and descriptions to provide deeper context and meaning. For example, [Microsoft Purview](/azure/purview/overview) can scan and catalog items from a Fabric tenant (as well as many other sources).

### Questions to ask about data discovery

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess data discovery.

- Is there a data hub where business users can search for data?
- Is there a metadata catalog that describes definitions and data locations?
- Are high-quality data sources endorsed by [certifying](/power-bi/collaborate-share/service-endorse-content#certify-content) or [promoting](/power-bi/collaborate-share/service-endorse-content#promote-content) them?
- To what extent do redundant data sources exist because people can't find the data they need? What roles are expected to create data items? What roles are expected to create reports or perform ad hoc analysis?
- Can end users find and use existing reports, or do they insist on data exports to create their own?
- Do end users know which reports to use to address specific business questions or find specific data?
- Are people using the appropriate data sources and tools, or resisting them in favor of legacy ones?
- Do analysts understand how to enrich existing certified semantic models with new data—for example, by using a [Power BI composite model](/power-bi/transform-model/desktop-composite-models)?
- How consistent are data items in their quality, completeness, and naming conventions?
- Can data item owners follow [data lineage](/power-bi/collaborate-share/service-data-lineage) to perform impact analysis of data items?

### Maturity levels of data discovery

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels can help you assess your current state of data discovery.

| **Level** | **State of Fabric data discovery** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Data is fragmented and disorganized, with no clear structures or processes to find it. <br/><br/>&bull;&nbsp;Users struggle to find and use data they need for their tasks. |
| 200: Repeatable | &bull;&nbsp;Scattered or organic efforts to organize and document data are underway, but only in certain teams or departments. <br/><br/>&bull;&nbsp;Content is occasionally endorsed, but these endorsements aren't defined and the process isn't managed. Data remains siloed and fragmented, and it's difficult to access. |
| 300: Defined | &bull;&nbsp;A central repository, like the OneLake data hub, is used to make data easier to find for people who need it.  <br/><br/>&bull;&nbsp;An explicit process is in place to endorse quality data and content. <br/><br/>&bull;&nbsp;Basic documentation includes catalog data, definitions, and calculations, as well as where to find them. |
| 400: Capable | &bull;&nbsp;Structured, consistent processes guide users how to endorse, document, and find data from a central hub. Data silos are the exception instead of the rule. <br/><br/>&bull;&nbsp;Quality data assets are consistently endorsed and easily identified. <br/><br/>&bull;&nbsp;Comprehensive data dictionaries are maintained and improve data discovery. |
| 500: Efficient | &bull;&nbsp;Data and metadata is systematically organized and documented with a full view of the data lineage. <br/><br/>&bull;&nbsp;Quality assets are endorsed and easily identified. <br/><br/>&bull;&nbsp;Cataloging tools, like Microsoft Purview, are used to make data discoverable for both use and governance. |

## Data democratization

Data democratization refers to putting data into the hands of more users who are responsible for solving business problems. It's about enabling more users to make better data-driven decisions.

> [!NOTE]
> The concept of data democratization doesn't imply a lack of security or a lack of justification based on job role. As part of a healthy data culture, data democratization helps reduce _shadow IT_ by providing semantic models that:
>
> - Are secured, governed, and well managed.
> - Meet business needs in cost-effective and timely ways.

Your organization's position on data democratization will have a wide-reaching impact on adoption and governance-related efforts.

> [!WARNING]
> If access to data or the ability to perform analytics is limited to a select number of individuals in the organization, that's typically a warning sign because the ability to work with data is a key characteristic of a healthy data culture.

### Questions to ask about data democratization

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess data democratization.

- Is data and analytics readily accessible, or restricted to limited roles and individuals?
- Is an effective process in place for people to request access to new data and tools?
- Is data readily shared between teams and business units, or is it siloed and closely guarded?
- Who is permitted to have Power BI Desktop installed?
- Who is permitted to have Power BI Pro or Power BI Premium Per User (PPU) licenses?
- Who is permitted to create assets in Fabric workspaces?
- What's the desired level of self-service analytics and business intelligence (BI) user enablement? How does this level vary depending on business unit or job role?
- What's the desired balance between enterprise and self-service analytics, and BI?
- What data sources are strongly preferred for what topics and business domains? What's the allowed use of unsanctioned data sources?
- Who can manage content? Is this decision different for data versus reports? Is the decision different for enterprise BI users versus decentralized users? Who can own and manage self-service BI content?
- Who can consume content? Is this decision different for external partners, customers, or suppliers?

### Maturity levels of data democratization

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels can help you assess your current state of data democratization.

| **Level** | **State of data democratization** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Data and analytics are limited to a small number of roles, who gatekeep access to others. <br/><br/>&bull;&nbsp;Business users must request access to data or tools to complete tasks. They struggle with delays or bottlenecks. <br/><br/>&bull;&nbsp;Self-service initiatives are taking place with some success in various areas of the organization. These activities are occurring in a somewhat chaotic manner, with few formal processes and no strategic plan. There's a lack of oversight and visibility into these self-service activities. The success or failure of each solution isn't well understood. <br/><br/>&bull;&nbsp;The enterprise data team can't keep up with the needs of the business. A significant backlog of requests exists for this team. |
| 200: Repeatable | &bull;&nbsp;There are limited efforts underway to expand access to data and tools. <br/><br/>&bull;&nbsp;Multiple teams have had measurable success with self-service solutions. People in the organization are starting to pay attention. <br/><br/>&bull;&nbsp;Investments are being made to identify the ideal balance of enterprise and self-service solutions. |
| 300: Defined | &bull;&nbsp;Many people have access to the data and tools they need, although not all users are equally enabled or held accountable for the content they create. <br/><br/>&bull;&nbsp;Effective self-service data practices are incrementally and purposely replicated throughout more areas of the organization. |
| 400: Capable | &bull;&nbsp;Healthy partnerships exist among enterprise and self-service solution creators. Clear, realistic user accountability and policies mitigate risk of self-service analytics and BI. <br/><br/>&bull;&nbsp;Clear and consistent processes are in place for users to request access to data and tools. <br/><br/>&bull;&nbsp;Individuals who take initiative in building valuable solutions are recognized and rewarded. |
| 500: Efficient | &bull;&nbsp;User accountability and effective governance give central teams confidence in what users do with data. <br/><br/>&bull;&nbsp;Automated, monitored processes enable people to easily request access to data and tools. Anyone with the need or interest to use data can follow these processes to perform analytics. |

## Data literacy

Data literacy refers to the ability to interpret, create, and communicate with data and analytics accurately and effectively.

Training efforts, as described in the [mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) article, often focus on how to use the technology itself. Technology skills are important to producing high-quality solutions, but it's also important to consider how to purposely advance data literacy throughout the organization. Put another way, successful adoption takes a lot more than merely providing software and licenses to users.

How you go about improving data literacy in your organization depends on many factors, such as current user skillsets, complexity of the data, and the types of analytics that are required. You might choose to focus on these types of activities related to data literacy:

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

### Questions to ask about data literacy

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess data literacy.

- Does a common analytical vocabulary exist in the organization to talk about data and BI solutions? Alternatively, are definitions fragmented and different across silos?
- How comfortable are people with making decisions based on data and evidence compared to intuition and subjective experience?
- When people who hold an opinion are confronted with conflicting evidence, how do they react? Do they critically appraise the data, or do they dismiss it? Can they alter their opinion, or do they become entrenched and resistant?
- Do training programs exist to support people in learning about data and analytical tools?
- Is there significant resistance to visual analytics and interactive reporting in favor of static spreadsheets?
- Are people open to new analytical methods and tools to potentially address their business questions more effectively? Alternatively, do they prefer to keep using existing methods and tools to save time and energy?
- Are there methods or programs to assess or improve data literacy in the organization? Does leadership have an accurate understanding of the data literacy levels?
- Are there roles, teams, or departments where data literacy is particularly strong or weak?

### Maturity levels of data literacy

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels can help you assess your current state of data literacy.

| **Level** | **State of data literacy** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Decisions are frequently made based on intuition and subjective experience. When confronted with data that challenges existing opinions, data is often dismissed. <br/><br/>&bull;&nbsp;Individuals have low confidence to use and understand data in decision-making processes or discussions. <br/><br/>&bull;&nbsp;Report consumers have a strong preference for static tables. These consumers dismiss interactive visualizations or sophisticated analytical methods as "fancy" or unnecessary. |
| 200: Repeatable | &bull;&nbsp;Some teams and individuals inconsistently incorporate data into their decision making. There are clear cases where misinterpretation of data has led to flawed decisions or wrong conclusions. <br/><br/>&bull;&nbsp;There's some resistance when data challenges pre-existing beliefs. <br/><br/>&bull;&nbsp;Some people are skeptical of interactive visualizations and sophisticated analytical methods, though their use is increasing. |
| 300: Defined | &bull;&nbsp;The majority of teams and individuals understand data relevant to their business area and use it implicitly to inform decisions. <br/><br/>&bull;&nbsp;When data challenges pre-existing beliefs, it produces critical discussions and sometimes motivates change. <br/><br/>&bull;&nbsp;Visualizations and advanced analytics are more widely accepted, though not always used effectively. |
| 400: Capable | &bull;&nbsp;Data literacy is recognized explicitly as a necessary skill in the organization. Some training programs address data literacy. Specific efforts are taken to help departments, teams, or individuals that have particularly weak data literacy. <br/><br/>&bull;&nbsp;Most individuals can effectively use and apply data to make objectively better decisions and take actions. <br/><br/>&bull;&nbsp;Visual and analytical best practices are documented and followed in strategically important data solutions. |
| 500: Efficient | &bull;&nbsp;Data literacy, critical thinking, and continuous learning are strategic skills and values in the organization. Effective programs monitor progress to improve data literacy in the organization. <br/><br/>&bull;&nbsp;Decision making is driven by data across the organization. Decision intelligence or prescriptive analytics are used to recommend key decisions and actions. <br/><br/>&bull;&nbsp;Visual and analytical best practices are seen as essential to generate business value with data. |

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Here are some considerations and key actions that you can take to strengthen your data culture.

> [!div class="checklist"]
> - **Align your data culture goals and strategy:**  Give serious consideration to the type of data culture that you want to cultivate. Ideally, it's more from a position of user empowerment than a position of command and control.
> - **Understand your current state:** Talk to stakeholders in different business units to understand which analytics practices are currently working well and which practices aren't working well for data-driven decision-making. Conduct a series of workshops to understand the current state and to formulate the desired future state.
> - **Speak with stakeholders:** Talk to stakeholders in IT, BI, and the [COE](fabric-adoption-roadmap-center-of-excellence.md) to understand which [governance](fabric-adoption-roadmap-governance.md) constraints need consideration. These conversations can present an opportunity to educate teams on topics like security and infrastructure. You can also use the opportunity to educate stakeholders on the features and capabilities included in Fabric.
> - **Verify executive sponsorship:** Verify the level of [executive sponsorship](fabric-adoption-roadmap-executive-sponsorship.md) and support that you have in place to advance data culture goals.
> - **Make purposeful decisions about your data strategy:** Decide what the ideal balance of business-led self-service, managed self-service, and enterprise data, analytics and BI use cases should be for the key business units in the organization (covered in the [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article). Also consider how the data strategy relates to the extent of published content for personal, team, departmental, and enterprise analytics and BI (described in the [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) article). Define your high-level goals and priorities for this strategic planning. Determine how these decisions affect your tactical planning.
> - **Create a tactical plan:** Begin creating a tactical plan for immediate, short-term, and long-term action items. Identify business groups and problems that represent "quick wins" and can make a visible difference.
> - **Create goals and metrics:** Determine how you'll measure effectiveness for your data culture initiatives. Create key performance indicators (KPIs) or objectives and key results (OKRs) to validate the results of your efforts.

## Questions to ask about data culture

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess data culture.

- Is data regarded as a strategic asset in the organization?
- Is there a vision of a healthy data culture that originates from executive leadership and aligns with organizational objectives?
- Does the data culture guide creation of governance policies and guidelines?
- Are organizational data sources trusted by content creators and consumers?
- When justifying an opinion, decision, or choice, do people use data as evidence?
- Is knowledge about analytics and data use documented or is there a reliance on undocumented tribal knowledge?
- Are efforts to develop a data solution valued and appreciated by the user community?

## Maturity levels of data culture

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your data culture.

| **Level** | **State of data culture** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Enterprise data teams can't keep up with the needs of the business. A significant backlog of requests exists. <br/><br/>&bull;&nbsp;Self-service data and BI initiatives are taking place with some success in various areas of the organization. These activities occur in a somewhat chaotic manner, with few formal processes and no strategic plan. <br/><br/>&bull;&nbsp;There's a lack of oversight and visibility into self-service BI activities. The successes or failures of data and BI solutions aren't well understood. |
| 200: Repeatable | &bull;&nbsp;Multiple teams have had measurable successes with self-service solutions. People in the organization are starting to pay attention. <br/><br/>&bull;&nbsp;Investments are being made to identify the ideal balance of enterprise and self-service data, analytics, and BI. |
| 300: Defined | &bull;&nbsp;Specific goals are established for advancing the data culture. These goals are implemented incrementally. <br/><br/>&bull;&nbsp;Learnings from what works in individual business units is shared. <br/><br/>&bull;&nbsp;Effective self-service practices are incrementally and purposely replicated throughout more areas of the organization. |
| 400: Capable | &bull;&nbsp;The data culture goals to employ informed decision-making are aligned with organizational objectives. They're actively supported by the executive sponsor, the COE, and they have a direct impact on adoption strategies. <br/><br/>&bull;&nbsp;A healthy and productive partnership exists between the executive sponsor, COE, business units, and IT. The teams are working towards shared goals. <br/><br/>&bull;&nbsp;Individuals who take initiative in building valuable data solutions are recognized and rewarded. |
| 500: Efficient | &bull;&nbsp;The business value of data, analytics, and BI solutions is regularly evaluated and measured. KPIs or OKRs are used to track data culture goals and the results of these efforts. <br/><br/>&bull;&nbsp;Feedback loops are in place, and they encourage ongoing data culture improvements. <br/><br/>&bull;&nbsp;Continual improvement of organizational adoption, user adoption, and solution adoption is a top priority. |

## Related content

In the [next article](fabric-adoption-roadmap-executive-sponsorship.md) in the Microsoft Fabric adoption roadmap series, learn about the importance of an executive sponsor.
