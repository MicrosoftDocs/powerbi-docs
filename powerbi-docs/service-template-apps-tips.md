---
title: Tips for authoring template apps in Power BI (preview)
description: Tips about authoring queries, data models, reports, and dashboards for making good template apps
author: maggiesMSFT
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 04/18/2019
ms.author: maggies
---

# Tips for authoring template apps in Power BI (preview)

When you're [authoring your template app](service-template-apps-create.md) in Power BI, part of it is the logistics of creating the workspace, testing it, and production. But the other important part is obviously authoring the report and the dashboard. We can break down the authoring process into four main components. Working on these components helps you create the best possible template app:

* With **queries**, you [connect](desktop-connect-to-data.md) and [transform](desktop-query-overview.md) the data, and define [parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/). 
* In the **data model**, you create [relationships](desktop-create-and-manage-relationships.md), [measures](desktop-measures.md), and Q&A improvements.  
* **[Report pages](desktop-report-view.md)** include visuals and filters to provide insights into your data.  
* **[Dashboards](consumer/end-user-dashboards.md)** and [tiles](service-dashboard-create.md) offer an overview of the insights included.
* Sample data makes your app discoverable immediately after installation.

You may be familiar with each piece as existing Power BI features. When building a template app, there are additional things to consider for each piece. See each section below for more details.

<a name="queries"></a>

## Queries
For template apps, queries developed in Power BI Desktop are used to connect to your data source and import data. These queries are required to return a consistent schema and are supported for Scheduled Data refresh (DirectQuery isn't supported).

### Connect to your API
To get started, you need to connect to your API from Power BI Desktop to start building your queries.

You can use the Data Connectors that are available out of the box in Power BI Desktop to connect to your API. You can use the Web Data Connector (Get Data -> Web) to connect to your Rest API or the OData connector (Get Data -> OData feed) to connect to your OData feed. These connectors work out of the box only if your API supports Basic Authentication.

> [!NOTE]
> If your API uses any other authentication types, like OAuth 2.0 or Web API Key, then you need to develop your own Data Connector to allow Power BI Desktop to successfully connect and authenticate to your API. For details on how to develop your own Data Connector for your template app, check the [Data Connectors documentation](https://aka.ms/DataConnectors). 
>
>

### Consider the source
The queries define the data that's included in the data model. Depending on the size of your system, these queries should also include filters to ensure your customers are dealing with a manageable size that fits your business scenario.

Power BI template apps can execute multiple queries in parallel and for multiple users concurrently.  Plan ahead your throttling and concurrency strategy and ask us how to make your template app fault tolerant.

### Schema enforcement
Ensure your queries are resilient to changes in your system, changes in schema on refresh can break the model. If the source could return null or missing schema result for some queries, consider returning an empty table or a meaningful custom error message.

### Parameters
[Parameters](https://powerbi.microsoft.com/blog/deep-dive-into-query-parameters-and-power-bi-templates/) in Power BI Desktop allow your users to provide input values that customize the data retrieved by the user. Think of the parameters up front to avoid rework after investing time to build detailed queries or reports.

> [!NOTE]
> Template apps support all parameters except Any and Binary.
>

### Additional query tips

* Ensure all columns are typed appropriately.
* Columns have informative names (see [Q&A](#qa)).  
* For shared logic, consider using functions or queries.  
* Privacy levels are currently not supported in the service. If you get a prompt about privacy levels, you may need to rewrite the query to use relative paths.  

## Data models

A well-defined data model ensures your customers can easily and intuitively interact with the template app. Create the data model in Power BI Desktop.

> [!NOTE]
> You should do much of the basic modeling (typing, column names) in the [queries](#queries).
>


### Q&A
The modeling also affects how well Q&A can provide results for your customers. Ensure you add synonyms to commonly used columns and you've properly named your columns in the [queries](#queries).

### Additional data model tips

Make sure you've:
* Applied formatting to all value columns. Apply types in the query.  
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

## Dashboards
The dashboard is the main point of interaction with your template app for your customers. It should include an overview of the content included, especially the important metrics for your business scenario.

To create a dashboard for your template app, just upload your PBIX through Get Data > Files or publish directly from Power BI Desktop.

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

## Sample data
Template apps, as part of the app creation stage, wraps the cache data in the workspace as part of the app:
* Allows the installer to understand the functionality and purpose of the app before connecting data.
* Creates an experience that drives the installer to further explore app capabilities, which leads to connecting the app to datasources.
<p>It is recommended to have quality sample data prior to creating the app as well as insuring your report and dashboards are populated with data.

## Known limitations

| Feature | Known Limitation |
|---------|---------|
|Contents:  Datasets   | Exactly one dataset should be present. Only datasets built in Power BI Desktop (.pbix files) are allowed. <br>Not supported: Datasets from other template apps, cross-workspace datasets, paginated reports (.rdl files), Excel workbooks |
|Contents: Dashboards | Real-time tiles aren’t allowed (in other words, no support for PushDataset or pubnub) |
|Contents: Dataflows | Not supported: Dataflows |
|Contents from files | Only PBIX files are allowed. <br>Not supported: .rdl files (paginated reports), Excel workbooks   |
| Data sources | Data sources supported for cloud Scheduled Data refresh are allowed. <br>Not supported: <li> DirectQuery</li><li>Live connections (no Azure AS)</li> <li>On-premises data sources (personal and enterprise gateways aren't supported)</li> <li>Real-time (no support for pushdataset)</li> <li>Composite models</li></ul> |
| Dataset: cross-workspace | No cross-workspace datasets are allowed  |
| Query parameters | Not supported: Parameters of type "Any" or "Binary" type block refresh operation for dataset |
| Custom visuals | Only publicly available custom visuals are supported. [Organizational custom visuals](power-bi-custom-visuals-organization.md) not supported |

## Next steps

[What are Power BI template apps? (preview)](service-template-apps-overview.md)
