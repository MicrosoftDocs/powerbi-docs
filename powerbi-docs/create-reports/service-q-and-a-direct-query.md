---
title: Use Q&A with live connections in Power BI
description: Learn how to use Power BI Q&A natural language queries with live connections to Analysis Services data and the on-premises data gateway.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 02/28/2023
LocalizationGroup: Ask questions of your data
---
# Enable Q&A for live connections in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

You can import semantic models into Power BI, or you can create a *live connection* to them. Live connection semantic models are often on premises, and are managed by using a [gateway](../connect-data/service-gateway-onprem.md). Data and inquiries are sent back and forth using live queries. To use Q&A with the semantic models you access through a gateway, you need to enable them first.

> [!NOTE]
> Live connections also support Azure Analysis Services datasets, which don't require a gateway.

## Q&A for on-premises data gateway datasets

Once you enable the live connection, Power BI creates an index of your data source and uploads a subset of that data to Power BI to enable asking questions. Creating the initial index might take several minutes, and Power BI maintains and updates the index automatically as your data changes. Q&A with these datasets behaves the same as with data published to Power BI. The full set of features available in the Q&A experience is supported in both cases.

When you ask questions in Power BI, Q&A determines the best visual to construct, or report sheet to use, to answer your question by using an index of your dataset. After Q&A determines the best potential answer, it uses DirectQuery to fetch live data from the data source via the gateway to populate charts and graphs. As a result, Power BI Q&A always shows the most up-to-date data directly from the underlying data source.

Power BI Q&A uses the text and schema values from your data source to determine how to query the underlying model for answers. Therefore, searches for specific new or deleted text values, such as asking for a customer name related to a newly added text record, rely on the index being up to date with the latest values. Power BI automatically keeps the text and schema index up to date within a 60-minute window of changes.

For more information, see:

* [What is an on-premises data gateway?](../connect-data/service-gateway-onprem.md)
* [Q&A for Power BI business users](../consumer/end-user-q-and-a.md)

## Enable Q&A

Once you have the data gateway set up, connect to your data from Power BI. Either create a dashboard using your on-premises data, or upload a .pbix file that uses on-premises data. You might also already have on-premises data in dashboards, reports, and semantic models that have been shared with you.

1. In Power BI, select the cog icon :::image type="icon" source="media/service-q-and-a-direct-query/power-bi-cog-2.png"::: and choose **Settings**.

   :::image type="content" source="media/service-q-and-a-direct-query/powerbi-settings-2.png" alt-text="Screenshot of Settings menu, highlighting the Settings option.":::
1. Select **Semantic models** and choose the semantic model to enable for Q&A.

   :::image type="content" source="media/service-q-and-a-direct-query/power-bi-q-and-a-settings-2.png" alt-text="Screenshot of Semantic models in Settings menu.":::
1. Expand **Q&A**, select the checkbox for **Turn on Q&A to ask natural language questions about your data**, and choose **Apply**.

   :::image type="content" source="media/service-q-and-a-direct-query/power-bi-qna-dataset-direct-query-2.png" alt-text="Screenshot highlighting the expanded Q&A area.":::

## What data is cached and how is privacy protected?

When you enable Q&A for your on-premises data, a subset of your data is cached in the service. This caching ensures that Q&A works with a reasonable performance. Power BI excludes values longer than 24 characters from caching. The cache is deleted within a few hours when you disable Q&A by unchecking **Turn on Q&A to ask natural language questions about your data** or when you delete your semantic model.

## Considerations and troubleshooting

The feature has some limitations:

* The feature is only available for SQL Server 2016 Analysis Services Tabular data sources. The feature is optimized to work with tabular data. The Q&A experience isn't supported for multi-dimensional. More data sources supported by the on-premises data gateway will be rolled out over time.
* Full support for row-level security defined in SQL Server Analysis Services isn't available. While asking questions in Q&A, the “autocomplete” of questions while typing can show string values a user doesn't have access to. However, RLS defined in the model is respected for report and chart visuals, so no underlying numerical data can be exposed. Options to control this behavior will be released in coming updates.
* Q&A isn't supported for data models with 0bject-level security (OLS). For more information, see [Q&A limitations](../natural-language/q-and-a-limitations.md#data-sources-not-supported).
* Live connections are only supported with the on-premises data gateway. As a result, this feature can't be used with the personal gateway.

## Related content

* [On-premises data gateway](../connect-data/service-gateway-onprem.md)
* [Manage your data source - Analysis Services](../connect-data/service-gateway-enterprise-manage-ssas.md)
* [Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)
* [Q&A for Power BI business users](../consumer/end-user-q-and-a.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
