---
title: "Semantic models in Power BI"
description: Learn what Power BI semantic models are, how they differ from relational databases, and how Power BI supports third-party semantic models.
author: kgremban
ms.author: kgremban
ms.reviewer: chwade
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: concept-article
ms.date: 04/22/2026
ai-usage: ai-assisted
LocalizationGroup: Connect to data
#customer intent: As a Power BI user, I want to understand what semantic models are and how Power BI supports them so I can choose the right modeling approach for my organization.
---

# Semantic models and third-party compatibility

This article explains what Power BI semantic models are, how they differ from relational databases, and how Power BI approaches support for third-party semantic models.  

## Power BI semantic models

Power BI [semantic models](/fabric/data-warehouse/semantic-models) are the authoritative source of truth for ad-hoc analysis and reporting across countless organizations. Based on the most widely adopted BI semantic modeling technology in the market, Power BI semantic models offer a mature API surface, exceptional performance and scalability for interactive analysis over massive data, and a thriving ecosystem of developers, partners, and third-party tools.

## Business metrics for reusability

Highly curated semantic models surface corporate data using business-friendly naming conventions, abstracting complex business logic for sophisticated calculations, inferred relationships, user hierarchies, metadata translations, and much more. With blazing-fast query performance, users can slice and dice massive datasets at the speed of thought. Together, these capabilities foster trust and drive consistent decisions across the organization.

## Power BI semantic models are accelerators for AI-enabled BI

Power BI semantic models are a key part of [Fabric IQ](/fabric/iq/overview). Natural language data questions are answered more consistently and easily when the AI can rely on business logic encapsulated by semantic models. LLMs are already familiar with well-defined API surface areas for metadata and queries enabling agentic modeling and consumption. Power BI semantic models are already deployed at scale across countless large organizations and primed to accelerate AI-driven consumption at enterprise scale.

## Commitment to open standards and platform

With [Direct Lake](/fabric/fundamentals/direct-lake-overview) storage mode, Power BI semantic models are a key part of Microsoft Fabric’s commitment to open standard formats using Delta Lake parquet, Iceberg, and OneLake. This commitment helps customers avoid lock-in to proprietary vendor storage formats. Power BI semantic models enable open-platform connectivity for a wide range of third-party data visualization tools through compatibility with the [XMLA Endpoint](/fabric/enterprise/powerbi/service-premium-connect-tools). End users can perform ad-hoc analysis from their tool of choice without needing to create local copies of data. Power BI semantic models are highly programmable using Fabric [REST endpoints](/rest/api/fabric/semanticmodel/items) for CRUD operations, [query](/rest/api/power-bi/datasets/execute-queries) execution, [refresh](./asynchronous-refresh.md) management, Python notebook support with [semantic link](/fabric/data-science/semantic-link-power-bi), .NET programmability using the [Tabular Object Model (TOM)](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo), and open metadata definitions using the [Tabular Model Definition Language (TMDL)](/analysis-services/tmdl/tmdl-overview) for automation.

## Relational databases vs. semantic models

A relational database (for example, SQL Server) is designed to store and organize data in structured tables. It defines how data is physically stored and accessed, without focusing on business meaning. Relational algebra defines how to query this data using operations like selection and joins to filter and combine tables and views.

A semantic model provides a business-friendly layer over enterprise data, using clear names, inferred relationships, and predefined metrics. Common calculations like time comparisons, ratios, and financial measures are reusable, enabling non-technical users to perform ad-hoc analysis by creating reports or submitting questions through AI agents, while supporting consistent, trusted decisions.

## Accuracy of results is of paramount importance

Power BI customers rely on the accuracy of semantic model metrics for critical business decisions, with semantic model computations serving as the definitive source of truth. Accuracy of responses is essential to foster trust and drive consistent decisions across customer organizations. Accordingly, any support for third-party semantic models must be implemented through an integration approach that ensures semantic correctness and preserves the integrity of results returned to users.

## Compatibility with third-party semantic models

>[!NOTE]
>Some vendors use different names for their semantic model offerings. For example, Cube semantic layer, dbt Semantic Layer, Snowflake semantic view, and Databricks metric views are names used to describe product offerings for those specific third-party vendors. They target the same use case, but they offer differing levels of maturity.

Power BI supports only the following third-party semantic models:

* SAP BW
* SAP HANA, when treated as a [multidimensional source](./desktop-directquery-sap-hana.md#treat-sap-hana-as-a-multi-dimensional-source-default)
* AtScale

Some vendors are supported as relational database sources through DirectQuery semantic models. However, this support doesn't necessarily extend to their semantic models. Power BI supports only the third-party semantic models stated earlier.

## DirectQuery semantic model usage pattern

>[!NOTE]
>DirectQuery is one of several storage modes available for Microsoft Power BI semantic models. [Direct Lake](/fabric/fundamentals/direct-lake-overview) unlocks incredible performance on Delta Lake data in OneLake without requiring refreshes, while [Import mode](./service-dataset-modes-understand.md#import-mode) focuses on speed and modeling capabilities.

DirectQuery is highlighted here because, if layered with third-party semantic models, it can lead to inaccurate results due to real-time evaluation against the underlying data source.

The following diagram depicts a DirectQuery semantic model usage pattern:

:::image type="content" source="./media/semantic-models-third-party/directquery-usage-pattern.png" alt-text="Diagram that shows the architecture of a DirectQuery semantic model.":::

1. Users interact with visuals in Power BI reports or submit data questions through an AI agent.

1. DAX queries are generated and submitted to the Power BI semantic model running in DirectQuery mode.

1. The semantic model translates the DAX queries to SQL queries and federates them to the underlying relational database. The source database carries out query processing.

Layering semantic models – where a third-party model sits between the Power BI semantic model and the relational database – is generally not supported. Likewise, third-party semantic model vendors typically don't support layering on top of Power BI semantic models in this way either.

## DirectQuery semantic models typically support relational sources but not third-party semantic models to ensure accuracy

Power BI semantic models in DirectQuery mode support hundreds of third-party relational databases (see [Power Query connectors](/power-query/connectors/)). Most connectors don't support third-party semantic models because they would produce incorrect results for users. DirectQuery semantic models typically rely on relational algebra in the source for correctness. For example, semantic models define inferred relationships for predefined aggregation paths. Combining inferred relationships in a third-party semantic model with those in a DirectQuery semantic model can yield incorrect values even for simple measures.

Power BI connects to [SQL Server Analysis Services](/analysis-services/ssas-overview) Multidimensional and Tabular, and [Azure Analysis Services](/analysis-services/azure-analysis-services/analysis-services-overview), without requiring an intermediate DirectQuery semantic model. For more information, see [comparison of live connect and DirectQuery](./service-live-connect-dq-datasets.md).

## Summary

Power BI semantic models are ubiquitous in enterprise BI, representing tens of millions of active semantic models. They provide a business-friendly, high-performance layer over data, acting as a trusted source of truth for AI-driven insights while supporting open standards and broad API surface areas.

Unlike relational databases, which focus on data storage and structure, semantic models add meaning, inferred relationships, and calculations, making it easy for non-technical users to consume. Accuracy is critical, so integrations – notably with third-party semantic models – must preserve correctness. Power BI supports relational data sources in DirectQuery mode. Layering semantic models is generally unsupported because combining multiple semantic layers can lead to incorrect results for customers.
