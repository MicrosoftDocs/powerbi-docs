---
title: Learn from customers to migrate to Power BI
description: Learn from customers when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Learn from customers to migrate to Power BI

This article, which concludes the series on migrating to Power BI, shares key lessons learned by customers who have migrated to Power BI.

## International consumer goods company

An international consumer goods company, with hundreds of products, made the decision in 2017 to pursue a cloud-first strategy. One of the major factors for selecting Power BI as its business intelligence tool of choice is its deep integration with Azure and Microsoft 365.

### Conduct a phased migration

In 2017, content authors began using Power BI. The organizational objective for the initial period was to introduce Power BI as an additional business intelligence tool. This allowed content authors, consumers, and IT time to adapt to new ways of working and build their expertise with Power BI.

During the second half of 2018, the formal announcement was made that Power BI was now the approved business intelligence tool for the organization and, accordingly, all new BI development work should occur in Power BI. The availability of Power BI Premium was a key driver for making this decision. At this point, the organization stopped encouraging use of the former platform and planning for transition scenarios commenced.

Towards the end of 2019, work began to migrate existing content from the former platform to Power BI. Some early adopters migrated their content rapidly, which helped build even more momentum with Power BI around the organization. Content owners and authors were then asked to begin preparations to ensure all content is fully migrated to Power BI prior to the end of 2020. The organization does still face challenges related to skills, time, and funding – though none of their challenges are related to the technology platform itself.

Power BI had already become successful, and well-adopted throughout the organization before the business units were asked to undergo a formal migration effort away from the former platform.

### Prepare to handle varying responses

In this large, decentralized, organization there were varying levels of receptiveness and willingness to move to Power BI. Beyond concerns related to time and budget, there were staff who made a significant investment in building their skills in the former platform, so the announcement about standardizing on Power BI was not welcome news by everyone across the company. Since each business unit has its own budget, individual business units could challenge decisions such as this one. Also, they were made centrally and so resulted in some challenges for the executive sponsor and BI leaders to handle.

Communication with leadership teams throughout the business units was critical to ensure they all understood the high-level organizational benefits of standardizing on Power BI. Effective communication becomes even more essential as the migration progresses and the decommissioning date for the former platform becomes closer.

### Focus on the bigger picture

The company found that while some migrated reports could be loyal to the original design, not every individual report could be replicated in Power BI exactly as it was presented in the former platform. Although it's to be expected since all BI platforms are different, it did bring to light that a different mindset is required.

The guidance provided to content authors was to focus on creating fit-for-purpose reports in Power BI, rather than always migrating exactly what was there before. For this reason, subject matter experts do need to be actively available during the migration process. Work to consider purpose, and improve where appropriate, should be accounted for in timeline planning, especially because change management becomes involved when the former solution is to be modified significantly.

Sometimes the best answer is to take on improvements during the migration. Whereas other times, the best choice is to deliver the exact same value as before, without significant improvements, so as not jeopardize the migration timeline.

### Cautiously assess priorities

An analysis of the former platform was conducted to fully understand its usage. The former platform had thousands of published reports, of which approximately half had been used in the previous year. That number could be cut in half once again when assessing which reports were deemed to deliver significant value to the organization. Those are the reports that were prioritized first for the migration.

It's easy to overestimate how critical a report is. For reports that are not used frequently, evaluate if they can be decommissioned entirely. The cheapest and easiest thing to do is nothing.

### Cautiously assess complexity

Of the initially prioritized reports, time estimates were compiled based on estimated effort levels of simple, medium, and complex. Although it sounds like a relatively straightforward process, do not expect time estimates be accurate on an individual report basis. In fact, an estimate may be wildly inaccurate: the company experienced one report deemed highly complex that received a conversion estimate of 50 days by the consultants. The redesigned report in Power BI was completed in about 50 hours. Therefore, try to set yourself up so you can easily reassess time estimates once you have some additional experience.

Although time estimates are often necessary to obtain funding and personnel assignments, they are probably most valuable in the aggregate.

### Decide how change management will be handled

With such a high volume of BI assets, change management for the business-owned reports represented a challenge. IT-managed reports were handled according to standard change manage practices. However, due to the volume, driving change centrally for business-owned content was not possible.

Additional responsibility falls to the business units when it is impractical to manage change from one central team.

### Create an internal community

This company has implemented a Center of Excellence (COE) which provides internal training classes and resources. The COE also serves as an internal consultancy to assist content authors with technical issues, resolution of roadblocks, and best practices for designing their solution.

There is also an internal Power BI community, which has been a massive success with over 1,600 members. The community is based in Yammer where members can ask internally relevant questions and get answers based on the organizational constraints and best practices. This type of user-to-user interaction can alleviate much of the support burden from the COE. However, the COE does monitor the questions and answers, and gets involved in conversations when appropriate.

An extension of the internal community is the newer Power BI expert network, which includes a small number of pre-selected Power BI champions in the organization. These champions are highly skilled Power BI practitioners, from the business units, who are enthusiastic champions, and who actively want to be exposed to challenges throughout the business. Members of the Power BI expert network are expected to abide by best practices and guidelines established by the COE and help the broader internal Power BI community understand and implement them. Although the Power BI expert network collaborates with the COE, and can receive dedicated training, the experts operate independently from the COE. Each Power BI expert may define the parameters for how they want to operate in this role given their other responsibilities.

Have a well-defined scope for what the COE will be involved in, such as: adoption, governance, guidance, best practices, training, support, and perhaps even hands-on development. Although a COE is incredibly valuable, though its return on investment can be vague.

### Monitor migration progress and success

Key performance indicators (KPIs) are continually monitored throughout the migration to understand trends for metrics such as number of report visits, number of active reports, and distinct users per month. Increased usage of Power BI is measured alongside decreased usage of the former platform, with a goal of seeing an inverse relationship. The targets are updated each month to adapt to changes and if usage is not happening at the desired pace, those areas are identified so action may be taken.

Create a migration scorecard with actionable business intelligence to monitor the success of the migration effort.

## Large transportation and logistics company

A large transportation and logistics company in North America has been actively investing in the modernization of its data infrastructure and analytical systems.

### Allow a period of gradual growth

The company got started with Power BI in 2018. By mid-2019, Power BI became the preferred tool for all new BI use cases. In 2020, the company began focusing on phasing out another BI platform, plus a variety of custom BI solutions that were deployed using ASP.NET.

Power BI was actively adopted by many users across the organization before commencing the phase-out of legacy tools.

### Balance centralized and distributed groups

In this company, there are two types of BI teams: the central BI team and the analytics groups distributed throughout the organization. The central BI team has ownership responsibility for Power BI as a platform but does not own the content itself. The role of the central BI team is as a technical enablement hub in support of the distributed analytics groups.

Each of the analytics groups is dedicated to a specific business unit or a shared services function. A small group may contain a single analyst, whereas large groups may have 10-15 analysts.

The distributed analytics groups are subject matter experts who are familiar with the day-to-day needs. This allows the central BI team to focus primarily on technical enablement and support for the tools and services to support BI and analytics.

### Focus on dataset reusability

The barrier to getting started with BI development work with ASP.NET, or the previous BI toolset, was highly impractical. The high learning curve kept the number of self-service content authors small in the past. Since Power BI is a much more approachable tool, it spread quickly throughout the organization once it was released.

The empowerment of data analysts within the company was overwhelmingly positive. However, the initial focus with Power BI development was on producing visuals. While this did produce BI solutions of value, the focus on visuals resulted in a significantly large number of .pbix files with a 1:1 relationship between reports and datasets. As the company evolves with Power BI, they are making additional investments in user training and support so that concepts like data reusability are learned sooner by content authors.

Include information about the importance of data reusability in your internal training efforts. Address important concepts as early as is practical.

### Test data access multiple ways

The existing data warehouse platform is DB2. Based on the current data warehouse design, this company found that using DirectQuery more often than import mode often works best for their needs.

Conduct a technical proof of concept to evaluate which data access method works best and teach authors how to most effectively access data based on what you have.

### Educate authors about Premium licensing

Since it became easier to get started with Power BI, versus the legacy BI options, many of the early adopters were people who did not have a license to the previous BI tool. As expected, the number of content authors grew considerably. These content authors understandably wanted to share their content with others, resulting in a continual need for additional Pro licenses.

The company made a large investment in Premium workspaces, most notably for the ability to use free Power BI licenses for users who consume content. The support team works with content authors on using Premium workspaces when appropriate. It avoids the need to allocate a Power BI Pro license to a user merely because one report was shared to them.

Be prepared to help content authors with handling licensing questions that come up often. Do some validation when a user requests a Pro license to determine if this person will be an author or consumer only.

### Understand the data gateways

Early on, the company ended up with many personal gateways in place. Using a standard data gateway cluster can move the gateway management efforts to the central BI team, allowing the content author community to focus on producing content. The central BI team worked with the internal Power BI user community to reduce the number of personal gateways.

Have a plan for creating and managing the enterprise data gateway. Decide on who is permitted to install and run a personal gateway and implement it through the gateway policies.

### Formalize your support plan

As use of Power BI expanded throughout the organization, this company found that a multi-tier approach to support works well:

- **Layer 1: Intra-team.** People learn from and teach each other on a day-to-day basis.
- **Layer 2: Power BI community.** People ask questions of the internal Teams community to learn from each other and communicate important information.
- **Layer 3: Central BI team + Center of Excellence.** People submit e-mail requests for assistance. Office hours are held twice per week to collectively discuss problems and ideas.

Although the first two layers are less formal, they are equally as important as the third layer of support. Experienced users tend to rely most on people they know, whereas newer users (or those users who are the single analyst for a business unit or shared service) tend to rely initially more on formal support modes.

### Invest in training and governance

Over the most recent year, this company has been improving its internal training offerings and enhancing its data governance program. The governance committee includes key members from each of the distributed analytics groups, plus the Center of Excellence.

There are now six internal Power BI courses in their internal catalog. The Dashboard in a Day course is a popular way to get started. To help users deepen their skills, they offer a series of three Power BI courses and two DAX courses.

One of their most important data governance decisions relates to management of Premium capacities. The company opted to align dedicated capacity with key analytics areas in business units and shared services. Therefore, if inefficiencies exist, the impact is felt only within that one area, and the decentralized capacity administrators are empowered to manage the capacity as they see fit.

Pay attention to how Premium capacity is being used, and how workspaces are being allocated to each capacity.

## Next steps

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
