---
title: Using enhanced dataset metadata in Power BI Desktop (preview)
description: This article describes how to use enhanced dataset metadata in Power BI.
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/11/2020
ms.author: davidi

LocalizationGroup: Connect to data
---
# Using enhanced dataset metadata (preview)

When Power BI Desktop creates reports, it also creates dataset metadata in the corresponding PBIX and PBIT files. Previously the metadata was stored in a format that was specific to Power BI Desktop. It used base-64 encoded M expressions and data sources, and assumptions were made about how that metadata was stored.

With the release of the **enhanced dataset metadata** feature, many of these limitations are removed. With the **enhanced dataset metadata** feature enabled, metadata created by Power BI Desktop uses a format similar to what is used for Analysis Services tabular models, based on the [Tabular Object Model](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo).


The **enhanced dataset metadata** feature is strategic and foundational, because future Power BI functionality will be built upon its metadata. Some additional capabilities that stand to benefit from enhanced dataset metadata include [XMLA read/write](https://docs.microsoft.com/power-platform-release-plan/2019wave2/business-intelligence/xmla-readwrite) for management of Power BI datasets, and the migration of Analysis Services workloads to Power BI to benefit from next-generation features.



## Enable enhanced dataset metadata

The **enhanced dataset metadata** feature is currently in preview. To enable enhanced dataset metadata, in Power BI Desktop select **File > Options and settings > options > preview features**, and then select the **Store datasets using enhanced metadata format** checkbox, as shown in the following image. 

![Enable the preview feature](media/desktop-enhanced-dataset-metadata/enhanced-dataset-metadata-01.png)

You'll be prompted to restart Power BI Desktop.

![Restart prompt](media/desktop-enhanced-dataset-metadata/enhanced-dataset-metadata-02.png)

Once the preview feature is enabled, Power BI Desktop attempts to upgrade PBIX and PBIT files that use the previous metadata format. 

> [!IMPORTANT]
> Enabling the **enhanced dataset metadata** feature results in an irreversible upgrade to reports. Any Power BI reports loaded or created with Power BI Desktop, once the **enhanced dataset metadata** enabled, are irreversibly converted to the enhanced dataset metadat format.

## Report backup files

Updating a report to use the **enhanced dataset metadata** feature is irreversible. During the update, however, a report backup file is create to save a version of the report in its original (pre-update) format. The backup file is removed after 30 days. 

To locate the backup report file, do the following:

1. Navigate to the following location: ```C:\Users\<user>\AppData\Local\Microsoft\Power BI Desktop\TempSaves\Backup```. If using the Microsoft Store version of Power BI Desktop, use the following location: ```C:\Users\<user>\Microsoft\Power BI Desktop Store App\TempSaves\Backups``` 

2. Find a copy of the report there with the name and time stamp of the original file.

3. Copy the file to a location you would prefer, in order to preserve it.

4. Make sure the **Enhanced metadata format** preview feature is disabled in Power BI Desktop if you choose to open or use that original file. 

The backup file is created when the report is upgraded, so any changes made after the upgrade are not included. New reports created when the **Enhanced metadata format** feature is enabled do not have a backup file.


## Considerations and limitations

In the preview version, the following limitations apply when the preview feature is enabled.

### Unsupported features and connectors

The following limitations apply:

Upon opening an existing PBIX or PBIT file that hasn't been upgraded, the upgrade will fail if the dataset contains any of the following features or connectors. If such failure happens, there should be no immediate impact to the user experience, and Power BI Desktop continues to use the previous metadata format.

* All custom connectors (May 2020 release limitation)
* Python scripts
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

If you are using the **June 2020** release of Power BI Desktop (or later), all custom connectors and all built-in connectors *are* supported for Power BI Desktop and the Power BI service. During the publish process when using the June 2020 release or later, if the gateway encounters issues then the dataset will successfully publish, but users must republish the report in order to refresh the data. The **Data source settings** dialog is the only indicator that issues occurred with the publishing process.

Reports that use unsupported connectors or features will not be upgraded to the new format. Reports that have already been upgraded, or that were created subsequent to enabling this new feature, will not support adding the listed unsupported features or connectors. 

Queries with dynamic datasources are not supported. Reports that have dynamic datasources will not be upgraded to the new format, and reports that have already been upgraded or were newly created with the feature enabled will not support adding dynamic datasources. A query has a dynamic datasource if the source changes depending on a parameter, function input, or volatile function. 

Queries with errors in upstream steps or branches are not supported. 

In addition, PBIX and PBIT files that have already been successfully upgraded to use **enhanced dataset metadata** *cannot* use the above features (or any unsupported connectors).

### Lineage view
Datasets using the new metadata format currently don't show links to dataflows in the lineage view in the Power BI service.

## Next steps

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [What's new in Power BI Desktop?](../fundamentals/desktop-latest-update.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
