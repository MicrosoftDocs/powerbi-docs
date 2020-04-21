---
title: Microsoft's BI transformation
description: Learn how Microsoft successfully drives a data culture of business decision making with Power BI.
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

So, how can your organization revolutionize the way you work with data? Let's share with you the BI transformation journey at our Finance division.

## Microsoft Finance journey

Several years ago at Microsoft, the organizational culture encouraged individuals to pursue full ownership of data and insights. It also experienced strong cultural resistance to doing things in a standardized way. So, the organizational culture led to reporting and analytic challenges. Specifically, it led to:

- Inconsistent data definitions, hierarchies, metrics, and Key Performance Indicators (KPIs)
- Analysts spending 75% of time collecting and compiling data
- 78% of reports created in "offline environment"
- Over 350 centralized finance tools and systems
- Approximately $30 million annual spend on "shadow applications"

These challenges led to a new BI strategy, which delivers centralized BI managed by IT coupled with self-service BI (SSBI). It's described as _flexibility at the edge_ because IT retains centralized control of BI, while analysts are empowered to design, customize, and maintain their own BI solutions.

IT retains control by curating a single master data source, delivering standardized corporate BI, and defining consistent taxonomies. While analysts become more agile, benefitting from the ability to analyze data more quickly. More formally, this scenario is described as _managed BI_. Managed BI is about mutual benefit for IT and analysts. Importantly, it achieves optimizations by driving standardization, knowledge, and reuse of data and BI solutions. In this case, we derived value synergistically when we found the right balance between centralized BI and SSBI.

### Tipping point

Before adopting managed BI, we faced many challenges:

- After decades of growth, Finance had developed hundreds of siloed reporting systems and tools.
- It spent countless hours each reporting period creating static reports consisting of hundreds of pages of dense tables and graphs.
- An estimated 75% of analysts time to prepare for business reviews was to simply gather data and information from various systems and scrub the numbers to ensure accurate reporting.

It prompted us to think about how to do things better. Finance teams received executive support to transform the business review process for the FY16 mid-year review, which ultimately led to building the _Starlight_ platform and the _KPI Lake_. Ultimately, these innovations then led to business reviews being transformed from dense tabular views into simpler, more insightful visuals focused on key business themes.

### Starlight and the KPI Lake

**Starlight** is the name given to the data unification and analytics platform, which supports Finance, Sales, Marketing, and EG. Its  mission is to deliver a robust, shared, and scalable data platform. the platform was built entirely by Finance, and continues in operation today using the latest Microsoft products and technologies.

The **KPI Lake** isn't an Azure Data Lake. Rather, it's a Starlight-powered tabular model hosted in Azure IaaS using Microsoft SQL Server Analysis Services. The tabular model delivers data sourced from over 45 internal sources, and defines numerous hierarchies and KPIs. Its mission is to enable business performance reporting and analysis teams across Finance, Marketing, and Sales to obtain timely, accurate, and performant insights through unified models from relevant sources.

When first deployed, the tabular model resulted in immediate and measurable benefits. It began by centralizing C+E Finance and Marketing BI platforms, and over the past six years has been expanded to consolidate additional business insight solutions. Today, it continues to evolve, powering our global and commercial business reviews as well as standard reporting and SSBI. Beyond our initial predictions, its adoption has spiked 5X since its release.

Here's a list of key benefits:

- It powers the Subsidiary Scorecard, worldwide QBUs, and Finance, Marketing, Global Sales, and WCB reports and analytics.
- It supports self-service analytics.
- It drives reporting and analytics for Incentive Compensation, Marketing and Operations analysis, Sales Performance Metrics, Senior Leadership meetings, and the annual planning process.
- It delivers automated and dynamic reporting and analytics from a _single source of truth_.

The **KPI Lake** is a great success story. It's often presented to customers to showcase an example of how to effectively use our latest technologies. It's highly resonant with many of our commercial customers.

### How it works

The Starlight platform manages the flow of data from acquisition, to processing, to publishing:

1. Robust and agile data integration takes place on a scheduled basis, consolidating data from over 100 disparate raw sources. Source data systems include relational databases, Azure Cosmos DB databases, and Azure Synapse databases. Subject areas include Finance, Marketing, Sales, and Engineering.
2. Once staged, the data is conformed and enriched using master data and business logic. It's then loaded to data warehouse tables. The tabular model is then refreshed.
3. Excel and Power BI are used by analysts across the company to deliver insight and analytics from the tabular model. It enables business owners to champion metric definitions for their own business. Scaling is achieved using Azure IaaS with load balancing.

## Key points

The intent of this article is to acknowledge that the goal of SSBI is to empower analysts to design, customize, and maintain their own BI solutions. Because without this ability, analysts are forced to rely entirely upon IT data and reports.

SSBI isn't a complete solution, nor is it a replacement for centralized BI. And it's not about analysts working in isolation. Rather, it's about analysts working more closely with IT to share the BI workload. Yet, IT retains control and focus on delivering "discipline at the core".

### SSBI advantages

Analysts can:

- Access and work with corporate data without reliance on IT.
- Create ad hoc solutions.
- Create personal and team-centric solutions.
- Base decisions on data instead of intuition.
- Make faster and more accurate decisions.
- Define alerts to notify data changes.

### SSBI considerations

However, despite many advantages associated with SSBI, there are considerations that IT must be aware of:

- SSBI requires time and expense to implement and maintain.
- Analysts will require training, tools, and permissions to access data.
- Data catalogs should be maintained to provide discoverable information about corporate data.
- SSBI queries can impact on corporate system performance and availability
- SSBI solutions can result in duplication of effort, or duplication of data and logic. It's commonly referred to as _multiple versions of the truth_, or _spreadmart_ (when done in Excel).
- SSBI solutions may not be known to IT, documented, reviewed, approved, backed up, or adequately secured.
- Knowledge of, and expertise to maintain, SSBI solutions could be lost when an analyst leaves the organization.

### Managed SSBI

Managed BI is about mutual benefit for IT and analysts, and IT governance. The goal of clear IT governance is to ensure investments in IT generate business value and mitigate risk. Good governance should increase adoption of BI, and also ensure responsible BI by managing with oversight to:

- Review, approve, and audit SSBI solutions.
- Ensure trustworthy data is delivered in compliant, responsive, and secure ways.
- Ensure SSBI solutions remain available with current data, and are backed up.
- Have visibility into how data is used throughout the organization.
- Incorporate, or upgrade, SSBI solutions into centrally managed BI solutions, if appropriate.
- Scale compute resources, when required.
