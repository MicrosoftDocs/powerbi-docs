---
title: Gather and prioritize requirements to migrate to Power BI
description: Guidance on gathering and prioritizing requirements when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Gather and prioritize requirements to migrate to Power BI

This article discusses **stage one** for migration of BI assets from another platform to Power BI.

:::image type="content" source="media/whitepaper-powerbi-migration-requirements/migrate-to-powerbi-stage-1.png" alt-text="Image showing the stages of a Power BI migration. Stage 1 is emphasized for this article.":::

For a complete explanation of the above graphic, see [Power BI migration overview](whitepaper-powerbi-migration-overview.md).

The emphasis of stage one is on information gathering and planning for the individual solution that is being migrated to Power BI.

The output from stage one includes the detailed requirements that have been prioritized. Additional activities in stages two and three will be necessary to fully estimate the level of effort.

> [!IMPORTANT]
> Stages one through five represent activities related to **one** specific solution. There are decisions and activities at the organizational/tenant level which impact the process at the solution level. Some of those higher-level planning activities were discussed in the [Power BI migration overview](whitepaper-powerbi-migration-overview.md) article. When appropriate, defer to the organizational-level decisions for efficiency and consistency.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project.

## Compile requirements

The inventory of existing BI artifacts, compiled in the [pre-migration steps](whitepaper-powerbi-migration-pre-migration-steps.md), are used as an input for the requirements of the new solution to be created in Power BI. Collecting requirements is about understanding the current state, as well as what items users would like changed or refactored when the report is redesigned in Power BI. The detailed requirements will be exceptionally useful for solution deployment planning in [stage two](whitepaper-powerbi-migration-planning.md), during creation of a proof of concept in [stage three](whitepaper-powerbi-migration-proof-of-concept.md), and when creating the production-ready solution in [stage four](whitepaper-powerbi-migration-create-and-validate-content.md).

### Gather report requirements

Compile thorough, easy-to-reference, information about reports, such as:

- **Purpose, audience, and expected action.** Identify the purpose and business process applicable to this report, as well as the audience, analytical workflow, and expected action to be taken by consumers of the report.
- **How end users use the report.** Consider sitting with the end users who use the existing report to understand exactly what they do with it. You may learn that certain elements of the report may be eliminated or improved in the new version. It involves additional time investment but is valuable for critical reports and/or highly used reports.
- **Owner and subject matter expert.** Identify the report owner and/or subject matter expert(s) associated with the report or data domain, including who will own and maintain the report going forward. Include any specific change management requirements (which typically differ between IT-managed and business-managed solutions) as well as approvals and sign-offs, which will be required when changes are made in the future.
- **Content delivery method.** Clarify the user expectations for content delivery. It may be interactive execution on-demand, embedding within a custom application, and/or delivery on a schedule via e-mail subscription. There may also be user requests related to alerting.
- **Interactivity needs.** Determine the must-have and nice-to-have interactivity requirements such as filters, drill-down, or drill-through.
- **Data sources.** Ensure all data sources to support the report are discovered, plus data latency needs related to data freshness. Identify the historical data, trending, and data snapshot requirements for each report so they can be aligned with the data requirements. The data source documentation can also be useful later when performing data validations of the new report versus the source system(s).
- **Security requirements.** Clarify security requirements (such as allowed viewers, allowed editors, and row-level security needs), including any known exceptions to normal organizational security. Document any data sensitivity level, data privacy, or regulatory/compliance needs.
- **Calculations, KPIs, and business rules.** Compile all calculations, KPIs, and business rules that are currently defined within the existing report so they can be aligned with the data requirements.
- **Usability, layout, and cosmetic requirements.** Identify specific usability, layout, and cosmetic needs related to data visualizations, grouping and sorting requirements, and conditional visibility. Include any specific considerations related to mobile device design.
- **Printing and exporting needs.** Determine if there are any requirements specific to printing, exporting, and/or pixel-perfect design. It will influence which type of report will be most suitable (such as a Power BI, Excel, or paginated report). Be aware that this area in particular is where users tend to put a lot of importance in how they've always done things, so do not be afraid to challenge this way of thinking and determine the validity of the request.
- **Risks or concerns.** Determine if there are other technical or functional requirements for this report, as well as any risks or concerns regarding the information being presented in the report.
- **Open issues and backlog items**. Identify any future maintenance, known issues, or deferred requests to add to the backlog at this time.

> [!TIP]
> Consider ranking requirements with a method such as "must have" and "nice to have" to prioritize. Frequently users will ask for everything they may possibly need up-front because they believe it may be their only chance to make requests. When addressing priorities in multiple iterations, make the backlog available to the stakeholders. This helps with communication, decision-making, and tracking pending commitments.

### Gather data requirements

Compile detailed information pertaining to data, such as:

- **Existing queries**. Identify if there are existing report queries or stored procedures that will continue to be used as-is post-migration (with [DirectQuery](../connect-data/desktop-use-directquery.md) or a [composite model](../transform-model/desktop-composite-models.md)), versus converting existing queries to create an in-memory dataset imported to Power BI.
- **Types of data sources.** Compile the types of data sources that are necessary, including centralized data sources (such as an enterprise data warehouse) as well as non-standard data sources (such as flat files or Excel files that augment enterprise data sources for reporting purposes). Finding where data sources are located, for purposes of [data gateway](../connect-data/service-gateway-onprem.md) connectivity, is important as well.
- **Data structure and cleansing needed.** Determine the data structure for each requisite data source, and to what extent [data cleansing](../transform-model/desktop-query-overview.md) activities are necessary.
- **Data integration.** Assess how data integration will be handled when there are multiple data sources, and how [relationships](../transform-model/desktop-create-and-manage-relationships.md) are defined between each table. Identify specific columns/data elements needed to simplify the model and reduce its size.
- **Acceptable data latency**. Determine the data latency needs for each data source. It will influence decisions about which [data storage mode](../transform-model/desktop-storage-mode.md) is used. Needs for frequency of data refresh for import models is important to know as well.
- **Data volume and scalability.** Evaluate data volume expectations, which will factor into decisions about [large model support](/admin/service-premium-large-models.md) versus usage of DirectQuery and/or [composite models](../transform-model/desktop-composite-models.md). Considerations related to historical data needs are essential to know as well. For larger datasets, determining the [incremental data refresh](../admin/service-premium-incremental-refresh.md) rules will also be necessary.
- **Measures, KPIs, and business rules.** Assess needs for measures, KPIs, and business rules. It will impact decisions regarding where to locate this type of logic: within the dataset itself versus earlier in the data integration process.
- **Master data and data catalog**. Consider if there are master data issues requiring attention. Determine if integration with an enterprise data catalog is appropriate for enhancing discoverability, accessing definitions, and producing consistent terminology accepted by the organization.
- **Security and data privacy.** Determine if there are any specific security or data privacy considerations for the dataset, including [row-level security](../admin/service-admin-rls.md) requirements.
- **Open issues and backlog items**. Add any known issues, known data quality defects, future maintenance, or deferred requests to the backlog at this time.

> [!IMPORTANT]
> Data reusability can be achieved with [shared datasets](../connect-data/service-datasets-share.md), which can optionally be [certified](../connect-data/service-datasets-certify.md) to indicate trustworthiness and improve discoverability. Data preparation reusability can be achieved with [dataflows](../transform-model/service-dataflows-overview.md) to reduce repetitive work in multiple .pbix files. The use of dataflows can also significantly reduce the load on source systems because the various analytical datasets across the organization instead use the dataflow as their source.

## Identify opportunities to improve

In most situations, some modifications and improvements occur. It is rather rare that a direct 1:1 migration occurs with virtually no refactoring or enhancements. The top three types of improvements you may consider include:

1. **Consolidation of reports**. Similar reports may be consolidated using techniques such as filters, bookmarks, or personalization. Having fewer reports, which are more flexible, can significantly improve the experience for report consumers. Consider optimizing the model for [Q&A (natural language querying)](../natural-language/q-and-a-best-practices.md) to provide even greater flexibility to report consumers to derive their own reports from an existing dataset.
2. **Efficiency improvements**. During requirements gathering, situations are often discovered which can be improved. For instance, when analysts compile numbers manually or when a workflow can be streamlined. The [Power BI Query Editor](../transform-model/desktop-query-overview.md) (Power Query) can play a large role in removing manual activities that may be currently performed. If business analysts find themselves performing the same activities to cleanse and prepare data on a regular basis, the repeatable data preparation steps in the Query Editor can yield significant time savings and reduce the opportunity for error.
3. **Centralization of data model.** To the extent that a single dataset can serve as a semantic layer for many reports, that is ideal. An authoritative and certified dataset serves as the backbone for managed self-service BI wherein the data is managed once, and analysts have flexibility to use and augment that data to meet their reporting and analysis needs.

> [!NOTE]
> For more information about centralization of a dataset, see the discussion about [discipline at the core](center-of-excellence-microsoft-business-intelligence-transformation.md#discipline-at-the-core) and [flexibility at the edge](center-of-excellence-microsoft-business-intelligence-transformation.md#flexibility-at-the-edge).

## Prioritize and assess complexity

At this point, the initial inventory is available plus specific requirements. When prioritizing the initial set of BI artifacts to be migrated, the reports and the data should be considered together as well as considered independently of each other.

**Identify high priority reports**. These may include:

- Reports that bring significant value to the business
- Reports that are executed frequently
- Reports that are required by senior leadership
- Reports that are deemed to involve a reasonable level of complexity (to improve chances of success during the initial migration iterations)

**Identify high priority data**. It might include:

- Data that contains critical data elements
- Common organizational data that can serve many use cases
- Data that may be used to create a shared dataset for reuse by reports and many report creators
- Data that is deemed to involve a reasonable level of complexity (to improve chances of success when in the initial migration iterations)

## Next steps

In the [next article in this series](whitepaper-powerbi-migration-planning.md), learn about stage two of the Power BI migration process which discusses the planning process for the specific solution being deployed.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
