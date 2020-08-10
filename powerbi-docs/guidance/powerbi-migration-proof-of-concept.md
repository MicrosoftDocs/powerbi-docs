---
title: Conduct proof of concept to migrate to Power BI
description: Guidance on conducting a proof of concept when migrating to Power BI.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/06/2020
ms.author: v-pemyer
---

# Conduct proof of concept to migrate to Power BI

This article discusses **stage three** for migration of BI assets from another platform to Power BI.

:::image type="content" source="media/powerbi-migration-proof-of-concept/migrate-to-powerbi-stage-3.png" alt-text="Image showing the stages of a Power BI migration. Stage 3 is emphasized for this article.":::

For a complete explanation of the above graphic, see [Power BI migration overview](powerbi-migration-overview.md).

The focus of stage three is to address unknowns and mitigate risks as early as possible related to the solution that is being migrated to Power BI. A technical proof of concept (POC) is helpful for validating assumptions and can be done iteratively alongside solution deployment planning (discussed in [stage two](powerbi-migration-planning.md)).

The output from this stage is a Power BI solution that is narrow in scope, addresses the initial open questions, and is ready for additional work in [stage four](powerbi-migration-create-validate-content.md) to make it production-ready.

> [!IMPORTANT]
> We do not intend for the proof of concept to be disposable work. Rather, we expect for it to be an early iteration of the production-ready solution. In your organization, you may refer to this activity as a prototype, pilot, mockup, quick start, minimally viable product (MVP), or another term. Conducting a POC is not always necessary and may happen informally.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project. As your organization becomes more experienced with Power BI, the need to conduct as many POCs diminishes. However, due to the fast release cadence with Power BI and continual introduction of new features, you may regularly conduct technical POCs for learning purposes.

## Set goals and scope for POC

When conducting a proof of concept, focus on the following types of goals:

- Verify your assumptions for how a feature works
- Educate yourself on differences in how Power BI works as compared to the legacy system
- Validate initial understanding of certain requirements with subject matter experts
- Create a small dataset, with real data, to understand and detect any issues with the data structure, relationships, data types, or data values
- Experiment with and validate [DAX syntax](/dax/) for measures
- Test data source connectivity (through gateway if applicable)
- Test data refresh (through gateway data source if applicable)
- Verify security configurations (including row-level security if applicable)
- Experiment with layout and cosmetic decisions
- Check all functionality in the Power BI service works as expected

The scope for a POC is dependent on what the unknowns are, or which things need to be validated with colleagues. To reduce complexity, keep a single POC as narrow as possible in terms of scope.

Most often with a migration, requirements are well known because there is an existing solution to start from. However, depending on the extent of improvements to be made and/or the existing skills with Power BI, a POC still provides significant value. In addition, rapid prototyping alongside business users may be appropriate to quickly clarify requirements, especially if enhancements are being made.

> [!IMPORTANT]
> Even if the POC includes only a subset of data, or includes only limited visuals, it is often important to take it from start to finish (that is, from development in Power BI Desktop to deployment in the Power BI service within a development workspace) in order to fully accomplish the objectives. This is particularly true if the Power BI service will deliver critical functionality (such as DirectQuery with single sign-on, as an example) that you have not used before. During a POC, focus your efforts on things you are uncertain of or need to verify with others.

## Handle differences in Power BI

Power BI can be used as a _model-based tool_ or as a _report-based tool_. A model-based tool includes imported data, whereas a report-based tool connects to data that resides elsewhere. Due to its extreme flexibility, there are some things that may be fundamentally different about Power BI versus the legacy BI tool you are migrating from.

### Consider redesigning the data architecture

If you are migrating from a legacy tool that has its own semantic layer, then creation of an imported dataset in Power BI is likely going to be a good fit. Power BI functions best with a [star schema](star-schema.md). Therefore, if the legacy semantic layer is not a star schema, it is possible that some redesign may be required to use Power BI to its fullest extent. Putting the effort into defining a semantic layer in a star schema structure (including relationships, commonly used measures, and friendly organizational terminology) serves as an excellent starting point for self-service report creators.

If you are migrating from a legacy tool in which reports reference SQL queries or stored procedures to a relational data source, and if you are planning to use Power BI in [DirectQuery](../connect-data/desktop-use-directquery.md) mode, then you may be able to achieve close to a 1:1 migration with respect to data access.

> [!CAUTION]
> If you see a lot of .pbix files getting created with a single imported table for a dataset, that is an indicator that Power BI is not being used in the most optimal way. Should you notice this situation, investigate the use of [shared datasets](../connect-data/service-datasets-across-workspaces.md) which are created using a [star schema](star-schema.md).

### Decide how to handle dashboard conversions

In the BI industry, a dashboard is a collection of visuals that display key metrics on a single page. In Power BI, a dashboard represents a specific feature that can only be created in the Power BI service. When migrating a dashboard from the legacy system, you have two choices:

1. The legacy dashboard may be recreated as a Power BI _report_. Most reports are created with Power BI Desktop. Paginated reports and Excel reports are alternative options as well.
2. The legacy dashboard may be recreated as a Power BI _dashboard_. [Dashboards](../create-reports/service-dashboards.md) are a feature of the Power BI service. Dashboard visuals are compiled by pinning visuals from one or more reports, Q&A, or Quick Insights.

> [!TIP]
> Since dashboards are a unique item in the Power BI service, it is most clear for consumers if you refrain from using the word _dashboard_ as part of a report name.

### Focus on big picture when recreating visuals

Every BI tool has its strengths and areas of focus. For this reason, the exact report visuals from a legacy tool may not always be able to be precisely recreated as-is in Power BI.

When recreating report visuals, focus more on the big picture business questions that are being answered by the report. It removes the pressure to replicate every visual precisely the same. It is helpful for end users to retain consistency to minimize user disruption with the migrated reports; however, it is just as important to not get caught up in time-consuming debates about small details.

## Next steps

In the [next article in this series](powerbi-migration-create-validate-content.md), learn about stage four of the Power BI migration, which covers creating and validating a production-ready solution.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Planning a Power BI enterprise deployment](https://aka.ms/PBIEnterpriseDeploymentWP)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
