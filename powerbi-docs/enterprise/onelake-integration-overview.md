---
title: Learn about Microsoft OneLake Delta table integration in Power BI and Microsoft Fabric
description: Describes using Microsoft OneLake integration to automatically write import data into Delta tables.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 03/10/2025
LocalizationGroup: Enterprise
---
# OneLake integration for semantic models

With Microsoft OneLake integration for semantic models, data imported into model tables can also be automatically written to [*Delta tables*](/azure/databricks/introduction/delta-comparison) in OneLake. The Delta format is the unified table format across all compute engines in Microsoft Fabric. OneLake integration exports the data with all key performance features enabled to provide more seamless data access with higher performance.

Data scientists, database analysts, app developers, data engineers, and other data consumers can then access the same data that drives your business intelligence and financial reports in Power BI. T-SQL, Python, Scala, PySpark, Spark SQL, R, and no-code/low-code solutions can all be used to query data from  Delta tables.

:::image type="content" source="media/onelake-integration-overview/onelake-integration.png" alt-text="Diagram of OneLake integration for semantic models":::

Before implementing a OneLake integration solution in your organization, be sure to read [Considerations and limitations](#considerations-and-limitations) later in this article.

## Prerequisites

OneLake integration for semantic models is supported on Power BI Premium P and Microsoft Fabric F SKUs only. It's not supported on Power BI Pro, Premium Per User, or Power BI Embedded A/EM SKUs.

Before enabling OneLake integration, you must have one or more [import semantic models](/fabric/get-started/direct-lake-overview#comparison-to-other-storage-modes) in a workspace on a Power BI Premium or Fabric capacity. Import semantic model is a type of data model where data is fully imported into Power BI's in-memory storage, allowing fast and efficient querying.

## Permissions

Model *contributor* (read, write, explore) permissions are required to access the contents of a model folder and create shortcuts linking to the folder in Lakehouse explorer.

## Enable OneLake integration

In your semantic model settings, expand **OneLake integration**, click the slider to **On**, and then select **Apply**.

:::image type="content" border="false" source="media/onelake-integration-overview/enable-onelake-integration.png" alt-text="Enable OneLake integration in model settings.":::

## Admin portal

Global and tenant admins can control OneLake integration by using the following setting in the Power BI admin portal: 

* **Users can create Fabric items** - enables production-ready Fabric features, including OneLake integration. This setting can be managed at both the organizational level and the capacity level. If disabled, users can't turn on OneLake integration for their semantic models, and any semantic models currently configured for OneLake integration stop exporting import tables to OneLake. OneLake integration is enabled by default for the entire organization. The following image shows this setting enabled:

    :::image type="content" source="media/onelake-integration-overview/enable-onelake-integration-fabric-items.png" alt-text="Screenshot of admin portal setting enabling users to create Fabric items.":::

* **Semantic models can export data to OneLake** - enables semantic models configured for OneLake integration to send import tables to OneLake. Applies to the entire organization. The following image shows this setting enabled:

    :::image type="content" source="media/onelake-integration-overview/enable-onelake-integration-semantic-models.png" alt-text="Screenshot of admin portal setting enabling semantic models to be exported to onelake.":::

### Refresh model

In order for model import data to be written to a Delta table in OneLake, at least one manual or scheduled refresh for the model must be run. Either run a manual refresh or wait for a scheduled refresh. Check the log entries on the OneLake Integration tab in the refresh history to analyze export durations.

## Export OneLake Delta tables

Delta tables can be exported in many ways. If your semantic model has XMLA read-write mode enabled, you can export programmatically by using the [Tabular Object Model (TOM)](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo?view=power-bi-premium-current&preserve-view=true) and [Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true).

For example, you can use SQL Server Management Studio (SSMS) to run the following TMSL command:

```json
{  
 "export": {  
   "layout": "delta",
   "type": "full",  
   "objects": [  
     {  
       "database": "<database name>"  
     }  
   ]  
 }  
}

```

## Explore export files

After exporting, you can use [OneLake file explorer](https://go.microsoft.com/fwlink/?linkid=2235671), which integrates OneLake with your Windows File Explorer, to locate Delta table export files.

1. In OneLake file explorer, right click on the workspace folder, and then select **Sync from OneLake**.

1. Use Windows File Explorer to locate your data files. In the workspace folder, look for a subfolder with a name that matches your semantic model and ends with **.SemanticModel**. The semantic model folder includes every import-mode table in a subfolder that contains the Delta table’s parquet files and log.

    :::image type="content" border="false" source="media/onelake-integration-overview/ssms-export.png" alt-text="TMSL export command in SSMS.":::

## Shortcuts

By creating [shortcuts](/fabric/onelake/onelake-shortcuts) for your semantic model Lakehouse tables, you can provide quick and easy access to them from other workloads in Fabric.

1. In Lakehouse Explorer, right-click **Tables**, and then select **New shortcut**.

1. In **New shortcut**, select **Microsoft OneLake**.  

1. In **Select a data source type**, select your semantic model, and then select the tables you want to include.

    :::image type="content" border="false" source="media/onelake-integration-overview/delta-table-shortcuts.png" alt-text="OneLake shortcuts in Explorer":::

## Considerations and limitations

- Workspace Admins, Members, and Contributors, as well as Users with direct Write permission on a semantic model are granted Read permission on the exported artifact folder in OneLake.
  
- Users with Read permission on a semantic model get Read permission to the artifact folder in OneLake only if there are no RLS/OLS roles defined for the semantic model.
  
- Currency data types with values larger than 18 decimal points can have some precision loss when exported to Delta files.

- Semantic models in [BYOK](service-encryption-byok.md) enabled workspaces aren't supported.

- [Multi-Geo](/fabric/admin/service-admin-premium-multi-geo) capacities aren't yet supported.

- Measures, DirectQuery tables, hybrid tables, calculation group tables, and system managed aggregation tables can't be exported to Delta format tables.

- Old versions of the delta tables are deleted after three days. Other execution engines which use an older but now deleted version of the data must move forward to an available version.

## Related content

- [What is OneLake?](/fabric/onelake/onelake-overview)  
- [OneLake file explorer overview](/fabric/onelake/onelake-file-explorer)  
