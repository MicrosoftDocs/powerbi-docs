---
title: Introduction to dataflows and self service data prep
description: Overview of what are Power BI dataflows and when to use them
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 04/02/2019
ms.author: davidi

LocalizationGroup: Data from files
---
# Introduction to dataflows and self service data prep

As data volume continues to grow, so does the challenge of wrangling that data into well-formed, actionable information. We want data that’s ready for analytics, to populate visuals, reports, and dashboards, so we can quickly turn our volumes of data into actionable insights. With self-service data prep for big data in Power BI, you can go from data to Power BI insights with just a few clicks.

![flow of data](media/dataflows-intro-self-service-flow.png)

## When to use dataflows

Dataflows are designed to support the following scenarios:

- Create re-usable transformation logic that can be shared by many datasets and reports inside Power BI. Dataflows promotes re-usability of the underlying preventing the need to create separate connections with your cloud or on-premise data sources
- Expose the data in your own Azure data lake gen 2 storage to allow you to connect other Azure services to the raw underlying data
- Create a single source of the truth by forcing analysts to connect to the dataflows rather than the underlying systems giving you control over which and how data is exposed to report creators. You can also map the data to industry standard definitions allowing you to create tidy curated views which can work against other services/products in the Power Platform.
- If you wish to work with large data volumes and perform ETL at scale, dataflows with Power BI premium scales more efficiently and gives you more flexibility. Dataflows supports a wide range of cloud and on-premise sources. For a full range of supported connectors click here (Link – should take you to this page).
- Prevent analysts the ability to have access to the underlying data source. As you can build on top of dataflows, it is sometimes more convenient to give access to the underlying data sources to a few select individuals and then provide access to the dataflows for analysts to build on top of. This will consequently reduce the load to the underlying systems and gives admins much finer granular control of when the systems get loaded from refreshes.

Once you’ve created a dataflow, you can use Power BI Desktop and the Power BI service to create datasets, reports, dashboards, and apps that leverage the power of the Common Data Model to drive deep insights into your business activities. Dataflow refresh scheduling is managed directly from the workspace in which your dataflow was created, just like your datasets.

## Next Steps
This article provided an overview of self service data prep for big data in Power BI, and the many ways you can use it. The following articles go into more detail about common usage scenarios for dataflows.

For more information about the Common Data Model, you can read its overview article:
* [Common Data Model - overview ](https://docs.microsoft.com/powerapps/common-data-model/overview)