---
title: How Microsoft established a Center of Excellence
description: Learn how a Center of Excellence helped Microsoft create a standardized analytics and data platform to unlock insights with the right operating model, stakeholder engagement, and shared and dedicated investments.
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/10/2023
---
# How Microsoft established a Center of Excellence

> [!TIP]
> This article focuses on Microsoft's experience establishing a [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md). When setting up your own Center of Excellence, we recommend that you also review the information covered in the [Fabric adoption roadmap](fabric-adoption-roadmap.md).

This article targets IT professionals and IT managers. You'll learn how to set up a BI and analytics Center of Excellence (COE) in your organization, and how Microsoft has set up theirs.

For some, there's a misconception that a COE is just a help desk—this thinking, however, is far from reality.

Generally, a BI and analytics COE is a team of professionals that's responsible for establishing and maintaining a BI platform. It's also responsible for creating a single source of truth, and defining a set of consistent company-wide metrics to unlock and accelerate insights. Yet, a COE is a broad term. As such, it can be implemented and managed in different ways, and its structure and scope can vary from organization to organization. At its core, it's always about a robust platform delivering the right data and insight capabilities to the right people at the right time. Ideally, it also promotes evangelizing, training, and support. At Microsoft, it's described as *[discipline at the core](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core)*, and it's delivered as our BI platform and single source of truth.

In larger organizations, you could find multiple COEs with the core COE *extended* by satellite COEs—often at department level. This way, a satellite COE is a group of experts familiar with taxonomies and definitions, who know how to transform core data into what makes sense *for their department*. Departmental analysts are granted permissions to core data, and they trust it for use in their own reports. They build solutions that rely upon carefully prepared core dimensions, facts, and business logic. At times, they might also extend it with smaller, department-specific semantic models and business logic. Importantly, satellite COEs aren't ever disconnected nor do they act in isolation. At Microsoft, satellite COEs promote *[flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#flexibility-at-the-edge)*.

For this extended scenario to succeed, departments must *pay to play*. In other words, departments must financially invest in the core COE. This way, there isn't concern that they're "not getting their fair share" or that their requirements are ever de-prioritized.

To support this scenario, the core COE must scale to meet funded departmental needs. Once several semantic models have been onboarded economies of scale set in. At Microsoft, it quickly became evident that working centrally is more economic and brings about faster results. When each new subject area was onboarded, we experienced even greater economies of scale that allowed for leveraging and contributing across the entire platform, reinforcing our underlying data culture.

Consider an example: Our BI platform delivers core dimensions, facts, and business logic for Finance, Sales, and Marketing. It also defines hundreds of Key Performance Indicators (KPIs). Now, an analyst in the Power Platform business needs to prepare a leadership dashboard. Some of the KPIs, like revenue and pipelines, come directly from the BI platform. Others, however, are based on more granular needs of the business. One such need is for a KPI on user adoption of Power BI-specific feature: dataflows. So, the analyst produces a Power BI [composite model](composite-model-guidance.md) to integrate core BI platform data with departmental data. They then add business logic to define their departmental KPIs. Finally, they author their leadership dashboard based on the new model, which leverages the company-wide COE resources amplified with local knowledge and data.

Importantly, a division of responsibility between the core and satellite COEs allows departmental analysts to focus on breaking new ground, rather than managing a data platform. At times, there can even be a mutually beneficial relationship between the satellite COEs and the core COE. For example, a satellite COE may define new metrics that—having proved beneficial to their department—end up as core metrics beneficial to the entire company, available from—and supported by—the core COE.

## BI platform

In your organization, the COE might be recognized by a different name, like the BI team or group. The name matters less than what it actually does. If you don't have a formalized team, we recommend you cultivate a team that brings together your core BI experts to establish your BI platform.

At Microsoft, the COE is known as the BI Platform. It has many stakeholder groups representing different divisions within the company like Finance, Sales, and Marketing. It's organized to run [shared capabilities](#shared-capabilities) and [dedicated deliveries](#dedicated-deliveries).

:::image type="content" source="media/center-of-excellence-establish/business-intelligence-platform-operating-model.png" alt-text="Diagram shows the shared capabilities and dedicated deliveries, which are described in the following sections.":::

### Shared capabilities

Shared capabilities are required to establish and operate the BI platform. They support all stakeholder groups that fund the platform. They comprise the following teams:

- **Core platform engineering:** We designed the BI platform with an engineering mindset. It's really a set of frameworks that support data ingestion, processing to enrich the data, and delivery of that data in BI semantic models for analyst consumption. Engineers are responsible for the technical design and implementation of the core BI platform capabilities. For example, they design and implement the data pipelines.
- **Infrastructure and hosting:** IT engineers are responsible for provisioning and managing all Azure services.
- **Support and operations:** This team keeps the platform running. Support looks after user needs like data permissions. Operations keep the platform running, ensuring that Service Level Agreements (SLAs) are met, and communicating delays or failures.
- **Release management:** Technical program managers (PMs) release changes. Changes can range from platform framework updates to change requests made to BI semantic models. They're the last line of defense to ensure changes don't break anything.

### Dedicated deliveries

There's a dedicated delivery team for each stakeholder group. It typically consists of a data engineer, an analytics engineer, and a technical PM—all funded by their stakeholder group.

## BI team roles

At Microsoft, our BI platform is operated by scalable teams of professionals. Teams are aligned to dedicated and shared resources. Today, we have the following roles:

- **Program managers:** PMs are a dedicated resource. They act as the primary contact between the BI team and stakeholders. It's their job to translate stakeholder business requirements to a technical specification. And, they manage the prioritization of stakeholder deliverables.
- **Database leads:** They're a dedicated resource responsible for onboarding new semantic models into the centralized data warehouse. Onboarding a semantic model can involve setting up conformed dimensions, adding business logic and custom attributes, and standard names and formatting.
- **Analytics leads:** They're a dedicated resource responsible for the design and development of BI semantic models. They strive to apply a consistent architecture using standard naming and formatting. Performance optimization is an important part of their role.
- **Operations and infrastructure:** They're a shared resource responsible for managing jobs and data pipelines. They're also responsible for managing Azure subscriptions, Power BI capacities, virtual machines, and data gateways.
- **Support:** They're a shared resource responsible for writing documentation, organizing training, communicating BI semantic model changes, and answering user questions.

## Governance and compliance

For each stakeholder group, PM leads provide cross-program governance and oversight. Its overriding goal is to ensure investments in IT generate business value and mitigate risk. Steering committee meetings are held on a regular basis to review progress and approve major initiatives.

## Grow your own community

Establish and grow a community within your organization by:

- Holding regular "Office Hours" events that sets aside time with the BI team to allow people to ask questions, make suggestions, share ideas, and even lodge complaints.
- Creating a Teams channel to provide support and encourage anyone to ask and respond to posted questions.
- Run and promote informal user groups and encourage employees to present or attend.
- Run more formal training events on specific products and the BI platform itself. Consider delivering [Power BI Dashboard in a Day](https://powerbi.microsoft.com/diad/), which is available as a free course kit and is a great way to introduce employees to Power BI for the first time.

## Related content

For more information about this article, check out the following resources:

- [BI solution architecture in the COE](center-of-excellence-business-intelligence-solution-architecture.md)
- [Fabric adoption roadmap: Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

In the [next article in this series](center-of-excellence-business-intelligence-solution-architecture.md), learn about BI solution architecture in the COE and the different technologies employed.

### Professional services

Certified Power BI partners are available to help your organization succeed when setting up a COE. They can provide you with cost-effective training or an audit of your data. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).

You can also engage with experienced consulting partners. They can help you [assess](https://appsource.microsoft.com/en-us/marketplace/consulting-services?product=power-bi&serviceType=assessment&country=ALL&region=ALL), [evaluate](https://appsource.microsoft.com/en-us/marketplace/consulting-services?product=power-bi&serviceType=proof-of-concept&country=ALL&region=ALL), or [implement](https://appsource.microsoft.com/en-us/marketplace/consulting-services?product=power-bi&serviceType=implementation&country=ALL&region=ALL&page=1) Power BI.
