---
title: Power BI migration overview
description: Learn how to migrate to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Power BI migration overview

Customers are increasingly standardizing on Power BI to drive a data culture, which involves enabling managed self-service business intelligence (BI), rationalizing the delivery of enterprise BI, and addressing economic pressures. The purpose of this series of articles is to provide a guide for how to plan and conduct a migration from another third-party BI tool to Power BI.

The remaining articles in this series include:

- [Pre-migration steps](whitepaper-powerbi-migration-pre-migration-steps.md)
- [Gather requirements and prioritize (stage 1)](whitepaper-powerbi-migration-requirements.md)
- [Plan for deployment (stage 2)](whitepaper-powerbi-migration-planning.md)
- [Conduct proof of concept (stage 3)](whitepaper-powerbi-migration-proof-of-concept.md)
- [Create and validate (stage 4)](whitepaper-powerbi-migration-create-and-validate-content.md)
- [Deploy, support, and monitor (stage 5)](whitepaper-powerbi-migration-deploy-support-monitor.md)
- [Learn from customer migrations](whitepaper-powerbi-migration-learn-from-customers.md)

The assumption is that your organization has a legacy BI system currently in place and the decision has been made to formally migrate content and users to Power BI. Migrating to the Power BI service is the primary focus of this series. Additional considerations may apply for national cloud customers beyond what is discussed in this series.

Following is a diagram, which depicts the high-level activities for deploying Power BI in your organization:

:::image type="content" source="media/whitepaper-powerbi-migration-overview/migrate-to-powerbi-high-level-overview.png" alt-text="Image showing the four high-level activities, which are described in the table below.":::

|Activity|Description|
|--------|-----------|
|:::image type="content" source="media/common/icon-01-red-30x30.png" alt-text="Activity 1.":::|**Set up and evaluate Power BI.** The initial step includes establishing the initial Power BI architecture. Preliminary deployment and governance planning are handled at this point, as well as Power BI evaluations including return on investment and/or cost benefit analysis.|
|:::image type="content" source="media/common/icon-02-red-30x30.png" alt-text="Activity 2.":::|**Create new solutions quickly in Power BI.** Self-service BI creators can begin using and evaluating Power BI for their needs, and value can be obtained from Power BI quickly. Activities in step two place importance on agility and rapid business value, which is critical to gaining acceptance for selection of a new BI tool such as Power BI. For this reason, the diagram depicts activities in step two happening side by side with the migration activities in step three.|
|:::image type="content" source="media/common/icon-03-red-30x30.png" alt-text="Activity 3.":::|**Migrate BI assets from legacy system to Power BI.** Step three, which addresses the migration to Power BI, is the focus of this series of articles. The five specific stages for migration will be discussed in the next section below.|
|:::image type="content" source="media/common/icon-04-red-30x30.png" alt-text="Activity 4.":::|**Adopt, govern, monitor Power BI.** There are ongoing activities such as nurturing a data culture, communication, and training, which greatly impact an effective Power BI implementation. It is important to have governance and security policies and processes appropriate for your organization, as well as auditing and monitoring to allow you to scale, grow, and continually improve.|

> [!IMPORTANT]
> A formal migration to Power BI almost always occurs in parallel with new solutions being created in Power BI. Using Power BI for meeting new requirements, while you plan and conduct the formal migration, will help gain buy-in. The simultaneous activities provide content creators practical, real-world experience with Power BI which also benefits with the migration process.

## Five stages of a Power BI migration

The third step of the diagram above addresses the migration. We have identified five common stages for this type of project:

:::image type="content" source="media/whitepaper-powerbi-migration-overview/migrate-to-powerbi-five-stages.png" alt-text="Image showing the stages of a Power BI migration, which are described next.":::

The stages shown in the above diagram include:

### Pre-migration steps

The pre-migration steps include actions you may consider prior to beginning a project to migrate content from a legacy platform to Power BI, including the initial tenant-level deployment planning. For more information about these activities, see [Pre-migration steps](whitepaper-powerbi-migration-pre-migration-steps.md).

### Stage 1: Gather requirements and prioritize

The emphasis of stage one is on information gathering and planning for one individual solution, which is being migrated. This process should be iterative and scoped to a reasonable size effort. The output for stage one includes an inventory of reports and data to be migrated which have been prioritized. Additional activities in stages two and three are necessary to fully estimate the level of effort. For more information about the activities in stage one, see [Gather requirements and prioritize](whitepaper-powerbi-migration-requirements.md).

### Stage 2: Plan for deployment

The focus of stage two is on how the requirements defined in stage one may be fulfilled for each specific solution being deployed. The output of stage two includes as many specifics as possible to guide the process, though it is an iterative, non-linear, process. Creation of a proof of concept (in stage three) may occur in parallel with planning. Even while creating the solution (in stage four), additional information may come to light that influences deployment planning decisions. This type of deployment planning in stage two focuses on the solution level, while respecting the decisions already made at the organizational level (for more information about initial tenant-level deployment planning, see [Pre-migration steps](whitepaper-powerbi-migration-pre-migration-steps.md). For more information about the activities in stage two, see [Plan for deployment](whitepaper-powerbi-migration-planning.md).

### Stage 3: Conduct proof of concept

The emphasis of stage three is to address unknowns and mitigate risks as early as possible. A technical proof of concept (POC) is helpful for validating assumptions and can be done iteratively alongside deployment planning (stage two) for the solution. The output of this stage is a Power BI solution, which is narrow in scope. Note that we do not intend for the proof of concept to be disposable work, though it will require additional work in stage four to make it production-ready. In this respect. In your organization, you may refer to this activity as a prototype, pilot, mockup, quickstart, minimally viable product (MVP) or another term. Conducting a POC is not always necessary and may be done informally. For more information about the activities in stage three, see [Conduct proof of concept](whitepaper-powerbi-migration-proof-of-concept.md).

### Stage 4: Create and validate

Stage four is when the actual work to convert the POC to a production-ready solution is done. The output of this stage is a completed Power BI solution that has been validated in a development environment and is ready for deployment in stage five. For more information about the activities in stage four, see [Create and validate](whitepaper-powerbi-migration-create-and-validate-content.md).

### Stage 5: Deploy, support, and monitor

The primary focus of stage five is to deploy the new Power BI solution to production. The output of this stage is a production solution actively being used by business users. When using an agile methodology, it is acceptable to have some planned enhancements that will be delivered in a future iteration. Depending on your comfort level with Power BI at this point or other considerations, such as minimizing risk and user disruption, you may choose to do a staged deployment or deploy initially to a smaller group of pilot users. Support and monitoring are also important at this stage, and on an ongoing basis. For more information about the activities in stage five, see [Deploy, support, and monitor](whitepaper-powerbi-migration-deploy-support-monitor.md).

> [!TIP]
> Most of the concepts discussed throughout this series of articles also apply to a standard Power BI implementation project.

## Consider migration reasons

Enabling a productive and healthy data culture is a principal goal of many organizations. Power BI is an excellent tool to facilitate this objective. Three common reasons you may consider migrating to Power BI can be distilled down to:

- **Enable managed self-service BI** by introducing new capabilities that empower the self-service BI user community. It makes access to information and decision-making more broadly available, while relying less on specialist skills that can be difficult to find.
- **Rationalize the delivery of enterprise BI** to meet requirements that are not being addressed by existing legacy tools, while decreasing complexity level, reducing cost of ownership, and/or standardizing from multiple BI tools currently in use.
- **Address economic pressures** for increased productivity with fewer resources, time, and staffing.

## Achieve Power BI migration success

Every migration is slightly different. It can depend on the organizational structure, data strategies, data management maturity, and organizational objectives. However, there are some practices we consistently see with customers who deploy Power BI successfully.

- **Executive sponsorship.** Identify an executive sponsor early in the process. They should be someone who actively supports BI in the organization and is personally invested in achieving a positive outcome for the migration. This person has ultimate authority and accountability for outcomes related to Power BI.
- **Training, support, and communication.** Be cognizant it's more than just a technology initiative. Any BI/analytics project is also a people initiative, so consider investing early in user training and support as well as a communication plan that transparently explains to all stakeholders what is occurring, why, and sets realistic expectations. Include a feedback loop in your communication plan to capture input from stakeholders.
- **Quick wins.** Prioritize high value, reasonable complexity level items initially that have tangible business value and are pressing. Rather than strictly attempting to always migrate reports precisely as they appear in the legacy system, focus on the business question the report is trying to answer—including action to be taken—when addressing the redesigned report.
- **Modernization and improvements.** Be willing to rethink how things have always been done. A migration can represent an opportunity to improve (for instance, eliminating a manual step or relocating business rules that were confined to a single report). Consider refactoring, modernizing, and consolidating existing solutions when the effort vs. value is justifiable. It can includes consolidating multiple reports into one report and eliminating artifacts that have not been used in the legacy system for quite some time.
- **Continual learning.** Be prepared to use a phased approach while continually learning and adapting. Make a frequent practice of doing a small technical proof of concept (POC) to minimize risk of unknowns, validate assumptions, and learn about new features. Work in short, iterative cycles to bring value quickly. Since Power BI is a cloud service with monthly updates, it's important to keep up and adjust course when appropriate.
- **Resistance to change**. Be prepared that there may be varying levels of resistance to change, and some users will resist having to learn a new tool. Some professionals who have dedicated significant time and professional effort to gain expertise with a different BI tool may feel threatened by being displaced. It may result in some internal political struggles, particularly in highly decentralized organizations.
- **Constraints**. Be realistic with migration plans, including funding, time estimates, as well as roles and responsibilities for everyone who is involved.

## Terminology

Following are a few of the key terms that are used in this series of articles:

- **Power BI**: A [collection of software services, apps, and connectors](../fundamentals/power-bi-overview.md) that work together to help you create, share, and consume business insights.
- **Power BI solution**: A generic term which encompasses the use of both data and reports. A single Power BI file (a .pbix file) may contain either, or both, data and reports. [Separating the dataset from the report(s)](report-separate-from-model.md) is often encouraged for data reusability purposes but is not required.
- **Proof of concept**: A Power BI solution which is limited in scope to address unknowns, mitigate risk, and/or validate with colleagues. A proof of concept (POC) will require further work to make it production-ready.
- **Power BI dataset**: A data model created in Power BI Desktop which serves as a semantic layer for one or more reports. Once published to the Power BI service, you can [import or connect to a dataset](../fundamentals/service-basic-concepts.md#datasets). Generally, a [star schema](star-schema.md) is recommended for Power BI datasets. A Power BI dataset is stored as an in-memory columnar data structure.
- **Power BI report**: [Front-end visualizations](../fundamentals/service-basic-concepts.md#reports) created in [Power BI Desktop](../fundamentals/desktop-what-is-desktop.md) or the [Power BI service](../fundamentals/power-bi-service-overview.md).
- **Power BI dashboard**: Visuals pinned from one or more Power BI reports to a [dashboard object in the Power BI service](../fundamentals/service-basic-concepts.md#dashboards). Dashboards can also contain tiles and widgets.
- **Semantic layer**: A friendly data model which is pre-built to support analytics. A semantic layer might be a dataset which is created in Power BI, or it might reside in another technology. [Large model support](../admin/service-premium-large-models.md) in Power BI Premium permits a larger semantic layer.
- **Data source**: The [source where data originates](../connect-data/power-bi-data-sources.md). Source data may be imported into a Power BI dataset, or it may be queried directly (without data movement or data latency) via [DirectQuery](../connect-data/desktop-directquery-about.md), [Live Connection](../connect-data/desktop-report-lifecycle-datasets.md), or a [composite model](../transform-model/desktop-composite-models.md).

## Acknowledgements

This series of articles was written by Melissa Coates, Data Platform MVP and owner of [Coates Data Strategies](https://www.coatesdatastrategies.com/). Contributors and reviewers include Marc Reguera, Venkatesh Titte, Patrick Baumgartner, Tamer Farag, Richard Tkachuk, Matthew Roche, Adam Saxton, Chris Webb, Mark Vaillancourt, Daniel Rubiolo, and Peter Myers.

## Next steps

In the [next article in this series](whitepaper-powerbi-migration-pre-migration-steps.md), learn about the pre-migration steps that you may consider prior to beginning a Power BI migration.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- [Migrate SSRS reports to Power BI](migrate-ssrs-reports-to-power-bi.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
