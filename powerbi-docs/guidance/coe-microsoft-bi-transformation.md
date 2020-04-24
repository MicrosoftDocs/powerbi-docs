---
title: Microsoft's BI transformation
description: Learn how Microsoft successfully drives a data culture for business decision making.
author: peter-myers
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 04/15/2020
ms.author: v-pemyer
---
# Microsoft's BI transformation

This article targets IT professionals and IT managers. It describes how we at Microsoft strive to continuously modernize by using our data as an asset. And, it shares how we successfully drive a data culture of business decision making with Power BI.

Some background first: Today, the explosion of data is impacting consumers and businesses at breakneck speeds. Succeeding in this data-intensive environment requires smart analysts and savvy executives that are able to distill enormous amount of data into succinct insights. The revolutions in Microsoft's BI tools have revolutionized the way that Microsoft itself explores their data and gets to the right insights needed to drive impact in the company.

So, how can your organization, too, revolutionize the way it works with data? Let's help you understand by sharing the story of our BI transformation journey.

## Microsoft journey

Several years ago at Microsoft, our organizational culture encouraged individuals to pursue full ownership of data and insights. It also experienced strong cultural resistance to doing things in a standardized way. So, the organizational culture led to reporting and analytic challenges. Specifically, it led to:

- Inconsistent data definitions, hierarchies, metrics, and Key Performance Indicators (KPIs). For example, each subsidiary had their own way of reporting on new revenue. There was no consistency, yet a lot of confusion.
- Analysts spending 75% of time collecting and compiling data.
- 78% of reports created in "offline environment".
- Over 350 centralized finance tools and systems.
- Approximately $30 million annual spend on "shadow applications".

These challenges prompted us to think about how we could do things better. Finance teams received executive support to transform the business review process, which led to building a unified BI platform as our single source of truth. (We'll discuss more about our BI platform later in this article.) Ultimately, these innovations then led to business reviews being transformed from dense tabular views into simpler, more insightful visuals focused on key business themes.

How did we achieve this successful outcome? In essence, by delivering centralized BI managed by IT and extending it with self-service BI (SSBI). We can describe it in two creative ways: _discipline at the core_ and _flexibility at the edge_.

### Discipline at the core

Discipline at the core means that IT retains control by curating a single master data source. And, by delivering standardized corporate BI, and defining consistent taxonomies and hierarchies of KPIs. Importantly, data permissions are enforced centrally to ensure our people can only ever read the data they need.

First, we understood that our BI transformation wasn't a technology problem. To achieve success we learned to first define success, and then translate it into key metrics and data points. It cannot be understated how important it was for us to achieve consistency of definition across our data.

Our transformation didn't happen all at once. We prioritized the delivery of the subsidiary scorecard, consisting of about 30 KPIs. Then, over several years, we gradually expanded the number and depth of subject areas, and built out more complex KPI hierarchies. It allows us to roll up lower-level KPIs at customer level to higher ones at company level. Today, our total KPI count exceeds 2000, of which each is a key measure of success, and is aligned to corporate objectives. Now across the company, corporate reports and SSBI solutions present KPIs that are well-defined, consistent, and secure.

### Flexibility at the edge

At the edge of the core, analysts become more flexible and agile. They now benefit from the ability to analyze data more quickly. More formally, this scenario is described as _managed self-service BI_. Managed SSBI is about mutual benefit for IT and analysts. Importantly, we experienced optimizations by driving standardization, knowledge, and reuse of our data and BI solutions. And, as a company we derived more value synergistically as we found the right balance between centralized BI and managed SSBI.

### Our solution

**Starlight** is the name given to the data unification and analytics platform, which supports Finance, Sales, Marketing, and EG. Its  mission is to deliver a robust, shared, and scalable data platform. The platform was built entirely by Finance, and continues in operation today using the latest Microsoft products.

The **KPI Lake** isn't an Azure Data Lake. Rather, it's a Starlight-powered tabular model hosted in Azure IaaS using Microsoft SQL Server Analysis Services. The tabular model delivers data sourced from over 45 internal sources, and defines numerous hierarchies and KPIs. Its mission is to enable business performance reporting and analysis teams across Finance, Marketing, and Sales. It does so to obtain timely, accurate, and well performing insights through unified models from relevant sources.

When first deployed, it was an exciting time because the tabular model resulted in immediate and measurable benefits. The first version centralized C+E Finance and Marketing BI platforms. Then, over the past six years, it's been expanded to consolidate additional business insight solutions. Today, it continues to evolve, powering our global and commercial business reviews as well as standard reporting and SSBI. Its adoption has spiked 5X since its release—well beyond our initial expectations.

Here's a summary of key benefits:

- It powers the Subsidiary Scorecard, worldwide QBUs, and Finance, Marketing, Global Sales, and WCB reports and analytics.
- It supports self-service analytics, enabling analysts to discover insights hidden in data.
- It drives reporting and analytics for Incentive Compensation, Marketing and Operations analysis, Sales Performance Metrics, Senior Leadership meetings, and the annual planning process.
- It delivers automated and dynamic reporting and analytics from a _single source of truth_.

The **KPI Lake** is a great success story. It's often presented to customers to showcase an example of how to effectively use our latest technologies. Not surprisingly, it's highly resonant with many of our commercial customers.

#### How it works

The Starlight platform manages the flow of data from acquisition, to processing, all the way to publication:

1. Robust and agile data integration takes place on a scheduled basis, consolidating data from over 100 disparate raw sources. Source data systems include relational databases, Azure Cosmos DB databases, and Azure Synapse databases. Subject areas include Finance, Marketing, Sales, and Engineering.
2. Once staged, the data is conformed and enriched using master data and business logic. It's then loaded to data warehouse tables. The tabular model is then refreshed.
3. Analysts across the company use Excel and Power BI to deliver insights and analytics from the tabular model. And, it enables business owners to champion metric definitions for their own business. When necessary, scaling is achieved using Azure IaaS with load balancing.

## Deliver success

Humorously, everybody wants one version of the truth... as long as it's theirs. But this unmanaged approach isn't ever going to be a pathway to business success.

It's why you need a Center of Excellence (CoE). A CoE is central team that's responsible for defining company-wide metrics and definitions. It's business function that organizes people, processes, and technology components into a comprehensive set of business competencies and capabilities.

We see much evidence to support that a comprehensive and robust CoE is critical to delivering value and maximizing business success. The CoE can include change initiatives, standard processes, roles, guidelines, best practices, support, training, and much more.

Continue to read the articles in this CoE series to learn how your organization can embrace change to deliver success. Let's help you to seize opportunities that make analytics faster, easier, secure, and more insightful.

## Next steps

For more information about this article, check out the following resources:

- [Maximize success with a CoE](coe-introduction.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
