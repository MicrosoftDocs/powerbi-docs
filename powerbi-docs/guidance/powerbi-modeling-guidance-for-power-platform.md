---
title: "Power BI modeling guidance for Power Platform"
description: "Guidance on how to create a Power BI model for Dataverse, PowerApps, and Dynamics 365."
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 06/10/2022
---

# Power BI modeling guidance for Power Platform

[Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro) is the standard data platform for many Microsoft business application products, including [Dynamics 365 Customer Engagement](/dynamics365/customerengagement/on-premises/basics/basics-guide?view=op-9-1) and [Power Apps canvas apps](/power-apps/maker/canvas-apps/getting-started), and also [Dynamics 365 Customer Voice](/dynamics365/customer-voice/about) (formerly Microsoft Forms Pro), [Power Automate approvals](/power-automate/get-started-approvals), [Power Apps portals](/power-apps/maker/portals/overview), and others.

This article provides guidance on how to create a Power BI model that connects to Dataverse. It describes differences between a Dataverse schema and an optimized Power BI schema, and it provides best practices for expanding the visibility of your business application data in Power BI.

Because of its ease of configuration, rapid deployment, and widespread adoption, Dataverse stores and manages an increasing volume of data in environments across organizations. That means there's an even greater need - and opportunity - to integrate analytics with those processes. Key benefits include:

- Report on all Dataverse data moving beyond the constraints of the built-in charts.
- Provide easy access to relevant, contextually filtered reports within a specific record.
- Enhance the value of Dataverse data by integrating it with external data.
- Take advantage of Power BI's built-in artificial intelligence (AI) without the need to write complex code.
- Increase adoption of Power Platform solutions by increasing their usefulness and value.
- Deliver the incredible value of the data in your app to business decision makers.

## Connect Power BI to Dataverse

There are three primary methods to create a Power BI model that connects to Dataverse:

- **Import Dataverse data:** This method caches (stores) Dataverse data in the Power BI model. This method delivers extremely fast performance thanks to in-memory querying. It also offers design flexibility to modelers, allowing them to integrate data from other sources. Because of these strengths, it's the default mode when creating a new Power BI Desktop solution.
- **Create a DirectQuery connection:** This method is an alternative to importing data. A Power BI DirectQuery model consists only of metadata defining the model structure. When reports query the model, native queries are sent to Dataverse to retrieve data. Consider creating a DirectQuery model when data volumes are too large to cache (or refresh durations take too long), when reports must show near real-time Dataverse data, or when Dataverse must enforce role-based security so that users can only see the data they have privileges to access.
- **Import Dataverse data by using Azure Synapse Link:** This method is a variation on the import method, because it also caches data in the Power BI model, but does so by connecting to [Azure Synapse Analytics](/azure/synapse-analytics/overview-what-is). By using [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/export-to-data-lake), Dataverse tables are continuously replicated to Azure Synapse or Azure Data Lake Storage Gen2 (ADLS Gen2).

To determine the right method for your Power BI model, consider:

- Data volume.
- Data latency.
- Query performance.
- The need to enforce Dataverse role-based security.

### Performance tolerance

Users will have different experiences interacting with a report based on imported data versus one built on DirectQuery. – The Imported data approach will result in a report that is dramatically faster to load and begin interacting with since the data is pre-cached and calculated. In contrast, the DirectQuery report is re-querying the data each time the report is opened, or new filters are applied.

The front-end report experience for a user viewing a report built on imported data is typically a much faster, more responsive report versus one built over DirectQuery. Since the data is already loaded into the data model, any interaction such as a filter/cross-filter or drill-through doesn't require a re-query of the database. This results in a faster, more responsive report interaction experience for the user.

DirectQuery should be used only if other decision points, like the freshness of data, or enforcement of the Dataverse security model, require it. In cases where DirectQuery is needed, the report should be simplified. The amount of data being analyzed in the report are minimized to reduce DirectQuery performance bottlenecks as much as possible.  We'll cover specific DirectQuery performance strategies later in this document.

A good resource on design implications of DirectQuery is [Using DirectQuery in Power BI - Power BI](/power-bi/connect-data/desktop-directquery-about.md#implications-of-using-directquery).

### Data volume

Data volume
The volume of data being transferred from the source into the report has a strong, direct impact on which method to choose. With any approach other than DirectQuery, the impact on the user is minimized since the data is already in Power BI. With DirectQuery, as more data is requested from Dataverse, the time it takes to query and transfer that data also increases, and consequently, the user will wait longer for the report to refresh.

A report designed for front-line workers might be tightly constrained by security or other filters to provide the real-time operational report they need. On the other hand, a report for a group manager or planning team that for example might need to look at many users or a much wider timeframe would result in needing a much larger dataset in their report. The difference between the data volume in these two use cases has a strong influence on the data model design.

DirectQuery is considered most viable when the report's result-set is not significantly large (meaning that there are fewer than 100K records in the report's source tables, or the results returned to the report after filters are applied is less than 100K records.) [Create a Power BI report using the Dataverse connector - Power Apps](/powerapps/maker/data-platform/data-platform-powerbi-connector) (Note that the 100K records size  a hard limit but general guidance. Note that each query must return less than 80MB in under 2 minutes. Later in this document, we'll talk about adapting to those limits and other essential strategies in Dataverse DirectQuery implementations.)

When the query result size is in the range of a few hundred thousand records, Power BI Premium Dataflows or Datasets with Incremental Refresh might be more appropriate. [Incremental refresh for datasets and real-time data in Power BI - Power BI | Microsoft Docs](/power-bi/connect-data/incremental-refresh-overview.md) or [Using incremental refresh with dataflows - Power Query](/power-query/dataflows/incremental-refresh). Either of these would be an option for an organization that has somewhat more data needed in the report and can limit the queries to only recently modified records for the incremental query.

Larger datasets of a few hundred records upwards to multi-million record datasets can utilize the enterprise-scale supported by Dataverse Azure Synapse Link. This approach sets up an ongoing managed pipeline to copy Dataverse data into Azure Data Lake as CSV or Parquet files. The data can then be ingested from the lake via Azure Synapse and imported into Power BI. [Create an Azure Synapse Link for Dataverse with your Azure Synapse Workspace - Power Apps](/powerapps/maker/data-platform/azure-synapse-link-synapse).

### Security complexity

Dataverse supports incredibly complex security models to control the visibility of records to different users. (For example, one sales user might be able only to see their opportunities, but other opportunities are entirely hidden from them, yet a team manager would see all their team's opportunities but not opportunities from another team. – The level of complexity implemented from one organization to another will vary with each organization's needs.) Not every organization implements that level of complexity – and not every report needs to partition the data to accommodate that individualized partitioning of the data.

Suppose the report will be shown to users who each have different permissions controlling which records they are allowed to see. In that case, DirectQuery over Dataverse ensures that Power BI can display data to the user based on that user's permissions from Dataverse.  Two users with different permissions in Dataverse will see only the data they are allowed to see reflected in Power BI when viewing the same report.

Other organizations can manage security by simply controlling which users are allowed to see the report. Any user with permission to the report can see all data in that report. This could be where there are no rules in dynamics partitioning the data – or where, even if there are rules; the users are managers who have permission to see all data anyway. The more flexible and performant approach would be a direct import of the data, whether from Dataverse or via Synapse.

An advantage of imported data may be for organizations that wish to present summaries of a team's key performance indicators such as "Total $ in Pipeline," or "New Lead count" - even when the specifics of those records are not shared with the individual team members. The data can be extracted and summarized before being presented to the report viewer as a KPI without sharing details of the individual records.

Another scenario would be where relatively straightforward data access rules could be implemented using Power BI's Row-Level security. [Row-level security (RLS) in Power BI Report Server - Power BI](/power-bi/report-server/row-level-security-report-server.md) This approach would support the data partitioning with improved performance over the DirectQuery method.
We caution that an RLS implementation should not attempt to mimic the Dataverse security model if the model implemented in Dataverse has any level of complexity implemented through rules around Ownership, Teams, Sharing, Inheritance, etc.

There's no fixed guidance on precisely when the rules become too complex to implement in Power BI's Row Level Security, but keep in mind that a Power BI RLS-based security model is entirely separate and would likely need ongoing management to ensure changes in Dynamics are in synch with the security rules in Power BI.

### configuration complexity

Connections to Dataverse - whether they be direct or import mode - are relatively straightforward and do not require any additional software or elevated permissions in Dataverse. This is an advantage for organizations or departments that are just getting started. It's also an advantage for organizations that do not need the enterprise features available in the Synapse solution.

The Synapse option requires system administrator access to Dataverse and an Azure subscription. Configuration is not complex, but experience with Azure Storage and SQL is beneficial. This may limit which organizations can take advantage of this enterprise-oriented feature.

## Best practices

This sections describes design patterns and anti-patterns you should consider when developing a Power BI report over Dataverse data. Only a few of these patterns are unique to Dataverse, but they tend to be common challenges for Dataverse makers when they go about building Power BI reports.

### Focus on a specific use case

Rather than trying to solve *everything*, focus on the specific use case.

This best practice is probably the most common and easily the most challenging anti-pattern to avoid. The attempt to build a single data model that enables all self-service reporting needs is challenging. The reality is that successful data models are built to answer questions around a central set of facts over a single core topic. While that might initially seem to limit the model, it's actually empowering because you can tune and optimize the model for answering questions within that topic.

To help ensure that you and your team have a clear understanding of the model's purpose, ask yourself the following questions:

- What topic area will this model support?
- Who is the audience of the reports?
- What question is the report trying to answer?
- What's MVD, or *minimum viable dataset*?

Resist combining multiple topic areas into a single data model just because the end customer has questions across multiple topic areas that they want addressed by a single report. Breaking that report into multiple reports, each with a focus on a different topic (or [fact table](/power-bi/guidance/star-schema)), can result in much more efficient, scalable, and manageable models.

### Embrace a star schema design

Dataverse developers and administrators who are comfortable with the Dataverse schema may be tempted to reproduce the schema in Power BI. This approach is an anti-pattern, and it's probably the toughest to overcome since it just *feels right* to maintain consistency.

Dataverse, as a relational model, is well suited for its purpose. However, it's not designed as an analytic model. The most prevalent pattern for modeling analytics data is a *star schema* design. Star schema is a mature modeling approach widely adopted by relational data warehouses. It requires modelers to classify their model tables as either dimension or fact. Reports can filter or group by using dimension table columns and summarize fact table columns.

For more information, see [Understand star schema and the importance for Power BI](/power-bi/guidance/star-schema).

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/star-schema.png" alt-text="Diagram of a star schema comprising a single fact table and five dimension tables." border="false":::

### Minimize the number of query columns

By default, when you use Power Query to load a Dataverse table, it retrieves all rows and all columns. In the case of the system user table, it could contain more than 1,000 columns. (The columns in the metadata include relationships to other entities and lookups to option labels, so the total number of columns grows with the complexity of the Dataverse table.)

Attempting to retrieve data from all columns is an anti-pattern. It often results in performance bottlenecks during data refresh, and it can cause the Dataverse connector to fail when the data volume exceeds 80 MB.

We recommended that you only retrieve columns that are required by reports. It's often a good idea to re-evaluate and refactor queries when report development is complete, allowing you to identify and remove other unused columns. For more information, see [Data reduction techniques for Import modeling (Remove unnecessary columns)](/power-bi/guidance/import-modeling-data-reduction#remove-unnecessary-columns).

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

### Optimize Power Query queries

A Power Query query is a set of steps that extracts, transforms, and loads source data into a model table. Each step builds on the result of the previous step. As a result, the types of transformations - and even the sequence of steps - can impact on query performance.

The Power Query mashup engine, which evaluates and runs queries, strives to achieve *query folding* whenever possible for reasons of efficiency. Query folding is the ability for a Power Query query to generate a single query statement to retrieve and transform source data.

A query that achieves folding delegates query processing to the source system. But not all queries fold by default. For more information about, see [Power Query query folding](/power-query/power-query-folding).

Optimizing Power Query is a broad topic. To achieve a better understanding of what Power Query is doing at authoring and at refresh time in Power BI Desktop, see [Query diagnostics](/power-query/querydiagnostics).

### Write native queries

When you have specific transformation requirements, you might achieve better performance by using a native query written in SQL. You can write a statement to:

- Reduce the number of rows (use a `WHERE` clause).
- Use supported SQL functions.
- Aggregate data (use the `GROUP BY` and `HAVING` clauses).
- Join tables in a specific way (use the `JOIN` or `APPLY` syntax).

For more information, see:

- [Use SQL to query data](/power-apps/developer/data-platform/dataverse-sql-query)
- [How Dataverse SQL differs from Transact-SQL](/power-apps/developer/data-platform/how-dataverse-sql-differs-from-transact-sql?tabs=supported)

### Execute native queries with the EnableFolding option

Power Query executes a native query by using the `Value.NativeQuery` function.

It's important to add the `EnableFolding=true` option to ensure queries are folder back to the Dataverse service. It can result in significant performance improvements, up to 97 percent faster in some cases. A native query won't fold unless this option is added.

Consider the following query that uses a native query to source selected columns from the **account** table. The native query will fold because the `EnableFolding` option is set.

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

**THE FOLLOWING TEXT RELATES TO DIRECTQUERY?** Performance improvement can also depend on how Power BI executes some measures or queries. - I found that one of my measures ("COUNTDISTINCT") showed almost no improvement with or without the folding hint.  I changed the measure to count the distinct rows with an iterator (using SUMX.) That change allowed the measure to begin folding and resulted in a 97% improvement over the same query without the hint.

For more information, see [Value.NativeQuery](/powerquery-m/value-nativequery). The `EnableFolding` option isn't documented because it's specific to the Dataverse data source.

### Speed up the evaluation stage

If you're using the [Dataverse connector](/connectors/commondataserviceforapps/) (formerly known as the Common Data Service), you can add the `CreateNavigationProperties=false` option to speed up the evaluation stage of a data import.

The evaluation stage of a data import iterates through the metadata of its source to determine all possible relationships. That metadata can be extensive, especially for Dataverse. By adding this option to the query, you're letting Power Query know that you're not using those relationships. The option will allow Power BI to skip that stage of the refresh and move on to retrieving the data.

> [!NOTE]
> Don't use this option if the query expands any relationship columns.

Consider an example that retrieves data from the **account** table. It contains three columns related to territory: **territory**, **territoryid**, and **territoryidname**.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/power-query-editor-territory-table.png" alt-text="Screenshot shows a preview of data for the three territory columns account table." border="false":::

When you set the `CreateNavigationProperties=false` option, the **territoryid** and **territoryidname** columns will remain, but the **territory** column, which is a relationship column (it shows *Value* links), will be excluded. Note that relationship columns in Power Query aren't related to model relationships between tables.

Consider the following query that uses the `CreateNavigationProperties=false` option to speed up the evaluation stage of a data import.

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
> This option doesn't improve the performance of interactive cross-filtering of DirectQuery storage tables. It can improve the performance of data refresh of import or dual storage tables, including the process of applying Power Query Editor window changes..

### Helpful hint: When labels are blank

If you discover that choice labels are blank in Power BI, you may need to apply a fix.

In this case, open the Dataverse Maker Portal, navigate to the **Solutions** area, and then select **Publish all customizations**.

The publication process will update the TDS endpoint with the latest metadata making those option labels available to Power BI.

## Considerations for DirectQuery models

DirectQuery is a feature that allows the report to send a query back to the source data at the moment the report is opened. The query can pull effectively real-time results using the current report user's permissions. There are lots of use cases where DirectQuery solves important requirements. However, those features come at a performance cost.

A report built using DirectQuery will never be as fast a report as one built over an 'imported' data model - and data volume needs to be carefully managed to avoid unnecessary slowdowns. Managing both scope and expectations is important.

That said, the above best practices are doubly important to ensure they are being followed with DirectQuery reports - along with these reminders.

### Use dual mode dimension tables

A dual storage mode table is set to use both import and DirectQuery storage modes. At query time, Power BI determines the most efficient mode to use. Whenever possible, Power BI attempts to satisfy queries by using imported data.

Slicer visuals and filter card lists, which are often based on dimension table columns, render more quickly because they're queried from cached data.

> [!IMPORTANT]
> When a dimension table needs to inherit the Dataverse security model, it isn't appropriate to use dual storage mode.

Consider the following data model design. Three dimension tables, **Owner**, **Account**, and **Campaign** have a striped upper border, which means they'a're set to dual storage mode.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/model-diagram-dual-mode-tables.png" alt-text="Screenshot shows a model diagram with three dual storage mode tables as described in the previous paragraph." border="false":::

For more information on table storage modes including dual storage, see [Manage storage mode in Power BI Desktop](/power-bi/transform-model/desktop-storage-mode).

### Enable single-sign on

When you publish a DirectQuery model, you can enable single sign-on (SSO) using Azure Active Directory (Azure AD) OAuth2 for your end users. You should enable this option when Dataverse queries must execute in the context of the end user.

When the SSO option is enabled, Power BI sends their authenticated Azure AD credentials in the queries to Dataverse. This option enables Power BI to respect the security settings that are configured at the data source level. Enabling this setting is highly relevant when model tables need to inherit the Dataverse security model.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/enable-single-sign-on.png" alt-text="Screenshot shows the dataset credentials window with the SSO option enabled." border="false":::

For more information, see [Single sign-on (SSO) for DirectQuery sources](/power-bi/connect-data/service-azure-sql-database-with-direct-connect#single-sign-on).

### Replicate "My" filters in Power Query

When using Dynamics 365 Customer Engagement (CE) and model-driven Power Apps built on Dataverse, you can create views that show only records where a username field, like **Owner**, equals the current user. For example, you might create "My open opportunities", "My active cases", and more.

Consider an example of how the Dynamics 365 *My Active Accounts* view includes a filter where *Owner equals current user*.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/my-active-accounts-filters.png" alt-text="Screenshot shows a preview of data for the three territory columns account table." border="false":::

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

This query will retrieve data by filtering the **ownerid** field by the current user. When you publish the model to the service, you must enable single sign-on (SSO) so that Power BI send the user's authenticated Azure AD credentials to Dataverse.

## Enterprise scale with Azure Synapse Link

Dataverse includes the ability to synchronize tables to Azure Data Lake Storage and then connect to that data through an Azure Synapse Workspace. With only a few clicks, you can set up [Azure Synapse Link](/power-apps/maker/data-platform/export-to-data-lake) to populate Dataverse data into Azure Synapse and enable data teams to discover deeper insights.

Azure Synapse Link enables a continuous replication of the data and metadata from Dataverse into the data lake, and it provides a Serverless SQL pool as a convenient data source for Power BI queries.

The strengths of this approach are significant. Customers gain the ability to run analytics, business intelligence, and machine learning workloads across Dataverse data by using a variety of advanced tooling, such as Apache Spark, Power BI, Azure Data Factory, Azure Databricks, and Azure Machine Learning.

### Create an Azure Synapse Link for Dataverse

To create an Azure Synapse Link for Dataverse, you'll need the following prerequisites in place.

- System administrator access to the Dataverse environment.
- Azure Data Lake Storage:
  - You must have a storage account to use with Azure Data Lake Storage (ADLS) Gen2.
  - You must be assigned **Storage Blob Data Owner** and **Storage Blob Data Contributor** access to storage account. For more information, see [Role-based access control (Azure RBAC)](/azure/storage/blobs/data-lake-storage-access-control-model).
  - The storage account must enable [hierarchical namespace](/azure/storage/blobs/data-lake-storage-namespace).
  - It's recommended that the storage account use [read-access geo-redundant storage (RA-GRS)](/azure/storage/common/storage-redundancy#redundancy-in-a-secondary-region).
- Synapse workspace:
  - You must have access to a Synapse workspace and be assigned **Synapse Administrator** access. For more information, see [Built-in Synapse RBAC roles and scopes](/azure/synapse-analytics/security/synapse-workspace-synapse-rbac-roles#built-in-synapse-rbac-roles-and-scopes).
  - The workspace must be in the same region as the ADLS Gen2 storage account.

Set up involves signing in to Power Apps and connecting Dataverse to the Synapse workspace. A wizard-like experience allows you to create a new link by selecting the storage account and the tables to export. Azure Synapse Link copies data to the ADLS Gen2 storage and automatically creates views in an Azure Synapse serverless SQL pool. You can connect to those views to create a Power BI data model.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/azure-synapse-link-for-dataverse.png" alt-text="Diagram showing Azure Synapse Link copying data to ADLS Gen2 storage, and Power BI connecting to Azure Synapse Analytics.":::

> [!TIP]
> For complete documentation about creating, managing, and monitoring Azure Synapse Link see [Create an Azure Synapse Link for Dataverse with your Azure Synapse Workspace](/powerapps/maker/data-platform/azure-synapse-link-synapse).

### Address challenges

This approach is straightforward, however it can place an additional burden on the user who creates the Power BI model. They will need to use Power Query to sort through the source schema and filter out inactive records, remove irrelevant columns, and provide text values for *choice* values.

For example, consider that a default **Account** table view contains more than 200 columns. The view also returns both active and inactive records. Depending on the customer use case, much of this data is irrelevant and should be excluded by the view.

Additionally, fields of type **Status**, **Status Reason**, and **Choice** are included in the default views and they return numeric values. The corresponding text label is available from metadata delivered in a JSON file. This works in principle but it's unwieldy in practice when writing a query from Power BI to these views.

### Use a second serverless SQL pool

You can create a second serverless SQL pool and use it to add custom report views. This way, you can present a simplified set of data to the Power BI creator that allows them to build a data model based on useful and relevant data. The new serverless SQL pool becomes the creator's primary source connection and a friendly representation of the data sourced from the data lake.

:::image type="content" source="media/powerbi-modeling-guidance-for-power-platform/azure-synapse-link-for-dataverse-serverless.png" alt-text="Diagram showing Azure Synapse Link copying data to ADLS Gen2 storage, and Power BI connecting to Azure Synapse Analytics. It includes custom report views.":::

This approach delivers data to Power BI that's focused, enriched, and filtered.

#### Creating the Serverless SQL Instance to hold custom views

Begin by creating a Serverless SQL database in the same Synapse Workspace. (Serverless SQL pool - Azure Synapse Analytics | Microsoft Docs) –  Select "Serverless" as the Pool Type and give it a name. (Your users will use this database name in their connections, so making it 'friendly' has benefits.)

TODO: Image

#### Join existing Choice values with their Labels for a friendlier view

[Access Dataverse choice labels directly from Azure Synapse Link for Dataverse - Power Apps | Microsoft Docs](/power-apps/maker/data-platform/azure-synapse-link-choice-labels)

TODO: Image (expand with examples?)

#### Using the Metadata views in a query

In any query, you can now join the Metadata views to the table views in a custom Serverless SQL database.

Here's an example query that pulls the base campaign table together with the  optionset and the statuscode metadata in order to return the campaign typecode and statuscode labels.

TODO: Image

### Use custom views for data modeling ease

In the architecture model, we're adding views to the database I've labeled ‘custom report views.' – The views will serve as a more straightforward, cleaner source for Power BI report models to consume.

TODO: Image

The objectives for the views are:

- Provide the needed labels associated with Choice fields to make it much easier to add to queries in Power BI without additional complexity.
- Make it simple – present (only) the needed tables and columns to the report modeler. Dataverse tables often contain a few dozen to several hundred columns that are created and added automatically by the system. Many of these columns are empty or would generally be unneeded in analytics reporting.
- Remove unnecessary rows such as inactive records – or filter out unnecessary rows such as leads or accounts without cases or opportunities. – The specifics will be dependent on the customer's use case.

#### Creating the views for your organization

The specifics of your views are, of course, unique to your organization. Here's an example of a product view. Notice how only a few columns from the product table are included, the stringmap view is referenced to retrieve the productstructure label value, and the view is filtered to include only the rows where statecode = 0 (where Status is "Active")

```sql
CREATE VIEW <Custom_SQL_Database>.[dbo].[Product]
AS
SELECT P.[productid],
       P.[productnumber],
       P.[name],
       productstructure.LocalizedLabel productstructurename,
       P.[parentproductid],
       P.[parentproductidname],
       P.[subjectidname]
FROM <Synapse_SQL_LakeDatabase>.[dbo].[product_partitioned] P
    JOIN <Custom_SQL_Database>.dbo.stringmap productstructure
        ON P.productstructure = productstructure.[option]
           AND productstructure.LocalizedLabelLanguageCode = 1033
           AND productstructure.EntityName = 'product'
           AND productstructure.OptionSetName = 'productstructure'
WHERE P.statecode = 0;
```

Continue creating the views needed for your reports. There's a balance between creating these views with only a specific use case in mind – versus creating a sprawling unmanaged view that misses the value of the focused and tailored approach. You're encouraged to implement a documentation and governance process to ensure that new changes won't break existing reports.

#### Connecting Power BI to the Synapse Serverless SQL Views

The query to connect to the Serverless SQL pool is the same as other SQL connections.

To find the address of your SQL server in Synapse Studio:

1. Open the **Manage** blade.
1. Click on the Built-in SQL Pool.
1. Copy the Workspace SQL endpoint.

TODO: Image

Choose "Get Data" in Power BI and select the "Azure Synapse Analytics SQL" connector.

TODO: Image

Then paste the "Workspace SQL endpoint" from the synapse studio into the 'Server' field.

TODO: Image

From this point, you can choose the database, tables, and specific fields you want to include in the data model.

## Next steps

TODO
