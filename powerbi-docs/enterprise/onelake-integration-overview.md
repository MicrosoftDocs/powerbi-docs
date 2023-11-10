---
title: Learn about Microsoft OneLake Delta table integration in Power BI and Microsoft Fabric
description: Describes using Microsoft OneLake integration to automatically write import data into Delta tables.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/02/2023
LocalizationGroup: Enterprise
---
# OneLake integration for semantic models

> [!IMPORTANT]
> OneLake integration for semantic models is currently in **preview**.

With Microsoft OneLake integration for semantic models, data imported into model tables can also be automatically written to [*Delta tables*](/azure/databricks/introduction/delta-comparison) in OneLake. The Delta format is the unified table format across all compute engines in Microsoft Fabric. OneLake integration exports the data with all key performance features enabled to provide more seamless data access with higher performance.

Data scientists, database analysts, app developers, data engineers, and other data consumers can then access the same data that drives your business intelligence and financial reports in Power BI. T-SQL, Python, Scala, PySpark, Spark SQL, R, and no-code/low-code solutions can all be used to query data from  Delta tables.

:::image type="content" source="media/onelake-integration-overview/onelake-integration.png" alt-text="Diagram of OneLake integration for semantic models":::

Before implementing a OneLake integration solution in your organization, be sure to read [Considerations and limitations](#considerations-and-limitations) later in this article.

## Prerequisites

OneLake integration for semantic models is supported on Power BI Premium P and Microsoft Fabric F SKUs only. It's not supported on Power BI Pro, Premium Per User, or Power BI Embedded A/EM SKUs.

Before enabling OneLake integration, you must have:

- One or more import semantic models in a workspace on a Power BI Premium or Fabric capacity.
- [Large semantic model storage format](service-premium-large-models.md) enabled for the model.

## Permissions

Model *contributor* (read, write, explore) permissions are required to access the contents of a model folder and create shortcuts linking to the folder in Lakehouse explorer.

## Enable OneLake integration

In your semantic model settings, expand **OneLake integration**, click the slider to **On**, and then select **Apply**.

:::image type="content" border="false" source="media/onelake-integration-overview/enable-onelake-integration.png" alt-text="Enable OneLake integration in model settings.":::

### Refresh model

In order for model import data to be written to a Delta table in OneLake, at least one manual or scheduled refresh for the model must be run. Either run a manual refresh or wait for a scheduled refresh.

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

After exporting, you can use [OneLake file explorer](https://go.microsoft.com/fwlink/?linkid=2235671), which integrates OneLake with your Windows File Explorer, to locate Delta table export files..

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

- During preview, currency data types with values larger than 18 decimal points can have some precision loss when exported to Delta files.

- During preview, semantic models in [BYOK](service-encryption-byok.md) enabled workspaces are not supported.

- During preview, shortcut tables built on top of the exported model in Lakehouse can't be queried by using the SQL endpoint.

- For users with *contributor* permissions for exported model tables but only *viewer* permissions for the workspace, a model folder appears in Lakehouse explorer, but an error is returned when selected.

- Measures, DirectQuery tables, hybrid tables, calculation group tables, and system managed aggregation tables can't be exported to Delta format tables.

## See also

[What is OneLake?](/fabric/onelake/onelake-overview)  
[OneLake file explorer overview](/fabric/onelake/onelake-file-explorer)  
