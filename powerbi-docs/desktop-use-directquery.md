---
title: Use DirectQuery in Power BI Desktop
description: Use DirectQuery, also called a Live connection, in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 02/28/2019
ms.author: davidi

LocalizationGroup: Connect to data
---
# Use DirectQuery in Power BI Desktop
With **Power BI Desktop**, when you connect to your data source, it is always possible to import a copy of the data into the **Power BI Desktop**. For some data sources, an alternative approach is available: connect directly to the data source using **DirectQuery**.

## Supported Data Sources
For a full listing of data sources that support **DirectQuery**, see [Data sources supported by DirectQuery](desktop-directquery-data-sources.md).

## How to Connect using DirectQuery
When you use **Get Data** to connect to a data source supported by **DirectQuery**, the connection window lets you select how you want to connect.  

![](media/desktop-use-directquery/directquery_2a.png)

The differences between selecting **Import** and **DirectQuery** are the following:

**Import** – the selected tables and columns are imported into **Power BI Desktop**. As you create or interact with a visualization, **Power BI Desktop** uses the imported data. You must refresh the data, which imports the full data set again, to see any changes that occurred to the underlying data since the initial import or the most recent refresh.

**DirectQuery** – no data is imported or copied into **Power BI Desktop**. For relational sources, the selected tables and columns appear in the **Fields** list. For multi-dimensional sources like SAP Business Warehouse, the dimensions and measures of the selected cube appear in the **Fields** list. As you create or interact with a visualization, **Power BI Desktop** queries the underlying data source, which means you’re always viewing current data.

Many data modeling and data transformations are available when using **DirectQuery**, though with some limitations. When creating or interacting with a visualization, the underlying source must be queried and the time necessary to refresh the visualization is dependent on the performance of the underlying data source. When the data necessary to service the request has recently been requested, Power BI Desktop uses recent data to reduce the time required to display the visualization. Selecting **Refresh** from the **Home** ribbon will ensure all visualizations are refreshed with current data.

The [Power BI and DirectQuery](desktop-directquery-about.md) article describes **DirectQuery** in detail. Also, see the following sections for more information about benefits, limitations, and important considerations when using **DirectQuery**.

## Benefits of using DirectQuery
There are a few benefits to using **DirectQuery**:

* **DirectQuery** lets you build visualizations over very large datasets, where it otherwise would be unfeasible to first import all of the data with pre-aggregation
* Underlying data changes can require a refresh of data, and for some reports, the need to display current data can require large data transfers, making re-importing data unfeasible. By contrast, **DirectQuery** reports always use current data
* The 1 GB dataset limitation does *not* apply to **DirectQuery**

## Limitations of DirectQuery
There are currently a few limitations to using **DirectQuery**:

* All tables must come from a single database, unless using [composite models](desktop-composite-models.md)
* If the **Query Editor** query is overly complex, an error will occur. To remedy the error you must either delete the problematic step in **Query Editor**, or *Import* the data instead of using **DirectQuery**. For multi-dimensional sources like SAP Business Warehouse, there is no **Query Editor**
* Relationship filtering is limited to a single direction, rather than both directions (though it is possible to enable cross filtering in both directions for **DirectQuery** as a Preview feature). For multi-dimensional sources like SAP Business Warehouse, there are no relationships defined in the model
* Time intelligence capabilities are not available in **DirectQuery**. For example, special treatment of date columns (year, quarter, month, day, so on) are not supported in **DirectQuery** mode.
* By default, limitations are placed on DAX expressions allowed in measures; see the following paragraph (after this bulleted list) for more information
* There is a 1 million row limit for returning data when using **DirectQuery**. This does not affect aggregations or calculations used to create the dataset returned using **DirectQuery**, only the rows returned. For example, you can aggregate 10 million rows with your query that runs on the data source, and accurately return the results of that aggregation to Power BI using **DirectQuery** as long as the data returned to Power BI is less than 1 million rows. If more than 1 million rows would be returned from **DirectQuery**, Power BI returns an error.

To ensure that queries sent to the underlying data source have acceptable performance, limitations are imposed on measures by default. Advanced users can choose to bypass this limitation by selecting **File > Options and settings > Options** and then **DirectQuery**, then selecting the option *Allow unrestricted measures in DirectQuery mode*. When that option is selected, any DAX expression that is valid for a measure can be used. Users must be aware, however, that some expressions that perform very well when the data is imported may result in very slow queries to the backend source when in DirectQuery mode.

## Important considerations when using DirectQuery
The following three points should be taken into consideration when using **DirectQuery**:

* **Performance and load** - All **DirectQuery** requests are sent to the source database, so the time required to refresh a visual is dependent on how long that back-end source takes to respond with the results from the query (or queries). The recommended response time (with requested data being returned) for using **DirectQuery** for visuals is five seconds or less, with a maximum recommended results response time of 30 seconds. Any longer, and the experience of a user consuming the report becomes unacceptably poor. In addition, once a report is published to the Power BI service, any query that takes longer than a few minutes will timeout, and the user will receive an error.
  
  Load on the source database should also be considered, based on the number of Power BI users who will consume the published report. Using *Row Level Security* (RLS) can have a significant impact as well; a non-RLS dashboard tile shared by multiple users results in a single query to the database, but using RLS on a dashboard tile usually means the refresh of a tile requires one query *per user*, thus significantly increasing load on the source database and potentially impacting performance.
  
  Power BI creates queries that are as efficient as possible. Under certain situations however, the generated query may not be efficient enough to avoid refresh that would fail. One example of this situation is when a generated query would retrieve an excessively large number of rows (more than 1 million) from the back-end data source, in which case the following error occurs:
  
      The resultset of a query to external data source has exceeded
      the maximum allowed size of '1000000' rows.
  
  This situation can occur with a simple chart that includes a very high cardinality column, with the aggregation option set to *Don’t Summarize*. The visual needs to only have columns with a cardinality below 1 million, or must have appropriate filters applied.
* **Security** - All users who consume a published report connect to the back-end data source using the credentials entered after publication to the Power BI service. This is the same situation as data that is imported: all users see the same data, irrespective of any security rules defined in the backend source. Customers who want per-user security implemented with DirectQuery sources should use RLS. [Learn more about RLS](service-admin-rls.md).
* **Supported features** - Not all features in **Power BI Desktop** are supported in **DirectQuery** mode, or have some limitations. In addition, there are some capabilities in the Power BI service (such as *Quick Insights*) that are not available for datasets using **DirectQuery**. As such, the limitation of such features when using **DirectQuery** should be taken into consideration when determining whether to use **DirectQuery**.   

## Publish to the Power BI service
Reports created using **DirectQuery** can be published to the Power BI Service.

If the data source used does not need the **On-premises data gateway** (**Azure SQL Database**, **Azure SQL Data Warehouse**, or **Redshift**), credentials must be provided before the published report will be displayed in the Power BI Service.

You can provide credentials by selecting the **Settings** gear icon in Power BI, then select **Settings**.

![](media/desktop-use-directquery/directquery_3.png)

Power BI displays the **Settings** window. From there, select the **Datasets** tab and choose the dataset that uses **DirectQuery**, and select **Edit credentials**.

![](media/desktop-use-directquery/directquery_4.png)

Until credentials are supplied, opening a published report or exploring a dataset created with a **DirectQuery** connection to such data sources results in an error.

For data sources other than **Azure SQL Database**, **Azure SQL Data Warehouse** and **Redshift** that use DirectQuery, an **On-premises data gateway** must be installed and the data source must be registered to establish a data connection. You can [learn more about On-premises data gateway](http://go.microsoft.com/fwlink/p/?LinkID=627094).

## Next steps
For more information about **DirectQuery**, check out the following resources:

* [DirectQuery in Power BI](desktop-directquery-about.md)
* [Data sources supported by DirectQuery](desktop-directquery-data-sources.md)
* [DirectQuery and SAP BW](desktop-directquery-sap-bw.md)
* [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
* [On-premises data gateway](service-gateway-onprem.md)

