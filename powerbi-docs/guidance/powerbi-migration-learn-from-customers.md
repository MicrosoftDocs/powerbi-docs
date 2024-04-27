---
title: Learn from customer Power BI migrations
description: Learn from customers when migrating to Power BI.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 02/13/2024
---

# Learn from customer Power BI migrations

This article, which concludes the series on migrating to Power BI, shares key lessons learned by two customers who have successfully migrated to Power BI.

## International consumer goods company

An international consumer goods company, which sells hundreds of products, made the decision in 2017 to pursue a cloud-first strategy. One of the major factors for selecting Power BI as its business intelligence (BI) platform is its deep integration with Azure and Microsoft 365.

### Conduct a phased migration

In 2017, the company began using Power BI. The initial organizational objective was to introduce Power BI as an additional BI tool. The decision provided content authors, consumers, and IT with the time to adapt to new ways of delivering BI. It also allowed them to build expertise in Power BI.

During the second half of 2018, a formal announcement was made declaring that Power BI was the approved BI tool for the organization. And, accordingly, all new BI development work should take place in Power BI. The availability of Power BI Premium was a key driver for making this decision. At this time, the organization discouraged the use of the former BI platform, and planning for transition commenced.

Towards the end of 2019, work began to migrate existing content from the legacy BI platform to Power BI. Some early adopters migrated their content rapidly. That helped build even more momentum with Power BI around the organization. Content owners and authors were then asked to begin preparations to fully migrate to Power BI by the end of 2020. The organization does still face challenges related to skills, time, and funding—though none of their challenges are related to the technology platform itself.

> [!IMPORTANT]
> Power BI had already become successful and entrenched within the organization before the business units were asked to undergo a formal migration effort away from the former BI platform.

### Prepare to handle varying responses

In this large decentralized organization, there were varying levels of receptiveness and willingness to move to Power BI. Beyond concerns related to time and budget, there were staff who had made significant investments in building their skills in the former BI platform. So, the announcement about standardizing on Power BI wasn't news welcomed by everyone. Since each business unit has its own budget, individual business units could challenge decisions such as this one. As IT tool decisions were made centrally, that resulted in some challenges for the executive sponsor and BI leaders to handle.

> [!IMPORTANT]
> Communication with leadership teams throughout the business units was critical to ensure they all understood the high-level organizational benefits of standardizing on Power BI. Effective communication became even more essential as the migration progressed and the decommissioning date of the legacy BI platform approached.

### Focus on the bigger picture

The company found that while some migrated reports could closely replicate the original design, not every individual report could be faithfully replicated in Power BI. Although it's to be expected—since all BI platforms are different. It did bring to light that a different design mindset was required.

Guidance was provided to content authors: focus on creating fit-for-purpose reports in Power BI, rather than attempt an exact replica of the legacy report. For this reason, subject matter experts need to be actively available during the migration process for consultation and validation. Efforts were taken to consider the report design purpose and to improve it when appropriate.

> [!IMPORTANT]
> Sometimes the better approach is to take on improvements during the migration. At other times, the better choice is to deliver the exact same value as before—without significant improvements—so as not to jeopardize the migration timeline.

### Cautiously assess priorities

An analysis of the former BI platform was conducted to fully understand its usage. The former BI platform had thousands of published reports, of which approximately half had been accessed in the previous year. That number could be cut in half once again when assessing which reports were deemed to deliver significant value to the organization. Those reports were prioritized first for the migration.

> [!IMPORTANT]
> It's very easy to overestimate how critical a report actually is. For reports that aren't used frequently, evaluate whether they can be decommissioned entirely. Sometimes, the cheapest and easiest thing to do is nothing.

### Cautiously assess complexity

Of the first prioritized reports, time estimates were compiled based on estimated effort levels: simple, medium, or complex. Although it sounds like a relatively straightforward process, don't expect time estimates to be accurate on an individual report basis. You might find an estimate can be wildly inaccurate. For example, the company had a report that it deemed highly complex. It received a conversion estimate of 50 days by the consultants. However, the redesigned report in Power BI was completed in about 50 hours.

> [!IMPORTANT]
> Although time estimates are often necessary to obtain funding and personnel assignments, they're probably most valuable in the aggregate.

### Decide how change management is handled

With such a high volume of BI assets, change management for the business-owned reports represented a challenge. IT-managed reports were handled according to standard change management practices. However, due to the high volume, driving change centrally for business-owned content wasn't possible.

> [!IMPORTANT]
> Additional responsibility falls to the business units when it's impractical to manage change from one central team.

### Create an internal community

The company established a [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) to provide internal training classes and resources. The COE also serves as an internal consultancy group that's ready to assist content authors with technical issues, resolution of roadblocks, and best practice guidance.

There's also an [internal Power BI community](fabric-adoption-roadmap-community-of-practice.md), which has been a massive success counting in excess of 1,600 members. The community is managed in Yammer. Members can ask internally relevant questions and receive answers adhering to best practices and framed within organizational constraints. This type of user-to-user interaction alleviates much of the support burden from the COE. However, the COE does monitor the questions and answers, and it gets involved in conversations when appropriate.

An extension of the internal community is the newer Power BI expert network. It includes a small number of pre-selected Power BI champions from within the organization. They are highly skilled Power BI practitioners from the business units, who are enthusiastic champions, and who actively want to solve challenges within the business. Members of the Power BI expert network are expected to abide by best practices and guidelines established by the COE, and help the broader internal Power BI community understand and implement them. Although the Power BI expert network collaborates with the COE, and can receive dedicated training, Power BI experts operate independently from the COE. Each Power BI expert can define the parameters for how they operate, bearing in mind they have other responsibilities and priorities in their official role.

> [!IMPORTANT]
> Have a very well defined scope for what the COE does, such as: adoption, governance, guidance, best practices, training, support, and perhaps even hands-on development. While a COE is incredibly valuable, measuring its return on investment can be difficult.

### Monitor migration progress and success

Key performance indicators (KPIs) are continually monitored during the migration to Power BI. They help the company to understand trends for metrics such as number of report visits, number of active reports, and distinct users per month. Increased usage of Power BI is measured alongside decreased usage of the former BI platform, with the goal of achieving an inverse relationship. Targets are updated each month to adapt to changes. If usage isn't happening at the desired pace, bottlenecks are identified so appropriate action can be taken.

> [!IMPORTANT]
> Create a migration scorecard with actionable business intelligence to monitor the success of the migration effort.

## Large transportation and logistics company

A large North American transportation and logistics company is actively investing in the modernization of its data infrastructure and analytical systems.

### Allow a period of gradual growth

The company started using Power BI in 2018. By mid-2019, Power BI became the preferred platform for all new BI use cases. Then, in 2020, the company focused on phasing out their existing BI platform, in addition to a variety of custom developed ASP.NET BI solutions.

> [!IMPORTANT]
> Power BI had many active users across the organization before commencing the phase out of their legacy BI platform and solutions.

### Balance centralized and distributed groups

In the company, there are two types of BI teams: a central BI team and analytics groups distributed throughout the organization. The central BI team has ownership responsibility for Power BI as a platform, but it doesn't own any of the content. This way, the central BI team is a technical enablement hub that supports the distributed analytics groups.

Each of the analytics groups is dedicated to a specific business unit or a shared services function. A small group might contain a single analyst, while a larger group could have 10-15 analysts.

> [!IMPORTANT]
> The distributed analytics groups comprise subject matter experts who are familiar with the day-to-day business needs. This separation allows the central BI team to focus primarily on technical enablement and support of the BI services and tools.

### Focus on semantic model reusability

Relying on custom ASP.NET BI solutions was a barrier to developing new BI solutions. The required skill set meant that the number of self-service content authors was small. Because Power BI is a much more approachable tool—specifically designed for self-service BI—it spread quickly throughout the organization once it was released.

The empowerment of data analysts within the company resulted in immediate positive outcomes. However, the initial focus with Power BI development was on visualization. While it resulted in valuable BI solutions, this focus resulted in a large number of Power BI Desktop files, each with a one-to-one relationship between the report and its semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)). It resulted in many semantic models and duplication of data and business logic. To reduce duplication of data, logic, and effort, the company delivered training and provided support to content authors.

> [!IMPORTANT]
> Include information about the importance of data reusability in your internal training efforts. Address important concepts as early as is practical.

### Test data access multiple ways

The company's data warehouse platform is DB2. Based on the current data warehouse design, the company found that DirectQuery models—instead of Import models—worked best for their requirements.

> [!IMPORTANT]
> Conduct a [technical proof of concept](powerbi-implementation-planning-usage-scenario-prototyping-and-sharing.md) to evaluate the model storage mode that works best. Also, teach data modelers about model storage modes and how they can choose an appropriate mode for their project.

### Educate authors about Premium licensing

Because it was easier to get started with Power BI (compared with their legacy BI platform), many of the early adopters were people who didn't have a license to the previous BI tool. As expected, the number of content authors grew considerably. These content authors understandably wanted to share their content with others, resulting in a continual need for additional Power BI Pro licenses.

The company made a large investment in Premium workspaces, most notably to distribute Power BI content to many users with Fabric free licenses. The support team works with content authors to ensure they use Premium workspaces when appropriate. It avoids unnecessarily allocating Power BI Pro licenses when a user only needs to consume content.

> [!IMPORTANT]
> Licensing questions often arise. Be prepared to educate and help content authors to address licensing questions. Validate that user requests for Power BI Pro licenses are justified.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

### Understand the data gateways

Early on, the company had many personal gateways. Using an on-premises data gateway cluster shifts the management efforts to the central BI team, which allows the content author community to focus on producing content. The central BI team worked with the internal Power BI user community to reduce the number of personal gateways.

> [!IMPORTANT]
> Have a plan for creating and managing on-premises data gateways. Decide who is permitted to install and use a personal gateway and enforce it with gateway policies. For more information, see [Manage gateways](powerbi-implementation-planning-data-gateways.md#manage-gateways).

### Formalize your support plan

As the adoption of Power BI grew within the organization, the company found that a [multi-tier support approach](fabric-adoption-roadmap-user-support.md) worked well:

- **Layer 1: Intra-team:** People learn from, and teach, each other on a day-to-day basis.
- **Layer 2: Power BI community:** People ask questions of the internal Teams community to learn from each other and communicate important information.
- **Layer 3: Central BI team and COE:** People submit email requests for assistance. *Office hour* sessions are held twice per week to collectively discuss problems and share ideas.

> [!IMPORTANT]
> Although the first two layers are less formal, they're equally important as the third layer of support. Experienced users tend to rely mostly on people they know, whereas newer users (or those who are the single data analyst for a business unit or shared service) tend to rely more on formal support.

### Invest in training and governance

Over the past year, the company improved its internal training offerings and enhanced its [data governance](fabric-adoption-roadmap-governance.md) program. The governance committee includes key members from each of the distributed analytics groups, plus the [COE](fabric-adoption-roadmap-center-of-excellence.md).

There are now six internal Power BI courses in their internal catalog. The [Dashboard in a Day](https://powerbi.microsoft.com/diad/) course remains a popular course for beginners. To help users deepen their skills, they deliver a series of three Power BI courses and two DAX courses.

One of their most important data governance decisions related to management of Premium capacities. The company opted to align their capacity with key analytics areas in business units and shared services. Therefore, if inefficiencies exist, the impact is felt only within that one area, and the decentralized capacity administrators are empowered to manage the capacity as they see fit.

> [!IMPORTANT]
> Pay attention to how Premium capacities are used, and how workspaces are assigned to them.

## Related content

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- [Dashboard in a Day](https://powerbi.microsoft.com/diad/)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
