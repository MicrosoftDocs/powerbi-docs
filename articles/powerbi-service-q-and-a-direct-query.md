<properties
   pageTitle="Using Q&A with Power BI Gateway - Enterprise data (Preview)"
   description="Documentation for using Power BI Q&A natural language queries with Direct Query data and Enterprise Gateway data."
   services="powerbi"
   documentationCenter=""
   authors="mihart, fetiye"
   manager="mblythe"
   backup="mihart"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="07/07/2016"
   ms.author="fetiye"/>


# Enable Q&A for Direct Query (Preview)

##  What is On-premises Data Gateway?  What is DirectQuery?

Datasets in Power BI can be imported into Power BI or you can create a live connection to them. Live connection datasets are often referred to as "on-premises". The live connections are managed using a [gateway](powerbi-gateway-onprem.md) and data and inquiries are sent back and forth using DirectQuery.

##  Q&A for On-premises Data Gateway datasets

If you'd like to use Q&A with datasets you access through a gateway, you'll need to enable them first.

Once enabled, Power BI creates an index of your data source and uploads a subset of that data to Power BI to enable asking questions. It may take several minutes to create the initial index and Power BI maintains and updates the index automatically as your data changes. Using Q&A with these datasets behaves the same as with data published to Power BI. The full set of features available in the Q&A experience is supported in both cases, including using the data source with Cortana.

As you ask questions in Power BI, Q&A determines the best visual to construct or report sheet to use to answer your question using an index of your dataset. After determining the best potential answer, Q&A uses DirectQuery to fetch live data from the data source via the Enterprise Gateway to populate charts and graphs. This ensures Power BI Q&A results always show the most up-to-date data directly from the underlying data source.

Since Power BI Q&A uses the text and schema values from your data source to determine how to query the underlying model for answers, searches for specific new or deleted text values (such as asking for a customer name related to a newly added text record) rely on the index being up-to-date with the latest values. Power BI automatically keeps the text and schema index up to date within a 60 minute window of changes.


For more information, see:

- What is the [On-premises Data Gateway](powerbi-gateway-onprem.md)?

- [Introduction to Power BI Q&A](powerbi-service-q-and-a.md)


##  Enable Q&A
Once you have the enterprise gateway set up, connect to your data from Power BI.  Either create a dashboard using your on-premises data, or upload a .pbix file that uses on-premises data.  You may also already have on-premises data in dashboards, reports, and datasets that have been shared with you.

1.  In the upper-right corner of Power BI, select the cog icon ![](media/powerbi-service-q-and-a-direct-query/power-bi-cog.png) and choose **Settings**.

    ![](media/powerbi-service-q-and-a-direct-query/powerbi-settings.png)

2.  Select **datasets** and choose the dataset to enable for Q&A.

    ![](media/powerbi-service-q-and-a-direct-query/power-bi-q-and-a-settings.png)

3. Expand **Q&A and Cortana**, select the checkbox for **Turn on Q&A for this dataset** and choose **Apply**.

    ![](media/powerbi-service-q-and-a-direct-query/power-bi-q-and-a-directquery.png)



##  What data is cached and how is privacy protected?

When you enable Q&A for your on-premises data, a subset of your data is cached in the service. This is done to ensure that Q&A works with a reasonable performance. We exclude values longer than 24 characters from caching. The cache is deleted within a few hours when you disable Q&A by unchecking **Turn on Q&A for this dataset**, or when you delete your dataset.

##  Limitations during Public Preview
During the Preview phase of this feature, there are several limitations:

- Initially the feature is only available for SQL Server 2016 Analysis Services data sources. The feature is optimized to work with tabular data. Some functionality is available for multi-dimensional data sources, but the full Q&A experience is not yet supported for this dataset type. Additional data sources supported by the enterprise gateway will be rolled out during the public preview.

- Full support for row level security defined in the SQL Server Analysis Services is not available initially in the public preview. While asking questions in Q&A, the “auto-complete” of questions while typing can show string values a user does not have access to. However, RLS defined in the model is respected for report and chart visuals so no underlying numerical data can be exposed. Options to control this behavior will be released in coming updates.

- Q&A does not work with Power BI Gateway-Personal data sources.

## See also

[Power BI Quick Insights](powerbi-service-auto-insights.md)

[Optimize your data for Power BI Quick Insights](powerbi-service-auto-insights-optimize.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)

[Dashboards in Power BI](powerbi-service-dashboards.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
