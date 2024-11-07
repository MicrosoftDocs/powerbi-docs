---
title: "Power BI usage scenarios"
description: "An overview of the Power BI implementation planning usage scenario articles."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/09/2023
---

# Power BI usage scenarios

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

The Power BI ecosystem is diverse and can be implemented in different ways. In this series of articles, common usage scenarios are provided to illustrate different ways that Power BI can be deployed and utilized by creators and consumers. Understanding how these usage scenarios are used in your organization, and by whom, can influence the implementation strategies you decide to take.

> [!NOTE]
> The most prevalent components of Power BI are identified in each scenario based on how Power BI is intended to be used for that scenario. The objective is *not* to call out every possible option for each usage scenario. Rather, each scenario diagram depicts the primary features that are most relevant for that scenario.

## How to use the scenarios

Use the scenarios to help you with Power BI architecture planning and implementation decisions. Here are some suggestions:

- Initially read the scenarios in the order they're documented. Become familiar with the concepts and how the scenarios build upon each other.
- Focus on the scenarios that align well with your [data culture](fabric-adoption-roadmap-data-culture.md). Also consider how [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) is handled, as well as [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) when determining which usage scenarios are a good fit.
- Consider which areas of your BI operations could be strengthened in your organization. For example, if your goal is to reduce the level of data duplication, focus on the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) scenario. If your goal is to improve efficiency of data preparation efforts, focus on the [self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md) scenario.
- Determine if there are ways to use Power BI that will bring additional value or reduce risk for your organization. For example, if your goal is to achieve a balance between centralization and decentralization (described further in the [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) articles), consider the [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) scenario.
- After understanding the areas of your BI operations that you want to implement or strengthen, create a project plan that defines tactical steps to arrive at your desired future state.

> [!TIP]
> You might need to mix and match the ideas described in the usage scenarios to create a Power BI implementation strategy that fits your circumstances. To support the needs of users from different departments and business units, expect to draw from multiple Power BI implementation methods simultaneously. That way, you'll be able to support diverse content creators and various solutions.

## Content collaboration and delivery scenarios

The following usage scenarios are about *content collaboration and delivery*. These initial four scenarios focus primarily on [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md), and [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md). They are inter-related, building upon each other in a way that aligns with how business intelligence teams evolve and grow over time. They can be thought of as the building blocks that other scenarios build upon—particularly the [self-service BI scenarios](#self-service-bi-scenarios) that are described in the next section. Therefore, it's a good idea to review those scenarios first.

- **[Personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md):** The content creator has a lot of freedom and flexibility to create content for individual usage. This scenario describes using a personal workspace for private usage.
- **[Team BI](powerbi-implementation-planning-usage-scenario-team-bi.md):** The primary focus is on informal collaboration among team members who work closely together on a team. This scenario describes using a workspace for both collaboration and distribution. It also showcases the value of using Microsoft Teams for collaboration between Power BI creators and consumers.
- **[Departmental BI](powerbi-implementation-planning-usage-scenario-departmental-bi.md):** There's a focus on distributing content to a larger number of users within a department or business unit. This scenario describes using a Power BI app for distributing content.
- **[Enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md):** The primary focus is on content distribution at scale. This scenario describes using Premium capacity to distribute content to a larger number of read-only consumers who have a Fabric free license.

    > [!NOTE]
    > Additional information about [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) and [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md) are described in the [Fabric adoption roadmap](fabric-adoption-roadmap.md).

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

## Self-service BI scenarios

Four usage scenarios focus on supporting *self-service BI* activities, in which analytical responsibilities are handled by people throughout many areas of the organization. The content collaboration and delivery scenarios (described in the previous group of scenarios) also include aspects of self-service BI but from a slightly different viewpoint. The intention of this set of scenarios is to focus on several important aspects to plan for in a Power BI implementation.

The self-service BI scenarios presented here primarily emphasize the use of *managed self-service BI* in which data management is centralized. Reusability of this centralized data is one of the primary goals. Business users take responsibility for creation of reports and dashboards.

- **[Managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md):** The goal is for many report creators to reuse shared semantic models. This scenario describes decoupling the report creation process from the semantic model creation process. To encourage report authors to find and reuse an existing shared semantic model, it should be endorsed and made discoverable in the data hub in the Power BI service.
- **[Customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md):** The focus is on the semantic model creator customizing or extending an existing semantic model to satisfy new requirements. This scenario describes publishing a customized data model where some tables are new while others are dependent on the existing shared semantic model.
- **[Self-service data preparation](powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md):** The focus is on centralizing data preparation activities to improve consistency and reduce effort. This scenario describes creating Power BI dataflows to avoid repeating data preparation Power Query logic in many different Power BI Desktop files. A dataflow can be consumed as a data source by numerous semantic models.
- **[Advanced data preparation](powerbi-implementation-planning-usage-scenario-advanced-data-preparation.md):** The focus is on improving the reach and reusability of dataflows for multiple users, teams, and use cases. This scenario describes use of multiple workspaces based on purpose: staging, cleansed, and final.
- **[Self-service real-time analytics](powerbi-implementation-planning-usage-scenario-self-service-real-time-analytics.md):** The focus is on how a business analyst can produce real-time Power BI reports.
- **[Prototyping and sharing](powerbi-implementation-planning-usage-scenario-prototyping-and-sharing.md):** Prototyping techniques are very useful for validating requirements for visuals and calculations by subject matter experts. Prototyping solutions might be temporary, short-lived solutions, or they might ultimately evolve into a solution that's fully validated and released. This scenario describes using Power BI Desktop during an interactive prototyping session. It's followed by sharing in the Power BI service when additional feedback is needed from a subject matter expert.

    > [!NOTE]
    > Additional information about [content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md), and [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md), which affect self-service BI activities and decisions, are described in the [Fabric adoption roadmap](fabric-adoption-roadmap.md).

## Content management and deployment scenarios

The following *content management and deployment* scenarios describe approaches for how content creators and owners use methodical and disciplined lifecycle management processes to reduce errors, minimize inconsistencies, and improve the user experience for consumers.

- **[Self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md):** The focus is on ensuring that content is stable for consumers. This scenario describes using a Power BI deployment pipeline to publish content through development, test, and production workspaces. It also describes how (optionally) Premium per user license mode can be used for development and test workspaces, and Premium per capacity license mode for the production workspace.
- **[Enterprise content publishing](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md):** The focus is on using more sophisticated and programmatic techniques to publish content through development, test, and production workspaces. In this scenario, it describes how you can use Azure DevOps to orchestrate collaboration and content publication.
- **[Advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md):** The focus is on empowering creators with advanced data modeling and publishing capabilities. This scenario describes managing a data model by using Tabular Editor, which is a third-party tool. Data modelers publish their models to the Power BI service by using the XMLA endpoint, which is available with Power BI Premium.

## Embedding and hybrid scenarios

There are two *embedding and hybrid* scenarios: content embedding and on-premises reporting. They describe ways to deploy and distribute content that can be used in addition to, or instead of, the Power BI service.

- **[Embed for your organization](powerbi-implementation-planning-usage-scenario-embed-for-your-organization.md):** The focus is on making analytical data easier for business users to access by integrating visuals within the tools and applications they use every day. This scenario describes using the Power BI REST APIs to embed content in a custom application for users who have permission and appropriate licenses to access Power BI content in your organization.
- **[Embed for your customers](powerbi-implementation-planning-usage-scenario-embed-for-your-customers.md):** This scenario describes using the Power BI REST APIs to embed content in a custom application for users who don't have permission or appropriate licenses to access Power BI content in your organization. The custom application requires an embedding identity that has permission and an appropriate license to access Power BI content. The custom application could be a multitenancy application.
- **[On-premises reporting](powerbi-implementation-planning-usage-scenario-on-premises-reporting.md):** The focus is on using a basic portal for publishing, sharing, and consuming business intelligence content within your organizational network. This scenario describes using Power BI Report Server for this purpose.

## Download the scenario diagrams

Each of the usage scenario articles contains a scenario diagram. We encourage you to download the [scenario diagrams](powerbi-implementation-planning-usage-scenario-diagrams.md) if you'd like to embed them in your presentations, documentation, or blog posts—or print them out as wall posters. Because they're Scalable Vector Graphics (SVG) images, you can scale them up or down without any loss of quality.

## Related content

In the [next article in this series](powerbi-implementation-planning-usage-scenario-personal-bi.md), learn about enabling private analytics for an individual with the personal BI usage scenario.
