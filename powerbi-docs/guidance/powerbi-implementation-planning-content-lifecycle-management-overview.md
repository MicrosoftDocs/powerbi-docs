---
title: "Power BI implementation planning: Content lifecycle management"
description: "This article introduces the Power BI content lifecycle management planning articles."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 04/24/2024
---

# Power BI implementation planning: Content lifecycle management

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces the content lifecycle management series of articles, which helps you to plan how to manage the lifecycle of your Power BI content. The series of articles is primarily targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators might need to collaborate with other administrators, like those who oversee Microsoft 365 or Azure DevOps.
- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content. These teams might also include roles like release managers who handle the lifecycle of content releases, or engineers who create and manage the components needed to effectively use and support lifecycle management.
- **Content creators and content owners:** Users who create Power BI content that they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the content that they create.

To ensure that you deliver reliable and useful Power BI content to consumers, it's important to follow effective content _lifecycle management_ practices. Lifecycle management refers to how you handle content from creation to publication (or _deployment_), including retiring content when users no longer need it. Planning your lifecycle management strategy for Power BI content is an essential step to scale and grow for successful [enterprise](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md) and [self-service analytics](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md).

> [!NOTE]
> This series provides an overview of Power BI content lifecycle management. It focuses on key considerations and guidance to plan your content lifecycle management strategy. These articles describe different approaches to lifecycle management from smaller, self-service environments, to more sophisticated enterprise scenarios.
>
> This series focuses primarily on the Power BI workload within [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview). However, the underlying concepts can also be relevant for the other Fabric workloads. Some lifecycle management features discussed in this series can also be used for other items in Fabric.

## The Power BI content lifecycle

The following diagram depicts a typical Power BI content lifecycle.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-overview/content-lifecycle-management.svg" alt-text="Diagram shows the Power BI content lifecycle. A description of each of the six stages of the lifecycle follows this diagram." border="false":::

> [!TIP]
> For guidance about how to plan and create Power BI content, see [BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md).

The six stages shown in the diagram include:

1. **[Plan and design content](powerbi-implementation-planning-content-lifecycle-management-plan-design.md):** You typically collect requirements, design the solution, and make key lifecycle management decisions to start Power BI content creation.
2. **[Develop content and manage changes](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md):** You begin to create content and use _version control_ (or _source control_) to track and manage content changes during development.
3. **[Validate content](powerbi-implementation-planning-content-lifecycle-management-validate.md):** You routinely test content to ensure quality results and to prevent changes in existing content from causing new issues.
4. **[Deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md):** When ready, you deploy content to a workspace, or promote it between different environments (like promoting content from a test to a production workspace).
5. **[Support and monitor content](powerbi-implementation-planning-content-lifecycle-management-support-monitor.md):** After it's published, you support content by addressing issues or requests from users. Supporting and monitoring content often leads to planning and creating more content. You also monitor the deployed content to ensure it's reliable.
6. **[Retire and archive content](powerbi-implementation-planning-content-lifecycle-management-retire-archive.md):** When consumers no longer need or use content, you should retire it. When you retire content, you typically remove and archive it for later reference, if needed.

Each of these stages is described in detail in the articles in this series on content lifecycle management. The guidance in these articles helps you to determine your approach to manage your Power BI content.

## Approaches to manage the content lifecycle

You can manage the lifecycle of Power BI content by using different approaches. These approaches vary in their complexity and robustness, depending on the components and processes you use.

Typically, different approaches range from simple to advanced.

- _Simpler_ approaches are typically useful for self-service developers. These approaches involve fewer steps and components to manage, but don't provide the detail and level of control that a [departmental](powerbi-implementation-planning-usage-scenario-departmental-bi.md) or [enterprise](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) usage scenario might need. [Self-service content publishing](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md) is an example of a simpler approach to lifecycle management.
- _Advanced_ approaches are typically preferred by larger teams that collaborate on larger or more complex solutions. Because their solutions are more complex, these teams often have a greater need for more automation, customization, and sustainability to manage content. As such, these approaches typically involve more robust and sophisticated processes. However, these processes could be too intricate for smaller deployments, such as [personal](powerbi-implementation-planning-usage-scenario-personal-bi.md) or [team](powerbi-implementation-planning-usage-scenario-team-bi.md) usage scenarios. [Enterprise content publishing](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md) is an example of an advanced approach to lifecycle management.

For each stage of the content lifecycle, the following diagram depicts some examples of components you might use for simpler or more advanced lifecycle management approaches.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-overview/content-lifecycle-management-different-approaches.svg" alt-text="Diagram shows approaches to lifecycle management ranging from simple to advanced." border="false":::

The diagram depicts the following components for each stage in the content lifecycle. The components are examples. The first example is how you might achieve a simple lifecycle management approach; the second example is how you might achieve an advanced lifecycle management approach.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | You can plan and design content by using Microsoft Teams to collaborate in teams, or by using Azure DevOps to collaborate in projects. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | You can develop content and manage changes by using OneDrive for Business (also known as OneDrive for work or school) to conduct file version control, or by using Azure Repos in Azure DevOps for metadata source control. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | You can validate content by using Power BI to conduct manual testing, or Azure Test Plans in Azure DevOps to conduct automated testing. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | You can deploy content by using Power BI deployment pipelines, or by using Azure Pipelines in Azure DevOps to orchestrate CI/CD (continuous integration/continuous deployment). |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | You can support and monitor content by using the default Power BI monitoring reports, like those found in the [admin monitoring workspace](/fabric/admin/monitoring-workspace), or by creating your own customized monitoring report with [Azure Log Analytics integration](../transform-model/log-analytics/desktop-log-analytics-overview.md). |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | You can retire and archive content by using OneDrive for Business (also known as OneDrive for work or school) to archive and store files, or by using Azure Repos in Azure DevOps to archive metadata. |

Choosing how you approach content lifecycle management depends on your needs and other factors. Here are some key factors to consider as you go through the content in this series.

- **Who will create the content:** Content creators have varying needs, skills, and workflows. Each of these factors can influence the success of different lifecycle management approaches. What works for a larger central team that manages enterprise environments might not be effective for a small, decentralized team that delivers content to a small audience.
- **Whether there's collaborative content creation:** When content creators work together on the same content, there's a higher likelihood of inconsistency and disruption. For example, one creator could overwrite the changes of another. Effective lifecycle management is essential in collaboration to avoid wasted time and enhance productivity.
- **What the type and scope of content is:** Different content may require different approaches. Business-critical content with a high number of consumers should have a more robust lifecycle management approach. Conversely, a small prototype may only require a minimal approach, like removing and archiving it once it's served its purpose.
- **What licensing is in place:** Different lifecycle management options are available depending on the Fabric or Power BI licenses you have. For instance, [Premium features](../enterprise/service-premium-features.md) like deployment pipelines are available only for [Fabric or Premium capacities](/fabric/enterprise/licenses) or users with [Premium Per User (PPU) licenses](../enterprise/service-premium-per-user-faq.yml). However, [Fabric Git integration](/fabric/cicd/git-integration/intro-to-git-integration) is only available with Fabric capacity.
- **How content creators deliver content:** Content creators who use different [content delivery scopes](fabric-adoption-roadmap-content-delivery-scope.md) might need different approaches to manage that content. A team that distributes content to an internal audience by using [Power BI apps](../consumer/end-user-apps.md) will likely require a different approach than a team that distributes [embedded content for external customers](powerbi-implementation-planning-usage-scenario-embed-for-your-customers.md).
- **How mature the Power BI or Fabric implementation is:** When your implementation reaches a certain scale, more decisions and actions depend on Power BI content. To avoid disruption, content lifecycle management becomes more important as you scale and grow.

> [!IMPORTANT]
> There are many other valid approaches to manage the lifecycle of your Power BI content. Select and plan an approach that best fits your [content ownership](powerbi-adoption-roadmap-content-ownership-and-management.md) and [content delivery scope](powerbi-adoption-roadmap-content-delivery-scope.md) strategies, and which helps you meet your needs and achieve your [BI objectives](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md).

## Related content

In the [next article in this series](powerbi-implementation-planning-content-lifecycle-management-plan-design.md), learn how to plan and design content as part of managing the content lifecycle.
