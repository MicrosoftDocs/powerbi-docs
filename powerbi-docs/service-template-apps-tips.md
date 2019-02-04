---
title: Tips for authoring template apps in Power BI (preview)
description: Tips about authoring queries, data models, reports, and dashboards for making good template apps
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 02/04/2019
ms.author: maggies
---

# Tips for authoring template apps in Power BI (preview)

When you're [authoring your template app](service-template-apps-create.md) in Power BI, part of it is the logistics of creating the workspace, testing it, and production. But the other important part is obviously authoring the report and the dashboard. We can break down the authoring process into four main components. Working on these components helps you create the best possible template app:

* With **queries**, you [connect](desktop-connect-to-data.md) and [transform](desktop-query-overview.md) the data, as well as define [parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/). 
* In the **data model**, you create [relationships](desktop-create-and-manage-relationships.md), [measures](desktop-measures.md), and Q&A improvements.  
* **[Report pages](desktop-report-view.md)** include visuals and filters to provide insights into your data.  
* **[Dashboards](consumer/end-user-dashboards.md)** and [tiles](service-dashboard-create.md) offer an overview of the insights included.  

You may be familiar with each piece as existing Power BI features. When building a template app, there are additional things to consider for each piece. See each section below for more details.

<a name="queries"></a>

## Queries
For template apps, queries developed in Power BI Desktop are used to connect to your data source and import data. These queries are required to return a consistent schema and are supported for Scheduled Data refresh (direct query is not supported).

Template apps only support one data source per template app so define your queries carefully. A single data source is defined as a source that requires the same authentication. You can make multiple API calls in different queries if all the calls are to the same API endpoint and use the same authentication. Power BI template apps do not support multiple sources that require different authentications.

### Connect to your API
To get started, you need to connect to your API from Power BI Desktop to start building your queries.

You can use the Data Connectors that are available out of the box in Power BI Desktop to connect to your API. You can use the Web Data Connector (Get Data -> Web) to connect to your Rest API or the OData connector (Get Data -> OData feed) to connect to your OData feed. Note that these connectors work out of the box only if your API supports Basic Authentication.

> [!NOTE]
> If your API uses any other authentication types, like OAuth 2.0 or Web API Key, then you need to develop your own Data Connector to allow Power BI Desktop to successfully connects and authenticates to your API. For details on how to develop your own Data Connector for your template app, check the [Data Connectors documentation](https://aka.ms/DataConnectors). 
>
>

### Consider the source
The queries define the data that's included in the data model. Depending on the size of your system, these queries should also include filters to ensure your customers are dealing with a manageable size that fits your business scenario.

Power BI template apps can execute multiple queries in parallel and for multiple users concurrently.  Plan ahead your throttling and concurrency strategy and ask us how to make your template app fault tolerant.

### Schema enforcement
Ensure your queries are resilient to changes in your system, changes in schema on refresh can break the model. If the source could return null/missing schema result for some queries, consider returning an empty table or throw a custom error messages that is meaningful to your user.

### Parameters
[Parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/) in Power BI Desktop allow your users to provide input values that customize the data retrieved by the user. Think of the parameters up front to avoid rework after investing time to build detailed queries or reports.

> [!NOTE]
> Template apps only support text parameters currently. Other parameter types can be used during development but during testing, all values that users provide will be literal.
>
>

### Additional query tips

* Ensure all columns are typed appropriately.
* Columns have informative names (see [Q&A](#qa)).  
* For shared logic, consider using functions or queries.  
* Privacy levels are currently not supported in the service. If you get a prompt about privacy levels, you may need to rewrite the query to use relative paths.  

## Data model

A well-defined data model ensures your customers can easily and intuitively interact with the template app. Create the data model in Power BI Desktop.

> [!NOTE]
> You should do much of the basic modelling (typing, column names) in the [queries](#queries).
>


### Q&A
The modelling also affects how well Q&A can provide results for your customers. Ensure you add synonyms to commonly used columns and you've properly named your columns in the [queries](#queries).

### Additional data model tips

Make sure you have
* Applied formatting to all value columns.
    >[!NOTE]
    >Types should be applied in the query.  
* Applied formatting to all measures. 
* Set default summarization. Especially "Do Not Summarize", when applicable (for unique values, for example).  
* Set data category, when applicable.  
* Set relationships, as necessary.  

## Reports
The report pages offer additional insight into the data included in your template app. Use the pages of the reports to answer the key business questions your template app is trying to address. Create the report using Power BI Desktop.

> [!NOTE]
> You can only include one report in a template app, so take advantage of the different pages to call out particular sections of your scenario.
>
>

### Additional report tips

* Use more than one visual per page for cross-filtering.  
* Align the visuals carefully (no overlapping).  
* Page is set to "4:3" or "16:9" mode for layout.  
* All of the aggregations presented make numeric sense (averages, unique values).  
* Slicing produces rational results.  
* Logo is present on at least the top report.  
* Elements are in the client's color scheme to the extent possible.  

<a name="dashboard"></a>

## Dashboard
The dashboard is the main point of interaction with your template app for your customers. It should include an overview of the content included, especially the important metrics for your business scenario.

To create a dashboard for your template app, simply upload your PBIX through Get Data > Files or publish directly from Power BI Desktop.

> [!NOTE]
> template apps currently require a single report and dataset per template app. Do not pin content from multiple reports/datasets onto the dashboard used in the template app.
>
>

### Additional dashboard tips

* Maintain the same theme when pinning so that the tiles on your dashboard are consistent.  
* Pin a logo to the theme so consumers know where the pack is from.  
* Suggested layout to work with most screen resolutions is 5-6 small tiles wide.  
* All dashboard tiles should have appropriate titles/subtitles.  
* Consider groupings in the dashboard for different scenarios, either vertically or horizontally.  

<a name="restrictions"></a>

## Summary of restrictions

As listed in the above sections, currently the template apps have a set of restrictions:  

| Supported | *Not Supported* |
| --- | --- |
| Datasets built in PBI Desktop |*Datasets from  other template apps or inputs such as Excel files* |
| Data source supported for cloud Scheduled Data refresh |*Direct query or on-premises connectivity is not supported* |
| Queries returning consistent schema or errors where appropriate |*Dynamic or custom schemas* |
| One data source per dataset |*Multiple data sources such as mashups or URLs that are detected as multiple data sources* |
| Parameters of type text |*Other parameter types (such as date) or "list allowed of values"* |
| One dashboard, report, and dataset |*Multiple dashboards, reports, or datasets* |

## Known limitations

| Feature | Known Limitation |
|---------|---------|
|Contents:  Datasets   | Exactly one dataset should be present |
|Contents: Reports     | Up to one report    |
| Contents: Dashboards | Up to one non-empty dashboard |
| Contents: Dataflows | No support for dataflows |
| Contents from files | Only PBIX files are allowed. These file types aren't supported: .rdl files (paginated reports), Excel workbooks   |
| Data sources | DirectQuery isn't allowed <br>Live connections aren’t allowed (no AS Azure\on-premises) <br>On-premises data sources aren't allowed(Personal\Enterprise gateways aren’t supported) <br>Real Time not allowed (no support for pushdataset) <br>Composite models |
| Dataset: cross-workspace | No cross-workspace datasets are allowed  |
| Content: Dashboards | Real-time tiles aren’t allowed (in other words, no support for PushDataset or pubnub) |
| Query parameters | Parameters of type “Any”\”Binary” type  will block refresh operation for dataset |
| Custom visuals | Only publicly available custom visuals are supported. Organization store visuals not supported |

## Next step

[What are Power BI template apps? (preview)](service-template-apps-overview.md)
