---
title: Introduction to dataflows and self-service data prep
description: Learn what Power BI dataflows are and how you can use them to provide insights for your organization.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Data from files
---

# Introduction to dataflows and self-service data prep

>[!TIP]
>You can also try Dataflow Gen2 in [Data Factory in Microsoft Fabric](/fabric/data-factory/), an all-in-one analytics solution for enterprises. [Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview) covers everything from data movement to data science, real-time analytics, business intelligence, and reporting. Learn how to [start a new trial](/fabric/get-started/fabric-trial) for free.

As data volume continues to grow, so does the challenge of wrangling that data into well-formed, actionable information. We want data that’s ready for analytics, to populate visuals, reports, and dashboards, so we can quickly turn our volumes of data into actionable insights. With self-service data prep for big data in Power BI, you can go from data to Power BI insights with just a few actions.

:::image type="content" source="media/dataflows-introduction-self-service-flow.png" alt-text="Diagram of the flow of data in the Microsoft Common Data Model.":::

## When to use dataflows

Dataflows are designed to support the following scenarios:

* Create reusable transformation logic that can be shared by many semantic models and reports inside Power BI. Dataflows promote reusability of underlying data elements, preventing the need to create separate connections with your cloud or on-premises data sources.

* Persist data in your own Azure Data Lake Gen 2 storage, enabling you to expose it to other Azure services outside Power BI.

* Create a single source of truth, curated from raw data using industry standard definitions, which can work with other services and products in the Power Platform. Encourage uptake by removing analysts' access to underlying data sources.

* Strengthen security around underlying data sources by exposing data to report creators in dataflows. This approach allows you to limit access to underlying data sources, reducing the load on source systems, and gives administrators finer control over data refresh operations.

* If you want to work with large data volumes and perform ETL at scale, dataflows with Power BI Premium scales more efficiently and gives you more flexibility. Dataflows supports a wide range of cloud and on-premises sources.

You can use Power BI Desktop and the Power BI service with dataflows to create semantic models, reports, dashboards, and apps that use the Common Data Model. From these resources, you can gain deep insights into your business activities. Dataflow refresh scheduling is managed directly from the workspace in which your dataflow was created, just like your semantic models.

> [!NOTE]
> Dataflows may not be available in the Power BI service for all U.S. Government DoD customers. For more information about which features are available, and which are not, see [Power BI feature availability for U.S. Government customers](../../enterprise/service-govus-overview.md#power-bi-feature-availability).


## Related content

This article provided an overview of self-service data prep for big data in Power BI, and the many ways you can use it.

The following articles provide more information about dataflows and Power BI:

* [Creating a dataflow](dataflows-create.md)
* [Configure and consume a dataflow](dataflows-configure-consume.md)
* [Configuring Dataflow storage to use Azure Data Lake Gen 2](dataflows-azure-data-lake-storage-integration.md)
* [Premium features of dataflows](dataflows-premium-features.md)
* [AI with dataflows](dataflows-machine-learning-integration.md)
* [Dataflows considerations and limitations](dataflows-features-limitations.md)
* [Dataflows best practices](dataflows-best-practices.md)
* [Power BI usage scenarios: Self-service data preparation](../../guidance/powerbi-implementation-planning-usage-scenario-self-service-data-preparation.md)

For more information about the Common Data Model, you can read its overview article:

* [Common Data Model - overview](/powerapps/common-data-model/overview)
