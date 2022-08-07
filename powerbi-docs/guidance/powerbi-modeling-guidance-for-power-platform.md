---
title: "Power BI modeling guidance for Power Platform"
description: "Guidance on how to create Power BI data models for Dataverse, PowerApps, and Dynamics 365."
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 08/07/2022
---

# Power BI modeling guidance for Power Platform

[Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro) is the standard data platform for many Microsoft business application products, including [Dynamics 365 Customer Engagement](/dynamics365/customerengagement/on-premises/basics/basics-guide?view=op-9-1&preserve-view=true) and [Power Apps canvas apps](/power-apps/maker/canvas-apps/getting-started), and also [Dynamics 365 Customer Voice](/dynamics365/customer-voice/about) (formerly Microsoft Forms Pro), [Power Automate approvals](/power-automate/get-started-approvals), [Power Apps portals](/power-apps/maker/portals/overview), and others.

This article provides guidance on how to create a Power BI data model that connects to Dataverse. It describes differences between a Dataverse schema and an optimized Power BI schema, and it provides guidance for expanding the visibility of your business application data in Power BI.

Because of its ease of setup, rapid deployment, and widespread adoption, Dataverse stores and manages an increasing volume of data in environments across organizations. That means there's an even greater need - and opportunity - to integrate analytics with those processes. Opportunities include:

- Report on all Dataverse data moving beyond the constraints of the built-in charts.
- Provide easy access to relevant, contextually filtered reports within a specific record.
- Enhance the value of Dataverse data by integrating it with external data.
- Take advantage of Power BI's built-in artificial intelligence (AI) without the need to write complex code.
- Increase adoption of Power Platform solutions by increasing their usefulness and value.
- Deliver the incredible value of the data in your app to business decision makers.

## Connect Power BI to Dataverse

There are three primary methods to create a Power BI model that connects to Dataverse:

- **Import Dataverse data:** This method caches (stores) Dataverse data in the Power BI model. It delivers fast performance thanks to in-memory querying. It also offers design flexibility to modelers, allowing them to integrate data from other sources. Because of these strengths, it's the default mode when creating a model in Power BI Desktop.
- **Create a DirectQuery connection:** This method is an alternative to importing data. A Power BI DirectQuery model consists only of metadata defining the model structure. When reports query the model, native queries are sent to Dataverse to retrieve data. Consider creating a DirectQuery model when data volumes are too large to cache (or refresh durations take too long), when reports must show near real-time Dataverse data, or when Dataverse must enforce role-based security so that users can only see the data they have privileges to access.
- **Import Dataverse data by using Azure Synapse Link:** This method is a variation on the import method, because it also caches data in the Power BI model, but does so by connecting to [Azure Synapse Analytics](/azure/synapse-analytics/overview-what-is). By using [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/export-to-data-lake), Dataverse tables are continuously replicated to Azure Synapse or Azure Data Lake Storage (ADLS) Gen2.

To determine the right method for your Power BI model, consider:

- Query performance
- Data volume
- Data latency
- Role-based security
- Setup complexity

For a detailed discussion on model frameworks (import, DirectQuery, or composite), their benefits and limitations, and features to help optimize Power BI data models, see [Choose a Power BI model framework](/learn/modules/choose-power-bi-model-framework/).

### Query performance

Queries sent to import models are faster than native queries sent to DirectQuery models. It's because imported data is cached in memory and it's optimized for analytic queries (filter, group, and summarize operations).

Conversely, DirectQuery models must query the underlying data source(s) and that impacts on query performance - especially if the data source(s) store large volumes of data or the data isn't optimized (indexed) for analytic queries. Also, the Power BI DirectQuery workload might overload the data source resources or impact on the performance of other workloads, like operational read and write operations.

### Data volume

When developing an import model, you should strive to minimize the data that is to be loaded into your models. It's especially true for large models, or models that you anticipate will grow to become large over time. For more information, see [Data reduction techniques for import modeling](import-modeling-data-reduction.md).

> [!IMPORTANT]
> Larger model sizes may not be supported by your capacity. A shared capacity can host models up to 1 GB in size, while [Power BI Premium](/power-bi/enterprise/service-premium-what-is) capacities can host much larger models.

DirectQuery models work well with large data volumes because Power BI doesn't store the data. However, there might be a need to optimize the data source to ensure queries perform well.

DirectQuery is a good choice when the report's result set isn't large (meaning that there are fewer than 100,000 rows in the report's source tables, or the result returned to the report after filters are applied is less than 100,000 rows). In this case, you can [create a Power BI report by using the Dataverse connector](/powerapps/maker/data-platform/data-platform-powerbi-connector)

> [!NOTE]
> The 100,000 row size isn't a hard limit. However, each data source query must return a result that's less than 80 MB and within two minutes. Later in this article you will learn how to work within those limitations and other Dataverse DirectQuery design strategies.

When the query result size is in the range of a few hundred thousand rows, you can consider using [Premium features of dataflows](/power-bi/transform-model/dataflows/dataflows-premium-features?tabs=gen2) or [incremental refresh](/power-bi/connect-data/incremental-refresh-overview) datasets.

Larger datasets with millions of rows can benefit from the enterprise-scale supported by Azure Synapse Link for Dataverse. This approach sets up an ongoing managed pipeline that copies Dataverse data into ADLS Gen2 as CSV or Parquet files. The data can then be ingested from the data lake via Azure Synapse and imported into Power BI.

### Data latency

When the Dataverse data changes rapidly and report users need to see current data, a DirectQuery model can deliver near real-time query results.

> [!TIP]
> You can create a Power BI report that uses [automatic page refresh](/power-bi/create-reports/desktop-automatic-page-refresh) when it connects to a DirectQuery model.

Import data models must complete a data refresh to allow reporting on recent data changes.You should be aware that there are limitations on the number of daily scheduled data refresh operations. On a shared capacity, you can schedule up to eight refreshes per day. On a [Premium](/power-bi/enterprise/service-premium-what-is) capacity, you can schedule up to 48 refreshes per day (allowing a 15-minute refresh frequency).

You can consider using [Incremental refresh](/power-bi/connect-data/incremental-refresh-overview) to achieve faster refreshes, and to achieve near real-time with a [DirectQuery partition](/power-bi/connect-data/incremental-refresh-overview#define-policy) (only available with [Premium](/power-bi/enterprise/service-premium-what-is)).

### Role-based security

When there's a need to enforce role-based security, it can directly influence the design of your Power BI model.

Dataverse can enforce complex [role-based security](/power-platform/admin/wp-security-cds) to control access of specific records to specific users. For example, a salesperson is permitted to see only their sales opportunities, while the sales manager can see all sales opportunities for all salespeople. You can tailor the level of complexity based on the needs of your organization.

When you create an import model that connects to Dataverse, its security model no longer applies (it refreshes data using the context of the Power BI dataset credentials). In this case, you must reproduce data permissions by adding [row-level security (RLS)](/power-bi/enterprise/service-admin-rls) to the Power BI model. That requirement could be challenging - or impossible - to do when complex permissions must be enforced. Further, this approach might require ongoing management to ensure that changes in Dynamics are in sync with the Power BI RLS.

A DirectQuery model based on Dataverse can connect by using the security context of the report user. That way, the report user will only see the data they're permitted to access. In this case, there's no need to set up Power BI RLS.

### Setup complexity

Connections to Dataverse, whether for import or DirectQuery models, are straightforward and don't require any special software or elevated Dataverse permissions. That's an advantage for organizations or departments that are getting started. It's also an advantage for organizations that don't need the enterprise features available in an Azure Synapse solution.

The Azure Synapse option requires system administrator access to Dataverse and an Azure subscription. The set up isn't complex, but experience working with Azure Storage and writing SQL queries will be beneficial. Without system administrator access, you won't be able to take advantage of enterprise features.

## Best practices

This section describes design patterns and anti-patterns you should consider when developing a Power BI report over Dataverse data. Only a few of these patterns are unique to Dataverse, but they tend to be common challenges for Dataverse makers when they go about building Power BI reports.

### Focus on a specific use case

Rather than trying to solve *everything*, focus on the specific use case.

This best practice is probably the most common and easily the most challenging anti-pattern to avoid. The attempt to build a single data model that enables all self-service reporting needs is challenging. The reality is that successful data models are built to answer questions around a central set of facts over a single core topic. While that might initially seem to limit the model, it's actually empowering because you can tune and optimize the model for answering questions within that topic.

To help ensure that you and your team have a clear understanding of the model's purpose, ask yourself the following questions:

- What topic area will this model support?
- Who is the audience of the reports?
- What question is the report trying to answer?
- What is the MVD, or *minimum viable dataset*?

Resist combining multiple topic areas into a single data model just because the report user has questions across multiple topic areas that they want addressed by a single report. By breaking that report into multiple reports, each with a focus on a different topic (or [fact table](star-schema.md)), you can produce much more efficient, scalable, and manageable models.

### Design a star schema

Dataverse developers and administrators who are comfortable with the Dataverse schema may be tempted to reproduce the same schema in Power BI. This approach is an anti-pattern, and it's probably the toughest to overcome since it just *feels right* to maintain consistency.

Dataverse, as a relational model, is well suited for its purpose. However, it's not designed as an analytic model that's optimized for [analytical reports](/learn/modules/power-bi-effective-structure/1-introduction). The most prevalent pattern for modeling analytics data is a *star schema* design. Star schema is a mature modeling approach widely adopted by relational data warehouses. It requires modelers to classify their model tables as either dimension or fact. Reports can filter or group by using dimension table columns and summarize fact table columns.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/star-schema.png" alt-text="Diagram of a star schema comprising a single fact table and five dimension tables." border="false":::

For more information, see [Understand star schema and the importance for Power BI](star-schema.md).

### Optimize Power Query queries

A Power Query query is a set of steps that extracts, transforms, and loads source data into a model table. Each step builds on the result of the previous step. As a result, the types of transformations - and even the sequence of steps - can impact on query performance.

The Power Query mashup engine, which evaluates and runs queries, strives to achieve *query folding* whenever possible for reasons of efficiency. Query folding is the ability for a Power Query query to generate a single query statement to retrieve and transform source data.

A query that achieves folding delegates query processing to the source system. But not all queries fold by default. For more information about, see [Power Query query folding](/power-query/power-query-folding).

Optimizing Power Query is a broad topic. To achieve a better understanding of what Power Query is doing at authoring and at refresh time in Power BI Desktop, see [Query diagnostics](/power-query/querydiagnostics).

### Minimize the number of query columns

By default, when you use Power Query to load a Dataverse table, it retrieves all rows and all columns. In the case of the system user table, it could contain more than 1,000 columns. (The columns in the metadata include relationships to other entities and lookups to option labels, so the total number of columns grows with the complexity of the Dataverse table.)

Attempting to retrieve data from all columns is an anti-pattern. It often results in performance bottlenecks during data refresh, and it can cause the Dataverse connector to fail when the data volume exceeds 80 MB.

We recommended that you only retrieve columns that are required by reports. It's often a good idea to reevaluate and refactor queries when report development is complete, allowing you to identify and remove other unused columns. For more information, see [Data reduction techniques for Import modeling (Remove unnecessary columns)](import-modeling-data-reduction.md#remove-unnecessary-columns).

Additionally, ensure that the Power Query *Remove columns* step is introduced early so that it [folds](/power-query/power-query-folding) back to the source. That way, Power Query can avoid the unnecessary work of extracting source data only to discard it later (in an unfolded step).

When you have a table that contains many columns, it might be impractical to use the Power Query interactive query builder. In this case, you can start by creating a blank query. You can then use the [Advanced Editor](/power-bi/transform-model/desktop-query-overview#advanced-editor) to paste in a minimal query that creates a starting point.

Consider the following query that retrieves data from just two columns of the **account** table.

```powerquery-m
let
    Source = CommonDataService.Database("demo.crm.dynamics.com"),
    dbo_account = Source{[Schema="dbo", Item="account"]}[Data],
    #"Removed Other Columns" = Table.SelectColumns(dbo_account, {"accountid", "name"})
in
    #"Removed Other Columns"
```

### Write native queries

When you have specific transformation requirements, you might achieve better performance by using a native query written in Dataverse SQL, which is a subset of Transact-SQL. You can write a native query to:

- Reduce the number of rows (by using a `WHERE` clause).
- Aggregate data (by using the `GROUP BY` and `HAVING` clauses).
- Join tables in a specific way (by using the `JOIN` or `APPLY` syntax).
- Use supported SQL functions.

For more information, see:

- [Use SQL to query data](/power-apps/developer/data-platform/dataverse-sql-query)
- [How Dataverse SQL differs from Transact-SQL](/power-apps/developer/data-platform/how-dataverse-sql-differs-from-transact-sql?tabs=supported)

### Execute native queries with the EnableFolding option

Power Query executes a native query by using the `Value.NativeQuery` function.

It's important to add the `EnableFolding=true` option to ensure queries are folded back to the Dataverse service. A native query won't fold unless this option is added. Enabling this option can result in significant performance improvements - up to 97 percent faster in some cases.

Consider the following query that uses a native query to source selected columns from the **account** table. The native query will fold because the `EnableFolding=true` option is set.

``` powerquery-m
let
    Source = CommonDataService.Database("demo.crm.dynamics.com"),
    dbo_account = Value.NativeQuery(
        Source,
        "SELECT A.accountid, A.name FROM account A"
        ,null
        ,[EnableFolding=true]
    )
in
     dbo_account
```

You can expect to achieve the greatest performance improvements when retrieving a subset of data from a large data volume.

> [!TIP]
> Performance improvement can also depend on how Power BI queries the source database. For example, a measure that uses the `COUNTDISTINCT` DAX function showed almost no improvement with or without the folding hint. When the measure formula was rewritten to use the `SUMX` DAX function, the query folded resulting in a 97 percent improvement over the same query without the hint.

For more information, see [Value.NativeQuery](/powerquery-m/value-nativequery). The `EnableFolding` option isn't documented because it's specific to the Dataverse data source.

### Speed up the evaluation stage

If you're using the [Dataverse connector](/connectors/commondataserviceforapps/) (formerly known as the Common Data Service), you can add the `CreateNavigationProperties=false` option to speed up the evaluation stage of a data import.

The evaluation stage of a data import iterates through the metadata of its source to determine all possible [table relationships](/power-apps/maker/data-platform/create-edit-entity-relationships). That metadata can be extensive, especially for Dataverse. By adding this option to the query, you're letting Power Query know that you're not using those relationships. The option will allow Power BI Desktop to skip that stage of the refresh and move on to retrieving the data.

> [!NOTE]
> Don't use this option if the query expands any relationship columns.

Consider an example that retrieves data from the **account** table. It contains three columns related to territory: **territory**, **territoryid**, and **territoryidname**.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/power-query-editor-territory-table.png" alt-text="Screenshot shows a preview of data for the three territory columns account table." border="false":::

When you set the `CreateNavigationProperties=false` option, the **territoryid** and **territoryidname** columns will remain, but the **territory** column, which is a relationship column (it shows *Value* links), will be excluded. Note that Power Query relationship columns are a different concept to *model relationships*, which propagate filters between model tables.

Consider the following query that uses the `CreateNavigationProperties=false` option (in the **Source** step) to speed up the evaluation stage of a data import.

``` powerquery-m
let
    Source = CommonDataService.Database("demo.crm.dynamics.com"
        ,[CreateNavigationProperties=false]),
    dbo_account = Source{[Schema="dbo", Item="account"]}[Data],
    #"Removed Other Columns" = Table.SelectColumns(dbo_account, {"accountid", "name", "address1_stateorprovince", "address1_country", "industrycodename", "territoryidname"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Other Columns", {{"name", "Account Name"}, {"address1_country", "Country"}, {"address1_stateorprovince", "State or Province"}, {"territoryidname", "Territory"}, {"industrycodename", "Industry"}})
in
    #"Renamed Columns"
```

You're likely to experience significant performance improvement when a Dataverse table has lots of relationships with other tables. For example, because the **SystemUser** table is related to every other table in the database, refresh performance of this table would benefit by setting the `CreateNavigationProperties=false` option.

> [!NOTE]
> This option can improve the performance of data refresh of import or dual storage tables, including the process of applying Power Query Editor window changes. It doesn't improve the performance of interactive cross-filtering of DirectQuery storage tables.

### Helpful hint: When Dataverse choice labels are blank

If you discover that Dataverse choice labels are blank in Power BI, you may need to apply a fix.

In this case, open the Dataverse Maker Portal, navigate to the **Solutions** area, and then select **Publish all customizations**. The publication process will update the TDS endpoint with the latest metadata making those option labels available to Power BI.

For more information about Dataverse choice labels, see [Access Dataverse choices with Power BI](/power-apps/maker/data-platform/azure-synapse-link-choices-powerbi).

## Considerations for DirectQuery models

When model tables have their storage mode set to DirectQuery, queries made to that table are passed through to the data source. Only certain data sources, including Dataverse, support this storage mode.

Generally, you should import data to Power BI wherever possible. However, there are several benefits to using DirectQuery storage mode. Consider using this storage mode when:

- You need to model large volumes of data, and importing large data volumes could be impractical or data refreshes could take a long time to complete.
- The source data is fast-changing and report users need to see up-to-date data.
- You need Dataverse to enforce user-specific permissions.

Bear in mind that there are many limitations related to DirectQuery storage mode:

- Power Query (M) queries can't be overly complex because these queries must translate to native queries that are supported by Dataverse. So, for example, it's not possible to use pivot or unpivot transformations.
- Analytic query performance can be slow, especially if Dataverse isn't optimized (with indexes or materialized views), or there aren't sufficient resources for the analytic workload.
- Analytic queries can impact on the performance of Dataverse. It could result in a slower experience for other workloads, including write operations.

For more information about determining when to develop a DirectQuery model, see [Choose a Power BI model framework](/learn/modules/choose-power-bi-model-framework/).

The topics in this section provide you with other considerations when working with DirectQuery storage mode.

### Use dual mode dimension tables

A dual storage mode table is set to use both import and DirectQuery storage modes. At query time, Power BI determines the most efficient mode to use. Whenever possible, Power BI attempts to satisfy queries by using imported data because it's faster.

You should consider setting dimension tables to dual storage mode. That way, slicer visuals and filter card lists, which are often based on dimension table columns, will render more quickly because they'll be queried from imported data.

> [!IMPORTANT]
> When a dimension table needs to inherit the Dataverse security model, it isn't appropriate to use dual storage mode.

Consider the following data model design. Three dimension tables, **Owner**, **Account**, and **Campaign** have a striped upper border, which means they're set to dual storage mode.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/model-diagram-dual-mode-tables.png" alt-text="Screenshot shows a model diagram with three dual storage mode tables as described in the previous paragraph." border="false":::

For more information on table storage modes including dual storage, see [Manage storage mode in Power BI Desktop](/power-bi/transform-model/desktop-storage-mode).

### Enable single-sign on

When you publish a DirectQuery model, you can enable single sign-on (SSO) using Azure Active Directory (Azure AD) OAuth2 for your end users. You should enable this option when Dataverse queries must execute in the context of the report user.

When the SSO option is enabled, Power BI sends the report user's authenticated Azure AD credentials in the queries to Dataverse. This option enables Power BI to honor the security settings that are set up at the data source level. Enabling this setting is highly relevant when model tables need to inherit the Dataverse security model.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/enable-single-sign-on.png" alt-text="Screenshot shows the dataset credentials window with the SSO option enabled." border="false":::

For more information, see [Single sign-on (SSO) for DirectQuery sources](/power-bi/connect-data/service-azure-sql-database-with-direct-connect#single-sign-on).

### Replicate "My" filters in Power Query

When using Dynamics 365 Customer Engagement (CE) and model-driven Power Apps built on Dataverse, you can create views that show only records where a username field, like **Owner**, equals the current user. For example, you might create views named "My open opportunities", "My active cases", and others.

Consider an example of how the Dynamics 365 *My Active Accounts* view includes a filter where *Owner equals current user*.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/my-active-accounts-filters.png" alt-text="Screenshot shows the filters set up for the My Active Accounts view. The filter condition is owner equals current user." border="false":::

You can reproduce this result in Power Query by using a native query that embeds the `CURRENT_USER` token.

Consider the following example that shows a native query that returns only accounts for the current user.

```powerquery-m
let
    Source = CommonDataService.Database("demo.crm.dynamics.com", [CreateNavigationProperties=false],
    dbo_account = Value.NativeQuery(Source, "
        SELECT
            accountid, accountnumber, ownerid, address1_city, address1_stateorprovince, address1_country
        FROM account
        WHERE statecode = 0
            AND ownerid = CURRENT_USER
    ", null, [EnableFolding]=true])
in
    dbo_account
```

This query will retrieve data by filtering the **ownerid** column by the current user. When you publish the model to the Power BI service, you must enable single sign-on (SSO) so Power BI will send the report user's authenticated Azure AD credentials to Dataverse.

## Enterprise scale with Azure Synapse Link

Dataverse includes the ability to synchronize tables to Azure Data Lake Storage (ADLS) and then connect to that data through an Azure Synapse workspace. With minimal effort, you can set up [Azure Synapse Link](/power-apps/maker/data-platform/export-to-data-lake) to populate Dataverse data into Azure Synapse and enable data teams to discover deeper insights.

Azure Synapse Link enables a continuous replication of the data and metadata from Dataverse into the data lake, and it provides a serverless SQL pool as a convenient data source for Power BI queries.

The strengths of this approach are significant. Customers gain the ability to run analytics, business intelligence, and machine learning workloads across Dataverse data by using various advanced tooling, such as Apache Spark, Power BI, Azure Data Factory, Azure Databricks, and Azure Machine Learning.

### Create an Azure Synapse Link for Dataverse

To create an Azure Synapse Link for Dataverse, you'll need the following prerequisites in place.

- System administrator access to the Dataverse environment.
- Azure Data Lake Storage:
  - You must have a storage account to use with ADLS Gen2.
  - You must be assigned **Storage Blob Data Owner** and **Storage Blob Data Contributor** access to storage account. For more information, see [Role-based access control (Azure RBAC)](/azure/storage/blobs/data-lake-storage-access-control-model).
  - The storage account must enable [hierarchical namespace](/azure/storage/blobs/data-lake-storage-namespace).
  - It's recommended that the storage account use [read-access geo-redundant storage (RA-GRS)](/azure/storage/common/storage-redundancy#redundancy-in-a-secondary-region).
- Synapse workspace:
  - You must have access to a Synapse workspace and be assigned **Synapse Administrator** access. For more information, see [Built-in Synapse RBAC roles and scopes](/azure/synapse-analytics/security/synapse-workspace-synapse-rbac-roles#built-in-synapse-rbac-roles-and-scopes).
  - The workspace must be in the same region as the ADLS Gen2 storage account.

Set up involves signing in to Power Apps and connecting Dataverse to the Synapse workspace. A wizard-like experience allows you to create a new link by selecting the storage account and the tables to export. Azure Synapse Link copies data to the ADLS Gen2 storage and automatically creates views in the built-in Azure Synapse serverless SQL pool. You can then connect to those views to create a Power BI data model.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/azure-synapse-link-for-dataverse.png" alt-text="Diagram showing Azure Synapse Link copying data to ADLS Gen2 storage, and Power BI connecting to Azure Synapse Analytics." border="false":::

> [!TIP]
> For complete documentation about creating, managing, and monitoring Azure Synapse Link see [Create an Azure Synapse Link for Dataverse with your Azure Synapse Workspace](/powerapps/maker/data-platform/azure-synapse-link-synapse).

### Create a second serverless SQL pool

You can create a second serverless SQL pool and use it to add custom report views. This way, you can present a simplified set of data to the Power BI creator that allows them to build a data model based on useful and relevant data. The new serverless SQL pool becomes the creator's primary source connection and a friendly representation of the data sourced from the data lake.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/azure-synapse-link-for-dataverse-serverless.png" alt-text="Diagram showing Azure Synapse Link copying data to ADLS Gen2 storage, and Power BI connecting to Azure Synapse Analytics. It includes custom report views." border="false":::

This approach delivers data to Power BI that's focused, enriched, and filtered.

You can create a serverless SQL pool the Synapse workspace by using [Azure Synapse Studio](/azure/synapse-analytics/get-started-create-workspace). Select **Serverless** as the SQL pool type and enter a database name. Power Query can connect to this pool by connecting to the workspace SQL endpoint.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/create-serverless-sql-pool.png" alt-text="Screenshot of the Create SQL database process in Synapse Studio.":::

### Create custom views

In the architecture model, consider adding custom views that wrap serverless SQL pool queries. The views will serve as straightforward, clean sources of data that Power BI connects to. The views should:

- Include the labels associated with choice fields.
- Reduce complexity by including only the columns required for data modeling.
- Filter out unnecessary rows, such as inactive records.

Consider the following view that retrieves campaign data.

```sql
CREATE VIEW [VW_Campaign] AS
    SELECT
        [Base].[campaignid] AS [CampaignID]
        [Base].[name] AS [Campaign],
        [campaign_Status].[LocalizedLabel] AS [Status],
        [campaign_typecode].[LocalizedLabel] AS [Type Code]
    FROM
        [dataverse_adl].[dbo].[campaign] AS [Base]
        LEFT OUTER JOIN [dataverse_adl].[dbo].[OptionsetMetadata] AS [campaign_typecode]
            ON [Base].[typecode] = [campaign_typecode].[option]
               AND [campaign_typecode].[LocalizedLabelLanguageCode] = 1033
               AND [campaign_typecode].[EntityName] = 'campaign'
               AND [campaign_typecode].[OptionSetName] = 'typecode'
        LEFT OUTER JOIN [dataverse_adl].[dbo].[StatusMetadata] AS [campaign_Status]
            ON [Base].[statuscode] = [campaign_Status].[status]
               AND [campaign_Status].[LocalizedLabelLanguageCode] = 1033
               AND [campaign_Status].[EntityName] = 'campaign'
    WHERE
        [Base].[statecode] = 0;
```

Notice that the view includes only four columns, each aliased with a friendly name. There's also a `WHERE` clause to return only necessary rows, in this case active campaigns. Also, the view queries the campaign table that's joined to the **OptionsetMetadata** and **StatusMetadata** tables in order to retrieve choice labels.

> [!TIP]
> For more information on how to retrieve metadata, see [Access choice labels directly from Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/azure-synapse-link-choice-labels).

### Query appropriate tables

Dataverse data is continually synchronized with the data in the data lake. In the case of high-usage activity, simultaneous writes and reads can create locks that cause reads to fail. To ensure reliability when retrieving data, two versions of the table data is synchronized in Synapse Analytics:

- **Near real-time data:** Provides a copy of data synchronized from Dataverse via Azure Synapse Link in an efficient manner by detecting what data has changed since it was initially extracted or last synchronized.
- **Snapshot data:** Provides a read-only copy of near real-time data that's updated at regular intervals (in this case every hour). Snapshot data table names have *_partitioned* appended to their name.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/near-realtime-snapshot-data.png" alt-text="Screenshot of tables showing an account table and an account_partitioned table." border="false":::

If you anticipate that a high volume of read and write operations will be executed simultaneously, query the snapshot tables to avoid read failures.

For more information, see [Access near real-time data and read-only snapshot data](/power-apps/maker/data-platform/azure-synapse-link-synapse#access-near-real-time-data-and-read-only-snapshot-data-preview).

### Connect to Synapse Analytics

To query the serverless SQL pool, you'll need the workspace SQL endpoint. You can retrieve the endpoint from Synapse Studio by opening the serverless SQL pool properties.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/retrieve-workspace-sql-endpoint.png" alt-text="Screenshot of the Synapse Studio SQL pool properties. The workspace SQL endpoint is highlighted." border="false":::

In Power BI Desktop, you can connect to Azure Synapse by using the [Azure Synapse Analytics SQL connector](/power-query/connectors/azuresqldatawarehouse). When prompted for the server, enter the workspace SQL endpoint.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/connect-to-synapse-analytics.png" alt-text="Screenshot of the SQL Server Database window used to set the server value." border="false":::

## Next steps

For more information related to this article, check out the following resources:

- [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/export-to-data-lake)
- [Understand star schema and the importance for Power BI](star-schema.md)
- [Data reduction techniques for Import modeling](import-modeling-data-reduction.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
