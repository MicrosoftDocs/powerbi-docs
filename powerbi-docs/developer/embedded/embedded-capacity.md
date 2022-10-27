---
title: Capacity and SKUs in Power BI embedded analytics
description: Understand capacity and SKUs in Power BI embedded analytics.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.date: 10/24/2022
---

# Capacity and SKUs in Power BI embedded analytics

Power BI embedded analytics requires a capacity (*A*, *EM*, or *P* SKU) in order to publish embedded Power BI content.

[!INCLUDE [what is capacity](../../includes/what-is-capacity.md)]

>[!NOTE]
>You'll need a Power BI Pro or Premium Per User (PPU) account to publish content.

## What is embedded analytics?

Power BI embedded analytics offers two publishing solutions. Each solution requires different SKUs.

* [*Power BI Embedded*](#power-bi-embedded)  is an Azure offering aimed at ISVs and developers who want to embed visuals into their applications.

* Embedding Power BI is part of Microsoft Office's [*Power BI Premium*](#power-bi-premium). It's geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers.

### Power BI Embedded

Power BI Embedded is for ISVs and developers who want to embed visuals into their applications.

Applications using Power BI Embedded allow users to consume content stored on Power BI Embedded capacity.

>[!NOTE]
>Power BI Embedded recently released a new version, called **Embedded Gen2**. Embedded Gen2 simplifies the management of embedded capacities, and improves the Power BI Embedded experience. For more information, see [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md).

### Power BI Premium

[Power BI Premium](../../enterprise/service-premium-what-is.md) is geared toward enterprises who want a complete BI solution that provides a single view of its organization, partners, customers, and suppliers.

Power BI Premium is a SaaS product that allows users to consume content through mobile apps, internally developed apps, or at the Power BI portal (Power BI service). This enables Power BI Premium to provide a solution for both internal and external customer facing applications.

## Capacity and SKUs

[!INCLUDE [capacity and SKUs](../../includes/capacity-and-skus.md)]

To understand which workloads are supported for each tier, refer to the [Configure workloads in a Premium capacity](../../enterprise/service-admin-premium-workloads.md) article.

To plan and test your capacity, use these links:

* [Capacity planning](embedded-capacity-planning.md)
* [Testing approaches](../../enterprise/service-premium-capacity-optimize.md#testing-approaches)

### Power BI Embedded SKUs

Power BI Embedded is shipped with an [*A* SKU](../../enterprise/service-admin-premium-purchase.md#purchase-a-skus-for-testing-and-other-scenarios).

### Power BI Premium SKUs

Power BI premium offers two SKUs, *P* and *EM*.

* [Understand the differences between the *P* and *EM* SKUs](../../enterprise/service-premium-what-is.md#subscriptions-and-licensing)
* [Buy a Premium SKU](../../enterprise/service-admin-premium-purchase.md)

### Which SKU should I use?

The table below provides a summary of features, the capacity they require, and the specific SKU that is needed for each one.

In this table, a custom app refers to a web app created using embedded analytics. When you embed to a custom web app as a developer (using the JavaScript or .NET SDKs, or the REST APIs), you can control and customize the UX. This ability isn't available with other embedding options, such as Power BI service and Power BI Mobile.

| Scenario | Azure   | Office          |
|----------|---------|-----------------|
|          | (A SKU) | (P and EM SKUs) |
|[Embed for your customers](embed-sample-for-customers.md)</br>(app owns data)     |✔        |✔        |
|[Embed for your organization](embed-sample-for-your-organization.md)</br>(user owns data)     |✖        |✔         |
|Microsoft 365 apps</br>(formerly known as Office 365 apps)<ul><li>[Embed in Teams](../../collaborate-share/service-embed-report-microsoft-teams.md)</li><li>[Embed in SharePoint](../../collaborate-share/service-embed-report-spo.md)</li></ul>     |✖        |✔        |
|[Secure URL embedding](../../collaborate-share/service-embed-secure.md)</br>(embed from Power BI service)     |✖        |✔        |

>[!NOTE]
>
>* A [Power BI Pro](../../enterprise/service-admin-purchasing-power-bi-pro.md) or Premium Per User (PPU) license is needed for publishing content to a Power BI app workspace.
>* Only the **P SKU** allows free Power BI users to consume Power BI apps and shared content, in Power BI service.

### Capacity considerations

For development testing, you can use free embed trial tokens with a Pro license. To embed in a production environment, you must use a capacity.

> [!IMPORTANT]
> Free trial tokens are limited to development testing only. Once going to production, a capacity must be purchased. Until a capacity is purchased, the *Free trial version* banner will continue to appear at the top of the embedded report.

The table below lists payment and usage considerations per capacity.

| **Payment and usage** | **Power BI Embedded** | **Power BI Premium** | **Power BI Premium** |
|-----------------------|-----------------------|----------------------|----------------------|
| **Offer**             | Azure                 | Office               | Office               |
| **SKU**               | A                     | EM                   | P                    |
| **Billing**           | Hourly                | Monthly              | Monthly              |
| **Commitment**        | None                  | Yearly               | Monthly or yearly    |
| **Usage**             | Azure resources can be: <li>[Scaled up or down](azure-pbie-scale-capacity.md)</li><li>[Paused and resumed](azure-pbie-pause-start.md)  | Embed in apps, and in Microsoft applications    | Embed in apps, and in Power BI service |

### SKU memory and computing power

The table below describes the resources and limits of each SKU.

#### [Premium Gen2](#tab/gen2)

| Capacity SKUs | Total v-cores |Backend v-cores | Frontend v-cores | Max memory per dataset (GB)<sup>1, 2, 3</sup> | DirectQuery/Live connection (per second)<sup>1, 2</sup> | Max memory per query (GB)<sup>1, 2</sup> | Model refresh parallelism<sup>2</sup> |
| ----------------- | --- | ---- | ---- | --- | ------ | --- | ---- |
| EM1/A1            |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |   5  |
| EM2/A2            |   2 |  1   |  1   |   5 |   7.5  |  2  |  10  |
| EM3/A3            |   4 |  2   |  2   |  10 |  15    |  2  |  20  |
| P1/A4             |   8 |  4   |  4   |  25 |  30    |  6  |  40  |
| P2/A5             |  16 |  8   |  8   |  50 |  60    |  6  |  80  |
| P3/A6             |  32 | 16   | 16   | 100 | 120    | 10  | 160  |
| P4/A7<sup>4</sup> |  64 | 32   | 32   | 200 | 240    | 10  | 320  |
| P5/A8<sup>4</sup> | 128 | 64   | 64   | 400 | 480    | 10  | 640  |

<sup>1</sup> The [Power BI Premium Utilization and Metrics app](../../enterprise/service-premium-install-gen2-app.md) doesn't currently expose these metrics.

<sup>2</sup> These limits only apply to the datasets workload per capacity.

<sup>3</sup> The *Max memory per dataset (GB)* column (also called the *model size limit*) represents an upper bound for the dataset size. However, some memory must be reserved for operations such as dataset refreshes and queries. The maximum dataset size permitted on a capacity may be smaller than the numbers in this column.

<sup>4</sup> SKUs greater than 100 GB aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

#### [Premium Gen1](#tab/gen1)

| Capacity SKUs | Total v-cores | Backend v-cores | Frontend v-cores | Memory (GB) | DirectQuery/Live connection (per second) | Max memory per query (GB) | Model refresh parallelism<sup>1</sup> |
| ------ | --- | ---- | ---- | --- | ------ | --- | --- |
| EM1/A1 |   1 |  0.5 |  0.5 |   3 |   3.75 |  1  |  1  |
| EM2/A2 |   2 |  1   |  1   |   5 |   7.5  |  2  |  2  |
| EM3/A3 |   4 |  2   |  2   |  10 |  15    |  2  |  3  |
| P1/A4  |   8 |  4   |  4   |  25 |  30    |  6  |  6  |
| P2/A5  |  16 |  8   |  8   |  50 |  60    |  6  | 12  |
| P3/A6  |  32 | 16   | 16   | 100 | 120    | 10  | 24  |
| P4/A7<sup>2</sup> |  64 | 32   | 32   | 200 | 240    | 10  | 48  |
| P5/A8<sup>2</sup> | 128 | 64   | 64   | 400 | 480    | 10  | 96  |

<sup>1</sup> The model refresh parallelism limits only apply to dataset workloads per capacity.

<sup>2</sup> SKUs greater than 100 GB aren't available in all regions. To request using these SKUs in regions where they're not available, contact your Microsoft account manager.

---

#### Embedded Gen 2 memory enhancements

The amount of memory available on each node size is described in the *RAM (GB)* column in the [SKU memory and computing power](#sku-memory-and-computing-power) table. With [Power BI Embedded Generation 2](power-bi-embedded-generation-2.md) (also known as Embedded Gen 2), it's set to the memory footprint limit of a single Power BI item (such as a dataset, report or dashboard), and not to the cumulative consumption of memory. For example, in an Embedded Gen2 A4 capacity, a single dataset size is limited to 25 GB, compared to the original Power BI Embedded capacity, where the total memory footprint of *all* datasets handled at the same time was limited to 25 GB.

## Next steps

> [!div class="nextstepaction"]
>[Embed for your customers](embed-sample-for-customers.md)

> [!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

> [!div class="nextstepaction"]
> [Embed from apps](./index.yml)
