---
title: Use composite models in Power BI Desktop
description: Learn how to create data models with multiple data connections and many-to-many relationships in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 03/06/2023
Localizat2onGroup: Transform and shape data
---
# Use composite models in Power BI Desktop

Previously in Power BI Desktop, when you used a DirectQuery in a report, no other data connections, whether DirectQuery or import, were allowed for that report. With composite models, that restriction is removed. A report can seamlessly include data connections from more than one DirectQuery or import data connection, in any combination you choose.

The composite models capability in Power BI Desktop consists of three related features:

* **Composite models**: Allows a report to have two or more data connections from different source groups. These source groups can be one or more DirectQuery connections and an import connection, two or more DirectQuery connections, or any combination thereof. This article describes composite models in detail.

* **Many-to-many relationships**: With composite models, you can establish *many-to-many relationships* between tables. This approach removes requirements for unique values in tables. It also removes previous workarounds, such as introducing new tables only to establish relationships. For more information, see [Apply many-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md).

* **Storage mode**: You can now specify which visuals query back-end data sources. This feature helps improve performance and reduce back-end load. Previously, even simple visuals, such as slicers, initiated queries to back-end sources. For more information, see [Manage storage mode in Power BI Desktop](desktop-storage-mode.md).

## Use composite models

With composite models, you can connect to different kinds of data sources when you use Power BI Desktop or the Power BI service. You can make those data connections in a couple of ways:

* By importing data to Power BI, which is the most common way to get data.
* By connecting directly to data in its original source repository by using DirectQuery. To learn more about DirectQuery, see [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md).

When you use DirectQuery, composite models make it possible to create a Power BI model, such as a single *.pbix* Power BI Desktop file that does either or both of the following actions:

* Combines data from one or more DirectQuery sources.
* Combines data from DirectQuery sources and import data.

For example, by using composite models, you can build a model that combines the following types of data:

* Sales data from an enterprise data warehouse.
* Sales-target data from a departmental SQL Server database.
* Data that's imported from a spreadsheet.

A model that combines data from more than one DirectQuery source or that combines DirectQuery with import data is called a composite model.

You can create relationships between tables as you always have, even when those tables come from different sources. Any relationships that are cross-source are created with a cardinality of many-to-many, regardless of their actual cardinality. You can change them to one-to-many, many-to-one, or one-to-one. Whichever cardinality you set, cross-source relationships have different behavior. You can't use Data Analysis Expressions (DAX) functions to retrieve values on the `one` side from the `many` side. You might also see a performance impact versus many-to-many relationships within the same source.

> [!NOTE]
> Within the context of composite models, all imported tables are effectively a single source, regardless of the actual underlying data sources.

## Example of a composite model

For an example of a composite model, consider a report that has connected to a corporate data warehouse in SQL Server by using DirectQuery. In this instance, the data warehouse contains **Sales by Country**, **Quarter**, and **Bike (Product)** data, as shown in the following image:

:::image type="content" source="media/desktop-composite-models/composite-models_04.png" alt-text="Screenshot of an example with composite models in Relationship view.":::

At this point, you could build simple visuals by using fields from this source. The following image shows total sales by *ProductName*, for a selected quarter.

:::image type="content" source="media/desktop-composite-models/composite-models_05.png" alt-text="Screenshot of a visual based on data from the previous example.":::

But what if you have data in an Excel spreadsheet about the product manager who's assigned to each product, along with the marketing priority? If you want to view **Sales Amount** by **Product Manager**, it might not be possible to add this local data to the corporate data warehouse. Or it might take months at best.

It might be possible to import that sales data from the data warehouse, instead of using DirectQuery. And the sales data could then be combined with the data that you imported from the spreadsheet. However, that approach is unreasonable, for the reasons that led to using DirectQuery in the first place. The reasons could include:

* Some combination of the security rules enforced in the underlying source.
* The need to be able to view the latest data.
* The sheer scale of the data.

Here's where composite models come in. Composite models let you connect to the data warehouse by using DirectQuery and then use **Get data** for more sources. In this example, we first establish the DirectQuery connection to the corporate data warehouse. We use **Get data**, choose **Excel**, and then navigate to the spreadsheet that contains our local data. Finally, we import the spreadsheet that contains the *Product Names*, the assigned **Sales Manager**, and the **Priority**.  

:::image type="content" source="media/desktop-composite-models/composite-models_06.png" alt-text="Screenshot of the navigator window after selecting an excel file as a source.":::

In the **Fields** list, you can see two tables: the original **Bike** table from SQL Server and a new **ProductManagers** table. The new table contains the data that's imported from Excel.

:::image type="content" source="media/desktop-composite-models/composite-models_07.png" alt-text="Screenshot of the Fields pane with the Bike and ProductManagers fields selected.":::

Similarly, in the **Relationship** view in Power BI Desktop, we now see another table called **ProductManagers**.

:::image type="content" source="media/desktop-composite-models/composite-models_08.png" alt-text="Screenshot of the tables in Relationship view.":::

We now need to relate these tables to the other tables in the model. As always, we create a relationship between the **Bike** table from SQL Server and the imported **ProductManagers** table. That is, the relationship is between **Bike[ProductName]** and **ProductManagers[ProductName]**. As discussed earlier, all relationships that go across source default to many-to-many cardinality.

:::image type="content" source="media/desktop-composite-models/composite-models_09.png" alt-text="Screenshot of the Create relationship window.":::

Now that we've established this relationship, it's displayed in the **Relationship** view in Power BI Desktop, as we would expect.

:::image type="content" source="media/desktop-composite-models/composite-models_10.png" alt-text="Screenshot of the Create relationship window after new relationships are created.":::

We can now create visuals by using any of the fields in the **Fields** list. This approach seamlessly blends data from multiple sources. For example, the total *SalesAmount* for each *Product Manager* is displayed in the following image:

:::image type="content" source="media/desktop-composite-models/composite-models_11.png" alt-text="Screenshot of the Fields pane with SalesAmount highlighted and the visual shown.":::

The following example displays a common case of a *dimension* table, such as **Product** or **Customer**, that's extended with some extra data imported from somewhere else. It's also possible to have tables use DirectQuery to connect to various sources. To continue with our example, imagine that **Sales Targets** per **Country** and **Period** are stored in a separate departmental database. As usual, you can use **Get data** to connect to that data, as shown in the following image:

:::image type="content" source="media/desktop-composite-models/composite-models_12.png" alt-text=" Screenshot of the Navigator window with sales targets selected.":::

As we did earlier, we can create relationships between the new table and other tables in the model. Then we can create visuals that combine the table data. Let's look again at the **Relationships** view, where we've established the new relationships:

:::image type="content" source="media/desktop-composite-models/composite-models_13.png" alt-text="Screenshot of the Relationship view with many tables.":::

The next image is based on the new data and relationships we created. The visual at the lower left shows total *Sales Amount* versus *Target*, and the variance calculation shows the difference. The **Sales Amount** and **Target** data come from two different SQL Server databases.

:::image type="content" source="media/desktop-composite-models/composite-models_14.png" alt-text="Screenshot of the Report view with more data.":::

## Set the storage mode

Each table in a composite model has a storage mode that indicates whether the table is based on DirectQuery or import. The storage mode can be viewed and modified in the **Property** pane. To display the storage mode, right-click a table in the **Fields** list, and then select **Properties**. The following image shows the storage mode for the **SalesTargets** table.

The storage mode can also be viewed on the tooltip for each table.

:::image type="content" source="media/desktop-composite-models/composite-models_16.png" alt-text="Screenshot of a tooltip displaying the storage mode.":::

For any Power BI Desktop file (a *.pbix* file) that contains some tables from DirectQuery and some import tables, the status bar displays a storage mode called **Mixed**. You can select that term in the status bar and easily switch all tables to import.

For more information about storage mode, see [Manage storage mode in Power BI Desktop](desktop-storage-mode.md).  

> [!NOTE]
> You can use *Mixed* storage mode in Power BI Desktop and in the Power BI service.

## Calculated tables

You can add calculated tables to a model that uses DirectQuery. The Data Analysis Expressions (DAX) that define the calculated table can reference either imported or DirectQuery tables or a combination of the two.

Calculated tables are always imported, and their data is refreshed when you refresh the tables. If a calculated table refers to a DirectQuery table, visuals that refer to the DirectQuery table always show the latest values in the underlying source. Alternatively, visuals that refer to the calculated table show the values at the time when the calculated table was last refreshed.

## Security implications

Composite models have some security implications. A query sent to one data source can include data values that have been retrieved from another source. In the earlier example, the visual that shows **(Sales Amount)** by **Product Manager** sends an SQL query to the Sales relational database. That SQL query might contain the names of Product Managers and their associated Products.

:::image type="content" source="media/desktop-composite-models/composite-models_17.png" alt-text="Screenshot of a script showing security implications.":::

So, information that's stored in the spreadsheet is now included in a query that's sent to the relational database. If this information is confidential, you should consider the security implications. In particular, consider the following points:

* Any administrator of the database who can view traces or audit logs could view this information, even without permissions to the data in its original source. In this example, the administrator would need permissions to the Excel file.

* The encryption settings for each source should be considered. You want to avoid retrieving information from one source by an encrypted connection and then inadvertently including it in a query that's sent to another source by an unencrypted connection.

To allow confirmation that you've considered any security implications, Power BI Desktop displays a warning message when you create a composite model.  

Additionally, if an author adds *Table1* from *Model A* to a Composite Model (we'll call it *Model C* for reference), then a user viewing a report built on *Model C* could query **any table** in *Model A* that isn't protected by row-level security RLS.

For similar reasons, be careful when you open a Power BI Desktop file that's sent from an untrusted source. If the file contains composite models, information that someone retrieves from one source, by using the credentials of the user who opens the file, would be sent to another data source as part of the query. The information could be viewed by the malicious author of the Power BI Desktop file. When you initially open a Power BI Desktop file that contains multiple sources, Power BI Desktop displays a warning. The warning is similar to the one that's displayed when you open a file that contains native SQL queries.  

## Performance implications  

When you use DirectQuery, you should always consider performance, primarily to ensure that the back-end source has sufficient resources to provide a good experience for users. A good experience means that the visuals refresh in five seconds or less. For more performance advice, see [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md).

Using composite models adds other performance considerations. A single visual can result in sending queries to multiple sources, which often pass the results from one query across to a second source. This situation can result in the following forms of execution:

* **A source query that includes a large number of literal values**: For example, a visual that requests total **Sales Amount** for a set of selected **Product Managers** would first need to find which **Products** were managed by those product managers. This sequence must happen before the visual sends an SQL query that includes all of the product IDs in a `WHERE` clause.

* **A source query that queries at a lower level of granularity, with the data later being aggregated locally**: As the number of **Products** that meet the filter criteria on **Product Manager** grows large, it can become inefficient or unfeasible to include all products in a `WHERE` clause. Instead, you can query the relational source at the lower level of **Products** and then aggregate the results locally. If the cardinality of **Products** exceeds a limit of 1 million, the query fails.

* **Multiple source queries, one per group by value**: When the aggregation uses **DistinctCount** and is grouped by a column from another source, and if the external source doesn't support efficient passing of many literal values that define the grouping, it's necessary to send one SQL query per group by value.

   A visual that requests a distinct count of **CustomerAccountNumber** from the SQL Server table by **Product Managers** imported from the spreadsheet would need to pass in the details from the **Product Managers** table in the query that's sent to SQL Server. Over other sources, Redshift, for example, this action is unfeasible. Instead, there would be one SQL query sent per **Sales Manager**, up to some practical limit, at which point the query would fail.

Each of these cases has its own implications on performance, and the exact details vary for each data source. Although the cardinality of the columns used in the relationship that joins the two sources remains low, a few thousand, performance shouldn't be affected. As this cardinality grows, you should pay more attention to the impact on the resulting performance.

Additionally, the use of many-to-many relationships means that separate queries must be sent to the underlying source for each total or subtotal level, rather than aggregating the detailed values locally. A simple table visual with totals would send two source queries, rather than one.

## Source groups

A source group is a collection of items, such as tables and relationships, from a DirectQuery source or all import sources involved in a data model. A composite model is made of one or more source groups. Consider the following examples:

* A composite model that connects to a Power BI Dataset called **Sales** and enriches the dataset by adding a **Sales YTD** measure, which isn't available in the original dataset. This model consists of one source group.
* A composite model that combines data by importing a table from an Excel sheet called **Targets** and a CSV file called **Regions**, and making a DirectQuery connection to a Power BI Dataset called **Sales**. In this case, there are two source groups as shown in the following image:
  * The first source group contains the tables from the **Targets** Excel sheet, and the **Regions** CSV file.
  * The second source group contains the items from the **Sales** Power BI Dataset.

:::image type="content" source="media/desktop-composite-models/composite-models-source-groups.png" alt-text="Diagram showing the Import and Sales source groups containing the tables from the respective sources.":::

If you added another DirectQuery connection to another source, such as a DirectQuery connection to a SQL Server database called **Inventory**, the items from that source will be added as another source group:

:::image type="content" source="media/desktop-composite-models/composite-models-source-groups-2.png" alt-text="Diagram showing the Import, Sales and Inventory source groups containing the tables from the respective sources.":::

> [!NOTE]
> Importing data from another source will **not** add another source group, because all items from all imported sources are in one source group.

### Source groups and relationships

There are two types of relationships in a composite model:

* **Intra source group relationships.** These relationships relate items within a source group together. These relationships are always regular relationships unless they're many-to-many, in which case they're limited.
* **Cross source group relationships.** These relationships start in one source group and end in a different source group. These relationships are always limited relationships.

[Read more about the distinction between regular and limited relationships and their impact.](desktop-relationships-understand.md#relationship-evaluation)

For example, in the following image we've added three cross source group relationships, relating tables across the various source groups together:

:::image type="content" source="media/desktop-composite-models/composite-models-source-groups-3.png" alt-text="Diagram showing the Import, Sales and Inventory source groups containing the tables from the respective sources and relationships between the source groups as described previously.":::

### Local and remote

Any item that is in a source group that is a DirectQuery source group is considered **remote**, unless the item was defined locally as part of an extension or enrichment to the DirectQuery source and isn't part of the remote source, such as a measure or a calculated table. A calculated table based on a table from the DirectQuery source group belongs to the “Import” source group and is considered **local**.
Any item that is in the “Import” source group is considered local.
For example, if you define the following measure in a composite model that uses a DirectQuery connection to the Inventory source, the measure is considered local:

```dax
[Average Inventory Count] = Average(Inventory[Inventory Count])
```

### Calculation groups, query and measure evaluation

[Calculation groups](/analysis-services/tabular-models/calculation-groups) provide a way to reduce the number of redundant measures and grouping common measure expressions together. Typical use cases are time-intelligence calculations where you want to be able to switch from actuals to month-to-date, quarter-to-date or year-to-date calculations.
When working with composite models, it's important to be aware of the interaction between calculation groups and whether a measure only refers to items from a single remote source group. If a measure only refers to items from a single remote source group and the remote model defines a calculation group that impacts the measure, that calculation group will be applied, even if the measure was defined in the remote model or in the local model.
However, if a measure doesn't refer to items from a single remote source group exclusively but refers to items from a remote source group on which a remote calculation group is applied, the results of the measure might still be impacted by the remote calculation group. Consider the following example:

* Reseller Sales is a measure defined in the remote model.
* The remote model contains a calculation group that changes the result of Reseller Sales
* Internet Sales is a measure defined in the local model.
* Total Sales is a measure defined in the local model, and has the following definition:

```dax
[Total Sales] = [Internet Sales] + [Reseller Sales]
```

In this scenario, the **Internet Sales measure** isn't impacted by the calculation group defined in the remote model because they aren't part of the same model. However, the calculation group can change the result of the **Reseller Sales** measure, because they are in the same model. This fact means that the results returned by the **Total Sales** measure must be evaluated carefully. Imagine we use the calculation group in the remote model to return year-to-date results. The result returned by **Reseller Sales** is now a year-to-date value, while the result returned by **Internet Sales** is still an actual. The result of **Total Sales** is now likely unexpected, as it adds an actual to a year-to-date result.

## Considerations and limitations

This release of composite models presents a few limitations:

Currently, [incremental refresh](../connect-data/incremental-refresh-overview.md) is supported for composite models connecting to SQL, Oracle, and Teradata data sources only.

The following Live Connect tabular sources can't be used with composite models:

* SAP HANA
* SAP Business Warehouse
* SQL Server Analysis Services
* Power BI datasets
* [Usage metrics (My workspace)](../collaborate-share/service-usage-metrics.md)
* Azure Analysis Services

Using streaming datasets in composite models isn't supported.

The existing limitations of DirectQuery still apply when you use composite models. Many of these limitations are now per table, depending upon the storage mode of the table. For example, a calculated column on an import table can refer to other tables, but a calculated column on a DirectQuery table can still refer only to columns on the same table. Other limitations apply to the model as a whole, if any of the tables within the model are DirectQuery. For example, the QuickInsights feature isn't available on a model if any of the tables within it has a storage mode of DirectQuery.

## Next steps

For more information about composite models and DirectQuery, see the following articles:

* [Apply many-to-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md)
* [Manage storage mode in Power BI Desktop](desktop-storage-mode.md)
* [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md)
* [Power BI data sources](../connect-data/power-bi-data-sources.md)
* [Using DirectQuery for Power BI datasets and Azure Analysis Services (preview)](../connect-data/desktop-directquery-datasets-azure-analysis-services.md)
* [Model relationships in Power BI Desktop](desktop-relationships-understand.md)
