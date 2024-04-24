---
title: Gather requirements to migrate to Power BI
description: Guidance on gathering and prioritizing requirements when migrating to Power BI.
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 02/27/2022
---

# Gather requirements to migrate to Power BI

This article describes **Stage 1**, which is concerned with gathering and prioritizing requirements when migrating to Power BI.

:::image type="content" source="media/powerbi-migration-requirements/migrate-to-power-bi-stage-1.svg" alt-text="Diagram shows the stages of a Power BI migration. Stage 1 is emphasized for this article." border="false":::

> [!NOTE]
> For a complete explanation of the above graphic, see [Power BI migration overview](powerbi-migration-overview.md).

The emphasis of Stage 1 is on information gathering and planning for an individual solution that will be migrated to Power BI.

The output from Stage 1 includes detailed requirements that have been prioritized. However, additional activities in Stages 2 and 3 must be completed to fully estimate the level of effort.

> [!IMPORTANT]
> Stages 1-5 represent activities related to one specific solution. There are decisions and activities at the organizational/tenant level which impact the process at the solution level. Some of those higher-level planning activities are discussed in the [Power BI migration overview](powerbi-migration-overview.md) article. When appropriate, defer to the organizational-level decisions for efficiency and consistency.
>
> The [Fabric adoption roadmap](fabric-adoption-roadmap.md) describes these types of strategic and tactical considerations. It has an emphasis on [organizational adoption](fabric-adoption-roadmap-maturity-levels.md#organizational-adoption-maturity-levels).

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project.

## Compile requirements

The inventory of existing BI items, compiled in the [pre-migration steps](powerbi-migration-pre-migration-steps.md), become the input for the requirements of the new solution to be created in Power BI. Collecting requirements is about understanding the current state, as well as what items users would like changed or refactored when reports are redesigned in Power BI. Detailed requirements will useful for solution deployment planning in [Stage 2](powerbi-migration-planning.md), during creation of a proof of concept in [Stage 3](powerbi-migration-proof-of-concept.md), and when creating the production-ready solution in [Stage 4](powerbi-migration-create-validate-content.md).

### Gather report requirements

Compile thorough, easy-to-reference, information about reports, such as:

- **Purpose, audience, and expected action:** Identify the purpose and business process applicable to each report, as well as the audience, analytical workflow, and expected action to be taken by report consumers.
- **How consumers use the report:** Consider sitting with report consumers of the existing report to understand exactly what they do with it. You might learn that certain elements of the report can be eliminated or improved in the new Power BI version. This process involves additional time investment but it's valuable for critical reports or reports that are used often.
- **Owner and subject matter expert:** Identify the report owner and any subject matter expert(s) associated with the report or data domain. They might become the owners of the new Power BI report going forward. Include any specific change management requirements (which typically differ between IT-managed and business-managed solutions) as well as approvals and sign-offs, which will be required when changes are made in the future. For more information, see [this article](fabric-adoption-roadmap-content-ownership-and-management.md).
- **Content delivery method:** Clarify report consumer expectations for content delivery. It could be on-demand, interactive execution, embedded within a custom application, or delivery on a schedule using an e-mail subscription. There might also be requirements to trigger alert notifications.
- **Interactivity needs:** Determine *must-have* and *nice-to-have* interactivity requirements, such as filters, drill-down actions, or drillthrough actions.
- **Data sources:** Ensure all data sources required by the report are discovered, and data latency needs (data freshness) are understood. Identify historical data, trending, and data snapshot requirements for each report so they can be aligned with the data requirements. Data source documentation can also be useful later on when performing data validation of a new report with its source data.
- **Security requirements:** Clarify security requirements (such as allowed viewers, allowed editors, and any row-level security needs), including any exceptions to normal organizational security. Document any data sensitivity level, data privacy, or regulatory/compliance needs.
- **Calculations, KPIs, and business rules:** Identify and document all calculations, KPIs, and business rules that are currently defined within the existing report so they can be aligned with the data requirements.
- **Usability, layout, and cosmetic requirements:** Identify specific usability, layout, and cosmetic needs related to data visualizations, grouping and sorting requirements, and conditional visibility. Include any specific considerations related to mobile device delivery.
- **Printing and exporting needs:** Determine whether there are any requirements specific to exporting or print-ready layout. These needs will influence which type of report will be most suitable (such as a Power BI, Excel, or paginated report). Be aware that report consumers tend to place a lot of importance on how they've always done things, so don't be afraid to challenge their way of thinking. Be sure to talk in terms of *enhancements* rather than *change*.
- **Risks or concerns:** Determine whether there are other technical or functional requirements for reports, as well as any risks or concerns regarding the information being presented in them.
- **Open issues and backlog items:** Identify any future maintenance, known issues, or deferred requests to add to the backlog at this time.

> [!TIP]
> Consider ranking requirements by classifying them as *must have* or *nice to have*. Frequently consumers ask for everything they might possibly need up-front because they believe it's their only chance to make requests. Also, when addressing priorities in multiple iterations, make the backlog available to stakeholders. It helps with communication, decision-making, and the tracking of pending commitments.

### Gather data requirements

Compile detailed information pertaining to data, such as:

- **Existing queries:** Identify whether there are existing report queries or stored procedures that can be used by a [DirectQuery model](../connect-data/desktop-use-directquery.md) or a [Composite model](../transform-model/desktop-composite-models.md), or can be converted to an Import model.
- **Types of data sources:** Compile the types of data sources that are necessary, including centralized data sources (such as an enterprise data warehouse) as well as non-standard data sources (such as flat files or Excel files that augment enterprise data sources for reporting purposes). Finding where data sources are located, for purposes of [data gateway](../connect-data/service-gateway-onprem.md) connectivity, is important too.
- **Data structure and cleansing needs:** Determine the data structure for each requisite data source, and to what extent [data cleansing](../transform-model/desktop-query-overview.md) activities are necessary.
- **Data integration:** Assess how data integration will be handled when there are multiple data sources, and how [relationships](../transform-model/desktop-create-and-manage-relationships.md) can be defined between each model table. Identify specific data elements needed to simplify the model and [reduce its size](import-modeling-data-reduction.md).
- **Acceptable data latency:** Determine the data latency needs for each data source. It will influence decisions about which [data storage mode](../transform-model/desktop-storage-mode.md) to use. Data refresh frequency for Import model tables is important to know too.
- **Data volume and scalability:** Evaluate data volume expectations, which will factor into decisions about [large model support](../enterprise/service-premium-large-models.md) and designing DirectQuery or [Composite models](../transform-model/desktop-composite-models.md). Considerations related to historical data needs are essential to know too. For larger semantic models ([previously known as datasets](../connect-data/service-datasets-rename.md)), determining [incremental data refresh](../connect-data/incremental-refresh-overview.md) will also be necessary.
- **Measures, KPIs, and business rules:** Assess needs for measures, KPIs, and business rules. They will impact decisions regarding where to apply the logic: in the semantic model or the data integration process.
- **Master data and data catalog:** Consider whether there are master data issues requiring attention. Determine if integration with an enterprise data catalog is appropriate for enhancing discoverability, accessing definitions, or producing consistent terminology accepted by the organization.
- **Security and data privacy:** Determine whether there are any specific security or data privacy considerations for semantic models, including [row-level security](/fabric/security/service-admin-rls) requirements.
- **Open issues and backlog items:** Add any known issues, known data quality defects, future maintenance, or deferred requests to the backlog at this time.

> [!IMPORTANT]
> Data reusability can be achieved with [shared semantic models](../connect-data/service-datasets-share.md), which can optionally be [certified](../collaborate-share/service-endorse-content.md) to indicate trustworthiness and improve discoverability. Data preparation reusability can be achieved with [dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md) to reduce repetitive logic in multiple semantic models. Dataflows can also significantly reduce the load on source systems because the data is retrieved less often—multiple semantic models can then import data from the dataflow.

## Identify improvement opportunities

In most situations, some modifications and improvements occur. It's rare that a direct one-to-one migration occurs without any refactoring or enhancement. Three types of improvements you can consider include:

- **Consolidation of reports:** Similar reports might be consolidated using techniques such as filters, bookmarks, or personalization. Having fewer reports, which are each more flexible, can significantly improve the experience for report consumers. Consider optimizing semantic models for [Q&A (natural language querying)](../natural-language/q-and-a-best-practices.md) to deliver even greater flexibility to report consumers, allowing them to create their own visualizations.
- **Efficiency improvements:** During requirements gathering, improvements can often be identified. For instance, when analysts compile numbers manually or when a workflow can be streamlined. [Power Query](../transform-model/desktop-query-overview.md) can play a large role in replacing manual activities that are currently performed. If business analysts find themselves performing the same activities to cleanse and prepare data on a regular basis, repeatable Power Query data preparation steps can yield significant time savings and reduce errors.
- **Centralization of data model:** An authoritative and certified semantic model serves as the backbone for managed self-service BI. In this case, the data is managed once, and analysts have flexibility to use and augment that data to meet their reporting and analysis needs.

> [!NOTE]
> For more information about centralization of data models, read about [discipline at the core](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core) and [flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#flexibility-at-the-edge).

## Prioritize and assess complexity

At this point, the initial inventory is available and might include specific requirements. When prioritizing the initial set of BI items ready for migration, reports and data should be considered collectively as well as independently of each other.

Identify high priority reports, which might include reports that:

- Bring significant value to the business.
- Are executed frequently.
- Are required by senior leadership or executives.
- Involve a reasonable level of complexity (to improve chances of success during the initial migration iterations).

Identify high priority data, which might include data that:

- Contains critical data elements.
- Is common organizational data that serves many use cases.
- Can be used to create a shared semantic model for reuse by reports and many report creators.
- Involves a reasonable level of complexity (to improve chances of success when in the initial migration iterations).

## Related content

In the [next article in this Power BI migration series](powerbi-migration-planning.md), learn about Stage 2, which is concerned with planning the migration for a single Power BI solution.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).
