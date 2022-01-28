---
title: "Power BI usage scenarios"
description: "An overview of the Power BI implementation planning usage scenario articles."
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 01/31/2022
---

# Power BI usage scenarios

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

The Power BI ecosystem is diverse and can be implemented in different ways. In this series of articles, common usage scenarios are provided to illustrate different ways that Power BI can be deployed and utilized by creators and consumers. Understanding how these usage scenarios are used in your organization, and by whom, can influence the implementation strategies you decide to take.

> [!NOTE]
> The most prevalent components of Power BI are identified in each scenario based on how Power BI is intended to be used for that scenario. The objective is *not* to call out every possible option for each usage scenario. Rather, each diagram depicts the primary features that are most relevant for that scenario.

## How to use the scenarios

Use the scenarios to help you with Power BI architecture planning and implementation decisions. Here are some suggestions:

- Initially read the scenarios in the order they're documented. Become familiar with the concepts and how the scenarios build upon each other.
- Focus on the scenarios that align well with your [data culture](powerbi-adoption-roadmap-data-culture.md). Also consider how [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) is handled, as well as [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) when determining which usage scenarios are a good fit.
- Consider which areas of your BI operations should be strengthened in your organization. For example, if your goal is to reduce the level of data duplication, focus on the [managed self-service BI](#todo) scenario. If your goal is to improve efficiency of data preparation efforts, focus on the [self-service data preparation](#todo) scenario.
- Determine if there are ways to use Power BI that will bring additional value or reduce risk for your organization. For example, if your goal is to achieve a balance between centralization and decentralization (described further in the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) articles), consider the [customizable managed self-service BI](#todo) scenario.
- After understanding the areas of your BI operations that you want to implement or strengthen, create a project plan that defines tactical steps to arrive at your desired future state.

> [!TIP]
> You may need to mix and match the ideas described in the usage scenarios to create a Power BI implementation strategy that fits your situation. To support the needs of users from different departments and business units, expect to draw from multiple Power BI implementation methods simultaneously. That way you'll be able to support diverse content creators and various solutions.

## Content collaboration and delivery scenarios

The following usage scenarios focus on *content collaboration and delivery*, which focus primarily on [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md), and [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md). These scenarios are inter-related. They build upon each other in a way that aligns with how business intelligence teams evolve and grow over time.

### Personal BI

In the *personal BI* scenario, the content creator has a lot of freedom and flexibility to create content for individual usage. The personal BI scenario describes using a personal workspace for private usage.

### Team BI

In the *team BI* scenario, the primary focus is on informal collaboration among team members who work closely together on a team. This scenario describes using a workspace for both collaboration and distribution. It also showcases the value of using Microsoft Teams for collaboration between Power BI creators and consumers.

### Departmental BI

In the *departmental BI* scenario, there's a focus on distributing content to a larger number of users within a department or business unit. This scenario describes using a Power BI app for distributing content.

### Enterprise BI

In the *enterprise BI* scenario, the primary focus is on content distribution at scale. This scenario describes using Premium capacity to distribute content to a larger number of read-only consumers who have a Power BI free license.

> [!NOTE]
> Additional information about [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) and [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) are described in the [Power BI adoption roadmap](powerbi-adoption-roadmap-overview.md).

## Self-service BI scenarios

Four usage scenarios focus on supporting *self-service BI* activities, in which analytical responsibilities are handled by people throughout many areas of the organization. The content collaboration and delivery scenarios (described in the previous group of scenarios) also include aspects of self-service BI but from a slightly different viewpoint. The intention of this set of scenarios is to focus on several important aspects to plan for in a Power BI implementation.

The self-service BI scenarios presented here primarily emphasize the use of *managed self-service BI* in which data management is centralized. Reusability of this centralized data is one of the primary goals. Business users take responsibility for creation of reports and dashboards.

### Managed self-service BI

The goal for the *managed self-service BI* scenario is for many report creators to reuse shared datasets. This scenario describes decoupling the report creation process from the dataset creation process. To encourage report authors to find and reuse an existing shared dataset, it should be endorsed and made discoverable in the datasets hub in the Power BI service.

### Customizable managed self-service BI

In the *customizable managed self-service BI* scenario, the focus is on the dataset creator customizing or extending an existing dataset to satisfy new requirements. This scenario describes publishing a customized data model where some tables are new while others are dependent on the existing shared dataset.

### Self-service data preparation

The *self-service data preparation* scenario focuses on centralizing data preparation activities to improve consistency and reduce effort. This scenario describes creating Power BI dataflows to avoid repeating data preparation Power Query logic in many different Power BI Desktop files. A dataflow can be consumed as a data source by numerous datasets.

### Prototyping and data sharing

Prototyping techniques are very useful for validating requirements for visuals and calculations by subject matter experts. Prototyping solutions may be temporary, short-lived solutions, or they may ultimately evolve into a solution that is fully validated and released. This scenario describes using Power BI Desktop during an interactive prototyping session. It is followed by sharing in the Power BI service when additional feedback is needed from a subject matter expert.

> [!NOTE]
> Additional information about [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md), and [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md), which affect self-service BI activities and decisions, are described in the [Power BI adoption roadmap](powerbi-adoption-roadmap-overview.md).

## Content management and deployment scenarios

The following *content management and deployment* scenarios describe approaches for how content creators and owners use methodical and disciplined lifecycle management processes to reduce errors, minimize inconsistencies, and improve the user experience for consumers.

### Self-service content publishing

The *self-service content publishing* scenario focuses on ensuring that content is stable for consumers. This scenario describes using a Power BI deployment pipeline to publish content through development, test, and production workspaces. It also describes how (optionally) Premium per user license mode can be used for development and test workspaces, and Premium per capacity license mode for the production workspace.

### Advanced data model management

*The article for this scenario is coming soon.*

The *advanced data model management* scenario focuses on using more sophisticated techniques. This scenario describes managing a data model using Tabular Editor, which is an external tool. The data model is deployed to the Power BI service using the XMLA endpoint available with Power BI Premium.

### Enterprise content publishing

*The article for this scenario is coming soon.*

The *enterprise content publishing* scenario focuses on using more sophisticated and programmatic techniques to publish content through development, test, and production workspaces. Azure DevOps coordinates and executes Power BI REST API operations to deploy content.

## Real-time scenarios

*The articles for this scenario is coming soon.*

*Real-time* scenarios describe different techniques to allow presenting data updates in near real-time. Monitoring data in real-time allows the organization to react faster when time-sensitive decisions are necessary.

## Embedding and hybrid scenarios

*The articles for this scenario is coming soon.*

There are two *embedding and hybrid* scenarios: enterprise embedding and on-premises reporting. They describe ways to deploy and distribute content that can be used in addition to, or instead of, the Power BI service.

### Enterprise embedding

*The article for this scenario is coming soon.*

The *enterprise embedding* scenario focuses on making analytical data easier for business users to access by integrating visuals within the tools and applications they use every day. This scenario describes using the Power BI REST APIs to embed content in a custom application.

### On-premises reporting

The *on-premises reporting* scenario focuses on using a basic portal for publishing, sharing, and consuming business intelligence content within your organizational network. This scenario describes using Power BI Report Server for this purpose.

## Next steps

In the [next article in this series](#todo), learn about the first usage scenario.

## Todo

*Remove this section once all links are set.*
