---
title: Using enhanced dataset metadata in Power BI Desktop (preview)
description: This article describes how to use enhanced dataset metadata in Power BI.
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 03/31/2020
ms.author: davidi

LocalizationGroup: Connect to data
---
# Using enhanced dataset metadata (preview)

When Power BI Desktop creates reports, it also creates dataset metadata in the corresponding PBIX and PBIT files. Previously the metadata was stored in a format that was specific to Power BI Desktop. It used base-64 encoded M expressions and data sources, and assumptions were made about how that metadata was stored.

With the release of the **enhanced dataset metadata** feature, many of these limitations are removed. With the **enhanced dataset metadata** feature enabled, metadata created by Power BI Desktop uses a format similar to what is used for Analysis Services tabular models, based on the [Tabular Object Model](https://docs.microsoft.com/bi-reference/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo).


The **enhanced dataset metadata** feature is strategic and foundational, because future Power BI functionality will be built upon its metadata. Some additional capabilities that stand to benefit from enhanced dataset metadata include [XMLA read/write](https://docs.microsoft.com/power-platform-release-plan/2019wave2/business-intelligence/xmla-readwrite) for management of Power BI datasets, and the migration of Analysis Services workloads to Power BI to benefit from next-generation features.



## Enable enhanced dataset metadata

The **enhanced dataset metadata** feature is currently in preview. To enable enhanced dataset metadata, in Power BI Desktop select **File > Options and settings > options > preview features**, and then select the **Store datasets using enhanced metadata format** checkbox, as shown in the following image. 

![Enable the preview feature](media/desktop-enhanced-dataset-metadata/enhanced-dataset-metadata-01.png)

You'll be prompted to restart Power BI Desktop.

![Restart prompt](media/desktop-enhanced-dataset-metadata/enhanced-dataset-metadata-02.png)

Once the preview feature is enabled, Power BI Desktop attempts to upgrade PBIX and PBIT files that use the previous metadata format. 

> [!IMPORTANT]
> Enabling the **enhanced dataset metadata** feature results in an irreversible upgrade to reports. Any Power BI reports loaded or created with Power BI Desktop, once the **enhanced dataset metadata** enabled, are irreversibly converted to the enhanced dataset metadat format.

## Considerations and limitations

In the preview version, the following limitations apply when the preview feature is enabled.

### Unsupported features and connectors
Upon opening an existing PBIX or PBIT file that hasn't been upgraded, the upgrade will fail if the dataset contains any of the following features or connectors. If such failure happens, there should be no immediate impact to the user experience, and Power BI Desktop continues to use the previous metadata format.

* Python scripts
* Custom connectors
* Azure DevOps Server
* BI Connector
* Denodo
* Dremio
* Exasol
* Indexima
* IRIS
* Jethro ODBC
* Kyligence Enterprise
* Mark Logic ODBC
* Qubole Presto
* Team Desk
* M expressions containing certain character combinations such as “\\n” in column names
* When using datasets with the **enhanced dataset metadata** feature enabled, Single Sign On (SSO) data sources cannot be set up in the Power BI service

In addition, PBIX and PBIT files that have already been successfully upgraded to use **enhanced dataset metadata** *cannot* use the above features or connectors in the current version.

### Lineage view
Datasets using the new metadata format currently don't show links to dataflows in the lineage view in the Power BI service.

## Next steps

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](desktop-what-is-desktop.md)
* [What's new in Power BI Desktop?](desktop-latest-update.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
