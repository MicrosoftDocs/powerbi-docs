---
title: Power BI embedded analytics overview
description: Learn about embedded analytics in Power BI a Microsoft solution for embedding BI content.
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: overview
ms.date: 06/17/2021
ms.custom: intro-overview
---

# What is Power BI embedded analytics?

Power BI embedded analytics allows you to embed your Power BI content such as reports, dashboards and tiles, in a web application or in a website.

Using Power BI embedded analytics you can:

* Deliver compelling data experiences for your end users, enabling them to take action based on insights from your solutions data.

* Quickly and easily provide exceptional customer-facing reports, dashboards, and analytics in your own apps by using and branding Power BI as your own.

* Reduce developer resources by automating the monitoring, management, and deployment of analytics, while getting full control of Power BI features and intelligent analytics.

## What are the Power BI embedded analytics solutions?

Power BI embedded analytics offers two solutions:

* [Embed for your customers](#embed-for-your-customers)

* [Embed for your organization](#embed-for-your-organization)

### Embed for your customers

The *embed for your customers* solution allows you to build an app that uses non-interactive authentication against Power BI. Your customers are likely to be external users, and they don't need to sign in using Power BI credentials to view the embedded content. Typically, this solution is used by independent software vendors (ISVs) who are developing applications for third parties. For a tutorial, see [Embed Power BI content using a sample embed for your customers application](./embed-sample-for-customers.md).

### Embed for your organization

The *embed for your organization* solution allows you to build an app that requires signing in using Power BI credentials. Once signed in users can only consume embedded content they have access to on Power BI service. This solution is aimed at big organizations that are building an app for internal users. For a tutorial, see [Embed Power BI content into an application for your organization](./embed-sample-for-your-organization.md).

## Comparing the solutions

The following table provides a comparison between the two Power BI embedded analytics solutions.

|Embed for your customers  |Embed for your organization  |
|---------|---------|
|Also known as **app owns data**         |Also known as **user owns data**         |
|Aimed at external users         |Aimed at internal users         |
|To authenticate app users, use your own authentication method        |App users authenticate against Azure AD         |
|App users don't need a license         |Each app user needs a Power BI license         |
|Non-interactive authentication, your app uses a *service principal* or a *master user* to authenticate        |Interactive authentication, your app uses the app user credentials to authenticate         |
|   |   |

## What are Power BI capacities?

Capacity is a set of resources reserved for exclusive use. It enables you to publish dashboards, reports, and datasets to users, without having to purchase per-user licenses. It also offers dependable, consistent performance for your content.

There are two types of Power BI embedded analytics offerings, each requiring a different [capacity](./embedded-capacity.md):

* [Power BI Embedded](#power-bi-embedded)

* [Embedding with Power BI](#embedding-with-power-bi)

### Power BI Embedded

*Power BI Embedded* is an an Azure offer that requires A SKUs. *Power BI Embedded* is associated with the [*embed for your customers*](#embed-for-your-customers) solution.

### Embedding with Power BI

Embedding with Power BI is a Microsoft Office offer that requires P or EM SKUs.

## Next steps

> [!div class="nextstepaction"]
> [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md)

>[!div class="nextstepaction"]
>[Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)

> [!div class="nextstepaction"]
> [Tutorial: Embed Power BI content using a sample embed for your customers application](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
> [Tutorial: Embed Power BI content using a sample embed for your organization application](embed-sample-for-your-organization.md)