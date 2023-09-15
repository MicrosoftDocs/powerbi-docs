---
title: "Power BI implementation planning: BI strategy overview"
description: "This article introduces the Power BI strategy planning articles."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 09/09/2023
---

# Power BI implementation planning: BI strategy

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces the business intelligence (BI) strategy series of articles. The BI strategy series is targeted at multiple audiences:

- **Executive leadership:** Individuals who are responsible for defining organizational goals and strategies, like the Power BI executive sponsor or a Chief Executive Officer (CEO), Chief Information Officer (CIO), or Chief Data Officer (CDO).
- **BI and analytics directors or managers:** Decision makers who are responsible for overseeing the BI program and BI strategic planning.
- **Center of Excellence (COE), IT, and BI teams:** The teams that are responsible for tactical planning, measuring, and monitoring progress toward the BI objectives.
- **Subject matter experts (SMEs) and content owners and creators:** The teams and individuals that champion analytics in a team or department and conduct BI solution planning. These teams and individuals are responsible for representing the strategy and data needs of their business area when defining the BI strategy.

Defining your BI strategy is essential to get the most business value from BI initiatives and solutions. Having a clearly defined BI strategy is important to ensure efforts are aligned with organizational priorities. In some circumstances, it's particularly important.

We recommend that you pay special attention to these articles if your organization is:

- **Migrating to, or implementing, Microsoft Fabric or Power BI for the first time:** A clear BI strategy is crucial to the successful implementation of any new platform or tool.
- **Experiencing significant growth of Microsoft Fabric or Power BI usage:** A BI strategy brings clarity and structure to organic adoption, helping to enable users while mitigating risk.
- **Seeking to become data-driven or achieve digital transformation:** A BI strategy is critical to modernizing your organization and helping you to achieve a competitive advantage.
- **Experiencing significant business or technological change:** Planning your BI strategy ensures that your organization can use change as momentum and not as an obstacle.
- **Reevaluating your business strategy:** Your business strategy should influence your BI strategy, which in turn can lead to changes in your business strategy. All strategies should be in alignment in order to achieve your organizational goals.

In short, this series of articles is about defining a BI strategy. It describes what a BI strategy is, why it's important, and how you can plan your BI strategy. The articles in this series are intended to complement the [Power BI adoption roadmap](powerbi-adoption-roadmap-overview.md).

## Become data-driven with a BI strategy

Successful adoption and implementation of analytics solutions helps an organization meet their business goals. To achieve successful adoption and implementation, you need a _BI strategy_. A BI strategy is sometimes described as an _analytics strategy_ or _becoming data driven_.

A BI strategy is a plan to implement, use, and manage data and analytics to better enable your users to meet their business goals. An _effective_ BI strategy ensures that data and analytics support your business strategy.

### Relationship between BI strategy and business strategy

Your business strategy should directly inform your BI strategy. As your business objectives evolve, your BI processes and tools may also need to evolve, especially as new data needs arise. New opportunities and insights learned from BI solutions can also lead to changes to your business strategy. Understanding and supporting the relationship between your business and BI strategies is essential in order to make valuable BI solutions, and to ensure that people use them effectively.

The following diagram depicts how a BI strategy supports the business strategy by enabling business users.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/business-strategy.png" alt-text="Image shows the purpose of a BI strategy is to support the business strategy by enabling business users. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts the following concepts.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | The business strategy describes how the organization will achieve its business goals. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | The business strategy directly informs the BI strategy. The primary purpose of the BI strategy is to support—and potentially inform—the business strategy. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | The BI strategy is a plan to implement, use, and manage data and analytics. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | BI goals define how BI will support the business goals. BI goals describe the desired future state of the BI environment. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | To make progress toward your BI goals, you identify and describe BI objectives that you want to achieve in a specific time period. These objectives describe paths to your desired future state. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | To achieve your BI objectives, you plan and implement BI solutions and initiatives. A solution might be developed by a central IT or BI team, or by a member of the community of practice as a self-service solution. |
| ![Item 7.](media/common/icon-07-red-30x30.png) | The purpose of BI solutions and initiatives is to enable business users to achieve their objectives. |
| ![Item 8.](media/common/icon-08-red-30x30.png) | Business users use BI solutions and initiatives to make informed decisions that lead to effective actions. |
| ![Item 9.](media/common/icon-09-red-30x30.png) | Business users follow through on the business strategy with their achieved results. They achieve these results by taking the right actions at the right time, which is made possible in part by an effective BI strategy. |

> [!NOTE]
> In this series, _goals_ are high-level descriptions of what you want to achieve. In contrast, _objectives_ are specific, actionable targets to help you achieve a goal. While a goal describes the desired future state, objectives describe the path to get there.
>
> Further, _solutions_ are processes or tools built to address specific business needs for users. A solution can take many forms, such as a data pipeline, a data lakehouse, or a Power BI dataset or report.

Consider the following, high-level example for a hypothetical organization.

| **Area** | **Example** |
| --- | --- |
| **Business strategy** | The organizational goal is to improve customer satisfaction and reduce customer churn. One business strategy to achieve this goal is to reduce the number of late customer deliveries. |
| **BI strategy** | **BI goal:** To support the business strategy, the BI goal is to improve the effectiveness of orders and deliveries reporting. </br></br>**BI objectives:** To achieve the BI goal, the organization defines specific BI objectives, like producing a unified view of the order fulfillment process across all distribution centers. </br></br>**BI solutions and initiatives:** To achieve these BI objectives, the organization plans BI solutions and initiatives, like implementing a consolidated data lakehouse that stores business-ready orders data to support reporting and analytics. |
| **Business users** | Enabled by these BI solutions, business users can more effectively identify and mitigate potential late deliveries. These solutions result in fewer late deliveries and improved customer satisfaction, allowing the organization to achieve progress toward its business goals. |

### Relationship between BI strategy and data strategy

Your BI strategy describes how [successful Power BI adoption](powerbi-adoption-roadmap-overview.md#power-bi-adoption) and [implementation](powerbi-implementation-planning-introduction.md) will deliver business value to your organization. However, a BI strategy transcends tools and technologies. While your BI strategy might start small, it can grow to encompass all of your analytical data, tools, and processes when you experience success. Furthermore, the concepts in a BI strategy are also important in a broader _data strategy_. While a BI strategy is about the use of data and tools for analytical purposes, a data strategy is concerned with the wider management and use of data within the organization. Thus, your BI strategy is a subset of your data strategy, as they share many related concepts.

The following diagram depicts how a BI strategy is a subset of a data strategy, and how they share concepts related to data culture and technology.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/data-strategy.png" alt-text="Image shows that a BI strategy is a subset of a data strategy. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts the following concepts.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | A data strategy describes the goals and priorities for the wider use and management of data in an organization. A data strategy encompasses more than only BI. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | The BI strategy is a subset of a data strategy. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | [Data culture](powerbi-adoption-roadmap-data-culture.md#data-culture-vision) is important in both a BI strategy and a data strategy. Different data culture areas describe a vision for behaviors, values, and processes that enable people to work effectively with data. An example of a data culture area is data literacy. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | Technology is important in both a BI strategy and a data strategy. Different technical areas support the business data needs and use cases. An example of a technical area is data visualization. |

A BI strategy can encompass many data culture and technical areas. However, when planning your BI strategy, you should be cautious not to attempt to address too many of these areas at first. A successful BI strategy starts small. It focuses on a few prioritized areas and broadens scope over time, ensuring consistent progress. Later, as you experience sustainable success with your BI strategy, it can incrementally evolve to encompass more areas.

> [!IMPORTANT]
> This series of BI strategy articles focuses on the Power BI workload in Fabric. However, planning a BI strategy is a technology-agnostic exercise. As such, the concepts described in the articles may apply irrespective of your chosen BI tools and technologies.

## Defining a BI strategy

There are many ways to define a BI strategy. Typically, when you define a BI strategy, you begin with the priority areas that describe your BI goals. Based on these prioritized goals, you define specific, measurable objectives. To achieve these objectives, you build solutions and enact specific initiatives. You then incrementally scale your BI strategy to include more areas as you experience success.

You The following diagram depicts how you can define your BI strategy at three different planning levels, as depicted in the following diagram.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/three-levels.png" alt-text="Image shows the three levels of a BI strategy. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts the following three planning levels.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | **Strategic planning:** You begin by defining your strategic BI goals and priorities, and how they support your business strategy. These BI goals are high-level descriptions of what you want to achieve and why. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | **Tactical planning:** You then identify your specific BI objectives. These objectives are specific, measurable, short-term actions that describe how you'll make progress toward your long-term, strategic BI goals. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | **Solution planning:** The BI solutions and initiatives that you create should be a direct result of tactical planning. These solutions enable you to achieve your BI objectives and make progress toward your BI goals. |

> [!IMPORTANT]
> Defining a BI strategy requires prioritization, planning, and active involvement from many teams and individuals across your organization.

### BI strategy example

The following high-level, hypothetical example explains how you can transition from business goals to BI goals. It then explains how to transition from BI goals to objectives, and then to BI solutions.

#### Business goals and strategy

In this example, the organization has set a goal to increase sales effectiveness. One strategy the business uses to achieve this goal is to sell more high-margin products to its top customers.

#### BI goals and priorities

To achieve the business strategy, the organization wants the salespeople to adopt data-driven decision making. To this end, the BI team works with the sales teams to understand their data needs, and to define long-term, strategic BI goals and priorities.

In this example, the BI goals and priorities are:

- **Data literacy:** Improve the ability of the salespeople to make decisions based on data and report visualizations.
- **Content ownership:** Clarify who owns the data and reporting items for different use cases.
- **Mentoring and user enablement:** More effectively enable the salespeople with the skills and tools to answer questions with data.
- **Governance:** More effectively balance governance risk and enablement of the sales teams.
- **Data engineering:** Create a unified view of sales and profitability data for analytics.

> [!NOTE]
> In this example, many other factors might be important. However, the organization has identified these particular priorities to advance progress towards their business goals and strategy.

#### Objectives

To achieve their BI goals, the BI team conducts tactical planning to identify and describe their short-term objectives. The BI team creates a [data literacy](powerbi-adoption-roadmap-data-culture.md#data-literacy) program for the salespeople. Also, the BI team drafts a user enablement plan and an accountability plan for salespeople who want to perform self-service analytics. These plans allow the salespeople to request access to data after they've completed specific training materials and signed a [self-service user acknowledgment](powerbi-adoption-roadmap-system-oversight.md#user-responsibilities).

In this example, the BI objectives are:

- **Data literacy:** Ensure that 90 percent of the salespeople complete the data literacy program.
- **Content ownership:** Adopt the [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) usage scenario, where central teams manage central, certified Power BI datasets and reports. Some self-service content creators can connect to these datasets for their own analysis and reporting needs.
- **Mentoring and user enablement:** Create a [centralized portal](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) to share [training resources](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#training-resources-and-approaches), [template files](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#template-files), and host weekly [office hours](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#office-hours) Q&A sessions.
- **Governance:** Draft a [tenant-wide monitoring solution](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md) for user activities based on data from the [Power BI activity log](/power-bi/admin/service-admin-auditing), and identify data democratization and data discovery priorities for the next quarter.
- **Data engineering:** Design and start a proof of concept for a [medallion lakehouse architecture](/azure/databricks/lakehouse/medallion) to store the sales and profitability data.
- **Data security:** Define and implement data security rules for BI solutions.
- **Information protection and data loss prevention (DLP):** Define how content creators should [endorse content](/power-bi/collaborate-share/service-endorse-content) by promoting or certifying data items. Conduct an investigation into whether to use [sensitivity labels](/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide&preserve-view=true) and implement DLP policies.

#### BI solutions

To achieve its objectives, the organization aims to design and deploy the following BI solutions.

- Central BI teams will work to store profitability data for customers and products in a unified lakehouse.
- Central BI teams will publish an enterprise semantic model as a Power BI dataset that includes all data required for central reporting and key self-service reporting scenarios.
- Security rules applied to the Power BI dataset enforce that salespeople can only access data for their assigned customers.
- Central BI teams will create central reports that show aggregate sales and profitability across regions and product groups. These central reports will support more sophisticated analysis by using interactive visualizations.
- Salespeople can connect directly to the BI dataset to perform [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) and answer specific, one-off business questions.

> [!NOTE]
> This example describes a simple scenario for the purpose of explaining the three planning levels of a BI strategy. In reality, your strategic BI goals, objectives, and BI solutions are likely to be more complex.

### Iteratively plan a BI strategy

Your BI strategy should evolve as you scale and as your organization experiences change. For these reasons, planning your BI strategy is a continuous, iterative process.

Iteratively planning your BI strategy is beneficial for two reasons.

- **Incremental progress:** Define your BI strategy by focusing on priorities and breaking them into manageable parts. You can implement these parts in phases and complete them incrementally over multiple continuous improvement cycles. With each cycle, you can evaluate progress and lesson learned to sustainably grow your strategy. In contrast, an all-in approach can become overwhelming, running out of steam before it produces value.
- **Overcome change:** Keep pace with changes to technology and your business strategy. Iterative planning and implementation phases can help your strategy remain relevant to business data needs. In contrast, detailed, multi-year strategic plans can quickly become outdated.

It's unrealistic to expect all-encompassing, long-term planning to survive beyond 12-18 months. For instance, attempting to create an exhaustive three to five-year plan can result in over-investment, a failure to keep up with change, and an inability to support changes in your business strategy. Instead, you should define and operationalize your strategies by using iterative approaches, with achievable outcomes in a maximum period of 18 months.

There are many ways to iteratively plan your BI strategy. A common approach is to schedule planning revisions over periods that align with existing planning processes in the organization.

The following diagram depicts recommendations for how you can schedule planning revisions.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/iterative-planning.png" alt-text="Image shows how to iteratively plan a BI strategy with different planning periods. Concepts shown in the image are described in the table below." border="false":::

The diagram depicts how you can iteratively structure your BI strategy planning the following concepts.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | **Avoid detailed, long-term planning:** Long-term, detailed plans can become outdated as technology and business priorities change. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | **Strategic planning (every 12-18 months):** This high-level planning focuses on aligning business goals and BI goals. It's valuable to align this strategic planning with other annualized business processes, like budgeting periods. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | **Tactical planning (every 1-3 months):** Monthly or quarterly planning sessions focus on evaluating and adjusting existing tactical plans. These sessions assess existing priorities and tasks, which should take business feedback and changes in business or technology into account. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | **Continuous improvement (every month):** Monthly sessions focus on feedback and urgent changes that impact ongoing planning. If necessary, decision makers can make decisions, take corrective action, or influence ongoing planning. |

## How to plan a BI strategy

This series of articles presents a structured framework that helps you to plan the three levels of your BI strategy, as depicted in the following diagram.

:::image type="content" source="media/powerbi-implementation-planning-bi-strategy-overview/planning-levels.png" alt-text="Image shows strategic, tactical, and solution planning for business intelligence. Each type of planning is described in the text below." border="false":::

The diagram shows three levels of BI strategy planning, which are each described in separate articles. We recommend that you read these articles in the following order.

1. **[BI strategic planning](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md):** This article describes how you can form a working team to lead the initiative to define your BI strategy. The working team prepares workshops with key stakeholders to understand and document the business strategy. The team then assesses the effectiveness of BI in supporting the business strategy. This assessment helps to define the strategic BI goals and priorities. After strategic planning, the working team proceeds to tactical planning.
1. **[BI tactical planning](powerbi-implementation-planning-bi-strategy-bi-tactical-planning.md):** This article describes how the working team can identify specific objectives to achieve the BI goals. As part of these objectives, the working team creates a prioritized backlog of BI solutions. The team then defines what success of the BI strategy will look like, and how to measure it. Finally, the working team commits to revise tactical planning every quarter. After tactical planning, you proceed to solution planning.
1. **[BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md):** This article describes how you design and build BI solutions that support the BI objectives. You first assemble a project team that's responsible for a solution in the prioritized solution backlog. The project team first gathers requirements to define the solution design. Next, it plans for deployment and conducts a proof of concept (POC) of the solution to validate assumptions. If the POC is successful, the project team creates and tests content with iterative cycles that gradually onboard the user community. When ready, the project team deploys the solution to production, supporting and monitoring it as needed.

> [!TIP]
> Before you read the BI strategy articles, we recommend that you're already familiar with the [Power BI adoption roadmap](powerbi-adoption-roadmap-overview.md). The adoption roadmap describes considerations to achieve Power BI adoption and a healthy data culture. These BI strategy articles build upon the adoption roadmap.

## Next steps

In the [next article in this series](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md), learn about BI strategic planning.
