---
title: Automatic aggregations 
description: Describes using automatic aggregations to optimize query performance.
author: minewiskan
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 07/06/2021
LocalizationGroup: Admin
---
# Automatic aggregations (Preview)

Automatic aggregations use state-of-the-art machine learning (ML) to continuously optimize DirectQuery datasets for maximum report query performance. Automatic aggregations is built on top of existing [user-defined aggregations](../transform-model/aggregations-advanced.md) infrastructure first introduced with composite models for Power BI. But unlike user-defined aggregations, using automatic aggregations doesn’t require extensive data modeling and query-optimization skills to set up and maintain. Automatic aggregations are both self-training and self-optimizing. They enable dataset owners of any skill level to improve query performance, providing faster report visualizations for even the largest datasets.

With automatic aggregations:

- Report visualizations are faster - An optimal percentage of report queries are returned by an automatically maintained in-memory aggregations cache instead of backend data source systems. Outlier queries that cannot be returned by the in-memory cache are passed directly to the data source using DirectQuery.
- Easy setup - Any dataset owner with workspace admin permissions can enable automatic aggregations and schedule one or more refreshes for the dataset. With the first refresh, automatic aggregations takes over and begins creating the aggregations framework and optimal aggregations. The system automatically tunes itself over time, though with a single slide bar control you can easily fine-tune for your environment.
- Fine-tuning – With a simple and intuitive user interface in dataset Settings, you can easily estimate the performance gains for a different percentage of queries that use the aggregations cache and adjust the percentage for even greater gains.
- Balanced architecture - When compared to pure DirectQuery mode, most query results are instead returned by the Power BI query engine and in-memory aggregations cache. Query processing load on data source systems at peak reporting times is significantly reduced, which means increased scalability in the data source backend.

> [!IMPORTANT]
> Automatic aggregations is in **Preview**. When in preview, functionality and documentation are likely to change.

## Requirements

### Supported plans

Automatic aggregations are supported for **Power BI Premium per capacity**, **Premium per user**, and **Power BI Embedded** datasets.

### Supported data sources

During preview, automatic aggregations is supported for the following data sources:

- Azure SQL Database
- Azure Synapse Dedicated SQL pool
- Google Cloud BigQuery
- Snowflake

### Supported modes

Automatic aggregations are supported for DirectQuery mode datasets. Composite model datasets with both import tables and DirectQuery connections are supported, however automatic aggregations are supported for the DirectQuery connection only.

### Permissions

To enable and configure automatic aggregations, you must be the dataset owner and have **Admin** permissions for the workspace.

## Benefits

With DirectQuery, each time a dataset user opens a report or interacts with a report visualization, DAX queries are passed to the query engine and then on to the backend data source as SQL queries. The data source must then calculate and return the results for each query. Compared to import mode datasets that are stored in-memory, these data source round trips can be both time and process intensive, often causing slow query response times in report visualizations.

When enabled for a DirectQuery dataset, aggregations can help boost query performance by avoiding data source round trips. Aggregated query results are automatically returned by the in-memory cache rather than being sent to and returned by the data source. The result is not only better query performance but also reduced load on the data source systems. With aggregations, only a small portion of report and ad-hoc queries that require aggregations not included in the in-memory cache are passed to the backend data source, just like with pure DirectQuery mode.

:::image type="content" source="media/aggregations-automatic/auto-aggregations.png" border="false" alt-text="Automatic aggregations diagram":::

## Automatic aggregations architecture

When automatic aggregations is enabled for a dataset, with the first dataset refresh for the chosen Day or Week frequency, Power BI begins tracking report queries on a per-user and per-dataset basis in a query log. When Power BI then launches a training operation during a data refresh cycle, Power BI analyzes the query logs with the goal to determine optimal aggregations designs. During training, in-memory aggregations tables are created, updated, or dropped, and queries are sent to the data source to determine aggregations to be included. Calculated aggregations data, however, is not loaded into the in-memory cache during training - it's loaded during the subsequent refresh operation.

:::image type="content" source="media/aggregations-automatic/auto-aggregations-history.png" alt-text="Report query log":::

With this architecture:

- Power BI self-trains and self-optimizes aggregations during dataset refresh. Merely enabling automatic aggregations is not sufficient and requires the user to configure a data refresh schedule or implement a custom refresh solution as explained later in this article.
- Power BI uses ML and a report query log to determine optimal aggregation designs. This query log tracks the queries for the last seven days, which means automatic aggregations are optimized based on historical queries. Any new queries are automatically considered during with the next training operation.

### Metadata elements

Datasets with automatic aggregations enabled contain aggregations tables. You can identify these tables by a `SystemManaged` property as shown in the following code snippet. The `SystemManaged` property is set to `true` for automatic aggregations tables and `false` for regular tables. You should not modify, delete, or create system-managed tables because Power BI takes responsibility for managing these objects. Deleting or modifying these tables could lead to degraded performance.

:::image type="content" source="media/aggregations-automatic/auto-aggs-code.png" alt-text="Auto aggs code":::

Power BI maintains the dataset configuration outside of the dataset. The presence of a system-managed system generated aggregations table in a dataset does not necessarily imply that the dataset is in fact enabled for automatic aggregations. In other words, if you script out a full model definition for a dataset with automatic aggregations enabled, and create a new copy of the dataset (with a different name/workspace/capacity), the new resulting dataset is not yet enabled for automatic aggregations. You still need to enable automatic aggregations for the new dataset in dataset Settings.

> [!NOTE]
> The `SystemManaged` table property is new to the Tabular Object Model (TOM) in Analysis Services client libraries version 19.22.5 and higher. Be sure to upgrade your data modeling and admin tools to the latest version of the client libraries when working with datasets that have automatic aggregations enabled. For example, older versions of SQL Server Management Studio (SSMS) are not yet able to enumerate tables or script out these datasets because the older client libraries do not support the SystemManaged table property.

## Loading new and updated aggregations

While automatic aggregations eliminates the need to create user-defined aggregations tables, a deeper familiarity with the underlying processes are helpful to understand the impact of the configuration and its dependencies. For example, you must perform at least one refresh for either the day or week frequency for Power BI to load the in-memory aggregations cache. Additional refreshes are necessary to improve the aggregations accuracy over time.

Power BI relies on the following processes to generate automatic aggregations:

- As soon as automatic aggregations are enabled for a dataset, Power BI begins to track all report queries in a query log. As mentioned earlier, Power BI maintains seven days of data per dataset.
- During the first data refresh operation for your selected frequency, Power BI initiates a training process to ensure the aggregations adapt to evolving query patterns. While training can only be performed on past queries, the results are sufficiently accurate to ensure future queries are covered. However, there is no guarantee that future queries hit the cache as those queries could be different.
- During every data refresh operation, Power BI loads the in-memory cache with the latest aggregations data.

> [!NOTE]
> Training and refresh operations are process and resource intensive for both the Power BI service and the data source system. Increasing the percentage means more aggregations must be queried and calculated from data sources during training and refresh operations, increasing the probability of excessive use of system resources and potentially causing timeouts.

### Training operations

The first refresh for the selected frequency triggers a training process. For example, if you choose a Day frequency and schedule refreshes at 4:00AM, 9:00AM, 2:00PM, and 7:00PM, the 4:00AM refresh each day will include a training operation and a refresh operation. The 9:00AM, 2:00PM, and 7:00PM scheduled refreshes are refresh operations only.

### Refresh operations

During the refresh operation, Power BI loads new and updated aggregations into the in-memory cache. Consider scheduling more refreshes if you must ensure report queries that hit the aggregations cache are getting results that are most in-sync with the backend data source.

### Frequently updated source data

Periodic re-training ensures that aggregations tables adapt to evolving workloads. However, some data sources update much more frequently than daily. In these scenarios, you have the option to trigger the refreshes using a custom solution based on XMLA endpoints. While Power BI limits the number of refreshes you can schedule in the user interface to 48, refreshes triggered through XMLA are unlimited. Equally important, you do not need to enable automatic aggregations for a dataset in the Power BI portal UI if you perform refreshes programmatically because you define the automatic aggregations configuration in your custom code directly. The following code snippet demonstrates how to trigger training and refresh processes by using the Analysis Services client libraries, which in turn communicate with Power BI using XMLA endpoints. For more information, refer to the Tabular Object Model (TOM) API documentation.

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AnalysisServices.Tabular;

namespace AutoAggs
{
    class Program
    {
        static void Main(string[] args)
        {
            double queryPercentage = 0.8;
            string workspaceUri = "<Specify the URL of the workspace where your dataset resides>";
            string datasetName = "<Specify the name of your dataset>";

            Server sourceWorkspace = new Server();
            sourceWorkspace.Connect(workspaceUri);
            Database dataset = sourceWorkspace.Databases.GetByName(datasetName);

            Console.WriteLine("Press [Enter] to refresh this dataset and apply automatic aggregations "
                + $"to accelerate {queryPercentage * 100} percent of report queries.");

            dataset.Model.RequestRefresh(RefreshType.Full, new PerformanceAcceleratorBehavior  { queryPercentage });
            dataset.Model.SaveChanges();

            Console.WriteLine("\n\rPress [Enter] to exit the sample app...");
            Console.ReadLine();
        }
    }
}

```

> [!NOTE]
> PerformanceAcceleratorBehavior only applies at the model level (not at the level of individual tables) and requires you to perform a full refresh (RefreshType.Full). The RequestRefresh will fail if you specify a refresh type other than RefreshType.Full in combination with a PerformanceAcceleratorBehavior.

### Cache refresh history

Each refresh operation is recorded in the dataset cache refresh history. Among other things, you can verify the configured query percentage and analyze the amount of aggregations that Power BI created. To display the refresh history, in the dataset Settings page, click on Refresh history.

:::image type="content" source="media/aggregations-automatic/cache-refresh-history.png" alt-text="Cache refresh history":::

### Training and refresh failure handling

While Power BI performs training and refresh operations as part of the first dataset refresh day or week frequency you choose, these operations are implemented as separate transactions. If a training operation fails, Power BI might still be able to proceed refreshing the aggregations (and regular tables in a composite model) using the previous training state. In this case, the refresh history will indicate the refresh succeeded but training failed. Query performance might be less optimized but the achieved performance level should still be far superior than a pure DirectQuery dataset without any aggregations.

:::image type="content" source="media/aggregations-automatic/cache-refresh-history-partially-completed.png" alt-text="Refresh history partially completed":::

> [!NOTE]
> If training succeeded but refresh failed, the entire dataset refresh is marked as Failed because the result is an unavailable in-memory aggregations cache.

## User-defined and automatic aggregations

User-defined aggregations in Power BI can be manually configured based on hidden aggregated tables in the dataset. However, configuring user-defined aggregations is often complex, requiring a greater level of data-modelling and query-optimization skills. Automatic aggregations on the other hand eliminate this complexity by letting Power BI determine the query patterns based on machine learning (ML) predictive modeling algorithms. With automatic aggregations enabled, datasets are both self-training and self-optimizing, continuously optimizing cached query results. As client report query patterns change, automatic aggregations adjust, prioritizing and caching those aggregations used most often.

Automatic aggregations predictive modeling runs at regular user-defined intervals. Power BI maintains and analyzes query logs on a per user and per dataset basis to automatically create and manage aggregations as an AI-driven system.

### Side-by-side

Because automatic aggregations are built on top of the existing user-defined aggregations infrastructure, it's possible to use both user-defined and automatic aggregations together in the same dataset. Skilled data modelers can define aggregations for tables using DirectQuery, Import (with or without Incremental refresh), or Dual storage modes, while at the same time enjoying the benefits of additional automatic aggregations for queries over DirectQuery connections that don’t hit the user-defined aggregation tables. This flexibility enables balanced architectures that can reduce query loads and avoid bottlenecks.

Aggregations created in the in-memory cache by the automatic aggregations training algorithm are identified as System aggregations. The training algorithm creates and deletes only those System aggregations as reporting queries are analyzed and adjustments are made to maintain the optimal aggregations for the dataset. Both user-defined and automatic aggregations are refreshed with dataset refresh. Only those aggregations created by automatic aggregations and marked as system-generated aggregations are included in automatic aggregations processing.

## Query caching and automatic aggregations

Power BI Premium also supports [Query caching in Power BI Premium/Embedded](../connect-data/power-bi-query-caching.md) to maintain query results, which is a different feature from aggregations. With query caching, Power BI Premium uses its local caching service to implement caching, whereas automatic aggregations are implemented at the dataset level. With query caching, the service only caches queries for the initial report page load, therefore query performance isn't improved when users interact with a report. In contrast, automatic aggregations optimizes the majority of report queries by pre-caching aggregated query results, including for those queries generated when users interact with reports. Query caching and automatic aggregations can both be enabled side-by-side, but it may not be necessary.

## Application Lifecycle Management

From development to test and from test to production, automatic aggregations architecture must be carefully considered for datasets with automatic aggregations enabled.

### Deployment pipelines

When using deployment pipelines, Power BI can copy the datasets with their dataset configuration from the current stage into the target stage. However, automatic aggregations must be reset in the target stage as the settings do no get transferred from current to target stage. You can also deploy content programmatically, using the deployment pipelines REST APIs. To learn more about this process, see [Automate your deployment pipeline using APIs and DevOps](/power-query/connectors/datalakestorage).

### Custom ALM solutions

If you use a custom ALM solution based on XMLA endpoints, keep in mind that your solution might be able to copy system-generated and user-created aggregations tables as part of the dataset metadata. However, you must enable automatic aggregations after each deployment step at the target stage manually. Power BI will retain the configuration if you overwrite an existing dataset.

> [!NOTE]
> If you upload or republish a dataset as part of a Power BI Desktop (.pbix) file, system-created aggregation tables are lost as Power BI replaces the existing dataset with all its metadata and data in the target workspace.

### Altering a dataset

When altering a dataset with automatic aggregations enabled via XMLA endpoints, such as by adding or removing tables, Power BI preserves any existing aggregations that can be preserved and removes those that are no longer needed or relevant. However, query performance might be impacted until the next training phase is triggered.

## Monitor with Azure Log Analytics

Azure Log Analytics (LA) is a service within Azure Monitor which Power BI can use to save activity logs. With Azure Monitor suite, you can collect, analyze, and act on telemetry data from your Azure and on-premises environments. It offers long-term storage, an ad-hoc query interface and API access to allow data export and integration with other systems. To learn more, see [Using Azure Log Analytics in Power BI](../transform-model/log-analytics/desktop-log-analytics-overview.md).

If Power BI is configured with an Azure LA account, as described in [Configuring Azure Log Analytics for Power BI](../transform-model/log-analytics/desktop-log-analytics-configure.md), you can analyze the success rate of your automatic aggregations. Among other things, you can determine if report queries are answered from the in-memory cache.

To leverage this ability, download the PBIT template from [here](https://aka.ms/byola_pbit_as) and connect it to your log analytics account, as described in this [post](https://powerbi.microsoft.com/blog/announcing-long-term-usage-and-performance-insights-public-preview/). In the report, you can view data at three different levels – summary view, DAX query level views, and SQL query level view.

The following image shows the summary page for all the queries. As you can see, the marked chart shows the percentage of total queries that were satisfied by aggregations vs the ones had to utilize the data source.

:::image type="content" source="media/aggregations-automatic/log-analytics-1.png" alt-text="Log analytics queries by aggregations stage":::

The next step to dive deeper is to look at the use of aggregations at a DAX query level. Choose the desired DAX query from the list (bottom left) and drill through to the query history.

:::image type="content" source="media/aggregations-automatic/log-analytics-2.png" alt-text="Log analytics query history":::

This will provide you with a list of all the pertinent queries here. You can further drillthrough to the next level by choosing one of these queries and drilling though.

:::image type="content" source="media/aggregations-automatic/log-analytics-3.png" alt-text="Log analytics query history drillthrough":::

:::image type="content" source="media/aggregations-automatic/log-analytics-4.png" alt-text="Log analytics query history drillthrough query detail":::

Drilling through to the next level will now show the details of the aggregations.

:::image type="content" source="media/aggregations-automatic/log-analytics-5.png" alt-text="Query details":::

## Considerations and limitations

When using automatic aggregations, keep the following limitations in mind:

- Automatic aggregations are not available with Power BI Pro, Azure Analysis Services, or SQL Server Analysis Services.  
- Power BI does not support downloading datasets with automatic aggregations enabled. If you uploaded or published a Power BI Desktop (.pbix) file to Power BI and then enabled automatic aggregations, you can no longer download the PBIX file. Make sure you keep a copy of the PBIX file locally.
- Automatic aggregations are only available for datasets using enhanced metadata. If you want to enable automatic aggregations for an older dataset, upgrade the dataset to enhanced metadata first. To learn more, see [Using enhanced dataset metadata](../connect-data/desktop-enhanced-dataset-metadata.md).
- Do not enable automatic aggregations if the DirectQuery data source is configured for single sign-on and uses dynamic data views or security controls to limit the data a user is allowed to access. Automatic aggregations are not aware of these data source-level controls, which makes it impossible to ensure correct data is provided on a per user basis.
- Calculated columns are not considered for automatic aggregations. If you use a calculated column in DirectQuery mode, such as by using the COMBINEVALUES function to build a relationship based on multiple columns from two DirectQuery tables, the corresponding report queries will not hit the in-memory aggregations cache.
- Automatic aggregations are only available in the Power BI service. Power BI Desktop does not create system-generated aggregations tables.
- If you modify the metadata of a dataset with automatic aggregations enabled, query performance might degrade until the next training process is triggered. As a best practice, you should drop the automatic aggregations, makes the changes, and the retrain.
- Do not modify, delete, or create the system-generated aggregations tables unless you have automatic aggregations disabled and are cleaning up the dataset. The system takes responsibility for managing these objects.
- During **preview**, you must use the Tabular Object Model (TOM) API to work with automatic aggregations programmatically. The Tabular Model Scripting Language (TMSL) to invoke training or specify the query percentage when triggering a data refresh is not yet supported.

## See also

[Configure automatic aggregations](aggregations-auto-cnfigure.md)  
[User-defined aggregations](../transform-model/aggregations-advanced.md)  
[DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)  
