---
title: Datasets in the Power BI service
description: Understand Power BI service datasets.
author: peter-myers
manager: asaxton
ms.reviewer: asaxton

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/09/2019
ms.author: v-pemyer
---

# Datasets in the Power BI service

This article provides a technical explanation of Power BI datasets.

## Dataset types

Power BI datasets represent a source of data ready for reporting and visualization. There are in fact five different dataset types, created by:

- Connecting to an existing data model that isn't hosted in a Power BI capacity
- Uploading a Power BI Desktop file that contains a model
- Uploading an Excel workbook (containing one or more Excel tables and/or a workbook data model), or uploading a Comma-Separated Values (CSV) file
- Using the Power BI service to create a [push dataset](developer/walkthrough-push-data.md)
- Using the Power BI service to create a [streaming or hybrid streaming dataset](service-real-time-streaming.md)

Except for streaming datasets, the dataset represents a data model, which leverages the mature modeling technologies of [Analysis Services](/analysis-services/analysis-services-overview).

> [!NOTE]
> In our documentation, sometimes the terminologies _datasets_ and _models_ are interchangeable. Generally, from a Power BI service perspective it's referred to as a **dataset**, and from a development perspective it's referred to as a **model**. In the context of our documentation they mean much the same thing.

### External-hosted models

There are two types of external-hosted models: SQL Server Analysis Services and [Azure Analysis Services](/azure/analysis-services/analysis-services-overview).

Connecting to a SQL Server Analysis Services model involves installing the [On-Premises Data Gateway](service-gateway-onprem.md), whether it's on-premises or VM-hosted Infrastructure-as-a-Service (IaaS). Azure Analysis Services doesn't require a gateway.

Connecting to Analysis Services often makes sense when existing model investments exist, typically forming part of the Enterprise Data Warehouse (EDW). It allows Power BI to make a _Live Connection_ to Analysis Services, and does so by enforcing data permissions by using the identity of the Power BI report user. For SQL Server Analysis Services, both multidimensional models (cubes) and tabular models are supported. As shown in the following image, a Live Connection dataset passes queries to external-hosted models.

![A Live Connection dataset passes queries to an external-hosted model](media/service-datasets-understand/live-connection-dataset.png)

### Power BI Desktop-developed models

Power BI Desktop—a client application intended for Power BI development—can be used to develop a model. The model is effectively an Analysis Services tabular model. Models can be developed by importing data from dataflows, which can then be integrated with external data sources. While the specifics on how modeling can be achieved is outside the scope of this article, it's important to understand that there are three different types—or modes—of models that can be developed by using Power BI Desktop. These modes determine whether data is imported into the model, or whether it remains in the data source. The three modes are: Import, DirectQuery, and Composite. For more information about each mode, see the [Dataset modes in the Power BI service](service-dataset-modes-understand.md) article.

External-hosted models and Power BI desktop models can enforce Row-Level Security (RLS) to limit the data that is retrieved for a certain user. For example, users assigned to the **Salespeople** security group can only view report data for the sales region(s) to which they're assigned. RLS roles are dynamic or static. _Dynamic roles_ filter by the report user, while _static roles_ apply the same filters for all users assigned to the role. For more information about RLS, see the [Row-level security (RLS) with Power BI](service-admin-rls.md) article.

### Excel workbook models

Creating datasets based on [Excel workbooks](service-excel-workbook-files.md) or [CSV files](service-comma-separated-value-files.md) will result in the automatic creation of a model. Excel tables and CSV data will be imported to create model tables, while an Excel workbook data model will be transposed to create a Power BI model. In all cases, file data is imported into a model.

## Summary

Distinctions, then, can be made about Power BI datasets that represent models:

- They're either hosted in the Power BI service, or are externally hosted by Analysis Services
- They can store imported data, or they can issue passthrough query requests to underlying data sources, or a mix of both

Here is a summary of important facts about Power BI datasets that represent models:

- SQL Server Analysis Services hosted models require a gateway to perform Live Connection queries
- Power BI-hosted models that import data
  - Must be fully loaded into memory so that they can be queried
  - Require refresh to keep data current, and must involve gateways when source data isn't accessible directly over the Internet
- Power BI-hosted models that use [DirectQuery](desktop-directquery-about.md) storage mode require connectivity to the source data. When the model is queried, Power BI issues queries to the source data to retrieve current data. This mode must involve gateways when source data isn't accessible directly over the Internet.
- Models may enforce RLS rules, enforcing filters to limit data access to certain users

## Considerations

To successfully deploy and manage Power BI, it's important to understand where models are hosted, their storage mode, any dependencies on gateways, size of imported data, and refresh type and frequency. These configurations can all have a significant impact on Power BI capacity resources. In addition, the model design itself including its data preparation queries, relationships, and calculations all add to the mix of considerations.

It's also important to understand that Power BI-hosted Import models can refresh according to schedule, or be triggered on-demand by a user in the Power BI service.

## Next steps

- [Dataset modes in the Power BI service](service-dataset-modes-understand.md)
- More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
