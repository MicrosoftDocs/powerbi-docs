---
title: Power BI migration overview
description: Learn how to plan and conduct a migration from another third-party BI tool to Power BI.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 09/27/2022
---

# Power BI migration overview

Customers are increasingly standardizing on Power BI to drive a data culture, which involves enabling managed self-service business intelligence (SSBI), rationalizing the delivery of enterprise BI, and addressing economic pressures. The purpose of this series of Power BI migration articles is to provide you with guidance on how to plan and conduct a migration from a third-party BI tool to Power BI.

The articles in the Power BI migration series include:

1. Power BI migration overview (this article)
1. [Prepare to migrate to Power BI](powerbi-migration-pre-migration-steps.md)
1. [Gather requirements to migrate to Power BI (Stage 1)](powerbi-migration-requirements.md)
1. [Plan deployment to migrate to Power BI (Stage 2)](powerbi-migration-planning.md)
1. [Conduct proof of concept to migrate to Power BI (Stage 3)](powerbi-migration-proof-of-concept.md)
1. [Create content to migrate to Power BI (Stage 4)](powerbi-migration-create-validate-content.md)
1. [Deploy to Power BI (Stage 5)](powerbi-migration-deploy-support-monitor.md)
1. [Learn from customer Power BI migrations](powerbi-migration-learn-from-customers.md)

> [!NOTE]
> We also recommend that you thoroughly read the [Fabric adoption roadmap](fabric-adoption-roadmap.md) and [Power BI implementation planning](powerbi-implementation-planning-introduction.md) articles.

There are two assumptions: Your organization has a legacy BI platform currently in place and the decision has been made to formally migrate content and users to Power BI. Migrating to the Power BI service is the primary focus of this series. Additional considerations could apply for national/regional cloud customers beyond what is discussed in this series of articles.

The following diagram shows four high-level phases for deploying Power BI in your organization.

:::image type="content" source="media/powerbi-migration-overview/migrate-to-power-bi-high-level-overview.svg" alt-text="Diagram shows the four high-level phases, which are described in the following table." border="false":::

|Phase|Description|
|--------|-----------|
|![Phase 1.](../media/legend-number/legend-number-01-fabric.svg)|**Set up and evaluate Power BI.** The first phase involves establishing the initial Power BI architecture. Preliminary deployment and governance planning are handled at this point, as well as Power BI evaluations including return on investment and/or cost benefit analysis.|
|![Phase 2.](../media/legend-number/legend-number-02-fabric.svg)|**Create new solutions quickly in Power BI.** In the second phase, self-service BI authors can begin using and evaluating Power BI for their needs, and value can be obtained from Power BI quickly. Activities in Phase 2 place importance on agility and rapid business value, which is critical to gaining acceptance for the selection of a new BI tool such as Power BI. For this reason, the diagram depicts activities in Phase 2 happening side by side with the migration activities in Phase 3.|
|![Phase 3.](../media/legend-number/legend-number-03-fabric.svg)|**Migrate BI assets from legacy platform to Power BI.** The third phase addresses the migration to Power BI. It's the focus of this series of Power BI migration articles. Five specific migration stages are discussed in the next section.|
|![Phase 4.](../media/legend-number/legend-number-04-fabric.svg)|**Adopt, govern, and monitor Power BI.** The final phase comprises ongoing activities such as nurturing a data culture, communication, and training. These activities greatly impact on an effective Power BI implementation. It's important to have governance and security policies and processes that are appropriate for your organization, as well as auditing and monitoring to allow you to scale, grow, and continually improve.|

> [!IMPORTANT]
> A formal migration to Power BI almost always occurs in parallel with the development of a new Power BI solution. *Power BI solution* is generic term that encompasses the use of both data and reports. A single Power BI Desktop (pbix) file could contain a data model or report, or both. [Separating the data model from reports](../guidance/report-separate-from-model.md) is encouraged for data reusability purposes, but isn't required.
>
> Using Power BI to author new requirements, while you plan and conduct the formal migration, will help gain buy-in. Simultaneous phases provide content authors with practical, real-world experience with Power BI.

## Five stages of a Power BI migration

Phase 3 of the diagram addresses migration to Power BI. During this phase, there are five common stages.

:::image type="content" source="media/powerbi-migration-overview/migrate-to-power-bi.svg" alt-text="Diagram shows the stages of a Power BI migration, which are described below." border="false":::

The following stages shown in the previous diagram are:

- [Pre-migration steps](#pre-migration-steps)
- [Stage 1: Gather requirements and prioritize](#stage-1-gather-requirements-and-prioritize)
- [Stage 2: Plan for deployment](#stage-2-plan-for-deployment)
- [Stage 3: Conduct proof of concept](#stage-3-conduct-proof-of-concept)
- [Stage 4: Create and validate content](#stage-4-create-and-validate-content)
- [Stage 5: Deploy, support, and monitor](#stage-5-deploy-support-and-monitor)

### Pre-migration steps

The pre-migration steps include actions you should consider prior to beginning a project to migrate content from a legacy BI platform to Power BI. It typically includes the initial tenant-level deployment planning. For more information about these activities, see [Prepare to migrate to Power BI](powerbi-migration-pre-migration-steps.md).

### Stage 1: Gather requirements and prioritize

The emphasis of Stage 1 is on gathering information and planning for the migration of a single solution. This process should be iterative and scoped to a reasonable sized effort. The output for Stage 1 includes a prioritized inventory of reports and data that are to be migrated. Additional activities in Stages 2 and 3 are necessary to fully estimate the level of effort. For more information about the activities in Stage 1, see [Gather requirements to migrate to Power BI](powerbi-migration-requirements.md).

### Stage 2: Plan for deployment

The focus of Stage 2 is on how the requirements defined in Stage 1 are fulfilled for each specific solution. The output of Stage 2 includes as many specifics as possible to guide the process, though it is an iterative, non-linear process. Creation of a proof of concept (in Stage 3) can occur in parallel with this stage. Even while creating the solution (in Stage 4), additional information might come to light that influences deployment planning decisions. This type of deployment planning in Stage 2 focuses on the solution level, while respecting the decisions already made at the organizational level. For more information about the activities in Stage 2, see [Plan deployment to migrate to Power BI](powerbi-migration-planning.md).

### Stage 3: Conduct proof of concept

The emphasis of Stage 3 is to address unknowns and mitigate risks as early as possible. A technical proof of concept (POC) is helpful for validating assumptions, and it can be done iteratively alongside deployment planning (Stage 2). The output of this stage is a Power BI solution that's narrow in scope. Note that we don't intend for the POC to be disposable work. However, it will likely require additional work in Stage 4 to make it production-ready. In this respect, in your organization, you might refer to this activity as either a prototype, pilot, mockup, quickstart, or minimally viable product (MVP). Conducting a POC isn't always necessary and it can be done informally. For more information about the activities in Stage 3, see [Conduct proof of concept to migrate to Power BI](powerbi-migration-proof-of-concept.md).

### Stage 4: Create and validate content

Stage 4 is when the actual work to convert the POC to a production-ready solution is done. The output of this stage is a completed Power BI solution that's been validated in a development environment. It should be ready for deployment in Stage 5. For more information about the activities in Stage 4, see [Create content to migrate to Power BI](powerbi-migration-create-validate-content.md).

### Stage 5: Deploy, support, and monitor

The primary focus of Stage 5 is to deploy the new Power BI solution to production. The output of this stage is a production solution that's actively used by business users. When using an agile methodology, it's acceptable to have some planned enhancements that will be delivered in a future iteration. Depending on your comfort level with Power BI, such as minimizing risk and user disruption, you might choose to do a staged deployment. Or, you might initially deploy to a smaller group of pilot users. Support and monitoring are also important at this stage, and on an ongoing basis. For more information about the activities in Stage 5, see [Migrate to Power BI](powerbi-migration-deploy-support-monitor.md).

> [!TIP]
> Most of the concepts discussed throughout this series of Power BI migration articles also apply to a standard Power BI implementation project.

## Consider migration reasons

Enabling a productive and healthy [data culture](fabric-adoption-roadmap-data-culture.md) is a principal goal of many organizations. Power BI is an excellent tool to facilitate this objective. Three common reasons you might consider migrating to Power BI can be distilled down to:

- Enable [managed self-service BI](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) by introducing new capabilities that empower the self-service BI user community. Power BI makes access to information and decision-making more broadly available, while relying less on specialist skills that can be difficult to find.
- Rationalize the delivery of [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) to meet requirements that aren't addressed by existing BI tools, while decreasing complexity level, reducing cost of ownership, and/or standardizing from multiple BI tools currently in use.
- Address economic pressures for increased productivity with fewer resources, time, and staffing.

## Achieve Power BI migration success

Every migration is slightly different. It can depend on the organizational structure, data strategies, [data management maturity](fabric-adoption-roadmap-maturity-levels.md), and organizational objectives. However, there are some practices we consistently see with our customers who achieve Power BI migration success.

- **Executive sponsorship:** Identify an executive sponsor early in the process. This person should be someone who actively supports BI in the organization and is personally invested in achieving a positive outcome for the migration. Ideally, the executive sponsor has ultimate authority and accountability for outcomes related to Power BI. For more information, see [this article](fabric-adoption-roadmap-executive-sponsorship.md).
- **Training, support, and communication:** Recognize that it's more than just a technology initiative. Any BI or analytics project is also a people initiative, so consider investing early in [user training](fabric-adoption-roadmap-mentoring-and-user-enablement.md#training) and [support](fabric-adoption-roadmap-user-support.md). Also, create a communication plan that transparently explains to all stakeholders what is occurring, why, and sets realistic expectations. Be sure to include a feedback loop in your [communication plan](fabric-adoption-roadmap-community-of-practice.md#communication-plan) to capture input from stakeholders.
- **Quick wins:** Initially, prioritize high value items that have tangible business value and are pressing. Rather than strictly attempting to always migrate reports precisely as they appear in the legacy BI platform, focus on the business question the report is trying to answer—including action to be taken—when addressing the redesigned report.
- **Modernization and improvements:** Be willing to rethink how things have always been done. A migration can provide an opportunity to deliver improvements. For example, it could eliminate manual data preparation or relocate business rules that were confined to a single report. Consider refactoring, modernizing, and consolidating existing solutions when the effort can be justified. It can include consolidating multiple reports into one, or eliminating legacy items that haven't been used for some time.
- **Continual learning:** Be prepared to use a phased approach while continually learning and adapting. Work in short, iterative cycles to bring value quickly. Make a frequent practice of completing small POCs to minimize risk of unknowns, validate assumptions, and learn about new features. As Power BI is a cloud service that updates monthly, it's important to keep abreast of developments and adjust course when appropriate.
- **Resistance to change:** Understand there might be varying levels of resistance to change; some users will resist learning a new tool. Also, some professionals who have dedicated significant time and effort to gain expertise with a different BI tool might feel threatened by being displaced. Be prepared, because it can result in internal political struggles, particularly in highly decentralized organizations.
- **Constraints:** Be realistic with migration plans, including funding, time estimates, as well as roles and responsibilities for everyone involved.

## Acknowledgments

This series of articles was written by Melissa Coates, Data Platform MVP and owner of [Coates Data Strategies](https://www.coatesdatastrategies.com/). Contributors and reviewers include Marc Reguera, Venkatesh Titte, Patrick Baumgartner, Tamer Farag, Richard Tkachuk, Matthew Roche, Adam Saxton, Chris Webb, Mark Vaillancourt, Daniel Rubiolo, David Iseminger, and Peter Myers.

## Related content

In the [next article in this Power BI migration series](powerbi-migration-pre-migration-steps.md), learn about the pre-migration steps when migrating to Power BI.

Other helpful resources include:

- [Fabric adoption roadmap](fabric-adoption-roadmap.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Migrate SSRS reports to Power BI](migrate-ssrs-reports-to-power-bi.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
