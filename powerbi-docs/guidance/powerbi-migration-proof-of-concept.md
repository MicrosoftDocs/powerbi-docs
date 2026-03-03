---
title: "Conduct proof of concept to migrate to Power BI"
description: "Guidance on conducting a proof of concept when migrating to Power BI."
author: dknappettmsft 
ms.author: daknappe
ms.reviewer: daengli
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: concept-article
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Conduct proof of concept to migrate to Power BI

This article describes **Stage 3**, which is concerned with conducting a proof of concept (POC) to mitigate risk and address unknowns as early as possible when migrating to Power BI.

:::image type="content" source="media/powerbi-migration-proof-of-concept/migrate-to-power-bi-stage-3.svg" alt-text="Diagram shows the stages of a Power BI migration. Stage 3 is emphasized for this article." border="false":::

> [!NOTE]
> For a complete explanation of the above graphic, see [Power BI migration overview](powerbi-migration-overview.md).

The focus of Stage 3 is to address unknowns and mitigate risks as early as possible. A technical POC is helpful for validating assumptions. It can be done iteratively alongside solution deployment planning (described in [Stage 2](powerbi-migration-planning.md)).

The output from this stage is a Power BI solution that's narrow in scope, addresses the initial open questions, and is ready for additional work in [Stage 4](powerbi-migration-create-validate-content.md) to make it production-ready.

> [!IMPORTANT]
> We don't intend for the POC to be disposable work. Rather, we expect it to be an early iteration of the production-ready solution. In your organization, you might refer to this activity as a prototype, pilot, mockup, quick start, or minimally viable product (MVP). Conducting a POC isn't always necessary and it could even happen informally.

> [!TIP]
> Most of the topics discussed in this article also apply to a standard Power BI implementation project. As your organization becomes more experienced with Power BI, the need to conduct POCs diminishes. However, due to the fast release cadence with Power BI and the continual introduction of new features, you might regularly conduct technical POCs for learning purposes.

## Set POC goals and scope

When conducting a POC, focus on the following goals:

- Verify your assumptions about how a feature works.
- Educate yourself on differences in how Power BI works compared with the legacy BI platform.
- Validate initial understandings of certain requirements with subject matter experts.
- Create a small semantic model with real data to understand and detect any issues with the data structure, relationships, data types, or data values.
- Experiment with, and validate, [DAX syntax](/dax/) expressions used by model calculations.
- Test data source connectivity using a gateway (if it's to be a gateway source).
- Test data refresh using a gateway (if it's to be a gateway source).
- Verify security configurations, including row-level security when applicable.
- Experiment with layout and cosmetic decisions.
- Verify that all functionality in the Power BI service works as expected.

The POC scope is dependent on what the unknowns are, or which goals need to be validated with colleagues. To reduce complexity, keep a POC as narrow as possible in terms of scope.

Most often with a migration, requirements are well known because there's an existing solution to start from. However, depending on the extent of improvements to be made or existing Power BI skills, a POC still provides significant value. In addition, [rapid prototyping](powerbi-implementation-planning-usage-scenario-prototyping-and-sharing.md) with consumer feedback could be appropriate to quickly clarify requirements—especially if enhancements are made.

> [!IMPORTANT]
> Even if a POC includes only a subset of data, or includes only limited visuals, it's often important to take it from start to finish. That is, from development in Power BI Desktop to deployment to a development workspace in the Power BI service. It's the only way to fully accomplish the POC objectives. It's particularly true when the Power BI service must deliver critical functionality that you haven't used before, like a DirectQuery semantic model that uses single sign-on. During the POC, focus your efforts on aspects you're uncertain about or need to verify with others.

## Handle differences in Power BI

Power BI can be used as a *model-based tool* or as a *report-based tool*. A model-based solution involves developing a data model, whereas a report-based solution connects to an already-deployed data model.

Due to its extreme flexibility, there are some aspects about Power BI that might be fundamentally different from the legacy BI platform you're migrating from.

### Consider redesigning the data architecture

If you're migrating from a legacy BI platform that has its own semantic layer, then the creation of an Import semantic model is likely to be a good option. Power BI functions best with a [star schema](star-schema.md) table design. Therefore, if the legacy semantic layer is not a star schema, it's possible that some redesign might be required to fully benefit from Power BI. Putting effort into defining a semantic layer adhering to star schema design principles (including relationships, commonly used measures, and friendly organizational terminology) serves as an excellent starting point for self-service report authors.

If you're migrating from a legacy BI platform where reports reference relational data sources using SQL queries or stored procedures, and if you're planning to use Power BI in [DirectQuery mode](../connect-data/desktop-use-directquery.md), you might be able to achieve close to a one-to-one migration of the data model.

> [!CAUTION]
> If you see the creation of lots of Power BI Desktop files comprising a single imported table, it's usually an indicator that the design isn't optimal. Should you notice this situation, investigate whether the use of [shared semantic models](../connect-data/service-datasets-across-workspaces.md) that are created using a [star schema](star-schema.md) design could achieve a better result.

### Decide how to handle dashboard conversions

In the BI industry, a dashboard is a collection of visuals that displays key metrics on a single page. However, in Power BI, a dashboard represents a specific visualization feature that can only be created in the Power BI service. When migrating a dashboard from a legacy BI platform, you have two choices:

- The legacy dashboard can be recreated as a Power BI *report*. Most reports are created with Power BI Desktop. Paginated reports and Excel reports are alternative options, too.
- The legacy dashboard can be recreated as a Power BI *dashboard*. [Dashboards](../explore-reports/end-user-dashboards.md) are a visualization feature of the Power BI service. Dashboard visuals are often created by pinning visuals from one or more reports, Q&A, or Quick Insights.

> [!TIP]
> Because dashboards are a Power BI content type, refrain from using the word *dashboard* in the report or dashboard name.

### Focus on the big picture when recreating visuals

Every BI tool has its strengths and focus areas. For this reason, the exact report visuals you depended on in a legacy BI platform might not have a close equivalent in Power BI.

When recreating report visuals, focus more on the big picture business questions that are being addressed by the report. It removes the pressure to replicate the design of every visual in precisely the same way. While content consumers appreciate consistency when using migrated reports, it's important not to get caught up in time-consuming debates about small details.

## Related content

In the [next article in this Power BI migration series](powerbi-migration-create-validate-content.md), learn about stage 4, which is concerned with creating and validating content when migrating to Power BI.

Other helpful resources include:

- [Microsoft's BI transformation](center-of-excellence-microsoft-business-intelligence-transformation.md)
- [Power BI implementation planning](powerbi-implementation-planning-introduction.md)
- Questions? [Try asking the Fabric Community](https://community.fabric.microsoft.com/)
- Suggestions? [Contribute ideas to improve Fabric](https://ideas.fabric.microsoft.com/)

Experienced Power BI partners are available to help your organization succeed with the migration process. To find a Power BI partner, visit the [Microsoft Power BI partners portal](https://www.microsoft.com/power-platform/products/power-bi/partners).
