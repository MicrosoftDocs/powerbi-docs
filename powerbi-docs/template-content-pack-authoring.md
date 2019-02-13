---
title: Author template content packs in Power BI
description: Template Content Pack Authoring
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/09/2017
ms.author: maggies
---

# Author template content packs in Power BI
Authoring a template content pack uses the Power BI Desktop and PowerBI.com. There are four components to your content pack:

* Queries allow you to [connect](desktop-connect-to-data.md) and [transform](desktop-query-overview.md) the data, as well as define [parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/)  
* Data model to create [relationships](desktop-create-and-manage-relationships.md), [measures](desktop-measures.md), and Q&A improvements  
* Report [pages](desktop-report-view.md) include visuals and filters to provide insights into your data  
* [Dashboard](consumer/end-user-dashboards.md) and [tiles](service-dashboard-create.md) offer an overview of the insights included  

You may be familiar with each piece as existing Power BI features. When building a content pack, there are additional things to consider for each aspect, see each section below for more details.

<a name="queries"></a>

## Queries
For template content packs, queries developed in the Power BI Desktop are used to connect to your data source and import data. These queries are required to return a consistent schema and are supported for Scheduled Data refresh (direct query is not supported).

Template content packs only support one data source per content pack so define your queries carefully. A single data source is defined as a source that requires the same authentication. You can make multiple API calls in different queries if all the calls are to the same API endpoint and use the same authentication. Power BI content packs do not support multiple sources that require different authentications.

### Connect to your API
To get started, you will need to connect to your API from Power BI Desktop to start building your queries.

You can use the Data Connectors that are available out of the box in Power BI Desktop to connect to your API. You can use the Web Data Connector (Get Data -> Web) to connect to your Rest API or the OData connector (Get Data -> OData feed) to connect to your OData feed. Please note that these connectors will work out of the box only if your API supports Basic Authentication.

> [!NOTE]
> If your API uses any other authentication types, like OAuth 2.0 or Web API Key, then you will need to develop your own Data Connector to allow Power BI Desktop to successfully connects and authenticates to your API. For details on how to develop your own Data Connector for your Content Pack, check the Data Connectors documentation [here](https://aka.ms/DataConnectors). 
>
>

### Consider the source
The queries define the data that will be included in the data model. Depending on the size of your system, these queries should also include filters to ensure your customers are dealing with a manageable size that fits your business scenario.

Power BI content packs can execute multiple queries in parallel and for multiple users concurrently.  Plan ahead your throttling and concurrency strategy and ask us how to make your content pack fault tolerant.

### Schema enforcement
Ensure your queries are resilient to changes in your system, changes in schema on refresh can break the model. If the source could return null/missing schema result for some queries, consider returning an empty table or throw a custom error messages that is meaningful to your user.

### Parameters
[Parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/) in Power BI Desktop allow your users to provide input values that customize the data retrieved by the user. Think of the parameters upfront to avoid rework after investing time to build detailed queries or reports.

> [!NOTE]
> Template content packs only support text parameters currently. Other parameter types can be used during development but during the [testing](template-content-pack-testing.md#templates) portion all values provided by the users will be literal.
>
>

### Additional query tips

* Ensure all columns are typed appropriately
* Columns have informative names (see Q&A)  
* For shared logic, consider using functions or queries  
* Privacy levels are not currently supported in the service - if you get a prompt about privacy levels, you may need to re-write the query to use relative paths  

## Data Model

A well-defined data model will ensure your customers can easily and intuitively interact with the content pack. Create the data model in the Power BI Desktop.

> [!NOTE]
> Much of the basic modelling (typing, column names) should be done in the [queries](#queries).
>
>

### Q&A
The modelling will also affect how well Q&A can provide results for your customers. Ensure you add synonyms to commonly used columns and that your columns are properly named in the [queries](#queries).

### Additional data model tips
* All value columns have formatting applied
    >[!NOTE]
    >Types should be applied in the query.  
* All measures have formatting applied  
* Default Summarization is set. Especially "Do Not Summarize", when applicable (for unique values for example)  
* Data Category has been set, when applicable  
* Relationships are set, as necessary  

## Reports
The report pages offer additional insight into the data included in your content pack. Use the pages of the reports to answer the key business questions your content pack is trying to address. Create the report using the Power BI Desktop.

> [!NOTE]
> Only one report may be included in a content pack, take advantage of the different pages to call out particular sections of your scenario.
>
>

### Additional report tips
* Use more than one visual per page for cross-filtering  
* Align the visuals carefully (no overlapping)  
* Page is set to "4:3" or "16:9" mode for layout  
* All of the aggregations presented make numeric sense (averages, unique values)  
* Slicing produces rational results  
* Logo is present on at least the top report  
* Elements are in the client's color scheme to the extent possible  

<a name="dashboard"></a>

## Dashboard
The dashboard is the main point of interaction with your content pack for your customers. It should include an overview of the content included, especially the important metrics for your business scenario.

To create a dashboard for your template content pack, simply upload your PBIX through Get Data > Files or publish directly from the Power BI Desktop.

> [!NOTE]
> Template content packs currently require a single report and dataset per content pack. Do not pin content from multiple reports/datasets onto the dashboard used in the content pack.
>
>

### Additional dashboard tips
* Maintain the same theme when pinning so that the tiles on your dashboard are consistent  
* Pin a logo to the theme so consumers know where the pack is from  
* Suggested layout to work with most screen resolutions is 5-6 small tiles wide  
* All dashboard tiles should have appropriate titles/subtitles  
* Consider groupings in the dashboard for different scenarios, either vertically or horizontally  

<a name="restrictions"></a>

## Summary of restrictions
As listed in the above sections, currently the template content packs have a set of restrictions:  

| Supported | *Not Supported* |
| --- | --- |
| Datasets built in PBI Desktop |*Datasets from  other content packs or inputs such as Excel files* |
| Data source supported for cloud Scheduled Data refresh |*Direct query or on-premises connectivity is not supported* |
| Queries returning consistent schema or errors where appropriate |*Dynamic or custom schemas* |
| One data source per dataset |*Multiple data sources such as mashups or URLs that are detected as multiple data sources* |
| Parameters of type text |*Other parameter types (such as date) or "list allowed of values"* |
| One dashboard, report and dataset |*Multiple dashboards, reports or datasets* |

## Next step
[Content Pack Testing and Submission](template-content-pack-testing.md)