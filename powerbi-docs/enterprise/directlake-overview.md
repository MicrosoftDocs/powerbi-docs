---
title: Learn about Direct Lake in Power BI and Microsoft Fabric
description: Describes using Direct Lake to analyze very large semantic models in Power BI and Microsoft Fabric.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.custom:
  - ignite-2023-fabric
ms.topic: concept-article
ms.date: 11/09/2023
LocalizationGroup: Admin
---
# Direct Lake

*Direct Lake* mode is a groundbreaking semantic model capability for analyzing very large data volumes in Power BI. Direct Lake is based on loading parquet-formatted files directly from a data lake without having to query a Lakehouse or Warehouse endpoint, and without having to import or duplicate data into a Power BI model. Direct Lake is a fast-path to load the data from the lake straight into the Power BI engine, ready for analysis. The following diagram shows how classic import and DirectQuery modes compare with Direct Lake mode.

:::image type="content" source="media/directlake-overview/directlake-diagram.png" border="false" alt-text="Direct Lake feature diagram.":::

In DirectQuery mode, the Power BI engine queries the data at the source, which can be slow but avoids having to copy the data like with import mode. Any changes at the data source are immediately reflected in the query results.

On the other hand, with import mode, performance can be better because the data is cached and optimized for DAX and MDX report queries without having to translate and pass SQL or other types of queries to the data source. However, the Power BI engine must first copy any new data into the model during refresh. Any changes at the source are only picked up with the next model refresh.

Direct Lake mode eliminates the import requirement by loading the data directly from OneLake. Unlike DirectQuery, there is no translation from DAX or MDX to other query languages or query execution on other database systems, yielding performance similar to import mode. Because there's no explicit import process, it's possible to pick up any changes at the data source as they occur, combining the advantages of both DirectQuery and import modes while avoiding their disadvantages. Direct Lake mode can be the ideal choice for analyzing very large models and models with frequent updates at the data source.

Direct Lake also supports [row-level security](./service-admin-ols.md) and [object-level](./service-admin-rls.md) security so users only see the data they have permission to see.

## Prerequisites

Direct Lake is supported on Power BI Premium P and Microsoft Fabric F SKUs only. It's not supported on Power BI Pro, Premium Per User, or Power BI Embedded A/EM SKUs.

### Lakehouse

Before using Direct Lake, you must provision a Lakehouse (or a Warehouse) with one or more Delta tables in a workspace hosted on a supported Power BI or Microsoft Fabric capacity. The Lakehouse is required because it provides the storage location for your parquet-formatted files in OneLake. The Lakehouse also provides an access point to launch the Web modeling feature to create a Direct Lake model.

To learn how to provision a Lakehouse, create a delta table in the Lakehouse, and create a basic model for the Lakehouse, see [Create a Lakehouse for Direct Lake](directlake-create-lakehouse.md).

### SQL endpoint

As part of provisioning a Lakehouse, a SQL endpoint for SQL querying and a default model for reporting are created and updated with any tables added to the Lakehouse. While Direct Lake mode doesn't query the SQL endpoint when loading data directly from OneLake, it's required when a Direct Lake model must seamlessly fall back to DirectQuery mode, such as when the data source uses specific features like advanced security or views that can't be read through Direct Lake. Direct Lake mode also queries the SQL endpoint for schema- and security-related information.

### Data Warehouse

As an alternative to a Lakehouse with SQL endpoint, you can also provision a Warehouse and add tables by using SQL statements or data pipelines. The procedure to provision a standalone Data Warehouse is almost identical to the procedure for a Lakehouse.

## Model write support with XMLA endpoint

Direct Lake models support write operations through the XMLA endpoint by using tools such as SQL Server Management Studio (19.1 and higher), and the latest versions of external BI tools like Tabular Editor and DAX studio. Model write operations through the XMLA endpoint support:

- Customizing, merging, scripting, debugging, and testing Direct Lake model metadata.

- Source and version control, continuous integration and continuous deployment (CI/CD) with Azure DevOps and GitHub.

- Automation tasks like refreshing, and applying changes to Direct Lake models by using PowerShell and REST APIs.

Note that Direct Lake tables created using XMLA applications will initially be in an unprocessed state until the application issues a refresh command. Unprocessed tables fall back to DirectQuery mode. When creating a new semantic model make sure to refresh your semantic model to process your tables.

### Enable XMLA read-write

Before performing write operations on Direct Lake models through the XMLA endpoint, XMLA read-write must be enabled for the capacity.

For Power BI Premium capacities, see [Enable XMLA read-write](service-premium-connect-tools.md#enable-xmla-read-write).

For **Fabric trial** capacities, the trial user has the admin privileges necessary to enable XMLA read-write.

1. In the Admin portal, select **Capacity settings**.

1. Click on the **Trial** tab.

1. Select the capacity with **Trial** and your username in the capacity name. 

1. Expand **Power BI workloads**, and then in the **XMLA Endpoint** setting, select **Read Write**.

    :::image type="content" source="media/directlake-overview/fabric-enable-xmla-readwrite.png" alt-text="Enable XMLA read write for a Fabric trial capacity":::

Keep in mind, the XMLA Endpoint setting applies to all workspaces and models assigned to the capacity.

### Direct Lake model metadata

When connecting to a standalone Direct Lake model through the XMLA endpoint, the metadata looks like any other model. However, Direct Lake models show the following differences:

- The `compatibilityLevel` property of the database object is 1604 or higher.

- The `Mode` property of Direct Lake partitions is set to `directLake`.

- Direct Lake partitions use shared expressions to define data sources. The expression points to the SQL endpoint of a Lakehouse or Warehouse. Direct Lake uses the SQL endpoint to discover schema and security information but loads the data directly from the delta tables (unless Direct Lake must fall back to DirectQuery mode for any reason).

Here's an example XMLA query in SSMS:

:::image type="content" source="media/dl-dataset-metadata.png" alt-text="XMLA query in SSMS":::

To learn more about tool support through the XMLA endpoint, see [Semantic model connectivity with the XMLA endpoint](service-premium-connect-tools.md).

## Fallback

Power BI semantic models in Direct Lake mode read delta tables directly from OneLake. However, if a DAX query on a Direct Lake model exceeds limits for the SKU, or uses features that don’t support Direct Lake mode, like SQL views in a Warehouse, the query can fall back to DirectQuery mode. In DirectQuery mode, queries use SQL to retrieve the results from the SQL endpoint of the Lakehouse or Warehouse, which can impact query performance. You can [disable fallback](#fallback-behavior) to DirectQuery mode if you want to process DAX queries in pure Direct Lake mode only. Disabling fallback is recommended if you don’t need fallback to DirectQuery. It can also be helpful when analyzing query processing for a Direct Lake model to identify if and how often fallbacks occur. To learn more about DirectQuery mode, see [Semantic model modes in the Power BI service](../connect-data/service-dataset-modes-understand.md#directquery-mode).

***Guardrails*** define resource limits for Direct Lake mode beyond which a fallback to DirectQuery mode is necessary to process DAX queries. For details about how to determine the number of parquet files and row groups for a delta table, refer to the [Delta table properties reference](/azure/databricks/delta/table-properties#delta-table-properties).

For Direct Lake semantic models, **Max Memory** represents the upper memory resource limit for how much data can be paged in. In effect, it's not a guardrail because exceeding it does not cause a fallback to DirectQuery; however, it can have a performance impact if the amount of data is large enough to cause paging in and out of the model data from the OneLake data.

The following table lists both resource guardrails and MaxMemory:

| Fabric/Power BI SKUs |Parquet files per table | Row groups per table | Rows per table (millions) | Max model size on disk/OneLake<sup>[1](#mm)</sup> (GB) | Max memory (GB) |
|-------------|-------------------------|-------------------------|------------------------|-------------------------|-------------------------|
| F2          | 1,000                   | 1,000                | 300                       | 10                       |3                       |
| F4          | 1,000                   | 1,000                | 300                       | 10                       |3                       |
| F8          | 1,000                   | 1,000                | 300                       | 10                       |3                       |
| F16         | 1,000                   | 1,000                | 300                       | 20                       |5                       |
| F32         | 1,000                   | 1,000                | 300                       | 40                       |10                      |
| F64/FT1/P1  | 5,000                   | 5,000                | 1,500                     | Unlimited                |25                      |
| F128/P2     | 5,000                   | 5,000                | 3,000                     | Unlimited                |50                      |
| F256/P3     | 5,000                   | 5,000                | 6,000                     | Unlimited                |100                     |
| F512/P4     | 10,000                  | 10,000               | 12,000                    | Unlimited                |200                     |
| F1024/P5    | 10,000                  | 10,000               | 24,000                    | Unlimited                |400                     |
| F2048       | 10,000                  | 10,000               | 24,000                    | Unlimited                |400                     |

<a name="mm">1</a> - If exceeded, Max model size on disk/Onelake will cause all queries to the model to fall back to DirectQuery, unlike other guardrails that are evaluated per query.

Depending on your Fabric or Power BI SKU, additional **Capacity unit** and **Max memory per query** limits also apply to Direct Lake models. To learn more, see [Capacities and SKUs](service-premium-what-is.md#capacities-and-skus).

### Fallback behavior

Direct Lake models include the **DirectLakeBehavior** property, which has three options:

**Automatic** - (Default) Specifies queries fall back to *DirectQuery* mode if data can't be efficiently loaded into memory.

**DirectLakeOnly** - Specifies all queries use Direct Lake mode only. Fallback to DirectQuery mode is disabled. If data can't be loaded into memory, an error is returned. Use this setting to determine if DAX queries fail to load data into memory, forcing an error to be returned.

**DirectQueryOnly** - Specifies all queries use DirectQuery mode only. Use this setting to test fallback performance.

The DirectLakeBehavior property can be configured by using Tabular Object Model (TOM) or Tabular Model Scripting Language (TMSL).

The following example specifies all queries use Direct Lake mode only:

```csharp
// Disable fallback to DirectQuery mode.
//
database.Model.DirectLakeBehavior = DirectLakeBehavior.DirectLakeOnly = 1;
database.Model.SaveChanges();
```

## Analyze query processing

To determine if a report visual's DAX queries to the data source are providing the best performance by using Direct Lake mode, or falling back to DirectQuery mode, you can use Performance analyzer in Power BI Desktop, SQL Server Profiler, or other third party tools to analyze queries. To learn more, see [Analyze query processing for Direct Lake models](directlake-analyze-qp.md).

## Refresh

By default, data changes in OneLake are automatically reflected in a Direct Lake model. You can change this behavior by disabling **Keep your Direct Lake data up to date** in the model's settings.

:::image type="content" source="media/directlake-overview/direct-lake-refresh.png" alt-text="Direct Lake refresh in model settings":::

You may want to disable if, for example, you need to allow completion of data preparation jobs before exposing any new data to consumers of the model. When disabled, you can invoke refresh manually or by using the refresh APIs. Invoking a refresh for a Direct Lake model is a low cost operation where the model analyzes the metadata of the latest version of the Delta Lake table and is updated to reference the latest files in the OneLake.

## Known issues and limitations

- Currently, Direct Lake models can only contain tables and views from a single Lakehouse or Data Warehouse. However, tables in the model based on T-SQL-based views cannot be queried in Direct Lake mode. DAX queries that use these model tables fall back to DirectQuery mode.

- Direct Lake tables cannot currently be mixed with other table types, such as Import, DirectQuery, or Dual, in the same model. Composite models are not yet supported.

- DateTime relationships are not supported in Direct Lake models.

- Calculated columns and calculated tables are not yet supported.

- Some data types may not be supported.

- Direct Lake tables do not support complex delta table column types. Binary and Guid semantic types are also unsupported. You must convert these data types into strings or other supported data types.

- Table relationships require the data types of their key columns to coincide. Primary key columns must contain unique values. DAX queries will fail if duplicate primary key values are detected.

- The length of string column values is limited to 32,764 Unicode characters.

- The floating point value ‘NaN’ (Not A Number) is not supported in Direct Lake models.

- Embedded scenarios that rely on embedded entities are not yet supported.

- Validation is limited for Direct Lake models. User selections are assumed correct and no queries will validate cardinality and cross filter selections for relationships, or for the selected date column in a date table.

- The Direct Lake tab in the Refresh history only lists Direct Lake-related refresh failures. Successful refreshes are currently omitted. 

## Get started

The best way to get started with a Direct Lake solution in your organization is to create a Lakehouse, create a delta table in it, and then create a basic semantic model for the Lakehouse in your Microsoft Fabric or Power BI workspace. To learn more, see [Create a Lakehouse for Direct Lake](directlake-create-lakehouse.md).

## Related content

- [Create a Lakehouse for Direct Lake](directlake-create-lakehouse.md)  
- [Analyze query processing for Direct Lake datasets](directlake-analyze-qp.md)  
