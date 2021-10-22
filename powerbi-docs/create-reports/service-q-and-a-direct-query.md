---
title: Use Q&A with live connections in Power BI
description: Documentation for using Power BI Q&A natural language queries with live connections to Analysis Services data and the on-premises data gateway.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 09/13/2021
LocalizationGroup: Ask questions of your data
---
# Enable Q&A for live connections in Power BI

You can import datasets into Power BI, or you can create a *live connection* to them. Live connection datasets are often on premises. If so, you manage live connections by using a [gateway](../connect-data/service-gateway-onprem.md). Data and inquiries are sent back and forth using live queries.

> [!NOTE]
> Live connections also support Azure Analysis Services datasets, which don't require a gateway.

## Q&A for on-premises data gateway datasets
If you'd like to use Q&A with datasets you access through a gateway, you'll need to enable them first.

Once enabled, Power BI creates an index of your data source and uploads a subset of that data to Power BI to enable asking questions. It may take several minutes to create the initial index and Power BI maintains and updates the index automatically as your data changes. Using Q&A with these datasets behaves the same as with data published to Power BI. The full set of features available in the Q&A experience is supported in both cases.

As you ask questions in Power BI, Q&A determines the best visual to construct or report sheet to use to answer your question using an index of your dataset. After determining the best potential answer, Q&A uses DirectQuery to fetch live data from the data source via the gateway to populate charts and graphs. As a result, Power BI Q&A always shows the most up-to-date data directly from the underlying data source.

Since Power BI Q&A uses the text and schema values from your data source to determine how to query the underlying model for answers, searches for specific new or deleted text values (such as asking for a customer name related to a newly added text record) rely on the index being up-to-date with the latest values. Power BI automatically keeps the text and schema index up to date within a 60-minute window of changes.

For more information, see:

* What is the [on-premises data gateway](../connect-data/service-gateway-onprem.md)?
* [Power BI Q&A for consumers](../consumer/end-user-q-and-a.md)

## Enable Q&A
Once you have the data gateway set up, connect to your data from Power BI.  Either create a dashboard using your on-premises data, or upload a .pbix file that uses on-premises data.  You may also already have on-premises data in dashboards, reports, and datasets that have been shared with you.

1. In the upper-right corner of Power BI, select the cog icon ![gear icon](media/service-q-and-a-direct-query/power-bi-cog.png) and choose **Settings**.
   
   ![Settings menu](media/service-q-and-a-direct-query/powerbi-settings.png)
2. Select **datasets** and choose the dataset to enable for Q&A.
   
   ![Datasets screen of Settings menu](media/service-q-and-a-direct-query/power-bi-q-and-a-settings.png)
3. Expand **Q&A**, select the checkbox for **Turn on Q&A to ask natural language questions about your data**, and choose **Apply**.
   
    ![Q&A area expanded](media/service-q-and-a-direct-query/power-bi-qna-dataset-direct-query.png)

## What data is cached and how is privacy protected?
When you enable Q&A for your on-premises data, a subset of your data is cached in the service. This caching ensures that Q&A works with a reasonable performance. Power BI excludes values longer than 24 characters from caching. The cache is deleted within a few hours when you disable Q&A by unchecking **Turn on Q&A for this dataset**, or when you delete your dataset.

## Considerations and troubleshooting
The feature has some limitations:

* Initially the feature is only available for SQL Server 2016 Analysis Services Tabular data sources. The feature is optimized to work with tabular data. The Q&A experience isn't yet supported for multi-dimensional. Additional data sources supported by the on-premises data gateway will be rolled out over time.
* Full support for row-level security defined in SQL Server Analysis Services isn't available initially. While asking questions in Q&A, the “autocomplete” of questions while typing can show string values a user doesn't have access to. However, RLS defined in the model is respected for report and chart visuals so no underlying numerical data can be exposed. Options to control this behavior will be released in coming updates.
* Q&A is not supported for data models with Object level security (OLS). To learn more, see [Q&A limitations](../natural-language/q-and-a-limitations.md#data-sources-not-supported).  
* Live connections are only supported with the on-premises data gateway. As a result, this feature can't be used with the personal gateway.

## Next steps

- [On-premises data gateway](../connect-data/service-gateway-onprem.md)  
- [Manage your data source - Analysis Services](../connect-data/service-gateway-enterprise-manage-ssas.md)  
- [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)  
- [Power BI Q&A Overview](../consumer/end-user-q-and-a.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
