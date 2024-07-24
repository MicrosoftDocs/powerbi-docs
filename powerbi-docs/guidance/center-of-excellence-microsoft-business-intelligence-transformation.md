---
title: Microsoft's BI transformation
description: Learn how Microsoft successfully drives a data culture for business decision making. It describes their strategy and vision for BI.
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 03/11/2022
---
# Microsoft's BI transformation

> [!TIP]
> This article focuses on Microsoft's experience establishing a [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md). When setting up your own Center of Excellence, we recommend that you also review the information covered in the [Fabric adoption roadmap](fabric-adoption-roadmap.md).

This article targets IT professionals and IT managers. You'll learn about our BI strategy and vision, which enables us to continuously leverage our data as an asset. You'll also learn how we successfully drive a data culture of business decision making with Power BI.

Some background first: Today, the explosion of data is impacting consumers and businesses at breakneck speeds. Succeeding in this data-intensive environment requires analysts and executives who can distill enormous amount of data into succinct insights. The revolutions in Microsoft's BI tools have changed the way that Microsoft itself explores their data and gets to the right insights needed to drive impact in the company.

So, how can your organization, too, revolutionize the way it works with data? Let's help you understand by sharing the story of our BI transformation journey.

## Microsoft journey

Several years ago at Microsoft, our organizational culture encouraged individuals to pursue full ownership of data and insights. It also experienced strong cultural resistance to doing things in a standardized way. So, the organizational culture led to reporting and analytic challenges. Specifically, it led to:

- Inconsistent data definitions, hierarchies, metrics, and Key Performance Indicators (KPIs). For example, each country or region had their own way of reporting on new revenue. There was no consistency, yet much confusion.
- Analysts spending 75% of time collecting and compiling data.
- 78% of reports being created in "offline environment".
- Over 350 centralized finance tools and systems.
- Approximately $30 million annual spend on "shadow applications".

These challenges prompted us to think about how we could do things better. Finance and other internal teams received executive support to transform the business review process, which led to building a unified BI platform as our single source of truth. (We'll discuss more about our BI platform later in this article.) Ultimately, these innovations led to business reviews being transformed from dense tabular views into simpler, more insightful visuals focused on key business themes.

How did we achieve this successful outcome? Delivering centralized BI managed by IT and extending it with [self-service BI (SSBI)](powerbi-implementation-planning-usage-scenario-overview.md#self-service-bi-scenarios) led to success. We describe it in two creative ways: *discipline at the core* and *flexibility at the edge*.

### Discipline at the core

Discipline at the core means that IT retains control by curating a single master data source. Delivering standardized corporate BI and defining consistent taxonomies and hierarchies of KPIs is part of that discipline. Importantly, data permissions are enforced centrally to ensure our people can only read the data they need.

First, we understood that our BI transformation wasn't a technology problem. To achieve success we learned to first define success, and then translate it into key metrics. It cannot be understated how important it was for us to achieve consistency of definition across our data.

Our transformation didn't happen all at once. We prioritized the delivery of the subsidiary scorecard consisting of about 30 KPIs. Then, over several years, we gradually expanded the number and depth of subject areas, and built out more complex KPI hierarchies. Today, it allows us to roll up lower-level KPIs at customer level to higher ones at company level. Our total KPI count now exceeds 2000, and each is a key measure of success and is aligned to corporate objectives. Now across the entire company, corporate reports and SSBI solutions present KPIs that are well-defined, consistent, and secure.

### Flexibility at the edge

At the edge of the core, our analysts in the Finance, Sales, and Marketing teams became more flexible and agile. They now benefit from the ability to analyze data more quickly. More formally, this scenario is described as *managed self-service BI (SSBI)*. We now understand that managed SSBI is about *mutual benefit* for IT and analysts. Importantly, we experienced optimizations by driving standardization, knowledge, and the reuse of our data and BI solutions. And, as a company, we derived more value synergistically as we found the right balance between centralized BI and managed SSBI.

### Our solution

**Starlight** is the name we give to our internal data unification and analytics platform, which supports finance, sales, marketing, and engineering. Its mission is to deliver a robust, shared, and scalable data platform. The platform was built entirely by Finance, and continues in operation today using the latest Microsoft products.

The **KPI Lake** isn't an Azure Data Lake. Rather, it's a Starlight-powered tabular BI semantic model hosted in Azure IaaS using Microsoft SQL Server Analysis Services. The BI semantic model delivers data sourced from over 100 internal sources, and defines numerous hierarchies and KPIs. Its mission is to enable business performance reporting and analysis teams across Finance, Marketing, and Sales. It does so to obtain timely, accurate, and well performing insights through unified BI semantic models from relevant sources.

When first deployed, it was an exciting time because the tabular BI semantic model resulted in immediate and measurable benefits. The first version centralized C+E Finance and Marketing BI platforms. Then, over the past six years, it's been expanded to consolidate additional business insight solutions. Today, it continues to evolve, powering our global and commercial business reviews as well as standard reporting and SSBI. Its adoption has spiked 5X since its release—well beyond our initial expectations.

Here's a summary of key benefits:

- It powers our subsidiary scorecard, worldwide business reviews, and finance, marketing, sales reports and analytics.
- It supports self-service analytics, enabling analysts to discover insights hidden in data.
- It drives reporting and analytics for incentive compensation, marketing and operations analysis, sales performance metrics, senior leadership reviews, and the annual planning process.
- It delivers automated and dynamic reporting and analytics from a *single source of truth*.

The **KPI Lake** is a great success story. It's often presented to our customers to showcase an example of how to effectively use our latest technologies. Not surprisingly, it's highly resonant with many of them.

#### How it works

The Starlight platform manages the flow of data from acquisition, to processing, and then all the way to publication:

1. Robust and agile data integration takes place on a scheduled basis, consolidating data from over 100 disparate raw sources. Source data systems include relational databases, Azure Data Lake Storage, and Azure Synapse databases. Subject areas include finance, marketing, sales, and engineering.
2. Once staged, the data is conformed and enriched using master data and business logic. It's then loaded to data warehouse tables. The tabular BI semantic model is then refreshed.
3. Analysts across the company use Excel and Power BI to deliver insights and analytics from the tabular BI semantic model. And, it enables business owners to champion metric definitions for their own business. When necessary, scaling is achieved using Azure IaaS with load balancing.

## Deliver success

Humorously, everybody wants one version of the truth... as long as it's theirs. But for some organizations it's their reality. They have multiple versions of the truth as a result of individuals pursuing full ownership of data and insights. For these organizations, this unmanaged approach isn't likely to be a pathway to business success.

It's why we believe you need a *Center of Excellence (COE)*. A COE is a central team that's responsible for defining company-wide metrics and definitions, and much more. It's also a business function that organizes people, processes, and technology components into a comprehensive set of business competencies and capabilities.

We see much evidence to support that a comprehensive and robust COE is critical to delivering value and maximizing business success. It can include change initiatives, standard processes, roles, guidelines, best practices, support, training, and much more.

We invite you to read the articles in this COE series to learn more. Let's help you discover how your organization can embrace change to deliver success.

## Related content

For more information about this article, check out the following resources:

- [Establish a Center of Excellence](center-of-excellence-establish.md)
- [Fabric adoption roadmap: Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)

In the [next article in this series](center-of-excellence-establish.md), learn how a COE helped us at Microsoft create a standardized analytics and data platform to unlock insights from our data.

### Professional services

Certified Power BI partners are available to help your organization succeed when setting up a COE. They can provide you with cost-effective training or an audit of your data. To engage a Power BI partner, visit the [Power BI partner portal](https://powerbi.microsoft.com/partners/).

You can also engage with experienced consulting partners. They can help you [assess](https://appsource.microsoft.com/en-us/marketplace/consulting-services?product=power-bi&serviceType=assessment&country=ALL&region=ALL), [evaluate](https://appsource.microsoft.com/en-us/marketplace/consulting-services?product=power-bi&serviceType=proof-of-concept&country=ALL&region=ALL), or [implement](https://appsource.microsoft.com/en-us/marketplace/consulting-services?product=power-bi&serviceType=implementation&country=ALL&region=ALL&page=1) Power BI.
