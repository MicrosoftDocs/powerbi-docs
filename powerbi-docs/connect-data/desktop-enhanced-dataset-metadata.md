---
title: Using enhanced dataset metadata in Power BI Desktop
description: This article describes how to use enhanced dataset metadata in Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 12/02/2021
LocalizationGroup: Connect to data
---
# Using enhanced dataset metadata

When Power BI Desktop creates reports, it also creates dataset metadata in the corresponding PBIX and PBIT files. Previously the metadata was stored in a format that was specific to Power BI Desktop. The metadata used base-64 encoded M expressions and data sources. Power BI made assumptions about how that metadata was stored.

With the release of the **enhanced dataset metadata** feature, many of these limitations are removed. PBIX files are automatically upgraded to enhanced metadata upon opening the file. With **enhanced dataset metadata**, metadata created by Power BI Desktop uses a format similar to what is used for Analysis Services tabular models, based on the [Tabular Object Model](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo).


The **enhanced dataset metadata** feature is strategic and foundational. Future Power BI functionality will be built upon its metadata. These other capabilities stand to benefit from enhanced dataset metadata:

- [XMLA read/write](/power-platform-release-plan/2019wave2/business-intelligence/xmla-readwrite) for management of Power BI datasets
- Migration of Analysis Services workloads to Power BI to benefit from next-generation features.

## Upgrade
Your reports will be automatically upgraded to the enhanced metadata format when you open them in the latest version of Power BI Desktop. If the report was saved with unapplied query changes, or there was an error during the auto-upgrade, then you will see a warning on the report canvas indicating that you still need to upgrade. Clicking "Upgrade report" will apply any pending changes and upgrade the data model to the new format. 

## Exclude table from report refresh
Once a data model has been upgraded to the enhanced metadata format some metadata that was previously only used in Power BI Desktop will now be respected in the Power BI Service as well - this includes the "Include in Report Refresh" option. For upgraded models, if the "Include in Report Refresh" option is deselected in the Power Query Editor, then that table will not be refreshed when the report/dataset is refreshed in Power BI Desktop or the Power BI Service. Reports already published in the Power BI Service that are not yet upgraded to the new enhanced metadata formal will need to be upgraded in Power BI Desktop before this new behavior will take effect. 

## Considerations and limitations
Before enhanced metadata support, for SQL Server, Oracle, Teradata, and legacy HANA connections, Power BI Desktop added a native query to the data model. This query is used by Power BI Service data models. With enhanced metadata support, the Power BI service data model regenerates the native query at runtime. It doesn't use the query that Power BI Desktop created. In most cases, this retrieval resolves itself correctly, but some transformations won't work without reading underlying data. You may see some errors in reports that previously worked. For example, the error will say: 

“Unable to convert an M query in table 'Dimension City' into a native source query. Try again later or contact support. If you contact support, provide these details." 

You can fix your queries in three different places in Power BI Desktop:

- When you apply changes or do a refresh.
- In a warning bar in the Power Query Editor informing you that the expression couldn’t be folded to the data source.

    :::image type="content" source="media/desktop-enhanced-dataset-metadata/enhanced-metadata-apply-query-changes.png" alt-text="Screenshot of Apply query changes message: We couldn't fold the expression to the data source.":::

- When you run evaluations when you open a report to check if you have unsupported queries. Running these evaluations can result in performance implications.
- Certain character combinations in M expressions that would be unsupported in the Tabular Object Model (TOM) will also be unsupported in the enhanced dataset metadata environment.



## Next steps

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [What's new in Power BI?](../fundamentals/desktop-latest-update.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
