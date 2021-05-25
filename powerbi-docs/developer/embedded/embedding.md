---
title: Embedded analytics with Power BI
description: Power BI offers APIs to embed Power BI embedded analytics dashboards and reports into applications.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: overview
helpviewer_keywords: 
  - "embedded analytics"
  - "embedding"
  - "Power BI embedding"
  - "app owns data"
  - "user owns data"
  - "Power BI APIs"
ms.custom: ''
ms.date: 04/02/2021
---

# Embedded analytics with Power BI

The Power BI service (SaaS) and the Power BI Embedded service in Azure (PaaS) have APIs for embedding your dashboards and reports. When embedding content, this gives you access to the latest Power BI features such as dashboards, gateways, and workspaces.

You can go through the [Embedding setup tool](https://aka.ms/embedsetup) to quickly get started and download a sample application.

Choose the solution that is right for you:

* [Embedding for your organization](embedding.md#embedding-for-your-organization) allows you to extend the Power BI service. To do this, in the [Embedding setup tool](https://app.powerbi.com/embedsetup), implement the *Embed for your organization* solution.
* [Embedding for your customers](embedding.md#embedding-for-your-customers) allows you to embed dashboards and reports to users who don't have a Power BI account. To do this, in the [Embedding setup tool](https://app.powerbi.com/embedsetup), implement the *Embed for your customers* solution.

![PBIE sample](media/embedding/what-can-you-do-02.png)

> [!NOTE]
> Embedding with a Premium Per User (PPU) license is only supported with SaaS embedding, and a license is required for each user.

## Use APIs

There are two main scenarios for embedding Power BI content:
- Embedding for your organization's users (who have Power BI licenses). 
 
- Embedding for your users and customers without requiring Power BI licenses. 

The [Power BI REST API](/rest/api/power-bi/) allows for both scenarios.

For customers and users without Power BI licenses, you can embed dashboards and reports into your custom application, using the same API to either service your organization or your customers. Your customers see the application-managed data. Also, your organization's Power BI users have additional options to view *their data* directly in Power BI or in the  embedded application's context. You can take full advantage of the JavaScript and REST APIs for your embedding needs.

To understand how embedding works, see the [JavaScript embed sample](https://microsoft.github.io/PowerBI-JavaScript/demo/).

## Embedding for your organization

**Embedding for your organization** allows you to extend the Power BI service. This type of embedding requires your application's users sign into the Power BI service to view the content. Once someone in your organization signs in, they only have access to dashboards and reports that they own or that someone shared with them in the Power BI service.

Organization embedding examples include internal applications such as [SharePoint Online](https://powerbi.microsoft.com/blog/integrate-power-bi-reports-in-sharepoint-online/), [Microsoft Teams integration (you must have Admin rights)](https://powerbi.microsoft.com/blog/power-bi-teams-up-with-microsoft-teams/), and [Microsoft Dynamics](/dynamics365/customer-engagement/basics/add-edit-power-bi-visualizations-dashboard).

To embed for your organization, see [Tutorial: Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md).

Self-service capabilities, such as edit, save, and more, are available through the [JavaScript API](https://github.com/Microsoft/PowerBI-JavaScript) when embedding for Power BI users.

You can go through the [Embedding setup tool](https://app.powerbi.com/embedsetup) to get started and download a sample application that walks you through integrating a report for your organization.

## Embedding for your customers

**Embedding for your customers** lets you embed dashboards and reports for users who don't have a Power BI account. This type of embedding is also known as *Power BI Embedded*.

[Power BI Embedded](azure-pbie-what-is-power-bi-embedded.md) is a **Microsoft Azure** service that lets independent software vendors (ISVs) and developers quickly embed visuals, reports, and dashboards into an application. This embedding is done through a capacity-based, hourly metered model.

![Embedding flow for embedding for your customers](media/embedding/powerbi-embed-flow.png)

Power BI Embedded has benefits for an ISV, their developers, and customers. For example, an ISV can start creating visuals for free with Power BI Desktop. By minimizing visual analytic development efforts, ISVs achieve faster time to market and stand out from competitors with differentiated data experiences. ISVs can also opt to charge a premium for the additional value they create with embedded analytics.

With Power BI Embedded, your customers don't need to know anything about Power BI. You can use two different methods to create an embedded application:
- Power BI Pro account 
- Service principal 

The Power BI Pro account acts as your application's master account (think of it as a proxy account). This account allows you to generate embed tokens that provide access to your application's Power BI dashboards and reports.

[Service principal](embed-service-principal.md) can embed Power BI content into an application using an **app-only** token. It also allows you to generate embed tokens that provide access to your application's Power BI dashboards and reports.

Developers using Power BI Embedded can spend time focused on building their application's core functionality rather than spending time developing visuals and analytics. They can rapidly meet customer report and dashboard demands and embed easily with fully documented APIs and SDKs. By enabling easy-to-navigate data exploration in apps, ISVs allow customers to make quick, data-driven decisions in context from any device.

> [!IMPORTANT]
> While embedding requires the Power BI service, your customers do not need to have a Power BI account to view your application's embedded content.

When you're ready to move to production, your workspace must be assigned to a capacity. [Create a Power BI Embedded capacity](azure-pbie-create-capacity.md) in Microsoft Azure, to use with your applications.

For embedding details, see [How to embed Power BI content](embed-sample-for-customers.md).

## Next steps

You can now try to embed Power BI content into an application, or try to embed Power BI content for your customers.

> [!div class="nextstepaction"]
> [Embed for your organization](embed-sample-for-your-organization.md)

> [!div class="nextstepaction"]
> [What is Power BI Embedded?](azure-pbie-what-is-power-bi-embedded.md)

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)