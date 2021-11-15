---
title: Using DirectQuery in Power BI
description: Understand using DirectQuery with Power BI and best practices for how and when to use DirectQuery or other options
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 11/15/2021
LocalizationGroup: Connect to data
---
# About using DirectQuery in Power BI

You can connect to all sorts of different data sources when using *Power BI Desktop* or the *Power BI service*, and make those data connections in different ways. You can *import* data to Power BI, which is the most common way to get data, or connect directly to data in the original source repository, which is known as *DirectQuery*. This article describes DirectQuery capabilities:

* Different connectivity options for DirectQuery
* Guidance for when you should consider using DirectQuery rather than import
* Drawbacks of using DirectQuery
* Best practices for using DirectQuery

Follow best practices for using import versus DirectQuery:

* You should import data to Power BI wherever possible. Importing takes advantage of the high performance query engine of Power BI, and provides a highly interactive and fully featured experience.
* If your goals can't be met by importing data, consider using DirectQuery. For example, if the data is changing frequently and reports must reflect the latest data, DirectQuery may be best. However, using DirectQuery is only feasible when the underlying data source can provide interactive queries, less than 5 seconds for the typical aggregate query, and can handle the query load that will be generated. Additionally, the list of limitations for the use of DirectQuery should be considered carefully.

The set of capabilities offered by Power BI for import and DirectQuery evolve over time. Changes will include providing more flexibility when using imported data, such that import can be used in more cases and eliminating some of the drawbacks of using DirectQuery. Regardless of improvements, when using DirectQuery, the performance of the underlying data source always remains a major consideration. If that underlying data source is slow, using DirectQuery for that source will remain unfeasible.

This article covers DirectQuery with Power BI, and not *SQL Server Analysis Services*. DirectQuery is also a feature of SQL Server Analysis Services. Many of the details described in this article apply to that feature. There are also important differences. For information about using DirectQuery with SQL Server Analysis Services, see [DirectQuery in SQL Server 2016 Analysis Services](https://download.microsoft.com/download/F/6/F/F6FBC1FC-F956-49A1-80CD-2941C3B6E417/DirectQuery%20in%20Analysis%20Services%20-%20Whitepaper.pdf).

This article focuses on the recommended workflow for DirectQuery, where the report is created in Power BI Desktop, but also covers connecting directly in the Power BI service.

## Power BI connectivity modes

Power BI connects to a large number of varied data sources, encompassing:

* Online services (Salesforce, Dynamics 365, others)
* Databases (SQL Server, Access, Amazon Redshift, others)
* Simple files (Excel, JSON, others)
* Other data sources (Spark, Web sites, Microsoft Exchange, others)

For these sources, it's possible to import the data to Power BI. For some, it's also possible to connect using DirectQuery. For a summary of the sources that support DirectQuery, see [Data Sources supported by DirectQuery](power-bi-data-sources.md). More sources will be DirectQuery enabled in the future, focusing primarily on sources that can be expected to deliver good interactive query performance.

SQL Server Analysis Services is a special case. When connecting to SQL Server Analysis Services, you can choose to import the data or use a *live connection*. Using a live connection is similar to DirectQuery. No data is imported and the underlying data source is always queried to refresh a visual. A live connection is different in many other regards, so a different term, *live connection* versus *DirectQuery*, is used.

These three options for connecting to data: *import*, *DirectQuery*, and *live connection*.

### Import connections

For import, when using **Get Data** in Power BI Desktop to connect to a data source like SQL Server, the behavior of that connection is as follows:

* During the initial Get Data experience, the set of tables selected each define a query that will return a set of data. Those queries can be edited before loading the data, for example, to apply filters, or aggregate the data, or join different tables.
* Upon load, all of the data defined by those queries will be imported into the Power BI cache.
* Upon building a visual within Power BI Desktop, the imported data will be queried. The Power BI store ensures the query will be fast. All changes to the visual are reflected immediately.
* Any changes to the underlying data aren't reflected in any visuals. It's necessary to *Refresh* to reimport data.
* Upon publishing the report as a *.pbix* file to the Power BI service, a dataset is created and uploaded to the Power BI service. The imported data is included with that dataset. It's then possible to schedule refresh of that data, for example, to reimport the data every day. Depending upon the location of the original data source, it might be necessary to configure an on-premises data gateway.
* When opening an existing report in the Power BI service, or authoring a new report, the imported data is queried again, ensuring interactivity.
* Visuals, or entire report pages, can be pinned as dashboard tiles. The tiles automatically refresh whenever the underlying dataset refreshes.

### DirectQuery connections

For DirectQuery, when using **Get Data** in Power BI Desktop to connect to a data source, the behavior of that connection is as follows:

* During the initial Get Data experience, the source is selected. For relational sources, a set of tables are selected and each still define a query that logically returns a set of data. For multidimensional sources, like SAP BW, only the source is selected.
* However, upon load, no data is imported into the Power BI store. Instead, upon building a visual within Power BI Desktop, queries are sent to the underlying data source to retrieve the necessary data. The time taken to refresh the visual depends on the performance of the underlying data source.
* Any changes to the underlying data aren't immediately reflected in any existing visuals. It's still necessary to refresh. The necessary queries are resent for each visual, and the visual is updated as necessary.
* Upon publishing the report to the Power BI service, it will again result in a dataset in the Power BI service, the same as for import. However, *no data* is included with that dataset.
* When opening an existing report in the Power BI service, or authoring a new one, the underlying data source is again queried to retrieve the necessary data. Depending upon the location of the original data source, it might be necessary to configure an on-premises data gateway, as is needed for import mode if the data is refreshed.
* Visuals, or entire report pages, can be pinned as Dashboard tiles. To ensure that opening a dashboard is fast, the tiles are automatically refreshed on a schedule, for example, every hour. The frequency of this refresh can be controlled, to reflect how frequently the data is changing, and how important it's to see the latest data. When opening a dashboard, the tiles reflect the data at the time of the last refresh, and not necessarily the latest changes made to the underlying source. You can refresh an open dashboard to ensure it's current.

### Live connections

When connecting to SQL Server Analysis Services, there's an option to either import data from or connect live to, the selected data model. If you use import, you define a query against that external SQL Server Analysis Services source, and the data is imported as normal. If you use connect live, there's no query defined, and the entire external model is shown in the field list.

The situation described in the previous paragraph applies to connecting to the following sources as well, except that there's no option to import the data:

* Power BI datasets, for example, when connecting to a Power BI dataset that has previously been created and published to the service, to author a new report over it.
* Microsoft Dataverse.

The behavior of reports over SQL Server Analysis Services, upon publishing to the Power BI service, is similar to DirectQuery reports in the following ways:

* When opening an existing report in the Power BI service or authoring a new report, the underlying SQL Server Analysis Services source is queried, possibly requiring an on-premises data gateway.
* Dashboard tiles are automatically refreshed on a schedule, such as every hour.

There are also important differences. For instance, for live connections, the identity of the user opening the report is always passed to the underlying SQL Server Analysis Services source.

With these comparisons out of the way, let's focus solely on DirectQuery for the rest of this article.

## When is DirectQuery useful?

The following table describes scenarios where connecting with DirectQuery could be especially useful. It includes cases where leaving the data in the original source would be considered beneficial. The description includes a discussion about whether the specified scenario is available in Power BI.

| Limitation | Description |
| --- | --- |
| Data is changing frequently, and near real-time reporting is needed |Models with imported data can be refreshed at most once per hour (more frequently with Power BI Pro or Power BI Premium subscriptions). If the data is continually changing, and it's necessary for reports to show the latest data, using import with scheduled refresh might not meet those needs. You can stream data directly into Power BI, though there are limits on the data volumes supported for this case. <br/> <br/> Using DirectQuery, by contrast, means that opening or refreshing a report or dashboard always shows the latest data in the source. Additionally, the dashboard tiles can be updated more frequently, as often as every 15 minutes. |
| Data is very large |If the data is very large, it wouldn't be feasible to import it all. DirectQuery, by contrast, requires no large transfer of data, because it's queried in place. <br/> <br/> However, large data might also imply that the performance of the queries against that underlying source is too slow, as discussed in [Implications of using DirectQuery](#implications-of-using-directquery). You don't always have to import the full detailed data. Instead, the data can be pre-aggregated during import. The *Power Query Editor* makes it easy to pre-aggregate during import. In the extreme, it would be possible to import exactly the aggregate data needed for each visual. While DirectQuery is the simplest approach to large data, importing aggregate data might offer a solution if the underlying source is too slow. |
| Security rules are defined in the underlying source |When the data is imported, Power BI connects to the data source using the current user's credentials from Power BI Desktop, or the credentials defined as part of configuring scheduled refresh from the Power BI service. In publishing and sharing such a report with data in *import* mode, be careful to only share with users allowed to see the same data, or to define row-level security as part of the dataset. <br/> <br/> DirectQuery allows for a report viewer's credentials to be passed through to the underlying source and security rules to be applied there. Single sign-on is supported to SQL Azure datasources, and through the data gateway to on-premises SQL servers. This is covered in more detail in [Overview of single sign-on (SSO) for gateways in Power BI](service-gateway-sso-overview.md). |
| Data sovereignty restrictions apply |Some organizations have policies around data sovereignty, meaning that data can't leave the organization premises. A solution based on import would clearly present issues. By contrast, with DirectQuery that data remains in the underlying source. <br/> <br/> However, even with DirectQuery, some caches of data at the visual level are kept in the Power BI service because of scheduled refresh of tiles. |
| Underlying data source is an OLAP source, containing measures |If the underlying data source contains *measures*, such as SAP HANA or SAP Business Warehouse, then importing the data brings other issues. It means that the data imported is at a particular level of aggregation, as defined by the query. For example, measures **TotalSales** by **Class**, **Year**, and **City**. Then if a visual is built asking for data at a higher-level aggregate, such as **TotalSales** by **Year**, it's further aggregating the aggregate value. This aggregation is fine for additive measures, such as **Sum** and **Min**, but it's an issue for non-additive measures, such as **Average**, **DistinctCount**. <br/> <br/> To make it easy to get the correct aggregate data, as needed for the particular visual, directly from the source, it would be necessary to send queries per visual, as in DirectQuery. <br/> <br/> When connecting to SAP Business Warehouse (BW), choosing DirectQuery allows for this treatment of measures. For information about SAP BW, see [DirectQuery and SAP BW](desktop-directquery-sap-bw.md). <br/> <br/> However, currently DirectQuery over SAP HANA treats it the same as a relational source, and provides similar behavior to import. This approach is covered further in [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md). |

In summary, given the current capabilities of DirectQuery in Power BI, it offers the benefits in the following scenarios:

* Data is changing frequently, and near real-time reporting is needed.
* Handling very large data, without the need to pre-aggregate.
* Data sovereignty restrictions apply.
* The source is a multidimensional source containing measures, such as SAP BW.

The details in the previous list relate to the use of Power BI alone. Instead, you could use an external SQL Server Analysis Services or Azure Analysis Services model to import data. Then use Power BI to connect to that model. While that approach would require additional configuration, it does provide greater flexibility. Much larger volumes of data can be imported. There's no restriction on how frequently the data can be refreshed.

## Implications of using DirectQuery

Use of DirectQuery does have potentially negative implications, as detailed in this section. Some of those limitations are slightly different depending upon the exact source that is being used. We address limitations where applicable, and separate articles cover those sources that are substantially different.

### Performance and load on the underlying source

When using DirectQuery, the overall experience depends very much on the performance of the underlying data source. If refreshing each visual, for example, after changing a slicer value, takes a few seconds, usually less than 5 seconds, the experience would be reasonable. The experience might feel sluggish compared to the immediate response when importing the data to Power BI. If the slowness of the source causes individual visuals to take longer than tens of seconds, the experience becomes extremely poor. Queries may even time out.

Along with the performance of the underlying source, pay attention to the load placed upon the source. Load impacts performance. Each user who opens a shared report, and each dashboard tile that refreshes, sends at least one query per visual to the underlying source. This fact requires that the source can handle such a query load, while still maintaining reasonable performance.

### Security implications when combining data sources

It's possible to use multiple data sources in a DirectQuery model, just as when you import data, by using the [Composite models](../transform-model/desktop-composite-models.md) feature. When you use multiple data sources, it's important to understand how data is moved back and forth between the underlying data sources, and the [security implications](../transform-model/desktop-composite-models.md#security-implications) it brings.

### Limited data transformations

Similarly, there are limitations in the data transformations that can be applied within Power Query Editor. With imported data, a sophisticated set of transformations can easily be applied to clean and reshape the data before using it to create visuals, such as parsing JSON documents, or pivoting data from a column to a row form. Those transformations are more limited in DirectQuery.

First, when connecting to an OLAP source like SAP Business Warehouse, no transformations can be defined at all, and the entire external model is taken from the source. For relational sources, like SQL Server, it's still possible to define a set of transformations per query, but those transformations are limited for performance reasons.

Any such transformation will need to be applied on every query to the underlying source, rather than once on data refresh, so they're limited to those transformations that can reasonably be translated into a single native query. If you use a transformation that is too complex, you receive an error that either it must be deleted or the model switched to import.

Additionally, the query that results from the **Get Data** dialog or Power Query Editor will be used in a subselect within the queries generated and sent to retrieve the necessary data for a visual. The query defined in Power Query Editor must be valid within this context. In particular, it's not possible to use a query using Common Table Expressions, nor one that invokes Stored Procedures.

### Modeling limitations

The term *modeling* in this context means the act of refining and enriching the raw data, as part of authoring a report using it. Examples include:

* Defining relationships between tables
* Adding new calculations (calculated columns and measures)
* Renaming and hiding columns and measures
* Defining hierarchies
* Defining the formatting, default summarization and sort order for a column
* Grouping or clustering values

When using DirectQuery, many of these model enrichments can still be made, and certainly there's still the principle that the raw data is being enriched, so as to improve later consumption. However, there are some modeling capabilities that aren't available, or are limited, when using DirectQuery. The limitations are generally applied to avoid performance issues. The set of limitations that are common to all DirectQuery sources are listed here. Additional limitations might apply to individual sources, as described in [Next steps](#next-steps).

* **No built-in date hierarchy:** When importing data, every date/datetime column will also have a built-in date hierarchy available by default. For example, if importing a table of sales orders including a column **OrderDate**, then upon using **OrderDate** in a visual, it will be possible to choose the appropriate level (year, month, day) to use. This built-in date hierarchy isn't available when using DirectQuery. If there's a **Date** table available in the underlying source, as is common in many data warehouses, then the DAX Time Intelligence functions can be used as normal.
* **Date/time support only to second accuracy:** When using time columns in your dataset, Power BI only issues queries to the underlying source to a level of detail of seconds. Queries aren't sent to the DirectQuery source for milliseconds. Remove this part of the times from your source columns.
* **Limitations in calculated columns:** Calculated columns are limited to being intra-row, as in, they can only refer to values of other columns of the same table, without the use of any aggregate functions. Additionally, the DAX scalar functions, such as `LEFT()`, that are allowed, are limited to those functions that can be pushed to the underlying source. The functions vary depending upon the exact capabilities of the source. Functions that aren't supported aren't listed in autocomplete when authoring the DAX for a calculated column, and would result in an error if used.
* **No support for parent-child DAX functions:** When in DirectQuery mode, it's not possible to use the family of `DAX PATH()` functions that generally handle Parent-Child structures, such as chart of accounts, or employee hierarchies.
* **Calculated tables aren't supported:** The ability to define a calculated table using a DAX expression isn't supported in DirectQuery mode.
* **Relationship filtering:** For information about bi-directional filtering, see [Bidirectional cross-filtering](https://download.microsoft.com/download/2/7/8/2782DF95-3E0D-40CD-BFC8-749A2882E109/Bidirectional%20cross-filtering%20in%20Analysis%20Services%202016%20and%20Power%20BI.docx). This whitepaper presents examples in the context of SQL Server Analysis Services. The fundamental points apply equally to Power BI.
* **No Clustering:** When using DirectQuery, it's not possible to use the Clustering capability, to automatically find groups.

### Reporting limitations

Almost all reporting capabilities are supported for DirectQuery models. As such, so long as the underlying source offers a suitable level of performance, the same set of visualizations can be used. There are some important limitations in some of the other capabilities offered in the Power BI service after a report is published:

* **Quick Insights isn't supported:** Power BI Quick Insights searches different subsets of your dataset while applying a set of sophisticated algorithms to discover potentially interesting insights. Given the need for very high performance queries, this capability isn't available on datasets using DirectQuery.
* **Using Explore in Excel will likely result in poorer performance:** You can explore your data by using the Explore in Excel capability on a dataset. This approach allows Pivot Tables and Pivot Charts to be created in Excel. While this capability is supported on datasets using DirectQuery, the performance is generally slower than creating visuals in Power BI, and therefore if the use of Excel is important for your scenarios, this fact should be accounted for in your decision to use DirectQuery.
* **Hierarchies are not shown in Excel:** When connecting using DirectQuery from Excel to an Azure Analysis Services model or Power BI dataset, for example using [Analyze in Excel](../collaborate-share/service-analyze-in-excel.md), any hierarchies defined in the model or dataset are not shown.
* **Maximum length for text columns:** The maximum length of the data in a text column for datasets using DirectQuery is 32,764 characters. Reporting on longer texts than that will result in an error.

### Security

As discussed earlier in this article, a report in DirectQuery always uses the same fixed credentials to connect to the underlying data source, after it's published to the Power BI service. This behavior applies to DirectQuery, not to live connections to SQL Server Analysis Services, which is different in this respect. Immediately after publish of a DirectQuery report, it's necessary to configure the credentials of the user that will be used. Until you configure the credentials, opening the report on the Power BI service would result in an error.

Once the user credentials are provided, then those credentials will be used *whichever user who opens the report*. In this way, it's exactly like imported data. Every user sees the same data, unless row-level security has been defined as part of the report. The same attention must be paid to sharing the report, if there are any security rules defined in the underlying source.

Additionally, 'alternate credentials' aren't supported when making DirectQuery connections to SQL Server from Power BI Desktop. You can use your current Windows credentials or database credentials.

### Behavior in the Power BI service

This section describes the behavior of a DirectQuery report in the Power BI service, to explain the degree of load that will be placed on the back-end data source, given the number of users that the report and dashboard will be shared with, the complexity of the report, and whether row-level security has been defined in the report.

#### Reports – opening, interacting with, editing

When a report is opened, all the visuals on the currently visible page refresh. Each visual generally requires at least one query to the underlying data source. Some visuals might require more than one query. For example, a visual might show aggregate values from two different fact tables, or contain a more complex measure, or contain totals of a non-additive measure like Count Distinct. Moving to a new page refreshes those visuals. Refreshing sends a new set of queries to the underlying source.

Every user interaction on the report might result in visuals being refreshed. For example, selecting a different value on a slicer requires sending a new set of queries to refresh all of the affected visuals. The same is true for clicking on a visual to cross-highlight other visuals, or changing a filter.

Similarly, editing a new report requires queries to be sent for each step on the path to produce the final visual.

There's some caching of results. The refresh of a visual is instantaneous if the exact same results have recently been obtained. If row-level security is defined, such caches aren't shared across users.

#### Dashboard Refresh

Individual visuals, or entire pages, can be pinned to dashboard as tiles. Tiles based on DirectQuery datasets refresh automatically according to a schedule. Tiles send queries to the back-end data source. By default, datasets refresh every hour, but can be configured as part of dataset settings to be between weekly and every 15 minutes.

If no row-level security is defined in the model, each tile is refreshed once, and the results shared across all users. Otherwise, there can be a large multiplier effect. Each tile requires separate queries per user to be sent to the underlying source.

A dashboard with 10 tiles, shared with 100 users, created on a dataset using DirectQuery with row-level security, and configured to refresh every 15 minutes, would result in at least 1000 queries being sent every 15 minutes to the back-end source.

Pay careful consideration to the use of row-level security, and the configuring of the refresh schedule.

#### Time-outs

A time-out of four minutes is applied to individual queries in the Power BI service. Queries taking longer than that will fail. As stressed earlier, we recommend that you use DirectQuery for sources that provide near interactive query performance. This limit is intended to prevent issues from overly long execution times.

### Other implications

Some other general implications of using DirectQuery are as follows:

* **If data is changing, it's necessary to refresh to ensure the latest data is shown:** Given the use of caches, there's no guarantee that the visual is always showing the latest data. For example, a visual might show the transactions in the last day. Because of a slicer being changed, it might refresh to show the transactions for the last two days. The transactions could include recent, newly arrived transactions. Returning the slicer to its original value would result in it again showing the cached value previously obtained.

  Selecting **Refresh** clears any caches and refreshes all the visuals on the page to show the latest data.

* **If data is changing, there's no guarantee of consistency between visuals:** Different visuals, whether on the same page or on different pages, might be refreshed at different times. If the data in the underlying source is changing, there's no guarantee that each visual shows the data at the exact same point of time. Indeed, given that sometimes more than one query is required for a single visual, for example, to obtain the details and the totals, then consistency even within a single visual isn't guaranteed. To guarantee this consistency would require the overhead of refreshing all visuals whenever any visual refreshed, in tandem with the use of costly features like Snapshot Isolation in the underlying data source.

  This issue can be mitigated to a large extent by again selecting **Refresh** to refresh all of the visuals on the page. Even if using import mode, there's a similar problem of guaranteeing consistency while importing data from more than one table.

* **Refresh in Power BI Desktop is needed to reflect any metadata changes:** After a report is published, **Refresh** will refresh the visuals in the report. If the schema of the underlying source has changed, then those changes aren't automatically applied to change the available fields in the field list. If tables or columns have been removed from the underlying source, it might result in query failure upon refresh. Opening the report in Power BI Desktop, and choosing **Refresh** updates the fields in the model to reflect the changes.

* **Limit of 1 million rows returned on any query:** There's a fixed limit of 1 million rows placed on the number of rows that can be returned in any single query to the underlying source. This limit generally has no practical implications, and visuals themselves aren't going to display that many points. However, the limit can occur in cases where Power BI isn't fully optimizing the queries sent, and there's some intermediate result being requested that exceeds the limit. It can also occur while building a visual, on the path to a more reasonable final state. For example, including **Customer** and **TotalSalesQuantity** would hit this limit if there were more than 1 million customers, until some filter were applied.

  The error that would be returned would be: "The resultset of a query to external data source has exceeded the maximum allowed size of '1000000' rows."

* **Can't change from import to DirectQuery mode:** While it's possible to switch a model from DirectQuery mode to use import mode, all the necessary data must be imported. It's also not possible to switch back, primarily because of the set of features not supported in DirectQuery mode. DirectQuery models over multidimensional sources, like SAP BW, also can't be switched from DirectQuery to import, because of the different treatment of external measures.

## DirectQuery in the Power BI service

All sources are supported from Power BI Desktop. Some sources are also available directly from within the Power BI service. For example, it's possible for a business user to use Power BI to connect to their data in Salesforce, and immediately get a dashboard, without use of Power BI Desktop.

Only two of the DirectQuery enabled-sources are available directly in the service:

* Spark
* Azure Synapse Analytics (formerly SQL Data Warehouse)

However, we recommend that any use of DirectQuery over those two sources start within Power BI Desktop. The reason is that when the connection is initially made in the Power BI service, many key limitations will apply. While the start point was easy, starting in the Power BI service, there are limitations on enhancing the resulting report any further. For example, it's not possible then to create any calculations, or use many analytical features, or even refresh the metadata to reflect any changes to the underlying schema.

## Guidance for using DirectQuery successfully

If you're going to use DirectQuery, this section provides you with some high-level guidance on how to ensure success. The guidance in this section is derived from the implications of using DirectQuery that have been described in this article.

### Back-end data source performance

Validate that simple visuals refresh in a reasonable time. A refresh time should be within 5 seconds to have a reasonable interactive experience. If visuals are taking longer than 30 seconds, it's highly likely that further issues will occur following publication of the report. These issues can make the solution unworkable.

If queries are slow, examine the queries being sent to the underlying source, and the reason for the query performance. This article doesn't cover the wide range of database optimization best practices across the full set of potential underlying sources. This article does cover the standard database practices that apply to most situations:

* Relationships based on integer columns generally perform better than joins on columns of other data types.
* The appropriate indexes should be created. Index creation generally means the use of column store indexes in those sources that support them, for example, SQL Server.
* Any necessary statistics in the source should be updated.

### Model Design Guidance

When defining the model, consider following this guidance:

* **Avoid complex queries in Power Query Editor.** Power Query Editor translates a complex query into a single SQL query. The single query appears in the subselect of every query sent to that table. If that query is complex, it might result in performance issues on every query sent. The actual SQL query for a set of steps can be obtained by selecting the last step in Power Query Editor, and choosing **View Native Query** from the context menu.
* **Keep measures simple.** At least initially, we recommend limiting measures to simple aggregates. Then if the measures operate in a satisfactory manner, more complex measures can be defined, but paying attention to the performance for each.
* **Avoid relationships on calculated columns.** This guidance is relevant to databases where you need to do multi-column joins. Power BI today doesn't allow a relationship to be based on multiple columns as the FK/PK. The common workaround is to concatenate the columns together using a calculated column, and base the join on that column. While this workaround is reasonable for imported data, for DirectQuery, it results in a join on an expression. That result commonly prevents use of any indexes, and leads to poor performance. The only workaround is to actually materialize the multiple columns into a single column in the underlying database.
* **Avoid relationships on uniqueidentifier columns.** Power BI doesn't natively support a datatype of `uniqueidentifier`. Defining a relationship between columns of type `uniqueidentifier` column results in a query with a join involving a cast. Again, this approach commonly leads to poor performance. Until this case is specifically optimized, the only workaround is to materialize columns of an alternative type in the underlying database.
* **Hide the to column on relationships.** The *to* column on relationships is commonly the primary key on the *to* table. That column should be hidden. If hidden, it doesn't appear in the field list and can't be used in visuals. Often the columns on which relationships are based are in fact *system columns*, for example, surrogate keys in a data warehouse. It's good practice to hide such columns anyway. If the column does have meaning, then introduce a calculated column that is visible, and that has a simple expression of being equal to the primary key, as in the following example:

  ```sql  
      ProductKey_PK   (Destination of a relationship, hidden)
      ProductKey (= [ProductKey_PK],   visible)
      ProductName
      ...
  ```

* **Examine all uses of calculated columns and data type changes.** Use of these capabilities aren't necessarily harmful. They do result in the queries sent to the underlying source containing expressions rather than simple references to columns. That again might result in indexes not being used.
* **Avoid use of the bi-directional cross filtering on relationships.** Use of bi-directional cross filtering can lead to query statements that don't perform well.
* **Experiment with setting *Assume referential integrity*.** The Assume Referential Integrity setting on relationships enables queries to use `INNER JOIN` statements rather than `OUTER JOIN`. This guidance generally improves query performance, though it does depend on the specifics of the data source.
* **Don't use the relative data filtering in Power Query Editor.** It's possible to define relative date filtering in Power Query Editor. For example, to filter to the rows where the date is in the last 14 days.
  
  ![Filter rows for last 14 days](media/desktop-directquery-about/directquery-about_02.png)
  
  However, this filter is translated into a filter based on the fixed date, as at the time the query was authored. This result can be seen from viewing the native query.
  
  ![Filter rows in native SQL query](media/desktop-directquery-about/directquery-about_03.png)
  
  This result is probably not what you wanted. To ensure the filter is applied based on the date at the time the report runs, instead apply the filter in the report as a Report Filter. Currently, this approach would be done by creating a calculated column calculating the number of days ago, using the `DAX DATE()` function, and then using that calculated column in a filter.

### Report Design Guidance

When creating a report using a DirectQuery connection, follow this guidance:

* **Consider use of Query Reduction options:** Power BI provides options in the report to send fewer queries, and to disable certain interactions that would result in a poor experience if the resulting queries take a long time to run. To access these options in Power BI Desktop, go to **File** > **Options and settings** > **Options** and select **Query reduction**.

   ![Query reduction options](media/desktop-directquery-about/directquery-about_03b.png)

    Checking box selections on the **Query reduction** let you disable cross-highlighting throughout your entire report. You can also show an **Apply** button to slicers or filter selections. This approach lets you then make many slicer and filter selections before applying them. No queries are sent until you select the **Apply** button on the slicer. Your selections can then be used to filter the data.

    These options apply to your report while you interact with it in Power BI Desktop. These options also apply when your users consume the report in the Power BI service.

* **Apply filters first:** Always apply any applicable filters at the start of building a visual. For example, rather than drag in **TotalSalesAmount** and **ProductName**, then filter to a particular year, apply the filter on **Year** at the very start. Each step of building a visual sends a query. Although it's possible to then make another change before the first query has completed, this approach still leaves unnecessary load on the underlying source. By applying filters early, it generally makes those intermediate queries less costly. Also, failing to apply filters early can result in hitting the 1 million row limit.
* **Limit the number of visuals on a page:** When you open a page or change a page level slicer or filter, all of the visuals on a page are refreshed. There's also a limit on the number of queries that are sent in parallel. As the number of visuals increases, some of the visuals will be refreshed in a serial manner, increasing the time taken to refresh the entire page. For this reason, we recommend that you limit the number of visuals on a single page, and instead have more, simpler pages.
* **Consider switching off interaction between visuals:** By default, visualizations on a report page can be used to cross-filter and cross-highlight the other visualizations on the page. For example, having selected **1999** on the pie chart, the column chart is cross highlighted to show the sales by category for **1999**.
  
  ![Multiple visuals with cross-filtering and cross-highlighting](media/desktop-directquery-about/directquery-about_04.png)
  
  Cross-filtering and cross-highlighting in DirectQuery require queries to be submitted to the underlying source. The interaction should be switched off if the time taken to respond to users' selections would be unreasonably long. You can switch off this interaction. Switch off the interaction for either the entire report, as described earlier for query reduction options, or on a case-by-case basis. For more information, see [How visuals cross-filter each other in a Power BI report](../consumer/end-user-interactions.md).

In addition to the previous suggestions, each of the following reporting capabilities can cause performance issues:

* **Measure filters:** Visuals containing measures, or aggregates of columns, can contain filters in those measures. For example, the following graphic shows **SalesAmount** by **Category**, but only including those categories with more than **20M** of sales.
  
  ![Visual showing measures that contain filters](media/desktop-directquery-about/directquery-about_05.png)
  
  This approach results in two queries being sent to the underlying source:
  
  * The first query retrieves the Categories meeting the condition, **SalesAmount** greater than 20 million.
  * The second query then retrieves the necessary data for the visual, including the categories that met the condition in the `WHERE` clause.
  
  This approach generally works well if there are hundreds or thousands of categories, as in this example. Performance can degrade if the number of categories is much larger. The query fails for more than a million categories meeting the condition. The 1 million row limit was discussed earlier.

* **TopN filters:** Advanced filters can be defined to filter on only the top or bottom N values ranked by some measure. For example, filters can include the top 10 categories in the previous visual. This approach again results in two queries being sent to the underlying source. However, the first query will return all categories from the underlying source, and then the TopN are determined based on the returned results. Depending on the cardinality of the column involved, this approach can lead to performance issues or query failures because of the 1 million row limit.

* **Median:** Generally, any aggregation, such as `Sum` or `Count Distinct`, is pushed to the underlying source. However, this fact isn't true for median, which this aggregate is generally not supported by the underlying source. In such cases, the detail data is retrieved from the underlying source, and the median calculated from the returned results. This approach is reasonable when the median is to be calculated over a relatively small number of results. Performance issues or query failures because of the 1 million row limit occur if the cardinality is large. For example, **Median Country Population** might be reasonable, but **Median Sales Price** might not be.

* **Advanced text filters (_contains_ and similar):** When filtering on a text column, the advanced filtering allows filters like *contains* and *begins with* and so on. These filters can certainly result in degraded performance for some data sources. In particular, the default *contains* filter shouldn't be used if what is required is an exact match. Although the results might be the same, depending on the actual data, the performance might be drastically different because of indexes.

* **Multi select slicers:** By default, slicers only allow a single selection to be made. Allowing multi-selection in filters can cause some performance issues, because the user selects a set of items in the slicer. For example, if the user selects the 10 products of interest, each new selection results in queries being sent to the source. Although the user can select the next item before the query completes, this approach results in extra load on the underlying source.

* **Consider switching off totals on visuals:** By default, tables and matrices display totals and subtotals. In many cases, separate queries must be sent to the underlying source to obtain the values for such totals. This fact applies whenever using *DistinctCount* aggregation, or in all cases when using DirectQuery over SAP BW or SAP HANA. Such totals should be switched off by using the **Format** pane.

### Maximum number of connections option for DirectQuery

You can set the maximum number of connections DirectQuery opens for each underlying data source, which controls the number of queries concurrently sent to each data source.

DirectQuery opens a default maximum number of 10 concurrent connections. You can change the maximum number for the current file in Power BI Desktop. Go to **File** > **Options and Settings** > **Options**. In the **Current File** section in the left pane, select **Published dataset settings**.

![Setting maximum DirectQuery connections](media/desktop-directquery-about/directquery-about_05b.png)

The setting is only enabled when there's at least one DirectQuery source in the current report. The value applies to all DirectQuery sources, and to any new DirectQuery sources added to the same report.

Increasing **Maximum connections per data source** ensures more queries, up to the maximum number specified, can be sent to the underlying data source. This approach is useful when many visuals are on a single page, or many users access a report at the same time. Once the maximum number of connections is reached, further queries are queued until a connection becomes available. Increasing this limit does result in more load on the underlying source, so the setting isn't guaranteed to improve overall performance.

Once a report is published, the maximum number of concurrent queries sent to the underlying data source also depend upon fixed limits. The limits depend on the target environment to which the report is published. Different environments, such as Power BI, Power BI Premium, or Power BI Report Server, can impose different limits. The table below lists the upper limits of the active connections per data source for each Power BI environment. These limits apply to cloud data sources and on-premise data sources such as SQL Server, Oracle and Teradata.

|Environment            |Upper limit  |
|-----------------------|-------------|
|Power BI Pro           |10 active connections per data source |
|Power BI Premium       |30 active connections per data source |
|Power BI Report Server |10 active connections per data source |

> [!NOTE]
> The maximum number of DirectQuery connections setting applies to all DirectQuery sources when [enhanced metadata](desktop-enhanced-dataset-metadata.md) is enabled, which is the default setting for all models created in Power BI Desktop. 

### Diagnosing performance issues

This section describes how to diagnose performance issues, or how to get more detailed information to allow the reports to be optimized.

We recommended that you start diagnosis of performance issues in Power BI Desktop, rather than in the Power BI service. Performance issues are often based on the performance of the underlying source. You can more easily identify and diagnose issues in the more isolated environment of Power BI Desktop. This approach initially eliminates certain components, such as the Power BI gateway. If the performance issues are absent from Power BI Desktop, investigate the specifics of the report in the Power BI service. The [performance analyzer](../create-reports/desktop-performance-analyzer.md) is a useful tool for identifying issues throughout this process.

Similarly, we recommend to first try to isolate any issues to an individual visual, rather than many visuals on a page.

Let's say the steps in the previous paragraphs in this section have been taken. We now have a single visual on a page in Power BI Desktop that is still sluggish. Use the [performance analyzer](../create-reports/desktop-performance-analyzer.md) to determine the queries that Power BI Desktop sends to the underlying source. It's also possible to view traces and diagnostic information that might be emitted by the underlying data source. Traces might also contain useful details of how the query was executed, and how it can be improved.

Further, even in the absence of such traces from the source, it's possible to view the queries sent by Power BI, along with their execution times, as described in the next section.

#### Determining the queries sent by Power BI Desktop

By default, Power BI Desktop logs events during a given session to a trace file called *FlightRecorderCurrent.trc*.

For some DirectQuery sources, this log includes all queries sent to the underlying data source. The remaining DirectQuery sources will be included in the future. The following sources send queries to the log:

* SQL Server
* Azure SQL Database
* Azure Synapse Analytics (formerly SQL Data Warehouse)
* Oracle
* Teradata
* SAP HANA

The trace file can be found in the *AppData* folder for the current user:

*\<User>\AppData\Local\Microsoft\Power BI Desktop\AnalysisServicesWorkspaces*

To get to this folder, in Power BI Desktop, select **File** > **Options and settings** > **Options**, and then select **Diagnostics**. The following dialog appears:

![A link to open traces folder](media/desktop-directquery-about/directquery-about_06.png)

When you select **Open crash dump/traces folder**, under **Diagnostic Options**, the following folder opens: *\<User>\AppData\Local\Microsoft\Power BI Desktop\Traces*.

Navigating to that folder's parent folder displays the folder containing *AnalysisServicesWorkspaces*, which will contain one workspace folder for every open instance of Power BI Desktop. These folders are named with an integer suffix, such as *AnalysisServicesWorkspace2058279583*.

Inside that folder is a *\\Data* folder. It contains the trace file *FlightRecorderCurrent.trc* for the current Power BI session. The corresponding workspace folder is deleted when the associated Power BI Desktop session ends.

The trace files can be read using the *SQL Server Profiler* tool. Get it as part of the free download [SQL Server Management Studio](/sql/ssms/download-sql-server-management-studio-ssms).

Once you download and install SQL Server Management Studio, run SQL Server Profiler.

![SQL Server Profiler](media/desktop-directquery-about/directquery-about_07.png)

To open the trace file, take the following steps:

1. In SQL Server Profiler, select **File** > **Open** > **Trace file**.

1. Enter the path to the trace file for the currently open Power BI session, such as: *C:\Users\<user>\AppData\Local\Microsoft\Power BI Desktop\AnalysisServicesWorkspaces\AnalysisServicesWorkspace2058279583\Data*.

1. Open *FlightRecorderCurrent.trc*.

All events from the current session are displayed. An annotated example is shown here, which highlights groups of events. Each group has the following events:

* A `Query Begin` and `Query End` event, which represent the start and end of a DAX query generated by the UI, for example, from a visual, or from populating a list of values in the filter UI.
* One or more pairs of `DirectQuery Begin` and `DirectQuery End` events, which represent a query sent to the underlying data source, as part of evaluating the DAX query.

Multiple DAX queries can run in parallel, so events from different groups can be interleaved. The value of the `ActivityID` can be used to determine which events belong to the same group.

![SQL Server Profiler with Query Begin and Query End events](media/desktop-directquery-about/directquery-about_08.png)

Other columns of interest are as follows:

* **TextData:** The textual detail of the event. For `Query Begin/End` events, the detail is the DAX query. For `DirectQuery Begin/End` events, the detail is the SQL query sent to the underlying source. The **TextData** for the currently selected event is also displayed in the region at the bottom.
* **EndTime:** The time when the event completed.
* **Duration:** The duration, in milliseconds, taken to execute the DAX or SQL query.
* **Error:** Indicates if an error occurred, in which case the event is also displayed in red.

In the image above, some of the less interesting columns have been narrowed, to allow other columns to be seen more easily.

We recommend the following approach to capturing a trace to help diagnose a potential performance issue:

* Open a single Power BI Desktop session, to avoid the confusion of multiple workspace folders.
* Do the set of actions of interest in Power BI Desktop. Include a few additional actions, to ensure that the events of interest are flushed into the trace file.
* Open SQL Server Profiler and examine the trace, as described previously. Remember that closing Power BI Desktop deletes the trace file. Also, further actions in Power BI Desktop don't immediately appear. The trace file should be closed and reopened to see the new events.
* Keep individual sessions reasonably small, perhaps 10 seconds of actions, not hundreds. This approach makes it easier to interpret the trace file. There's also a limit on the size of the trace file. For long sessions, there's a chance of early events being dropped.

#### Understanding the form of query sent by Power BI Desktop

The general format of queries created and sent by Power BI Desktop use subselects for each of the tables referenced. The Power Query Editor query defines the subselect. For example, assume the following TPC-DS tables in SQL Server:

![TPC-DS tables in SQL Server](media/desktop-directquery-about/directquery-about_09.png)

Consider the following query:

![A sample query](media/desktop-directquery-about/directquery-about_10.png)

That query results in the following visual:

![Visual result of a query](media/desktop-directquery-about/directquery-about_11.png)

Refreshing that visual will result in the SQL query shown here. As you can tell, there are three subselects for `Web Sales`, `Item`, and `Date_dim`, that each return all the columns on the respective table, even though only four columns are actually referenced by the visual. These queries in the subselects that are shaded are exactly the result of the queries defined in Power Query Editor. Use of subselects in this manner hasn't been found to impact performance for the data sources so far supported for DirectQuery. Data sources like SQL Server optimize away the references to the other columns.

Power BI employs this pattern because the SQL query used can be provided directly by the analyst. It's used "as provided", without an attempt to rewrite it.

![SQL query used as provided](media/desktop-directquery-about/directquery-about_12.png)

## Next steps

This article describes aspects of DirectQuery that are common across all data sources. There are certain details that are specific to individual sources. See the following articles covering specific sources:

* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)

For more information about DirectQuery, see the following resource:

* [Data Sources supported by DirectQuery](power-bi-data-sources.md)
