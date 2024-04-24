---
title: Using enhanced semantic model metadata in Power BI Desktop
description: Learn about enhanced semantic model metadata in Power BI Desktop, which uses a format similar to what is used for Analysis Services tabular models.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 11/10/2023
LocalizationGroup: Connect to data
---
# Using enhanced semantic model metadata

When Power BI Desktop creates reports, it also creates semantic model metadata in the corresponding PBIX and PBIT files. Previously, the metadata was stored in a format that was specific to Power BI Desktop. The metadata used base-64 encoded M expressions and data sources. Power BI made assumptions about how that metadata was stored.

With the release of the *enhanced semantic model metadata* feature, many of these limitations are removed. PBIX files are automatically upgraded to enhanced metadata upon opening the file. With enhanced semantic model metadata, metadata created by Power BI Desktop uses a format similar to what is used for Analysis Services tabular models, based on the [Tabular Object Model](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo).

The enhanced semantic model metadata feature is strategic and foundational. Future Power BI functionality will be built upon its metadata. These other capabilities stand to benefit from enhanced semantic model metadata:

- [XMLA read/write](/power-platform-release-plan/2019wave2/business-intelligence/xmla-readwrite) for management of Power BI semantic models.
- Migration of Analysis Services workloads to Power BI to benefit from next-generation features.

## Upgrade

Your reports are automatically upgraded to the enhanced metadata format when you open them in the latest version of Power BI Desktop. If the report was saved with unapplied query changes, or there was an error during the auto-upgrade, there's a warning on the report canvas that you still need to upgrade. Selecting **Upgrade report** applies any pending changes and upgrades the data model to the new format.

## Exclude table from report refresh

Once a data model has been upgraded to the enhanced metadata format, some metadata that was previously only used in Power BI Desktop is now respected in the Power BI service as well. This metadata includes the **Include in Report Refresh** option. For upgraded models, if the **Include in Report Refresh** option is unselected in the Power Query Editor, then that table isn't refreshed when the report or semantic model is refreshed in Power BI Desktop or the Power BI service. Reports already published in the Power BI service that aren't yet upgraded to the new enhanced metadata formal need to be upgraded in Power BI Desktop before this new behavior takes effect.

## Considerations and limitations

Before enhanced metadata support, for SQL Server, Oracle, Teradata, and legacy HANA connections, Power BI Desktop added a native query to the data model. This query is used by the Power BI service data models. With enhanced metadata support, the Power BI service data model regenerates the native query at runtime. It doesn't use the query that Power BI Desktop created. In most cases, this retrieval resolves itself correctly, but some transformations don't work without reading underlying data. You might see some errors in reports that previously worked. For example, an error might say:

- Unable to convert an M query in table 'Dimension City' into a native source query. Try again later or contact support. If you contact support, provide these details.

You can fix your queries in three different places in Power BI Desktop:

- When you apply changes or do a refresh.
- In a warning bar in the Power Query Editor informing you that the expression couldn’t be folded to the data source.

  :::image type="content" source="media/desktop-enhanced-dataset-metadata/enhanced-metadata-apply-query-changes.png" alt-text="Screenshot of Apply query changes message: We couldn't fold the expression to the data source.":::

- When you run evaluations when you open a report to check if you have unsupported queries. Running these evaluations can result in performance implications.

Certain character combinations in M expressions that would be unsupported in the Tabular Object Model (TOM) are also unsupported in the enhanced semantic model metadata environment.

## Related content

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

- [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
- [What's new in Power BI?](../fundamentals/desktop-latest-update.md)
- [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
- [Data types in Power BI Desktop](desktop-data-types.md)
- [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
- [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
