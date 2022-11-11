---
title: Power BI embedded analytics overview
description: Learn about embedded analytics in Power BI a Microsoft solution for embedding BI content.
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: overview
ms.date: 07/14/2022
ms.custom: intro-overview
---

# What is Power BI embedded analytics?

**APPLIES TO:** ✔️&nbsp;App&nbsp;owns&nbsp;data ✔️&nbsp;User&nbsp;owns&nbsp;data

Power BI embedded analytics allows you to embed your Power BI items such as reports, dashboards and tiles, in a web application or in a website.

Using Power BI embedded analytics you can:

* Deliver compelling data experiences for your end users, enabling them to take action based on insights from your solutions data.

* Quickly and easily provide exceptional customer-facing reports, dashboards, and analytics in your own apps by using and branding Power BI as your own.

* Reduce developer resources by automating the monitoring, management, and deployment of analytics, while getting full control of Power BI features and intelligent analytics.

## Secure embed

[Secure embed](../../collaborate-share/service-embed-secure.md) is the simplest no-code way to embed a report into any portal that accepts a URL or iFrame. The viewer of the report must be properly licensed and can't interact with the report. Secure embed is available in the Power BI service.

For more advanced solutions that allow you to build an interactive app for your users, use one of the [Power BI embedded analytics solutions](#what-are-the-power-bi-embedded-analytics-solutions) described in this article.

## What are the Power BI embedded analytics solutions?

Power BI embedded analytics offers two solutions:

* [Embed for your customers](#embed-for-your-customers)

* [Embed for your organization](#embed-for-your-organization)

### Embed for your customers

The *embed for your customers* solution allows you to build an app that uses non-interactive authentication against Power BI. Your customers are likely to be external users, and they don't need to sign in using Power BI credentials to view the embedded content. Typically, this solution is used by independent software vendors (ISVs) who are developing applications for third parties. For a tutorial, see [Embed Power BI content using a sample embed for your customers application](./embed-sample-for-customers.md).

### Embed for your organization

The *embed for your organization* solution allows you to build an app that requires signing in using Power BI credentials. Once signed in users can only consume embedded content, they have access to on Power BI service. This solution is aimed at large organizations that are building an app for internal users. For a tutorial, see [Embed Power BI content into an application for your organization](./embed-sample-for-your-organization.md).

## Comparison of the *embed for your customers* vs *embed for your organization* solutions

The following table provides a comparison between the two Power BI embedded analytics solutions.

|Embed for your customers  |Embed for your organization  |
|---------|---------|
|Also known as **app owns data**         |Also known as **user owns data**         |
|Aimed at external users         |Aimed at internal users         |
|To authenticate app users, use your own authentication method        |App users authenticate against Azure AD         |
|App users don't need a license         |Each app user needs a Power BI license         |
|Non-interactive authentication. Your app uses a *service principal* or a *master user* to authenticate        |Interactive authentication. Your app uses the app user's credentials to authenticate         |

> [!TIP]
> Get started with the [Power BI embedded analytics setup tool](https://app.powerbi.com/embedsetup).

## What are Power BI capacities?

A capacity is a set of resources reserved for exclusive use. It enables you to publish dashboards, reports, and datasets to users, without having to purchase per-user licenses. It also offers dependable, consistent performance for your content.  
For development testing, you can use free embed trial tokens with a Pro license. To embed in a production environment, you must use a capacity.

> [!IMPORTANT]
> Free trial tokens are limited to development testing only. Once going to production, a capacity must be purchased. Until a capacity is purchased, the *Free trial version* banner will continue to appear at the top of the embedded report.

There are two types of Power BI embedded analytics offerings. Each offer includes a different type of SKU that you use to buy a Power BI [capacity](./embedded-capacity.md):

* [Power BI Embedded](https://azure.microsoft.com/services/power-bi-embedded/#overview) is an Azure offer that includes A SKUs. *Power BI Embedded* is associated with the [*embed for your customers*](#embed-for-your-customers) solution.

* [Power BI Premium](https://powerbi.microsoft.com/power-bi-premium/) is a Microsoft Office offer that includes P or EM SKUs.

For more information about the differences between the Embedded and Premium SKUs, see [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md).

## Next steps

* [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md)
* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)
* [Tutorial: Embed Power BI content using a sample embed for your customers application](embed-sample-for-customers.md)
* [Tutorial: Embed Power BI content using a sample embed for your organization application](embed-sample-for-your-organization.md)
* [Power BI embedded analytics setup tool](https://app.powerbi.com/embedsetup)
