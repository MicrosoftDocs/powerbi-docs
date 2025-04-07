---
title: "Power BI implementation planning: BI strategy overview"
description: "This article introduces the Power BI strategy planning articles."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: BI strategy

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces the business intelligence (BI) strategy series of articles. The BI strategy series is targeted at multiple audiences:

- **Executive leadership**: Individuals who are responsible for defining organizational objectives and strategies, like the Microsoft Fabric or Power BI executive sponsor or a Chief Executive Officer (CEO), Chief Information Officer (CIO), or Chief Data Officer (CDO).
- **BI and analytics directors or managers**: Decision makers who are responsible for overseeing the BI program and BI strategic planning.
- **Center of Excellence (COE), IT, and BI teams**: The teams that are responsible for tactical planning, measuring, and monitoring progress toward the BI key results. These teams also plan key initiatives and solutions.
- **Subject matter experts (SMEs) and content owners and creators**: The teams and individuals that champion analytics in a team or department and conduct BI solution planning. These teams and individuals are responsible for supporting the strategy and data needs of their business area.

Defining your BI strategy is essential to get the most business value from data and analytics. Having a clearly defined BI strategy is important to ensure efforts are aligned with organizational priorities. In some circumstances, it's particularly important.

We recommend that you pay special attention to these articles if your organization is:

- **Migrating to, or implementing, Fabric or Power BI for the first time**: A clear BI strategy is crucial to the successful implementation of any new platform or tool.
- **Experiencing significant growth of Fabric or Power BI usage**: A BI strategy brings clarity and structure to organic adoption, helping to enable users while mitigating risk.
- **Seeking to become data-driven or achieve digital transformation**: A BI strategy is critical to modernizing your organization and helping you to achieve a competitive advantage.
- **Experiencing significant business or technological change**: Planning your BI strategy ensures that your organization can use change as momentum and not as an obstacle.
- **Reevaluating your business strategy**: Your business strategy should influence your BI strategy, which in turn can lead to changes in your business strategy. All strategies should be in alignment in order to achieve your organizational objectives.

In short, this series of articles is about defining a BI strategy. It describes what a BI strategy is, why it's important, and how you can plan your BI strategy. The articles in this series are intended to complement the [Fabric adoption roadmap](fabric-adoption-roadmap.md).

## Become data-driven with a BI strategy

Successful adoption and implementation of analytics solutions helps an organization meet their business objectives. To achieve successful adoption and implementation, you need a _BI strategy_. A BI strategy might sometimes be described as an _analytics strategy_ or _becoming data driven_.

A BI strategy is a plan to implement, use, and manage data and analytics to better enable your users to meet their business objectives. An _effective_ BI strategy ensures that data and analytics support your business strategy.

### Relationship between BI strategy and business strategy

Your business strategy should directly inform your BI strategy. As your business objectives evolve, your BI processes and tools might also need to evolve, especially as new data needs arise. New opportunities and insights learned from BI solutions can also lead to changes to your business strategy. Understanding and supporting the relationship between your business and BI strategies is essential in order to make valuable BI solutions, and to ensure that people use them effectively.

The following diagram depicts how a BI strategy supports the business strategy by enabling business users.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/business-strategy.svg" alt-text="Diagram shows the purpose of a BI strategy is to support the business strategy by enabling business users. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts the following concepts.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The business strategy describes how the organization will achieve its business objectives. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The business strategy directly informs the BI strategy. The primary purpose of the BI strategy is to support—and potentially inform—the business strategy. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The BI strategy is a plan to implement, use, and manage data and analytics. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | BI objectives define how BI will support the business objectives. BI objectives describe the desired future state of the BI environment. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | To make progress toward your BI objectives, you identify and describe BI key results that you want to achieve in a specific time period. These key results describe paths to your desired future state. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | To achieve your BI key results, you plan and implement BI solutions and initiatives. A solution might be developed by a central IT or BI team, or by a member of the community of practice as a self-service solution. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | The purpose of BI solutions and initiatives is to enable business users to achieve their key results. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Business users use BI solutions and initiatives to make informed decisions that lead to effective actions. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Business users follow through on the business strategy with their achieved results. They achieve these results by taking the right actions at the right time, which is made possible in part by an effective BI strategy. |

[!INCLUDE [powerbi-implementation-planning-bi-strategy-context](includes/powerbi-implementation-planning-bi-strategy-context.md)]

Consider the following, high-level example for a hypothetical organization.

| Area | Example |
| --- | --- |
| **Business strategy** | The organizational objective is to improve customer satisfaction and reduce customer churn. One business strategy to achieve this objective is to reduce the number of late customer deliveries. |
| **BI strategy** | &bull;&nbsp;**BI objective**: To support the business strategy, the BI objective is to improve the effectiveness of orders and deliveries reporting.  <br/><br/>&bull;&nbsp;**BI key results**: To achieve the BI objective, the organization defines specific BI key results for the quarter. One such key result is to reduce the time to produce reports about on-time delivery by 80%, so that reports are available daily, instead of weekly. Another key result is to provide combined inventory and orders data for the largest distribution center. Demand planners can use inventory data to improve delivery planning. <br/><br/>&bull;&nbsp;**BI solutions and initiatives**: To achieve these BI key results, the organization plans BI solutions and initiatives, like implementing automated data pipelines, and a consolidated data lakehouse that stores business-ready orders and inventory data to support reporting and analytics. They enact a training program to enable users to make the most of the newly available data. |
| **Business users** | Enabled by these BI solutions and initiatives, business users can more effectively identify and mitigate potential late deliveries. These solutions result in fewer late deliveries and improved customer satisfaction, allowing the organization to achieve progress toward its business objectives. |

### Relationship between BI strategy and data strategy

Your BI strategy describes how [successful Fabric adoption](fabric-adoption-roadmap.md#microsoft-fabric-adoption) and [Power BI implementation](powerbi-implementation-planning-introduction.md) will deliver business value to your organization. However, a BI strategy transcends tools and technologies. While your BI strategy might start small, it can grow to encompass all of your analytical data, tools, and processes when you experience success. Furthermore, the concepts in a BI strategy are also important in a broader _data strategy_. While a BI strategy is about the use of data and tools for analytical purposes, a data strategy is concerned with the wider management and use of data within the organization. Thus, your BI strategy is a subset of your data strategy, as they share many related concepts.

The following diagram depicts how a BI strategy is a subset of a data strategy, and how they share concepts related to data culture and technology.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/data-strategy.svg" alt-text="Diagram shows that a BI strategy is a subset of a data strategy. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts the following concepts.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | A data strategy describes the focus areas and objectives for the wider use and management of data in an organization. A data strategy encompasses more than only BI. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The BI strategy is a subset of a data strategy. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | [Data culture](fabric-adoption-roadmap-data-culture.md#data-culture-vision) is important in both a BI strategy and a data strategy. Different data culture areas describe a vision for behaviors, values, and processes that enable people to work effectively with data. An example of a data culture area is data literacy. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Technology is important in both a BI strategy and a data strategy. Different technical areas support the business data needs and use cases. An example of a technical area is data visualization. |

A BI strategy can encompass many data culture and technical areas. However, when planning your BI strategy, you should be cautious not to attempt to address too many of these areas at first. A successful BI strategy starts small. It focuses on a few focus areas and broadens scope over time, ensuring consistent progress. Later, as you experience sustainable success with your BI strategy, it can incrementally evolve to encompass more areas.

> [!IMPORTANT]
> This series of BI strategy articles focuses on the Power BI workload in Fabric. However, planning a BI strategy is a technology-agnostic exercise. As such, the concepts described in the articles can apply irrespective of your chosen BI tools and technologies.

## Defining a BI strategy

There are many ways to define a BI strategy. Typically, when you define a BI strategy, you begin by identifying the focus areas for which you describe your BI objectives. Based upon these objectives, you define time-bound, prioritized actions in key results. To achieve these key results, you build solutions and enact specific key initiatives. You then incrementally scale your BI strategy to encompass more focus areas and additional objectives as you experience success.

The following diagram depicts how you can define your BI strategy at three different planning levels, as depicted in the following diagram.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/three-levels-bi-strategy.svg" alt-text="Diagram shows the three levels of a BI strategy. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts the following three planning levels.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | **Strategic planning**: You begin by defining your strategic BI focus areas and objectives, and how they support your business strategy. These BI objectives are high-level descriptions of what you want to achieve and why. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | **Tactical planning**: You then identify your specific BI key results. These key results are specific, measurable, short-term actions that describe how you'll make progress toward your long-term, strategic BI objectives. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | **Solution planning**: The BI solutions and initiatives that you create should be a direct result of tactical planning. These solutions enable you to achieve your BI key results and make progress toward your BI objectives. |

> [!IMPORTANT]
> Defining a BI strategy requires prioritization, planning, and active involvement from many teams and individuals across your organization.

### BI strategy example

The following high-level, hypothetical example explains how you can transition from business objectives to BI objectives. It then explains how to transition from BI objectives to key results, and then to BI solutions and initiatives.

#### Business objectives and strategy

In this example, the organization has set an objective to increase sales effectiveness. One strategy the business uses to achieve this objective is to sell more high-margin products to its top customers.

#### BI focus areas and objectives

To achieve the business strategy, the organization wants the salespeople to adopt data-driven decision making. To this end, the BI team works with the sales teams to understand their data needs, and to define long-term, strategic BI focus areas and objectives.

In this example, the BI focus areas and objectives are:

- **Data literacy**: Improve the ability of the salespeople to make decisions based on data and report visualizations.
- **Content ownership**: Clarify who owns the data and reporting items for different use cases.
- **Mentoring and user enablement**: More effectively enable the salespeople with the skills and tools to answer questions with data.
- **Governance**: More effectively balance governance risk and enablement of the sales teams.
- **Data engineering**: Create a unified view of sales and profitability data for analytics.

> [!NOTE]
> In this example, many other factors might be important. However, the organization has identified these particular focus areas and objectives to support the business strategy.

#### Key results

To achieve their BI objectives, the BI team conducts tactical planning to identify and describe their short-term key results. The BI team creates an introductory [data literacy](fabric-adoption-roadmap-data-culture.md#data-literacy) program for the salespeople. Also, the BI team drafts a user enablement plan and an accountability plan for salespeople who want to perform self-service analytics. These plans allow the salespeople to request access to data after they've completed specific training materials and signed a [self-service user acknowledgment](fabric-adoption-roadmap-system-oversight.md#user-responsibilities).

In this example, the BI key results in the first quarter are:

- **Data literacy**: Ensure that 90 percent of the salespeople complete the data literacy program.
- **Content ownership**: Identify one champion in each sales team, and train the champions to connect to centralized semantic models and create their own reports.
- **Mentoring and user enablement**: Create a [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) in the first quarter to share [training resources](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training-resources-and-approaches), [template files](fabric-adoption-roadmap-mentoring-and-user-enablement.md#power-bi-template-files), and host weekly [office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) Q&A sessions.
- **Governance**: Reduce export activities by salespeople from centralized reports by 20%.
- **Data engineering**: Choose an architecture for consolidating sales and profitability data.
- **Data security**: Define and implement the data security rules for the sales and profitability data that salespeople will use.
- **Information protection and data loss prevention (DLP)**: Define how content creators should [endorse content](../collaborate-share/service-endorse-content.md) by promoting or certifying data items. Conduct an investigation into whether the organization needs [sensitivity labels](/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide&preserve-view=true) and DLP policies.

#### Key initiatives and solutions

To achieve its key results, the organization aims to enact the following key initiatives, or design and deploy the following BI solutions.

- Central BI teams will design and start a proof of concept for a [medallion lakehouse architecture](/azure/databricks/lakehouse/medallion) to store the sales and profitability data.
- Central BI teams will publish an enterprise semantic model as a Power BI semantic model that includes all data required for central reporting and key self-service reporting scenarios.
- Central BI teams will draft a prototype [tenant-wide monitoring solution](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md) for user activities based on data from the [Power BI activity log](../enterprise/service-admin-auditing.md).
- Security rules applied to the Power BI semantic model enforce that salespeople can only access data for their assigned customers.
- Central BI teams will create central reports that show aggregate sales and profitability across regions and product groups. These central reports will support more sophisticated analysis by using interactive visualizations.

> [!NOTE]
> This example describes a simple scenario for the purpose of explaining the three planning levels of a BI strategy. In reality, your strategic BI objectives, key results, and key initiatives and solutions are likely to be more complex.

### Iteratively plan a BI strategy

Your BI strategy should evolve as you scale and as your organization experiences change. For these reasons, planning your BI strategy is a continuous, iterative process.

Iteratively planning your BI strategy is beneficial for two reasons.

- **Incremental progress**: Define your BI strategy by focusing on your focus areas and breaking them into manageable parts. You can implement these parts in phases and complete them incrementally over multiple continuous improvement cycles. With each cycle, you can evaluate progress and lesson learned to sustainably grow your strategy. In contrast, an all-in approach can become overwhelming, running out of steam before it produces value.
- **Overcome change**: Keep pace with changes to technology and your business strategy. Iterative planning and implementation phases can help your strategy remain relevant to business data needs. In contrast, detailed, multi-year strategic plans can quickly become outdated.

It's unrealistic to expect all-encompassing, long-term planning to survive beyond 12-18 months. For instance, attempting to create an exhaustive three to five-year plan can result in over-investment, a failure to keep up with change, and an inability to support changes in your business strategy. Instead, you should define and operationalize your strategies by using iterative approaches, with achievable outcomes in a maximum period of 18 months.

There are many ways to iteratively plan your BI strategy. A common approach is to schedule planning revisions over periods that align with existing planning processes in the organization.

The following diagram depicts recommendations for how you can schedule planning revisions.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/iterative-planning.svg" alt-text="Diagram shows how to iteratively plan a BI strategy with different planning periods. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts how you can iteratively structure your BI strategy planning the following concepts.

| Item | Description |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | **Avoid detailed, long-term planning**: Long-term, detailed plans can become outdated as technology and business priorities change. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | **Strategic planning (every 12-18 months)**: This high-level planning focuses on aligning business objectives and BI objectives. It's valuable to align this strategic planning with other annualized business processes, like budgeting periods. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | **Tactical planning (every 1-3 months)**: Monthly or quarterly planning sessions focus on evaluating defining the specific, actionable, key results that are time-bound to the planning period. This planning should take iterative business feedback and changes in business or technology into account. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | **Continuous improvement (every month)**: Monthly sessions focus on feedback and urgent changes that impact ongoing planning. If necessary, decision makers can make decisions, take corrective action, or influence ongoing planning. |

## How to plan a BI strategy

This series of articles presents a structured framework that helps you to plan the three levels of your BI strategy, as depicted in the following diagram.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/bi-strategy-overview-planning-levels.svg" alt-text="Diagram shows strategic, tactical, and solution planning for business intelligence. Each type of planning is described in the text below." border="false":::

The diagram shows three levels of BI strategy planning, which are each described in separate articles. We recommend that you read these articles in the following order.

1. **[BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md)**: This article describes how you can form a working team to lead the initiative to define your BI strategy. The working team prepares workshops with key stakeholders to understand and document the business strategy. The team then assesses the effectiveness of BI in supporting the business strategy. This assessment helps to define the strategic BI focus areas and objectives. After strategic planning, the working team proceeds to tactical planning.
1. **[BI tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md)**: This article describes how the working team can identify measurable, time-bound key results to achieve the BI objectives. As part of these key results, the working team creates a prioritized backlog of BI solutions and key initiatives. Finally, the working team commits to revise tactical planning every quarter. After tactical planning, you proceed to solution planning.
1. **[BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md)**: This article describes how you design and build BI solutions that support the BI key results. You first assemble a project team that's responsible for a solution in the prioritized solution backlog. The project team then gathers requirements to define the solution design. Next, it plans for deployment and conducts a proof of concept (POC) of the solution to validate assumptions. If the POC is successful, the project team creates and tests content with iterative cycles that gradually onboard the user community. When ready, the project team deploys the solution to production, supporting and monitoring it as needed.

> [!TIP]
> Before you read the BI strategy articles, we recommend that you're already familiar with the [Fabric adoption roadmap](fabric-adoption-roadmap.md). The adoption roadmap describes considerations to achieve Fabric adoption and a healthy data culture. These BI strategy articles build upon the adoption roadmap.

## Related content

In the [next article in this series](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md), learn about BI strategic planning.
